## ADDED Requirements

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