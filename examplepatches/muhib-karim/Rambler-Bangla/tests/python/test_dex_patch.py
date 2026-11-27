#!/usr/bin/env python3
"""Unit tests for the pure helpers in standalone-patcher/dex_patch.py.

Needs only Python 3 (stdlib unittest): no JDK, toolchain or APK.
    python3 -m unittest discover -s tests/python -v
"""
import contextlib
import hashlib
import importlib.util
import io
import json
import os
import re
import subprocess
import sys
import tempfile
import unittest
import zipfile
from unittest import mock

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
PATCHER = os.path.join(ROOT, "standalone-patcher", "dex_patch.py")
FIXTURE_PROFILE = os.path.join(ROOT, "fixtures", "fixture-profile.json")

_spec = importlib.util.spec_from_file_location("dex_patch", PATCHER)
dp = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(dp)

CLEANUP_PROTO = ("(Lhrl;Ljava/lang/String;ILqqi;Laebb;Ljava/lang/String;"
                 "Laugd;Ljava/util/concurrent/atomic/AtomicBoolean;)V")


def read_lines(path):
    with open(path, encoding="utf-8") as fh:
        return fh.read().splitlines()


class SmaliStringTests(unittest.TestCase):
    def test_unescape_basic_escapes(self):
        self.assertEqual(dp.smali_unescape(r"a\nb\tc\\d\"e\'f"), "a\nb\tc\\d\"e'f")

    def test_unescape_unicode(self):
        self.assertEqual(dp.smali_unescape(r"\u09ac\u09be"), "বা")

    def test_unescape_rejects_trailing_backslash(self):
        with self.assertRaises(dp.PatchError):
            dp.smali_unescape("abc\\")

    def test_unescape_rejects_unknown_escape(self):
        with self.assertRaises(dp.PatchError):
            dp.smali_unescape(r"\q")

    def test_unescape_rejects_malformed_unicode(self):
        # Short tail, non-hex, sign, underscore, nothing at all.
        for bad in (r"\u12", r"\uZZZZ", r"\u+abc", r"\u1_23", "\\u"):
            with self.subTest(bad=bad):
                with self.assertRaises(dp.PatchError):
                    dp.smali_unescape(bad)

    def test_parse_const_string(self):
        self.assertEqual(dp.parse_const_string('    const-string v1, "{ENABLED_LANGUAGES}"'),
                         ("v1", "{ENABLED_LANGUAGES}"))
        self.assertEqual(dp.parse_const_string('    const-string/jumbo p0, "x\\ny"'),
                         ("p0", "x\ny"))
        self.assertIsNone(dp.parse_const_string("    const/4 v0, 0x1"))

    def test_sha256_text_is_utf8(self):
        self.assertEqual(dp.sha256_text("বাংলা"),
                         hashlib.sha256("বাংলা".encode("utf-8")).hexdigest())


class InvokeParseTests(unittest.TestCase):
    def test_parse_invoke_list(self):
        regs, ref = dp.parse_invoke("    invoke-virtual {p1, v1, v2}, " + dp.STRING_REPLACE)
        self.assertEqual(regs, ["p1", "v1", "v2"])
        self.assertEqual(ref, dp.STRING_REPLACE)

    def test_parse_invoke_range(self):
        regs, _ = dp.parse_invoke("    invoke-static/range {v3 .. v5}, Lx;->y()V")
        self.assertEqual(regs, ["v3", "v4", "v5"])

    def test_parse_invoke_range_keeps_param_prefix(self):
        regs, _ = dp.parse_invoke("    invoke-virtual/range {p1 .. p3}, " + dp.STRING_REPLACE)
        self.assertEqual(regs, ["p1", "p2", "p3"])

    def test_parse_invoke_rejects_unresolvable_ranges(self):
        for regs in ("v14 .. p1", "p0 .. v2", "v5 .. v3", "v3 .. ", "v3 .. v4 .. v5"):
            with self.subTest(regs=regs):
                with self.assertRaises(dp.PatchError):
                    dp.parse_invoke("    invoke-static/range {%s}, Lx;->y()V" % regs)

    def test_parse_invoke_empty_and_non_invoke(self):
        self.assertEqual(dp.parse_invoke("    invoke-static {}, Lx;->y()V"), ([], "Lx;->y()V"))
        self.assertIsNone(dp.parse_invoke("    move-result-object v0"))


