"""Frozen N9 device evidence and bounded offline visibility mirror."""
import json
import unittest

import n9
import run


class N9ReplayTest(unittest.TestCase):
    def test_tracked_evidence_reproduces_from_new_diagnostic(self):
        generated = n9.score()
        tracked = json.loads(n9.RESULT.read_text(encoding="utf-8"))
        self.assertEqual(tracked, generated)
        self.assertEqual({"A13", "A14"}, set(generated["cases"]))
        self.assertEqual(82521, generated["frozen_token_audit"]["total_tokens"])
        self.assertEqual(72128 + 10393, 82521)

    def test_a13_failed_block_has_timed_source_without_future_cue(self):
        a13 = n9.score()["cases"]["A13"]
        self.assertEqual([25, 97], a13["words"])
        self.assertEqual([73, 97], a13["event_words"])
        self.assertEqual(21789, a13["frozen"]["blackout_duration_ms"])
        self.assertEqual("outside_owned_event", n9.policy_at(n9.CASES["A13"], 7000)["decision"])
        self.assertEqual("source_cue", n9.policy_at(n9.CASES["A13"], 7160)["decision"])
        self.assertTrue(a13["policy_mirror"]["no_future_source_at_7160"])
        self.assertEqual(0, a13["policy_mirror"]["status_only_ms_in_owned_window"])
        self.assertEqual("outside_owned_event", n9.policy_at(n9.CASES["A13"], 28920)["decision"])

    def test_a14_review_shows_its_owned_event_original(self):
        a14 = n9.score()["cases"]["A14"]
        self.assertEqual(7101, a14["frozen"]["blackout_duration_ms"])
        self.assertEqual("真风险已裁决；新版真机待验", a14["status"])
        self.assertEqual({"decision": "keep_semantic_block",
                          "risk": "possible_subject_attachment",
                          "repair_candidate_risk": "dependent_boundary",
                          "accepted_translation_displayable": False,
                          "new_live_requests": 0, "new_live_tokens": 0},
                         a14["review_adjudication"])
        self.assertEqual("event_source", a14["policy_mirror"]["decision_at_blackout_onset"]["decision"])
        self.assertEqual("[原文 / Original] " + a14["source"],
                         a14["policy_mirror"]["decision_at_blackout_onset"]["text"])
        self.assertEqual(0, a14["policy_mirror"]["status_only_ms_in_owned_window"])
        self.assertEqual("outside_owned_event", n9.policy_at(
            {**n9.CASES["A14"], "event_source": a14["source"]}, 391744)["decision"])

    def test_older_scoreboard_remains_a01_through_a12(self):
        baseline = json.loads(run.RESULT.read_text(encoding="utf-8"))
        self.assertEqual({f"A{i:02d}" for i in range(1, 13)}, set(baseline["cases"]))
        self.assertEqual(baseline, run.score(run.read_evidence()))


if __name__ == "__main__":
    unittest.main()
