#!/usr/bin/env python3
"""Download official, pinned build inputs into .work; no system installations or tokens."""
from pathlib import Path
import hashlib
import subprocess
import tarfile
import urllib.request
import zipfile
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parent.parent
WORK = ROOT / '.work'
WORK.mkdir(exist_ok=True)


def download(url, path, digest, algorithm='sha256'):
    if not path.is_file() or hashlib.new(algorithm, path.read_bytes()).hexdigest() != digest:
        print(f'Downloading {path.name}', flush=True)
        temporary = path.with_suffix(path.suffix + '.partial')
        urllib.request.urlretrieve(url, temporary)
        if hashlib.new(algorithm, temporary.read_bytes()).hexdigest() != digest:
            raise RuntimeError(f'Checksum mismatch: {url}')
        temporary.replace(path)
    return path


def source(name, url, commit):
    path = WORK / 'upstream' / name
    path.parent.mkdir(exist_ok=True)
    if not (path / '.git').exists():
        subprocess.run(['git', 'clone', '--depth', '1', url, str(path)], check=True)
    subprocess.run(['git', '-C', str(path), 'diff', '--exit-code', 'HEAD'], check=True)
    current = subprocess.run(['git', '-C', str(path), 'rev-parse', 'HEAD'], capture_output=True, text=True)
    if current.stdout.strip() != commit:
        subprocess.run(['git', '-C', str(path), 'diff', '--exit-code'], check=True)
        subprocess.run(['git', '-C', str(path), 'fetch', '--depth', '1', 'origin', commit], check=True)
        subprocess.run(['git', '-C', str(path), 'checkout', '--detach', commit], check=True)
    print(f'{name}: {commit}', flush=True)


# Official sources used by this validated build, both version 2.1.0.
source('gradle-plugin', 'https://github.com/MorpheApp/morphe-patches-gradle-plugin.git',
       '9974a20f4a2c7614e5faa4ba8663ccf97e865469')
source('patcher', 'https://github.com/MorpheApp/morphe-patcher.git',
       'f3997dc1011b84a301c1ffe426fd9dfdd85095ba')

jdk = WORK / 'toolchain' / 'jdk-21.0.13+9'
if not (jdk / 'bin/java').is_file():
    archive = download(
        'https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.13%2B9/'
        'OpenJDK21U-jdk_x64_linux_hotspot_21.0.13_9.tar.gz', WORK / 'jdk.tar.gz',
        'd7f5d5cf865a2902b70ff549b97586a7d3f234e016f041ab447ea740c7d66d1c')
    with tarfile.open(archive) as stream:
        stream.extractall(WORK / 'toolchain', filter='data')

sdk = WORK / 'android-sdk'
# Google publishes SHA-1 archive checksums in repository2-3.xml.
packages = [
    ('platforms/android-36', 'platform-36_r02.zip', '2c1a80dd4d9f7d0e6dd336ec603d9b5c55a6f576',
     'platforms-android-36.zip'),
    ('build-tools/36.0.0', 'build-tools_r36_linux.zip', 'b0b6376977657e8ad9b969bacf4093601da2c6fb',
     'build-tools-36.0.0.zip'),
]
for directory, filename, checksum, cache in packages:
    target = sdk / directory
    if (target / 'source.properties').is_file():
        continue
    archive = download('https://dl.google.com/android/repository/' + filename,
                       WORK / cache, checksum, 'sha1')
    target.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(archive) as stream:
        top = stream.namelist()[0].split('/')[0]
        stream.extractall(target.parent)
        for info in stream.infolist():
            if info.external_attr >> 16:
                (target.parent / info.filename).chmod(info.external_attr >> 16)
    (target.parent / top).rename(target)

if not (sdk / 'platform-tools/source.properties').is_file():
    data = urllib.request.urlopen('https://dl.google.com/android/repository/repository2-3.xml').read()
    document = ET.fromstring(data)
    package = next(p for p in document.findall('remotePackage') if p.attrib['path'] == 'platform-tools')
    item = next(a for a in package.findall('archives/archive') if a.findtext('host-os') == 'linux')
    archive = download('https://dl.google.com/android/repository/' + item.findtext('complete/url'),
                       WORK / 'platform-tools.zip', item.findtext('complete/checksum'), 'sha1')
    with zipfile.ZipFile(archive) as stream:
        stream.extractall(sdk)
        for info in stream.infolist():
            if info.external_attr >> 16:
                (sdk / info.filename).chmod(info.external_attr >> 16)
print('Isolated toolchain ready', flush=True)
