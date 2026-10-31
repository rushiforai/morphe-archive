"""Restore exact web packages without npm lifecycle scripts or global installs."""
from pathlib import Path,PurePosixPath
import argparse,base64,hashlib,io,json,tarfile,urllib.request
p=argparse.ArgumentParser();p.add_argument('--root',type=Path);args=p.parse_args()
root=(args.root or Path(__file__).resolve().parents[1]).resolve()
assert root.is_dir(),'Choose an existing build root'
def safe(path):
 path=path.absolute()
 assert path.is_relative_to(root)
 for part in [path,*path.parents]:
  if part.exists():assert not part.is_symlink() and not getattr(part.lstat(),'st_file_attributes',0)&0x400,'Reparse point refused'
 return path
pins=json.loads((Path(__file__).resolve().parent/'web-dependencies.json').read_text(encoding='utf-8'))
for entry in pins['packages']:
 esbuild=entry['path']=='__esbuild__'
 target=safe(root/('Personal-Patches/web/tools/esbuild' if esbuild else 'Personal-Patches/web/node_modules/'+entry['path']))
 manifest=target/'package.json'
 if esbuild and (target/'esbuild.exe').is_file():continue
 if not esbuild and manifest.is_file():
  actual=json.loads(manifest.read_text(encoding='utf-8'));assert actual['name']==entry['name'] and actual['version']==entry['version'];continue
 assert not target.exists() or esbuild and all(x.is_file() and x.name in {'README.md','registry.json','package.json'} for x in target.iterdir()),'Incomplete dependency directory; inspect before replacing it'
 request=urllib.request.Request(entry['url'],headers={'User-Agent':'BDCrusher-YTMusic-build/1.0'})
 with urllib.request.urlopen(request,timeout=90) as response:raw=response.read(32*1024*1024+1)
 assert len(raw)<=32*1024*1024 and 'sha512-'+base64.b64encode(hashlib.sha512(raw).digest()).decode()==entry['integrity'],'Package integrity mismatch'
 rows=[];total=0;seen=set()
 with tarfile.open(fileobj=io.BytesIO(raw),mode='r:gz') as archive:
  for item in archive.getmembers():
   name=PurePosixPath(item.name)
   assert name.parts[0]=='package' and not name.is_absolute() and '..' not in name.parts and '\\' not in item.name
   assert item.isdir() or item.isfile(),'Links/special package members refused'
   if item.isdir():continue
   relative=PurePosixPath(*name.parts[1:]);assert relative.parts
   assert relative.as_posix().casefold() not in seen;seen.add(relative.as_posix().casefold())
   total+=item.size;assert item.size<=16*1024*1024 and total<=64*1024*1024 and len(seen)<=10000
   if esbuild and relative.as_posix() not in ('esbuild.exe','README.md','package.json'):continue
   rows.append((relative,archive.extractfile(item).read()))
 target.mkdir(parents=True,exist_ok=esbuild)
 for relative,data in rows:
  output=safe(target/relative.as_posix());output.parent.mkdir(parents=True,exist_ok=True);output.write_bytes(data)
 print('Prepared '+entry['name']+'@'+entry['version'])
