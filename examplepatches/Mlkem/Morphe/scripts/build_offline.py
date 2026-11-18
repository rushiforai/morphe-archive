"""Compile against supplied official Morphe Desktop, R8, Android and Kotlin jars.

This verification build needs no GitHub package-registry credentials.
Production releases use the checked-in Gradle/Morphe template in GitHub Actions.
"""
from pathlib import Path
import argparse, os, shutil, subprocess, time, zipfile
p=argparse.ArgumentParser()
p.add_argument('--tools',type=Path,required=True,help='Directory with JDK21, morphe.jar, r8.jar, android.jar')
p.add_argument('--kotlin-libs',type=Path,required=True,help='Gradle lib directory with Kotlin compiler and Gson')
p.add_argument('--version',default='0.4.0-dev.1')
a=p.parse_args();root=Path(__file__).resolve().parents[1];t=a.tools.resolve();k=a.kotlin_libs.resolve()
jdk=next(t.glob('jdk-21*/bin'));java=jdk/'java';b=root/'patches/build/manual'
shutil.rmtree(b,ignore_errors=True);b.mkdir(parents=True)
classes=b/'classes';classes.mkdir();cp=os.pathsep.join(map(str,[t/'morphe.jar',next(k.glob('gson-*.jar'))]))
def run(*args,**kw):subprocess.run(list(map(str,args)),check=True,**kw)
run(java,'-cp',k/'*','org.jetbrains.kotlin.cli.jvm.K2JVMCompiler','-no-stdlib','-no-reflect','-language-version','2.2','-api-version','2.2','-Xcontext-parameters','-jvm-target','11','-classpath',cp,'-d',classes,*root.glob('patches/src/main/kotlin/**/*.kt'))
run(jdk/'javac','--release','11','-cp',cp,'-d',classes,*root.glob('patches/src/main/java/**/*.java'))
def jar_tree(dest,directory):
    with zipfile.ZipFile(dest,'w',zipfile.ZIP_DEFLATED) as z:
        for f in sorted(directory.rglob('*.class')):z.write(f,f.relative_to(directory))
jar_tree(b/'patches.jar',classes)
def dex(source,name,minapi):
    out=b/name;out.mkdir()
    run(java,'-cp',t/'r8.jar','com.android.tools.r8.D8','--release','--min-api',minapi,'--lib',t/'android.jar','--classpath',t/'morphe.jar','--classpath',next(k.glob('gson-*.jar')),'--output',out,source)
    return out/'classes.dex'
patchdex=dex(b/'patches.jar','patch-dex','26')
extensions={}
for name,resource in [('canada','canada.mpe'),('pushpress','pushpress-crossfit-only.mpe')]:
    out=b/(name+'-classes');out.mkdir()
    run(jdk/'javac','--release','8','-cp',t/'android.jar','-d',out,*root.glob(f'extensions/{name}/src/main/java/**/*.java'))
    jar_tree(b/(name+'.jar'),out)
    extensions['extensions/'+resource]=dex(b/(name+'.jar'),name+'-dex','28')
test=b/'tests';test.mkdir()
run(jdk/'javac','--release','8','-cp',str(b/'canada-classes')+os.pathsep+str(t/'android.jar'),'-d',test,root/'tests/walmart/LogicTest.java')
run(java,'-cp',os.pathsep.join(map(str,[test,b/'canada-classes',t/'android.jar'])),'LogicTest')
testcp=os.pathsep.join(map(str,[test,b/'canada-classes',t/'android.jar']))
run(jdk/'javac','--release','8','-cp',testcp,'-d',test,*root.glob('tests/walmart/fixtures/**/*.java'),root/'tests/walmart/FeatureTest.java',root/'tests/walmart/AdHistoryTest.java')
run(java,'-cp',testcp,'FeatureTest')
run(java,'-cp',testcp,'AdHistoryTest')
manifest='\r\n'.join(['Manifest-Version: 1.0','Name: mlkemac patches','Description: Public community patches maintained by mlkemac','Version: '+a.version,'Timestamp: '+str(int(time.time()*1000)),'Author: mlkemac','License: GPLv3','Patcher-Version: 2.1.0','',''])
libs=root/'patches/build/libs';libs.mkdir(parents=True,exist_ok=True)
target=libs/('patches-'+a.version+'.mpp')
with zipfile.ZipFile(target,'w',zipfile.ZIP_DEFLATED) as z:
    with zipfile.ZipFile(b/'patches.jar') as source:
        for name in source.namelist():z.writestr(name,source.read(name))
    z.writestr('META-INF/MANIFEST.MF',manifest);z.write(patchdex,'classes.dex')
    for name,path in extensions.items():z.write(path,name)
    z.write(root/'LICENSE','LICENSE');z.write(root/'NOTICE','NOTICE')
run(java,'-cp',str(classes)+os.pathsep+cp,'util.PatchListGeneratorKt',cwd=root/'patches')
run('python3',root/'scripts/verify_bundle.py')
print(target)
