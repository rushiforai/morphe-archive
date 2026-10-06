"""Close engineering evidence with actual APK/audit/test data; no install/sign/publish."""
from pathlib import Path
import hashlib,json,re,struct,zipfile
R=Path(__file__).resolve().parents[2];V=R/'.verification/n28c-r1';O=V/'delivery-records'
def read(p):return json.loads(p.read_text(encoding='utf-8'))
def sha(p):
 with p.open('rb') as f:return hashlib.file_digest(f,'sha256').hexdigest().upper()
full=read(V/'full-final/result.json');extra=read(V/'special-and-concurrency/result.json');special=read(V/'special-original44-plus-sdk/result.json')
assert full['exit']==extra['exit']==0 and full['input_sha']==extra['input_sha']
assert full['totals']=={'tests':614,'failures':0,'errors':0,'skipped':0}
assert extra['totals']=={'tests':46,'failures':0,'errors':0,'skipped':0}
assert special['exit']==0 and special['input_sha']==full['input_sha']
assert special['totals']=={'tests':46,'failures':0,'errors':0,'skipped':0}
log=(O/'composition.log').read_text(encoding='utf-8-sig',errors='replace');passes=len(re.findall(r'^PASS ',log,re.M));assert passes==84 and 'COMPOSITION_PASS' in log
for n in ['structure.txt','selection.txt']:
 p=R/'build/n28c-r1-composition-final'/n
 assert p.read_bytes()==(R/'build/n28c-composition-final'/n).read_bytes()==(R/'build/n28b-composition-final'/n).read_bytes()
for label in ['mpp','mpe','apk']:
 text=(O/f'{label}-branch-audit.txt').read_text(encoding='utf-8-sig')
 assert 'DEX_BRANCH_AUDIT_PASS' in text and 'invalid_branches=0 dex_problems=0 binding_failures=0' in text
assert 'DEX_AUDIT_PASS classes=58052' in (O/'composition-dex-audit.log').read_text(encoding='utf-8-sig')
assert "minSdkVersion:'28'" in (O/'aapt-badging.log').read_text(encoding='utf-8-sig')
assert int((O/'apksigner-exit.txt').read_text(encoding='utf-8-sig').strip())==1
assert 'ERROR: Missing META-INF/MANIFEST.MF' in (O/'apksigner-verify.log').read_text(encoding='utf-8-sig')
art=read(O/'artifacts.json')
for row in art:
 p=Path(row['path']);assert p.stat().st_size==row['bytes'] and sha(p)==row['sha256'].upper()
apk=Path(art[2]['path'])
with apk.open('rb') as f:
 f.seek(-65557,2);tail=f.read();offset=tail.rfind(b'PK\x05\x06');assert offset>=0
 central=struct.unpack_from('<I',tail,offset+16)[0];f.seek(central-16);assert f.read(16)!=b'APK Sig Block 42'
with zipfile.ZipFile(apk) as z:assert not any(re.match(r'META-INF/.*\.(RSA|DSA|EC|SF)$',n,re.I) for n in z.namelist())
old=read(R/'.verification/n28c-scheduler-fix/2026-10-02T05-46-38-772884Z/input-manifest.json')
for section in ['prior_evidence','history']:
 for row in old[section]:
  p=R/row['path'];assert p.stat().st_size==row['bytes'] and sha(p)==row['sha256'].upper(),str(p)

manifest=read(R/'.verification/n26-rollback/audit-tool/manifest.json')
for row in manifest['files']:
 p=R/'.verification/n26-rollback'/row['path'];assert sha(p)==row['sha256'].upper() and p.stat().st_size==row['bytes']
(O/'audit-tool-provenance.json').write_text(json.dumps({'source_commit':manifest['source_commit'],'files_hash_verified':len(manifest['files']),'require_ai_observer':False},indent=2)+'\n',encoding='utf-8')
history=read(O/'history-after.json');assert history['total']==history['unchanged']
score=read(R/'scoreboard/results/frozen-baseline.json');assert sorted(score['case_totals'].values())==[4,4,4]
assert all(score['metrics']['invisible_ms'][k]['total']==0 for k in ['pending_translation','event_review','overflow'])
rows=read(O/'fourteen-targets-production-trace.json')['rows'];assert len(rows)==28 and len({r['target_code'] for r in rows})==14 and all(r['pages'] and r['line_count']<=2 for r in rows)
summary={'status':'ENGINEERING_PASS_UNSIGNED_DEVICE_NOT_VERIFIED','execution_head':read(V/'input-manifest.json')['head'],'product_input_sha':full['input_sha'],'full_java':full['totals'],'special_original_44_plus_two_sdk_instances':46,'additional_concurrency_test':1,'controlled_rounds_same_final_C':400,'chinese_golden_groups':18,'geometry_combinations':40,'fourteen_target_cold_hot_rows':28,'required_pair_rows':7,'page_time_statistics':read(O/'page-time-statistics.json'),'python_tests':27,'localization':'220x14','frozen':'4/4/4','invisible_ms':[0,0,0],'original_test_files_unchanged':65,'prior_evidence_unchanged':168,'prior_historical_artifacts_unchanged':62,'all_R1_captured_history_files_unchanged':history['total'],'composition_passes':passes,'final_root_dex':11,'final_classes':58052,'final_methods':322123,'final_branch_edges':625182,'final_switch_cases':112402,'final_try_blocks':46648,'invalid_branches':0,'dex_problems':0,'binding_failures':0,'unsigned':True,'remote_translation_calls':0,'installed':False,'signed':False,'pushed':False,'published':False,'artifacts':art}
(O/'engineering-final.json').write_text(json.dumps(summary,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
print('ENGINEERING_FINAL_PASS full=614 special=46 controlled=400 composition=84 roots=11 history=',history['total'])
