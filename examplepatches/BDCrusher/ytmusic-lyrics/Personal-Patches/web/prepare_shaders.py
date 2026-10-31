"""Fetch pinned source packages with integrity checks; no install scripts or external caches."""
from pathlib import Path
import base64, hashlib, io, json, tarfile, urllib.request
root=Path(__file__).resolve().parents[1]
pins=[('@kawarp/core','1.3.1','gDR4d5kMr/viItEzZb5XBlHHi5WcWRsIPbnSj3ToVdLfc6ykP03VlTUpAhxA4mn/ZayICJbgFqZkGWSrySCQPQ=='),('altcha-lib','2.5.0','MiqlwnImoooVTmFzZ8odhpqtCsSl7M/6cmgaX42Tkuvd41e5IVveg6hiw/e9rXSb6dm1RvniPmeURwO64wWTuQ==')]
for name,version,integrity in pins:
    destination=root/'web/node_modules'/name
    if destination.exists():
        assert json.loads((destination/'package.json').read_text(encoding='utf-8'))['version']==version
        continue
    with urllib.request.urlopen(f'https://registry.npmjs.org/{name}/{version}',timeout=30) as response:metadata=json.load(response)
    assert metadata['dist']['integrity']=='sha512-'+integrity
    with urllib.request.urlopen(metadata['dist']['tarball'],timeout=30) as response:data=response.read(4*1024*1024)
    assert base64.b64encode(hashlib.sha512(data).digest()).decode()==integrity
    with tarfile.open(fileobj=io.BytesIO(data),mode='r:gz') as archive:
        for member in archive.getmembers():
            relative=Path(member.name).relative_to('package')
            assert not relative.is_absolute() and '..' not in relative.parts and not member.issym() and not member.islnk()
            if member.isfile():
                target=destination/relative;target.parent.mkdir(parents=True,exist_ok=True)
                target.write_bytes(archive.extractfile(member).read())
    record=root/'third-party-notices'/(name.replace('/','_').replace('@','')+'-'+version+'-registry.json')
    record.write_text(json.dumps({'name':name,'version':version,'integrity':'sha512-'+integrity},indent=2)+'\n',encoding='utf-8')
    for item in destination.iterdir():
        if item.is_file() and item.name.lower().startswith(('license','notice')):
            (root/'third-party-notices'/(name.replace('/','_').replace('@','')+'-'+item.name)).write_bytes(item.read_bytes())
print('Pinned Kawarp 1.3.1 and ALTCHA 2.5.0 verified')
