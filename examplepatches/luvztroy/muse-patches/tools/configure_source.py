
import argparse, datetime, hashlib, json, re, shutil
from pathlib import Path
p=argparse.ArgumentParser(description=__doc__)
p.add_argument('repository',help='GitHub OWNER/REPOSITORY')
p.add_argument('--branch',default='main')
a=p.parse_args()
if not re.fullmatch(r'[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+',a.repository):p.error('Use OWNER/REPOSITORY, not a URL')
if not re.fullmatch(r'[A-Za-z0-9_.-]+',a.branch):p.error('Use a simple branch name')
root=Path(__file__).resolve().parents[1]
version='1.2.2'; filename=f'muse-patches-{version}.mpp'
source=root/'build/libs'/filename
if not source.is_file():
    source=root/'dist'/filename
if not source.is_file():p.error('Build the MPP first with bash build.sh')
dest=root/'dist'/filename;dest.parent.mkdir(exist_ok=True)
if source.resolve()!=dest.resolve():shutil.copyfile(source,dest)
manifest={
    'created_at':datetime.datetime.now(datetime.timezone.utc).strftime('%Y-%m-%dT%H:%M:%S'),
    'description':'Clone, MC Debug, top-left menu long-press, Mobile Config JSON import/export and local trust. All enabled by default.',
    'download_url':f'https://raw.githubusercontent.com/{a.repository}/{a.branch}/dist/{filename}',
    'signature_download_url':'',
    'version':version,
}
(root/'patches-bundle.json').write_text(json.dumps(manifest,indent=2)+'\n')
checksums=''.join(hashlib.sha256(path.read_bytes()).hexdigest()+'  '+path.name+'\n' for path in sorted(dest.parent.glob('*.mpp')))
(dest.parent/'SHA256SUMS').write_text(checksums)
print('Manager repository source: https://github.com/'+a.repository)
print('Manager direct JSON source: https://raw.githubusercontent.com/'+a.repository+'/'+a.branch+'/patches-bundle.json')
print('Add-source link: https://morphe.software/add-source?github='+a.repository)
print('Publish and verify these URLs before giving them to the user.')
