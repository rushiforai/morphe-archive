# Contacts: merged detail fields

Target: original official Fossify Contacts 1.6.0, contacts-13-foss-release.apk. SHA-256 6a89be96b5ec39f5e2b11bd61dc7031f4b88261b324ab13af5743fbc62f0cddb. Release https://github.com/FossifyOrg/Contacts/releases/tag/1.6.0 . Issue https://github.com/FossifyOrg/Contacts/issues/327 .

Patch copies emails into a LinkedHashSet and joins distinct nonempty notes with blank lines only while the existing Merge duplicate contacts setting is enabled. It hooks only email/note reads in ViewContactActivity, retaining original labels, visibility, mail action and source editing. Contact/provider records and the representative model are never merged or rewritten. Exact-equal email model entries deduplicate; different labels/types remain distinct. Conflicting notes remain separate paragraphs. Organization and shared/export full-contact data are outside this patch.

Original versus patched official APK: same synthetic pair, first source has phone/name, second also email/note. Before fields hidden; after both visible. Same-key update retains provider rows. 13 native model/render assertions cover copies, exact duplicates, note deduplication, merge toggles and source immutability. Separate upstream source build/Lint/Detekt and rendering Android test pass, using its own disposable provider fixture.

Attribution: issue #327 and jeremiepose's detailed raw-contact/display diagnosis informed this focused display implementation. Physical WhatsApp/Telegram sync and account deletion/sync behavior remain unverified; no account sync is changed. Exact official bytecode binding fails on unsupported layouts.

## Before / after

| Before | After |
| --- | --- |
| <img src="https://github.com/pengusto/penguin-patches/blob/pr-assets/contact-music/contacts/before.png?raw=true" width="320" alt="Original app" /> | <img src="https://github.com/pengusto/penguin-patches/blob/pr-assets/contact-music/contacts/after.png?raw=true" width="320" alt="Patched official app" /> |

Images: same emulator and native 1080 x 1920 viewport, synthetic content only. Source candidate is separately tested, not the source of these images. Input must be the official original APK; same-certificate patched installation can update in place. Different signing identities need a verified data-preserving migration plan.
