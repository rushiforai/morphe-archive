#!/usr/bin/env python3
"""Rebuild only reviewed helper families against the user-verified dev.5 MPP."""
from pathlib import Path
import argparse,hashlib,subprocess,shutil,zipfile,os,json
REPO=Path(__file__).resolve().parents[2]
VERSION='1.9.10-dev.5'
BASE='1fd7766dd855377d6550b26f3a595e02249c6904d38ea2bc0878112c4bbd3745'
def main():
 p=argparse.ArgumentParser();p.add_argument('--base-mpp',type=Path,required=True);p.add_argument('--work',type=Path,required=True);p.add_argument('--tools',type=Path,required=True);a=p.parse_args();base=a.base_mpp.resolve();w=a.work.resolve();tools=a.tools.resolve()
 assert hashlib.sha256(base.read_bytes()).hexdigest()==BASE,'Expected the user-verified dev.5 baseline'
 w.mkdir(parents=True,exist_ok=True);marker=w/'quality-audit-stage.json'
 if any(w.iterdir()):assert marker.is_file() and json.loads(marker.read_text())['base_sha256']==BASE,'Use a fresh audit working directory'
 marker.write_text(json.dumps({'base_sha256':BASE,'version':VERSION,'repo':str(REPO)}))
 def run(*args):subprocess.run(list(map(str,args)),check=True)
 cp=str(tools/'*')
 with zipfile.ZipFile(base) as z:
  for source,dest in [('nicoid/helpers.mpe','helpers.dex'),('nicoid/method-delta.dex','native-final.dex')]: (w/dest).write_bytes(z.read(source))
 for name,dex in [('helpers','helpers.dex'),('native','native-final.dex')]:
  shutil.rmtree(w/name,ignore_errors=True);run('java','-cp',cp,'org.jf.baksmali.Main','d',w/dex,'-o',w/name)
 run('bash',tools/'dex-tools-v2.4/d2j-dex2jar.sh','-f','-o',w/'helpers.jar',w/'helpers.dex')
 shutil.rmtree(w/'src',ignore_errors=True);shutil.copytree(REPO/'porting/revisions/v1.9.10-dev.5/src',w/'src')
 for name in ['ShortImages','RowDates194','ImageDiskCache','ContentFilterRules']:
  shutil.copyfile(REPO/'extensions/extension/src/main/java/e/e/a'/(name+'.java'),w/'src/e/e/a'/(name+'.java'))
 shutil.copyfile(REPO/'porting/maintenance196/e/e/a/CommentGraph215.java',w/'src/e/e/a/CommentGraph215.java')
 shutil.rmtree(w/'classes',ignore_errors=True)
 run('java','-jar',tools/'ecj.jar','-1.8','-warn:none','-encoding','UTF-8','-cp',str(tools/'android.jar')+os.pathsep+str(w/'helpers.jar'),'-d',w/'classes',*sorted((w/'src').rglob('*.java')))
 with zipfile.ZipFile(w/'revision.jar','w') as z:
  for f in sorted((w/'classes').rglob('*.class')):z.write(f,f.relative_to(w/'classes'))
 shutil.rmtree(w/'d8',ignore_errors=True);(w/'d8').mkdir()
 java_home=Path(shutil.which('java')).resolve().parents[1]
 run('java','-cp',tools/'r8.jar','com.android.tools.r8.D8','--min-api','26','--lib',tools/'android.jar','--lib',java_home,'--classpath',w/'helpers.jar','--output',w/'d8',w/'revision.jar')
 shutil.rmtree(w/'compiled',ignore_errors=True);run('java','-cp',cp,'org.jf.baksmali.Main','d',w/'d8/classes.dex','-o',w/'compiled')
 for source in (w/'src/e/e/a').glob('*.java'):
  for f in (w/'helpers/e/e/a').glob(source.stem+'*.smali'):
   if f.stem==source.stem or f.stem.startswith(source.stem+'$'):f.unlink()
 shutil.copytree(w/'compiled',w/'helpers',dirs_exist_ok=True)
 run('java','-cp',cp,'org.jf.smali.Main','a','-j','1',w/'helpers','-o',w/'helpers-final.dex')
 output=w/('nicoid-re-'+VERSION+'-quality-audit.mpp');tmp=output.with_suffix('.building')
 with zipfile.ZipFile(base) as src,zipfile.ZipFile(tmp,'w',zipfile.ZIP_DEFLATED) as dest:
  for info in src.infolist():dest.writestr(info.filename,(w/'helpers-final.dex').read_bytes() if info.filename=='nicoid/helpers.mpe' else src.read(info.filename))
 with zipfile.ZipFile(tmp) as z:assert z.testzip() is None
 with tmp.open('rb') as f:os.fsync(f.fileno())
 os.replace(tmp,output)
 print(json.dumps({'mpp':str(output),'version':VERSION,'sha256':hashlib.sha256(output.read_bytes()).hexdigest(),'bytes':output.stat().st_size}))
if __name__=='__main__':main()
