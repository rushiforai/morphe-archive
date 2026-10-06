"""Actual N28B -> N28C delivered DEX inventory, with no fixed class count."""
from pathlib import Path
import json,os,re,struct,zipfile
ROOT=Path(__file__).resolve().parents[2]
RUN=Path(os.environ.get('N28C_RUN_DIR') or ROOT/'.verification/n28c-r1')
records=RUN/'delivery-records'
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
        dexes=[n for n in z.namelist() if re.fullmatch(r'classes\d*\.dex',n)]
        return set().union(*(classes(z.read(n)) for n in dexes)),len(dexes)

before=classes((ROOT/'build/local-test/extension-1.3.5-本地测试包-n28b.mpe').read_bytes())
after=classes((ROOT/'build/local-test/extension-1.3.5-本地测试包-n28c-r1.mpe').read_bytes())
apk_before,_=apk_classes(ROOT/'build/n28b-composition-final/YouTube-21.16.256-本地测试包-n28b-unsigned.apk')
apk_after,dex_count=apk_classes(ROOT/'build/n28c-r1-composition-final/YouTube-21.16.256-本地测试包-n28c-r1-unsigned.apk')
added=after-before;removed=before-after
assert {'Lapp/yydarlinker/deepseekcaptions/CaptionRenderSpec;','Lapp/yydarlinker/deepseekcaptions/CaptionLanguagePager;'}<=added
assert all(c.startswith('Lapp/yydarlinker/deepseekcaptions/') for c in added|removed)
assert all('$$ExternalSynthetic' in c for c in removed),sorted(removed)
assert apk_after-apk_before==added and apk_before-apk_after==removed
markers=[b'CaptionControlsAvoidance',b'CAPTION_UI_AVOIDANCE_',b'onPlayerControlsVisibility']
with zipfile.ZipFile(ROOT/'build/n28c-r1-composition-final/YouTube-21.16.256-本地测试包-n28c-r1-unsigned.apk') as z:
 for n in z.namelist():
  if re.fullmatch(r'classes\d*\.dex',n):
   data=z.read(n)
   for marker in markers:assert marker not in data,(n,marker)
report={'baseline':'n28b','baseline_apk_classes':len(apk_before),'final_apk_classes':len(apk_after),'baseline_mpe_classes':len(before),'final_mpe_classes':len(after),'added_classes':sorted(added),'removed_classes':sorted(removed),'root_dex_count':dex_count,'n27_classes_events_callbacks':0}
(records/'dex-class-inventory.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8');print(json.dumps(report,indent=2))
