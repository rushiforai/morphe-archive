# attachment-upload-recovery Specification

## Purpose
TBD - created by archiving change attachment-md5-recovery. Update Purpose after archive.

## Requirements

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

### Requirement: An authorization that carries no upload form is completed

Feature: Attachment upload recovery
Rule: A server that authorizes an upload without handing out an upload form is still able to receive the file.

The patches MUST treat an authorization response with no `params` field as an authorization with an empty form, MUST send an upload that carries no form as the file itself, and MUST NOT change the request, the parsing or the behaviour of an upload that does carry one.

#### Scenario: An authorization with no form is used, not discarded

- **GIVEN** an upload authorization whose response carries no `params` field
- **WHEN** the client parses it
- **THEN** the upload proceeds with an empty form instead of raising a `NullPointerException` and retrying the authorization

#### Scenario: An authorization with a form is unchanged

- **GIVEN** an upload authorization whose response carries a `params` field
- **WHEN** the client parses it
- **THEN** the form is parsed and sent exactly as before

#### Scenario: An upload that carries nothing but the file is sent as the file

- **GIVEN** an upload whose body is a multipart form whose only part is the file
- **WHEN** it is sent
- **THEN** the server receives the file itself, with the length and digest the upload was authorized for

#### Scenario: An upload that carries a form is sent unchanged

- **GIVEN** an upload whose body is a multipart form that carries fields beside the file
- **WHEN** it is sent
- **THEN** the form is sent exactly as before, with every field in order

#### Scenario: Only the upload path changes

- **GIVEN** the patched application
- **WHEN** any other request is sent, including the client's other non-Zotero client and its logging
- **THEN** the request is unchanged
