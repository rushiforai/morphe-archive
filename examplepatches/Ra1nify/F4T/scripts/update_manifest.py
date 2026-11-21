#!/usr/bin/env python3
"""Point patches-bundle.json at a release: version, download URL, date, signing key and changelog.

The manifest is the only thing Morphe reads to describe a bundle: `version` decides whether an update
is offered, `download_url` is the .mpp it downloads, `public_key` is the signer it trusts and
`description` is the changelog it renders. Both channels of this repository use the same schema, only
the values differ (see docs/dev).
"""
import argparse
import datetime
import json
import sys


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("manifest")
    parser.add_argument("version")
    parser.add_argument("download_url")
    parser.add_argument("public_key_file")
    parser.add_argument("--description-file", default=None,
                        help="markdown changelog to embed as the manifest description")
    parser.add_argument("--description", default=None,
                        help="inline description, used when --description-file is absent")
    args = parser.parse_args()

    # utf-8-sig also reads a plain UTF-8 file, so a manifest written by another tool with a BOM
    # still parses.
    with open(args.manifest, encoding="utf-8-sig") as handle:
        manifest = json.load(handle)

    manifest["version"] = args.version
    manifest["download_url"] = args.download_url
    manifest["created_at"] = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%S")
    with open(args.public_key_file, encoding="utf-8") as handle:
        manifest["public_key"] = handle.read().strip()

    if args.description_file:
        with open(args.description_file, encoding="utf-8") as handle:
            manifest["description"] = handle.read().strip()
    elif args.description is not None:
        manifest["description"] = args.description

    with open(args.manifest, "w", encoding="utf-8", newline="\n") as handle:
        json.dump(manifest, handle, indent=2, ensure_ascii=False)
        handle.write("\n")

    print(f"update_manifest: {args.manifest} -> version {args.version}")


if __name__ == "__main__":
    main()
