#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-3.0-only
"""Prepare audited dependency sources, then package an explicitly frozen source commit."""
import argparse
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import stat
import subprocess
import tempfile
import zipfile

BASE = '44031c561ea048c8f196877f30a49c13bfd6afb6'
VERSION = '2.2.0'
DATE = (2026, 11, 13, 0, 0, 0)
PINS = {
    'morphe-patches-gradle-plugin': '5b7e4619931a8c78b7858e598e002222d37021b9',
    'morphe-patches-library': '538d9a6574cbacb4ca66d8b687c44d93b2d8d470',
    'morphe-patcher': 'd19545e8505e0329cc640723cb8ff91eddd3cd05',
    'ARSCLib': '675bed2de397097400ba6f0c808e28005ae5aa53',
}
PLUGIN_FILE = 'src/main/kotlin/app/morphe/patches/gradle/SettingsPlugin.kt'
BANNED_PARTS = {'.git', '.gradle', '.idea', '.kotlin', '__pycache__'}
BANNED_NAMES = {'local.properties', '.env', 'RISK_REGISTER.md', 'STAGING.md', 'DONE.md', 'MISTAKES.md'}
BANNED_EXTENSIONS = {'.jks', '.keystore', '.p12', '.pfx', '.pem', '.key', '.conf', '.log', '.mpp'}


def sha(data):
    return hashlib.sha256(data).hexdigest()


def git(root, *arguments):
    return subprocess.check_output(['git', *arguments], cwd=root)


def entries(root):
    result = []
    for row in git(root, 'ls-tree', '-r', '-z', 'HEAD').split(b'\0'):
        if not row:
            continue
        header, name = row.split(b'\t', 1)
        mode, kind, oid = header.decode().split()
        assert mode in ('100644', '100755') and kind == 'blob', 'Unexpected nonregular Git entry'
        result.append((name.decode(), mode, oid))
    return result


def validate_name(name, dependency=False):
    path = PurePosixPath(name)
    assert not path.is_absolute() and '..' not in path.parts and '\\' not in name
    assert not BANNED_PARTS.intersection(path.parts) and path.name not in BANNED_NAMES, name
    assert path.suffix.lower() not in BANNED_EXTENSIONS, name
    # ARSCLib's tracked AOSP framework archives and fixture are required inputs.
    if path.suffix.lower() == '.apk':
        assert dependency and (name.startswith('src/main/resources/frameworks/android/')
                               or name == 'src/test/resources/type_id_offset.apk'), name
    assert 'build' not in path.parts, 'Tracked build output requires explicit review: ' + name


def write_zip(output, files, stage):
    with zipfile.ZipFile(output, 'x', zipfile.ZIP_DEFLATED, compresslevel=9) as z:
        for p in files:
            name = p.relative_to(stage).as_posix()
            info = zipfile.ZipInfo(name, DATE)
            info.create_system = 3
            info.compress_type = zipfile.ZIP_DEFLATED
            info.external_attr = (stat.S_IFREG | (0o755 if p.stat().st_mode & 0o111 else 0o644)) << 16
            z.writestr(info, p.read_bytes(), compresslevel=9)


def copy_git(root, target, allow_plugin_change=False, dependency=False):
    rows = []
    status = git(root, 'status', '--porcelain', '--untracked-files=no').decode().splitlines()
    expected = [' M ' + PLUGIN_FILE] if allow_plugin_change else []
    assert status == expected, 'Unexpected tracked modification in ' + root.name
    for name, mode, oid in entries(root):
        validate_name(name, dependency)
        p = root / name
        assert not p.is_symlink(), name
        data = p.read_bytes()
        blob = hashlib.sha1(b'blob ' + str(len(data)).encode() + b'\0' + data).hexdigest()
        assert blob == oid or (allow_plugin_change and name == PLUGIN_FILE), name
        dest = target / name
        dest.parent.mkdir(parents=True, exist_ok=True)
        dest.write_bytes(data)
        dest.chmod(0o755 if mode == '100755' else 0o644)
        rows.append({'path': name, 'sha256': sha(data), 'size': len(data), 'mode': mode})
    return rows


