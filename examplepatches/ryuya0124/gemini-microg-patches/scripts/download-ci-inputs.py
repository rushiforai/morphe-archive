"""Fetch user-provided APK URLs without writing them to logs or repository files."""
from pathlib import Path
import os
import urllib.request

root = Path(__file__).resolve().parents[1]
inputs = root / 'inputs'
inputs.mkdir(exist_ok=True)
mapping = {
    'GOOGLE_BASE_APK_URL': 'google-base.apk',
    'GOOGLE_SPLIT_APK_URL': 'google-xxhdpi.apk',
    'GEMINI_BASE_APK_URL': 'gemini-base.apk',
}
for variable in mapping:
    if not os.environ.get(variable, '').startswith('https://'):
        raise SystemExit('Configure HTTPS repository secret: ' + variable)
for variable, filename in mapping.items():
    try:
        urllib.request.urlretrieve(os.environ[variable], inputs / filename)
    except Exception:
        raise SystemExit('Download failed for ' + filename + '; check its URL secret') from None
    print('Downloaded', filename)
