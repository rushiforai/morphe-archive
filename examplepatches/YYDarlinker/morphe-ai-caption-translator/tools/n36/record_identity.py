"""Record the delivered N36 package identities with a glob, so non-ASCII file names stay exact."""
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def single(pattern: str) -> Path:
    matches = sorted(ROOT.glob(pattern))
    assert len(matches) == 1, f'expected exactly one match for {pattern}, found {len(matches)}'
    return matches[0]


def main() -> None:
    mpp = single('build/local-test/patches-1.3.5-*n36.mpp')
    mpe = single('build/local-test/extension-1.3.5-*n36.mpe')
    apk = single('build/n36-composition-final/*n36-unsigned.apk')
    official = ROOT / 'patches-1.45.0.mpp'
    data = {
        'version': 1,
        'delivered_date': '2026-10-05',
        'repository': 'E:/Projects/morphe-caption-v2',
        'source_commit': 'PENDING',
        'delivery_commit': 'PENDING',
        'source_anchor': 'PENDING',
        'artifacts': [
            {'kind': kind, 'path': str(path).replace('\\', '/'),
             'bytes': path.stat().st_size, 'sha256': sha(path)}
            for kind, path in (('mpp', mpp), ('mpe', mpe), ('apk', apk))
        ],
        'official_input': {'path': str(official).replace('\\', '/'),
                           'bytes': official.stat().st_size, 'sha256': sha(official)},
        'host_evidence': {
            'before': {'root': 'E:/Projects/morphe-caption-v2/.verification/n36/host-n35-before',
                       'input': 'N35 delivery DEX'},
            'after': {'root': 'E:/Projects/morphe-caption-v2/.verification/n36/host-n36-after-2',
                      'input': 'N36 unsigned APK above'},
        },
        'protected_packages_unchanged': True,
        'composition_evidence': 'E:/Projects/morphe-caption-v2/.verification/n36/composition-final-01',
        'final_checks': 'E:/Projects/morphe-caption-v2/.verification/n36/final-checks.json',
    }
    (ROOT / 'docs/N36-SHA256.json').write_text(json.dumps(data, indent=2, ensure_ascii=False),
                                               encoding='utf-8')
    print(json.dumps(data['artifacts'], indent=2, ensure_ascii=False))


if __name__ == '__main__':
    main()
