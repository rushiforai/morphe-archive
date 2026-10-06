"""N30 permitted UI dispatch changes do not unfreeze publication or owner authority."""
from pathlib import Path
import hashlib,json,subprocess,importlib.util,sys
sys.dont_write_bytecode=True
R=Path(__file__).resolve().parents[2];O=R/'.verification/n30/delivery-records'
spec=importlib.util.spec_from_file_location('locks',R/'tools/n28c-r1/audit_scheduler_locks.py');mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
def baseline(p):return subprocess.check_output(['git','show','3eefe00:'+p],cwd=R).decode('utf-8')
p='extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/RebuildController.java'
_,before=mod.monitors(baseline(p));_,after=mod.monitors((R/p).read_text(encoding='utf-8'))
base={m['name']:m['source'] for m in before};curr={m['name']:m['source'] for m in after}
allowed={'onRequestBodySent','load','restoreCandidate','restoreCandidates','schedule','translate'}
changed=[n for n in base if base[n]!=curr.get(n)];assert set(changed)<=allowed,changed
frozen=['requestRetirement','requestCleanup','cleanup','awaitRetirement','cancel','retire','current','stop','video','activate','time','restore','render','player']
for n in frozen:assert base[n]==curr[n],n
files=subprocess.check_output(['git','ls-files','-z'],cwd=R).decode().split('\0')
protected=[p for p in files if p and (p=='ACCEPTANCE.md' or p.startswith('scoreboard/') or p.endswith(('RebuildCache.java','RebuildProtocol.java','RebuildReview.java','RebuildPageLayout.java','CaptionRenderSpec.java','CaptionFontSize.java','SubtitleStyleMetrics.java')))]
for p in protected:assert (R/p).read_text(encoding='utf-8').replace('\r\n','\n')==baseline(p).replace('\r\n','\n'),p
out={'controller_changed_methods':changed,'frozen_owner_and_cas_methods_exact':frozen,'protected_files':protected,'r1_publication_permit_cas_unchanged':True,'scope':'N30 cache-only admission, transport diagnostics, generic source ownership cuts and authorized UI dispatch'}
O.mkdir(parents=True,exist_ok=True);(O/'scope-proof.json').write_text(json.dumps(out,indent=2)+'\n',encoding='utf-8');print('N30_SCOPE_PROOF_PASS',changed)
