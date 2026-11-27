#!/usr/bin/env python3
"""Build the V29.5 overlay only on the exact rc4 APK. Never sign or relink resources."""
import argparse
import copy
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import time
import zipfile

ROOT = Path(__file__).resolve().parents[1]
PROFILE = ROOT / 'fingerprints/clipboard-history-rc4.json'
RUNTIME = 'com/akshaykadam/pixelboard/extension/rambler'


def sha(data):
    return hashlib.sha256(data).hexdigest()


def validate_base(path):
    profile = json.loads(PROFILE.read_text())
    if sha(Path(path).read_bytes()) != profile['base_sha256']:
        raise ValueError('Unrecognized base APK: rc4 SHA-256 mismatch')
    return profile


def methods(source):
    return re.findall(r'^\.method[^\n]*\n.*?^\.end method\n', source, re.M | re.S)


def patch_method(source, rule):
    matches = [m for m in methods(source) if m.splitlines()[0].endswith(' ' + rule['method'])]
    if len(matches) != 1 or sha(matches[0].encode()) != rule['sha256']:
        raise ValueError('Method fingerprint mismatch: ' + rule['method'])
    original = changed = matches[0]
    for edit in rule['edits']:
        anchor = edit['anchor']
        if changed.splitlines().count(anchor) != 1:
            raise ValueError('Missing or ambiguous anchor: ' + rule['method'])
        if edit['position'] == 'before':
            replacement = edit['code'] + '\n' + anchor
        elif edit['position'] == 'after':
            replacement = anchor + '\n' + edit['code']
        else:
            raise ValueError('Unknown insertion position')
        changed = changed.replace(anchor + '\n', replacement + '\n', 1)
    return source.replace(original, changed, 1)


INVOKE = re.compile(r'^\s*invoke-static(/range)? \{([^}]*)\}, (L[^;]+;)->([^(]+)\(([^)]*)\)(\S+)$')
TYPE = re.compile(r'\[*(?:L[^;]+;|[ZBSCIJFD])')


def register_count(registers, ranged):
    """Registers passed by an invoke: a list (v0, p1) or a same-prefix range (p0 .. p1)."""
    registers = registers.strip()
    if not registers:
        return 0
    if not ranged:
        return len(registers.split(','))
    first, last = [r.strip() for r in registers.split('..')]
    if first[0] != last[0]:
        raise ValueError('Mixed register range in hook: ' + registers)
    return int(last[1:]) - int(first[1:]) + 1


def verify_hook_targets(rules, runtime_smali):
    """Every hook must call a public static runtime method that exists, with the arity the call site passes.
    smali assembles unresolved or mis-sized calls; on a device they crash or fail verification inside Gboard."""
    for rule in rules:
        for edit in rule['edits']:
            for line in edit['code'].splitlines():
                if 'invoke-' not in line:
                    continue
                call = INVOKE.match(line)
                if not call:
                    raise ValueError('Unsupported hook instruction: ' + line.strip())
                ranged, registers, owner, name, params, ret = call.groups()
                width = sum(2 if t in ('J', 'D') else 1 for t in TYPE.findall(params))
                if register_count(registers, bool(ranged)) != width:
                    raise ValueError('Hook argument count mismatch: ' + line.strip())
                target = Path(runtime_smali) / (owner[1:-1] + '.smali')
                header = re.compile(r'^\.method public static (?:\w+ )*' + re.escape(f'{name}({params}){ret}') + '$', re.M)
                if not target.is_file() or not header.search(target.read_text()):
                    raise ValueError('Hook target missing from runtime DEX: ' + owner + '->' + name)


def verify_contract(contract, dex, smali):
    """Names the runtime reaches by reflection (kvw.v, ksw.m, aelb.f, ahbz.I, field i, the opt-in resource id...).
    A miss would ship an APK whose History silently does nothing, so refuse the build instead."""
    for item in contract:
        if item['dex'] != dex:
            continue
        source = Path(smali) / item['path']
        if not source.is_file() or item['line'] not in source.read_text().splitlines():
            raise ValueError('Runtime contract missing from base: ' + item['path'] + ' ' + item['line'].strip())


def signature(name):
    upper = name.upper()
    return upper.startswith('META-INF/') and (upper == 'META-INF/MANIFEST.MF'
            or upper.endswith(('.SF', '.RSA', '.DSA', '.EC')))


