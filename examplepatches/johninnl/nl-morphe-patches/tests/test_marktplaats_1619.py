"""Exact publisher metadata and optional genuine APK-bound mutation regressions."""
import os
from pathlib import Path
import shutil
import tempfile
import unittest
from unittest.mock import patch
import xml.etree.ElementTree as ET

from marktplaats_1619 import A, profile, verify, audit_fields
from verify_dumpert import Smali
from dex_declarations import DexDeclarations


class ProfileTests(unittest.TestCase):
    def metadata(self,minimum=26,version='16.19.0',code=633464,target=37):
        return (f"sdkInfo:\n  minSdkVersion: {minimum}\n  targetSdkVersion: {target}\n"
                f"versionInfo:\n  versionName: {version}\n  versionCode: {code}\n")

    def read(self,metadata):
        with tempfile.TemporaryDirectory() as scratch:
            root=Path(scratch);(root/'apktool.yml').write_text(metadata)
            return profile(root)

    def test_four_exact_original_variants(self):
        hashes={self.read(self.metadata(minimum=value))['base_sha256'] for value in [26,28,29,32]}
        self.assertEqual(len(hashes),4)

    def test_unvalidated_build_metadata_is_rejected(self):
        bad=[self.metadata(minimum=value) for value in [24,25,27,30,31,33,999]]
        bad += [self.metadata(version='16.17.0'),self.metadata(code=633462),self.metadata(target=36),
                self.metadata().replace('  minSdkVersion: 26\n',''),
                self.metadata()+'  minSdkVersion: 28\n']
        for text in bad:
            with self.subTest(text=text),self.assertRaises(AssertionError):self.read(text)

    def test_public_verifier_rejects_retired_build_before_dex_or_manifest_access(self):
        from verify_marktplaats import verify as verify_public
        with tempfile.TemporaryDirectory() as scratch:
            root=Path(scratch)
            (root/'apktool.yml').write_text(self.metadata(minimum=32,version='16.17.0',code=633462))
            # Neither an APK nor decoded code is present: retired input must
            # stop at dispatch before historical fixture code can run.
            with self.assertRaisesRegex(AssertionError,'Unsupported Marktplaats version'):
                verify_public(root,set(),root/'missing.apk')


@unittest.skipUnless(os.environ.get('MARKTPLAATS_FIXTURES'),
                     'Set MARKTPLAATS_FIXTURES to the ignored genuine fixture directory')
class GenuineOriginalTests(unittest.TestCase):
    def variants(self):
        root=Path(os.environ['MARKTPLAATS_FIXTURES'])
        for sdk,decoded in [(26,'decoded26'),(28,'android28/smali'),(29,'android29/smali')]:
            yield root/decoded,root/('android'+str(sdk))/'base.apk'

    def test_all_genuine_originals(self):
        for root,apk in self.variants():
            with self.subTest(apk=apk):verify(root,set(),apk)

    def test_manifest_mutation_rejected_for_each_variant(self):
        for decoded,apk in self.variants():
            with self.subTest(apk=apk),tempfile.TemporaryDirectory() as scratch:
                root=Path(scratch)
                for source in decoded.glob('smali*'):
                    if source.is_dir():(root/source.name).symlink_to(source.resolve(),target_is_directory=True)
                shutil.copyfile(decoded/'apktool.yml',root/'apktool.yml')
                manifest=ET.parse(decoded/'AndroidManifest.xml')
                manifest.getroot().find('application').set(A+'debuggable','true')
                manifest.write(root/'AndroidManifest.xml')
                with self.assertRaisesRegex(AssertionError,'original manifest changed'):
                    verify(root,set(),apk)

    def test_changed_retained_getter_rejected(self):
        root,apk=next(self.variants());original=Smali.body
        owner='Lcom/horizon/android/feature/search/search/model/FlexibleSearchResponse;'
        def changed(source,actual_owner,signature):
            body=original(source,actual_owner,signature)
            if (actual_owner,signature)==(owner,'getItems()Ljava/util/List;'):
                body=body.replace('return-object p0','const/4 p0, 0x0\n    return-object p0')
            return body
        with patch.object(Smali,'body',changed),self.assertRaisesRegex(AssertionError,'original graph changed'):
            verify(root,set(),apk)

    def test_wire_option_field_name_descriptor_and_mode_are_exact(self):
        root,apk=next(self.variants());source=Smali(root);decl=DexDeclarations.from_apk(apk)
        valid='    .locals 1\n    iget-object v0, p0, Lwz3;->d:Ljava/lang/String;\n    return-object v0\n'
        audit_fields(source,decl,valid)
        for broken in [valid.replace('->d:','->a:'),valid.replace('Ljava/lang/String;','Landroid/os/Bundle;'),
                       valid.replace('iget-object v0, p0,','sget-object v0,')]:
            with self.subTest(body=broken),self.assertRaises(AssertionError):audit_fields(source,decl,broken)

    def test_existing_same_type_wrong_wire_field_is_rejected(self):
        base=Path(os.environ['MARKTPLAATS_FIXTURES'])/'final-api26'
        decoded=base/'helper-decoded';apk=base/'marktplaats-all.apk'
        if not (decoded/'AndroidManifest.xml').exists():self.skipTest('Create the final API 26 combined output fixture')
        source=Smali(decoded);decl=DexDeclarations.from_apk(apk)
        owner='Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;'
        signature='morpheGoogleOption('+owner+'Lwz3;)Lwz3;'
        body=source.body(owner,signature)
        changed=body.replace('Lwz3;->g:Ljava/lang/String;','Lwz3;->i:Ljava/lang/String;')
        self.assertNotEqual(body,changed)
        audit_fields(source,decl,changed)  # Both declarations exist with this type.
        original=Smali.body
        def wrong_field(actual_source,actual_owner,actual_signature):
            return changed if (actual_owner,actual_signature)==(owner,signature) else original(actual_source,actual_owner,actual_signature)
        selected={'Hide ads','Disable tracking','Disable ThreatMetrix','Skip consent screens','Google sign-in via microG-Re'}
        with patch.object(Smali,'body',wrong_field),self.assertRaisesRegex(AssertionError,'generated helper graph changed'):
            verify(decoded,selected,apk)


if __name__=='__main__':
    unittest.main()
