"""Reproduce the 1.2.5 CPN/videoId regression and verify the fixed YouTube dispatcher.
Build ArtCaptionHandoffProbe.java (+ Android android.jar) and d8 first. This is a
constructor-free host-method test stopped at the renderer boundary, NOT video playback.
"""
import argparse, hashlib, json, subprocess
from pathlib import Path
p=argparse.ArgumentParser(description=__doc__)
for arg in ('adb','serial','probe-dex','before-apk','after-apk','output'):p.add_argument('--'+arg,required=True)
a=p.parse_args()
if not a.serial.startswith('emulator-'):p.error('Explicit disposable emulator required')
out=Path(a.output);out.mkdir(parents=True,exist_ok=True)
def adb(*args):
    return subprocess.run([a.adb,'-s',a.serial,*args],capture_output=True,text=True,encoding='utf-8',errors='replace')
assert adb('get-state').stdout.strip()=='device'
probe='/data/local/tmp/caption-handoff-probe.dex'
assert adb('push',str(Path(a.probe_dex).resolve()),probe).returncode==0
results={}
for label,apk in [('before',a.before_apk),('after',a.after_apk)]:
    path=Path(apk);digest=hashlib.sha256(path.read_bytes()).hexdigest();remote='/data/local/tmp/caption-handoff-'+digest[:16]+'.apk'
    assert adb('push',str(path.resolve()),remote).returncode==0
    run=adb('shell','CLASSPATH='+probe+':'+remote+' app_process /system/bin ArtCaptionHandoffProbe')
    log=run.stdout+run.stderr;(out/(label+'.log')).write_text(log,encoding='utf-8')
    results[label]={'sha256':digest,'exit_code':run.returncode,'log':label+'.log'}
    if label=='before':assert run.returncode!=0 and 'Automatic dispatcher did not capture video 1' in log,log
    else:assert run.returncode==0 and 'ART_AUTOMATIC_HANDOFF_PASS videos=20' in log,log
report={'sdk':adb('shell','getprop','ro.build.version.sdk').stdout.strip(),
        'abi':adb('shell','getprop','ro.product.cpu.abi').stdout.strip(),
        'old_cpn_owner_regression_reproduced':True,'new_20_automatic_dispatches_passed':True,
        'cpn_distinct_from_video':True,'native_model_factory_and_default_memory_restore':True,
        'host_renderer_boundary_reached':True,'real_video_playback_tested':False,'network_or_paid_api_used':False,'results':results}
(out/'report.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
print(json.dumps(report,indent=2))