class RegisterMathTests(unittest.TestCase):
    def test_param_slots_static_and_instance(self):
        self.assertEqual(dp.param_slots("()V", True), 0)
        self.assertEqual(dp.param_slots("()V", False), 1)
        self.assertEqual(dp.param_slots("(ILjava/lang/String;Z)V", True), 3)

    def test_param_slots_wide_types(self):
        self.assertEqual(dp.param_slots("(JD)V", True), 4)

    def test_param_slots_arrays_are_one_slot(self):
        self.assertEqual(dp.param_slots("([J)V", True), 1)
        self.assertEqual(dp.param_slots("([[D)V", True), 1)
        self.assertEqual(dp.param_slots("([Ljava/lang/String;I)V", True), 2)

    def test_param_slots_cleanup_builder(self):
        self.assertEqual(dp.param_slots(CLEANUP_PROTO, True), 8)

    def test_bump_locals_from_locals(self):
        lines = [".method public static f()V", "    .locals 3", ".end method"]
        self.assertEqual(dp.bump_locals(lines, 0, 3, "()V", True), 3)
        self.assertEqual(lines[1], "    .locals 6")

    def test_bump_locals_from_registers(self):
        lines = [".method public f(J)V", "    .registers 6", ".end method"]
        # 6 registers - (this + long) = 3 locals
        self.assertEqual(dp.bump_locals(lines, 0, 2, "(J)V", False), 3)
        self.assertEqual(lines[1], "    .locals 5")

    def test_bump_locals_missing_directive(self):
        with self.assertRaises(dp.PatchError):
            dp.bump_locals([".method f()V", ".end method"], 0, 1, "()V", True)


class FixtureSmaliTests(unittest.TestCase):
    """Runs the dataflow helpers on the synthetic fixture's cleanup builder."""

    def setUp(self):
        self.lines = read_lines(os.path.join(ROOT, "fixtures", "src", "kfd.smali"))

    def test_method_bounds(self):
        start, end = dp.method_bounds(self.lines, "d", CLEANUP_PROTO)
        self.assertTrue(self.lines[start].startswith(".method"))
        self.assertEqual(self.lines[end].strip(), ".end method")

    def test_method_bounds_missing(self):
        with self.assertRaises(dp.PatchError):
            dp.method_bounds(self.lines, "nope", "()V")

    def test_method_bounds_matches_whole_method_token(self):
        lines = [".method public static xd()V", ".end method",
                 ".method public static d()V", ".end method"]
        self.assertEqual(dp.method_bounds(lines, "d", "()V"), (2, 3))
        # A longer name that merely ends with the target is not the target.
        with self.assertRaises(dp.PatchError):
            dp.method_bounds(lines[:2], "d", "()V")

    def test_find_enabled_languages_site(self):
        start, end = dp.method_bounds(self.lines, "d", CLEANUP_PROTO)
        langs_reg, result_reg, idx = dp.find_enabled_languages_site(
            self.lines, start, end, "{ENABLED_LANGUAGES}")
        self.assertEqual((langs_reg, result_reg), ("v2", "v0"))
        self.assertIn("move-result-object", self.lines[idx])

    def test_find_enabled_languages_site_fails_closed(self):
        start, end = dp.method_bounds(self.lines, "d", CLEANUP_PROTO)
        with self.assertRaises(dp.PatchError):
            dp.find_enabled_languages_site(self.lines, start, end, "{NOT_THERE}")

    def test_hook_snippet_uses_consecutive_temps(self):
        snip = dp.hook_snippet("v3", "v0", "v2", dp.EXT_DEFAULT, dp.RULE_HOOK)
        self.assertEqual(len(snip), 5)
        self.assertIn("invoke-static/range {v3 .. v4}", snip[2])
        self.assertTrue(snip[2].endswith(dp.RULE_HOOK +
                        "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;"))
        self.assertEqual(snip[-1].split(), ["move-object/from16", "v0,", "v3"])


