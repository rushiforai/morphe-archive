# v1.10.6-dev.1 — Account watch-history tab restoration

Development-only patch based on the released v1.10.5 source.

Fix account watch-history tabs showing an endless loading indicator when first
opened from another tab after app startup. The cause was an empty persisted URL
derived from an Intent without data: the fragment treated it as a real endpoint
and tried an HTTP request with no scheme or host.

Restore the canonical account-history endpoint only for the account-history
route (native list type=4), on saved-tab JSON load, initial tab creation,
and just before route Intent construction. Existing tab ID, title, scroll
position and all other tab URLs are retained. No artificial retry loop,
background traffic or new UI settings.

Tests: account history URL regression checks, original tests, smali and DEX
hook verification, final MPP verification. Android device testing is pending.
