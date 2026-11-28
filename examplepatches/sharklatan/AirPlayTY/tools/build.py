"""Reproducible build of the public patch bundle. No APK or private signing key needed."""
from pathlib import Path
import argparse,hashlib,json,os,shutil,subprocess,urllib.request,zipfile,datetime,re
ROOT=Path(__file__).resolve().parents[1]
DEPS={
 'morphe-desktop-2.2.0-all.jar':('https://github.com/MorpheApp/morphe-desktop/releases/download/v2.2.0/morphe-desktop-2.2.0-all.jar','5ca0320ee05481df1ae3afd2f003bba3ff994d11d1f66ae48811ced71355e4fe'),
 'dd-plist-1.23.jar':('https://repo.maven.apache.org/maven2/com/googlecode/plist/dd-plist/1.23/dd-plist-1.23.jar','3d794f2808d0e90c7ec889658e843f92a24414bd4df18ecf9f1478726af1238c'),
 'eddsa-0.3.0.jar':('https://repo.maven.apache.org/maven2/net/i2p/crypto/eddsa/0.3.0/eddsa-0.3.0.jar','4dda1120db856640dbec04140ed23242215a075fe127bdefa0dcfa29fb31267d'),
 'srp6a-2.1.0.jar':('https://repo.maven.apache.org/maven2/com/nimbusds/srp6a/2.1.0/srp6a-2.1.0.jar','5891f7c75f6673fe2343574a3a3461bdfb5b8983dfad31770e5a089386cd6842')}
def run(*args):subprocess.run(list(map(str,args)),check=True,cwd=ROOT)
def jar(source,out):
 with zipfile.ZipFile(out,'w',zipfile.ZIP_DEFLATED) as z:
  for f in sorted(source.rglob('*.class')):z.write(f,f.relative_to(source).as_posix())