class PatchMethodTests(unittest.TestCase):
    """patch_method on the fixture cleanup builder, in memory (no toolchain)."""

    def setUp(self):
        self.lines = read_lines(os.path.join(ROOT, "fixtures", "src", "kfd.smali"))
        self.profile = dp.Profile(FIXTURE_PROFILE)

    def test_fixture_gets_both_hooks_and_a_saved_languages_register(self):
        out = dp.patch_method(list(self.lines), self.profile, {})
        text = "\n".join(out)
        # The same facts tests/run_tests.sh greps for in the reassembled dex.
        self.assertIn("    .locals 6", out)
        self.assertIn("    move-object/from16 v3, v2", out)
        self.assertIn("->" + dp.PROMPT_HOOK + "(", text)
        self.assertIn("->" + dp.RULE_HOOK + "(", text)
        self.assertNotIn("invoke-static/range {v4 .. v4}", text)
        self.assertLess(text.index(dp.PROMPT_HOOK), text.index(dp.RULE_HOOK))

    def test_aborts_when_result_register_is_the_languages_register(self):
        # String.replace(p1, v1, v2) followed by move-result-object v2: the
        # languages value in v2 is gone before it can be saved.
        idx = self.lines.index("    move-result-object v0")
        self.lines[idx] = "    move-result-object v2"
        before = list(self.lines)
        with self.assertRaises(dp.PatchError) as ctx:
            dp.patch_method(self.lines, self.profile, {})
        self.assertIn("enabled-languages register", str(ctx.exception))
        self.assertEqual(self.lines, before, "nothing may be rewritten before the abort")

    def test_empty_input_fails_closed(self):
        with self.assertRaises(dp.PatchError):
            dp.patch_method([], self.profile, {})


class InputGuardTests(unittest.TestCase):
    """Checks that run before the workdir is deleted or any tool starts."""

    def setUp(self):
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        self.dir = tmp.name

    def file(self, name, data=None):
        path = os.path.join(self.dir, name)
        if data is not None:
            with open(path, "wb") as fh:
                fh.write(data)
        return path

    def test_extension_dex_accepts_none_and_a_dex_file(self):
        dp.check_extension_dex(None)
        dp.check_extension_dex(self.file("ok.dex", b"dex\n037\x00rest"))

    def test_extension_dex_rejects_missing_directory_and_non_dex(self):
        for bad in (self.file("absent.dex"), self.dir, "",
                    self.file("zip.dex", b"PK\x03\x04"), self.file("empty.dex", b"")):
            with self.subTest(path=bad):
                with self.assertRaises(dp.PatchError):
                    dp.check_extension_dex(bad)

    def test_workdir_rejects_cwd_root_repo_home_and_their_ancestors(self):
        home = os.path.join(self.dir, "home")
        os.makedirs(home)
        with mock.patch.dict(os.environ, {"HOME": home}):
            # self.dir contains the fake home, so it is refused as an ancestor.
            for bad in (".", "", "/", ROOT, os.path.join(ROOT, "tests", ".."),
                        os.path.dirname(ROOT), home, self.dir):
                with self.subTest(workdir=bad):
                    with self.assertRaises(dp.PatchError):
                        dp.check_workdir(bad)

    def test_workdir_accepts_a_dedicated_scratch_directory(self):
        dp.check_workdir(os.path.join(self.dir, "work"))
        dp.check_workdir(os.path.join(ROOT, "build", "dex-patch-work"))


class OutputApkTests(unittest.TestCase):
    """write_output_apk on synthetic zips built here (no APK is committed)."""

    def setUp(self):
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        self.dir = tmp.name
        self.apk = os.path.join(self.dir, "stock.apk")
        with zipfile.ZipFile(self.apk, "w") as zf:
            zf.writestr("AndroidManifest.xml", b"manifest")
            zf.writestr("classes.dex", b"old dex")
            zf.writestr("classes2.dex", b"other dex")
        self.new_dex = self.file("patched-classes.dex", b"new dex")
        self.ext = self.file("ext.dex", b"dex\n037\x00ext")
        self.absent = os.path.join(self.dir, "absent.dex")
        self.out = os.path.join(self.dir, "out.apk")

    def file(self, name, data):
        path = os.path.join(self.dir, name)
        with open(path, "wb") as fh:
            fh.write(data)
        return path

    def partials(self):
        return [n for n in os.listdir(self.dir) if ".partial-" in n]

    def test_success_swaps_the_dex_and_appends_the_extension(self):
        dp.write_output_apk(self.apk, self.out, "classes.dex", self.new_dex,
                            self.ext, "classes3.dex")
        with zipfile.ZipFile(self.out) as zf:
            entries = {n: zf.read(n) for n in zf.namelist()}
        self.assertEqual(entries, {"AndroidManifest.xml": b"manifest",
                                   "classes.dex": b"new dex",
                                   "classes2.dex": b"other dex",
                                   "classes3.dex": b"dex\n037\x00ext"})
        self.assertEqual(self.partials(), [])

    def test_failure_leaves_no_output_and_no_partial(self):
        with self.assertRaises(OSError):
            dp.write_output_apk(self.apk, self.out, "classes.dex", self.absent)
        self.assertFalse(os.path.exists(self.out))
        self.assertEqual(self.partials(), [])

    def test_failure_keeps_an_existing_output_untouched(self):
        self.file("out.apk", b"previous run")
        with self.assertRaises(OSError):
            dp.write_output_apk(self.apk, self.out, "classes.dex", self.new_dex,
                                self.absent, "classes3.dex")
        with open(self.out, "rb") as fh:
            self.assertEqual(fh.read(), b"previous run")
        self.assertEqual(self.partials(), [])


