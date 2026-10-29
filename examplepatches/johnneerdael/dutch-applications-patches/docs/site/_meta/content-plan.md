# Bilingual documentation first pass

Requested destination: https://morphe-patches.neerdael.nl/.
Source baselines: main 6102fa9 (v1.8.0) for the original twelve apps; main 8ca0ddb (v1.9.0) for Dumpert, integrated during this writing session. Both inspected 2026-10-28.

## Scope

- [x] Draft matching Dutch and English pages for beginners, using Dutch at the site root.
- [x] Separate practical guides, app categories, tracking education, tracker profiles and evidence/reference material.
- [x] Cover the thirteen stable apps, with explicit versions and individual privacy limitations. Keep research-only apps visibly separate.
- [x] Explain the named services through examples, mechanisms, data and identifiers, our findings, patch effects, unknowns and external reading.
- [x] Add the Material for MkDocs configuration and custom-domain file. Apply the brand kit supplied during writing, including local fonts, dark/light themes, README and future release-note branding. Add Pages build/deployment automation; production activation remains separate from this content review.
- [x] Check translation parity, navigation, local links, source/version references and a strict bilingual build.

## Editorial contract

Lead with the reader's question. Define SDK, event, identifier and endpoint before relying on them. Explain what the collected facts reveal about a person without presenting hypothetical profiling as an observed downstream use. Distinguish documented product capability, traced app wiring, shipped/configured destinations, WebView policy and runtime observations. Device acceptance establishes functionality only for the scenarios reported.

Every app links to a version-specific existing technical audit. Vendor documentation explains capability; independent research explains mechanisms and context. Neither substitutes for an app-specific capture. Do not claim resale, retention periods, legal violations, complete anonymity or complete tracking removal without supporting evidence. A consent-management service, crash reporter, push transport and advertising network have different purposes.

## Structure and maintenance

`docs/site/nl/` and `docs/site/en/` mirror paths. Tracker pages are reusable; app pages contain app-specific findings. Source/audit links are pinned to the inspected main commit so a later audit cannot silently change the basis of a statement. New app versions require a new verification date and review of those statements. Existing audits are retained, with destination links updated to the site/register. The README now uses compact generated category tables; detailed per-patch targets/defaults/descriptions are generated into the site from current release metadata.

## Template findings

CueRithm origin/main uses Material for MkDocs, a separate user-guide content root, task-oriented navigation, a separate explanatory section, strict validation, and a Pages build/deploy workflow. ProjectM's published site uses the same task-versus-explanation separation. The local CueRithm feature checkout predates its docs site, so its origin/main files were inspected read-only. No files in the reference projects were changed.

## Validation commands

Create a disposable Python virtual environment outside the repository, install `docs/site-requirements.txt`, then run `python -m mkdocs build --strict`. Compare relative Markdown paths in both language trees; inspect rendered language alternates, cross-links and search output. Review the app summaries against README and their existing audits. No application build or device action is needed for this documentation-only change.

## Review and validation record

The first pass contains 47 matching pages per language (94 pages), including all thirteen stable app pages, twelve individual tracker profiles and one grouped additional-services explainer. Source links are pinned; all 36 unique external reference URLs checked successfully. The strict bilingual build, rendered local-link/anchor checks, translation-counterpart checks, the Python suite and six release-branding Node tests pass. Browser review checked phone-size dark/light layouts and language switching. Independent review found two issues: moved developer-link resolution and release metadata reaching the site after [skip ci]; both were fixed. The Pages workflow is also checked with actionlint. Heval’s compact category-summary presentation informed the README layout; the supplied identity and CueRithm patterns informed branding. No patch implementation or existing published release was changed.
