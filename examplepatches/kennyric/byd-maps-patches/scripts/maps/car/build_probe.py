"""Build an instrumentation APK that executes only the renderer inside the target Maps DEX."""
import argparse
from pathlib import Path
import subprocess
import zipfile


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--sdk", type=Path, required=True)
    parser.add_argument("--desktop", type=Path, required=True)
    parser.add_argument("--key", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--target", default="org.ungoogled.android.apps.maps")
    args = parser.parse_args()
    tools = args.sdk / "build-tools/36.1.0"
    android = args.sdk / "platforms/android-36/android.jar"
    classes, dex = args.out / "classes", args.out / "dex"
    classes.mkdir(parents=True, exist_ok=True)
    dex.mkdir(parents=True, exist_ok=True)

    def run(*command):
        subprocess.run([str(value) for value in command], check=True)

    run("javac", "--release", "8", "-Xlint:-options", "-cp", android, "-d", classes,
        Path(__file__).with_name("RendererProbe.java"), Path(__file__).with_name("LegacyClientProbe.java"),
        Path(__file__).with_name("NavigationPermissionProbe.java"))
    run(tools / "d8", "--min-api", "29", "--lib", android, "--output", dex, *sorted(classes.rglob("*.class")))
    manifest = args.out / "AndroidManifest.xml"
    manifest.write_text('<manifest xmlns:android="http://schemas.android.com/apk/res/android" '
                        'package="nl.johninnl.mapsrenderprobe"><uses-sdk android:minSdkVersion="29" '
                        'android:targetSdkVersion="36"/><application android:label="Maps native renderer probe"/>'
                        '<instrumentation android:name="nl.johninnl.mapsprojectionprobe.RendererProbe" '
                        f'android:targetPackage="{args.target}"/>'
                        '<instrumentation android:name="nl.johninnl.mapsprojectionprobe.LegacyClientProbe" '
                        f'android:targetPackage="{args.target}"/>'
                        '<instrumentation android:name="nl.johninnl.mapsprojectionprobe.NavigationPermissionProbe" '
                        f'android:targetPackage="{args.target}"/></manifest>')
    unsigned, output = args.out / "unsigned.apk", args.out / "probe.apk"
    run(tools / "aapt2", "link", "-I", android, "--manifest", manifest, "-o", unsigned)
    with zipfile.ZipFile(unsigned, "a", zipfile.ZIP_DEFLATED) as archive:
        for path in sorted(dex.glob("classes*.dex")):
            archive.write(path, path.name)
    run(tools / "zipalign", "-f", "4", unsigned, output)
    run("java", "-cp", str(tools / "lib/apksigner.jar") + ":" + str(args.desktop.resolve()),
        "com.android.apksigner.ApkSignerTool", "sign", "--ks", args.key,
        "--ks-type", "BKS", "--ks-provider-class", "org.bouncycastle.jce.provider.BouncyCastleProvider",
        "--ks-key-alias", "Morphe", "--ks-pass", "pass:", "--key-pass", "pass:Morphe", output)
    run(tools / "apksigner", "verify", output)
    print(output)


if __name__ == "__main__":
    main()
