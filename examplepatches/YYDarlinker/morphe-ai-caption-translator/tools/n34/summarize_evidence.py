"""Read-only N34 evidence summary and explicit old-assertion change record."""
from pathlib import Path
import json,subprocess,hashlib
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.verification/n34'
reasons={
 'N28CGeometryTest.java':'Chinese target soft CPS cannot independently blank a complete fitting short owned page; true geometry and full text remain required.',
 'N30ConnectionFailureTest.java':'Diagnostic build marker changes from n33 to n34; transport failure and retry semantics are unchanged.',
 'RebuildA07VisibilityTest.java':'layout_overflow is display advisory, not semantic withholding; polarity/arithmetic/subject hard refusals remain.',
 'RebuildContractTest.java':'Already NATIVE source must stay byte/time-identical; alignment fixture now uses ESTIMATED left evidence while preserving original 100ms/ALIGNED assertions.',
 'RebuildDisplayMergeTest.java':'Ready lead may not disappear for merge preference; source adjacency and union candidate ownership assertions remain.',
 'RebuildIntegrationTest.java':'Accepted late body in a valid owned window is visible rather than continuing waiting; its own end and source fallback exclusion remain.',
 'RebuildLayoutTest.java':'CPS-fit caption no longer replaced with source; owned true-capacity refusal stays blank; PRESENTED occurs after final view decision and records ui_applied visibility.',
 'RebuildN15PagingStyleTest.java':'Only old hard CPS/short-window deletion expectations change; correct preferred cut/style plans and >=1200ms multipage conditions remain.',
 'RebuildN3PaginationTest.java':'An entire fitting 886ms owned page is allowed; insufficient capacity and borrowed-time negatives remain unchanged.',
 'RebuildR212EvidenceTest.java':'Pure layout cannot buy semantic repair; an explicit polarity-risk plan retains hard refusal and bounded repair-at-end assertions.'}
changes=[]
for name,reason in reasons.items():
 path='extensions/extension/src/test/java/app/yydarlinker/deepseekcaptions/'+name
 diff=subprocess.check_output(['git','diff','b52b65b','--',path],cwd=ROOT).decode('utf-8')
 assert diff,path
 changes.append({'path':path,'basis':reason,'exact_diff':diff})
(OUT/'old-assertion-changes.json').write_text(json.dumps(changes,ensure_ascii=False,indent=2),encoding='utf-8')
summary={}
for key,path in [('history','historical-after.json'),('scope','scope-audit.json'),('final_serialized','final-serialized-checks-03.json'),('full','full-final-06/result.json'),('local_replay','actual-response-replay-04/result.json')]:
 p=OUT/path
 if p.exists():summary[key]=json.loads(p.read_text(encoding='utf-8'))
summary['old_assertion_change_files']=len(changes)
(OUT/'final-evidence-summary.json').write_text(json.dumps(summary,ensure_ascii=False,indent=2),encoding='utf-8')
print('EVIDENCE_SUMMARY',sorted(summary),'old assertion files',len(changes))
