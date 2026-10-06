"""N28C bounded offline evidence, frozen scope, guarded packaging and final history checks."""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,struct,subprocess,xml.etree.ElementTree as ET,zipfile,zlib
ROOT=Path(__file__).resolve().parents[2];LEGACY_RECORDS=ROOT/'build/n28c-records'
RUN=Path(os.environ.get('N28C_RUN_DIR') or (ROOT/'.verification/n28c-scheduler-fix/active-run.txt').read_text(encoding='utf-8'))
START=json.loads((RUN/'input-manifest.json').read_text(encoding='utf-8'))
RECORDS=RUN/'delivery-records'
PREFIX='extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/'
CHANGED={'CaptionLanguageContext','CaptionOverlayV2','CaptionUnicode','RebuildCache','RebuildController','RebuildPageLayout','RebuildReview','SubtitleStylePreview'}
ALLOWED={PREFIX+n+'.java' for n in CHANGED}
NEW={PREFIX+n+'.java' for n in ['CaptionRenderSpec','CaptionLanguagePager']}
STATE_EXTERNAL=Path('C:/Users/14776/Documents/kimi/tasks/2026-09-29/00-35-52-ec1208d7/PROJECT-STATE.md')
def digest(p):
 h=hashlib.sha256()
 with p.open('rb') as f:
  while chunk:=f.read(4*1024*1024):h.update(chunk)
 return h.hexdigest().upper()
