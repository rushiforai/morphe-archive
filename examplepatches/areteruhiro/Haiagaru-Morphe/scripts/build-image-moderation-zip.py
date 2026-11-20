"""Build the optional Morphe input ZIP from pinned upstream releases."""
import argparse
from pathlib import Path
import shutil
import urllib.request
import zipfile

MODEL = "https://huggingface.co/OwenElliott/image-safety-classifier-xs/resolve/54f4560/"
ORT = "https://cdn.jsdelivr.net/gh/microsoft/onnxruntime@v1.23.2/"
AAR_PATH = ("com/microsoft/onnxruntime/onnxruntime-android/1.23.2/"
            "onnxruntime-android-1.23.2.aar")
AAR = (
    "https://maven-central.storage-download.googleapis.com/maven2/" + AAR_PATH,
    "https://repo.maven.apache.org/maven2/" + AAR_PATH,
)
ASSETS = "assets/haiagaru/image-moderation/"
ROOT = Path(__file__).resolve().parents[1]
DEFAULT_SOURCE_CACHE = ROOT / "build" / "optional-assets" / "source-cache"
NG_191 = ROOT / "optional-assets" / "haiagaru-image-ng.zip"
ABIS = ("arm64-v8a", "armeabi-v7a", "x86", "x86_64")


def download(url, destination):
    destination.parent.mkdir(parents=True, exist_ok=True)
    urls = (url,) if isinstance(url, str) else url
    failures = []
    for candidate in urls:
        partial = destination.with_suffix(destination.suffix + ".part")
        try:
            with urllib.request.urlopen(candidate, timeout=60) as source, partial.open("wb") as out:
                shutil.copyfileobj(source, out)
            partial.replace(destination)
            return
        except OSError as error:
            failures.append(f"{candidate}: {error}")
            partial.unlink(missing_ok=True)
    if failures:
        error = "; ".join(failures)
        raise OSError(f"Could not fetch {error}") from None


def cached_download(url, cache, name):
    path = cache / name
    if not path.is_file() or path.stat().st_size == 0:
        download(url, path)
    return path


def bundle_with_vpn(moderation, output):
    output.parent.mkdir(parents=True, exist_ok=True)
    vpn = ROOT / "vpn" / "image-stack"
    licenses = ROOT / "third-party" / "image-stack"
    with zipfile.ZipFile(moderation) as source, zipfile.ZipFile(vpn / "prebuilt" / "image-stack.aar") as aar, \
            zipfile.ZipFile(output, "w", zipfile.ZIP_DEFLATED) as archive:
        def write(name, data):
            archive.writestr(zipfile.ZipInfo(name), data, compress_type=zipfile.ZIP_DEFLATED)

        for name in source.namelist():
            write(name, source.read(name))
        for abi in ABIS:
            name = f"jni/{abi}/libgojni.so"
            write("vpn/" + name, aar.read(name))
        write("vpn/VERSION.txt", (vpn / "VERSION.txt").read_bytes())
        notices = sorted(licenses.glob("*/LICENSE")) + [licenses / "NOTICE.md"]
        for notice in notices:
            write("vpn/licenses/image-stack/" + notice.relative_to(licenses).as_posix(), notice.read_bytes())


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("output", type=Path)
    parser.add_argument("--split", action="store_true", help="Also create the model ZIP, runtime ZIP and combined VPN ZIP.")
    parser.add_argument("--vpn-output", type=Path, help="Also create a combined image moderation and VPN ZIP.")
    parser.add_argument("--source-cache", type=Path, default=DEFAULT_SOURCE_CACHE,
                        help="Directory for downloaded source assets (default: build/optional-assets/source-cache).")
    args = parser.parse_args()
    if args.split and args.vpn_output is None:
        args.vpn_output = args.output.with_name(args.output.stem + "-vpn.zip")
    if args.vpn_output and args.vpn_output.resolve() in {
        args.output.resolve(),
        *(args.output.with_name(args.output.stem + "-" + part + ".zip").resolve() for part in ("model", "runtime")),
    }:
        parser.error("--vpn-output must name a separate ZIP")
    args.output.parent.mkdir(parents=True, exist_ok=True)
    urls = {
        "model.onnx": MODEL + "onnx/image-safety-classifier-xs.onnx",
        "MODEL-NOTICE.txt": MODEL + "README.md",
        "ONNX-LICENSE.txt": ORT + "LICENSE",
        "ONNX-ThirdPartyNotices.txt": ORT + "ThirdPartyNotices.txt",
        "SWIFTFORMER-LICENSE.txt": "https://raw.githubusercontent.com/Amshaker/SwiftFormer/main/LICENSE",
    }
    cache = args.source_cache.resolve()
    sources = {name: cached_download(url, cache, name) for name, url in urls.items()}
    runtime_path = cached_download(AAR, cache, "runtime.aar")
    with zipfile.ZipFile(NG_191) as legacy, zipfile.ZipFile(runtime_path) as runtime, zipfile.ZipFile(
            args.output, "w", zipfile.ZIP_DEFLATED, compresslevel=6) as bundle:
        for name in urls:
            entry = zipfile.ZipInfo(ASSETS + name)
            bundle.writestr(entry, sources[name].read_bytes(), compress_type=zipfile.ZIP_DEFLATED)
        for abi in ABIS:
            fix = f"{abi}/libtensorflowlite_jni.so"
            bundle.writestr(zipfile.ZipInfo("chmate191/" + fix), legacy.read(fix), compress_type=zipfile.ZIP_DEFLATED)
            for name in ("libonnxruntime.so", "libonnxruntime4j_jni.so"):
                suffix = f"{abi}/{name}"
                bundle.writestr(zipfile.ZipInfo("lib/" + suffix), runtime.read("jni/" + suffix), compress_type=zipfile.ZIP_DEFLATED)
    if args.split:
        with zipfile.ZipFile(args.output) as combined:
            for part in ("model", "runtime"):
                target = args.output.with_name(args.output.stem + "-" + part + ".zip")
                with zipfile.ZipFile(target, "w", zipfile.ZIP_DEFLATED) as archive:
                    for name in combined.namelist():
                        is_model = name.endswith(("/model.onnx", "/MODEL-NOTICE.txt", "/SWIFTFORMER-LICENSE.txt"))
                        if name.startswith("chmate191/") or (part == "model") != is_model:
                            continue
                        archive.writestr(zipfile.ZipInfo(name), combined.read(name), compress_type=zipfile.ZIP_DEFLATED)
    if args.vpn_output:
        bundle_with_vpn(args.output, args.vpn_output)


if __name__ == "__main__":
    main()
