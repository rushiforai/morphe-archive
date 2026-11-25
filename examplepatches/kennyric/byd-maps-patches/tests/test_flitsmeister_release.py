"""Negative controls for exact current-main additions on both Flitsmeister versions."""
import copy
import json
import re
import unittest
import tempfile
from pathlib import Path
from unittest.mock import patch
import xml.etree.ElementTree as ET

import verify_flitsmeister_release as release
from verify_flitsmeister import NAMES


class ManifestTests(unittest.TestCase):
    def manifest(self, nav=False, hosts=False):
        root = ET.Element('manifest', {'package': 'nl.flitsmeister'})
        queries = ET.SubElement(root, 'queries')
        ET.SubElement(queries, 'package', {release.A + 'name': 'original.native.package'})
        second = ET.SubElement(root, 'queries')
        ET.SubElement(second, 'intent', {'original': 'retained'})
        if hosts:
            for package in release.HOST_PACKAGES:
                ET.SubElement(queries, 'package', {release.A + 'name': package})
        app = ET.SubElement(root, 'application')
        ET.SubElement(app, 'service', {release.A + 'name': 'nl.flitsmeister.services.base.FlitsmeisterBaseService',
                                       release.A + 'exported': 'false', release.A + 'permission': 'original.permission'})
        if nav:
            ET.SubElement(app, 'service', {release.A + 'name': 'nl.johninnl.flitsmeister.NavigationControlService', release.A + 'exported': 'true'})
            ET.SubElement(app, 'service', {release.A + 'name': 'nl.johninnl.flitsmeister.NavigationEngineService', release.A + 'exported': 'false', release.A + 'foregroundServiceType': 'location'})
            ET.SubElement(app, 'activity', {release.A + 'name': 'nl.johninnl.flitsmeister.WarningRecoveryActivity', release.A + 'exported': 'false'})
        return root

    def test_only_explicit_services_and_queries_are_normalized(self):
        for version in (14, 15):
            for nav in (False, True):
                for hosts in (False, True):
                    selected = ({release.BROADCAST} if nav else set()) | ({release.SUPPORT} if hosts else set())
                    original = self.manifest()
                    clean = release.normalize_manifest(self.manifest(nav, hosts), selected, version)
                    self.assertEqual(ET.tostring(clean), ET.tostring(original))
                    self.assertEqual(len(clean.findall('queries')), 2)
                    native = clean.find('application/service')
                    self.assertEqual(native.get(release.A + 'exported'), 'false')
                    self.assertEqual(native.get(release.A + 'permission'), 'original.permission')

    def test_wrong_export_or_component_permission_cannot_be_hidden(self):
        for attribute, value in ((release.A + 'exported', 'true'), (release.A + 'permission', 'new.permission')):
            doc = self.manifest(True)
            doc.find('application').findall('service')[-1].set(attribute, value)
            with self.assertRaisesRegex(AssertionError, 'exact export/foreground/permission'):
                release.normalize_manifest(doc, {release.BROADCAST}, 15)

    def test_extra_duplicate_or_unselected_query_is_rejected(self):
        doc = self.manifest(hosts=True)
        with self.assertRaisesRegex(AssertionError, 'selected-only package visibility'):
            release.normalize_manifest(doc, set(), 14)
        ET.SubElement(doc.find('queries'), 'package', {release.A + 'name': release.HOST_PACKAGES[0]})
        with self.assertRaisesRegex(AssertionError, 'selected-only package visibility'):
            release.normalize_manifest(doc, {release.SUPPORT}, 15)

    def test_recovery_activity_requires_exact_private_selected_only_declaration(self):
        for version in (14, 15):
            for attribute, value in ((release.A + 'exported', 'true'), (release.A + 'permission', 'unexpected.permission')):
                with self.subTest(version=version, attribute=attribute):
                    doc = self.manifest(True)
                    doc.find('application/activity').set(attribute, value)
                    with self.assertRaisesRegex(AssertionError, 'exact private recovery'):
                        release.normalize_manifest(doc, {release.BROADCAST}, version)
            doc = self.manifest()
            doc.find('application').append(copy.deepcopy(self.manifest(True).find('application/activity')))
            with self.assertRaisesRegex(AssertionError, 'selected-only recovery'):
                release.normalize_manifest(doc, set(), version)
            duplicate = self.manifest(True)
            duplicate.find('application').append(copy.deepcopy(duplicate.find('application/activity')))
            with self.assertRaisesRegex(AssertionError, 'selected-only recovery'):
                release.normalize_manifest(duplicate, {release.BROADCAST}, version)

    def test_extra_component_cannot_be_normalized_away_from_publisher_manifest(self):
        for version in (14, 15):
            original = self.manifest()
            contract = {**release.MANIFESTS[version], 'hashes': {'1-0': release.xml_digest(original, 'AndroidManifest.xml')}}
            with tempfile.TemporaryDirectory() as temporary, patch.dict(release.MANIFESTS, {version: contract}):
                root = Path(temporary)
                doc = self.manifest(True)
                ET.ElementTree(doc).write(root / 'AndroidManifest.xml')
                release.verify_manifest(root, {release.BROADCAST}, version)
                ET.SubElement(doc.find('application'), 'activity', {release.A + 'name': 'unreviewed.ExtraActivity', release.A + 'exported': 'false'})
                ET.ElementTree(doc).write(root / 'AndroidManifest.xml')
                with self.assertRaisesRegex(AssertionError, 'Complete publisher manifest'):
                    release.verify_manifest(root, {release.BROADCAST}, version)


