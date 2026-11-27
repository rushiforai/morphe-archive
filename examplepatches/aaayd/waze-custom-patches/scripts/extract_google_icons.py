"""Extract named drawable/mipmap files and raw SVGs from the phone's Maps APKs.

Place base.apk and the phone density split in downloads/google-maps-phone first.
Compiled Android XML is preserved as stored; SVG and bitmap files open directly.
"""
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import zipfile

root=Path(__file__).resolve().parents[1]
output=root/'references/google-maps-icons/extracted'
aapt=Path(os.environ['LOCALAPPDATA'])/'Android/Sdk/build-tools/36.0.0/aapt2.exe'
manifest=[]
for apk in sorted((root/'downloads/google-maps-phone').glob('*.apk')):
    dump=subprocess.check_output([str(aapt),'dump','resources',str(apk)]).decode('utf-8')
    (output.parent/(apk.stem+'-resources.txt')).write_text(dump,encoding='utf-8')
    resource=None
    with zipfile.ZipFile(apk) as archive:
        for line in dump.splitlines():
            match=re.match(r'\s+resource (0x[0-9a-f]+) (\w+)/(\S+)',line)
            if match: resource=match.groups();continue
            match=re.match(r'\s+\((.*?)\) \(file\) (\S+)',line)
            if not match or not resource: continue
            rid,kind,name=resource
            config,path=match.groups()
            if kind not in ('drawable','mipmap') and not (kind=='raw' and path.endswith('.svg')):continue
            suffix='' if kind=='raw' and not config else '--'+(config or 'default')
            relative=Path(apk.stem)/kind/(name+suffix+Path(path).suffix)
            data=archive.read(path)
            dest=output/relative;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(data)
            manifest.append(dict(id=rid,kind=kind,name=name,config=config,apk=apk.name,apk_path=path,
                                 file=relative.as_posix(),sha256=hashlib.sha256(data).hexdigest()))
(output/'manifest.json').write_text(json.dumps(manifest,indent=2),encoding='utf-8')
print(f'Extracted {len(manifest)} named visual resource variants.')
