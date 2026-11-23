# Filter updates

`selectors.json` is the file the **Filter updates** patch downloads, at most once a day, from the `main` branch:

```json
{
  "format": 1,
  "rules": {
    "removeAds": ["[class*=\"dom_annotate_multifeed_bundle_NewAdBundle\"]"]
  }
}
```

Each key is a patch's switch key (the ones in `SettingsCatalog.java`). While that patch is on, the app adds every
selector under it to Quora's pages with `display:none`, next to the selectors built into the patch. A change here
reaches the apps without a release.

When Quora renames something a hiding patch relies on:

1. Find the new class or attribute in the page (see CONTRIBUTING.md for inspecting the app's WebView).
2. Add the selector under the patch's key and open a pull request **to `main`**. The Build workflow runs
   `.github/scripts/check_filters.py` and checks that each selector parses.
3. After merging, merge `main` into `dev` too. Then put the fix into the patch itself, and remove it from this file
   once a release with it is out.

Rules (the app skips entries that break them, and the check fails on them):

- Plain CSS selectors only: no `{ } ; @ \ <`, no `url(`, `image(` or comments, ASCII only, at most 300 characters.
- At most 50 selectors per patch and 64 KB for the whole file.
- The file can only hide things. It can't show, restyle or load anything.
