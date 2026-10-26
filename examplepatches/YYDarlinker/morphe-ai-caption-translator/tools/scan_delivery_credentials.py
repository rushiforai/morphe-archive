"""Known-value credential scan. Reports only file names/counts, never values."""
from pathlib import Path
from verify_current import long_path
import argparse,io,json,os,zipfile

def scan(paths):
    values=[v.encode() for k,v in os.environ.items() if (k.endswith('_KEY') or k.endswith('_TOKEN') or k.endswith('_SECRET')) and len(v)>=8]
    matches=[];files=0
    def inspect(data,label,depth=0):
        nonlocal files
        files+=1
        if any(value in data for value in values):matches.append(label)
        if depth<3 and zipfile.is_zipfile(io.BytesIO(data)):
            with zipfile.ZipFile(io.BytesIO(data)) as archive:
                for name in archive.namelist():
                    info=archive.getinfo(name)
                    if info.file_size<=64*1024*1024:inspect(archive.read(name),label+'::'+name,depth+1)
    for path in paths:
        readable_root=long_path(path)
        candidates=[(p,str(path/p.relative_to(readable_root))) for p in readable_root.rglob('*')] if readable_root.is_dir() else [(readable_root,str(path))]
        for readable,label in candidates:
            if readable.is_file() and readable.stat().st_size<=64*1024*1024:inspect(readable.read_bytes(),label)
    return {'known_credential_values_scanned':len(values),'files_and_archive_entries':files,'matches':matches,'values_printed':False}

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--path',type=Path,action='append',required=True);p.add_argument('--output',type=Path,required=True);a=p.parse_args()
    result=scan(a.path);a.output.write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8');print(json.dumps({'matches':len(result['matches']),'files_and_archive_entries':result['files_and_archive_entries']}));raise SystemExit(bool(result['matches']))
