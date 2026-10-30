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

## App pages

Every app page follows one template, with the Trouw page as the approved
reference. `docs/site/_meta/app-page-template.md` gives the fixed text for both
languages. The Documentation workflow runs `scripts/check_docs_app_pages.py`
before the site build. It fails when a page adds or reorders sections, uses
lists or subsections, or when its version, build, input type, package or control
names differ from `patches-list.json` (stable, or the latest prerelease). It
also fails when the download button differs from the app's row in the downloads
guide.

It also checks pre-release flags. A page and its downloads row carry the
pre-release marker exactly when the target is missing from the stable bundle.
For pull requests into main, the `Docs release gate` workflow runs the check
without path filters. It first generates `patches-list.json` from the pull
request's patch sources and treats that as stable, because the release after
the merge publishes that bundle. A stable page is compared with the stable
bundle and a pre-release page with the prerelease bundle, also when both share
a target. A promotion
from dev that still marks a promoted app as pre-release fails, so make that
check required for main. Run it locally after editing an app page:

```sh
python3 scripts/check_docs_app_pages.py
# what a pull request into main will see
python3 scripts/check_docs_app_pages.py --stable-metadata patches-list.json
```

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

## Stable and prerelease apps on the homepage

The homepage lists both channels together. Prerelease availability is marked by a compact solid-orange **Pre-release**
label at the card’s top-right, outside normal layout flow so it adds no height.
Unchanged apps keep their stable card. App-specific testing and installation
details belong on the app pages, not in announcements above the catalogue.

The Documentation workflow reads the latest published, non-draft prerelease's
`patches-list.json` at its release tag and passes it as `--prerelease-metadata`.
This snapshot is a build artifact: never copy it over main's stable metadata.
Stable and dev release completions rebuild the current main documentation, and
the generated detail catalogues continue to describe only their own branch's data.
No catalogue request is made by a visitor's browser.

For a local preview with a downloaded prerelease snapshot:

```sh
python3 scripts/generate_docs_catalog.py --prerelease-metadata /path/to/prerelease-patches-list.json
```

Without that argument, the generator renders the current checkout's single
channel. Keep release metadata files unchanged when reviewing homepage changes.
