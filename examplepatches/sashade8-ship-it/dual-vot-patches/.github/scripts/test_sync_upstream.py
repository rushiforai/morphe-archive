import importlib.util
import sys
import unittest
from pathlib import Path
from unittest import mock


MODULE_PATH = Path(__file__).with_name("sync_upstream.py")
SPEC = importlib.util.spec_from_file_location("sync_upstream", MODULE_PATH)
assert SPEC is not None and SPEC.loader is not None
sync_upstream = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = sync_upstream
SPEC.loader.exec_module(sync_upstream)


class SyncUpstreamTests(unittest.TestCase):
    def test_player_overlay_conflicts_fail_closed(self):
        player_overlay_path = (
            "extensions/youtube/src/main/java/app/morphe/extension/youtube/videoplayer/"
            "PlayerOverlayButton.java"
        )
        self.assertNotIn(player_overlay_path, sync_upstream.ADDON_COMPATIBILITY_CONFLICTS)

    def test_player_overlay_keeps_dual_api_and_upstream_spacing_fix(self):
        root = MODULE_PATH.parents[2]
        source = (
            root
            / "extensions/youtube/src/main/java/app/morphe/extension/youtube/videoplayer"
            / "PlayerOverlayButton.java"
        ).read_text(encoding="utf-8")

        self.assertIn("public static <T extends ImageView> T addButton", source)
        self.assertIn("static float getButtonWidthPercentage", source)
        self.assertIn("final int effectiveCustomButtons = Math.max(0, buttonControllers.size()", source)
        self.assertIn("chapterTitleContainer.updateMargin(source.getWidth(), effectiveCustomButtons, spacingPercentage)", source)
        self.assertIn("setTextSize(TypedValue.COMPLEX_UNIT_PX, Dim.dp(14))", source)

    def test_dev3_volume_hook_keeps_dual_coordinator(self):
        root = MODULE_PATH.parents[2]
        patch = (
            root
            / "patches/src/main/kotlin/app/morphe/patches/youtube/video/voiceovertranslation"
            / "VoiceOverTranslationPatch.kt"
        ).read_text(encoding="utf-8")
        self.assertIn("VoiceOverTranslationCoordinator;", patch)
        self.assertIn("playerVolumeHookPatch", patch)
        self.assertNotIn("votOriginalVolumeBytecodePatch", patch)
        self.assertIn('onCreateHook(EXTENSION_CLASS, "initialize")', patch)
        self.assertIn('"$EXTENSION_CLASS->onVideoIdChanged(Ljava/lang/String;)V"', patch)
        self.assertIn('videoTimeHook(EXTENSION_CLASS, "onVideoTimeChanged")', patch)

        for relative_path in (
            "extensions/youtube/src/main/java/app/morphe/extension/youtube/patches/"
            "voiceovertranslation/VoiceOverTranslationPatch.java",
            "extensions/youtube/src/main/java/app/morphe/extension/youtube/patches/"
            "voiceovertranslation/VoiceOverTranslationCoordinator.java",
            "extensions/youtube/src/main/java/app/morphe/extension/youtube/patches/"
            "voiceovertranslation/yandex/YandexVoiceOverTranslationPatch.java",
        ):
            source = (root / relative_path).read_text(encoding="utf-8")
            self.assertIn("PlayerVolumePatch", source)
            self.assertNotIn("VotOriginalVolumePatch", source)

    def test_dispatcher_has_staggered_two_hour_schedules(self):
        workflow = (
            MODULE_PATH.parents[1] / "workflows" / "upstream_sync.yml"
        ).read_text(encoding="utf-8")
        self.assertIn("cron: '23 */2 * * *'", workflow)
        self.assertIn("cron: '53 */2 * * *'", workflow)
        self.assertNotIn("cron: '23 */6 * * *'", workflow)

    def test_dev_merge_keeps_metadata_but_refreshes_controller_from_main(self):
        calls = []

        def fake_run(*args, **_kwargs):
            returncode = 1 if args[1:3] == ("merge-base", "--is-ancestor") else 0
            return mock.Mock(returncode=returncode)

        with (
            mock.patch.object(sync_upstream, "output_of", side_effect=("before", "after")),
            mock.patch.object(sync_upstream, "run", side_effect=fake_run),
            mock.patch.object(sync_upstream, "restore_path_from", side_effect=lambda ref, path: calls.append((ref, path))),
            mock.patch.object(sync_upstream, "unresolved_paths", return_value=[]),
            mock.patch.object(sync_upstream, "resolve_dual_yandex_string_conflicts"),
            mock.patch.object(sync_upstream, "resolve_addon_compatibility_conflicts"),
        ):
            self.assertTrue(
                sync_upstream.merge_ref(
                    "origin/main",
                    project_preference="ours",
                    label="stable branch",
                    controller_preference="theirs",
                )
            )

        self.assertIn(("HEAD", "README.md"), calls)
        for path in sync_upstream.CONTROLLER_PATHS:
            self.assertIn(("MERGE_HEAD", path), calls)

    def test_merges_only_dual_yandex_strings_into_upstream_resource(self):
        base = (
            '<resources>\n'
            '    <string name="morphe_vot_screen_title">Voice over translation</string>\n'
            '    <string name="morphe_vot_screen_summary">Old summary</string>\n'
            '    <string name="morphe_vot_enabled_title">Voice over translation</string>\n'
            '    <string name="upstream">old</string>\n'
            '</resources>\n'
        )
        ours = (
            '<resources>\n'
            '    <string name="morphe_vot_screen_title">Google and other translations</string>\n'
            '    <string name="morphe_vot_screen_summary">Dual summary</string>\n'
            '    <string name="morphe_vot_enabled_title">Enable Google and other translations</string>\n'
            '    <string name="upstream">old</string>\n\n'
            '    <string name="dualvot_yandex_enabled">Enabled</string>\n'
            '</resources>\n'
        )
        theirs = base.replace('name="upstream">old', 'name="upstream">new')

        self.assertEqual(
            sync_upstream.merge_dual_yandex_strings(base, ours, theirs),
            '<resources>\n'
            '    <string name="morphe_vot_screen_title">Google and other translations</string>\n'
            '    <string name="morphe_vot_screen_summary">Dual summary</string>\n'
            '    <string name="morphe_vot_enabled_title">Enable Google and other translations</string>\n'
            '    <string name="upstream">new</string>\n'
            '    <string name="dualvot_yandex_enabled">Enabled</string>\n'
            '</resources>\n',
        )

    def test_rejects_non_dual_local_resource_change(self):
        base = (
            '<resources>\n'
            '    <string name="morphe_vot_screen_title">Voice over translation</string>\n'
            '    <string name="morphe_vot_screen_summary">Old summary</string>\n'
            '    <string name="morphe_vot_enabled_title">Voice over translation</string>\n'
            '    <string name="upstream">old</string>\n'
            '</resources>\n'
        )
        ours = (
            base.replace('name="upstream">old', 'name="upstream">local edit').replace(
                '</resources>',
                '    <string name="dualvot_yandex_enabled">Enabled</string>\n</resources>',
            )
        )

        with self.assertRaises(sync_upstream.SyncError):
            sync_upstream.merge_dual_yandex_strings(base, ours, base)

    def test_repairs_known_legacy_resource_encoding_corruption(self):
        base = (
            '<resources>\n'
            '    <string name="morphe_vot_screen_title">Voice over translation</string>\n'
            '    <string name="morphe_vot_screen_summary">Old summary</string>\n'
            '    <string name="morphe_vot_enabled_title">Voice over translation</string>\n'
            '    <string name="bullet">• Item at 360°</string>\n'
            '    <string name="quoted">Hide \\\'More videos\\\' button → Loading…</string>\n'
            '</resources>\n'
        )
        ours = (
            base.replace('• Item at 360°', 'вЂў Item at 360В°')
            .replace(r"\'More videos\'", "'More videos'")
            .replace('→', 'в†’')
            .replace('…', 'вЂ¦')
            .replace(
                '</resources>',
                '    <string name="dualvot_yandex_enabled">WaitingвЂ¦</string>\n</resources>',
            )
        )
        theirs = base.replace('Loading…', 'Updated upstream text')

        merged = sync_upstream.merge_dual_yandex_strings(base, ours, theirs)

        self.assertIn('>• Item at 360°<', merged)
        self.assertIn(r"Hide \'More videos\' button → Updated upstream text", merged)
        self.assertIn('name="dualvot_yandex_enabled">Waiting…', merged)
        self.assertNotIn('вЂў', merged)
        self.assertNotIn('В°', merged)
        self.assertNotIn('вЂ¦', merged)
        self.assertNotIn('в†’', merged)

    def test_rejects_dual_yandex_string_already_defined_upstream(self):
        base = (
            '<resources>\n'
            '    <string name="morphe_vot_screen_title">Voice over translation</string>\n'
            '    <string name="morphe_vot_screen_summary">Old summary</string>\n'
            '    <string name="morphe_vot_enabled_title">Voice over translation</string>\n'
            '</resources>\n'
        )
        ours = base.replace(
            '</resources>',
            '    <string name="dualvot_yandex_enabled">Enabled</string>\n'
            '</resources>',
        )

        with self.assertRaises(sync_upstream.SyncError):
            sync_upstream.merge_dual_yandex_strings(base, ours, ours)

    def test_channel_workflow_runs_current_controller_from_main(self):
        workflow = (
            MODULE_PATH.parents[1] / "workflows" / "upstream_sync_channel.yml"
        ).read_text(encoding="utf-8")
        self.assertEqual(workflow.count("ref: main"), 2)
        self.assertNotIn(
            "ref: ${{ inputs.channel == 'stable' && 'main' || 'dev' }}",
            workflow,
        )

    def test_dispatcher_forwards_secrets_to_channel_workflows(self):
        workflow = (
            MODULE_PATH.parents[1] / "workflows" / "upstream_sync.yml"
        ).read_text(encoding="utf-8")
        # The controller lives on main and forwards the publication credential.
        # A published dev bundle may retain the upstream dispatcher instead.
        self.assertIn(workflow.count("secrets: inherit"), (0, 2))

    def test_publisher_supports_controller_or_published_bundle_credentials(self):
        workflow = (
            MODULE_PATH.parents[1] / "workflows" / "upstream_sync_channel.yml"
        ).read_text(encoding="utf-8")
        if "UPSTREAM_SYNC_TOKEN" in workflow:
            self.assertIn("token: ${{ secrets.UPSTREAM_SYNC_TOKEN }}", workflow)
            self.assertIn("GH_TOKEN: ${{ secrets.UPSTREAM_SYNC_TOKEN }}", workflow)
        else:
            self.assertIn("GH_TOKEN: ${{ secrets.GITHUB_TOKEN }}", workflow)

    def test_extracts_official_base_from_dual_version(self):
        self.assertEqual(
            sync_upstream.upstream_base("1.37.0-dualvot.3"),
            "1.37.0",
        )
        self.assertEqual(
            sync_upstream.upstream_base("1.38.0-dev.2-dualvot.1"),
            "1.38.0-dev.2",
        )

    def test_extracts_dual_revision_independently_of_morphe_base(self):
        self.assertEqual(
            sync_upstream.dualvot_revision("1.37.0-dualvot.7"),
            (7,),
        )
        self.assertEqual(
            sync_upstream.dualvot_revision("1.37.1-dev.1-dualvot.7-preview"),
            (7,),
        )
        self.assertEqual(
            sync_upstream.dualvot_revision("1.38.0-dev.1-dualvot.8.1"),
            (8, 1),
        )
        self.assertEqual(
            sync_upstream.format_dualvot_revision((8, 1)),
            "8.1",
        )

    def test_rejects_version_without_dual_revision(self):
        with self.assertRaises(sync_upstream.SyncError):
            sync_upstream.dualvot_revision("1.37.1-dev.1")

    def test_accepts_stable_and_prerelease_versions(self):
        for version in ("1.38.0", "1.38.0-dev.2", "1.38.0-dev.2-dualvot.1"):
            sync_upstream.validate_version(version)

    def test_rejects_version_that_could_become_a_command_argument(self):
        with self.assertRaises(sync_upstream.SyncError):
            sync_upstream.validate_version("1.38.0;echo-danger")

    def test_accepts_manager_local_datetime_without_timezone(self):
        sync_upstream.validate_manager_local_datetime("2026-07-28T10:49:38")

    def test_rejects_manager_datetime_with_timezone(self):
        for timestamp in (
            "2026-07-28T12:49:38+02:00",
            "2026-07-28T10:49:38Z",
        ):
            with self.subTest(timestamp=timestamp):
                with self.assertRaises(sync_upstream.SyncError):
                    sync_upstream.validate_manager_local_datetime(timestamp)

    def test_extracts_only_dual_changelog_sections(self):
        changelog = """## 1.38.0-dualvot.1 (2026-07-27)

Dual update.

## 1.38.0 (2026-07-27)

Upstream update.

## 1.37.0-dualvot.3 (2026-07-26)

Older Dual update.
"""
        self.assertEqual(
            sync_upstream.extract_dual_sections(changelog),
            [
                "## 1.38.0-dualvot.1 (2026-07-27)\n\nDual update.",
                "## 1.37.0-dualvot.3 (2026-07-26)\n\nOlder Dual update.",
            ],
        )

    def test_unfolds_wrapped_manifest_values(self):
        manifest = (
            "Manifest-Version: 1.0\r\n"
            "Name: Dual VoT Patches\r\n"
            "Description: Google and Yandex voice-over tran\r\n"
            " slation\r\n"
            "Version: 1.38.0-dualvot.1\r\n"
        )
        parsed = sync_upstream.parse_manifest(manifest)
        self.assertEqual(parsed["Name"], "Dual VoT Patches")
        self.assertEqual(parsed["Description"], "Google and Yandex voice-over translation")
        self.assertEqual(parsed["Version"], "1.38.0-dualvot.1")

    def test_publish_configures_git_identity_before_loading_plan(self):
        events = []

        def configure_identity():
            events.append("identity")

        def fail_to_load_plan(_):
            events.append("plan")
            raise sync_upstream.SyncError("stop after identity check")

        with (
            mock.patch.object(
                sync_upstream,
                "configure_git_identity",
                side_effect=configure_identity,
            ),
            mock.patch.object(
                sync_upstream,
                "load_plan",
                side_effect=fail_to_load_plan,
            ),
        ):
            with self.assertRaises(sync_upstream.SyncError):
                sync_upstream.publish(Path("unused"), "owner/repository")

        self.assertEqual(events, ["identity", "plan"])


if __name__ == "__main__":
    unittest.main()
