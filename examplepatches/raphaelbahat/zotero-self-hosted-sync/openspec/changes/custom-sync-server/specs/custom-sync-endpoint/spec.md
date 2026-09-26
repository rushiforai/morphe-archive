## ADDED Requirements

### Requirement: Endpoint override

Feature: Custom sync endpoint
Rule: A patched client uses the operator's self-hosted server for synchronisation, and only that server, while keeping its own identity.

The patched application MUST direct every synchronisation request to the configured origin, and MUST NOT send any synchronisation request to the original hosts.

#### Scenario: Library synchronisation reaches the chosen server

- **GIVEN** the Zotero Android 1.0.0 (build 247) APK patched with the server address `https://zotero.example.org`
- **WHEN** the patched app synchronises a library
- **THEN** every metadata request goes to `zotero.example.org` and none goes to `api.zotero.org`

#### Scenario: Live updates use the derived stream by default

- **GIVEN** the patch applied with the API origin `https://zotero.example.org` and no streaming override
- **WHEN** the app opens its live-update connection
- **THEN** the connection is made to `wss://zotero.example.org/stream`

#### Scenario: Live updates use an explicit streaming override

- **GIVEN** the patch applied with the streaming override `ws://altero.myhut.live/stream`
- **WHEN** the app opens its live-update connection
- **THEN** the connection is made to `ws://altero.myhut.live/stream`, not to a derived address

#### Scenario: A cleartext streaming host is made permitted

- **GIVEN** the patch applied with a cleartext streaming override
- **WHEN** the patched APK's network security configuration is read
- **THEN** that host is listed as permitted for cleartext traffic

#### Scenario: Account linking opens the server's own approval page

- **GIVEN** the patched app on its sign-in screen, with no account linked yet
- **WHEN** the user starts linking an account
- **THEN** the page opened is the one the self-hosted server returned for this session, not a zotero.org page
- **AND** linking completes with the app holding a key issued by that server

#### Scenario: The server-provided login URL is opened verbatim

- **GIVEN** the server returns a login URL that carries no query string
- **WHEN** the app opens that URL for account approval
- **THEN** the URL is opened exactly as returned, and the approval page loads instead of a not-found page
#### Scenario: Attachment transfer follows the server

- **GIVEN** the patched app synchronises an attachment
- **WHEN** it uploads or downloads the file
- **THEN** the transfer happens against the address the self-hosted server authorised

### Requirement: Patch input contract

Feature: Custom sync endpoint
Rule: The patch accepts one API origin and one optional streaming URL, and refuses anything it cannot honour, before an APK is produced.

The patch MUST accept one HTTPS API origin and one optional streaming URL, and MUST refuse, while patching, any value it cannot honour.

#### Scenario: Bare host is normalised

- **GIVEN** the option set to `zotero.example.org`
- **WHEN** patching runs
- **THEN** the address is treated as `https://zotero.example.org` and patching succeeds

#### Scenario: Trailing slash is accepted

- **GIVEN** the option set to `https://zotero.example.org/`
- **WHEN** patching runs
- **THEN** the trailing slash is removed and patching succeeds

#### Scenario: Non-HTTPS API origin is refused

- **GIVEN** the option set to `http://zotero.example.org`
- **WHEN** patching runs
- **THEN** patching stops with a message that an HTTPS API origin is required
- **AND** no patched APK is produced

#### Scenario: Address carrying a path is refused

- **GIVEN** the option set to `https://zotero.example.org/zotero`
- **WHEN** patching runs
- **THEN** patching stops with a message that the address must be an origin without a path

#### Scenario: Empty address is refused

- **GIVEN** the patch selected but its option left empty
- **WHEN** patching runs
- **THEN** patching stops with a message naming the option

#### Scenario: A cleartext streaming URL is accepted

- **GIVEN** the streaming option set to `ws://altero.myhut.live/stream`
- **WHEN** patching runs
- **THEN** patching succeeds, the app connects to that address, and its host is permitted for cleartext traffic

#### Scenario: The streaming URL may carry a path

- **GIVEN** the streaming option set to `wss://zotero.example.org/stream`
- **WHEN** patching runs
- **THEN** patching succeeds with that exact URL

### Requirement: Application identity preserved

Feature: Custom sync endpoint
Rule: Patching changes endpoint strings only; the application remains the same application.

The patched application MUST keep its original package name, application id and version code, and MUST NOT have any class renamed, removed or repackaged.

#### Scenario: Patched APK keeps the original package name and version code

- **GIVEN** the patched APK produced from the original 1.0.0 (build 247) APK
- **WHEN** its manifest is read
- **THEN** the package name is still `org.zotero.android` and the version code is unchanged

#### Scenario: No application class is renamed

- **GIVEN** the patched APK
- **WHEN** its classes are compared with the original's
- **THEN** no application or library class has been renamed, removed or repackaged
- **AND** only string constants differ

### Requirement: Scope of the rewrite

Feature: Custom sync endpoint
Rule: The patch changes the synchronisation endpoints and nothing else.

The patch MUST change only the two synchronisation endpoints and MUST leave every other host untouched.

#### Scenario: Non-sync zotero.org endpoints are left alone

- **GIVEN** the patched app
- **WHEN** it fetches citation styles, translators or an update check
- **THEN** those requests still go to the zotero.org hosts as before

#### Scenario: Unpatched behaviour is unchanged

- **GIVEN** the original APK with the patch not applied
- **WHEN** the app synchronises
- **THEN** it uses the zotero.org endpoints exactly as the store build does

### Requirement: Protocol-conformant write preconditions

Feature: Custom sync endpoint
Rule: Writes to a strict server carry the precondition the v3 protocol requires.

The patch MUST use the documented `If-Unmodified-Since-Version` name at every site where that header is built, and MUST NOT alter any other request header.

#### Scenario: A deletion carries the precondition header

- **GIVEN** a synced library and a server that enforces the v3 write-protocol precondition
- **WHEN** the client deletes an object
- **THEN** the request carries `If-Unmodified-Since-Version` with the library version the client last saw, and the server accepts the deletion instead of answering `428 Precondition Required`

#### Scenario: A stale precondition is answered with the standard conflict

- **GIVEN** the library has advanced on the server since the client last synced
- **WHEN** the client sends the deletion
- **THEN** the server answers `412` and the client's normal re-sync-and-retry flow takes over

#### Scenario: The precondition header is spelled consistently

- **GIVEN** the patched client
- **WHEN** it deletes an object, and when it reads deletions or settings
- **THEN** each of those requests carries `If-Unmodified-Since-Version` and none carries the misspelled name
