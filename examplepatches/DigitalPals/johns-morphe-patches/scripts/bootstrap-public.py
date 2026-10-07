#!/usr/bin/env python3
"""Fetch a pinned public toolchain; no GitHub Packages credential is needed."""
import hashlib
import os
from pathlib import Path
import urllib.request
import zipfile

cache = Path(os.environ.get('NLZIET_TOOL_CACHE', str(Path.home() / '.cache/nlziet-pip-tools')))
cache.mkdir(parents=True, exist_ok=True)
assets = [
    ('morphe-desktop-1.18.1-all.jar', 'https://github.com/MorpheApp/morphe-desktop/releases/download/v1.18.1/morphe-desktop-1.18.1-all.jar', '1b506ab5f03d16a2f65026d5e0e1910d01fc1e2152f21eaeb44ed2f30856597b', None),
    ('kotlin-compiler-2.4.10.zip', 'https://github.com/JetBrains/kotlin/releases/download/v2.4.10/kotlin-compiler-2.4.10.zip', '473dd66c7a3ef4b182065b3da670466c1bf2773a9dbb0ed8b33a39fe9d4f876d', '.'),
    ('platform-36_r02.zip', 'https://dl.google.com/android/repository/platform-36_r02.zip', '37607369a28c5b640b3a7998868d45898ebcb777565a0e85f9acf36f29631d2e', 'sdk/platforms'),
    ('build-tools_r36_linux.zip', 'https://dl.google.com/android/repository/build-tools_r36_linux.zip', '5d9ac77fb6ff43d9da518a337b4fcf8f9097113df531d99ccefe80ef7ce8250b', 'sdk/build-tools'),
    ('r8-9.5.22.jar', 'https://dl.google.com/dl/android/maven2/com/android/tools/r8/9.5.22/r8-9.5.22.jar', 'a55b40de220efd4f3c252dd6239d54ef86a319ff4dcb06701084056ecfffc308', None),
    ('gson-2.14.0.jar', 'https://repo.maven.apache.org/maven2/com/google/code/gson/gson/2.14.0/gson-2.14.0.jar', '2cbd119bf1961c28788310963dc80ba65f58cdeec1dd139c8bdb1240faa2c36f', None),
]
for name, url, expected, unpack in assets:
    path = cache / name
    if not path.exists():
        temporary = path.with_suffix(path.suffix + '.part')
        urllib.request.urlretrieve(url, temporary)
        if hashlib.sha256(temporary.read_bytes()).hexdigest() != expected:
            temporary.unlink()
            raise SystemExit(f'SHA-256 mismatch for {name}')
        temporary.replace(path)
    if hashlib.sha256(path.read_bytes()).hexdigest() != expected:
        raise SystemExit(f'SHA-256 mismatch for cached {name}')
    if unpack:
        destination = cache / unpack
        destination.mkdir(parents=True, exist_ok=True)
        marker = destination / (name + '.unpacked')
        if not marker.exists():
            with zipfile.ZipFile(path) as archive:
                for member in archive.infolist():
                    output = (destination / member.filename).resolve()
                    if not output.is_relative_to(destination.resolve()):
                        raise SystemExit(f'Unsafe archive entry: {member.filename}')
                archive.extractall(destination)
            marker.touch()
    print(f'Verified {name}')
for executable in (cache / 'kotlinc/bin').iterdir():
    executable.chmod(executable.stat().st_mode | 0o111)
for name in ('apksigner', 'aapt2', 'zipalign'):
    path = cache / 'sdk/build-tools/android-16' / name
    path.chmod(path.stat().st_mode | 0o111)
print(f'Toolchain: {cache}')
