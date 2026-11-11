"""Check the built bundle records the real toolchain selected for this CI job."""
import json
from pathlib import Path
import sys
import zipfile


def verify(directory, record):
    selected = json.loads(Path(record).read_text())['patcher']['version']
    bundles = [p for p in Path(directory).glob('*.mpp')
               if 'sources' not in p.name and 'javadoc' not in p.name]
    if not bundles:
        raise ValueError('No built MPP bundle found')
    for bundle in bundles:
        with zipfile.ZipFile(bundle) as archive:
            manifest = archive.read('META-INF/MANIFEST.MF').decode().replace('\r\n ', '')
        attributes = dict(line.split(': ', 1) for line in manifest.splitlines() if ': ' in line)
        actual = attributes.get('Patcher-Version')
        if actual != selected:
            raise ValueError(f'{bundle.name}: Patcher-Version {actual!r} != selected {selected}')
        print(f'{bundle.name}: verified Patcher-Version {actual}')
    return len(bundles)


if __name__ == '__main__':
    verify(sys.argv[1] if len(sys.argv) > 1 else 'patches/build/libs',
           sys.argv[2] if len(sys.argv) > 2 else 'morphe-toolchain.json')
