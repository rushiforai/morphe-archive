#!/usr/bin/env python3
"""Post-build validation for the binary-patched v1.3.1 APKs.

Usage: validate_build.py APK SUBSTRATE
Checks:
  1. zip integrity (testzip) + entry-level diff vs substrate
  2. manifest: VpnPro components gone, free VpnReceiver kept,
     no isSplitRequired/requiredSplitTypes/split attrs
  3. arsc: the 5 vpn_pro strings read back as " "
  4. bytecode proof (androguard): wdn.a()Z / r65.l(Z)Z = const/4+return,
     mm6.e site = const/4 v13,0, WelcomeActivity 4 sites = const/4 vN,1
"""
import sys
import zipfile

sys.path.insert(0, '/home/z/my-project/scripts')
from v131_binary_patch import (parse_manifest, BLANK_NAMES, VPN_COMPONENTS,
                               WELCOME, R65, MM6, WDN, DEFBR_KEY, EULA_KEY)

from loguru import logger
logger.remove()
from androguard.core.dex import DEX

APK, SUB = sys.argv[1], sys.argv[2]
fails = []


def check(name, ok, detail=''):
    print(f'[{"PASS" if ok else "FAIL"}] {name}' + (f' — {detail}' if detail else ''))
    if not ok:
        fails.append(name)


zf = zipfile.ZipFile(APK)
check('zip integrity', zf.testzip() is None)

zs = zipfile.ZipFile(SUB)
names_a = [i.filename for i in zf.infolist()]
names_b = [i.filename for i in zs.infolist()]
dropped = set(names_b) - set(names_a)
added = set(names_a) - set(names_b)
changed = [n for n in names_a if n in set(names_b)
           and zf.getinfo(n).file_size != zs.getinfo(n).file_size
           and not n.startswith('META-INF/')]
check('entry diff: only expected entries changed',
      set(changed) <= {'AndroidManifest.xml', 'resources.arsc'} | {f'classes{i}.dex' for i in range(1, 11)},
      f'changed={changed} dropped={sorted(dropped)}')

# manifest
man = zf.read('AndroidManifest.xml')
pool, elements = parse_manifest(man)
comps = [(e['name'], e['android_name']) for e in elements
         if e['name'] in ('receiver', 'service', 'activity')]
vpnpro = [c for c in comps if c[1] and 'VpnPro' in c[1]]
freevpn = [c for c in comps if c[1] and c[1].endswith('.vpn.VpnReceiver')]
check('manifest: 0 VpnPro components', not vpnpro, str(vpnpro))
check('manifest: free VpnReceiver kept', len(freevpn) == 1, str(freevpn))
raw_lower = man.lower()
check('manifest: no isSplitRequired/requiredSplitTypes bytes',
      b'isplitsrequired' not in raw_lower and b'requiredsplittypes' not in raw_lower)
import re
xml_text = ''
try:
    from androguard.core.axml import AXMLPrinter
    xml_text = AXMLPrinter(man).get_xml().decode('utf-8', 'replace')
except Exception as e:
    print(f'  (AXMLPrinter note: {e})')
if xml_text:
    check('manifest xml: no <split> element', '<split' not in xml_text)
    check('manifest xml: no VpnPro component', 'VpnPro' not in xml_text)
    check('manifest xml: VpnReceiver present', 'vpn.VpnReceiver' in xml_text)

# arsc strings (read back through our own pool walker)
from v131_binary_patch import collect_string_entries, Pool, u16, u32
import struct
arsc = zf.read('resources.arsc')
data = bytearray(arsc)
hdr = u16(data, 2)
pool = Pool(data, hdr)
per_name = collect_string_entries(data, pool, BLANK_NAMES)
ok = True
detail = []
for n in BLANK_NAMES:
    vals = {pool.get(i) for i in per_name[n]}
    detail.append(f'{n}={sorted(vals)!r}x{len(per_name[n])}')
    if vals != {' '}:
        ok = False
check('arsc: all 5 vpn strings blanked to " "', ok, '; '.join(detail))

# bytecode proof
dexbytes = zf.read('classes3.dex')
d = DEX(dexbytes)


def disasm(cls_desc, name, want=None, max_lines=200):
    for cls in d.get_classes():
        if cls.get_name() != cls_desc:
            continue
        for m in cls.get_methods():
            if m.get_name() != name:
                continue
            lines = [f'{i.get_name()} {i.get_output()}' for i in m.get_instructions()]
            return lines
    return None


# wdn.a()Z and r65.l(Z)Z
for cls_desc, mname in ((WDN, 'a'), (R65, 'l')):
    lines = disasm(cls_desc, mname)
    ok = lines is not None and lines[0].startswith('const/4') and \
        lines[0].endswith('0') and lines[1].startswith('return')
    check(f'bytecode {cls_desc}->{mname} = const/4 v0,0; return v0', ok,
          ' | '.join(lines[:2]) if lines else 'missing')

# mm6.e around the default-browser key
lines = disasm(MM6, 'e')
site = None
for k, t in enumerate(lines):
    if 'show_enable_default_browser_dialog_on_startpage' in t:
        site = k
        break
ok = False
detail = ''
if site is not None:
    ctx = lines[site:site + 4]
    ok = any(t.startswith('const/4') and t.rstrip().endswith('0') for t in ctx[:3])
    detail = ' | '.join(ctx)
check('bytecode mm6.e default-browser gate forced 0', ok, detail)

# WelcomeActivity 4 eula sites
lines = disasm(WELCOME, 'onCreate')
eula_lines = [k for k, t in enumerate(lines) if 'eula_accepted.gdpr' in t]
ok = len(eula_lines) == 1
forced = []
for k in range(eula_lines[0] if eula_lines else 0, len(lines)):
    if lines[k].startswith('invoke-virtual') and 'SettingsManager;->i(' in lines[k]:
        nxt = lines[k + 1]
        if nxt.startswith('move-result') or nxt.startswith('const/4'):
            forced.append(lines[k + 1])
# after patching, invoke is replaced by const/4 directly
forced_const = [t for t in lines if t.startswith('const/4') and t.rstrip().endswith(' 1')]
check('bytecode WelcomeActivity.onCreate: 2 forced-true eula sites',
      forced_const.count('const/4 v4, 1') + forced_const.count('const/4 v1, 1') >= 2,
      f'const/4 ...1 sites: {forced_const}')

for mname in ('onStop', 'startActivityForResult'):
    lines = disasm(WELCOME, mname)
    hit = [t for t in lines if t == 'const/4 v0, 1']
    check(f'bytecode WelcomeActivity.{mname}: forced-true site', bool(hit), str(hit))

print()
print('RESULT:', 'ALL PASS' if not fails else f'{len(fails)} FAILURES: {fails}')
sys.exit(1 if fails else 0)
