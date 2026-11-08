"""Simulates the two resource patches against the real APK contents to verify
their detection rules behave exactly as intended."""
import gzip, json, re, zipfile, io, os

STABLE = '/tmp/opera_stable.apk'
BETA = '/home/z/my-project/upload/beta_extract/apkm/base.apk'
GX_DIR = '/tmp/gx_x/assets/preloadedTopSites'

# ── Patch 1: DisableAcceptableAdsPatch (stable & beta) ────────────────────────
EMPTY = ('[default]\nBLACK = ([])\nDOMAINLESS = (["NO_ELEMENT":([]),])\n'
         'EXTENDED_BLACK = ([])\nEXTENDED_WHITE = ([])\nOFA.VERSION = 2\nWHITE = ([])\n')

z = zipfile.ZipFile(STABLE)
abp_files = [n for n in z.namelist() if n.startswith('assets/abp_files/op/')]

selected, kept = [], []
for name in sorted(abp_files):
    raw = z.read(name)
    try:
        text = gzip.decompress(raw).decode('utf-8')
    except Exception:
        continue
    has_allow = ('DOCUMENT =' in text or 'WHITE.PLAIN' in text or 'WHITE.GLOB' in text)
    no_black = 'BLACK' not in text
    (selected if (has_allow and no_black) else kept).append((name.split('/')[-1][:12], len(text)))

print('=== AcceptableAds patch simulation (stable 103) ===')
print('neutralized (pure whitelists):', selected)
print('kept:', kept)
assert len(selected) == 2, f'expected 2 whitelists, got {len(selected)}'
assert all(n in ('97bda3c5f03d', 'f66a1f2c11bd') for n, _ in selected), selected
assert all(n not in ('e87a67d8', '426183de', '0a9d4f8a') for n, _ in selected)
# empty-list replacement must be valid: same length as Opera's own empty list
assert len(EMPTY.encode()) == 132
print('OK: exactly the two partner whitelists are selected.\n')

# same check on beta
zb = zipfile.ZipFile('/home/z/my-project/upload/beta_extract/apkm/base.apk')
sel_b = []
for name in sorted(n for n in zb.namelist() if n.startswith('assets/abp_files/op/')):
    try:
        text = gzip.decompress(zb.read(name)).decode('utf-8')
    except Exception:
        continue
    if ('DOCUMENT =' in text or 'WHITE.PLAIN' in text or 'WHITE.GLOB' in text) and 'BLACK' not in text:
        sel_b.append(name.split('/')[-1][:12])
print('=== AcceptableAds patch simulation (beta 104) ===')
print('neutralized:', sel_b)
assert len(sel_b) == 2
print('OK\n')

# ── Patch 2: GxRemoveSponsoredTilesPatch ──────────────────────────────────────
SPONSORED_URL = re.compile(r'"url"\s*:\s*"https://operagx\.gg/')
AFFILIATE_TAG = re.compile(r'[?&]tag=operagx')

def strip_sponsored(content: str):
    s, e = content.find('['), content.rfind(']')
    if s < 0 or e <= s:
        return None
    body = content[s+1:e]
    entries, depth, in_str, esc, start = [], 0, False, False, -1
    for i, ch in enumerate(body):
        if esc:
            esc = False
        elif in_str and ch == '\\':
            esc = True
        elif ch == '"':
            in_str = not in_str
        elif not in_str and ch == '{':
            if depth == 0:
                start = i
            depth += 1
        elif not in_str and ch == '}':
            depth -= 1
            if depth == 0 and start >= 0:
                entries.append(body[start:i+1]); start = -1
    kept = [en for en in entries if not (
        '"realUrl"' in en or SPONSORED_URL.search(en) or AFFILIATE_TAG.search(en))]
    if len(kept) == len(entries):
        return None
    rebuilt = '[' + ','.join(kept) + ']' if kept else '[]'
    return rebuilt, entries, kept

print('=== GX sponsored-tiles patch simulation ===')
total_removed = 0
for fn in sorted(os.listdir(GX_DIR)):
    if not fn.endswith('.json'):
        continue
    content = open(os.path.join(GX_DIR, fn), encoding='utf-8').read()
    res = strip_sponsored(content)
    if res is None:
        print(f'{fn:28s} unchanged (0 sponsored)')
        continue
    rebuilt, entries, kept = res
    json.loads(rebuilt)  # must be valid JSON
    total_removed += len(entries) - len(kept)
    kept_titles = [json.loads(e).get('title') for e in kept]
    print(f'{fn:28s} removed {len(entries)-len(kept)}/{len(entries)}, kept: {kept_titles}')
print(f'total removed: {total_removed}')
assert total_removed > 0
print('OK: all outputs valid JSON, organic tiles kept.\n')

# ── Bytecode patch target strings present in BOTH stable & beta ──────────────
print('=== Bytecode patch string presence ===')
import subprocess
# Scan the dex files of both APKs directly (no smali tree needed).
import zipfile
DEX_NEEDLES = (
    b'SELECT * FROM partner_data',
    b'com.opera.android.ads.pangle.PangleAdsModuleImpl',
    b'com.opera.android.ads.mintegral.MintegralAdsModuleImpl',
    b'com.opera.android.ads.liftoff.LiftoffAdsModuleImpl',
)
for label, apk_path in (('stable', STABLE), ('beta', BETA)):
    z = zipfile.ZipFile(apk_path)
    dexes = [n for n in z.namelist() if n.startswith('classes') and n.endswith('.dex')]
    for s in DEX_NEEDLES:
        n = sum(1 for dn in dexes if s in z.read(dn))
        print(f'{label:7s} {s.decode():55s} found in {n} dex file(s)')
        assert n >= 1, f'MISSING: {s!r} in {label}'
    # HideBrokenInstallationDialogPatch fingerprint: resource name resolved via
    # resourceLiteral from resources.arsc; check the dialog text is present there.
    arsc = z.read('resources.arsc')
    assert 'installation appears to be broken'.encode() in arsc, f'{label}: dialog text missing'
    assert 'supporting ARM but detected hardware is x86'.encode() in arsc, f'{label}: ARM text missing'
    print(f'{label:7s} welcome_init_failure / welcome_init_emulated_arm    present in resources.arsc')
print('OK: all bytecode fingerprints present in stable and beta.')