def prepare(args):
    assert not args.stage.exists(), 'Choose a new staging directory'
    args.stage.mkdir(parents=True, mode=0o700)
    provenance = {'version': VERSION, 'public_dependencies': {}, 'go_vendor': {}}
    for name, pin in PINS.items():
        root = args.public_sources / name
        assert git(root, 'rev-parse', 'HEAD').decode().strip() == pin, name
        rows = copy_git(root, args.stage / name, name == 'morphe-patches-gradle-plugin', True)
        data = {'repository': 'https://github.com/MorpheApp/' + name,
                'commit': pin, 'file_count': len(rows),
                'files_sha256': sha(json.dumps(rows, sort_keys=True).encode())}
        if name == 'morphe-patches-gradle-plugin':
            patch = git(root, 'diff', '--no-ext-diff', 'HEAD', '--')
            declared = args.source / 'build-support/wireguard-public-plugin.patch'
            assert patch == declared.read_bytes(), 'Plugin modification differs from documented patch'
            data['documented_patch'] = 'morphe-wireguard/build-support/wireguard-public-plugin.patch'
            data['patch_sha256'] = sha(patch)
        provenance['public_dependencies'][name] = data
    vendor = args.stage / 'morphe-wireguard/native/wireguard/vendor'
    source = args.source / 'native/wireguard'
    inputs = {name: sha((source / name).read_bytes()) for name in ('go.mod', 'go.sum')}
    env = dict(os.environ, GOTOOLCHAIN='local', GOWORK='off', GOFLAGS='-mod=readonly')
    version = subprocess.check_output([str(args.go), 'version'], env=env, text=True).strip()
    assert 'go1.26.10 ' in version, 'Use pinned Go 1.26.10'
    subprocess.run([str(args.go), 'mod', 'verify'], cwd=source, env=env, check=True)
    subprocess.run([str(args.go), 'mod', 'vendor', '-o', str(vendor)], cwd=source, env=env, check=True)
    assert inputs == {name: sha((source / name).read_bytes()) for name in inputs}, 'Go module inputs changed'
    files = sorted(p for p in vendor.rglob('*') if p.is_file())
    assert files and (vendor / 'modules.txt').is_file()
    for p in files:
        assert not p.is_symlink()
        validate_name(p.relative_to(vendor).as_posix())
    provenance['go_vendor'] = {'toolchain': 'go1.26.10', 'command': 'go mod vendor -o <isolated-staging-vendor>',
                               'module_inputs_sha256': inputs, 'files': len(files),
                               'total_bytes': sum(p.stat().st_size for p in files),
                               'purpose': 'Complete imported-package corresponding source, including cross-platform source; not an offline Gradle/toolchain bundle'}
    (args.stage / 'DEPENDENCY-PROVENANCE.json').write_text(json.dumps(provenance, indent=2) + '\n')
    print(json.dumps(provenance, indent=2), flush=True)


