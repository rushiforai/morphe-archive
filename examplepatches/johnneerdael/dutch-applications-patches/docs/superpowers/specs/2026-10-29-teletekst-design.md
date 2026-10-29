# NOS Teletekst privacy and promotion controls

Continue the user-authorized sequence with NOS Teletekst 2.8.10, package
`com.eoffice.android`, code62, minimum API23, original Play APKS. The original
base SHA256 is `767b8abf5e85a6a55c5712dd66c73200ab0c3613f63a8ba2302afaf007cb5c2d`;
publisher SHA256 is `09c20f5d028a5065fbeb4a94ea4d4ba4a8fd2fa5c2dff161e32456608989ee14`.

Two independent default-on controls: Disable tracking and Hide promotions.
Research found no application-wired commercial ad loader or premium gate in
this build. Do not invent those controls or alter Teletekst content. The initial
informational privacy dialog is TV-only in the inspected onResume branch; keep
it and its stored acknowledgement unchanged. It is not a collection switch.

The existing tracker factory is the sole app-owned SdkTracker constructor site.
Disable tracking retains its context null check, then returns the shipped
MultiTracker with an empty, non-null Tracker array. This avoids creating NOS/NPO
analytics, its Govolte persistent-queue worker, visibility heartbeats and NMO DAM
services/identifiers. A network-only guard would leave initialization and queued
work; returning null would violate dependency injection and screen contracts.
The empty native tracker preserves synchronous event completion. Page lifecycle
observation already handles an empty repository. No NPO/NOS analytics WorkManager
subclass or separately registered measurement provider was established. Existing
stored IDs/queue data are not erased; the patched process does not initialize
their SDK. No simulated delivery, consent or subscription state is introduced.

Hide promotions makes only the synchronous scoreboard promotion predicate false.
It prevents display and the promotion's local visit counting, independent of
tracking. Preserve pages818 and all other content, installed-NOS detection,
functional preferences, favourites, sharing, refresh/pause/cancellation and the
Google Play security-provider installation. Do not change getPage or its response
callbacks. The real third-visit behaviour remains when this control is unselected.

Use the existing SSD worktree and exact original-input/method guards. Native
fixtures execute the changed factory, native MultiTracker, DI wrapper, page
lifecycle and promotion policy. Retain whole graphs for content/render/refresh/
error/security and SDK initialization paths; model only explicit platform/SDK
boundaries. FULL original, both individual controls and combined validation,
actual SDK input-guard negatives, suites/docs, one fresh review and downloaded
dev bundle/provenance verification precede handoff. Preserve the approved app
set and expose the two established tracking hosts and their data in the app
README and bilingual guides. Phone acceptance remains separate; no device or
emulator actions are authorized here.
