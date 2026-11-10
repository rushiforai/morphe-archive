"""Build one standalone MPP using explicit local tools. Not a Gradle/CI substitute."""
import argparse, pathlib, subprocess, zipfile, hashlib, json

p=argparse.ArgumentParser()
for name in ('java','kotlin_lib','morphe','d8','android_jar','out'):
    p.add_argument('--'+name.replace('_','-'),type=pathlib.Path,required=True)
a=p.parse_args(); root=pathlib.Path(__file__).resolve().parents[2]
out=a.out.resolve();out.mkdir(parents=True,exist_ok=True)
classes=out/'classes';classes.mkdir(exist_ok=True)
dex=out/'dex';dex.mkdir(exist_ok=True)
src=root/'patches/src/main/kotlin/app/template/patches'
sources=[src/'shared/Constants.kt',src/'shared/PatchCategories.kt',src/'steamlink/androidxr/PerformanceBoostPatch.kt']
def run(args):subprocess.run([str(a.java),*map(str,args)],check=True)
run(['-cp',str(a.kotlin_lib/'*'),'org.jetbrains.kotlin.cli.jvm.K2JVMCompiler',
     '-no-stdlib','-no-reflect','-jvm-target','11','-classpath',a.morphe,'-d',classes,*sources])
jar=out/'classes.jar'
with zipfile.ZipFile(jar,'w',zipfile.ZIP_DEFLATED) as z:
    for f in sorted(classes.rglob('*')):
        if f.is_file():z.write(f,f.relative_to(classes).as_posix())
run(['-cp',a.d8,'com.android.tools.r8.D8','--release','--min-api','26','--lib',a.android_jar,
     '--classpath',a.morphe,'--output',dex,jar])
bundle=out/'gxr-steamlink-performance-boost-0.1.0.mpp'
manifest=('Manifest-Version: 1.0\r\nName: Steam Link OpenXR Performance Boost\r\n'
          'Description: Optional CPU and GPU BOOST for OpenXR sessions\r\n'
          'Version: 0.1.0\r\nPatcher-Version: 1.13.0\r\n'
          'Author: 4uva4ek\r\nLicense: GPLv3\r\n\r\n')
with zipfile.ZipFile(bundle,'w',zipfile.ZIP_DEFLATED) as z:
    z.writestr('META-INF/MANIFEST.MF',manifest)
    with zipfile.ZipFile(jar) as j:
        for name in j.namelist():z.writestr(name,j.read(name))
    z.write(dex/'classes.dex','classes.dex')
    for name in ('libgxr_performance_boost.so','XR_APILAYER_local_GalaxyXR_performance_boost.json'):
        z.write(root/'patches/src/main/resources/steamlink/androidxr'/name,'steamlink/androidxr/'+name)
report={'bundle':str(bundle),'sha256':hashlib.sha256(bundle.read_bytes()).hexdigest(),
        'scope':'Standalone local compiler and D8; not Gradle or CI verification',
        'inputs':{str(f):hashlib.sha256(f.read_bytes()).hexdigest() for f in [*sources,a.morphe,a.d8]}}
(out/'build.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
