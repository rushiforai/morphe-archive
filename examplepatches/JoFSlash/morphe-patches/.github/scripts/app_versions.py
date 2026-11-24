"""What the version scripts and the version workflow need to know about an app, from the "versions"
settings in its .github/apps/<app>.json. watch_version.py, fetch_apk.py and add_version.py import
it; app-version.yml runs it to read the settings into workflow outputs.

The "versions" settings:
  pattern       a regular expression for a whole version name. Versions are compared number by
                number, or by the named group "code" when the pattern has one (Google Health's
                version names carry a version code that only goes up).
  example       a version name, for messages.
  source        where new versions come from:
                  apkmirror  APKMirror's feed is watched and the file is downloaded from APKMirror;
                             "apkmirror" is the app's path there (/apk/<maker>/<app>/).
                  apkpure    APKPure's latest endpoint is watched and downloaded from (it only hands
                             out the newest version); "apkpure" is the app's page there.
                  hand       the app isn't on APKMirror: the version on Google Play ("play_country")
                             is watched, with APKPure's page ("apkpure") when Google Play can't be
                             read, and the file is added to JoFSlash/morphe-apks by hand.
  file          apkm (an APKMirror bundle), apk (one APK) or apks (a zip of base.apk and its
                splits, added by hand).
  shows         what the patched app shows on the emulator, for the pull request ("shows its own
                screen").
  phone_test    what to try on a phone before merging, for the pull request.
Optional:
  signature_constant  the constant in Constants.kt with the SHA-1 of the app's certificate
                      (SIGNATURE).
  more_signatures     more certificate SHA-1s the app may be signed with (a rotated key).
  cert_sha256         for "hand": the SHA-256 of the certificate base.apk is signed with.
  signer              who signs the app, for messages (the app's name).
  bundle_cpus         for APKMirror bundles: CPU types to prefer, in order (regular expressions
                      over the bundle's row); any bundle is taken when none matches.
  play_country        for "apkmirror": also read Google Play's version (Quora), and say in an issue
                      when only Google Play has a newer one; "play_note" is added to that issue.
  check_flags         what the emulator check expects to see (--expect-screen).
  emulator_api        the Android API level of the emulator (35).
  pr_base             the branch pull requests go to (main). With dev, the workflow also starts
                      from dev.
  bump_title          false: the pull request title is "Support <app> <version>" without "bump: "
                      in front (the commit has it either way).

python3 app_versions.py <app> --github-output <file>   writes the settings the workflow uses
"""
import argparse
import json
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[2]
APKMIRROR = "https://www.apkmirror.com"
USER_AGENT = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0 Safari/537.36"
SOURCES = {"apkmirror": "APKMirror", "apkpure": "APKPure", "hand": "Google Play"}
FILES = {"apkm": "APKM", "apk": "APK", "apks": "APKS"}


class App:
    def __init__(self, key):
        path = ROOT / ".github" / "apps" / f"{key}.json"
        if not path.exists():
            names = ", ".join(sorted(p.stem for p in path.parent.glob("*.json")))
            sys.exit(f"No app {key!r} in .github/apps (there are: {names})")
        settings = json.loads(path.read_text(encoding="utf-8"))
        if "versions" not in settings:
            sys.exit(f"{key}: there are no \"versions\" settings in {path.relative_to(ROOT)}")
        self.key = key
        self.settings = settings
        self.v = settings["versions"]
        self.name = settings["name"]
        self.package = settings["package"]
        self.constants = ROOT / settings["patches"] / "shared" / "Constants.kt"
        self.pattern = re.compile(self.v["pattern"])
        self.example = self.v["example"]
        self.source = self.v["source"]
        self.file = self.v["file"]
        self.signer = self.v.get("signer", self.name)

    # Versions

    def valid(self, version):
        return bool(self.pattern.fullmatch(version))

    def order(self, version):
        """A sort key: the version code when the pattern has one, else the numbers in the name."""
        match = self.pattern.fullmatch(version)
        if not match:
            return (0,)
        if "code" in self.pattern.groupindex:
            return (int(match.group("code")),)
        return tuple(int(part) for part in version.split("."))

    def listed(self):
        return re.findall(r'AppTarget\(version = "([^"]+)"', self.constants.read_text(encoding="utf8"))

    def find(self, text):
        """The first version name in a text, as a whole word."""
        match = re.search(r"\b(?:" + self.v["pattern"] + r")\b", text)
        return match.group(0) if match else None

    # Where it comes from

    @property
    def apkmirror_path(self):
        return self.v["apkmirror"]

    @property
    def feed(self):
        return APKMIRROR + self.apkmirror_path + "feed/"

    @property
    def apkpure_endpoint(self):
        return f"https://d.apkpure.com/b/APK/{self.package}?version=latest"

    def play_page(self, country):
        return f"https://play.google.com/store/apps/details?id={self.package}&hl=en&gl={country}"

    @property
    def source_link(self):
        if self.source == "apkmirror":
            return APKMIRROR + self.apkmirror_path
        if self.source == "apkpure":
            return self.v["apkpure"]
        return self.settings["store"]

    def signatures(self):
        """The SHA-1s of the certificates the app may be signed with."""
        constant = self.v.get("signature_constant", "SIGNATURE")
        match = re.search(rf'\b{constant} = "([0-9a-f]{{40}})"', self.constants.read_text(encoding="utf8"))
        if not match:
            sys.exit(f"No {constant} in {self.constants.relative_to(ROOT)}")
        return {match.group(1), *self.v.get("more_signatures", [])}


def workflow_outputs(app):
    v = app.v
    return {
        "name": app.name,
        "package": app.package,
        "pattern": v["pattern"],
        "example": app.example,
        "source": app.source,
        "source_name": SOURCES[app.source],
        "source_link": app.source_link,
        "file": app.file,
        "file_name": FILES[app.file],
        "store": app.settings["store"],
        "shows": v["shows"],
        "phone_test": v["phone_test"],
        "play": "true" if v.get("play_country") and app.source == "apkmirror" else "",
        "play_note": v.get("play_note", ""),
        "check_flags": v.get("check_flags", "--expect-screen"),
        "emulator_api": str(v.get("emulator_api", "35")),
        "pr_base": v.get("pr_base", "main"),
        "bump_title": "true" if v.get("bump_title", True) else "false",
        "cert_sha256": v.get("cert_sha256", ""),
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("app", help="The name of the app's file in .github/apps (without .json)")
    parser.add_argument("--github-output", help="File to append the settings to, as workflow outputs")
    parser.add_argument("--check", metavar="VERSION", help="Exit 1 unless this is a version name of the app")
    args = parser.parse_args()
    app = App(args.app)
    if args.check is not None:
        if not app.valid(args.check):
            print(f"Not a version of {app.name}: {args.check} (they look like {app.example})")
            sys.exit(1)
        return
    outputs = workflow_outputs(app)
    for name, value in outputs.items():
        print(f"{name}={value}")
    if args.github_output:
        with open(args.github_output, "a", encoding="utf8") as out:
            for name, value in outputs.items():
                out.write(f"{name}={value}\n")


if __name__ == "__main__":
    main()