def repack(base, output, replacements):
    with zipfile.ZipFile(base) as source, zipfile.ZipFile(output, 'w') as dest:
        if len(source.namelist()) != len(set(source.namelist())):
            raise ValueError('Duplicate APK entries')
        for info in source.infolist():
            if signature(info.filename):
                continue
            entry = copy.copy(info)
            if entry.filename in replacements:
                entry.compress_type = zipfile.ZIP_DEFLATED
                dest.writestr(entry, replacements[entry.filename])
            else:
                with source.open(info) as src, dest.open(entry, 'w') as dst:
                    shutil.copyfileobj(src, dst)
        for name in sorted(replacements.keys() - set(source.namelist())):
            entry = zipfile.ZipInfo(name, (2009, 1, 1, 0, 0, 0))
            entry.compress_type = zipfile.ZIP_DEFLATED
            dest.writestr(entry, replacements[name])


def wait_for_memory():
    while Path('/proc/meminfo').exists():
        available = int(re.search(r'MemAvailable:\s+(\d+)', Path('/proc/meminfo').read_text())[1])
        if available >= 3 * 1024 * 1024:
            return
        print('Waiting for 3 GiB available memory before Java step', flush=True)
        time.sleep(5)


def run(args, java=False):
    if java:
        wait_for_memory()
    print('Running ' + Path(str(args[0])).name + ' ' + ' '.join(map(str, args[1:3])), flush=True)
    subprocess.run(list(map(str, args)), check=True)


def sdk_tools():
    sdk = Path(os.environ.get('ANDROID_HOME') or os.environ.get('ANDROID_SDK_ROOT') or '')
    android = os.environ.get('ANDROID_JAR')
    if not android:
        jars = [p for p in sdk.glob('platforms/android-*/android.jar')
                if p.parent.name.removeprefix('android-').isdigit()
                and int(p.parent.name.removeprefix('android-')) >= 32]
        if not jars:
            raise ValueError('Set ANDROID_JAR to an API 32+ SDK android.jar')
        android = str(max(jars, key=lambda p: int(p.parent.name.split('-')[1])))
    align = os.environ.get('ZIPALIGN') or shutil.which('zipalign')
    if not align:
        candidates = sorted(sdk.glob('build-tools/*/zipalign'))
        if not candidates:
            raise ValueError('Set ZIPALIGN or install Android SDK build-tools')
        align = str(candidates[-1])
    cp = os.environ.get('SMALI_CP')
    tools = Path(os.environ.get('TOOLS_DIR', ROOT / 'tools'))
    r8 = Path(os.environ.get('R8_JAR', tools / 'r8-8.3.37.jar'))
    if not cp or not r8.is_file() or not Path(android).is_file():
        raise ValueError('Source the pinned tools/tool-env.sh; provide r8 and Android SDK')
    return android, align, cp, r8


def disassemble(cp, dex, output):
    run(['java', '-Xmx2g', '-cp', cp, 'org.jf.baksmali.Main', 'disassemble',
         dex, '-j', '1', '-o', output], java=True)


def verify_roundtrip(before, after, rules):
    old = {str(p.relative_to(before)): p for p in before.rglob('*.smali')}
    new = {str(p.relative_to(after)): p for p in after.rglob('*.smali')}
    if old.keys() != new.keys():
        raise ValueError('DEX class set changed')
    changed = {r['path'] for r in rules}
    for name in old:
        if name not in changed and old[name].read_bytes() != new[name].read_bytes():
            raise ValueError('Unmodified class failed roundtrip: ' + name)
        if name in changed:
            expected = {r['method']: r for r in rules if r['path'] == name}
            old_methods = {m.splitlines()[0]: m for m in methods(old[name].read_text())}
            new_methods = {m.splitlines()[0]: m for m in methods(new[name].read_text())}
            if old_methods.keys() != new_methods.keys():
                raise ValueError('Method set changed: ' + name)
            for header, body in old_methods.items():
                method_name = header.split()[-1]
                if method_name not in expected and body != new_methods[header]:
                    raise ValueError('Untouched method changed: ' + name + ' ' + method_name)
                if method_name in expected:
                    for edit in expected[method_name]['edits']:
                        for line in edit['code'].splitlines():
                            if line.strip().startswith('invoke-static') and line not in new_methods[header]:
                                raise ValueError('Hook lost on assembly: ' + method_name)


