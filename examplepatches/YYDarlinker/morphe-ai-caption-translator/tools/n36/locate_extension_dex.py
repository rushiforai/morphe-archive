"""Locate the extension's own DEX inside a composed APK so a test host can carry the new build."""
import sys
import zipfile
from pathlib import Path


def main() -> None:
    apk = Path(sys.argv[1])
    with zipfile.ZipFile(apk) as archive:
        for info in archive.infolist():
            if not info.filename.endswith('.dex'):
                continue
            data = archive.read(info.filename)
            hit = b'deepseekcaptions' in data
            print(f'{info.filename:14s} {info.file_size:9d} contains_extension={hit}')
        for info in archive.infolist():
            if 'extension' in info.filename.lower() or 'morphe' in info.filename.lower():
                print('entry', info.filename, info.file_size)


if __name__ == '__main__':
    main()