class ProfileTests(unittest.TestCase):
    PROFILES = [os.path.join(ROOT, "fingerprints", "gboard-18.3.1.json"),
                os.path.join(ROOT, "fixtures", "fixture-profile.json")]

    def test_profiles_load_and_are_well_formed(self):
        for path in self.PROFILES:
            with self.subTest(profile=os.path.basename(path)):
                prof = dp.Profile(path)
                for key in ("cleanup_builder", "prompt_owner"):
                    cls, name, sig = prof.method(key)
                    self.assertRegex(cls, r"^L[\w/$]+;$")
                    self.assertTrue(sig.startswith("(") and ")" in sig)
                self.assertEqual(set(prof.anchors), {"enabled_languages_placeholder",
                                                     "hinglish_placeholder"})
                for fp in prof.fingerprints.values():
                    self.assertRegex(fp["sha256"], r"^[0-9a-f]{64}$")
                    self.assertGreater(fp["bytes"], 0)
                self.assertEqual(prof.ext_class, dp.EXT_DEFAULT)

    def test_profile_stores_hashes_not_strings(self):
        with open(self.PROFILES[0], encoding="utf-8") as fh:
            raw = json.load(fh)
        for fp in raw["fingerprints"].values():
            self.assertNotIn("text", fp)
            self.assertNotIn("value", fp)


