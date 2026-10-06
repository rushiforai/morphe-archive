"""Bounded delivered-DEX/API35 matrix, exclusively on the existing named emulator."""
from pathlib import Path
import argparse,json,subprocess
ROOT=Path(__file__).resolve().parents[2]
ADB=Path(r'C:/Users/14776/AppData/Local/Android/Sdk/platform-tools/adb.exe');SERIAL='emulator-5554'
def main():
 p=argparse.ArgumentParser();p.add_argument('--host',type=Path,required=True);p.add_argument('--output',type=Path,required=True);args=p.parse_args();out=args.output;out.mkdir(parents=True,exist_ok=False)
 def adb(*items,limit=180):return subprocess.run([str(ADB),'-s',SERIAL,*map(str,items)],capture_output=True,timeout=limit)
 assert adb('shell','getprop','ro.kernel.qemu').stdout.strip()==b'1'
 assert adb('shell','getprop','ro.build.version.sdk').stdout.strip()==b'35'
 for name in ['host-signed.apk','probe-signed.apk']:
  run=adb('install','-r',args.host/name);(out/(name+'.log')).write_bytes(run.stdout+run.stderr);assert run.returncode==0
 run=adb('shell','am','instrument','-w','app.morphe.n36.probe/n36.N36Instrumentation',limit=180)
 text=(run.stdout+run.stderr).decode('utf-8',errors='replace');(out/'instrumentation.log').write_text(text,encoding='utf-8')
 for name in ['matrix.json','diagnostics.txt','failure.txt','partial.json']:
  data=adb('exec-out','run-as','app.morphe.android.youtube','cat','files/n37r2-evidence/'+name)
  if data.returncode==0:(out/name).write_bytes(data.stdout)
 assert 'result=PASS' in text and 'INSTRUMENTATION_CODE: -1' in text,text
 report=json.loads((out/'matrix.json').read_text(encoding='utf-8'));rows=report['rows'];assert len(rows)==86,len(rows)
 assert all(abs(row['center_error_px'])<=1 and row['visible'] and row['translation_x']==0 for row in rows)
 assert all(row['caption_text_direction']==(4 if row['target']=='ar' else 3) and row['caption_outer_layout_direction']==0 for row in rows)
 matrix=[row for row in rows if row['phase']=='matrix'];assert len(matrix)==56
 pairs={(row['app'],row['target'],row['player_type']) for row in matrix};assert len(pairs)==14
 assert all({r['shape'] for r in matrix if (r['app'],r['target'],r['player_type'])==pair}=={0,1,2,3} for pair in pairs)
 assert any(r['phase']=='shorts-next' for r in rows) and any(r['phase']=='enter-fullscreen' for r in rows) and any(r['phase']=='exit-fullscreen' for r in rows)
 history=(out/'diagnostics.txt').read_text(encoding='utf-8');assert 'CAPTION_HORIZONTAL_PLACEMENT' in history
 for key in ['player_type','app_layout_direction','caption_text_direction','caption_outer_layout_direction','video_rect','caption_outer_rect','expected_center_x','actual_center_x','center_error_px','session','owner_epoch','render_epoch']:assert key+'=' in history,key
 summary={'status':'PASS','sdk':35,'serial':SERIAL,'observations':len(rows),'required_combinations':len(pairs),'required_shape_observations':len(matrix),'max_center_error_px':max(abs(row['center_error_px']) for row in rows),'physical_phone_written':False,'youtube_oem_ui':False}
 (out/'summary.json').write_text(json.dumps(summary,indent=2));print(json.dumps(summary,indent=2))
 adb('shell','am','force-stop','app.morphe.android.youtube')
if __name__=='__main__':main()
