"""Check staged helper type references against original APK + bundle + staged definitions.
This is a type-closure check, not an ART verifier or patch-application test.
"""
from pathlib import Path
from zipfile import ZipFile
import re,struct,sys,json

def dex_classes(data):
    u=lambda p:struct.unpack_from('<I',data,p)[0]
    count,offset=u(0x38),u(0x3c);strings=[]
    for i in range(count):
        p=u(offset+4*i)
        while data[p]&128:p+=1
        p+=1;strings.append(data[p:data.index(b'\0',p)].decode('utf-8','replace'))
    types=[strings[u(u(0x44)+4*i)] for i in range(u(0x40))]
    return {types[u(u(0x64)+32*i)] for i in range(u(0x60))}

if __name__=='__main__':
    stage,apk,bundle=map(Path,sys.argv[1:]);defined=set()
    for archive in [apk,bundle]:
        with ZipFile(archive) as z:
            for name in z.namelist():
                if re.fullmatch('classes[0-9]*.dex',name) or name.endswith('/helpers.mpe') or name.endswith('/method-delta.dex'):
                    defined.update(dex_classes(z.read(name)))
    references={};files=list(stage.rglob('*.smali'))
    for p in files:
        data=p.read_text()
        match=re.search(r'^\.class .* (L[^;]+;)$',data,re.M)
        if match:defined.add(match[1])
        for line in data.splitlines():
            if line.lstrip().startswith(('#','.annotation')):continue
            for name in re.findall(r'Le/e/a/[^;\s"<>]+;',line):references.setdefault(name,set()).add(str(p.relative_to(stage)))
    missing={name:sorted(paths) for name,paths in references.items() if name not in defined}
    print(json.dumps({'staged_smali_files':len(files),'defined_types_in_union':len(defined),'referenced_helper_types':len(references),'missing':missing},indent=2))
    if missing:raise SystemExit(1)
