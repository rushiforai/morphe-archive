## ADDED Requirements

### Requirement: Upload recovery for unusable attachment metadata

Feature: Attachment upload recovery
Rule: An attachment whose stored modification time cannot be parsed is still uploaded.

The patch MUST substitute a usable modification time instead of discarding the attachment, and MUST NOT change the request, the stored data or the behaviour for an attachment whose value is already usable.

#### Scenario: An empty modification time no longer blocks the upload

- **GIVEN** an attachment whose stored `mtime` field is empty or otherwise not a number
- **WHEN** the client collects the attachments it needs to upload
- **THEN** that attachment is queued and its file is uploaded, instead of being skipped with a log line

#### Scenario: A usable value is used unchanged

- **GIVEN** an attachment whose stored `mtime` is already a number
- **WHEN** the client collects the attachments it needs to upload
- **THEN** the stored value is used exactly as before

#### Scenario: The value stays usable, but it is the upload's, not the file's

- **GIVEN** an attachment uploaded through this recovery
- **WHEN** the upload completes
- **THEN** the attachment carries the value the upload declared — the substitute — because the
  client's sync path never writes the file's own modification time (`StoreMtimeForAttachmentDbRequest`
  is called only by WebDAV). The field is usable rather than unusable, which is what the reader
  needs; it is not claimed to be the file's own

#### Scenario: The recovery is removed once the client stops needing it

- **GIVEN** the app's upload reader handling an unusable `mtime` by repairing it rather than
  discarding the attachment
- **WHEN** that fix is released for the pinned target
- **THEN** this patch is removed, its extension class deleted, and the change's Migration Plan
  followed — the server cannot fix this one, because serving `mtime` as `null` still reads as an
  unusable value to the reader

#### Scenario: Only the upload reader changes

- **GIVEN** the patched application
- **WHEN** any other code path parses a string as a number
- **THEN** that path is unchanged — the substitution applies only to the attachment upload reader
