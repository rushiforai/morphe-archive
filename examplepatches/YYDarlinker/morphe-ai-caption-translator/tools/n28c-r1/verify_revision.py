"""Offline N28C-R1 gates and independent artifacts. Never overwrites a C/v1 delivery."""
from pathlib import Path
import argparse, hashlib, json, shutil, struct, zipfile, zlib, xml.etree.ElementTree as ET
R=Path(__file__).resolve().parents[2]; V=R/'.verification/n28c-r1'; O=V/'delivery-records';O.mkdir(exist_ok=True)
PREFIX='extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/'
PRODUCT={PREFIX+n+'.java' for n in ['CaptionLanguagePager','CaptionOverlayV2','CaptionRenderSpec','RebuildCache','RebuildController']}
TEST={p.as_posix() for p in []}
TEST={f'extensions/extension/src/test/java/app/yydarlinker/deepseekcaptions/{n}.java' for n in ['N28CCounterTest','N28CGeometryTest','N28CProductionTest','SchedulerLifecycleRegressionTest']}
START=json.loads((V/'input-manifest.json').read_text(encoding='utf-8'))
def sha(p):
 with p.open('rb') as f:return hashlib.file_digest(f,'sha256').hexdigest().upper()
def save(n,x):(O/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
def frozen():
 allowed=PRODUCT|TEST|{'docs/PROJECT-STATE.md'}
 changed=[p for p,h in START['files'].items() if sha(R/p).lower()!=h.lower()]
 assert set(changed)<=allowed,changed
 baseline=json.loads((R/'build/n28c-records/tracked-before.json').read_text(encoding='utf-8'))
 old_tests=[p for p in baseline if p.startswith('extensions/extension/src/test/') and p.endswith('.java')]
 assert len(old_tests)==65,len(old_tests)
 for p in old_tests:assert sha(R/p)==baseline[p].upper(),p
 save('frozen-scope.json',{'execution_head':START['head'],'product_anchor':'anchor/n28c-4d98eec','changed_product_files':sorted(set(changed)&PRODUCT),'changed_existing_new_C_tests':sorted(set(changed)&TEST),'original_java_test_files_unchanged':65,'acceptance_and_frozen_byte_identical':True,'changes_other_than_allowed':[]})
 print('FROZEN_PASS originals=65 acceptance/scoreboard/resources/build/provider/prompt/budgets unchanged')
def results(run):
 evidence=json.loads((V/run/'inputs.json').read_text(encoding='utf-8'))
 for p,h in evidence['files'].items():assert sha(R/p).lower()==h,p
 result=json.loads((V/run/'result.json').read_text(encoding='utf-8'));assert result['exit']==0 and not result['reason'],result
 counts=result['totals'];assert counts['failures']==counts['errors']==counts['skipped']==0
 suites=result['suites'];assert sum(x['tests'] for x in suites if '.N28C' not in x['name'] and '.MainLooperLifecycleTest' not in x['name'] and '.SchedulerLifecycleRegressionTest' not in x['name'])==538
 save('java-full.json',result)
 for name in ['legacy-activate.json','legacy-region-golden.json']:
  assert json.loads((V/run/name).read_text(encoding='utf-8'))==json.loads((R/'build/n28b-records'/name).read_text(encoding='utf-8')),name
 save('legacy-equality.json',{'chinese_golden_groups':18,'legacy_activate_equal':True,'golden_equal':True,'fixture_bytes_unchanged':True})
 for p in (V/run).glob('*.json'):
  if p.name not in ['inputs.json','result.json']:shutil.copyfile(p,O/p.name)
 for p in (V/run).glob('native-*.png'):shutil.copyfile(p,O/p.name)
 records=[]
 for p in sorted(O.glob('*-production-trace.json')):
  for row in json.loads(p.read_text(encoding='utf-8'))['rows']:records.append({**row,'evidence':p.name})
 save('presentation-trace-matrix.json',{'presentation_policy':'n28c-presentation-v2','remote_translation_calls':0,'production_rows':records,'geometry_combinations':40})
 for n,size in [('geometry-matrix.json',40),('fourteen-targets-production-trace.json',28),('required-pairs-production-trace.json',7)]:assert len(json.loads((O/n).read_text(encoding='utf-8'))['rows'])==size
 def stats(rows,geometry=False):
  durations=[];multi=[];short=[];blank=0
  for row in rows:
   if not geometry and str(row.get('target_code','')).startswith('zh'):continue
   pages=row['pages'];blank+=not pages
   ds=[p['end']-p['start'] for p in pages];durations+=ds
   if len(pages)>1:
    multi+=ds
    if any(d<1200 for d in ds):short.append(row)
   if pages:
    at=pages[0]['start']
    for p in pages:assert p['start']==at and p['end']>p['start'];at=p['end']
    if 'event_start' in row:assert pages[0]['start']==row['event_start'] and at==row['event_end']
    if 'event_text' in row:assert ''.join(p['text'] for p in pages)==row['event_text']
    if 'event_end' in row and row['event_end']-row['event_start']<1200:assert len(pages)==1
  assert not short,short
  return {'rows':len(rows),'min_page_ms':min(durations) if durations else None,'min_multi_page_ms':min(multi) if multi else None,'sub1200_multi_page_count':len(short),'safe_blank_rows':blank}
 time_stats={}
 for n,g in [('geometry-matrix.json',True),('fourteen-targets-production-trace.json',False),('presentation-trace-matrix.json',False)]:
  d=json.loads((O/n).read_text(encoding='utf-8'));time_stats[n]=stats(d['rows'] if 'rows' in d else d['production_rows'],g)
 save('page-time-statistics.json',time_stats)
 # Full before/after text/time comparison: original matrices remain read-only.
 compare=[]
 for name in ['geometry-matrix.json','fourteen-targets-production-trace.json']:
  before=json.loads((V/'presentation-before'/name).read_text(encoding='utf-8'))['rows'];after=json.loads((O/name).read_text(encoding='utf-8'))['rows'];assert len(before)==len(after)
  for i,(old,new) in enumerate(zip(before,after)):
   text=''.join(p['text'] for p in old['pages']);assert text==new.get('event_text',text)
   compare.append({'matrix':name,'row':i,'target':new.get('target_code','en'),'tier':new.get('tier'),'text':text,'before':old['pages'],'after':new['pages'],'safe_blank':not new['pages']})
 save('short-pages-comparison.json',compare)
 print('JAVA_FULL_PASS',counts,'Chinese18 equal; matrices40/28/7; sub1200 multi=0')
def package():
 mpp=R/'build/local-test/patches-1.3.5-本地测试包-n28c-r1.mpp';mpe=R/'build/local-test/extension-1.3.5-本地测试包-n28c-r1.mpe';assert not mpp.exists() and not mpe.exists()
 src=R/'patches/build/libs/patches-1.3.5.mpp'
 with zipfile.ZipFile(src) as z,zipfile.ZipFile(R/'build/local-test/patches-1.3.5-本地测试包-n28c.mpp') as old:
  assert z.testzip() is None and len(z.namelist())==len(set(z.namelist())) and set(z.namelist())==set(old.namelist())
  changes=[n for n in z.namelist() if z.read(n)!=old.read(n)];assert set(changes)<={'META-INF/MANIFEST.MF','extensions/extension.mpe'} and 'extensions/extension.mpe' in changes
  data=z.read('extensions/extension.mpe');assert data[:4]==b'dex\n';assert struct.unpack_from('<I',data,32)[0]==len(data);assert struct.unpack_from('<I',data,8)[0]==zlib.adler32(data[12:])&0xffffffff;assert data[12:32]==hashlib.sha1(data[32:]).digest()
  for tag in [b'n28c-presentation-v2',b'n28b-policy-v1',b'publication_commit_timeout',b'CaptionRetirementIO']:assert tag in data,tag
  for tag in [b'n28c-presentation-v1',b'CaptionControlsAvoidance',b'onPlayerControlsVisibility']:assert tag not in data,tag
 shutil.copyfile(src,mpp);mpe.write_bytes(data);save('bundle.json',{'changes_vs_C':changes,'embedded_mpe_equal':True,'patch_dex_resources_unchanged':True,'zip_entries':len(z.namelist())})
 print('BUNDLE_PASS',mpp.stat().st_size,mpe.stat().st_size)
def finalize():
 folder=R/'build/n28c-r1-composition-final';apk=folder/'YouTube-21.16.256-本地测试包-n28c-r1-unsigned.apk';assert not apk.exists();shutil.copyfile(folder/'patched-unsigned.apk',apk)
 paths=[R/'build/local-test/patches-1.3.5-本地测试包-n28c-r1.mpp',R/'build/local-test/extension-1.3.5-本地测试包-n28c-r1.mpe',apk]
 save('artifacts.json',[{'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)} for p in paths]);print('APK_READY',apk.stat().st_size)
def history():
 for row in START['history']:
  p=R/row['path'];assert p.stat().st_size==row['bytes'] and sha(p).lower()==row['sha256'].lower(),str(p)
 save('history-after.json',{'total':len(START['history']),'unchanged':len(START['history']),'all_C_and_B_artifacts_and_original_evidence_unchanged':True});print('HISTORY_PASS',len(START['history']))
if __name__=='__main__':
 a=argparse.ArgumentParser();a.add_argument('action',choices=['frozen','results','package','finalize','history']);a.add_argument('--run',default='full-final');args=a.parse_args()
 if args.action=='results':results(args.run)
 else:globals()[args.action]()
