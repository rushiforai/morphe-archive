"""Google Health's part of check_app.py: with --dexdump, the patched code is checked for the change
each applied patch makes (verify_google_health.py)."""
import pathlib
import sys


def add_arguments(parser):
    parser.add_argument("--dexdump", help="dexdump, to check that each applied patch changed the code")


def after_patch(check, out_apk, applied):
    if not check.args.dexdump:
        return []
    sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1]))
    import verify_google_health
    print("\nChecking that each applied patch changed the code ...")
    if not verify_google_health.verify(str(out_apk), check.args.dexdump, applied):
        return [("patched code", "an applied patch changed nothing (see above)")]
    return []
