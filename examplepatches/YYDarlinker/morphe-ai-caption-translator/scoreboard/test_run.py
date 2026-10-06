"""Offline scoreboard regression checks; never call the network."""
from copy import deepcopy
import json
import pathlib
import tempfile
import unittest
from unittest import mock

import run
import live_n7


class FrozenReplayTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.evidence = run.read_evidence()
        cls.result = run.score(cls.evidence)

    def test_frozen_cost_and_visibility(self):
        result = self.result
        self.assertEqual(result["case_totals"], {"通过": 4, "失败": 4, "未验证": 4})
        self.assertEqual({k:v["total"] for k,v in result["metrics"]["invisible_ms"].items()},
                         {"pending_translation": 0, "event_review": 0, "overflow": 0})
        self.assertEqual(result["metrics"]["translation_wait_ms"]["total"], 3103)
        self.assertEqual(result["metrics"]["readable_source_ms"]["total"], 3103)
        self.assertEqual({k:v["total"] for k,v in result["frozen_baseline"]["invisible_ms"].items()},
                         {"pending_translation": 3103, "event_review": 12550, "overflow": 7332})
        self.assertIn("Java policy mirror", result["policy_replay"]["label"])
        self.assertEqual(len(result["frozen_facts"]["source_word_timeline"]), 687)
        self.assertEqual(len(result["frozen_facts"]["accepted_plans"]), 10)
        self.assertEqual([(r["request"], r["accepted"]) for r in result["frozen_facts"]["requests"]
                         if r["block"] == "b4_243_313"], [(7, False), (8, True)])
        self.assertEqual(result["frozen_request_attempts"], 11)
        self.assertEqual(result["frozen_accepted_blocks"], 10)
        self.assertEqual(result["frozen_token_audit"], {"total_tokens": 27920, "input_tokens": 18599, "output_tokens": 9321})

    def test_ownership_and_local_cases(self):
        self.assertTrue(self.result["metrics"]["source_ownership_all_cases"])
        self.assertEqual(self.result["metrics"]["fragment_hits"], {"A04": 0, "A08": 0, "A11": 0})
        self.assertEqual(self.result["metrics"]["captured_fragment_hits"], {"A04": 1, "A08": 1})
        self.assertEqual(self.result["metrics"]["raw_generated_fragment_hits"], {"A11": 1, "A12": 1})
        self.assertEqual(self.result["metrics"]["short_pages_a12_only_under_1000ms"], 0)
        self.assertEqual(self.result["metrics"]["raw_short_pages_a12_only_under_1000ms"], 1)
        self.assertEqual(self.result["metrics"]["font_shrink_events"], 0)
        self.assertEqual(self.result["metrics"]["overflow_events"], 0)
        self.assertEqual(self.result["metrics"]["bad_translation_string_hits"],
                         {"A02": 1, "A03": 1, "A09": 1})
        for case in ("A11", "A12"):
            self.assertEqual(self.result["cases"][case]["status"], "未验证")
            self.assertFalse(self.result["cases"][case]["generated_layer_alarm"])
            self.assertTrue(self.result["cases"][case]["raw_generated_layer_alarm"])
            self.assertTrue(self.result["cases"][case]["checks"]["display_merge"]["merged"])
            self.assertEqual(self.result["cases"][case]["display_evidence"], "仅生成")
        self.assertTrue(self.result["cases"]["A07"]["checks"]["caption_presented"])
        self.assertIn("mirror", self.result["cases"]["A07"]["checks"]["caption_presented_layer"])
        self.assertTrue(self.result["cases"]["A10"]["checks"]["caption_presented"])
        self.assertEqual(self.result["cases"]["A01"]["checks"]["reading_time_after_first_caption_ms"], 3845)

    def test_a01_revised_acceptance_requires_bounded_readable_source_and_same_window_replacement(self):
        row = self.result["cases"]["A01"]
        check = row["checks"]
        self.assertEqual(row["status"], "通过")
        self.assertEqual(check["pending_translation_ms"], 3103)
        self.assertEqual(check["target_ms"], 2000)
        self.assertEqual(check["source_readable_ms"], 3103)
        self.assertEqual(check["status_only_ms"], 0)
        self.assertTrue(check["source_coverage_complete"])
        self.assertTrue(check["source_fallback_bounded"])
        self.assertEqual([(r["cue"], r["start_ms"], r["end_ms"]) for r in check["source_cue_intervals"]],
                         [(1, 92, 1839), (2, 1839, 3195)])
        self.assertTrue(all(r["text"].strip() for r in check["source_cue_intervals"]))
        self.assertEqual(check["translated_replacement_position_ms"], 3195)
        self.assertTrue(check["replacement_within_owned_window"])
        self.assertEqual(row["events"][0]["end_ms"], 7040)
        self.assertFalse(check["device_startup_latency_verified"])
        self.assertIn("真机启动延迟未验证", row["display_evidence"])

        # A missing raw cue must remain status-only rather than count as readable source.
        with mock.patch.object(run, "source_cues", return_value=[]):
            missing_case = run.score(self.evidence)["cases"]["A01"]
            missing = missing_case["checks"]
        self.assertEqual(missing_case["status"], "失败")
        self.assertEqual(missing["pending_translation_ms"], 3103)
        self.assertEqual(missing["source_readable_ms"], 0)
        self.assertEqual(missing["status_only_ms"], 3103)
        self.assertFalse(missing["source_coverage_complete"])

        # A returned translation outside the original event cannot be counted as a replacement.
        delayed = deepcopy(self.evidence)
        selected = next(row for row in delayed["trace"] if row["kind"] == "REBUILD_SELECTED"
                        and run.event_id(row) == (0, 24))
        selected["time"] = "7040"
        self.assertEqual(run.score(delayed)["cases"]["A01"]["status"], "失败")

    def test_a07_ignores_paragraph_risk_but_keeps_hard_review_blocker(self):
        decision = next(d for d in self.result["policy_replay"]["decisions"]
                        if d["reason"] == "event_review")
        self.assertEqual(decision["review_risks"], ["paragraph"])
        self.assertEqual(decision["decision"], "caption")
        self.assertEqual(decision["late_probe_decision"], "caption_continues")
        self.assertEqual(decision["position_ms"], 76106)
        self.assertEqual(self.result["cases"]["A07"]["events"][0]["end_ms"], 88640)
        evidence = deepcopy(self.evidence)
        warning = next(r for r in evidence["trace"] if r["kind"] == "REBUILD_QUALITY_WARNING"
                       and r.get("paragraph range", "").startswith("243-280:"))
        warning["possible_subject_attachment range"] = warning.pop("paragraph range")
        changed = run.score(evidence)
        self.assertEqual(changed["metrics"]["invisible_ms"]["event_review"]["total"], 12550)
        self.assertEqual(changed["cases"]["A07"]["status"], "失败")

    def test_a04_a08_local_cuts_remove_forced_splits_without_new_requests(self):
        cuts = self.result["policy_replay"]["cross_block_cuts"]
        self.assertTrue(cuts["resource_and_ownership_limits_hold"])
        self.assertEqual(cuts["request_count_delta"], 0)
        old, new = cuts["original_blocks"], cuts["projected_blocks"]
        self.assertEqual([(old[i]["from"], old[i]["to"]) for i in (1, 2, 5, 6)],
                         [(25, 87), (88, 180), (314, 392), (393, 474)])
        self.assertEqual([(new[i]["from"], new[i]["to"]) for i in (1, 2, 5, 6)],
                         [(25, 97), (98, 180), (314, 382), (383, 474)])
        self.assertEqual([new[i] for i in (4, 8, 9)], [old[i] for i in (4, 8, 9)])
        self.assertTrue(cuts["A04"]["dependent_span_in_one_block"])
        self.assertTrue(cuts["A08"]["missile_clause_in_one_block"])
        self.assertEqual(cuts["A08"]["topic_boundary_available_after_word"], 396)
        self.assertEqual({name: row["status"] for name, row in self.result["cases"].items()},
                         {"A01": "通过", "A02": "失败", "A03": "失败", "A04": "通过",
                          "A05": "失败", "A06": "未验证", "A07": "通过", "A08": "通过",
                          "A09": "失败", "A10": "未验证", "A11": "未验证", "A12": "未验证"})
        for case in ("A04", "A08"):
            row = self.result["cases"][case]
            self.assertEqual(row["status"], "通过")
            self.assertFalse(row["checks"]["new_translation_verified"])
            self.assertIn("新译文与真机展示未验证", row["display_evidence"])
            self.assertFalse(row["source_invariant"]["missing"])
            self.assertFalse(row["source_invariant"]["duplicated"])
            self.assertTrue(row["source_invariant"]["no_next_source_time_borrowed"])
        self.assertEqual(self.result["cases"]["A08"]["checks"]["captured_new_topic_same_page_hits"], 1)
        self.assertIsNone(self.result["cases"]["A08"]["checks"]["new_topic_same_page_hits"])

        missing_hint = deepcopy(self.evidence)
        missing_hint["tokens"][88] = "when"
        self.assertEqual(run.score(missing_hint)["cases"]["A04"]["status"], "失败")
        missing_hint = deepcopy(self.evidence)
        missing_hint["tokens"][393] = "away"
        self.assertEqual(run.score(missing_hint)["cases"]["A08"]["status"], "失败")

    def test_a06_a10_paginate_within_owned_time_without_font_shrink_or_status(self):
        self.assertEqual(self.result["frozen_baseline"]["A06_captured_font_shrink_events"], 1)
        self.assertEqual(self.result["frozen_baseline"]["A10_captured_overflow_events"], 1)
        for case in ("A06", "A10"):
            row = self.result["cases"][case]
            pages = row["checks"]["page_plan"]
            event = row["events"][0]
            self.assertEqual(row["status"], "未验证")
            self.assertFalse(row["checks"]["device_layout_verified"])
            self.assertEqual(row["checks"]["page_plan_kind"], "offline_illustration")
            self.assertEqual(len(pages), 2)
            self.assertEqual("".join(page["text"] for page in pages), event["text"])
            self.assertEqual(pages[0]["start_ms"], event["start_ms"])
            self.assertEqual(pages[-1]["end_ms"], event["end_ms"])
            self.assertTrue(all(page["duration_ms"] >= 1000 and page["cps"] <= 12
                                for page in pages))
            self.assertEqual(pages[0]["end_ms"], pages[1]["start_ms"])
        self.assertEqual(self.result["cases"]["A06"]["checks"]["planned_font_sp"], 21.4)
        self.assertEqual(self.result["cases"]["A10"]["checks"]["overflow_fallback_attributed_ms"], 0)

    def test_page_cap_or_insufficient_time_remains_unresolved(self):
        event = {"text": "字幕" * 30, "start_ms": 100, "end_ms": 7500}
        self.assertEqual(run.replay_layout_pages(event, 100,
                         {"sp": "12.0", "lines": "7"}, 12.0)["decision"],
                         "unresolved_layout_fallback")
        event["end_ms"] = 2000
        self.assertEqual(run.replay_layout_pages(event, 100,
                         {"sp": "12.0", "lines": "3"}, 12.0)["decision"],
                         "unresolved_layout_fallback")

    def test_generated_live_evidence_is_not_presented(self):
        blocks = [{"block": n, "response": r["plan"]} for n, r in self.evidence["by_block"].items()]
        generated = run.generated_case_results(self.evidence, blocks)
        self.assertEqual(set(generated), set(run.CASES))
        self.assertTrue(all(row["display_status"] == "未验证" for row in generated.values()))
        self.assertTrue(all(row["source_ownership_complete_once"] for row in generated.values()))
        self.assertEqual(generated["A12"]["generated_layer_alarms"]["638-641独立短页"], 0)
        self.assertEqual(generated["A12"]["raw_generated_layer_alarms"]["638-641独立短页"], 1)
        self.assertTrue(generated["A12"]["display_projection"]["merged"])
    def test_local_display_merge_keeps_union_timing_and_bounds_long_pages(self):
        a11 = self.result["cases"]["A11"]["checks"]["display_merge"]["events"][0]
        self.assertEqual([a11["from"], a11["to"], a11["start_ms"], a11["end_ms"]], [622, 637, 194800, 198806])
        self.assertLessEqual(len(a11["text"]) * 1000, (a11["end_ms"] - a11["start_ms"]) * 12)
        a12 = self.result["cases"]["A12"]["checks"]["display_merge"]["events"][0]
        self.assertEqual([a12["from"], a12["to"], a12["start_ms"], a12["end_ms"]], [629, 641, 196620, 199692])
        self.assertLessEqual(len(a12["text"]) * 1000, (a12["end_ms"] - a12["start_ms"]) * 12)
        long_event = {"from": 527, "to": 556, "start_ms": 165680, "end_ms": 173023,
                      "text": "第一，中国的国防预算实际上比你以为的更大；这不是因为他们想隐瞒，而是因为会计标准不同，以及纳入和排除的项目不同。"}
        short_event = {"from": 557, "to": 558, "start_ms": 173023, "end_ms": 173523, "text": "下一句？"}
        self.assertIsNone(run.local_display_merge(long_event, short_event))

    def test_dropped_source_word_is_not_accepted_as_covered(self):
        evidence = deepcopy(self.evidence)
        event = next(e for e in evidence["events"] if e["from"] == 25)
        event["from"] += 1
        result = run.score(evidence)
        self.assertIn(25, result["cases"]["A02"]["source_invariant"]["missing"])
        self.assertFalse(result["metrics"]["source_ownership_all_cases"])

    def test_srt_is_required(self):
        with mock.patch.object(run, "srt_words", return_value=["tampered"]):
            with self.assertRaisesRegex(ValueError, "SRT prefix"):
                run.read_evidence()

    def test_default_never_touches_network_or_live_env(self):
        with mock.patch.object(run.urllib.request, "build_opener", side_effect=AssertionError("network")), \
             mock.patch.object(run, "live_once", side_effect=AssertionError("live")):
            self.assertEqual(run.main([]), 0)
        expected = pathlib.Path(run.RESULT).read_bytes()
        with mock.patch.object(run.urllib.request, "build_opener", side_effect=AssertionError("network")):
            self.assertEqual(run.main([]), 0)
        self.assertEqual(expected, pathlib.Path(run.RESULT).read_bytes())

    def test_live_requires_explicit_credentials(self):
        with mock.patch.dict(run.os.environ, {"MORPHE_P4_API_KEY": ""}):
            with self.assertRaisesRegex(ValueError, "needs MORPHE_P4_API_KEY"):
                run.live_once(self.evidence)
        with self.assertRaisesRegex(ValueError, "Invalid OpenAI-compatible"):
            run.api_endpoint("file:///tmp/no-download")
        self.assertIn("Target language: zh-Hans", run.current_prompt())

    def test_java_prompt_extraction_keeps_semicolons_inside_strings(self):
        self.assertEqual(run.java_string('static final String X = "one; two" + " three";', "X"),
                         "one; two three")
        self.assertIn("Resolve polysemous words by the subject matter", run.current_prompt())
        self.assertIn("If the plan would contain many short events", run.current_prompt())

    def test_n7_live_contract_rejects_quote_and_ownership_errors(self):
        payload = self.evidence["by_block"][0]["payload"]
        plan = deepcopy(self.evidence["by_block"][0]["plan"])
        live_n7.validate(plan, payload)
        plan["events"][0]["source"] += " invented"
        with self.assertRaisesRegex(ValueError, "source quote mismatch"):
            live_n7.validate(plan, payload)
        plan = deepcopy(self.evidence["by_block"][0]["plan"])
        plan["events"][0]["to"] += 1
        with self.assertRaisesRegex(ValueError, "source quote mismatch|source ownership gap"):
            live_n7.validate(plan, payload)
        plan = deepcopy(self.evidence["by_block"][0]["plan"])
        plan["events"][0]["text"] = " "
        with self.assertRaisesRegex(ValueError, "empty translation"):
            live_n7.validate(plan, payload)

    def test_live_sends_only_block4_first_request(self):
        accepted = self.evidence["by_block"][4]["plan"]
        reply = {"choices": [{"finish_reason": "stop", "message": {"content": json.dumps(accepted)}}],
                 "usage": {"prompt_tokens": 410, "completion_tokens": 260, "total_tokens": 670}}
        calls = []

        class Response:
            def __enter__(self): return self
            def __exit__(self, *_args): return False
            def read(self, _limit): return json.dumps(reply).encode()

        class Opener:
            def open(self, request, timeout):
                calls.append((json.loads(request.data), timeout))
                return Response()

        with tempfile.TemporaryDirectory() as directory, \
             mock.patch.object(run, "RESULT", pathlib.Path(directory) / "score.json"), \
             mock.patch.object(run.urllib.request, "build_opener", return_value=Opener()), \
             mock.patch.dict(run.os.environ, {"MORPHE_P4_API_KEY": "test-key",
                                             "MORPHE_P4_BASE_URL": "https://api.openai.com/v1",
                                             "MORPHE_P4_MODEL": "test-model"}):
            result = json.loads(run.live_once(self.evidence).read_text(encoding="utf-8"))
        self.assertEqual(len(calls), 1)
        self.assertEqual(result["api_attempts"], 1)
        self.assertEqual(result["status"], "complete_block4_generated_only")
        self.assertEqual(result["token_usage"]["total_tokens"], 670)
        self.assertEqual(result["blocks"][0]["source_ids"], [243, 313])
        body = calls[0][0]
        self.assertEqual(body["max_completion_tokens"], result["blocks"][0]["output_budget_tokens"])
        self.assertNotIn("repair", json.loads(body["messages"][1]["content"]))

        reply["choices"][0] = {"finish_reason": "length", "message": {"content": '{"block":'}}
        calls.clear()
        with tempfile.TemporaryDirectory() as directory, \
             mock.patch.object(run, "RESULT", pathlib.Path(directory) / "score.json"), \
             mock.patch.object(run.urllib.request, "build_opener", return_value=Opener()), \
             mock.patch.dict(run.os.environ, {"MORPHE_P4_API_KEY": "test-key",
                                             "MORPHE_P4_BASE_URL": "https://api.openai.com/v1",
                                             "MORPHE_P4_MODEL": "test-model"}):
            truncated = json.loads(run.live_once(self.evidence).read_text(encoding="utf-8"))
        self.assertEqual(len(calls), 1)
        self.assertEqual(truncated["blocks"][0]["finish_reason"], "length")
        self.assertEqual(truncated["blocks"][0]["contract"], "output_truncated")

    def test_a01_probe_is_one_block0_request_with_wall_and_tokens(self):
        accepted = self.evidence["by_block"][0]["plan"]
        reply = {"choices": [{"finish_reason": "stop", "message": {"content": json.dumps(accepted)}}],
                 "usage": {"prompt_tokens": 250, "completion_tokens": 90, "total_tokens": 340}}
        calls = []

        class Response:
            def __enter__(self): return self
            def __exit__(self, *_args): return False
            def read(self, _limit): return json.dumps(reply).encode()

        class Opener:
            def open(self, request, timeout):
                calls.append((json.loads(request.data), timeout))
                return Response()

        with tempfile.TemporaryDirectory() as directory, \
             mock.patch.object(run, "RESULT", pathlib.Path(directory) / "score.json"), \
             mock.patch.object(run.urllib.request, "build_opener", return_value=Opener()), \
             mock.patch.dict(run.os.environ, {"MORPHE_P4_API_KEY": "test-key",
                                             "MORPHE_P4_BASE_URL": "https://api.openai.com/v1",
                                             "MORPHE_P4_MODEL": "test-model"}):
            result = json.loads(run.live_once(self.evidence, 0).read_text(encoding="utf-8"))
        self.assertEqual(result["api_attempts"], 1)
        self.assertEqual(result["status"], "complete_block0_generated_only")
        self.assertEqual(result["token_usage"]["total_tokens"], 340)
        self.assertEqual(result["blocks"][0]["source_ids"], [0, 24])
        self.assertEqual(len(calls), 1)
        self.assertEqual(calls[0][1], 10)
        self.assertIn("http_wall_ms", result["blocks"][0])
        self.assertIn("end_to_end_wall_ms", result["blocks"][0])


if __name__ == "__main__":
    unittest.main()
