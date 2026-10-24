"""Run the new Android regression tests against classes/resources from an applied APK."""
from pathlib import Path
import argparse,subprocess,shutil
p=argparse.ArgumentParser();p.add_argument('--applied-dir',type=Path,required=True);p.add_argument('--apk',type=Path,required=True);p.add_argument('--tools',type=Path,required=True);p.add_argument('--deps',type=Path,required=True);p.add_argument('--work',type=Path,required=True);p.add_argument('--java',default='java');a=p.parse_args()
r=Path(__file__).resolve().parent;work=a.work.resolve();work.mkdir(parents=True,exist_ok=True);java=Path(shutil.which(a.java) or a.java).resolve()
cp=':'.join(str(x.resolve()) for x in [*sorted(a.applied_dir.glob('*.jar')),a.tools/'android-all-16-robolectric-13921718.jar',*sorted(a.deps.glob('*.jar'))])
subprocess.run([str(java),'-jar',str(a.tools/'ecj.jar'),'-8','-proc:none','-nowarn','-cp',cp,'-d',str(work),*[str(f) for f in r.glob('*.java')]],check=True)
subprocess.run([str(java),'-Xmx3g','--add-opens=java.base/java.io=ALL-UNNAMED','--add-exports=java.base/jdk.internal.access=ALL-UNNAMED','-Drobolectric.offline=true','-Drobolectric.dependency.dir='+str(a.tools.resolve()),'-Dtest.apk='+str(a.apk.resolve()),'-cp',str(work)+':'+cp,'org.junit.runner.JUnitCore','e.e.a.CastControls218Test','e.e.a.Timeline218Test'],check=True)
