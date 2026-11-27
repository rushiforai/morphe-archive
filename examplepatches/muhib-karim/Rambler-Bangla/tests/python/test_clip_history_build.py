"""Synthetic hook/ZIP fixtures for the clipboard-history build: no Google implementation or binary required."""
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
import zipfile

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / 'scripts/clip_history_build.py'
SPEC = importlib.util.spec_from_file_location('clip_history_build', SCRIPT)
build = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(build)

HOOK = 'Lcom/akshaykadam/pixelboard/extension/rambler/GboardRamblerClipHistory;'


def rule_for(method, edits):
    return {'method': method.splitlines()[0].split()[-1],
            'sha256': hashlib.sha256(method.encode()).hexdigest(), 'edits': edits}


class ClipHistoryBuildTests(unittest.TestCase):
    def test_guarded_hook_and_double_patch_rejection(self):
        source = ('.class public Lfixture;\n.super Ljava/lang/Object;\n'
                  '.method public run()V\n    .registers 1\n    return-void\n.end method\n')
        rule = rule_for(source[source.index('.method'):], [
            {'anchor': '    return-void', 'position': 'before', 'code': '    invoke-static {}, Lfixture/History;->attach()V'}])
        changed = build.patch_method(source, rule)
        self.assertIn('->attach()V\n    return-void', changed)
        with self.assertRaises(ValueError):
            build.patch_method(changed, rule)
        with self.assertRaises(ValueError):
            build.patch_method(source.replace('.registers 1', '.registers 2'), rule)

    def test_missing_and_ambiguous_anchor_fail_closed(self):
        for body, anchor in [('    return-void\n', 'missing'), ('    nop\n    nop\n    return-void\n', '    nop')]:
            method = '.method public run()V\n    .registers 1\n' + body + '.end method\n'
            rule = rule_for(method, [{'anchor': anchor, 'position': 'before', 'code': '    nop'}])
            with self.assertRaises(ValueError):
                build.patch_method(method, rule)

    def test_hook_targets_must_exist_as_public_static_with_matching_arity(self):
        with tempfile.TemporaryDirectory() as temp:
            runtime = Path(temp)
            target = runtime / 'com/akshaykadam/pixelboard/extension/rambler/GboardRamblerClipHistory.smali'
            target.parent.mkdir(parents=True)
            target.write_text('.method public static attach(Ljava/lang/Object;)V\n.end method\n'
                              '.method public static capture(Ljava/lang/Object;JLjava/lang/String;)V\n.end method\n'
                              '.method static hidden()V\n.end method\n')

            def rules(*code):
                return [{'edits': [{'code': line} for line in code]}]
            build.verify_hook_targets(rules(f'    invoke-static {{v0}}, {HOOK}->attach(Ljava/lang/Object;)V'), runtime)
            build.verify_hook_targets(rules(f'    invoke-static/range {{p0 .. p1}}, {HOOK}->attach(Ljava/lang/Object;)V'
                                            .replace('p1', 'p0')), runtime)
            build.verify_hook_targets(rules(
                f'    invoke-static/range {{v2 .. v5}}, {HOOK}->capture(Ljava/lang/Object;JLjava/lang/String;)V'), runtime)
            for bad in [f'    invoke-static {{}}, {HOOK}->missing()V',
                        f'    invoke-static {{}}, {HOOK}->hidden()V',
                        f'    invoke-static {{v0}}, {HOOK}->attach(Ljava/lang/String;)V',
                        f'    invoke-static {{v0, v1}}, {HOOK}->attach(Ljava/lang/Object;)V',
                        f'    invoke-static {{v0, v1, v2}}, {HOOK}->capture(Ljava/lang/Object;JLjava/lang/String;)V',
                        '    invoke-static {}, Lcom/absent/Hook;->attach()V']:
                with self.assertRaises(ValueError, msg=bad):
                    build.verify_hook_targets(rules(bad), runtime)

    def test_runtime_reflection_contract_fails_closed(self):
        with tempfile.TemporaryDirectory() as temp:
            smali = Path(temp)
            (smali / 'kvw.smali').write_text('.class public final Lkvw;\n.method private final v()Z\n.end method\n')
            ok = [{'dex': 'classes2.dex', 'path': 'kvw.smali', 'line': '.method private final v()Z'}]
            build.verify_contract(ok, 'classes2.dex', smali)
            build.verify_contract(ok, 'classes3.dex', smali)  # other DEX: checked in its own pass
            for bad in [[dict(ok[0], line='.method public final v()Z')], [dict(ok[0], path='absent.smali')]]:
                with self.assertRaises(ValueError):
                    build.verify_contract(bad, 'classes2.dex', smali)
        profile = json.loads((ROOT / 'fingerprints/clipboard-history-rc4.json').read_text())
        hooked = {rule['dex'] for rule in profile['hooks']}
        self.assertTrue(profile['contract'])
        self.assertTrue({item['dex'] for item in profile['contract']} <= hooked,
                        'contract lines must live in a DEX the build disassembles')

    def test_roundtrip_rejects_lost_hook_changed_method_and_class_set(self):
        hook = f'    invoke-static {{}}, {HOOK}->finish()V'
        stock = '.method public run()V\n    .registers 1\n    return-void\n.end method\n'
        patched = stock.replace('    return-void', hook + '\n    return-void')
        other = '.method public other()V\n    .registers 1\n    return-void\n.end method\n'
        rules = [{'path': 'a.smali', 'method': 'run()V', 'edits': [{'code': hook}]}]

        def tree(root, files):
            for name, text in files.items():
                (root / name).write_text(text)
            return root
        with tempfile.TemporaryDirectory() as temp:
            for case, after, broken in [
                    ('ok', {'a.smali': patched + other, 'b.smali': other}, False),
                    ('hook lost', {'a.smali': stock + other, 'b.smali': other}, True),
                    ('untouched method', {'a.smali': patched + other.replace('return-void', 'nop\n    return-void'),
                                          'b.smali': other}, True),
                    ('untouched class', {'a.smali': patched + other, 'b.smali': other + '\n'}, True),
                    ('class set', {'a.smali': patched + other}, True)]:
                before = Path(temp) / (case + '-before')
                rebuilt = Path(temp) / (case + '-after')
                before.mkdir()
                rebuilt.mkdir()
                tree(before, {'a.smali': patched + other, 'b.smali': other})
                tree(rebuilt, after)
                if broken:
                    with self.assertRaises(ValueError, msg=case):
                        build.verify_roundtrip(before, rebuilt, rules)
                else:
                    build.verify_roundtrip(before, rebuilt, rules)

    def test_pinned_profile_hooks_resolve_against_runtime_sources(self):
        profile = json.loads((ROOT / 'fingerprints/clipboard-history-rc4.json').read_text())
        source = (ROOT / 'extension-src/com/akshaykadam/pixelboard/extension/rambler/GboardRamblerClipHistory.java'
                  ).read_text()
        for rule in profile['hooks']:
            for edit in rule['edits']:
                for line in edit['code'].splitlines():
                    if 'invoke-static' in line:
                        name = line.split('->')[1].split('(')[0]
                        self.assertTrue(f'public static void {name}(' in source, 'unresolved hook: ' + line)

    def test_repack_preserves_payloads_and_compression(self):
        with tempfile.TemporaryDirectory() as temp:
            base, out = Path(temp) / 'base.zip', Path(temp) / 'out.zip'
            with zipfile.ZipFile(base, 'w') as z:
                z.writestr('resources.arsc', b'resources', compress_type=zipfile.ZIP_STORED)
                z.writestr('lib/arm64-v8a/libfixture.so', b'library', compress_type=zipfile.ZIP_STORED)
                z.writestr('AndroidManifest.xml', b'manifest', compress_type=zipfile.ZIP_DEFLATED)
                z.writestr('classes.dex', b'old', compress_type=zipfile.ZIP_DEFLATED)
                for name in ['META-INF/TEST.RSA', 'META-INF/TEST.SF', 'META-INF/MANIFEST.MF']:
                    z.writestr(name, b'signature')
                z.writestr('META-INF/services/fixture', b'provider')
            build.repack(base, out, {'classes.dex': b'new', 'classes2.dex': b'extra'})
            with zipfile.ZipFile(out) as z:
                self.assertEqual(z.read('classes.dex'), b'new')
                self.assertEqual(z.read('classes2.dex'), b'extra')
                self.assertEqual(z.read('AndroidManifest.xml'), b'manifest')
                for name in ['resources.arsc', 'lib/arm64-v8a/libfixture.so']:
                    self.assertEqual(z.getinfo(name).compress_type, zipfile.ZIP_STORED)
                self.assertEqual(z.read('META-INF/services/fixture'), b'provider')
                for name in ['META-INF/TEST.RSA', 'META-INF/TEST.SF', 'META-INF/MANIFEST.MF']:
                    self.assertNotIn(name, z.namelist())

    def test_wrong_base_leaves_existing_output_untouched(self):
        with tempfile.TemporaryDirectory() as temp:
            base = Path(temp) / 'wrong.apk'
            base.write_bytes(b'synthetic wrong base')
            with self.assertRaises(ValueError):
                build.validate_base(base)
            output = Path(temp) / 'existing.apk'
            output.write_bytes(b'keep existing output')
            result = subprocess.run([sys.executable, str(SCRIPT), str(base), str(output)],
                                    capture_output=True, text=True)
            self.assertEqual(result.returncode, 2)
            self.assertIn('Build refused', result.stderr)
            self.assertEqual(output.read_bytes(), b'keep existing output')


if __name__ == '__main__':
    unittest.main()
