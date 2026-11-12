"""Fetch only the production Media3 graph pinned for the live player."""
from pathlib import Path
import hashlib,json,urllib.request,zipfile,concurrent.futures
ROOT=Path(__file__).resolve().parent

def fetch(item):
    ext=item['type']; name=item['artifact']+'-'+item['version']; path=ROOT/'deps'/(name+'.'+ext)
    path.parent.mkdir(exist_ok=True)
    if not path.exists() or hashlib.sha256(path.read_bytes()).hexdigest()!=item['sha256']:
        temp=path.with_suffix(path.suffix+'.download')
        urllib.request.urlretrieve(item['url'],temp)
        if hashlib.sha256(temp.read_bytes()).hexdigest()!=item['sha256']:
            raise RuntimeError('Checksum mismatch: '+name)
        temp.replace(path)
    if ext=='aar':
        with zipfile.ZipFile(path) as archive:
            (path.parent/(name+'.jar')).write_bytes(archive.read('classes.jar'))
    return name

if __name__=='__main__':
    with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
        for name in pool.map(fetch,json.loads((ROOT/'media-dependencies.lock.json').read_text())):
            print(name,flush=True)
