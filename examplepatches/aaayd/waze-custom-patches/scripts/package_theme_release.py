"""Package reproducible local sources without signing keys, APKs or phone captures."""
import hashlib
from pathlib import Path
import re
import sys
import zipfile

root=Path(__file__).resolve().parents[1]
version=sys.argv[1]
assert re.fullmatch(r'\d+\.\d+\.\d+',version)
archive=root/'dist/waze-theme-selector-source.zip'
with zipfile.ZipFile(archive,'w',zipfile.ZIP_DEFLATED) as z:
    paths=[]
    for folder in ['src','theme-extension','badge-extension','vehicle-extension','scripts','gradle']:
        paths += [p for p in (root/folder).rglob('*') if p.is_file() and '__pycache__' not in p.parts and 'build' not in p.parts]
    for pattern in ['Build*.ps1','*.md','*.kts','gradlew','gradlew.bat','tools/*.java']:
        paths += list(root.glob(pattern))
    paths += [root/'references/google-maps-icons/pack-manifest.json',root/'references/google-maps-icons/pack-preview.png',root/'references/icon-zoom/patch.json']
    paths += [p for p in (root/'tools/morphe-auto-installer').rglob('*') if p.is_file() and 'build' not in p.parts]
    paths += list((root/'tools/login-gate-test').rglob('*.java'))
    paths += [root/'dist/waze-aa-installer-1.0.0.apk']
    for p in sorted(set(paths)):z.write(p,p.relative_to(root).as_posix())
    z.writestr('SOURCE-NOTES.txt','Generated icon PNGs are included. Rebuild with BuildThemes.ps1 or BuildThemesApk.ps1 using existing local dependencies.\nSigning keys, downloads, personal settings and phone captures are excluded.\nFor icon regeneration, the extracted source artwork is in google-maps-extracted-icons.zip.\n')
with zipfile.ZipFile(archive) as z:assert z.testzip() is None
names=[f'waze-theme-selector-{version}.mpp','waze-5.24.5.0-themes-moods-badges-arm64.apk','waze-theme-selector-source.zip','google-maps-extracted-icons.zip']
(root/'dist/SHA256SUMS-themes.txt').write_text(''.join(hashlib.sha256((root/'dist'/name).read_bytes()).hexdigest()+'  '+name+'\n' for name in names))
print('Source archive verified; release SHA-256 checksums written.')
