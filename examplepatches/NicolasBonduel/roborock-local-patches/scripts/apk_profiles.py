BUNDLE = "assets/plugin/features/feature_login_page/feature_login_page/index.android.bundle"
LIBRARY = "lib/arm64-v8a/librrcodec.so"
PROFILES = {
    "4.76.08": {
        "apk_sha256": "f26660665dcb39b4688e976d16ff2dc270f31867780c3b1628f0263a6fa03203",
        "version_code": 100944,
        "bundle_sha256": "5b0b4f7c18a015ed3b1926b141d637f611a33ee4d56e51395b90dee064facef2",
        "library_sha256": "3e2b5077afe18db6eac23e5d5989f88d21bd00c04caa0ee8b1b5e0d53a7b3c66",
        "build_id": "0327f08a887cb141b7b9002c9eb9bb963817a06a",
        "checks": {0x4914C: "8d050094"},
        "dependencies": [152, 1, 628, 556, 435],
        "dex": "classes4.dex",
        "new_dex": "classes6.dex",
        "saved_url_class": "Lcom/roborock/smart/refactor/data/repo/user/o0OoOo0;",
    },
}


def identify_apk(path):
    import hashlib

    digest = hashlib.sha256(path.read_bytes()).hexdigest()
    for version, profile in PROFILES.items():
        if digest == profile["apk_sha256"]:
            return version, profile
    raise ValueError("Unsupported original APK SHA-256; no verified build profile")


if __name__ == "__main__":
    import sys
    from pathlib import Path

    print(identify_apk(Path(sys.argv[1]))[0])
