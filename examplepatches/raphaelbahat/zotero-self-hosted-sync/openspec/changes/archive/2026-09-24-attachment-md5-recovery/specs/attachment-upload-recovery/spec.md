## ADDED Requirements

### Requirement: Upload recovery for an unusable attachment digest

Feature: Attachment upload recovery
Rule: An attachment whose stored MD5 is not a digest the server accepts is still uploaded.

The patch MUST recompute the attachment's digest from its file when the stored value is not a 32-character hex digest, MUST leave an attachment whose stored value already is one unchanged, and MUST NOT request a recomputation when there is no local file to hash.

#### Scenario: An empty digest no longer blocks the upload

- **GIVEN** an attachment whose stored `md5` field is empty or otherwise not a hex digest
- **WHEN** the client collects the attachments it needs to upload
- **THEN** the digest is recomputed from the file and stored on the attachment, and the file is uploaded, instead of an empty `md5` field being sent and refused

#### Scenario: A usable digest is used unchanged

- **GIVEN** an attachment whose stored `md5` is already a 32-character hex digest
- **WHEN** the client collects the attachments it needs to upload
- **THEN** the stored value is sent exactly as before

#### Scenario: The stored digest is repaired, not only substituted

- **GIVEN** an attachment uploaded through this recovery
- **WHEN** the upload completes
- **THEN** the attachment holds the recomputed digest, so later syncs no longer depend on the recovery

#### Scenario: A missing local file is left alone

- **GIVEN** an attachment whose stored digest is unusable and whose file is not present on the device
- **WHEN** the client collects the attachments it needs to upload
- **THEN** no hashing is attempted and the rest of the pass is unaffected

#### Scenario: Only the digest repair changes

- **GIVEN** the patched application
- **WHEN** the client compares a field against the literal `"null"` anywhere else — including the
  `backendMd5` check in the same reader, which shares that constant
- **THEN** that comparison behaves exactly as before
