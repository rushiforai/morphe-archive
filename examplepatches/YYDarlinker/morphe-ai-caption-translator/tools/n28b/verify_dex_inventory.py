"""Actual N28A→N28B DEX classes; record all additions/removals, including desugared lambdas."""
from pathlib import Path
import json,re,struct,zipfile
ROOT=Path(__file__).resolve().parents[2];records=ROOT/'build/n28b-records'
def classes(data):
    sc,so=struct.unpack_from('<II',data,56);tc,to=struct.unpack_from('<II',data,64);cc,co=struct.unpack_from('<II',data,96)
    strings=[]
    for i in range(sc):
        at=struct.unpack_from('<I',data,so+4*i)[0]
        while data[at]&128:at+=1
        at+=1;end=data.index(0,at);strings.append(data[at:end].decode('utf-8',errors='replace'))
    types=[strings[struct.unpack_from('<I',data,to+4*i)[0]] for i in range(tc)]
    return {types[struct.unpack_from('<I',data,co+32*i)[0]] for i in range(cc)}
def apk_classes(path):
    with zipfile.ZipFile(path) as z:
        dexes=[n for n in z.namelist() if re.fullmatch(r'classes\d*\.dex',n)];assert len(dexes)==11
        return set().union(*(classes(z.read(n)) for n in dexes))
before=classes((ROOT/'build/local-test/extension-1.3.5-本地测试包-n28a.mpe').read_bytes())
after=classes((ROOT/'build/local-test/extension-1.3.5-本地测试包-n28b.mpe').read_bytes())
apk_before=apk_classes(ROOT/'build/n28a-composition-final/YouTube-21.16.256-本地测试包-n28a-unsigned.apk')
apk_after=apk_classes(ROOT/'build/n28b-composition-final/YouTube-21.16.256-本地测试包-n28b-unsigned.apk')
added=after-before;removed=before-after
assert 'Lapp/yydarlinker/deepseekcaptions/RebuildNumbers$Result;' in added
assert all(p.startswith('Lapp/yydarlinker/deepseekcaptions/') for p in added|removed)
assert all('$$ExternalSynthetic' in p for p in removed),sorted(removed)
assert apk_after-apk_before==added and apk_before-apk_after==removed
assert not any('CaptionControlsAvoidance' in c or 'RenderSpec' in c or 'CaptionLanguagePager' in c for c in apk_after)
report={'baseline':'n28a','baseline_apk_classes':len(apk_before),'final_apk_classes':len(apk_after),
    'baseline_mpe_classes':len(before),'final_mpe_classes':len(after),'added_classes':sorted(added),
    'removed_classes':sorted(removed),'root_dex_count':11,'n27_classes_events_callbacks':0}
(records/'dex-class-inventory.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
print(json.dumps(report,indent=2))
