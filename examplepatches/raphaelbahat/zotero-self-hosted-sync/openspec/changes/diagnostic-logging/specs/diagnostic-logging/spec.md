## ADDED Requirements

### Requirement: On-demand client logging

Feature: Diagnostic logging
Rule: The client's own log output can be made visible without changing behaviour.

The patch MUST plant a logging tree only when the patch is applied, and MUST NOT alter any network
traffic, synchronisation behaviour or stored data.

#### Scenario: Verbose logging is off

- **GIVEN** a bundle built without the patch (or with it not selected)
- **WHEN** the app runs
- **THEN** logcat contains no additional client log lines and the app behaves exactly as before

#### Scenario: Verbose logging is on

- **GIVEN** the patched app built with **Enable verbose logging** selected
- **WHEN** the app performs a synchronisation, and in particular when it considers an attachment
  for upload
- **THEN** the client's own log lines appear in logcat — including which attachments were queued
  and which were skipped, with the reason

#### Scenario: No behaviour change

- **GIVEN** the patched app with verbose logging on
- **WHEN** a library is synchronised
- **THEN** the requests sent, the data stored and the sync outcome are identical to the same build
  with logging off
