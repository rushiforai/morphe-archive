"""Compare delivered DEX class inventories with N26. This does not change any DEX."""
from pathlib import Path
import json,re,struct,zipfile
ROOT=Path(__file__).resolve().parents[2];records=ROOT/'build/n28a-records'
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
        return set().union(*(classes(z.read(n)) for n in z.namelist() if re.fullmatch(r'classes\d*\.dex',n)))
prefix='Lapp/yydarlinker/deepseekcaptions/'
expected={prefix+n+';' for n in ['CaptionLanguageContext','CaptionLanguageProfile','CaptionLanguageProfile$Direction','CaptionLanguageProfile$ReadingCounter','CaptionLanguageProfile$LineCounter','CaptionUnicode']}
base=classes((ROOT/'build/local-test/extension-1.3.5-本地测试包-n26.mpe').read_bytes())
new=classes((ROOT/'build/local-test/extension-1.3.5-本地测试包-n28a.mpe').read_bytes())
assert not base-new,sorted(base-new)
assert new-base==expected,sorted(new-base)
before=apk_classes(ROOT/'build/n26-composition-final/YouTube-21.16.256-本地测试包-n26-unsigned.apk')
after=apk_classes(ROOT/'build/n28a-composition-final/YouTube-21.16.256-本地测试包-n28a-unsigned.apk')
assert not before-after,sorted(before-after)
assert after-before==expected,sorted(after-before)
report={'baseline_apk_classes':len(before),'final_apk_classes':len(after),'baseline_mpe_classes':len(base),'final_mpe_classes':len(new),'only_added_classes':sorted(expected),'removed_classes':[],'n27_classes_events_callbacks':0}
(records/'dex-class-inventory.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
print(json.dumps(report,indent=2))