class SenderBoundaryTests(unittest.TestCase):
    def fixture(self):
        return json.loads((Path(__file__).parent / 'fixtures/navigation-warnings/navigation-client-sender.json').read_text())['methods']

    def verify(self, methods):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            file = root / 'smali/nl/johninnl/navigation/startup/NavigationClient.smali'
            file.parent.mkdir(parents=True)
            file.write_text('.class public Lnl/johninnl/navigation/startup/NavigationClient;\n.super Ljava/lang/Object;\n' + '\n'.join(methods.values()))
            release.verify_pending_intent_source(root)

    def test_creator_uid_foreground_sender_and_binding_boundaries_match_emitted_code(self):
        self.verify(self.fixture())

    def test_missing_creator_uid_authorization_is_rejected(self):
        methods = self.fixture()
        methods['authorization'] = methods['authorization'].replace('->getCreatorUid()I', '->unreviewedCreatorUid()I')
        with self.assertRaisesRegex(AssertionError, 'capability authorization'):
            self.verify(methods)

    def test_background_visibility_bypass_is_rejected(self):
        methods = self.fixture()
        self.assertEqual(methods['sender'].count('if-nez v0,'), 1)
        methods['sender'] = methods['sender'].replace('if-nez v0,', 'if-eqz v0,')
        with self.assertRaisesRegex(AssertionError, 'visible|background|sender'):
            self.verify(methods)

    def test_changed_api36_mode_is_rejected_without_shape_change(self):
        methods = self.fixture()
        self.assertEqual(methods['sender'].count('const/4 v1, 0x4'), 1)
        methods['sender'] = methods['sender'].replace('const/4 v1, 0x4', 'const/4 v1, 0x3')
        with self.assertRaisesRegex(AssertionError, 'mode'):
            self.verify(methods)

    def test_binding_capability_opt_in_cannot_be_dropped(self):
        methods = self.fixture()
        self.assertEqual(methods['binding'].count('0x1001'), 1)
        methods['binding'] = methods['binding'].replace('0x1001', '0x1')
        with self.assertRaisesRegex(AssertionError, 'binding|capabilit'):
            self.verify(methods)


