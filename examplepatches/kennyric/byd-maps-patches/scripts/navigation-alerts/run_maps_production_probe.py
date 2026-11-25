#!/usr/bin/env python3
"""Validate production Maps warning hooks only on the owned warning emulator."""
import argparse
import json
from pathlib import Path
import subprocess
import run_native_probe as base


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--sdk',type=Path,required=True)
    parser.add_argument('--serial',required=True)
    parser.add_argument('--original',type=Path,required=True)
    parser.add_argument('--candidate',type=Path,required=True)
    parser.add_argument('--probe',type=Path,required=True)
    parser.add_argument('--key',type=Path,required=True)
    parser.add_argument('--output',type=Path,required=True)
    parser.add_argument('--scenario',default='production')
    args=parser.parse_args();run_id=base.prepare_output(args.output)
    adb_path=args.sdk/'platform-tools/adb';tools=args.sdk/'build-tools/36.0.0'
    def adb(*command,timeout=180):
        result=subprocess.run([str(adb_path),'-s',args.serial,*map(str,command)],capture_output=True,text=True,timeout=timeout)
        if result.returncode:raise ValueError(f'ADB {command[0]} failed: {result.stdout.strip()} {result.stderr.strip()}')
        return result.stdout
    base.verify_emulator(args.serial,adb('shell','getprop','ro.kernel.qemu'),adb('emu','avd','name'))
    if adb('shell','getprop','sys.boot_completed').strip()!='1':raise ValueError('Owned emulator not booted')
    if base.digest(args.original)!=base.TARGETS['maps'][1]:raise ValueError('Wrong original Maps artifact')
    signed=args.output/'maps-production-test-signed.apk'
    subprocess.run([str(tools/'apksigner'),'sign','--ks',str(args.key),'--ks-key-alias','native-warning-test','--ks-pass','pass:android','--key-pass','pass:android','--out',str(signed),str(args.candidate)],check=True)
    subprocess.run([str(tools/'apksigner'),'verify',str(signed)],check=True)
    base.verify_resigned(args.candidate,signed)
    installed={}
    for package,apk in [('com.google.android.apps.maps',signed),('nl.johninnl.warningprobe.maps',args.probe)]:
        adb('install','--no-incremental','-r',apk)
        paths=[line.removeprefix('package:') for line in adb('shell','pm','path',package).splitlines() if line.startswith('package:')]
        if len(paths)!=1:raise ValueError('Expected one installed base APK')
        actual=adb('shell','sha256sum',paths[0]).split()[0]
        if actual!=base.digest(apk):raise ValueError('Installed APK hash differs')
        installed[package]=actual
    text=adb('shell','am','instrument','-w','-r','-e','scenario',args.scenario,'nl.johninnl.warningprobe.maps/nl.johninnl.warningprobe.NativeWarningProbe')
    (args.output/'instrumentation.txt').write_text(text)
    result=base.parse_result(text)
    if result.get('target_package')!='com.google.android.apps.maps':raise ValueError('Wrong target package')
    result.update(original_sha256=base.digest(args.original),candidate_sha256=base.digest(args.candidate),test_signed_sha256=base.digest(signed),probe_sha256=base.digest(args.probe),serial=args.serial,installed_apk_sha256=installed,run_id=run_id,original_entries_unchanged=False,candidate_signing_entries_unchanged=True)
    temporary=args.output/('result.'+run_id+'.tmp');temporary.write_text(json.dumps(result,indent=2)+'\n');temporary.replace(args.output/'result.json')
    print(json.dumps({'status':result.get('status'),'cases':[{'case':case.get('case'),'status':case.get('status')} for case in result.get('cases',[])],'report':str(args.output/'result.json')}))


if __name__=='__main__':main()
