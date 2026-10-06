"""N37 delivery gate: reviewed source identities and actual tool results, never directory existence alone."""
from pathlib import Path
import argparse,hashlib,json,re,subprocess,zipfile,xml.etree.ElementTree as ET
ROOT=Path(__file__).resolve().parents[2];E=ROOT/'.verification/n37'
def sha(p):
 with Path(p).open('rb') as stream:return hashlib.file_digest(stream,'sha256').hexdigest().upper()
def load(p):return json.loads(Path(p).read_text(encoding='utf-8-sig'))
def text(p):return Path(p).read_text(encoding='utf-8-sig',errors='replace')
def checked_log(p,marker):
 value=text(p);assert marker in value and 'BUILD FAILED' not in value,(p,marker)
 return {'path':str(p),'sha256':sha(p),'marker':marker}
def class_names(data):
 import struct
 assert data[:4]==b'dex\n'
 def string(i):
  p=struct.unpack_from('<I',data,struct.unpack_from('<I',data,60)[0]+i*4)[0]
  while data[p]&128:p+=1
  p+=1;return data[p:data.index(b'\0',p)].decode('utf-8','replace')
 tc,to=struct.unpack_from('<II',data,64);cc,co=struct.unpack_from('<II',data,96)
 return {string(struct.unpack_from('<I',data,to+4*struct.unpack_from('<I',data,co+32*i)[0])[0]) for i in range(cc)}
def case_set(directory):
 return {(r.attrib['classname'],r.attrib['name']) for p in directory.glob('TEST-*.xml') for r in ET.parse(p).getroot().iter('testcase')}
def methods(path):
 out={};owner=None;key=None
 for line in text(path).splitlines():
  if line.startswith('CLASS '):owner=line.split()[1];key=None
  elif line.startswith('METHOD '):key=owner+' '+line;out[key]=[]
  elif key and not line.startswith('FIELD '):out[key].append(line)
 return out

