# README assets

| Asset | Use / origin |
| --- | --- |
| `penguin-patches-banner-tailor.png`, `penguin-patches-banner-tailor-dark.png` | The original light/dark README banners. Retain these approved brand illustrations; the maintainer explicitly chose to keep them on 2026-10-28. |
| `add-to-morphe.svg` | Local text link button; no third-party logo, script, font download or remote asset. |
| `add-to-morphe-qr.png` | Source URL QR retained from the existing setup. |
| `penguin-patches-banner-purple.png` | Existing maintainer identity reference, retained unchanged. |

The README stays native Markdown/HTML, with its tagline in selectable text.
Specify banner width only: GitHub's responsive scaling must preserve the
intrinsic aspect ratio rather than retaining a fixed HTML height.

[Patch comparisons](../PATCH_EXAMPLES.md) reuse unedited evidence files. Pin
remote images to immutable commits. Name the actual before/after baseline next
to each pair, especially source-widget captures, another patch collection or a
previous patch revision. A screenshot's theme change is not patch behavior.
See [provenance and license scope](../PROVENANCE.md).
