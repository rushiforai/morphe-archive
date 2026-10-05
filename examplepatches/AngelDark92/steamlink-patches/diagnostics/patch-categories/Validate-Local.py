from pathlib import Path
import argparse, json, shutil, subprocess, zipfile

parser = argparse.ArgumentParser()
parser.add_argument('--root', type=Path, default=Path.cwd())
parser.add_argument('--out', type=Path, required=True)
parser.add_argument('--compile-only', action='store_true')
parser.add_argument('--reuse-main', action='store_true')
a = parser.parse_args()
root = a.root.resolve()
out = a.out.resolve()
out.mkdir(parents=True, exist_ok=True)
java = 'F:/Runtimes/Java21/bin/java.exe'
task = Path(__file__).resolve().parent
tools = Path.cwd() / 'build/startup-boundary-tools'
deps = [tools/n for n in ('gson.jar','jcommander.jar','junit4.jar','hamcrest-core.jar','kotlin-test-junit.jar','kotlin-test.jar')]
deps += [tools/'morphe-desktop-1.15.1-all.jar']
compiler = sorted((Path.home()/'.gradle/wrapper/dists').rglob('kotlin-compiler-embeddable-*.jar'))[-1]
cp = ';'.join(str(p.resolve()) for p in deps)
classes = out/'classes'
tests = out/'test-classes'
resources = out/'resources'
for p in (classes,tests,resources/'extensions'): p.mkdir(parents=True,exist_ok=True)

def run(args, name, cwd=root):
    with (out/f'{name}.log').open('w',encoding='utf-8') as log:
        result = subprocess.run(args,cwd=cwd,stdout=log,stderr=subprocess.STDOUT)
    if result.returncode:
        print((out/f'{name}.log').read_text(encoding='utf-8')[-16000:])
        raise SystemExit(result.returncode)
    print(f'{name}: PASS')

def compile(src,dest,extra=()):
    args=['-no-stdlib','-no-reflect','-Xcontext-parameters','-jvm-target','11',
          '-classpath',cp+';'+str(classes),'-d',str(dest),*extra]
    args += [str(p) for p in (root/src).rglob('*.kt')]
    argfile=dest/'compiler.args'
    argfile.write_text('\n'.join('"'+v.replace('\\','/').replace('"','\\"')+'"' for v in args),encoding='utf-8')
    run([java,'-Xmx2g','-cp',str(compiler.parent/'*'),'org.jetbrains.kotlin.cli.jvm.K2JVMCompiler','@'+str(argfile)],dest.name)

if not a.reuse_main: compile('patches/src/main/kotlin',classes)
compile('patches/src/test/kotlin',tests,['-Xfriend-paths='+str(classes)])
if a.compile_only: raise SystemExit(0)
smali=root/'patches/src/main/resources/steamlink/androidxr/smali'
for name,inputs in {
    'extension.mpe':['org/libsdl/app/GxrSdlBridge.smali'],
    'minimal-extension.mpe':['com/valvesoftware/steamlink/GalaxyXRPermissionActivity.smali','com/valvesoftware/steamlink/GxrOverlayBridge.smali','com/valvesoftware/steamlink/GxrResolutionProbe.smali'],
    'battery-extension.mpe':['com/valvesoftware/steamlink/GxrBatterySettings.smali'],
}.items():
    run([java,'-cp',cp,'com.android.tools.smali.smali.Main','a','-a','33','-o',str(resources/'extensions'/name),*[str(smali/p) for p in inputs]],name)
runtime=';'.join([str(classes),str(resources),str(root/'patches/src/main/resources'),cp])
(out/'runtime-classpath.txt').write_text(runtime,encoding='utf-8')
stage=out/'catalog-work'
jar=stage/'patches/build/libs/patches-categories.mpp'
jar.parent.mkdir(parents=True,exist_ok=True)
version=json.loads((root/'patches-list-all.json').read_text(encoding='utf-8'))['version']
with zipfile.ZipFile(jar,'w',zipfile.ZIP_DEFLATED) as z:
    z.writestr('META-INF/MANIFEST.MF',f'Manifest-Version: 1.0\r\nVersion: {version}\r\nPatcher-Version: 1.13.0\r\n\r\n')
    for base in (classes,resources,root/'patches/src/main/resources'):
        for p in base.rglob('*'):
            if p.is_file() and p.name!='compiler.args': z.write(p,p.relative_to(base).as_posix())
run([java,'-cp',str(jar)+';'+cp,'util.PatchListGeneratorKt','experimental'],'catalog-generation',cwd=stage/'patches')
for p in stage.glob('patches-list*.json'):
    baseline=json.loads(subprocess.check_output(['git','show','HEAD:'+p.name],cwd=Path.cwd()))
    generated=json.loads(p.read_text(encoding='utf-8'))
    without_categories=json.loads(p.read_text(encoding='utf-8'))
    for patch in without_categories['patches']: patch.pop('category')
    for patch in baseline['patches']: patch.pop('category', None)
    assert baseline==without_categories, 'Unexpected metadata change: '+p.name
    shutil.copy2(p,root/p.name)
    print(f'{p.name}: {len(generated["patches"])} categories emitted, other metadata identical to HEAD')
launcher=str((tools/'junit.jar').resolve())
run([java,'-Xmx2g','-cp',';'.join([launcher,str(tests),str(root/'patches/src/test/resources'),runtime]),
     'org.junit.platform.console.ConsoleLauncher','execute','--scan-classpath',
     '--include-classname=.*Test','--include-engine=junit-vintage','--fail-if-no-tests',
     '--details=summary','--reports-dir='+str(out/'test-results')],'junit')
print((out/'junit.log').read_text(encoding='utf-8')[-2600:])