def build():
 parser=argparse.ArgumentParser();parser.add_argument('--version',default='0.1.0');args=parser.parse_args()
 if not re.fullmatch(r'\d+\.\d+\.\d+(?:-[A-Za-z0-9.]+)?',args.version):raise SystemExit('Invalid version')
 build=ROOT/'build';build.mkdir(exist_ok=True);dist=ROOT/'dist';dist.mkdir(exist_ok=True);cache=ROOT/'.cache';cache.mkdir(exist_ok=True)
 java=Path(os.environ.get('JAVA_HOME',''))/'bin';java17=Path(os.environ.get('AIRPLAY_JAVA_HOME',os.environ.get('JAVA_HOME','')))/'bin';exe='.exe' if os.name=='nt' else ''
 sdk=Path(os.environ.get('ANDROID_HOME',os.environ.get('ANDROID_SDK_ROOT','')));bt=sdk/'build-tools/34.0.0';api=sdk/'platforms/android-33/android.jar'
 for tool in [java/('javac'+exe),java17/('java'+exe),api,bt/'lib/d8.jar']:
  if not tool.exists():raise SystemExit('Missing build prerequisite: '+str(tool))
 for name,(url,digest) in DEPS.items():
  file=cache/name
  if not file.exists():
   request=urllib.request.Request(url,headers={'User-Agent':'Sharklatan-AirPlay-build'})
   with urllib.request.urlopen(request) as response,file.open('wb') as output:shutil.copyfileobj(response,output)
  if hashlib.sha256(file.read_bytes()).hexdigest()!=digest:raise SystemExit('Dependency SHA-256 mismatch: '+name)
 libs=[cache/n for n in DEPS if not n.startswith('morphe-desktop')];cli=cache/'morphe-desktop-2.2.0-all.jar'
 def compile(sources,out,classpath,jdk,release):
  out.mkdir(parents=True,exist_ok=True)
  # Only remove known stale compiler output within this build directory.
  for f in out.rglob('*.class'):f.unlink()
  options=['--release',str(release),'-encoding','UTF-8','-cp',os.pathsep.join(map(str,classpath)),'-d',str(out),*map(str,sources)]
  argfile=build/(out.name+'.args');argfile.write_text('\n'.join('"'+v.replace('\\','/')+'"' for v in options),encoding='utf-8');run(jdk/('javac'+exe),'@'+str(argfile))
 def dex(source,out,classpath=()):
  out.mkdir(exist_ok=True)
  for f in out.glob('*.dex'):f.unlink()
  opts=[java17/('java'+exe),'-cp',bt/'lib/d8.jar','com.android.tools.r8.D8','--min-api','29','--lib',api,'--output',out]
  for cp in classpath:opts+=['--classpath',cp]
  run(*opts,*source)
 runtime=build/'runtime-classes';compile(list((ROOT/'extensions/extension/src/main/java').rglob('*.java')),runtime,[api,*libs],java17,8)
 runtimejar=build/'runtime.jar';jar(runtime,runtimejar);runtimedex=build/'runtime-dex';dex([runtimejar,*libs],runtimedex)
 if len(list(runtimedex.glob('*.dex')))!=1:raise SystemExit('Runtime unexpectedly requires multiple DEX files')
 patch=build/'patch-classes';compile(list((ROOT/'patches/src/main/java').rglob('*.java')),patch,[cli],java,17)
 patchjar=build/'patch.jar';jar(patch,patchjar);patchdex=build/'patch-dex';dex([patchjar],patchdex,[cli])
 output=dist/f'patches-{args.version}.mpp'
 with zipfile.ZipFile(output,'w',zipfile.ZIP_DEFLATED) as z:
  z.writestr('META-INF/MANIFEST.MF','Manifest-Version: 1.0\r\nName: SharkLatan AirPlay\r\nVersion: '+args.version+'\r\nDescription: AirPlay for original YouTube 21.30.216 with Morphe patches\r\nAuthor: Sharklatan\r\nPatcher-Version: 2.4.0\r\n\r\n')
  for f in patch.rglob('*.class'):z.write(f,f.relative_to(patch).as_posix())
  for f in patchdex.glob('*.dex'):z.write(f,f.name)
  z.write(runtimedex/'classes.dex','extensions/extension.mpe')
  for dep in libs:
   with zipfile.ZipFile(dep) as original:
    for entry in original.infolist():
     if not entry.is_dir() and re.search(r'(?:license|notice|copying)',entry.filename,re.I):z.writestr('META-INF/licenses/'+dep.stem+'/'+entry.filename,original.read(entry.filename))
  for f in (ROOT/'licenses').iterdir():
   if f.is_file():z.write(f,'META-INF/licenses/'+f.name)
  for f in (ROOT/'patches/src/main/resources').rglob('*'):
   if f.is_file():z.write(f,f.relative_to(ROOT/'patches/src/main/resources').as_posix())
 sha=hashlib.sha256(output.read_bytes()).hexdigest();(dist/'SHA256SUMS.txt').write_text(sha+'  '+output.name+'\n')
 # Load the actual artifact with Morphe, independently of Android APK signing.
 run(java/('java'+exe),'-jar',cli,'list-patches','--patches='+str(output),'-p','-v','--out='+str(dist/'patch-list.txt'))
 repo=os.environ.get('GITHUB_REPOSITORY','')
 metadata={'version':args.version,'created_at':datetime.datetime.now(datetime.timezone.utc).strftime('%Y-%m-%dT%H:%M:%S'),'description':'AirPlay for original YouTube 21.30.216. Select together with Morphe YouTube patches.','download_url':f'https://github.com/{repo}/releases/download/v{args.version}/{output.name}' if repo else '', 'signature_download_url':''}
 (ROOT/'patches-bundle.json').write_text(json.dumps(metadata,indent=2)+'\n',encoding='utf-8')
 if repo:
  p=ROOT/'README.md';text=p.read_text(encoding='utf-8');link=f'[Añadir a Morphe](https://morphe.software/add-source?github={repo})'
  text=re.sub(r'<!-- ADD_SOURCE_START -->.*?<!-- ADD_SOURCE_END -->','<!-- ADD_SOURCE_START -->\n'+link+'\n<!-- ADD_SOURCE_END -->',text,flags=re.S);p.write_text(text,encoding='utf-8')
 print(json.dumps({'bundle':str(output),'sha256':sha,'patcher':'2.4.0','version':args.version}))
if __name__=='__main__':build()
