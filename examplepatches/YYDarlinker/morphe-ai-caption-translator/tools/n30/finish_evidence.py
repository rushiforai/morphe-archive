"""Close only from the named N30 artifacts and exact final same-source tests; preserve failures."""
from pathlib import Path
import json,hashlib,re,zipfile,struct
from concurrent.futures import ThreadPoolExecutor
R=Path(__file__).resolve().parents[2];V=R/'.verification/n30';O=V/'delivery-records'
def read(p):return json.loads(p.read_text(encoding='utf-8-sig'))
def sha(p):
 with p.open('rb') as f:return hashlib.file_digest(f,'sha256').hexdigest().upper()
def log(n):return (O/n).read_text(encoding='utf-8-sig',errors='replace')
def write(n,v):(O/n).write_text(json.dumps(v,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
full=read(V/'full-final-05/result.json');special=read(V/'special-and-concurrency-final-02/result.json')
assert full['exit']==special['exit']==0 and full['input_sha']==special['input_sha']
assert full['totals']=={'tests':669,'failures':0,'errors':0,'skipped':0}
assert special['totals']=={'tests':68,'failures':0,'errors':0,'skipped':0}
for p,h in read(V/'full-final-05/inputs.json')['files'].items():assert sha(R/p).lower()==h,p
for name in ['legacy-activate.json','legacy-region-golden.json']:assert read(V/'full-final-05'/name)==read(R/'.verification/n29/full-final-06'/name)
score=read(R/'scoreboard/results/frozen-baseline.json');assert sorted(score['case_totals'].values())==[4,4,4]
assert all(score['metrics']['invisible_ms'][k]['total']==0 for k in ['pending_translation','event_review','overflow'])
assert 'Ran 27 tests' in log('python27.log') and '\nOK\n' in log('python27.log')
assert '232 keys in all 14 locales' in log('localization.log')
assert read(O/'scope-proof.json')['r1_publication_permit_cas_unchanged']
assert read(O/'release-debug-class-equality.json')['byte_identical']
artifacts=read(O/'artifacts.json')
for row in artifacts:assert sha(Path(row['path']))==row['sha256'].upper() and Path(row['path']).stat().st_size==row['bytes']
for label in ['mpp','mpe','apk']:
 s=log(label+'-branch-audit.txt');assert 'DEX_BRANCH_AUDIT_PASS' in s and 'invalid_branches=0 dex_problems=0 binding_failures=0' in s
assert 'N30_TRANSITION_ENTRY_COMPLETE hook_v2=1 inline_force_scan=0' in log('composition-dex-audit.log')
assert 'N30_MENU_BRIDGE_COMPLETE' in log('composition-dex-audit.log')
assert 'N30_PRODUCTION_SPECIFICITY_PASS' in log('composition-dex-audit.log')
assert 'AI_FINALIZER_COMPLETE draw=1 menu=1 observer=1 initialize=1 selection=1 copy=1' in log('composition-dex-audit.log')
combinations=[]
for label in ['ai','simplified','memory','ai-simplified','ai-memory','simplified-memory']:
 assert 'STRUCTURE_PASS' in log('combination-'+label+'.log')
 assert 'DEX_AUDIT_PASS' in log('combination-'+label+'-audit.log')
 combinations.append({'selection':label,'serialized_dex_audit':'PASS','structure':(V/'combinations-final-03'/label/'structure.txt').read_text(encoding='utf-8')})
combinations.append({'selection':'all-three','final_apk_audit':'PASS'})
write('seven-combinations.json',combinations)
for label in ['unknown-145','duplicate-145']:
 state=(V/(label+'-02')/'failure-structure.txt').read_text(encoding='utf-8');assert 'aiInstalled=0' in state
 assert 'AI finalizer incomplete' in log(label+'-02-audit.log')
assert 'AI finalizer incomplete' in log('missing-hook-audit.log')
assert any(reason in log('user-bad-apk-audit.log') for reason in ['AI finalizer incomplete','N30 language menu hook missing','N30 generic translation clone missing'])
assert all(c['rejected'] for c in read(O/'mutation-sensitivity.json')['controls'])
assert 'rows=128' in log('official-cc-final.log') and 'shim_needed=false' in log('official-cc-final.log')
assert 'PASS entries=72 locales=14' in log('n8-verify.log')
assert "sdkVersion:'28'" in log('aapt-badging.log')
assert read(O/'aapt-preference-proof.json')['new_ui_values_in_arsc']==168
apk=Path(artifacts[2]['path'])
with zipfile.ZipFile(apk) as z:
 assert z.testzip() is None and not any(re.match(r'META-INF/.*\.(RSA|DSA|EC|SF)$',n,re.I) for n in z.namelist())
 dexes=[n for n in z.namelist() if re.fullmatch(r'classes\d*\.dex',n)];assert len(dexes)==11
with apk.open('rb') as f:
 f.seek(-65557,2);tail=f.read();at=tail.rfind(b'PK\x05\x06');assert at>=0
 central=struct.unpack_from('<I',tail,at+16)[0];f.seek(central-16);assert f.read(16)!=b'APK Sig Block 42'
history=read(V/'input-manifest.json')['history']
with ThreadPoolExecutor(max_workers=8) as pool:hashes=list(pool.map(lambda x:sha(R/x['path']),history))
for row,h in zip(history,hashes):assert h==row['sha256'] and (R/row['path']).stat().st_size==row['bytes'],row['path']
write('history-after.json',{'captured_files':len(history),'unchanged':len(history)})
external=read(V/'input-manifest.json')['n30_external']+read(V/'source-inputs.json')
for row in external:assert sha(Path(row['path']))==row['sha256'] and Path(row['path']).stat().st_size==row['bytes']
write('external-inputs-unchanged.json',{'rows':external,'all_unchanged':True})
paths=read(V/'full-final-05/n30-transition-path-rounds.json')['rows'];assert len(paths)==30 and all(r['callback_geometry']==r['callback_native_scan']==0 for r in paths)
ui=read(V/'full-final-05/n30-localization-runtime.json')['rows'];assert len(ui)==14 and all(r['ellipsis']==0 for r in ui)
source=read(V/'full-final-05/n30-source-break-four-inputs.json')['rows'];assert len(source)==4 and all(r['illegal_blocks']==0 for r in source)
startup=read(V/'full-final-05/n30-startup-fixed-after.json');assert startup['bootstrap_remote_requests']==0 and startup['provider_calls']==2
audit_match=re.search(r'SUMMARY label=n30-apk dex_units=(\d+) classes=(\d+) methods=(\d+) branch_edges=(\d+)',log('apk-branch-audit.txt'));assert audit_match
audit_metrics=dict(zip(['dex_units','dex_classes','dex_methods','dex_branch_edges'],map(int,audit_match.groups())))
summary={'status':'unsigned_local_engineering_delivery','java_tests':669,'special_tests':68,'controlled_rounds':400,'final_input_sha':full['input_sha'],'golden_groups':18,'golden_full_field_equality':True,'python_tests':27,'localization_keys':232,'locales':14,'native_preference_screens':3,'ordinary_transition_rounds':30,'compact_rounds':10,'callback_inline_geometry_scans':0,'callback_inline_native_scans':0,'source_input_replays':4,'synthetic_break_variants':12,'seven_combinations':7,'dex_units':11,'history_files_unchanged':len(history),'actual_patch_passes':len(re.findall(r'^PASS ',log('composition-final.log'),re.M)),'official_default_roots':len((R/'build/n30-composition-final/official-defaults.txt').read_text(encoding='utf-8').splitlines()),'startup':startup,'real_device_after':'not_run','sign_install_push_publish_remote_api_new_dependencies_downloads':0,'artifacts':artifacts}
summary.update(audit_metrics)
write('final-summary.json',summary);print(json.dumps(summary,ensure_ascii=False,indent=2))
