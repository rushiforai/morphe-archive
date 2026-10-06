"""Bounded real API35 UI matrix. Every device operation names the existing emulator explicitly."""
from pathlib import Path
import subprocess,json,time
ROOT=Path(__file__).resolve().parents[2]
ADB=Path(r'C:\Users\14776\AppData\Local\Android\Sdk\platform-tools\adb.exe');SERIAL='emulator-5554'
OUT=ROOT/'.verification/n37/android-matrix-01';OUT.mkdir(exist_ok=False)
def adb(*args,limit=120):return subprocess.run([str(ADB),'-s',SERIAL,*map(str,args)],capture_output=True,timeout=limit)
assert adb('shell','getprop','ro.kernel.qemu').stdout.strip()==b'1'
assert adb('shell','getprop','ro.build.version.sdk').stdout.strip()==b'35'
results=[]
for lang in ['zh-CN','ja','ar']:
 for font in ['1.0','1.3']:
  for width in [1264,1120]:
   # Balanced cases cover each locale, font, geometry, panel state and natural/edited focus without
   # needlessly repeating the entire frozen language table. A separate backlog case follows.
   expanded=(width==1120); focus='prompt' if expanded else 'natural'
   name=f'{lang}-font{font}-width{width}-{focus}'
   assert adb('shell','wm','size',f'{width}x2736').returncode==0
   args=['shell','am','instrument','-w','-e','action','deep-scroll','-e','locale',lang,'-e','caller',lang,
         '-e','fontScale',font,'-e','focus',focus,'-e','expanded',str(expanded).lower(),
         'app.morphe.n36.probe/n36.N36Instrumentation']
   run=adb(*args);text=run.stdout.decode('utf-8',errors='replace');(OUT/(name+'.log')).write_text(text,encoding='utf-8')
   row={'case':name,'exit':run.returncode,'instrumentation_pass':'INSTRUMENTATION_CODE: -1' in text and 'result=PASS' in text}
   if row['instrumentation_pass']:
    data=adb('exec-out','run-as','app.morphe.android.youtube','cat','files/n36-evidence/n36-deep-scroll.json')
    (OUT/(name+'.json')).write_bytes(data.stdout)
    report=json.loads(data.stdout);lane=report['deep_scroll'];frames=lane['frames'];tops=[r['top'] for f in frames for r in f['rows'] if r.get('key')=='deepseek_caption_style_preview']
    deltas=[x.get('delta_ms',0) for x in frames if x.get('delta_ms',0)>0]
    row.update(frames=len(frames),preview_top_min=min(tops) if tops else None,preview_top_max=max(tops) if tops else None,
      dataset_changes=lane['dataset_changes'],viewport_before=lane['viewport_before'],viewport_after=lane['viewport_after'],
      boundary_crossed=bool(tops) and min(tops)<0<max(tops),frame_max_ms=max(deltas) if deltas else None)
   results.append(row);(OUT/'result.json').write_text(json.dumps(results,indent=2),encoding='utf-8')
   print(json.dumps(row),flush=True)
   if not row['instrumentation_pass']:raise RuntimeError('Native case failed; preserved '+name)
# Controlled backlog on the phone geometry: ordinary gestures must finish before archive release.
adb('shell','wm','size','1264x2736')
run=adb('shell','am','instrument','-w','-e','action','deep-scroll','-e','locale','zh-CN','-e','caller','zh-CN',
 '-e','fontScale','1.0','-e','focus','natural','-e','expanded','true','-e','backlog','true',
 'app.morphe.n36.probe/n36.N36Instrumentation')
text=run.stdout.decode('utf-8',errors='replace');(OUT/'backlog.log').write_text(text,encoding='utf-8')
assert 'INSTRUMENTATION_CODE: -1' in text and 'result=PASS' in text,text
report=adb('exec-out','run-as','app.morphe.android.youtube','cat','files/n36-evidence/n36-deep-scroll.json')
(OUT/'backlog.json').write_bytes(report.stdout)
lane=json.loads(report.stdout)['deep_scroll'];assert lane['archive_blocked_during_gestures']
print('N37_NATIVE_MATRIX_AND_BACKLOG_PASS')
