"""Keep localized README navigation and shared assets usable."""
import json
import re
import unittest
from pathlib import Path
from urllib.parse import unquote, urlsplit


ROOT = Path(__file__).resolve().parents[2]
LOCALES = ("de", "zh-CN", "ja", "es", "ko", "pt-BR", "fr")
PAGES = [ROOT / "README.md", *(ROOT / "docs/readme" / f"README.{locale}.md" for locale in LOCALES)]


def local_targets(text):
    targets = re.findall(r"\]\(([^\s)]+)\)", text)
    targets += re.findall(r'(?:src|srcset|href)="([^"]+)"', text)
    for target in targets:
        parsed = urlsplit(target)
        if not parsed.scheme and not parsed.netloc and parsed.path:
            yield unquote(parsed.path), parsed.fragment


class ReadmeLocales(unittest.TestCase):
    def test_language_navigation_is_reciprocal(self):
        for page in PAGES:
            with self.subTest(page=page):
                text = page.read_text(encoding="utf-8")
                linked = {(page.parent / target).resolve() for target, _ in local_targets(text)}
                self.assertTrue({p.resolve() for p in PAGES}.issubset(linked))

    def test_localized_links_and_shared_visuals_resolve(self):
        for page in PAGES[1:]:
            with self.subTest(page=page):
                text = page.read_text(encoding="utf-8")
                for target, fragment in local_targets(text):
                    destination = (page.parent / target).resolve()
                    self.assertTrue(destination.is_file(), f"{page.name}: {target}")
                    if fragment and destination == PAGES[0].resolve():
                        root = destination.read_text(encoding="utf-8")
                        self.assertIn(f'id="{fragment}"', root)
                for asset in ("penguin-patches-banner-tailor.png", "penguin-patches-banner-tailor-dark.png",
                              "credits-before.png", "credits-after.png"):
                    self.assertIn(asset, text)
                self.assertIn("https://morphe.software/add-source?github=pengusto/penguin-patches", text)
                self.assertNotRegex(text, r"(?m)^\*\*[^*\n]+\*\*(?=\S)")

    def test_localized_app_lists_cover_release_metadata(self):
        metadata = json.loads((ROOT / "patches-list.json").read_text(encoding="utf-8"))
        names = {app["name"] for patch in metadata["patches"]
                 for app in patch.get("compatiblePackages", [])}
        slugs = {re.sub(r"-+", "-", re.sub(r"[^a-z0-9]+", "-", patch["name"].lower())).strip("-")
                 for patch in metadata["patches"]}
        for page in PAGES[1:]:
            with self.subTest(page=page):
                text = page.read_text(encoding="utf-8")
                for name in names:
                    self.assertIn(f"[{name}](", text)
                linked = re.findall(r"\]\(../../README\.md#preview-([a-z0-9-]+)\)", text)
                self.assertEqual(set(linked), slugs)
                self.assertEqual(len(linked), len(slugs), "each released patch appears once")


if __name__ == "__main__":
    unittest.main()
