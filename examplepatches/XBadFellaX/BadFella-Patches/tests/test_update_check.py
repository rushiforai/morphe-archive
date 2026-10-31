"""Synthetic update drift tests. No APK, credentials, network or emulator required."""
import copy
import json
from pathlib import Path
import tempfile
import unittest
import zipfile

from tools import update_check as check


def method(owner="Lold/scheduler;", name="h", **changes):
    value = {"owner": owner, "name": name, "params": [], "return": "Z", "flags": 1,
             "calls": ["Lcom/ticktick/task/data/User;->isPro()Z"], "fields": [],
             "ops": {"RETURN": 1}, "body": "original-body", "callers": ["Lapp/Alarm;->register()V"],
             "callers_hash": "original-callers", "dependency": False}
    value.update(changes)
    value["id"] = owner + "->" + name + "(" + "".join(value["params"]) + ")" + value["return"]
    return value


class UpdateCheckTests(unittest.TestCase):
    def setUp(self):
        self.spec = {"id": "ReminderGuard", "source": "Reminder.kt", "owner": "Lold/scheduler;",
                     "params": [], "return": "Z", "flags": 0,
                     "calls": [{"definingClass": "Lcom/ticktick/task/data/User;", "name": "isPro"}], "fields": []}
        self.contracts = {"fingerprints": [self.spec], "reflection": [], "source_hashes": {"source": "same"},
                          "supported_versions": ["8.2.4.0"], "certificate_sha1": "A" * 40,
                          "retained": ["android.permission.RECORD_AUDIO"], "removals": {"permissions": [], "components": []},
                          "config": {"preference_keys": ["prefkey_custom_swipe"]}}
        m = method()
        self.inventory = {"artifact": {"version": "8.2.4.0", "certificate_sha1": ["A" * 40]},
                          "classes": {m["owner"]: {"super": "", "interfaces": []}},
                          "methods": {m["id"]: m}, "manifest_names": ["android.permission.RECORD_AUDIO"],
                          "preference_keys": ["prefkey_custom_swipe"]}
        self.baseline = check.capture(self.inventory, self.contracts)

    def statuses(self, inventory=None, contracts=None):
        result = check.compare(self.baseline, inventory or self.inventory, contracts or self.contracts)
        self.assertFalse(result["runtime_verified"])
        self.assertFalse(result["release_approved"])
        return {item["status"] for item in result["findings"]}

    def test_same_artifact_has_no_drift(self):
        self.assertEqual(self.statuses(), set())

    def test_body_and_caller_drift_are_detected(self):
        current = copy.deepcopy(self.inventory)
        next(iter(current["methods"].values()))["body"] = "changed-operand"
        self.assertIn("BODY_CHANGED", self.statuses(current))
        next(iter(current["methods"].values()))["body"] = "original-body"
        next(iter(current["methods"].values()))["callers_hash"] = "new-caller"
        self.assertIn("CALLERS_CHANGED", self.statuses(current))

    def test_renamed_obfuscated_class_gets_hint_not_approval(self):
        current = copy.deepcopy(self.inventory)
        renamed = method(owner="Lnew/scheduler;")
        current["methods"] = {renamed["id"]: renamed}
        report = check.compare(self.baseline, current, self.contracts)
        row = report["findings"][0]
        self.assertEqual(row["status"], "MISSING")
        self.assertEqual(row["candidates_unverified"][0]["method"], renamed["id"])
        self.assertFalse(report["release_approved"])

    def test_duplicate_semantic_method_is_ambiguous(self):
        current = copy.deepcopy(self.inventory)
        duplicate = method(name="diagnostic")
        current["methods"][duplicate["id"]] = duplicate
        self.assertIn("AMBIGUOUS", self.statuses(current))

    def test_signature_change_cannot_pass(self):
        current = copy.deepcopy(self.inventory)
        changed = method(params=["I"])
        current["methods"] = {changed["id"]: changed}
        self.assertIn("MISSING", self.statuses(current))

    def test_signer_version_resources_and_capabilities(self):
        current = copy.deepcopy(self.inventory)
        current["artifact"].update(version="9.0.0", certificate_sha1=["B" * 40])
        current["preference_keys"] = []
        current["manifest_names"] = ["new.vendor.analytics.Service"]
        self.assertTrue({"STOCK_SIGNER_CHANGED", "VERSION_NOT_YET_SUPPORTED", "PREFERENCE_KEY_MISSING",
                         "RETAINED_CAPABILITY_MISSING", "NEW_COLLECTION_COMPONENT_REVIEW"} <= self.statuses(current))

    def test_source_contract_drift(self):
        changed = copy.deepcopy(self.contracts)
        changed["source_hashes"]["source"] = "edited"
        self.assertIn("SOURCE_CONTRACTS_CHANGED", self.statuses(contracts=changed))

    def test_inherited_public_reflection_and_declared_private_bridge(self):
        private = method(owner="Lbase/Service;", name="createTask", flags=2)
        inventory = {"classes": {"Lchild/Service;": {"super": "Lbase/Service;"}}, "methods": {private["id"]: private}}
        spec = {"owner": "Lchild/Service;", "name": "createTask", "arity": 0}
        self.assertEqual(check.reflection_matches(inventory, spec), [])
        spec["declared"] = True
        self.assertEqual(check.reflection_matches(inventory, spec), [private])
        spec.update(name="<init>", declared=False)
        parent = method(owner="Lbase/Service;", name="<init>")
        inventory["methods"] = {parent["id"]: parent}
        self.assertEqual(check.reflection_matches(inventory, spec), [])

    def test_nearest_override_wins_over_grandparent(self):
        parent = method(owner="Lz/Parent;", name="getSid")
        grandparent = method(owner="La/Grandparent;", name="getSid", body="different")
        inventory = {"classes": {"Lchild/Model;": {"super": parent["owner"]},
                                  parent["owner"]: {"super": grandparent["owner"]}},
                     "methods": {parent["id"]: parent, grandparent["id"]: grandparent}}
        self.assertEqual(check.reflection_matches(inventory, {"owner": "Lchild/Model;", "name": "getSid", "arity": 0}), [parent])

    def test_optional_baseline_absence_is_explicit(self):
        self.contracts["reflection"] = [{"id": "optional", "owner": "Lapp/User;", "name": "getApiDomain",
                                        "arity": 0, "optional": True, "source": "Bridge.java"}]
        self.baseline = check.capture(self.inventory, self.contracts)
        report = check.compare(self.baseline, self.inventory, self.contracts)
        self.assertEqual(report["notes"][0]["status"], "BASELINE_OPTIONAL_ABSENT")
        self.assertEqual(report["findings"], [])

    def test_transitive_dependency_change(self):
        dependency = method(owner="Lcom/ticktick/Dao;", name="query", dependency=True)
        self.inventory["methods"][dependency["id"]] = dependency
        self.baseline = check.capture(self.inventory, self.contracts)
        changed = copy.deepcopy(self.inventory)
        changed["methods"][dependency["id"]]["body"] = "reordered-user-and-task"
        report = check.compare(self.baseline, changed, self.contracts)
        self.assertEqual(report["findings"][0]["kind"], "dependency")

    def test_source_parser_reads_actual_contracts_and_rejects_unknown_syntax(self):
        actual = check.source_contracts()
        self.assertFalse(any(app in path for path in actual["source_hashes"]
                             for app in ("/emby/", "/remoteatv/")))
        self.assertTrue({"UserIsProFingerprint", "GetLimitsFingerprint", "ReminderPremiumConsistencyFingerprint",
                         "FirebaseCertificateFingerprint"} <= {s["id"] for s in actual["fingerprints"]})
        self.assertEqual(actual["reflection"], [])
        self.assertNotIn("bridge_source", actual["config"])
        with self.assertRaises(ValueError): check.named('customFingerprint = true', {"definingClass"})
        with self.assertRaises(ValueError): check.string_list('computedParameters()')
        self.assertEqual(check.arguments('a, call("x,y", other()), "(z)"'), ['a', 'call("x,y", other())', '"(z)"'])

    def test_latest_declared_version_has_current_reviewed_baseline(self):
        current = check.source_contracts()
        latest = max(current["supported_versions"], key=lambda s: tuple(int(x) for x in s.split(".")))
        path = check.ROOT / "tools/baselines" / ("ticktick-" + latest + ".json")
        baseline = json.loads(path.read_text(encoding="utf-8"))
        self.assertEqual(baseline["artifact"]["version"], latest)
        self.assertEqual(baseline["contracts"]["source_hashes"], current["source_hashes"],
                         "Review source changes and capture a validated baseline; do not edit hashes to silence this gate")

    def test_multi_code_module_bundle_is_rejected_without_extracting_paths(self):
        import io
        with tempfile.TemporaryDirectory(prefix="badfella-test-") as directory:
            path = Path(directory)
            data = io.BytesIO()
            with zipfile.ZipFile(data, "w") as archive: archive.writestr("classes.dex", b"fixture")
            bundle = path / "input.apkm"
            with zipfile.ZipFile(bundle, "w") as archive:
                archive.writestr("../base.apk", data.getvalue())
                archive.writestr("feature.apk", data.getvalue())
            with self.assertRaisesRegex(ValueError, "one code-bearing"):
                check.apk_input(bundle, path)
            self.assertFalse((path.parent / "base.apk").exists())


if __name__ == "__main__":
    unittest.main()
