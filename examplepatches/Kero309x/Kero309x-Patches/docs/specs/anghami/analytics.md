# Disable analytics and crash reporting

- **Id:** `anghami.privacy.analytics`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** high
- **Category:** Privacy

## Observable behaviour

The application sends usage events, campaign attribution and crash reports to
several third-party services. After patching, those calls become no-ops while the
rest of the application keeps working.

## Preconditions

None.

## Acceptance criteria

- [ ] No request reaches the analytics, attribution or crash reporting endpoints.
- [ ] The application starts normally and playback works.
- [ ] A deliberately triggered error does not crash the application because a
      reporting call returned nothing.
- [ ] No screen goes blank because a component depended on a reporting result.

## Out of scope

Advertising identifiers, which are part of the advertising behaviour, and any
network traffic the application needs for playback.

## Open questions

- Which of the reporting call sites return a value that the caller uses? Answered:
  the emitted events are void throughout. Only two value-returning methods exist on
  the facade — the experiment reader and the local rate limiter — and neither
  touches the network, so silence them was not needed and they are left alone. The
  experiment client is simply never created, and its one outside caller treats that
  as "use the default value".
- Should this be disabled by default, given that it removes diagnostics the
  maintainer would want from bug reports? Resolved by decision `0004`: every patch
  defaults to enabled, and the manager lets a user turn it off per patch.
- Does the application own crash reporting, or is it a separate SDK? Answered: the
  crash reports travel through the same facade as an ordinary event, so silencing
  the sinks covers them. No Firebase Crashlytics entry point is called by the
  application, and BugSnag is present as a library without any call site from app
  code, so there is nothing to silence for it.

## Verification

1. Run the patched build through a proxy and open every main screen.
2. Confirm the reporting endpoints receive nothing.
3. Trigger a handled error path and confirm no user-visible crash.
4. Confirm playback, downloads and search still work.

## Provenance

- Spec author and date: Kero309x, 2026-11-04
- Derived: 2026-11-04 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.privacy.analytics`.
