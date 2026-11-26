import os
import unittest

os.environ.update({
    "GITHUB_REPOSITORY": "owner/source",
    "GITHUB_TOKEN": "test",
    "GITGUD_PROJECT": "group/mirror",
    "GITGUD_TOKEN": "test",
})

import mirror_gitgud


class ManifestTest(unittest.TestCase):
    def test_rewrites_bundle_and_signature_urls(self):
        manifest = {
            "version": "2.8.0",
            "download_url": "https://github.com/owner/source/releases/download/v2.8.0/patches-2.8.0.mpp",
            "signature_download_url": "https://github.com/owner/source/releases/download/v2.8.0/patches-2.8.0.mpp.asc",
        }

        result = mirror_gitgud.gitgud_manifest(
            manifest, "v2.8.0", "patches-2.8.0.mpp", {"patches-2.8.0.mpp", "patches-2.8.0.mpp.asc"}
        )

        self.assertEqual(manifest["version"], result["version"])
        self.assertEqual(
            result["download_url"],
            "https://gitgud.io/api/v4/projects/group%2Fmirror/packages/generic/morphe-patches/2.8.0/patches-2.8.0.mpp",
        )
        self.assertEqual(
            result["signature_download_url"],
            "https://gitgud.io/api/v4/projects/group%2Fmirror/packages/generic/morphe-patches/2.8.0/patches-2.8.0.mpp.asc",
        )
        self.assertNotEqual(manifest["download_url"], result["download_url"])

    def test_rejects_a_missing_signature_asset(self):
        with self.assertRaisesRegex(RuntimeError, "Signature asset"):
            mirror_gitgud.gitgud_manifest(
                {"signature_download_url": "https://example.test/signature.asc"},
                "v1.0.0",
                "patches.mpp",
                {"patches.mpp"},
            )


if __name__ == "__main__":
    unittest.main()
