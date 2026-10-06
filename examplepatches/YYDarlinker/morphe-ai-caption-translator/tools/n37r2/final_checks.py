"""Fail-closed source/build/test/native/delivery binding; never treats a directory as a pass."""
from pathlib import Path
import argparse,hashlib,json,re,subprocess,sys,zipfile,xml.etree.ElementTree as ET
ROOT=Path(__file__).resolve().parents[2];sys.path.insert(0,str(ROOT))
from tools.n34.final_checks import class_names,method_dump
E=ROOT/'.verification/n37r2';BASE='3c36bf4d0e3ebd499fc5f21e68a1f34e4f111ff5'
def load(p):return json.loads(p.read_text(encoding='utf-8-sig'))
def sha(p):return hashlib.file_digest(p.open('rb'),'sha256').hexdigest()
def ids(folder):return {(r.attrib['classname'],r.attrib['name']) for p in folder.glob('TEST-*.xml') for r in ET.parse(p).getroot().findall('testcase')}
def git(*args):return subprocess.check_output(['git',*args],cwd=ROOT)
def main():
 parser=argparse.ArgumentParser();parser.add_argument('--source-commit',required=True);args=parser.parse_args()
 assert git('rev-parse',args.source_commit).decode().strip()==args.source_commit
 run=load(E/'full-01/result.json');assert run['exit']==0 and run['totals']==dict(tests=750,failures=0,errors=0,skipped=0)
 before=ids(ROOT/'.verification/n37/full-04/xml');after=ids(E/'full-01/xml');assert len(before)==727 and before<=after and len(after-before)==23
 for name,want in load(E/'full-01/inputs.json')['files'].items():assert sha(ROOT/name)==want,('test source drift',name)
 baseline=load(ROOT/'.verification/n37/full-04/inputs.json')['files'];product_prefix='extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/'
 allowed={product_prefix+n for n in ['CaptionOverlayV2.java','CaptionHorizontalPlacement.java','CaptionSurface.java','RebuildController.java']}
 changed=set()
 for name,want in baseline.items():
  norm=name.replace('\\','/')
  if sha(ROOT/name)!=want:changed.add(norm);assert norm in allowed,('unapproved baseline change',name)
 assert changed==allowed-{product_prefix+'CaptionHorizontalPlacement.java'}
 for name in ['CaptionSurface.java','RebuildController.java']:
  path=product_prefix+name;source=(ROOT/path).read_text(encoding='utf-8');old=git('show',BASE+':'+path).decode()
  if name=='RebuildController.java':source=source.replace('      public String session(){return Long.toString(s.id);}\n','')
  else:source=source.replace('  /** Read-only direction evidence from the current cached player; never triggers discovery. */\n  static int playerLayoutDirection() {\n    View p=player.get();return p==null ? View.LAYOUT_DIRECTION_INHERIT : p.getLayoutDirection();\n  }\n\n','')
  assert source==old,('non-diagnostic change',path)
 protected=['README.md','gradle.properties','settings.gradle.kts','patches/src','localization','scoreboard','ACCEPTANCE.md','patches-bundle.json','patches-list.json','.github','package.json','package-lock.json','extensions/extension/build.gradle.kts']
 assert not git('diff',BASE,'--',*protected),'Protected source or metadata changed'
 assert not git('diff',args.source_commit,'--','extensions/extension/src/main','patches/src','localization'),'Commit source mismatch'
 candidate=load(E/'artifacts-candidate-01.json');items=candidate['artifacts'];assert len(items)==3
 for row in items:
  p=Path(row['path']);assert p.stat().st_size==row['bytes'] and sha(p).upper()==row['sha256']
 for name,want in load(E/'build-candidate-01-inputs.json').items():assert sha(ROOT/name)==want,('build source drift',name)
 mpp,mpe,apk=[Path(row['path']) for row in items]
 with zipfile.ZipFile(mpp) as z:assert z.read('extensions/extension.mpe')==mpe.read_bytes()
 own=class_names(mpe.read_bytes());assert 'Lapp/yydarlinker/deepseekcaptions/CaptionHorizontalPlacement;' in own
 assert not any(n.startswith(('Lapp/morphe/','Ln36/','Ln37/','Lvalidation/')) for n in own)
 for k in ['player_type','app_layout_direction','caption_text_direction','caption_outer_layout_direction','video_rect','caption_outer_rect','expected_center_x','actual_center_x','center_error_px','session','owner_epoch','render_epoch']:assert (k+'=').encode() in mpe.read_bytes(),k
 for kind in ['apk','mpp','mpe']:
  report=(E/f'audit-candidate-01-{kind}.txt').read_text(encoding='utf-8');assert 'DEX_BRANCH_AUDIT_PASS' in report and 'FAIL ' not in report
 current=method_dump(E/'official-methods-candidate-01.txt');previous=method_dump(ROOT/'.verification/n37/official-methods-final.txt');assert len(current)==len(previous)==39 and current==previous
 assert 'DOES NOT VERIFY' in (E/'unsigned-candidate-01.log').read_text(encoding='utf-8-sig')
 for name in ['ai-only','remember-only']:
  log=(E/f'composition-{name}.log').read_text(encoding='utf-8-sig');assert 'STRUCTURE_PASS' in log and 'BUILD SUCCESSFUL' in log
 log=(E/'composition-candidate-01.log').read_text(encoding='utf-8');assert 'COMPOSITION_PASS' in log
 resources=load(E/'resources-02/apk-structure.json');assert resources['crc'] and resources['root_dex_count']==11 and resources['signature_files']==[]
 assert load(E/'resources-02/n37r2-scope-and-localization.json')['placeholder_pairs']==3374
 assert load(E/'python-status.json')=={'scoreboard_exit':0,'release_exit':0}
 assert 'Ran 27 tests' in (E/'python-scoreboard-01.log').read_text(encoding='utf-8-sig') and 'Ran 11 tests' in (E/'release-contract-01.log').read_text(encoding='utf-8-sig')
 api=load(E/'api-audit.json');assert api['status']=='PASS' and api['max_since']<=28
 native=load(E/'native-01/summary.json');assert native['status']=='PASS' and native['observations']==86 and native['max_center_error_px']<=1 and not native['physical_phone_written']
 diagnostics=load(E/'native-01/diagnostic-checks.json');assert diagnostics['status']=='PASS' and diagnostics['sessions_covered']==86 and diagnostics['all_required_fields_per_record']
 provenance=load(E/'host-candidate-01/provenance.json');assert provenance['input_sha256'].upper()==items[2]['sha256']
 before=load(E/'before-03/result.json');assert before['totals']['tests']==14 and before['totals']['failures']==11
 summary={'status':'PASS','source_commit':args.source_commit,'baseline':BASE,'tests':run['totals'],'retained_n37_tests':727,'new_tests':23,'native':native,'diagnostics':diagnostics,'api':api,'artifacts':items,'official_methods_unchanged':39,'localization_pairs':3374,'embedded_mpe_identical':True,'formal_apk_unsigned':True,'physical_phone_after':'pending user validation','physical_phone_written':False,'source_paths_changed':sorted(allowed),'timing_pagination_authority_unchanged':True}
 (E/'final-checks.json').write_text(json.dumps(summary,ensure_ascii=False,indent=2)+'\n',encoding='utf-8');print(json.dumps(summary,ensure_ascii=False,indent=2))
if __name__=='__main__':main()
