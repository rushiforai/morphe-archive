#!/usr/bin/env python3
"""Reproduce patch payloads from the exact user-supplied APK (no APK/key upload)."""
import argparse
import hashlib
import os
import pathlib
import shutil
import subprocess

ROOT = pathlib.Path(__file__).resolve().parent
EXPECTED = '17fc6b46228af184437ade7e6f5573915bc655b86996307ff3270fdf35279cce'

def run(*args, **kwargs):
    subprocess.run([str(x) for x in args], check=True, **kwargs)

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('apk', type=pathlib.Path)
    p.add_argument('--apktool', type=pathlib.Path, required=True)
    p.add_argument('--work-dir', type=pathlib.Path, required=True)
    p.add_argument('--java-home', type=pathlib.Path, required=True)
    p.add_argument('--android-sdk', type=pathlib.Path, required=True)
    p.add_argument('--android-jar', type=pathlib.Path, required=True)
    p.add_argument('--dexlib', type=pathlib.Path, required=True)
    p.add_argument('--guava', type=pathlib.Path, required=True)
    args = p.parse_args()
    apk = args.apk.resolve()
    assert hashlib.sha256(apk.read_bytes()).hexdigest() == EXPECTED, 'Wrong original APK'
    work = args.work_dir.absolute()
    work.mkdir(parents=True, exist_ok=True)
    decoded = work / 'decoded'
    assert not decoded.exists(), 'Use a fresh working directory; existing work is preserved'
    java = args.java_home / 'bin' / ('java.exe' if os.name == 'nt' else 'java')
    javac = args.java_home / 'bin' / ('javac.exe' if os.name == 'nt' else 'javac')
    jar = args.java_home / 'bin' / ('jar.exe' if os.name == 'nt' else 'jar')
    run(java, '-jar', args.apktool.absolute(), 'd', apk, '-o', decoded)
    shutil.copytree(decoded / 'smali', work / 'original-smali')
    for patch in ['original-to-mod.patch', 'fixes.patch', 'pull-refresh.patch', 'shorts.patch']:
        run('git', '-C', decoded, 'apply', '--check', ROOT / patch)
        run('git', '-C', decoded, 'apply', ROOT / patch)
    helper_classes, helper_dex = work / 'helper-classes', work / 'helper-dex'
    helper_classes.mkdir(); helper_dex.mkdir()
    sources = sorted((ROOT.parent / 'extensions/extension/src/main/java/e/e/a').glob('*.java'))
    run(javac, '-encoding', 'UTF-8', '-source', '8', '-target', '8',
        '-classpath', args.android_jar, '-d', helper_classes, *sources)
    run(jar, 'cf', work / 'helper.jar', '-C', helper_classes, '.')
    # Calling D8's main class avoids platform-specific launcher scripts.
    d8 = args.android_sdk / 'build-tools/36.0.0/lib/d8.jar'
    run(java, '-cp', d8, 'com.android.tools.r8.D8', '--lib', args.android_jar,
        '--min-api', '21', '--output', helper_dex, work / 'helper.jar')
    patched = work / 'patched-base.apk'
    run(java, '-jar', args.apktool.absolute(), 'b', decoded, '-o', patched)
    classpath = os.pathsep.join([str(args.dexlib), str(args.guava)])
    run(javac, '-encoding', 'UTF-8', '-cp', classpath, '-d', work, ROOT / 'MakePayload.java')
    payload = ROOT.parent / 'patches/src/main/resources/nicoid'
    run(java, '-cp', str(work) + os.pathsep + classpath, 'MakePayload', apk, patched,
        decoded / 'smali', work / 'original-smali', payload,
        ROOT / 'upstream-helper.dex', helper_dex / 'classes.dex')

if __name__ == '__main__':
    main()
