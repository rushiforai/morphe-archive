"""Reject unsupported 9292 build metadata before native graph verification."""
from pathlib import Path
import os
import shutil
import re
import xml.etree.ElementTree as ET
import tempfile
import unittest

from verify_9292 import A, original_variant, verify
from n9292_contracts import ORIGINAL_VARIANTS


class OriginalVariantTests(unittest.TestCase):
    def metadata(self, minimum=24, target=36, version='2.48.1', code=32189):
        return (f"sdkInfo:\n  minSdkVersion: {minimum}\n  targetSdkVersion: {target}\n"
                f"versionInfo:\n  versionCode: {code}\n  versionName: {version}\n")

    def read_variant(self, metadata):
        with tempfile.TemporaryDirectory() as scratch:
            root=Path(scratch)
            (root/'apktool.yml').write_text(metadata)
            return original_variant(root)

    def test_all_supported_publisher_variants(self):
        for minimum, derived in [(24,'2'),(29,'3'),(32,'4')]:
            with self.subTest(minimum=minimum):
                variant=self.read_variant(self.metadata(minimum=minimum))
                self.assertEqual(variant['derived_apk_id'],derived)
                self.assertEqual(len(variant['base_sha256']),64)

    def test_same_version_with_unvalidated_sdk_is_rejected(self):
        for minimum in [23,25,28,30,31,33,999]:
            with self.subTest(minimum=minimum),self.assertRaises(AssertionError):
                self.read_variant(self.metadata(minimum=minimum))

    def test_version_target_and_missing_or_ambiguous_sdk_are_rejected(self):
        bad=[self.metadata(target=35),self.metadata(version='2.48.2'),self.metadata(code=32190),
             self.metadata().replace('  minSdkVersion: 24\n',''),
             self.metadata()+'  minSdkVersion: 29\n']
        for metadata in bad:
            with self.subTest(metadata=metadata),self.assertRaises(AssertionError):
                self.read_variant(metadata)

    def test_quoted_apktool_metadata_is_accepted(self):
        self.assertEqual(self.read_variant(self.metadata().replace(': 24',": '24'").replace(': 32189',': "32189"'))['derived_apk_id'],'2')



@unittest.skipUnless(os.environ.get('N9292_FIXTURES'),
                     'Set N9292_FIXTURES to the ignored genuine original fixture directory')
class GenuineOriginalMutationTests(unittest.TestCase):
    """Exercise full APK-bound verification; store no publisher binary/source in Git."""
    def variants(self):
        base=Path(os.environ['N9292_FIXTURES'])
        for directory, decoded in [('api24','smali'),('api29','smali'),('baseline','decoded')]:
            yield base/directory/decoded, base/directory/'base.apk'

    def test_exact_originals_pass(self):
        for decoded,apk in self.variants():
            with self.subTest(apk=apk):
                verify(decoded,set(),apk)

    def test_manifest_mutations_are_rejected_for_every_variant(self):
        def add_debuggable(manifest):
            manifest.find('application').set(A+'debuggable','true')
        def remove_permission(manifest):
            manifest.remove(manifest.find('uses-permission'))
        def change_packaging(manifest):
            node=next(n for n in manifest.iter('meta-data')
                      if n.get(A+'name')=='com.android.vending.derived.apk.id')
            node.set(A+'value','999')
        for decoded,apk in self.variants():
            for mutation in [add_debuggable,remove_permission,change_packaging]:
                with self.subTest(apk=apk,mutation=mutation.__name__),tempfile.TemporaryDirectory() as scratch:
                    root=Path(scratch)
                    for source in decoded.glob('smali*'):
                        if source.is_dir():
                            (root/source.name).symlink_to(source.resolve(),target_is_directory=True)
                    shutil.copyfile(decoded/'apktool.yml',root/'apktool.yml')
                    manifest=ET.parse(decoded/'AndroidManifest.xml')
                    mutation(manifest.getroot())
                    manifest.write(root/'AndroidManifest.xml')
                    with self.assertRaisesRegex(AssertionError,'9292 original manifest changed'):
                        verify(root,set(),apk)

    def test_cross_variant_metadata_does_not_accept_another_original(self):
        for decoded,apk in self.variants():
            with self.subTest(apk=apk),tempfile.TemporaryDirectory() as scratch:
                root=Path(scratch)
                current=original_variant(decoded)
                other=29 if current is ORIGINAL_VARIANTS[24] else 24
                metadata=(decoded/'apktool.yml').read_text()
                metadata=re.sub(r'(minSdkVersion: )[^\n]+',r'\g<1>'+str(other),metadata)
                (root/'apktool.yml').write_text(metadata)
                with self.assertRaisesRegex(AssertionError,'9292 original APK digest changed'):
                    verify(root,set(),apk)


if __name__=='__main__':
    unittest.main()
