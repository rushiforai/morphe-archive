# v2.0.1-dev.4 — smooth tab scroll restoration and versioned artifacts

Development verification only. Released v2.0.0 remains unchanged.

- Route both initial and re-opened ListView scroll restoration through one idempotent coordinator
- Cover intermediate native lazy-page scroll jumps with a temporary theme-aware loading surface
- Reveal only after the saved position is laid out; clean up on tab detach or bounded timeout
- Continue to paginate only when the adapter count increases, avoiding repeated redundant scrolls
- Preserve existing scroll-position persistence and native view lifecycles
- Restore CI artifact names such as nicoid-re-v2.0.1-dev.4-mpp.zip
- Keep every v2.0.1-dev.1 through dev.3 fix
- Test regression contracts and build verification MPP in CI

Original APK patch application and Android screen rendering require device validation.
