<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: OpenWebPagesInBrowserTests -->

# Open web pages in the browser

Links to web pages open in your browser, while images, galleries and videos keep opening in BaconReader.

- A link to a web page opens in your browser instead of BaconReader's own browser: a post's link, the site next to the
  post's title, and a link in a post's text or a comment.
- Images, GIFs, galleries, Imgur albums and Reddit videos keep opening in BaconReader, also with BaconReader's "Open
  links inside app" off, which otherwise opens them in your browser.
- Links to Reddit open in BaconReader as before.
- The link icon in a post's bar gets the label "Open link", which screen readers read.

**Settings** (BaconReader → Settings → Patches, under "Links"):
- **Open web pages in the browser** (off by default): links to web pages open in your browser. Images, GIFs, galleries
  and videos still open in BaconReader, whether or not "Open links inside app" is on.

**Limits**:
- A link to Imgur or RedGIFs opens in BaconReader, even when it leads to a web page there.
