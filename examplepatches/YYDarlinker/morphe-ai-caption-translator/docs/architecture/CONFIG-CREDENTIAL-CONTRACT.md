# Configuration, credentials and editing

Implementation: `ApiProfiles`, `DeepSeekConfig` / `ConfigRead`, `SecureApiKey`, `ProfileEditorPreference`, `DeepSeekTextPreference` and `CaptionApplication`. These contracts describe current source, not an earlier stage's acceptance status.

## Storage and identity

| Owner/store | Content and constraint |
| --- | --- |
| caption_api_profiles | names, active, legacy_deleted; non-default profile IDs are UUIDs. Names are not credential identities |
| deepseek_caption_translator / caption_profile_ID | Default/profile endpoint, model and optional prompt. Global enabled/style values share the default store. Profile creation does not copy another profile's key |
| deepseek_caption_secret | api_key_ciphertext[_ID] and matching origin. Clearing a profile key removes only its two values |
| AndroidKeyStore | Alias yydarlinker.deepseek.caption.api.key.v1; AES/GCM/NoPadding, encoded IV length + IV + ciphertext/tag. Unreadable data is not silently overwritten |

Origin is lowercased scheme + rawAuthority, including port and excluding path/query. Do not normalize distinct origins casually. Editing a legitimate legacy endpoint can bind an originless key only to the verified old endpoint; an unreadable old endpoint cannot be guessed.

`ApiProfiles.LOCK` protects normal settings/credential snapshots, not a cross-store transaction or physical persistence. Diagnostic credential capture does not wait for that lock or decrypt a key and is not request authority. Strict request settings validate fields and resolve the key once within one snapshot; UI provider settings do not contain plaintext. There is no global plaintext key cache.

## Reads and recovery

Reads do not write back. Missing legacy values can use their defined defaults; present values of the wrong type are unreadable, not missing. Bad index/active/endpoint/model/prompt/secret/enabled data yields an explicit unreadable/unready configuration without credentials for a new request. Refresh retires the old runtime scope.

Valid indices can offer explicit selection of a valid profile. URL/model/key editors can correct their own fields; initialization, rebuilding a row or empty debounce must not replace the original. The persisted prompt is a supported configuration input but currently has no reachable product editor. A corrupted index or hidden prompt requires an existing valid app-data backup or an explicitly selected other valid profile; there is no automatic import/rebuild tool.

Encrypted values/origins survive read failure. Missing hardware alias/GCM failure is not a reason to create a new master or discard the old bytes. An unknowable legacy origin cannot be automatically attached to a new host. Explicit clear-key confirmation is a user decision, not background recovery.

## Partial saves, drafts and notification

Fields auto-save individually. A successful earlier field remains saved when a later field fails; do not pretend the entire form is transactional. Flush notifies once for actual changes, including observable changes before an after-apply exception; a total rejection/no change does not notify. Notification failure and saving failure are distinct and can offer retry without rewriting already saved data.

Editor/profile/revision ownership rejects late callbacks from a previous binding. Rebuilding the same row or detaching preserves failed drafts/errors; a genuine profile switch/deletion revokes the old editor. Process death is not a persistent-draft recovery feature.

Selecting/deleting/clearing may partly change SharedPreferences memory before a listener throws. When active identity/key has observably changed, runtime invalidation still occurs and UI reports uncertainty. Profile creation can leave orphan values when the index write fails. There is no automatic orphan scanner or compensating multi-store rollback.

`SharedPreferences.apply` returns no durable-success boolean. Tests with real listeners cover observable memory changes; injected dropped writes, Robolectric storage and an in-memory Keystore provider do not certify disk-full behavior, process death, hardware recovery or power-loss durability.

## Regression entry points

`ConfigCredentialFailureTest`, `M5gApplicationConfigurationTest`, `M5hConfigRecoveryTest`, `M5hPreferenceCallbackTest`, `M5hEditorProtectionTest` and `M6aHotPathMechanismTest` exercise real readers/editors/crypto/controller invalidation with controlled platform boundaries. Retain these protections; new formats, transaction/migration frameworks or persistent drafts require a concrete product need.
