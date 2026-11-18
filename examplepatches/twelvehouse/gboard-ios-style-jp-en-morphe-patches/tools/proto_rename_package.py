"""Rename the package of an apktool-decoded Gboard so it installs next to the stock app.

Only for local prototyping on an emulator. Renames the manifest package, provider authorities
and app-defined permissions. Class names are left as they are.

Usage: python -I tools/proto_rename_package.py <decoded_dir> <new_package>
"""
import os
import re
import sys

OLD = "com.google.android.inputmethod.latin"


def main(root, new):
    manifest = os.path.join(root, "AndroidManifest.xml")
    with open(manifest, encoding="utf-8") as f:
        text = f.read()

    def authorities(m):
        parts = [new + p[len(OLD):] if p == OLD or p.startswith(OLD + ".") else p for p in m.group(1).split(";")]
        return 'android:authorities="' + ";".join(parts) + '"'

    text = re.sub(r'android:authorities="([^"]*)"', authorities, text)
    # All class names in the decoded manifest are fully qualified, so the package can be changed directly.
    text = text.replace(f'package="{OLD}"', f'package="{new}"', 1)
    for perm in ("DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION", "pixelbundle.RECEIVER"):
        text = text.replace(f'"{OLD}.{perm}"', f'"{new}.{perm}"')
    with open(manifest, "w", encoding="utf-8", newline="\n") as f:
        f.write(text)


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
