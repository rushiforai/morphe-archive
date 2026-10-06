"""Temporarily compile exact N28A product blobs, run the same regional golden, always restore N28B.
Only this checkout is used. No abandoned N28 sources, fixtures, dependencies or outputs are read.
New policy-only test classes are temporarily excluded; old fixture assertions stay unchanged.
"""
from pathlib import Path
import os, subprocess
ROOT=Path(__file__).resolve().parents[2]
PREFIX='extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/'
FILES=['CaptionLanguageContext','DeepSeekConfig','RebuildApi','RebuildCache','RebuildController',
       'RebuildNumbers','RebuildPlanner','RebuildProtocol','RebuildReview','RebuildSemantics']
records=ROOT/'build/n28b-records/baseline';records.mkdir(parents=True,exist_ok=True)
assert not (records/'legacy-region-golden.json').exists(),'Never overwrite the recorded golden baseline'
backups={ROOT/(PREFIX+n+'.java'):(ROOT/(PREFIX+n+'.java')).read_bytes() for n in FILES}
test_root=ROOT/'extensions/extension/src/test/java/app/yydarlinker/deepseekcaptions'
for name in ['RebuildIntegrationTest','NativeRendererN23Test']:
    p=test_root/(name+'.java');backups[p]=p.read_bytes()
excluded={}
temporary=ROOT/'.tmp/n28b-baseline-tests';temporary.mkdir(parents=True,exist_ok=True)
env=os.environ.copy();env['JAVA_HOME']=r'E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1'
env['PATH']=env['JAVA_HOME']+r'\bin;'+env['PATH'];env['N28B_EVIDENCE_DIR']=str(records)
try:
    for name in ['N28BPolicyTest','N28BProductionTest']:
        p=test_root/(name+'.java')
        if p.exists():
            dest=temporary/p.name;assert not dest.exists()
            assert dest.resolve().is_relative_to(ROOT.resolve()) and p.resolve().is_relative_to(ROOT.resolve())
            p.rename(dest);excluded[p]=dest
    for p in backups:
        blob=subprocess.check_output(['git','show','d683e59:'+p.relative_to(ROOT).as_posix()],cwd=ROOT)
        p.write_bytes(blob)
    with (records/'regional-baseline-tests.log').open('w',encoding='utf-8') as log:
        subprocess.run([str(ROOT/'gradlew.bat'),':extensions:extension:testDebugUnitTest','--tests',
                        '*N28BLegacyGoldenTest','--offline','--console=plain'],cwd=ROOT,env=env,
                       stdout=log,stderr=subprocess.STDOUT,check=True)
finally:
    for p,data in backups.items():p.write_bytes(data)
    for p,dest in excluded.items():dest.rename(p)
print('N28A_REGIONAL_BASELINE_CAPTURED_PRODUCT_RESTORED')
