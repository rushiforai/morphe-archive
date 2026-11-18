# Upstream changelog plug-in

Vendored from MorpheApp/changelog, bundle branch, revision
`f3d88b22e0276c44e76907bed292f3cdd96873f9`.

The original MIT license and copyright notices are preserved. The only functional
change in lib/prepare.js replaces its GitHub-only repository parser with a URL
parser accepting GitHub and GitLab namespaces. Changelog generation, release JSON,
timestamp formatting and semantic-release lifecycle hooks remain upstream's.

This is the same release plug-in selected by the Morphe patches template's
.releaserc. It is vendored so the small GitLab adaptation is pinned and auditable.
