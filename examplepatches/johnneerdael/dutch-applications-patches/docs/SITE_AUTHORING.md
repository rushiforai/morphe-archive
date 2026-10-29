# Writing and previewing the documentation site

The content draft for **morphe-patches.neerdael.nl** lives in `docs/site/`.
Dutch (`nl/`) and English (`en/`) have matching paths. Dutch is published at the
root; English uses `/en/`. This follows CueRithm's Material for MkDocs approach,
with a language switch and a separate tracking-education section.

```sh
python3 -m venv /tmp/morphe-docs-venv
/tmp/morphe-docs-venv/bin/python -m pip install -r docs/site-requirements.txt
python3 scripts/generate_docs_catalog.py
/tmp/morphe-docs-venv/bin/python -m mkdocs build --strict
python3 scripts/check_docs_site.py
/tmp/morphe-docs-venv/bin/python -m mkdocs serve
```

The output goes to the ignored `build/docs-site/` directory. `_meta/` contains
writer-only notes and is excluded. The supplied brand kit is integrated with local fonts, light/dark assets and semantic
colour tokens. There are no analytics or externally hosted fonts. The Pages workflow
builds pull requests and deploys the reviewed main branch; repository Pages setup
uses GitHub Actions. No DNS records are changed by the build. The custom domain is recorded in `mkdocs.yml` and `CNAME`.
The README is a compact branded entry point. Its SUMMARY marker keeps release-generated metadata concise while preserving the old full-catalogue mode for ordinary markers.

Each new page needs a counterpart in the other language and a place in navigation.
Keep patch names as shown in Morphe Manager; translate their explanation. Translate
the prose itself rather than relying on language fallback. Explain a data field's
meaning before showing its obfuscated code name. Use examples marked as examples.

Each tracker profile distinguishes its general documented capability from our
version-specific findings. Pin repository evidence links to the reviewed commit.
Link primary technical documentation and independent research with descriptive
labels. Record the review date and gaps; do not label static findings as captured
network traffic. Do not embed reports, videos, fonts or analytics from third parties.

Before publication: check the mobile layout and both themes, enable GitHub Pages
with GitHub Actions as the source, configure/verify `morphe-patches.neerdael.nl`,
and review the app-specific evidence. The custom domain already resolves to
GitHub Pages at the time of this writing; DNS resolution alone does not mean a
site has been published. The release generator supports `PATCHES_START SUMMARY`
and its original full-catalogue markers, covered by regression checks.
