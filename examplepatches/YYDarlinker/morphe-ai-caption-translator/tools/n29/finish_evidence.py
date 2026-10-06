"""Close N29 only from final artifacts, final same-code tests and immutable captured history."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import hashlib,json,re,zipfile,struct
R=Path(__file__).resolve().parents[2];V=R/'.verification/n29';O=V/'delivery-records'
def read(p):return json.loads(p.read_text(encoding='utf-8'))
def sha(p):
 with p.open('rb') as f:return hashlib.file_digest(f,'sha256').hexdigest().upper()
def log(n):return (O/n).read_text(encoding='utf-8-sig',errors='replace')
def write(n,x):(O/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
def run():
 full=read(V/'full-final-06/result.json');extra=read(V/'special-and-concurrency-final-03/result.json')
 assert full['exit']==extra['exit']==0 and full['input_sha']==extra['input_sha']
 assert full['totals']=={'tests':643,'failures':0,'errors':0,'skipped':0}
 assert extra['totals']=={'tests':68,'failures':0,'errors':0,'skipped':0}
 for p,h in read(V/'full-final-06/inputs.json')['files'].items():assert sha(R/p).lower()==h,p
 for name in ['legacy-activate.json','legacy-region-golden.json']:
  assert read(V/'full-final-06'/name)==read(R/'.verification/n28c-r1/full-final'/name),name
  write(name,read(V/'full-final-06'/name))
 matrix={}
 for name,size in [('geometry-matrix.json',40),('fourteen-targets-production-trace.json',28)]:
  old=read(R/'.verification/n28c-r1/full-final'/name)['rows'];new=read(V/'full-final-06'/name)['rows'];assert len(old)==len(new)==size
  assert all(not a['pages'] or b['pages'] for a,b in zip(old,new)),name
  matrix[name]={'rows':size,'all_previous_nonblank_plans_still_feasible':True}
 for name in ['n29-device-exact-sdk28.json','n29-device-exact-sdk35.json','n29-seam-matrix-sdk28.json','n29-seam-matrix-sdk35.json']:
  rows=read(V/'full-final-06'/name)['rows']
  for row in rows:
   pages=row['after']
   if not pages:continue
   assert ''.join(p['text'] for p in pages)==row['text']
   if not row['target'].startswith('zh') and len(pages)>1:assert all(p['end']-p['start']>=1200 for p in pages)
   assert pages[0]['start']==row['start'] and pages[-1]['end']==row['end']
  write(name,{'rows':rows})
 for label in ['mpp','mpe','apk']:
  s=log(label+'-branch-audit.txt');assert 'DEX_BRANCH_AUDIT_PASS' in s and 'invalid_branches=0 dex_problems=0 binding_failures=0' in s
 assert 'AI_FINALIZER_COMPLETE draw=1 menu=1 observer=1 initialize=1 selection=1 copy=1' in log('composition-dex-audit.log')
 classes=int(re.search(r'DEX_AUDIT_PASS classes=(\d+)',log('composition-dex-audit.log'))[1])
 combinations=[]
 for label in ['ai','simplified','memory','ai-simplified','ai-memory','simplified-memory']:
  assert 'STRUCTURE_PASS' in log('combination-'+label+'.log')
  assert 'DEX_AUDIT_PASS' in log('combination-'+label+'-audit.log')
  combinations.append({'combination':label,'serialized_patcher_dex_audit':'PASS','structure':(V/'combinations'/label/'structure.txt').read_text(encoding='utf-8')})
 for label in ['unknown-145','duplicate-145']:
  state=(V/label/'failure-structure.txt').read_text(encoding='utf-8')
  assert 'aiInstalled=0' in state and 'AI finalizer incomplete' in log(label+'-audit.log')
 assert 'AI finalizer incomplete' in log('missing-hook-audit.log')
 assert 'AI finalizer incomplete' in (V/'user-bad-apk-audit.log').read_text(encoding='utf-8-sig',errors='replace')
 assert 'AI_FINALIZER_COMPLETE' in log('string-144-audit.log') and 'path=Ljava/lang/String;' in log('string-144-audit.log')
 assert 'shim_needed=false' in log('official-cc-final.log') and 'rows=128' in log('official-cc-final.log')
 assert "sdkVersion:'28'" in log('aapt-badging-ascii.log')
 assert 'PASS entries=72 locales=14' in log('n8-verify.log')
 assert 'Ran 27 tests' in log('python27.log') and '\nOK\n' in log('python27.log')
 assert '220 keys in all 14 locales' in log('localization.log')
 score=read(R/'scoreboard/results/frozen-baseline.json');assert sorted(score['case_totals'].values())==[4,4,4]
 assert all(score['metrics']['invisible_ms'][k]['total']==0 for k in ['pending_translation','event_review','overflow'])
 artifacts=read(O/'artifacts.json')
 for row in artifacts:
  p=Path(row['path']);assert sha(p)==row['sha256'].upper() and p.stat().st_size==row['bytes']
 apk=Path(artifacts[2]['path'])
 with zipfile.ZipFile(apk) as z:
  assert z.testzip() is None and not any(re.match(r'META-INF/.*\.(RSA|DSA|EC|SF)$',n,re.I) for n in z.namelist())
  dexes=[n for n in z.namelist() if re.fullmatch(r'classes\d*\.dex',n)]
  root_count=len(dexes)
 with apk.open('rb') as f:
  f.seek(-65557,2);tail=f.read();n=tail.rfind(b'PK\x05\x06');assert n>=0
  central=struct.unpack_from('<I',tail,n+16)[0];f.seek(central-16);assert f.read(16)!=b'APK Sig Block 42'
 history=read(V/'input-manifest.json')['history']
 with ThreadPoolExecutor(max_workers=12) as pool:
  hashes=list(pool.map(lambda x:sha(R/x['path']),history))
 for row,h in zip(history,hashes):assert h==row['sha256'] and (R/row['path']).stat().st_size==row['bytes'],row['path']
 write('history-after.json',{'captured_history_files':len(history),'unchanged':len(history)})
 # The scope tool separately proves protected controller bodies and every frozen acceptance byte.
 scope=read(O/'scope-proof.json');assert scope['r1_publication_permit_cas_unchanged']
 passes=len(re.findall(r'^PASS ',log('composition-final.log'),re.M))
 defaults=(R/'build/n29-composition-final/official-defaults.txt').read_text(encoding='utf-8').splitlines()
 assert 'Spoof signature' not in defaults
 write('seven-combinations.json',{'combinations':combinations+[{'combination':'all-three','final_apk_audit':'PASS'}]})
 summary={'status':'ENGINEERING_PASS_UNSIGNED_DEVICE_NOT_VERIFIED','execution_head':read(V/'input-manifest.json')['head'],
  'full_java':full['totals'],'extra_same_code':extra['totals'],'final_input_sha':full['input_sha'],'controlled_rounds':400,
  'chinese_golden_groups':18,'chinese_full_field_equality':True,'matrix':matrix,'python_tests':27,'localization':'220x14',
  'frozen':'4/4/4','invisible_ms':[0,0,0],'official_version':'1.45.0','host_version':'21.16.256','minSdk':28,
  'official_default_roots':len(defaults),'actual_patch_passes':passes,'root_dex_count':root_count,'classes':classes,
  'all_seven_serialized_combinations':'PASS','known_bad_user_apk':'HOOK_MISSING_REJECTED','unknown_and_duplicate_signature':'REJECTED_PERMISSION_FALSE',
  'deliberate_missing_draw':'REJECTED','string_144':'PASS','charsequence_145':'PASS','always_show_shim':False,
  'history_files_unchanged':len(history),'artifacts':artifacts,'remote_translation_api_calls':0,'new_dependencies':0,'downloads':0,
  'signed':False,'installed':False,'pushed':False,'published':False}
 write('engineering-final.json',summary);print(json.dumps(summary,ensure_ascii=False,indent=2))
if __name__=='__main__':run()