class CliTests(unittest.TestCase):
    def run_cli(self, *args, env=None):
        return subprocess.run([sys.executable, PATCHER, *args],
                              capture_output=True, text=True, timeout=60, env=env)

    def test_help(self):
        proc = self.run_cli("--help")
        self.assertEqual(proc.returncode, 0)
        self.assertIn("analyze", proc.stdout)
        self.assertIn("--profile", proc.stdout)

    def test_missing_required_args(self):
        self.assertNotEqual(self.run_cli("analyze").returncode, 0)

    def test_bad_extension_dex_aborts_before_any_work(self):
        with tempfile.TemporaryDirectory() as tmp:
            work = os.path.join(tmp, "work")
            os.makedirs(work)
            sentinel = os.path.join(work, "keep")
            open(sentinel, "w").close()
            out = os.path.join(tmp, "out.apk")
            proc = self.run_cli("patch", "--apk", os.path.join(tmp, "absent.apk"),
                                "--out", out, "--profile", FIXTURE_PROFILE,
                                "--workdir", work,
                                "--extension-dex", os.path.join(tmp, "absent.dex"))
            self.assertEqual(proc.returncode, 2)
            self.assertIn("FAIL-CLOSED ABORT", proc.stderr)
            self.assertTrue(os.path.exists(sentinel), "the workdir must not be wiped")
            self.assertFalse(os.path.exists(out))

    def test_workdir_that_is_home_is_refused_and_left_alone(self):
        # HOME points at a temp dir, so a broken guard could only delete that.
        with tempfile.TemporaryDirectory() as home:
            sentinel = os.path.join(home, "keep")
            open(sentinel, "w").close()
            proc = self.run_cli("analyze", "--apk", os.path.join(home, "absent.apk"),
                                "--profile", FIXTURE_PROFILE, "--workdir", home,
                                env=dict(os.environ, HOME=home))
            self.assertEqual(proc.returncode, 2)
            self.assertIn("FAIL-CLOSED ABORT", proc.stderr)
            self.assertTrue(os.path.exists(sentinel))

    def _surrogate_dex_dir(self, tmp):
        ddir = os.path.join(tmp, "smali")
        os.makedirs(ddir)
        with open(os.path.join(ddir, "A.smali"), "w", encoding="utf-8") as fh:
            fh.write(".class public LA;\n.method m()V\n"
                     '    const-string v0, "\\ud83d\\ude00"\n'
                     ".end method\n")
        return ddir

    def test_surrogate_pair_const_string_aborts_fail_closed(self):
        # The escape decodes to lone surrogates, which cannot be UTF-8 encoded.
        with tempfile.TemporaryDirectory() as tmp:
            ddir = self._surrogate_dex_dir(tmp)
            work = os.path.join(tmp, "work")
            out = os.path.join(tmp, "out.apk")
            stdout, stderr = io.StringIO(), io.StringIO()
            with mock.patch.object(dp, "disassemble_all",
                                   return_value=[("classes.dex", ddir)]), \
                    contextlib.redirect_stdout(stdout), \
                    contextlib.redirect_stderr(stderr):
                rc = dp.main(["analyze", "--apk", "in.apk", "--out", out,
                              "--profile", FIXTURE_PROFILE, "--workdir", work])
            self.assertEqual(rc, 2)
            self.assertIn("FAIL-CLOSED ABORT", stderr.getvalue())
            self.assertNotIn("Traceback", stderr.getvalue())
            self.assertEqual(stdout.getvalue(), "")
            self.assertFalse(os.path.exists(out))

    def test_surrogate_pair_scan_raises_patch_error_not_unicode_error(self):
        with tempfile.TemporaryDirectory() as tmp:
            ddir = self._surrogate_dex_dir(tmp)
            with self.assertRaises(dp.PatchError):
                dp.scan_fingerprints([("classes.dex", ddir)], {})

    def test_main_patch_recreates_the_workdir_and_returns_zero(self):
        # patch() itself needs the toolchain; here it is mocked to cover main().
        with tempfile.TemporaryDirectory() as tmp:
            work = os.path.join(tmp, "work")
            os.makedirs(work)
            stale = os.path.join(work, "stale")
            open(stale, "w").close()
            ext = os.path.join(tmp, "ext.dex")
            with open(ext, "wb") as fh:
                fh.write(b"dex\n037\x00")
            out = os.path.join(tmp, "out.apk")
            stdout = io.StringIO()
            with mock.patch.object(dp, "patch", return_value={"out": out}) as fake, \
                    contextlib.redirect_stdout(stdout):
                rc = dp.main(["patch", "--apk", "in.apk", "--out", out,
                              "--profile", FIXTURE_PROFILE, "--workdir", work,
                              "--extension-dex", ext])
            self.assertEqual(rc, 0)
            fake.assert_called_once()
            self.assertTrue(os.path.isdir(work))
            self.assertFalse(os.path.exists(stale))
            self.assertEqual(json.loads(stdout.getvalue()), {"out": out})


class LoanspellDataTests(unittest.TestCase):
    """The OVERRIDE block in the Java runtime must match data/loanspell/overrides.tsv."""

    def test_overrides_in_sync_with_java(self):
        tsv = os.path.join(ROOT, "data", "loanspell", "overrides.tsv")
        java = os.path.join(ROOT, "extension-src", "com", "akshaykadam", "pixelboard",
                            "extension", "rambler", "GboardRamblerLoanSpell.java")
        with open(tsv, encoding="utf-8") as fh:
            rows = [l.rstrip("\n").split("\t") for l in fh if l.strip()]
        with open(java, encoding="utf-8") as fh:
            src = fh.read()
        block = re.search(r"OVERRIDE = map\(\n(.*?)\);", src, re.S).group(1)
        pairs = re.findall(r'"((?:[^"\\]|\\.)*)",\s*"((?:[^"\\]|\\.)*)"', block)
        decoded = [(w, b.encode("ascii").decode("unicode_escape")) for w, b in pairs]
        self.assertEqual(decoded, [(r[0], r[1]) for r in rows])


if __name__ == "__main__":
    unittest.main()
