#!/usr/bin/env python3
"""Framework/DEX/payload checks for build.py output; not a real APK application test."""
from pathlib import Path
import argparse,subprocess,zipfile,hashlib,zlib,struct,json,os,re
REPO=Path(__file__).resolve().parents[2]
p=argparse.ArgumentParser();p.add_argument('--work',type=Path,required=True);p.add_argument('--tools',type=Path,required=True);p.add_argument('--base-mpp',type=Path,required=True);p.add_argument('--classpath-file',type=Path,required=True);a=p.parse_args();w=a.work.resolve();t=a.tools.resolve()
def run(*args,**kwargs):return subprocess.run(list(map(str,args)),check=True,**kwargs)
run('bash',t/'dex-tools-v2.4/d2j-dex2jar.sh','-f','-o',w/'runtime-helpers.jar',w/'helpers-final.dex')
deps=a.classpath_file.read_text().strip();cp=os.pathsep.join([str(w/'test-classes'),str(w/'classes'),deps,str(w/'runtime-helpers.jar')])
revision=REPO/'porting/revisions/v1.9.10-dev.5'
sources=[*sorted((revision/'test').rglob('*.java')),*sorted((REPO/'porting/quality-audit/test').rglob('*.java')),REPO/'porting/tests/RankingPaging190Test.java']
run('java','-jar',t/'ecj.jar','-1.8','-warn:none','-cp',cp,'-d',w/'test-classes',*sources)
with (w/'framework-tests.log').open('w') as log:run('java','-Drobolectric.dependency.dir='+str(t/'sdk'),'-cp',cp,'org.junit.runner.JUnitCore','e.e.a.Revision233Test','e.e.a.Revision236Test','e.e.a.Revision237Test','e.e.a.Revision238Test','e.e.a.AuditQualityTest',stdout=log,stderr=subprocess.STDOUT)
log=(w/'framework-tests.log').read_text();m=re.search(r'OK \((\d+) tests\)',log);assert m,log[-3000:]
run('java','-jar',t/'ecj.jar','-1.8','-warn:none','-cp',str(t/'dexlib2.jar')+os.pathsep+str(t/'guava.jar'),'-d',w/'test-classes',revision/'VerifyInvocationContracts.java')
run('java','-cp',str(w/'test-classes')+os.pathsep+str(t/'*'),'VerifyInvocationContracts',w/'helpers-final.dex',w/'native-final.dex')
file=w/'nicoid-re-1.9.10-dev.5-quality-audit.mpp'
with zipfile.ZipFile(a.base_mpp) as base,zipfile.ZipFile(file) as z:
 assert z.testzip() is None and set(z.namelist())==set(base.namelist())
 changed=[n for n in z.namelist() if base.read(n)!=z.read(n)];assert changed==['nicoid/helpers.mpe'],changed
 for name in ['nicoid/helpers.mpe','nicoid/method-delta.dex','classes.dex']:
  b=z.read(name);assert b[:4]==b'dex\n';assert hashlib.sha1(b[32:]).digest()==b[12:32];assert zlib.adler32(b[12:])&0xffffffff==struct.unpack_from('<I',b,8)[0];assert struct.unpack_from('<I',b,32)[0]==len(b)
 assert b'Version: 1.9.10-dev.5' in z.read('META-INF/MANIFEST.MF')
run('python3',REPO/'porting/tests/VerifyCanonicalHelpers.py')
run('python3',REPO/'porting/tests/VerifyLegacyImageFormats191.py',a.base_mpp,file)
result={'framework_tests':int(m.group(1)),'sha256':hashlib.sha256(file.read_bytes()).hexdigest(),'bytes':file.stat().st_size,'changed_payloads':changed,'actual_apk_application':'not performed','physical_device':'not performed'}
(w/'verification.json').write_text(json.dumps(result,indent=2));print(json.dumps(result))
