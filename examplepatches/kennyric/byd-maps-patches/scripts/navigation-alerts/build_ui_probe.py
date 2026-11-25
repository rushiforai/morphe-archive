#!/usr/bin/env python3
"""Build reflection-only target rendering instrumentation; never contacts a device."""
import argparse
from pathlib import Path
import subprocess
import tempfile
import zipfile

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--sdk',type=Path,required=True)
    parser.add_argument('--target-package',required=True)
    parser.add_argument('--output',type=Path,required=True)
    parser.add_argument('--key',type=Path,required=True)
    args=parser.parse_args()
    if args.target_package not in {'app.vela','com.google.android.apps.maps','org.ungoogled.android.apps.maps','org.ungoogled.android.apps.maps.microg'}:parser.error('Unsupported UI target')
    args.output.mkdir(parents=True,exist_ok=True);tools=args.sdk/'build-tools/36.0.0';android=args.sdk/'platforms/android-36/android.jar'
    def run(*cmd):subprocess.run(list(map(str,cmd)),check=True)
    with tempfile.TemporaryDirectory(dir=args.output,prefix='ui-build-') as temp:
        work=Path(temp);classes=work/'classes';dex=work/'dex';classes.mkdir();dex.mkdir()
        run('javac','--release','8','-cp',android,'-d',classes,Path(__file__).with_name('probe')/'NativeWarningUiProbe.java')
        run(tools/'d8','--min-api','29','--lib',android,'--output',dex,*classes.rglob('*.class'))
        package='nl.johninnl.warningprobe.ui.'+('vela' if args.target_package=='app.vela' else 'maps')
        manifest=work/'AndroidManifest.xml';manifest.write_text('<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="'+package+'"><uses-sdk android:minSdkVersion="29" android:targetSdkVersion="34"/><application android:label="Synthetic warning UI component probe"/><instrumentation android:name="nl.johninnl.warningprobe.NativeWarningUiProbe" android:targetPackage="'+args.target_package+'"/></manifest>')
        raw=work/'raw.apk';apk=args.output/'probe.apk';run(tools/'aapt2','link','-I',android,'--manifest',manifest,'-o',raw)
        with zipfile.ZipFile(raw,'a',zipfile.ZIP_DEFLATED) as archive:
            for path in dex.glob('classes*.dex'):archive.write(path,path.name)
        run(tools/'zipalign','-f','4',raw,apk);run(tools/'apksigner','sign','--ks',args.key,'--ks-key-alias','native-warning-test','--ks-pass','pass:android','--key-pass','pass:android',apk);run(tools/'apksigner','verify',apk)
    print(apk)

if __name__=='__main__':main()