class AudioTests(unittest.TestCase):
    NATIVE = '''.method public final onDestroy()V
.locals 2
invoke-virtual {v0, v1}, Landroid/speech/tts/TextToSpeech;->setOnUtteranceProgressListener(Landroid/speech/tts/UtteranceProgressListener;)I
move-result v0
return-void
.end method'''

    def test_exact_teardown_replacement_preserves_registers_and_result(self):
        managed = self.NATIVE.replace('invoke-virtual', 'invoke-static').replace(release.NATIVE_LISTENER, release.MANAGED_LISTENER)
        normalized = release.normalize_destroy(managed, True)
        self.assertEqual(release.canonical(normalized), release.canonical(self.NATIVE))
        self.assertEqual(release.shape(normalized), release.shape(self.NATIVE))
        self.assertEqual(release.normalize_destroy(self.NATIVE, False), self.NATIVE)
        with self.assertRaisesRegex(AssertionError, 'iff navigation selected'):
            release.normalize_destroy(managed, False)

    def test_no_broad_provider_call_or_duplicate_normalization(self):
        managed = self.NATIVE.replace('invoke-virtual', 'invoke-static').replace(release.NATIVE_LISTENER, release.MANAGED_LISTENER)
        duplicate = managed.replace('move-result v0', 'invoke-static {v0, v1}, ' + release.MANAGED_LISTENER + '\nmove-result v0')
        with self.assertRaisesRegex(AssertionError, 'Exactly one'):
            release.normalize_destroy(duplicate, True)
        extra = managed.replace('return-void', 'invoke-static {}, ' + release.AUDIO_OWNER + '->muted()Z\nreturn-void')
        with self.assertRaisesRegex(AssertionError, 'No other teardown'):
            release.normalize_destroy(extra, True)

    def test_focus_gate_self_loop_is_rejected_even_with_identical_shape(self):
        descriptor = 'Lorg/maplibre/navigation/android/navigation/ui/v5/voice/Api26AudioFocusDelegate;->requestFocus()V'
        body = """.method public requestFocus()V
.locals 1
invoke-static/range {p0 .. p0}, Lnl/johninnl/navigation/startup/ProviderAudio;->trackMapFocus(Ljava/lang/Object;)V
invoke-static {}, Lnl/johninnl/navigation/startup/ProviderAudio;->muted()Z
move-result v0
:bad_loop
if-eqz v0, :native_audio
return-void
:native_audio
nop
iget-object v0, p0, Lorg/maplibre/navigation/android/navigation/ui/v5/voice/Api26AudioFocusDelegate;->audioManager:Landroid/media/AudioManager;
iget-object p0, p0, Lorg/maplibre/navigation/android/navigation/ui/v5/voice/Api26AudioFocusDelegate;->audioFocusRequest:Landroid/media/AudioFocusRequest;
invoke-virtual {v0, p0}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioFocusRequest;)I
return-void
.end method"""
        broken = body.replace('if-eqz v0, :native_audio', 'if-eqz v0, :bad_loop')
        self.assertEqual(release.shape(body), release.shape(broken))
        release.verify_focus_behavior(body)
        with self.assertRaisesRegex(AssertionError, 'Fragment did not complete'):
            release.verify_focus_behavior(broken)
        for version in (14, 15):
            release.assert_profile(body, release.AUDIO[version][descriptor]['managed'], descriptor)
            with self.assertRaisesRegex(AssertionError, 'full publisher flow'):
                release.assert_profile(broken, release.AUDIO[version][descriptor]['managed'], descriptor)

    def test_both_versions_keep_complete_native_cohort_and_uid_methods(self):
        self.assertEqual(len(NAMES), 9)
        self.assertIn(release.SUPPORT, NAMES)
        for version in (14, 15):
            self.assertEqual(len(release.AUDIO[version]), 18)
            self.assertEqual(sum(row['role'] == 'retained' for row in release.AUDIO[version].values()), 2)
            for signature, row in release.HOST_VALIDATOR[version].items():
                if signature.startswith('isAllowListed('):
                    self.assertNotEqual(row['original'][0], row['selected'][0])
                    self.assertEqual(row['selected'][1][1], row['original'][1][1] + 19)
                else:
                    self.assertEqual(row['original'], row['selected'])
            self.assertIn('validateHost(Landroidx/car/app/HostInfo;)Z', release.HOST_VALIDATOR[version])
            batch = next(row for row in release.AUDIO[version].values() if row['role'] == 'batch')
            self.assertEqual(batch['managed'][1][1], batch['original'][1][1] + 5)


if __name__ == '__main__':
    unittest.main()
