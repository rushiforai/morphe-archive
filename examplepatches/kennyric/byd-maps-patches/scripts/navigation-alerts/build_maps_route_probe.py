#!/usr/bin/env python3
"""Build the reflection-only actual Maps route readiness probe; never starts an app or contacts a device."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import tempfile
import zipfile


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--sdk',type=Path,required=True)
    parser.add_argument('--output',type=Path,required=True)
    parser.add_argument('--key',type=Path,required=True)
    parser.add_argument('--target',choices=['maps'],default='maps')
    parser.add_argument('--maps-package',choices=['com.google.android.apps.maps','org.ungoogled.android.apps.maps'],default='com.google.android.apps.maps')
    args=parser.parse_args();target=args.maps_package if args.target=='maps' else 'app.vela';helper='nl.johninnl.warningprobe.route.maps';args.output.mkdir(parents=True,exist_ok=True)
    tools=args.sdk/'build-tools/36.0.0';android=args.sdk/'platforms/android-36/android.jar'
    def run(*command):subprocess.run(list(map(str,command)),check=True)
    with tempfile.TemporaryDirectory(dir=args.output,prefix='receiver-build-') as temp:
        work=Path(temp);classes=work/'classes';dex=work/'dex';classes.mkdir();dex.mkdir()
        run('javac','--release','8','-cp',android,'-d',classes,Path(__file__).with_name('probe')/'MapsRouteReadinessProbe.java')
        run(tools/'d8','--min-api','29','--lib',android,'--output',dex,*classes.rglob('*.class'))
        manifest=work/'AndroidManifest.xml';manifest.write_text('<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="' + helper + '"><uses-sdk android:minSdkVersion="29" android:targetSdkVersion="34"/><application android:label="Native Maps route readiness probe"/><instrumentation android:name="nl.johninnl.warningprobe.route.MapsRouteReadinessProbe" android:targetPackage="' + target + '"/></manifest>')
        raw=work/'raw.apk';apk=args.output/'probe.apk';run(tools/'aapt2','link','-I',android,'--manifest',manifest,'-o',raw)
        with zipfile.ZipFile(raw,'a',zipfile.ZIP_DEFLATED) as archive:
            for path in dex.glob('classes*.dex'):archive.write(path,path.name)
        run(tools/'zipalign','-f','4',raw,apk)
        run(tools/'apksigner','sign','--ks',args.key,'--ks-key-alias','native-warning-test','--ks-pass','pass:android','--key-pass','pass:android',apk)
        run(tools/'apksigner','verify',apk)
    source=Path(__file__).with_name("probe")/"MapsRouteReadinessProbe.java"
    (args.output/"build-report.json").write_text(json.dumps({"probe_sha256":hashlib.sha256(apk.read_bytes()).hexdigest(),"source_sha256":hashlib.sha256(source.read_bytes()).hexdigest(),"target_package":target,"helper_package":helper,"scope":"Target-only reflection; actual receiver phone lifecycle; no bundled Maps or warning core classes"},indent=2)+"\n")
    (args.output/source.name).write_bytes(source.read_bytes())
    print(apk)


if __name__=='__main__':main()
