#!/usr/bin/env python3
"""Build libGDX 1.1.0 ARM64 libraries with NDK r27c into a generated directory."""
import argparse
import concurrent.futures
import hashlib
import json
import os
import platform
import shutil
from pathlib import Path
import subprocess
import sys

TOOLS = Path(__file__).resolve().parent
ROOT = TOOLS / 'native/libgdx'
SOURCE_DIRS = {'gdx': ROOT / 'gdx/jni', 'box2d': ROOT / 'extensions/gdx-box2d/gdx-box2d/jni'}
NDK_REVISION = '27.2.12479018'

def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--ndk', default=os.environ.get('ANDROID_NDK_HOME'))
    ap.add_argument('--jobs', type=int, default=min(os.cpu_count() or 2, 8))
    ap.add_argument('--output', type=Path, required=True, help='Generated resource directory')
    ap.add_argument('--verify', type=Path, help='Compare with a previous output directory')
    args = ap.parse_args()
    if not args.ndk:
        ap.error('Pass --ndk /path/to/android-ndk-r27c or set ANDROID_NDK_HOME')
    if platform.system() != 'Linux' or platform.machine() != 'x86_64':
        ap.error('This recipe requires Linux x86_64')
    ndk = Path(args.ndk).resolve()
    properties = dict(line.split('=', 1) for line in (ndk/'source.properties').read_text().splitlines() if '=' in line)
    revision = properties.get('Pkg.Revision ', properties.get('Pkg.Revision', '')).strip()
    if revision != NDK_REVISION:
        ap.error('Expected Android NDK r27c (' + NDK_REVISION + '), got ' + revision)
    toolchain = ndk / 'toolchains/llvm/prebuilt/linux-x86_64'
    clang = toolchain / 'bin/clang'
    cxx = toolchain / 'bin/clang++'
    payload_root = args.output.resolve()
    if args.verify and args.verify.resolve() == payload_root:
        ap.error('--verify must reference a different output directory')
    out = payload_root / '.objects'
    if out.exists():
        shutil.rmtree(out)
    out.mkdir(parents=True, exist_ok=True)
    prebuilt = payload_root / 'arm64-v8a'
    prebuilt.mkdir(parents=True, exist_ok=True)
    common = ['--target=aarch64-linux-android21', '-O2', '-fPIC',
              '-ffile-prefix-map='+str(ROOT)+'=.',
              '-ffile-prefix-map='+str(ndk)+'=ndk',
              '-fno-strict-aliasing', '-fstack-protector-strong',
              '-ffunction-sections', '-fdata-sections', '-Werror=pointer-to-int-cast',
              '-Werror=return-type',
              '-Wno-deprecated-declarations', '-Wno-register']
    groups = {}
    build_options = {}
    for name in ('gdx', 'box2d'):
        src = SOURCE_DIRS[name]
        if name == 'gdx':
            sources = sorted(src.glob('*.cpp')) + [src/'android/AndroidGL20.cpp']
            sources += sorted((src/'gdx2d').glob('*.cpp'))
            sources += sorted((src/'gdx2d').glob('*.c'))
            sources += sorted((src/'etc1').glob('*.cpp'))
        else:
            sources = sorted(src.rglob('*.cpp'))
        groups[name] = []
        commands = []
        for source in sources:
            obj = out / name / source.relative_to(src).with_suffix('.o')
            obj.parent.mkdir(parents=True, exist_ok=True)
            groups[name].append(obj)
            compiler = clang if source.suffix == '.c' else cxx
            flags = [] if source.suffix == '.c' else ['-std=c++11', '-fno-exceptions', '-fno-rtti']
            commands.append([str(compiler), *common, *flags, '-I'+str(src),
                             '-c', str(source), '-o', str(obj)])
        def compile_one(cmd):
            p = subprocess.run(cmd, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            if p.returncode:
                print(p.stdout, file=sys.stderr)
                raise RuntimeError('Compilation failed: ' + ' '.join(cmd))
            if p.stdout: print(p.stdout, end='')
        with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
            list(pool.map(compile_one, commands))
        soname = 'libgdx.so' if name == 'gdx' else 'libgdx-box2d.so'
        libs = ['-lm', '-llog', '-lGLESv2'] if name == 'gdx' else ['-lm']
        command = [str(cxx), '--target=aarch64-linux-android21', '-shared',
                   '-static-libstdc++', '-fno-exceptions', '-fno-rtti',
                   '-Wl,--no-undefined,--gc-sections', '-Wl,-z,relro,-z,now',
                   '-Wl,-z,max-page-size=16384,-z,common-page-size=16384',
                   '-Wl,-soname,'+soname, *map(str, groups[name]), *libs,
                   '-o', str(prebuilt/soname)]
        subprocess.run(command, check=True)
        subprocess.run([str(toolchain/'bin/llvm-strip'), '--strip-unneeded', str(prebuilt/soname)], check=True)
        build_options[name] = {
            'compile': [[arg.replace(str(ndk), 'ndk').replace(str(payload_root), 'output')
                        .replace(str(ROOT), '.') for arg in cmd] for cmd in commands],
            'link': [arg.replace(str(ndk), 'ndk').replace(str(payload_root), 'output') for arg in command],
            'strip': ['llvm-strip', '--strip-unneeded'],
        }
        print('Built', prebuilt/soname, flush=True)

    sources = sorted(p for src in SOURCE_DIRS.values() for p in src.rglob('*')
                     if p.suffix in ('.c', '.cpp', '.h'))
    sources += [TOOLS/'build.py', TOOLS/'LICENSE-libgdx.txt', ROOT/'LICENSE']
    provenance = {
        'engine': 'libGDX 1.1.0',
        'upstream': 'https://github.com/libgdx/libgdx/tree/1.1.0',
        'source_commit': subprocess.check_output(['git', '-C', str(ROOT), 'rev-parse', 'HEAD'], text=True).strip(),
        'options': build_options,
        'ndk': NDK_REVISION,
        'compiler': subprocess.check_output([str(clang), '--version'], text=True).splitlines()[0],
        'target': 'aarch64-linux-android21',
        'elf_page_alignment': 16384,
        'inputs': {p.relative_to(TOOLS).as_posix(): sha256(p) for p in sources if p.is_file()},
        'outputs': {p.name: sha256(p) for p in sorted(prebuilt.glob('*.so'))},
    }
    (payload_root/'provenance.json').write_text(json.dumps(provenance, indent=2)+'\n')
    (payload_root/'LICENSE-libgdx.txt').write_bytes((TOOLS/'LICENSE-libgdx.txt').read_bytes())
    (payload_root/'LICENSE').write_bytes((ROOT/'LICENSE').read_bytes())
    if args.verify:
        for name in ['arm64-v8a/libgdx.so', 'arm64-v8a/libgdx-box2d.so', 'provenance.json', 'LICENSE-libgdx.txt', 'LICENSE']:
            if (payload_root/name).read_bytes() != (args.verify/name).read_bytes():
                raise SystemExit('Payload differs from the rebuild: '+name)
        print('PASS: both libraries and provenance match the previous build', flush=True)

if __name__ == '__main__':
    main()
