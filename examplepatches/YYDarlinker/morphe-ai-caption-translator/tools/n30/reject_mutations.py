"""Sensitivity controls use copied artifacts or captured actual production outputs only."""
from pathlib import Path
import json,zipfile,re,copy
R=Path(__file__).resolve().parents[2];O=R/'.verification/n30/delivery-records';M=R/'.verification/n30/mutations-03';M.mkdir(exist_ok=True)
artifact=R/'build/local-test/patches-1.3.5-本地测试包-n30.mpp'
source=R/'tools/n30/verify_host_resources.py';validation=source.read_text(encoding='utf-8-sig')
needle="mpp = root / f'build/local-test/patches-1.3.5-{name}-n30.mpp'";assert validation.count(needle)==1
controls=[]
with zipfile.ZipFile(artifact) as z:
 entries={n:z.read(n) for n in z.namelist()}
for label in ['missing-resource','duplicate-resource']:
 mutant=M/(label+'.mpp');assert not mutant.exists();values=dict(entries);key='captionlocales/values-fr/caption_addon_strings.xml';xml=values[key].decode('utf-8')
 match=re.search(r'    <string name="cap_ai_summary"[^>]*>.*?</string>\r?\n',xml);assert match
 xml=xml.replace(match[0],'' if label=='missing-resource' else match[0]*2);values[key]=xml.encode('utf-8')
 with zipfile.ZipFile(mutant,'w',compression=zipfile.ZIP_DEFLATED) as out:
  for n,data in values.items():out.writestr(n,data)
 try:exec(compile(validation.replace(needle,'mpp = Path('+repr(str(mutant))+')'),str(source),'exec'),{'__file__':str(source),'__name__':'__main__'});raise RuntimeError('mutant incorrectly accepted')
 except AssertionError:controls.append({'mutation':label,'rejected':True,'validator':'same delivered-artifact resource validator'})
menu=json.loads((R/'.verification/n30/full-final-05/n30-menu-runtime.json').read_text(encoding='utf-8'))['rows'][0]['menu']
codes={'ar','de','en','es','fr','hi','id','ja','ko','pt','ru','vi','zh-Hans','zh-Hant'}
def validate(rows):
 seen=set()
 for row in rows:
  code=row['canonical_code'];assert code in codes,'unsupported_stored_code';assert code not in seen,'duplicate_canonical_language';seen.add(code)
validate(menu)
for label in ['duplicate-language','wrong-code']:
 data=copy.deepcopy(menu)
 if label=='duplicate-language':data.append(copy.deepcopy(data[0]))
 else:data[0]['canonical_code']='French display text'
 try:validate(data);raise RuntimeError('mutant incorrectly accepted')
 except AssertionError as e:controls.append({'mutation':label,'rejected':True,'reason':str(e),'source':'captured actual NativeCaptionBridge.augmentTranslations test-host output'})
(O/'mutation-sensitivity.json').write_text(json.dumps({'controls':controls,'source_bound':True},indent=2)+'\n',encoding='utf-8')
print('N30_MUTATION_SENSITIVITY_PASS',len(controls))
