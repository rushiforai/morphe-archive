"""Prepare source metadata; review/commit it before pushing the corresponding tag."""
from pathlib import Path
from datetime import datetime, timezone
import json
import re
import sys

if len(sys.argv) != 2 or not re.fullmatch(r'\d+\.\d+\.\d+', sys.argv[1]):
    raise SystemExit('Usage: python3 scripts/prepare-release.py 0.1.0')
version = sys.argv[1]
root = Path(__file__).resolve().parents[1]
repo = 'https://github.com/ryuya0124/gemini-microg-patches'
metadata = {
    'created_at': datetime.now(timezone.utc).replace(tzinfo=None, microsecond=0).isoformat(),
    'description': 'Gemini login and Samsung Secure Folder support with microG',
    'download_url': f'{repo}/releases/download/v{version}/gemini-microg-patches-{version}.mpp',
    'page_url': f'{repo}/releases/tag/v{version}',
    'version': version,
}
(root / 'patches-bundle.json').write_text(json.dumps(metadata, indent=2) + '\n')
print('Prepared patches-bundle.json for v' + version)
print('Write docs/releases/v' + version + '.md, then build-mpp.sh, commit, and tag.')
