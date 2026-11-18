# Disable first-party Silo telemetry

- **Id:** `anghami.privacy.silo-telemetry`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** low
- **Category:** Privacy

## Observable behaviour

Anghami ships its own telemetry client, Silo, which reports playback, navigation,
impression and device data to Anghami's own servers. After patching, those reports
stop while the rest of the application keeps working: playback, search, browsing
and downloads are unchanged.

## Preconditions

The two preference switches that decide most of this traffic are `false` by
default, but the sign-in response can turn them on for an account. The patch makes
the local answer `false` regardless of what the server writes, so it matters for
the accounts where the server enables the traffic.

## Acceptance criteria

- [ ] Playback, click, impression, time-spent and playqueue reports no longer
      reach Silo.
- [ ] A generic application error does not produce a Silo error event.
- [ ] Device specifications are not uploaded to Silo.
- [ ] Playback, search, downloads and the rest of the interface behave as before.
- [ ] Turning the patch off restores the reports for an account the server enables
      them for.

## Out of scope

- Third-party analytics and crash reporting (Firebase, Amplitude, Adjust, Branch,
  Facebook). Those are covered by `anghami.privacy.analytics` and share no code
  path with Silo.
- Advertising identifiers and advertising traffic.
- The Silo song-quartile preference. It only decides whether quartile data is
  included in the play-song payload, and that payload is sent through the same
  reporter the song-tracking gate already silences, so answering it would add no
  behaviour.

## Open questions

- Does any screen depend on the result of a silenced call? Answered: the two
  methods answered directly are `void`. The two value-returning methods are the
  preference getters, which only decide whether a report is made.
  `SiloPlaySongReporting.reportSongPlayEvent` also returns a value, but it is left
  alone: when song tracking is answered `false` it returns `false` before it builds
  or queues anything, which is exactly the path the stock build takes when the
  server does not enable tracking. Its callers only use that answer to update a
  local "already reported" flag.
- Does Silo share a sender with the third-party analytics? Answered: no. Silo
  queues events in its own object-box store through `SiloManager`, and the
  third-party SDKs are reached through the analytics facade.

## Verification

1. Run the patched build through a proxy and play, browse and search.
2. Confirm no request reaches the Silo endpoints.
3. Trigger a handled error and confirm no Silo error event is queued.
4. Confirm playback, downloads and search still work.

## Provenance

- Spec author and date: Kero309x, 2026-11-08
- Derived: 2026-11-08 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.privacy.silo-telemetry`.