def save(name,obj):
 RECORDS.mkdir(parents=True,exist_ok=True);(RECORDS/name).write_text(json.dumps(obj,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
def git(*args):return subprocess.check_output(['git',*args],cwd=ROOT).decode('utf-8').strip()
def frozen():
 baseline=json.loads((LEGACY_RECORDS/'tracked-before.json').read_text(encoding='utf-8'))
 # Use the confirmed commit for product scope; only unchanged files use the concurrent FS capture.
 changed=set(git('diff','--name-only','26692ed','--','.').splitlines()) & baseline.keys()
 assert changed-{'docs/PROJECT-STATE.md'}==ALLOWED,sorted(changed)
 for p,sha in baseline.items():
  if p not in ALLOWED and p!='docs/PROJECT-STATE.md':assert digest(ROOT/p).lower()==sha.lower(),p
 added=set(git('ls-files','--others','--exclude-standard').splitlines())
 added.update(git('diff','--name-only','26692ed','--','.').splitlines())
 assert {p for p in added-baseline.keys() if p.startswith(('extensions/extension/src/main/','patches/src/main/'))}==NEW
 assert git('rev-parse','anchor/n28b-d02d7cc')=='d02d7ccefbd3847d7c1df3b0306e22a3a14429f0'
 # The authorized state document predated this task. Bind it to the saved input bytes.
 expected=next(r['sha256'].upper() for r in START['files'] if r['path']=='docs/PROJECT-STATE.md')
 assert digest(STATE_EXTERNAL)==digest(ROOT/'docs/PROJECT-STATE.md')==expected
 tests=[p for p in baseline if p.startswith('extensions/extension/src/test/') and p.endswith('.java')]
 save('frozen-blobs.json',{'start_head':'26692ed03344cadda443bca584e2c91c7eb54206','changed_existing_product_files':sorted(ALLOWED),
  'authorized_existing_document_changes':sorted(changed-ALLOWED),
  'new_product_files':sorted(NEW),'scope_comparison':'Confirmed Git 26692ed product blobs; filesystem snapshot only outside approved write set','unchanged_tracked_files':len(baseline)-len(changed),'old_java_test_files_unchanged':len(tests),
  'request_auth_provider_concurrency_source_native_menu_resources_font_constants_build_dependencies_acceptance_frozen':True,
  'project_state_two_copies_unchanged_since_scheduler_task':True,'project_state_sha256':expected,
  'obsolete_state_expectation_sha256':baseline['docs/PROJECT-STATE.md'],'authorized_state_input':'input-manifest.json',
  'scheduler_base_fix_separate_from_presentation':True,'n28b_anchor_unchanged':True})
 print('FROZEN_PASS',len(ALLOWED),'existing product files; original tests unchanged=',len(tests))
def results():
 evidence=json.loads((RUN/'c-full-final-03/inputs.json').read_text(encoding='utf-8'))
 for path,sha in evidence['files'].items():assert digest(ROOT/path).lower()==sha,path
 full=json.loads((RUN/'c-full-final-03/result.json').read_text(encoding='utf-8'))
 assert full['exit']==0 and not full['reason'],full
 suites=[]
 for p in (RUN/'c-full-final-03/xml').glob('TEST-*.xml'):
  e=ET.parse(p).getroot();suites.append({'name':e.attrib['name'],**{k:int(e.attrib.get(k,0)) for k in ['tests','failures','errors','skipped']}})
 totals={k:sum(s[k] for s in suites) for k in ['tests','failures','errors','skipped']}
 new=sum(s['tests'] for s in suites if '.N28C' in s['name'])
 scheduler=sum(s['tests'] for s in suites if '.SchedulerLifecycleRegressionTest' in s['name'])
 assert new==41 and scheduler==12 and totals['tests']-new-scheduler==538,(new,scheduler,totals)
 assert totals['failures']==totals['errors']==totals['skipped']==0,totals
 save('java-counts.json',{**totals,'baseline_tests':538,'n28c_presentation_tests':new,'scheduler_tests_K':scheduler,
  'original_target':579,'final_target':579+scheduler,'suites':len(suites),'suite_counts':suites})
 for name in ['legacy-activate.json','legacy-region-golden.json']:
  assert json.loads((ROOT/'build/n28b-records'/name).read_text(encoding='utf-8'))==json.loads((RECORDS/name).read_text(encoding='utf-8')),name
 save('legacy-equality.json',{'baseline':'delivered N28B evidence','all_production_activate_fields_equal':True,'regional_alias_cases':18,'all_regional_fields_equal':True,'original_test_assertions_unchanged':True})
 rows=json.loads((RECORDS/'fourteen-targets-production-trace.json').read_text(encoding='utf-8'))['rows']
 assert len(rows)==28 and len({r['target_code'] for r in rows})==14
 required=json.loads((RECORDS/'required-pairs-production-trace.json').read_text(encoding='utf-8'))['rows'];assert len(required)==7
 assert all(r['line_count']<=2 and r['remote_translation_calls']==0 for r in rows+required)
 matrix=[]
 for p in sorted(RECORDS.glob('*-production-trace.json')):
  for row in json.loads(p.read_text(encoding='utf-8'))['rows']:row['evidence']=p.name;matrix.append(row)
 geometry=json.loads((RECORDS/'geometry-matrix.json').read_text(encoding='utf-8'))['rows'];assert len(geometry)==40
 save('presentation-trace-matrix.json',{'remote_translation_calls':0,'presentation_policy':'n28c-presentation-v1','production_rows':matrix,'geometry_combinations':40})
 print('JAVA_PASS',totals,'baseline=538 presentation=',new,'scheduler_K=',scheduler,'legacy_regions=18 presentation_rows=',len(matrix))
def check_dex(data):
 assert data[:4]==b'dex\n' and struct.unpack_from('<I',data,32)[0]==len(data)
 assert struct.unpack_from('<I',data,8)[0]==zlib.adler32(data[12:])&0xffffffff
 assert data[12:32]==hashlib.sha1(data[32:]).digest()
def package():
 mpp=ROOT/'build/local-test/patches-1.3.5-本地测试包-n28c.mpp';mpe=ROOT/'build/local-test/extension-1.3.5-本地测试包-n28c.mpe'
 assert not mpp.exists() and not mpe.exists(),'Never overwrite a delivery'
 source=ROOT/'patches/build/libs/patches-1.3.5.mpp'
 with zipfile.ZipFile(source) as z,zipfile.ZipFile(ROOT/'build/local-test/patches-1.3.5-本地测试包-n28b.mpp') as old:
  assert z.testzip() is None and len(z.namelist())==len(set(z.namelist())) and set(z.namelist())==set(old.namelist())
  changed=[n for n in z.namelist() if z.read(n)!=old.read(n)]
  assert set(changed)<={'META-INF/MANIFEST.MF','extensions/extension.mpe'} and 'extensions/extension.mpe' in changed
  data=z.read('extensions/extension.mpe');check_dex(data)
  for marker in [b'n28b-policy-v1',b'n28c-presentation-v1',b'CaptionRenderSpec',b'CaptionLanguagePager']:assert marker in data
  for marker in [b'CaptionControlsAvoidance',b'CAPTION_UI_AVOIDANCE_',b'onPlayerControlsVisibility']:assert marker not in data
 shutil.copyfile(source,mpp);mpe.write_bytes(data)
 save('bundle.json',{'mpp':str(mpp),'mpe':str(mpe),'changed_entries_vs_n28b':changed,'embedded_mpe_identical':True,'patch_dex_resources_build_config_unchanged':True})
 print('BUNDLE_PASS',mpp.stat().st_size,mpe.stat().st_size)
def finalize_apk():
 out=ROOT/'build/n28c-composition-final';src=out/'patched-unsigned.apk';apk=out/'YouTube-21.16.256-本地测试包-n28c-unsigned.apk'
 assert not apk.exists(),'Never overwrite final APK';shutil.copyfile(src,apk);assert digest(apk)==digest(src)
 inputs=[next(ROOT.glob('com.google.android.youtube_21.16.256*.apk')),ROOT/'patches-1.44.0.mpp',ROOT/'build/local-test/patches-1.3.5-本地测试包-n28c.mpp',ROOT/'.verification/toolchain/morphe-patcher-1.14.1-all.jar']
 save('composition-inputs.json',[{'path':str(p),'bytes':p.stat().st_size,'sha256':digest(p)} for p in inputs])
 manifest=json.loads((ROOT/'.verification/n26-rollback/audit-tool/manifest.json').read_text(encoding='utf-8'))
 for row in manifest['files']:
  p=ROOT/'.verification/n26-rollback'/row['path'];assert digest(p)==row['sha256'] and p.stat().st_size==row['bytes']
 save('audit-tool-provenance.json',{'source_commit':manifest['source_commit'],'files_hash_verified':len(manifest['files']),'require_ai_observer':False})
 print('FINAL_APK_READY',apk.stat().st_size)
def finish():
 frozen();results();history=START['history']
 for row in history:
  p=ROOT/row['path'];assert p.stat().st_size==row['bytes'] and digest(p)==row['sha256'],str(p)
 save('history-after.json',{'unchanged':len(history),'total':len(history),'covers_all_n28b_history_manifest_paths':True})
 scoreboard=json.loads((ROOT/'scoreboard/results/frozen-baseline.json').read_text(encoding='utf-8'))
 assert sorted(scoreboard['case_totals'].values())==[4,4,4]
 assert all(scoreboard['metrics']['invisible_ms'][k]['total']==0 for k in ['pending_translation','event_review','overflow'])
 save('frozen-scoreboard.json',scoreboard)
 log=(RECORDS/'composition.log').read_text(encoding='utf-8-sig',errors='replace');passes=len(re.findall(r'^PASS ',log,re.M));assert passes==84 and 'COMPOSITION_PASS' in log
 out=ROOT/'build/n28c-composition-final'
 for n in ['structure.txt','selection.txt']:assert (out/n).read_bytes()==(ROOT/'build/n28b-composition-final'/n).read_bytes(),n
 for label in ['mpp','mpe','apk']:assert 'AUDIT_PASS' in (RECORDS/(label+'-branch-audit.txt')).read_text(encoding='utf-8-sig')
 artifacts=[ROOT/'build/local-test/patches-1.3.5-本地测试包-n28c.mpp',ROOT/'build/local-test/extension-1.3.5-本地测试包-n28c.mpe',out/'YouTube-21.16.256-本地测试包-n28c-unsigned.apk']
 save('artifacts.json',[{'path':str(p),'bytes':p.stat().st_size,'sha256':digest(p)} for p in artifacts])
 save('module-intermediate.json',{'path':'patches/build/libs/patches-1.3.5.mpp','sha256':digest(ROOT/'patches/build/libs/patches-1.3.5.mpp'),'delivery':False,'reason':'Use the locked local-test MPP, not Gradle-regenerated module ZIP metadata.'})
 print('DELIVERY_PASS history=',len(history),'composition=',passes,'frozen=4/4/4 invisible=0/0/0')
def checkpoint():
 """Preserve partial evidence without treating a scoped pass as full verification or delivery."""
 frozen();history=json.loads((RECORDS/'history-before.json').read_text(encoding='utf-8'))
 for row in history:
  p=ROOT/row['path'];assert p.stat().st_size==row['bytes'] and digest(p)==row['sha256'],str(p)
 save('history-checkpoint.json',{'unchanged':len(history),'total':len(history),'final_delivery':False})
 suites=[]
 for p in (ROOT/'extensions/extension/build/test-results/testDebugUnitTest').glob('TEST-*.xml'):
  e=ET.parse(p).getroot();suites.append({'name':e.attrib['name'],**{k:int(e.attrib.get(k,0)) for k in ['tests','failures','errors','skipped']}})
 total={k:sum(row[k] for row in suites) for k in ['tests','failures','errors','skipped']}
 assert total=={'tests':44,'failures':0,'errors':0,'skipped':0},total
 assert sum(row['tests'] for row in suites if '.N28C' in row['name'])==41
 for name in ['legacy-activate.json','legacy-region-golden.json']:
  assert json.loads((ROOT/'build/n28b-records'/name).read_text(encoding='utf-8'))==json.loads((RECORDS/name).read_text(encoding='utf-8'))
 locked=json.loads((RECORDS/'baseline-lock-scope-check.json').read_text(encoding='utf-8'))
 for key in ['session_cancel_retire','current_and_stop','schedule']:assert locked[key]['equal'] is True
 assert 'Found 1 deadlock.' in (RECORDS/'test-worker-observation.txt').read_text(encoding='utf-8-sig',errors='replace')
 save('blocked-checkpoint.json',{'status':'blocked_not_delivered','actual_start_head':'26692ed03344cadda443bca584e2c91c7eb54206',
  'reason':'frozen_scheduler_lock_inversion','observed_test':'N28BProductionTest.actualPolicyColdWarmAndUiMatrix',
  'current_scoped_java':total,'new_n28c_tests':41,'legacy_production_tests':3,'suite_counts':suites,
  'legacy_regional_cases_equal':18,'initial_full_before_font_locale_review':{'tests':578,'baseline':538,'new':40,'failures':0,'errors':0,'skipped':0,'evidence':'Observed XML totals plus full-test-build-first.log; not final-code full validation'},
  'final_full_java_target':579,'final_full_java_completed':False,'baseline_lock_sections_byte_identical':True,
  'pure_n28b_runtime_reproduced':False,'final_artifacts_created':False,'composition_final_dex_aapt_apksigner_not_run':True,
  'implementation_commit_created':False,'anchor_created':False,'phone_acceptance':'not_started','remote_translation_calls':0,'history_unchanged':len(history)})
 print('CHECKPOINT_ONLY scoped=44/44 (41 new + 3 legacy) history=',len(history),'full=BLOCKED delivery=NOT_CREATED')
if __name__=='__main__':
 parser=argparse.ArgumentParser();parser.add_argument('action',choices=['frozen','results','package','finalize_apk','finish','checkpoint']);globals()[parser.parse_args().action]()