def package(args):
    assert args.source_commit and args.bundle and args.output
    assert not args.output.exists(), 'Refusing to replace an existing archive'
    head = git(args.source, 'rev-parse', 'HEAD').decode().strip()
    assert head == args.source_commit and len(head) == 40, 'Source HEAD is not the approved freeze'
    assert not git(args.source, 'status', '--porcelain').strip(), 'Source checkout must be clean'
    assert (args.stage / 'DEPENDENCY-PROVENANCE.json').is_file(), 'Run prepare first'
    assert not (args.stage / 'morphe-wireguard/gradle.properties').exists(), 'Main snapshot already exists'
    rows = copy_git(args.source, args.stage / 'morphe-wireguard')
    for name in ('LICENSE', 'NOTICE'):
        assert git(args.source, 'show', BASE + ':' + name) == (args.source / name).read_bytes(), name
    assert ('version = ' + VERSION).encode() in (args.source / 'gradle.properties').read_bytes()
    assert (args.stage / 'morphe-wireguard/docs/wireguard-upstream-2.2.0.md').is_file(), 'Missing final validation report'
    native = {}
    with zipfile.ZipFile(args.bundle) as z:
        assert z.testzip() is None
        for abi in ('arm64-v8a', 'x86_64'):
            data = z.read('wireguard/' + abi + '/libmorphewireguard.so')
            rel = 'morphe-wireguard/native/wireguard/build/android/' + abi + '/libmorphewireguard.so'
            target = args.stage / rel
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(data)
            target.chmod(0o644)
            native[abi] = {'sha256': sha(data), 'size': len(data), 'archive_path': rel}
    dependency = json.loads((args.stage / 'DEPENDENCY-PROVENANCE.json').read_text())
    provenance = {'release': 'v' + VERSION, 'modified_unofficial_derivative': True,
                  'project_source_repository': 'https://github.com/seo-rii/morphe-patches',
                  'project_source_commit': head, 'base_repository': 'https://github.com/MorpheApp/morphe-patches',
                  'base_commit': BASE, 'native_payloads_from_tested_bundle_sha256': sha(args.bundle.read_bytes()),
                  'native_payloads': native, 'dependencies': dependency,
                  'excluded': ['Git metadata', 'build caches', 'local configuration', 'proprietary YouTube/Music APKs', 'private profiles and credentials'],
                  'dependency_apks': 'Exact tracked ARSCLib AOSP framework/resource APKs and test fixture are included as build inputs, distinct from target app APKs',
                  'reproduction_scope': 'Fixed file ordering/timestamps/modes; independently rebuilding on another host is not claimed'}
    (args.stage / 'SOURCE-PROVENANCE.json').write_text(json.dumps(provenance, indent=2) + '\n')
    contents = sorted(p for p in args.stage.rglob('*') if p.is_file())
    manifest = [{'path': p.relative_to(args.stage).as_posix(), 'size': p.stat().st_size,
                 'sha256': sha(p.read_bytes()), 'mode': '0755' if p.stat().st_mode & 0o111 else '0644'} for p in contents]
    (args.stage / 'SOURCE-MANIFEST.json').write_text(json.dumps({'files': manifest, 'self_excluded_from_hash_list': 'SOURCE-MANIFEST.json'}, indent=2) + '\n')
    args.output.parent.mkdir(parents=True, exist_ok=True)
    files = sorted(p for p in args.stage.rglob('*') if p.is_file())
    assert not {'source-inventory.json', 'packaging-result.json'}.intersection(p.relative_to(args.stage).as_posix() for p in files)
    write_zip(args.output, files, args.stage)
    with zipfile.ZipFile(args.output) as z:
        assert z.testzip() is None and len(z.namelist()) == len(set(z.namelist())) == len(files)
        for row in manifest:
            assert sha(z.read(row['path'])) == row['sha256'], row['path']
        for name in z.namelist():
            assert not PurePosixPath(name).is_absolute() and '..' not in PurePosixPath(name).parts
            assert not BANNED_PARTS.intersection(PurePosixPath(name).parts)
        for abi in native:
            assert sha(z.read(native[abi]['archive_path'])) == native[abi]['sha256']
    with tempfile.TemporaryDirectory(dir=args.output.parent, prefix='same-input-repack-') as tmp:
        repeated = Path(tmp) / 'source.zip'
        write_zip(repeated, files, args.stage)
        assert sha(repeated.read_bytes()) == sha(args.output.read_bytes()), 'Same-input repack differs'
    result = {'status': 'PASS', 'source_commit': head, 'files': len(files), 'uncompressed_bytes': sum(p.stat().st_size for p in files),
              'archive_bytes': args.output.stat().st_size, 'archive_sha256': sha(args.output.read_bytes()),
              'bundle_sha256': provenance['native_payloads_from_tested_bundle_sha256'],
              'native_payloads': native, 'checks': ['ZIP CRC', 'unique safe entries', 'all manifest hashes round-trip', 'LICENSE/NOTICE exact base', 'native payload byte equality', 'byte-identical same-input repack on this host']}
    (args.output.parent / 'packaging-result.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(result, indent=2), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command', choices=('prepare', 'package'))
    parser.add_argument('--source', type=Path, required=True)
    parser.add_argument('--public-sources', type=Path, required=True)
    parser.add_argument('--go', type=Path, required=True)
    parser.add_argument('--stage', type=Path, required=True)
    parser.add_argument('--source-commit')
    parser.add_argument('--bundle', type=Path)
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    (prepare if args.command == 'prepare' else package)(args)


if __name__ == '__main__':
    main()
