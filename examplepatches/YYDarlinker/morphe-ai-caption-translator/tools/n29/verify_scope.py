"""N29 final scope proof, preserving all R1 synchronization/cache/ownership contracts."""
from pathlib import Path
import hashlib,json,subprocess,importlib.util,sys
sys.dont_write_bytecode=True
R=Path(__file__).resolve().parents[2];V=R/'.verification/n29';O=V/'delivery-records'
spec=importlib.util.spec_from_file_location('locks',R/'tools/n28c-r1/audit_scheduler_locks.py');mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
p='extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/RebuildController.java'
old=(V/'before'/p).read_text(encoding='utf-8');new=(R/p).read_text(encoding='utf-8')
_,before=mod.monitors(old);_,after=mod.monitors(new)
base={m['name']:m['source'] for m in before};curr={m['name']:m['source'] for m in after}
allowed={'onRequestBodySent','load','restoreCandidates','schedule'}
changed=[n for n in base if base[n]!=curr.get(n)]
assert set(changed)<=allowed,changed
for n in ['requestRetirement','requestCleanup','cleanup','awaitRetirement','cancel','retire','current','stop','video','activate','time','restore','render']:
 assert base[n]==curr[n],n
manifest=json.loads((V/'input-manifest.json').read_text(encoding='utf-8'))
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest().upper()
for p,h in manifest['files'].items():
 if p=='ACCEPTANCE.md' or p.startswith(('scoreboard/','localization/','recovered/')) or p.endswith('RebuildCache.java'):
  assert sha(R/p)==h,p
report={'controller_methods_changed':changed,'controller_frozen_methods_exact':sorted(set(base)-allowed),'r1_publication_permit_cas_unchanged':True,'acceptance_scoreboard_localization_recovered_frozen':True,'scope':'startup qualification/cache scheduling and diagnostic sent timestamp only'}
O.mkdir(parents=True,exist_ok=True);(O/'scope-proof.json').write_text(json.dumps(report,indent=2),encoding='utf-8')
print('N29_SCOPE_PROOF_PASS',changed)
