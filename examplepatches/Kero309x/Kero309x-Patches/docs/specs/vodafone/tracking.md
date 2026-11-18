# Disable usage tracking

- **Id:** `vodafone.privacy.tracking`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** low
- **Category:** Privacy

## Observable behaviour

The stock build reports what the user does. Screens, offers, gifts and the
scratch card produce events, the login flow reports its experiment events, and
every event is sent to the analytics, social-media and survey services the
application embeds. After patching, the application builds no event report and
sends nothing to those services.

## Preconditions

None. The reporting is started by the application itself, at startup and from
the screens that produce events, and does not depend on a server answer.

## Acceptance criteria

- [ ] No usage event leaves the application; the analytics, social-media and
      survey services receive nothing.
- [ ] The survey prompt does not appear, because the survey is submitted
      through the same path as the other events.
- [ ] The experiment events the login flow reports are not sent either.
- [ ] Every screen works as before: no event is read back by the application, so
      nothing waits for a report that is no longer made.
- [ ] Turning the patch off restores the stock behaviour.

## Out of scope

The embedded SDKs are still created and started, so the traffic they produce on
their own, such as install attribution and session reporting, is not covered by
this patch. The application's own traffic is untouched: the screens it loads,
the requests it makes and the account it keeps behave exactly as they do
unpatched.

## Limitations

- An event is still prepared before it is reported, so a little work is done
  for an event that is never sent. The reports themselves are not sent.
- The SDKs keep running. Their own automatic traffic is not part of the
  application's event vocabulary and is not stopped here.

## Open questions

- Does any screen read an event back? Answered for this build: the methods the
  patch touches are void, so no caller can be left waiting for a value, and no
  screen reads a report.

## Verification

1. Install the patched build and use the application: the home screen, the
   offers screen, the recharge screen, the payment screen and the gift screens.
2. Confirm no request reaches the analytics, social-media or survey services.
3. Confirm no survey prompt appears.
4. Sign in and out, and confirm no experiment event is sent.
5. Disable the patch, rebuild and install, and confirm the reports return.

## Provenance

- Spec author and date: Kero309x, 2026-11-10
- Derived: 2026-11-10 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `vodafone.privacy.tracking`.
