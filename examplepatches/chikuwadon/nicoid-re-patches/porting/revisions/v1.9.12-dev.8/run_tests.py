#!/usr/bin/env python3
"""Tests the final MPP payload on a local JVM; not a real APK/device test."""
from pathlib import Path
import argparse,zipfile,subprocess,shutil,os
p=argparse.ArgumentParser();p.add_argument('--mpp',type=Path,required=True);p.add_argument('--tools',type=Path,required=True);p.add_argument('--deps',type=Path,required=True);p.add_argument('--work',type=Path,required=True);a=p.parse_args()
r=Path(__file__).resolve().parent;w=a.work.resolve();w.mkdir(parents=True,exist_ok=True);t=a.tools.resolve();d=a.deps.resolve()
def run(*cmd,log=None):
 if log:
  with (w/log).open('w') as output:subprocess.run(list(map(str,cmd)),stdout=output,stderr=subprocess.STDOUT,check=True)
 else:subprocess.run(list(map(str,cmd)),check=True)
for directory in ["helpers","native","test-classes"]:
 shutil.rmtree(w/directory,ignore_errors=True)
with zipfile.ZipFile(a.mpp) as z:
 for name,entry in [('helpers','nicoid/helpers.mpe'),('native','nicoid/method-delta.dex')]:
  (w/(name+'.dex')).write_bytes(z.read(entry));run('java','-cp',str(t/'*'),'org.jf.baksmali.Main','d',w/(name+'.dex'),'-o',w/name)
run('java','-cp',str(t/'dex-tools-v2.4/lib/*'),'com.googlecode.dex2jar.tools.Dex2jarCmd',w/'helpers.dex','-o',w/'helpers.jar','--force')
cp=os.pathsep.join([str(t/'android.jar'),str(w/'helpers.jar')]+[str(f) for f in d.glob('*.jar')]+[str(t/'dexlib2.jar'),str(t/'guava.jar')])
run('java','-jar',t/'ecj.jar','-1.8','-warn:none','-encoding','UTF-8','-cp',cp,'-d',w/'test-classes',*sorted((r/'test').rglob('*.java')))
run('java','-Drobolectric.usePreinstrumentedJars=false','-Drobolectric.dependency.dir='+str(t),'-cp',str(w/'test-classes')+os.pathsep+str(w/'helpers.jar')+os.pathsep+str(t/'android.jar')+os.pathsep+str(d/'*'),'org.junit.runner.JUnitCore','e.e.a.Revision244Test','e.e.a.Revision244Api28Test','e.e.a.AuditQualityTest','e.e.a.FinalAudit250Test','e.e.a.PublicAuditCases250Test',log='ui.log')
run('java','-cp',str(w/'test-classes')+os.pathsep+str(w/'helpers.jar')+os.pathsep+str(t/'android.jar'),'e.e.a.PolicyTest',log='policy.log')
run('java','-cp',str(w/'test-classes')+os.pathsep+str(t/'*'),'VerifyInvocationContracts',w/'helpers.dex',w/'native.dex',log='invocations.log')
import re
assert re.search(r'OK \([1-9][0-9]* tests\)',(w/'ui.log').read_text()),'JUnit did not report a complete successful run'
for name in ['ui.log','policy.log','invocations.log']:print((w/name).read_text()[-700:])
