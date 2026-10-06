"""Pinned-emulator execution and immutable per-run ART/WMS evidence collection."""
from pathlib import Path
import argparse, json, subprocess, time

ROOT=Path(__file__).resolve().parents[2]
ADB=Path(r'C:\Users\14776\AppData\Local\Android\Sdk\platform-tools\adb.exe')

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--serial',required=True)
    parser.add_argument('--output',required=True,type=Path)
    parser.add_argument('--scenario',choices=['actions','parity','matrix','navigation','presentation','extras'],required=True)
    parser.add_argument('--caller',default='zh-CN')
    parser.add_argument('--locale',default='ja')
    parser.add_argument('--only-default',action='store_true')
    parser.add_argument('--dark',action='store_true')
    parser.add_argument('--width',default='320')
    parser.add_argument('--scale',default='1.0')
    args=parser.parse_args()
    assert args.serial.startswith('emulator-'),'Physical devices are read-only'
    prefix=[str(ADB),'-s',args.serial]
    serial=subprocess.check_output(prefix+['get-serialno']).decode().strip()
    assert serial==args.serial
    out=args.output.resolve();out.mkdir(parents=True,exist_ok=False)
    # Genuine Utils.isDarkModeEnabled falls back to Resources.getSystem(), not an
    # Activity's override configuration. Exercise the real system theme lifecycle.
    theme=subprocess.run(prefix+['shell','cmd','uimode','night','yes' if args.dark else 'no'],capture_output=True,check=True)
    (out/'system-theme.log').write_bytes(theme.stdout+theme.stderr)
    command=prefix+['shell','am','instrument','-w','-e','scenario',args.scenario,'-e','locale',args.locale,'-e','caller',args.caller,'-e','dark',str(args.dark).lower(),'-e','width',args.width,'-e','fontScale',args.scale,'-e','onlyDefault',str(args.only_default).lower(),'app.morphe.android.youtube/n33.N33Instrumentation']
    started=time.monotonic()
    result=subprocess.run(command,capture_output=True)
    (out/'instrumentation.log').write_bytes(result.stdout+result.stderr)
    data=subprocess.check_output(prefix+['exec-out','run-as','app.morphe.android.youtube','cat','files/n33-evidence/ui.json'])
    (out/'ui.json').write_bytes(data)
    evidence=json.loads(data)
    # Each run's screenshots are copied before the next run can update the device-local files.
    if args.scenario in {'matrix','actions','parity','navigation','presentation','extras'}:
        listing=subprocess.check_output(prefix+['shell','run-as','app.morphe.android.youtube','ls','files/n33-evidence']).decode().splitlines()
        requested={event['event'].removeprefix('real_windows_')+'.png' for event in evidence['events'] if event['event'].startswith('real_windows_')}
        if args.width=='320' and args.scale=='1.3':
            locales=['DEFAULT'] if args.only_default else ['zh-CN','en','ja','ar']
            requested|={f'{role}-{locale}.png' for role in ['screen','style','picker'] for locale in locales}
        for name in sorted(requested&set(listing)):
            (out/name).write_bytes(subprocess.check_output(prefix+['exec-out','run-as','app.morphe.android.youtube','cat','files/n33-evidence/'+name]))
    (out/'windows.txt').write_bytes(subprocess.check_output(prefix+['shell','dumpsys','window']))
    process=subprocess.run(prefix+['shell','pidof','app.morphe.android.youtube'],capture_output=True)
    (out/'process.txt').write_bytes(process.stdout+process.stderr)
    (out/'run.json').write_text(json.dumps({'serial':serial,'scenario':args.scenario,'caller':args.caller,'locale':args.locale,'dark':args.dark,'width_dp':args.width,'font_scale':args.scale,'status':evidence['status'],'elapsed_s':round(time.monotonic()-started,3),'argv':command},indent=2),encoding='utf-8')
    print(json.dumps({'output':str(out),'status':evidence['status'],'scenario':args.scenario,'elapsed_s':round(time.monotonic()-started,2)}),flush=True)
    if evidence['status']!='PASS':
        print((result.stdout+result.stderr).decode('utf-8',errors='replace')[-2500:])
        return 1
    return 0

if __name__=='__main__':raise SystemExit(main())
