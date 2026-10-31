"""Pinned Braccato event bookkeeping only; preserve upstream visual motion exactly."""
from pathlib import Path
import hashlib,json
root=Path(__file__).resolve().parent
p=root/'node_modules/@braccato/core/dist/engine.js';data=p.read_bytes()
upstream='a3abca4640ef83edd4c5d2b34e7efb221e439365a24005051e34f92851c1f834'
clamp_old=b'    if (engine.skipScrolls < 1) {\n        engine.skipScrolls = 1;\n    }'
clamp_new=b'    if (engine.skipScrolls < 0) {\n        engine.skipScrolls = 0;\n    }'
count_old=b'                engine.skipScrolls += 1;\n                engine.skipScrollsDecayTimes.push(Date.now() + 2000);'
count_new=b'                engine.skipScrolls = 1;\n                engine.skipScrollsDecayTimes = [Date.now() + 2000];'
force_old=b'export function noteUserScroll(engine, isPassive) {'
force_new=force_old.replace(b') {',b', userInitiated = false) {\n    if (userInitiated) { engine.skipScrolls = 0; engine.skipScrollsDecayTimes = []; }')
scroll_old=b'''                tabRenderer.scrollTop = scrollTop;
                engine.skipScrolls += 1;
                engine.skipScrollsDecayTimes.push(Date.now() + 2000);'''
scroll_previous=b'''                if (typeof tabRenderer.__bdScrollTo === "function") {
                    tabRenderer.__bdScrollTo(scrollTop);
                } else {
                    tabRenderer.scrollTop = scrollTop;
                    engine.skipScrolls += 1;
                    engine.skipScrollsDecayTimes.push(Date.now() + 2000);
                }'''
for before,after in [(scroll_old,scroll_previous),(clamp_old,clamp_new),(count_old,count_new),(force_old,force_new)]:
 if after in data:data=data.replace(after,before)
assert hashlib.sha256(data).hexdigest()==upstream,'Unexpected Braccato engine input'
for before,after in [(clamp_old,clamp_new),(count_old,count_new),(force_old,force_new)]:
 assert data.count(before)==1;data=data.replace(before,after)
p.write_bytes(data)
r=root/'node_modules/@braccato/core/dist/renderer.js';renderer=r.read_bytes()
renderer_old=b'''        noteUserScroll() {
            if (isDestroyed)
                return;
            noteEngineUserScroll(engine, hasUnsyncedLyrics(engine));'''
renderer_new=renderer_old.replace(b'noteUserScroll()',b'noteUserScroll(userInitiated = false)').replace(b'hasUnsyncedLyrics(engine));',b'hasUnsyncedLyrics(engine), userInitiated);')
renderer=renderer.replace(renderer_new,renderer_old)
renderer_upstream='6c695c762dafcf6c66acc6dabf088f5f43f0b048eff0ae95516c7a3267170575'
assert hashlib.sha256(renderer).hexdigest()==renderer_upstream and renderer.count(renderer_old)==1,'Unexpected Braccato renderer input'
renderer=renderer.replace(renderer_old,renderer_new);r.write_bytes(renderer)
receipt={'package':'@braccato/core','version':'1.16.11','file':'dist/engine.js','upstreamSha256':upstream,'patchedSha256':hashlib.sha256(data).hexdigest(),'rendererUpstreamSha256':renderer_upstream,'rendererPatchedSha256':hashlib.sha256(renderer).hexdigest(),'change':'Exact upstream per-line scroll transforms, duration, stagger and easing; only clamp/coalesce expected scroll events and distinguish explicit user input. No alternate viewport animation.'}
(root/'braccato-local-patch.json').write_text(json.dumps(receipt,indent=2)+'\n',encoding='utf-8')
print('Verified pinned Braccato event bookkeeping; upstream visual motion retained')
