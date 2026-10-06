from pathlib import Path
import hashlib,json,re,subprocess
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.verification/n34'
BASE='b52b65b7a206f1a07464dae62dc30cabc164bf10'
ALLOWED={'RebuildPageLayout.java','CaptionLanguagePager.java','CaptionRenderSpec.java','RebuildDisplayMerge.java','RebuildController.java','CaptionOverlayV2.java','RebuildReview.java','RebuildSource.java','CaptionDocument.java','RawCaptionSource.java','CaptionDiagnostics.java','WebVttSourceReader.java'}
before=json.loads((OUT/'pre-edit-source.json').read_text(encoding='utf-8'))
protected=[]
for original_path,want in before.items():
 p=original_path.replace("\\","/")
 if p.startswith('extensions/extension/src/main/') and Path(p).name not in ALLOWED or p.startswith(('patches/src/','localization/','scoreboard/')) or p=='ACCEPTANCE.md':
  actual=hashlib.sha256((ROOT/p).read_bytes()).hexdigest().upper();assert actual==want['sha256'],p;protected.append(p)
# Controller Session and scheduling/publication machinery are byte-identical after LF normalization.
p='extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/RebuildController.java'
a=subprocess.check_output(['git','show',BASE+':'+p],cwd=ROOT).decode();b=(ROOT/p).read_text(encoding='utf-8')
anchors=[('  static final class Session {','  private static final class Notice'),('  private static void scheduleTick()','  private static void tick()'),('  private static void kick(Session s)','  private static CaptionDocument.Cue originalCue')]
exact=[]
for start,end in anchors:
 if start in a and end in a:
  old=a[a.index(start):a.index(end)];new=b[b.index(start):b.index(end)]
  # Only permitted source precision/format trace metadata differs inside loading.
  old=old.replace('source = source.align(RebuildSource.read(ref.body, ref.document));','source = source.align(RebuildSource.read(ref.body, ref.document),\n                detail->CaptionDiagnostics.mark(s.context,"REBUILD_SOURCE_ALIGNMENT","session="+s.id+";"+detail));').replace('+ source.coarseCueCount);','+ source.coarseCueCount+";"+source.precisionEvidence());')
  assert old==new,start;exact.append(start)
assert 'CaptionUiLocale' not in b and 'StaticLayout' not in b
assert not any(x in (ROOT/'extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/WebVttSourceReader.java').read_text(encoding='utf-8') for x in ['ngPkbaZliaU','169','1260','10ms'])
changes=subprocess.check_output(['git','diff','--name-only',BASE,'--','extensions/extension/src/test'],cwd=ROOT).decode().splitlines()
(OUT/'scope-audit.json').write_text(json.dumps({'status':'PASS','protected_paths_byte_equal':protected,'controller_regions_lf_equal_except_source_trace':exact,'old_tests_changed':changes,'presentation_cache_policy_unchanged':True,'new_presentation_revision_diagnostic_only':True},ensure_ascii=False,indent=2),encoding='utf-8')
print('SCOPE_PASS',len(protected),'protected paths;',len(exact),'controller regions')