def build(base, output):
    base, output = Path(base).resolve(), Path(output).resolve()
    if base == output:
        raise ValueError('Output must differ from base')
    profile = validate_base(base)  # Must precede all tools and output writes.
    android, align, cp, r8 = sdk_tools()
    scratch_parent = os.environ.get('CLIP_HISTORY_WORK_DIR')
    if scratch_parent:
        Path(scratch_parent).mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='clip-history-', dir=scratch_parent) as temp:
        work = Path(temp)
        replacements = {}
        with zipfile.ZipFile(base) as z:
            if 'classes6.dex' in z.namelist():
                raise ValueError('Extra DEX slot already occupied')
            for name in sorted({r['dex'] for r in profile['hooks']}):
                dex = work / name
                dex.write_bytes(z.read(name))
                if dex.read_bytes()[:8] != b'dex\n039\0':
                    raise ValueError('Unsupported touched DEX version')
                before = work / (name + '.smali')
                disassemble(cp, dex, before)
                verify_contract(profile['contract'], name, before)
                rules = [r for r in profile['hooks'] if r['dex'] == name]
                for rule in rules:
                    file = before / rule['path']
                    file.write_text(patch_method(file.read_text(), rule))
                rebuilt = work / ('new-' + name)
                run(['java', '-Xmx2g', '-cp', cp, 'org.jf.smali.Main', 'assemble',
                     before, '-j', '1', '--api', '32', '-o', rebuilt], java=True)
                after = work / (name + '.verified')
                disassemble(cp, rebuilt, after)
                verify_roundtrip(before, after, rules)
                replacements[name] = rebuilt.read_bytes()
                print(f'{name}: {len(list(after.rglob("*.smali")))} classes verified', flush=True)
                shutil.rmtree(before)
                shutil.rmtree(after)
        classes = work / 'classes'
        classes.mkdir()
        package = ROOT / 'extension-src' / RUNTIME
        sources = [package / name for name in ('ClipHistoryStore.java', 'ClipHistoryPolicy.java',
                   'GboardRamblerClipHistory.java', 'ClipHistoryPanel.java', 'ClipHistoryGboardPrivacy.java')]
        run(['javac', '-J-Xmx512m', '--release', '8', '-cp', android, '-d', classes, *sources], java=True)
        dexout = work / 'runtime'
        dexout.mkdir()
        run(['java', '-Xmx2g', '-cp', r8, 'com.android.tools.r8.D8', '--min-api', '32',
             '--lib', android, '--output', dexout, *sorted(classes.rglob('*.class'))], java=True)
        replacements['classes6.dex'] = (dexout / 'classes.dex').read_bytes()
        runtime_check = work / 'runtime-check'
        disassemble(cp, dexout / 'classes.dex', runtime_check)
        runtime_classes = list(runtime_check.rglob('*.smali'))
        if not runtime_classes or any(not str(p.relative_to(runtime_check)).startswith(RUNTIME + '/')
                                      for p in runtime_classes):
            raise ValueError('Unexpected classes in runtime DEX')
        verify_hook_targets(profile['hooks'], runtime_check)
        raw, aligned = work / 'raw.apk', work / 'aligned.apk'
        repack(base, raw, replacements)
        run([align, '-P', '16', '-f', '4', raw, aligned])
        run([align, '-c', '-P', '16', '4', aligned])
        with zipfile.ZipFile(base) as old, zipfile.ZipFile(aligned) as new:
            expected = {n for n in old.namelist() if not signature(n)} | set(replacements)
            if set(new.namelist()) != expected:
                raise ValueError('Unexpected APK entries')
            for name in expected:
                if name in replacements:
                    if new.read(name) != replacements[name]:
                        raise ValueError('Replacement mismatch: ' + name)
                elif old.read(name) != new.read(name) or old.getinfo(name).compress_type != new.getinfo(name).compress_type:
                    raise ValueError('Unchanged payload/compression differs: ' + name)
        output.parent.mkdir(parents=True, exist_ok=True)
        with tempfile.NamedTemporaryFile(prefix=output.name + '.', suffix='.tmp', dir=output.parent, delete=False) as f:
            pending = Path(f.name)
        try:
            shutil.copyfile(aligned, pending)
            os.replace(pending, output)
        finally:
            pending.unlink(missing_ok=True)
        print('Unsigned aligned APK SHA-256: ' + sha(output.read_bytes()), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('base')
    parser.add_argument('output')
    args = parser.parse_args()
    try:
        build(args.base, args.output)
    except (ValueError, OSError, subprocess.CalledProcessError, zipfile.BadZipFile) as error:
        parser.exit(2, 'Build refused: ' + str(error) + '\n')


if __name__ == '__main__':
    main()
