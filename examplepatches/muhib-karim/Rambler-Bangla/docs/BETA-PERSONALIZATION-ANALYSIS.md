# Beta personalization analysis

Status: preparation only. No beta patch is implemented or released. The existing
18.3.1 profile is unchanged. Do not pass an 18.6 APK to that profile or relax its
fingerprint checks.

## Target and evidence

The public teardown describes four settings in the Gboard 18.6.3.10 beta line:
remember corrected words, contact names, a voice correction list with import and
export, and clearing collected words. Settings screenshots are evidence of UI,
not proof that learning, contacts or import/export work on a patched device.

Source: https://www.androidauthority.com/gboard-rambler-corrected-words-contacts-apk-teardown-3732028/

A candidate beta distribution page was inspected for
18.6.3.1002251336-beta-arm64-v8a, versionCode 176071774:

https://www.apkmirror.com/apk/google-inc/gboard/gboard-the-google-keyboard-18-6-3-1002251336-release/gboard-the-google-keyboard-18-6-3-1002251336-beta-arm64-v8a-android-apk-download/

The candidate binary has not been acquired or analyzed. It is not yet proven
identical to the teardown build. The page is not a verified direct file URL.
It describes a bundle; the analyzer below needs an extracted APK, not an APKM.

## Analysis aid

```sh
python3 scripts/find_personalization_flags.py /private/path/gboard.apk > /private/path/analysis.json
python3 -m unittest discover -s tests/python -p test_find_personalization_flags.py -v
```

The stdlib-only tool reports the input SHA-256, DEX string-index matches and
candidate key substrings. It also looks for UTF-8 and UTF-16LE UI text bytes in
`resources.arsc`. It does not decode resource IDs, find callers or identify a
confirmed flag gate. UI text may be missing, localized, encoded differently or
stored elsewhere. No hits do not prove feature absence. Candidate keys do not
prove a setting is controlled by those keys.

DEX 035 and 037-040 are supported for basic string-table inspection. This is not
a complete DEX verifier. DEX 041 and APKM bundles are unsupported. Corrupt or
unsupported DEX input aborts without a JSON report. Test fixtures are original
synthetic data, not Google code. The tool never modifies an APK.

Keep input APKs and analysis reports private: reports can contain proprietary
strings and local file paths. Do not commit them.

## Remaining gates before a working release

1. Acquire the authorized beta APK, verify package, version, Google signer and
   SHA-256. For split packages, preserve and identify each input split.
2. Trace settings resources and callers to actual flag reads. Map the feature
   implementation and dependencies separately from the visibility gate.
3. Write a new version-specific profile and original patch source with synthetic
   fixtures. Abort on fingerprint or structure drift; preserve the 18.3.1 path.
4. Review and host-test the patch. Build success alone is not runtime evidence.
5. On a separate test device, prove corrected-word learning and persistence,
   contacts consent and behavior, import/export round trips and malformed-file
   rejection, and clearing behavior. Check privacy-sensitive fields and Bengali
   mixed-script regression cases. Do not uninstall or replace a daily keyboard
   to obtain the input binary.
6. Publish original source only after review, with separate evidence labels for
   UI visibility, host tests and actual device behavior. Do not publish Google's
   APKs or decompiled code.

This document is an analysis plan, not a version announcement or release note.
