# v0.4.5 ? Hoshiori repository migration

Repository renamed from `rikunode/hatena-bookmark-hide-pr-patches` to `rikunode/hoshiori`.

- Updated the Morphe Manager source URL, installation links, documentation and project metadata.
- The embedded ad-block snapshot endpoint now points to `https://raw.githubusercontent.com/rikunode/hoshiori/filter-data/filters.json.gz`.
- No changes to any patch logic, DEX guards, options, supported versions or filter-list format. All five patches still target Hatena Bookmark **5.80 (58000)** only.
- The previous repository address may redirect; users should add/update the **new source** to avoid depending on legacy links.
- The `preserveArticleWebStorage` option remains **ON by default**; other sites' cookies and login data can persist.

The update is required for new Android bundles to embed the new snapshot endpoint.
