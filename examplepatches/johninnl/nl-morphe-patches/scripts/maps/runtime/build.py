#!/usr/bin/env python3
"""Build test-only Maps controlled publishers and read-only instrumentation; never install an APK."""
import argparse
from pathlib import Path
import subprocess
import zipfile

def run(*args):
    subprocess.run([str(x) for x in args], check=True)

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--sdk",type=Path,required=True)
    parser.add_argument("--desktop",type=Path,required=True,help="Morphe desktop fat JAR containing the BC provider for its BKS signing key")
    parser.add_argument("--key",type=Path,required=True)
    parser.add_argument("--out",type=Path,required=True)
    parser.add_argument("--target",default="org.ungoogled.android.apps.maps")
    args=parser.parse_args();src=Path(__file__).resolve().parent;tools=args.sdk/"build-tools/36.0.0";android=args.sdk/"platforms/android-36/android.jar"
    for name,package in [("waze","com.waze"),("flitsmeister","nl.flitsmeister"),("consumer","nl.johninnl.mapsconsumerprobe")]:
        out=args.out/name;classes=out/"classes";dex=out/"dex";classes.mkdir(parents=True,exist_ok=True);dex.mkdir(parents=True,exist_ok=True)
        sources=[src/"MapsConsumerProbe.java"] if name=="consumer" else [src/"ReplayActivity.java",src/"ReplayService.java"]
        run("javac","--release","8","-cp",android,"-d",classes,*sources)
        run(tools/"d8","--min-api","34","--lib",android,"--output",dex,*sorted(classes.rglob("*.class")))
        app='<application android:label="Maps controlled replay test" android:theme="@android:style/Theme.Material.Light.NoActionBar"><activity android:name="nl.johninnl.mapsreplay.ReplayActivity" android:exported="true"/><service android:name="nl.johninnl.mapsreplay.ReplayService" android:exported="false" android:foregroundServiceType="dataSync"/></application>'
        if name=="consumer":app='<application android:label="Maps read-only consumer probe"/><instrumentation android:name="nl.johninnl.mapsconsumerprobe.MapsConsumerProbe" android:targetPackage="'+args.target+'" android:functionalTest="true"/>'
        manifest=out/"AndroidManifest.xml";manifest.write_text('<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="'+package+'" android:versionCode="1" android:versionName="maps-consumer-replay-1"><uses-sdk android:minSdkVersion="34" android:targetSdkVersion="36"/><uses-permission android:name="android.permission.FOREGROUND_SERVICE"/><uses-permission android:name="android.permission.FOREGROUND_SERVICE_DATA_SYNC"/>'+app+'</manifest>')
        unaligned=out/"unaligned.apk";apk=out/"probe.apk";run(tools/"aapt2","link","-I",android,"--manifest",manifest,"-o",unaligned)
        with zipfile.ZipFile(unaligned,"a",zipfile.ZIP_DEFLATED) as z:
            for path in sorted(dex.glob("classes*.dex")):z.write(path,path.name)
        run(tools/"zipalign","-f","4",unaligned,apk)
        run("java","-cp",str(tools/"lib/apksigner.jar")+":"+str(args.desktop),"com.android.apksigner.ApkSignerTool","sign","--ks",args.key,"--ks-type","BKS","--ks-provider-class","org.bouncycastle.jce.provider.BouncyCastleProvider","--ks-key-alias","Morphe","--ks-pass","pass:","--key-pass","pass:Morphe",apk)
        run(tools/"apksigner","verify",apk);print("Built",apk)
if __name__=="__main__":main()
