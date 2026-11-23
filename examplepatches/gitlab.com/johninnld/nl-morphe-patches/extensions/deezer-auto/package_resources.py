"""Package linked resources and verify the emitted APK's car classloader resource."""
import argparse
import io
import pathlib
import subprocess
import tempfile
import zipfile

CAR_API_RESOURCE = "car-app-api.level"
PINNED_CAR_API_BYTES = b"9\n"


def pinned_car_api_bytes(aar):
    with zipfile.ZipFile(aar) as archive:
        with zipfile.ZipFile(io.BytesIO(archive.read("classes.jar"))) as classes:
            if classes.namelist().count(CAR_API_RESOURCE) != 1:
                raise ValueError("Pinned car library must contain exactly one root API-level resource")
            data = classes.read(CAR_API_RESOURCE)
    if data != PINNED_CAR_API_BYTES:
        raise ValueError("Pinned car library API-level bytes changed")
    return data


def verify_apk_resource(apk, expected):
    with zipfile.ZipFile(apk) as archive:
        placements = [name for name in archive.namelist() if name.rsplit("/", 1)[-1] == CAR_API_RESOURCE]
        if placements != [CAR_API_RESOURCE]:
            raise ValueError("Emitted APK must contain exactly one car-app-api.level at the classloader root")
        if archive.read(CAR_API_RESOURCE) != expected:
            raise ValueError("Emitted APK car-app-api.level differs from the pinned library")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("apk", type=pathlib.Path)
    parser.add_argument("output", type=pathlib.Path, nargs="?")
    parser.add_argument("--pinned-aar", type=pathlib.Path, required=True)
    parser.add_argument("--verify-apk", action="store_true")
    args = parser.parse_args()
    expected = pinned_car_api_bytes(args.pinned_aar)
    verify_apk_resource(args.apk, expected)
    if args.verify_apk:
        if args.output is not None:
            parser.error("--verify-apk does not write an output archive")
        print("Emitted APK root car-app-api.level matches the pinned library byte for byte")
        return
    if args.output is None:
        parser.error("Resource packaging requires an output archive")
    apk, output = args.apk, args.output
    output.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="deezer-auto-resources-") as scratch:
        decoded = pathlib.Path(scratch) / "decoded"
        subprocess.run(["apktool", "decode", "--no-src", "--force", "--output", str(decoded), str(apk)], check=True)
        with zipfile.ZipFile(output, "w", zipfile.ZIP_DEFLATED) as archive:
            # Not an Android res/ or assets/ file: the library opens this exact root path.
            archive.writestr(CAR_API_RESOURCE, expected)
            for file in sorted((decoded / "res").rglob("*")):
                if file.is_file():
                    archive.write(file, file.relative_to(decoded).as_posix())


if __name__ == "__main__":
    main()
