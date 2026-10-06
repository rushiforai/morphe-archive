from pathlib import Path
import hashlib,json,re,struct,subprocess,zipfile
ROOT=Path(__file__).resolve().parents[2]
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest().upper()
def class_names(data):
    assert data[:4]==b'dex\n'
    string_count,string_offset=struct.unpack_from('<II',data,56)
    def string(index):
        pos=struct.unpack_from('<I',data,string_offset+index*4)[0]
        while data[pos]&128: pos+=1
        pos+=1; end=data.index(b'\0',pos); return data[pos:end].decode('utf-8','replace')
    type_count,type_offset=struct.unpack_from('<II',data,64); class_count,class_offset=struct.unpack_from('<II',data,96)
    return {string(struct.unpack_from('<I',data,type_offset+struct.unpack_from('<I',data,class_offset+i*32)[0]*4)[0]) for i in range(class_count)}
artifacts=[
 {'path':str(ROOT/'build/local-test/patches-1.3.5-本地测试包-n35.mpp'),'kind':'mpp'},
 {'path':str(ROOT/'build/local-test/extension-1.3.5-本地测试包-n35.mpe'),'kind':'mpe'},
 {'path':str(ROOT/'build/n35-composition-final/YouTube-21.16.256-本地测试包-n35-unsigned.apk'),'kind':'apk'}]
for a in artifacts:
 p=Path(a['path']); assert p.is_file(); a['bytes']=p.stat().st_size; a['sha256']=sha(p)
names=class_names(Path(artifacts[1]['path']).read_bytes())
assert not any(n.startswith(('Lapp/morphe/','Ln33/','Ln34/','Lvalidation/')) for n in names)
forbidden=['CaptionUiLocale','CaptionPreferenceBindings','CaptionUiWindows','CaptionSettingsBindingPatch']
assert not any(x in n for n in names for x in forbidden)
with zipfile.ZipFile(artifacts[0]['path']) as z: assert z.read('extensions/extension.mpe')==Path(artifacts[1]['path']).read_bytes()
with zipfile.ZipFile(artifacts[2]['path']) as z:
 dex=[n for n in z.namelist() if re.fullmatch(r'classes\d*\.dex',n)]
 assert len(dex)>=11
 apk_classes=set().union(*(class_names(z.read(n)) for n in dex)); assert not any(n.startswith(('Ln33/','Ln34/','Lvalidation/')) for n in apk_classes)
listing=json.loads((ROOT/'patches-list.json').read_text(encoding='utf-8')); assert {p['name'] for p in listing['patches']}=={'AI caption translator','Remember caption selection'}
log=(ROOT/'.verification/n35/composition-final-03.log').read_text(encoding='utf-8-sig',errors='replace'); assert 'COMPOSITION_PASS' in log; composition_passes=len(re.findall(r'^PASS ',log,re.M)); assert composition_passes>0
full=json.loads((ROOT/'.verification/n35/full-03/result.json').read_text()); assert full['exit']==0 and full['totals']=={'tests':708,'failures':0,'errors':0,'skipped':0}
baseline=json.loads((ROOT/'docs/N35-N34-BASELINE.json').read_text(encoding='utf-8')); preserved=[]
for item in baseline['artifacts']+[baseline['official_input']]:
 p=Path(item['path']); assert p.stat().st_size==item['bytes'] and sha(p)==item['sha256']; preserved.append({'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)})
report={'status':'PASS','artifacts':artifacts,'extension_class_definitions':len(names),'apk_classes':len(apk_classes),'root_dexes':len(dex),'composition_pass_lines':composition_passes,'full_test_result':full,'preserved_n34_inputs':preserved,'new_reference_body_available':False,'physical_phone_written':False}
(Path(ROOT/'.verification/n35/final-checks.json')).write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8'); print(json.dumps(report,ensure_ascii=False,indent=2))