def main():
 parser=argparse.ArgumentParser();parser.add_argument('--source-commit');args=parser.parse_args()
 run=load(E/'full-04/result.json');assert run['exit']==0 and not run['reason']
 assert run['totals']=={'tests':727,'failures':0,'errors':0,'skipped':0},run['totals']
 totals={k:0 for k in run['totals']}
 for p in (E/'full-04/xml').glob('TEST-*.xml'):
  root=ET.parse(p).getroot()
  for k in totals:totals[k]+=int(root.attrib.get(k,0))
 assert totals==run['totals'];before=case_set(ROOT/'.verification/n36/full-delivered-01/xml');after=case_set(E/'full-04/xml')
 assert len(before)==716 and len(after)==727 and not before-after,(len(before),len(after),before-after)
 inputs=load(E/'full-04/inputs.json')
 assert inputs['input_sha']==run['input_sha']
 assert all(sha(ROOT/name).lower()==expected.lower() for name,expected in inputs['files'].items()),'Final test source changed'
 build=load(E/'build-candidate-04-inputs.json')
 assert all(sha(ROOT/name).lower()==expected.lower() for name,expected in build.items()),'Final build source changed'
 build_status=load(E/'build-candidate-04-status.json');composition_status=load(E/'composition-candidate-04-status.json')
 assert build_status['exit']==composition_status['exit']==0
 composition=[checked_log(E/'composition-ai-only-01.log','STRUCTURE_PASS AI caption translator'),
  checked_log(E/'composition-remember-only-02.log','STRUCTURE_PASS Remember caption selection'),
  checked_log(E/'composition-candidate-04.log','COMPOSITION_PASS AI caption translator, Remember caption selection')]
 for row in composition:assert 'BUILD SUCCESSFUL' in text(row['path'])
 candidate=load(E/'artifacts-candidate-04.json');artifacts=candidate['artifacts']
 for item in artifacts:assert Path(item['path']).stat().st_size==item['bytes'] and sha(item['path'])==item['sha256']
 mpp,mpe,apk=[Path(item['path']) for item in artifacts]
 for p in [mpp,apk]:
  with zipfile.ZipFile(p) as z:assert z.testzip() is None
 with zipfile.ZipFile(mpp) as z:assert z.read('extensions/extension.mpe')==mpe.read_bytes()
 own=class_names(mpe.read_bytes());assert not any(n.startswith(('Lapp/morphe/','Ln36/','Ln37/','Lvalidation/')) for n in own)
 with zipfile.ZipFile(apk) as z:
  dexes={n:z.read(n) for n in z.namelist() if re.fullmatch(r'classes\d*\.dex',n)};assert len(dexes)==11
  classes=set().union(*(class_names(data) for data in dexes.values()))
  assert not any(n.startswith(('Ln36/','Ln37/','Lvalidation/')) for n in classes)
  assert {'Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticSnapshot;','Lapp/yydarlinker/deepseekcaptions/RebuildClock$Observation;'}<=classes
 audits=[]
 for kind in ['apk','mpp','mpe']:
  report=E/(kind+'-branch-audit-03.txt');log=E/(kind+'-branch-audit-03.log');s=text(report)
  assert 'DEX_BRANCH_AUDIT_PASS' in s and 'invalid_branches=0' in s and 'dex_problems=0' in s and 'binding_failures=0' in s
  assert 'BUILD SUCCESSFUL' in text(log) and 'BUILD FAILED' not in text(log)
  if kind=='apk':
   checks=re.findall(r'^DEX dex=.*!([^ ]+) sha256=([0-9a-f]+)',s,re.M)
   assert len(checks)==11
   for name,digest in checks:assert hashlib.sha256(dexes[name]).hexdigest()==digest
  audits.append({'kind':kind,'report_sha256':sha(report),'log_sha256':sha(log),'exit':0,'n27_observer_required':False})
 assert 'DOES NOT VERIFY' in text(E/'unsigned-01.log') and 'Missing META-INF/MANIFEST.MF' in text(E/'unsigned-01.log')
 assert 'Ran 27 tests' in text(E/'python-scoreboard-01.log') and re.search(r'^OK\s*$',text(E/'python-scoreboard-01.log'),re.M)
 assert 'Ran 11 tests' in text(E/'release-contract-01.log') and re.search(r'^OK\s*$',text(E/'release-contract-01.log'),re.M)
 catalog=load(ROOT/'localization/catalog.json');keys=set(catalog['keys']);assert len(keys)==241 and len(catalog['languages'])==14
 for locale,values in catalog['languages'].items():
  assert set(values)==keys
  folder='values' if locale=='en' else 'values-'+{'id':'in'}.get(locale,locale)
  with zipfile.ZipFile(mpp) as z:root=ET.fromstring(z.read('captionlocales/'+folder+'/caption_addon_strings.xml'))
  assert {row.attrib['name'] for row in root}=={'cap_'+key for key in keys}
 resource=load(E/'resources-02/apk-structure.json');assert resource['crc'] and resource['root_dex_count']==11 and resource['settings_xml_new_key']==3 and resource['preview_hint_in_resources']==14
 checked_log(E/'official-inspect-final.log','N33_INSPECTED')
 original=methods(ROOT/'.verification/n33/final-official-methods-complete.txt');current=methods(E/'official-methods-final.txt')
 assert original and original==current,'Official settings methods changed'
 native=load(E/'android-input-candidate-09-detail.json');lane=native['input']
 assert native['sdk']==35 and lane['scroll_recycle_reopen'] and lane['profile_switch_roundtrip']
 assert len(lane['fields'])==4
 for row in lane['fields']:
  assert row['field_id']==row['served_id']
  for flag in ['compose_visible_in_view','delete_visible_in_view','ascii_visible_in_view','paste_visible_in_view','refocus_text_preserved','saved_value_matches']:assert row[flag],(row['key'],flag)
 assert native['ime_ops'] and all(op['ime_pid']!=op['host_pid'] for op in native['ime_ops'])
 assert 'result=PASS' in text(E/'android-input-candidate-09.log') and 'INSTRUMENTATION_CODE: -1' in text(E/'android-input-candidate-09.log')
 provenance=load(E/'host-candidate-09/provenance.json');assert provenance['input_sha256'].upper()==artifacts[2]['sha256']
 matrix=load(E/'android-matrix-01/result.json');assert len(matrix)==12
 assert all(r['instrumentation_pass'] and r['boundary_crossed'] and r['dataset_changes']==0 for r in matrix)
 for r in matrix:
  before_c,after_c=r['viewport_before'],r['viewport_after'];assert before_c[0]==after_c[0] and before_c[1]==after_c[1]
 backlog=load(E/'android-matrix-01/backlog.json')['deep_scroll'];assert backlog['archive_blocked_during_gestures'] and backlog['blocked_ms']>=5000
 ui_old=load(E/'build-candidate-03-inputs.json');changed={name for name in build if build[name]!=ui_old.get(name)}
 expected={str(Path('extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions')/n) for n in ['DeepSeekCaptionHook.java','DeepSeekCaptionHookV2.java']}
 assert changed==expected,('UI evidence reuse only permits the player hook seam change',changed)
 ledger=load(E/'full-04/n37-original-n24-request-identities.json');assert (ledger['focus'],ledger['prefetch'],ledger['total'])==(2,2,4)
 received=[r for r in ledger['ledger'] if r['phase']=='received'];assert len(received)==len({r['requestID'] for r in received})==len({r['block'] for r in received})==4
 frozen=load(E/'frozen-01.json');assert frozen['case_totals']=={'通过':4,'失败':4,'未验证':4} and all(x['total']==0 for x in frozen['metrics']['invisible_ms'].values())
 baseline=load(E/'baseline-identity.json');assert baseline['state_copies_equal'] and all(row['pass'] for row in baseline['checks'])
 protected=['ACCEPTANCE.md','scoreboard','gradle.properties','settings.gradle.kts','extensions/extension/build.gradle.kts']
 assert not subprocess.check_output(['git','diff','6319fd6','--',*protected],cwd=ROOT)
 if args.source_commit:
  assert subprocess.check_output(['git','rev-parse',args.source_commit],cwd=ROOT,text=True).strip()==args.source_commit
  assert not subprocess.check_output(['git','diff',args.source_commit,'--','extensions/extension/src','patches/src/main','localization'],cwd=ROOT)
 report={'status':'PASS','source_commit':args.source_commit,'artifacts':artifacts,'test_input_sha':run['input_sha'],'tests':totals,'retained_n36_cases':len(before),'new_cases':len(after-before),'build_input_digest':candidate['input_digest'],
  'composition':composition,'dex_audits':audits,'official_methods_unchanged':len(original),'localization_keys':len(keys),'localization_pairs':len(keys)*14,'root_dexes':11,
  'native_ime_commands':len(native['ime_ops']),'native_profile_roundtrip':True,'native_matrix_cases':len(matrix),'native_backlog_ms':backlog['blocked_ms'],
  'ui_evidence_reuse_only_changed_player_hooks':sorted(changed),'frozen_counts':frozen['case_totals'],'physical_phone_written':False,'formal_apk_unsigned':True}
 (E/'final-checks.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
 print(json.dumps({k:v for k,v in report.items() if k not in ['artifacts','composition','dex_audits']},ensure_ascii=False,indent=2))
if __name__=='__main__':main()
