# Changelog

Every HushThreads release, newest first.

## 0.0.2 (2026-09-29)

The first release, with 6 patches for Threads 449.0.0.54.82.

* **Threads:** Hide ads takes sponsored posts out of each page of the feed before Threads caches or shows it. Whether a post is an ad is Threads' own answer, read from the "injected" block the server puts on sponsored posts.
* **Threads:** Sanitize sharing links takes `xmt`, `slof`, `igsh`, `igshid`, `igsi` and `fbclid` off the links Threads hands out for a post, at the one place every Copy link and share gets its link from.
* **Threads:** Disable analytics points Threads' event log uploads at a port on the phone that nothing listens on, from all three places the app builds that address.
* **Threads:** Remove the advertising ID takes the advertising ID permission out of the manifest, so Google Play services gives Threads zeros.
* **Threads:** Restore screens on re-signed builds answers Threads' own signer check with Meta's certificate, and trusts an Instagram signed with the same key.
* **Threads:** HushThreads settings opens from a launcher shortcut or from Additional settings in the app on Threads' App info page, with pause, safe mode, settings backups, diagnostics and the licences.
* **Threads:** Sign in with your Instagram username and password. Continue as the Instagram account already on your phone doesn't work on a patched Threads yet.
* **Tooling:** The README has the HushThreads logo and a banner in the Hush family's blue and navy look.
