# Tasks.org #2838: navigate to a parent task

Morphe patch included in [v1.0.0-dev.7](https://github.com/pengusto/penguin-patches/releases/tag/v1.0.0-dev.7): **Navigate to the parent task**.
Tasks.org is an established open-source Android task and reminder app.
Only package `org.tasks`, version **15.13**, version code **151306**, from
the project's official **F-Droid APK release asset** is tested. This means the
APK hosted by the project on GitHub, not a separately signed fdroid.org build.

## Current upstream state

Checked on 2026-10-24: [issue #2838](https://github.com/tasks/tasks/issues/2838)
is open with **13 thumbs-up reactions** and eight comments at the initial check. It requests a way
to reach a subtask's parent, especially when the child appears alone in a date
or search filter. Comments favor an explicit up action that preserves Back.
The maintainer explained that the Android editor keeps one task in memory;
a navigation stack was a future migration goal. Targeted searches found no
Android PR implementing #2838.

The latest stable release is [15.13](https://github.com/tasks/tasks/releases/tag/15.13),
source commit `615094ce41e8aa7fc358113020878e432cc3b95f`.
Android still lacks a parent action in main at
`478c8e9a0198515ab5f727f983c33c412540fa56`.
Open [PR #4785](https://github.com/tasks/tasks/pull/4785) adds parent-chain
breadcrumbs to the **desktop** editor, explicitly without Android changes.
Its head was `a48a047208da1af9ad747b910f7965a1c0d19de2` at this check.
The dated observation supports useful local Android work; reread the issue,
PR and releases before any future public proposal. Under subsequent explicit
user authorization, one [comment with matched screenshots and repository link](https://github.com/tasks/tasks/issues/2838#issuecomment-6378141958)
was posted, asking for greenlight for a focused native Android PR. No native
PR has been opened.

## Behavior

An up-arrow in the existing task editor opens the persisted task's immediate
parent. It uses the native icon/button and provides an English/German
accessibility description. Other locales fall back to English for added text.
Existing Back, Save and Delete actions retain their native behavior.

- Unchanged task: open the parent without writing the task.
- Changed draft: **Save**, **Discard** or **Cancel**. Save runs the app's
  existing non-cancellable save transaction and requires its successful result.
  Discard suppresses the native auto-save on editor disposal. Cancel keeps the draft.
- The current search/date/list filter remains selected. The parent may be
  outside that filter; Back returns to the same list.
- Missing/deleted parent or deleted child: report unavailability and keep the
  editor open. Recheck after the confirmation dialog, before save/discard.
- Root/new/self-parent tasks have no arrow. Read-only children can navigate.
  Completed parents can open. Navigation is one hop per tap, with no automatic
  ancestor traversal; corrupt longer cycles therefore do not recurse.

The extension has no database migration, direct SQL write or new preference.
User-requested saves remain native Tasks.org saves, including native sync and
metadata behavior. It does not introduce a Back stack or breadcrumbs.

## Provenance and implementation

Official original APK:
[tasks-fdroid-15.13.apk](https://github.com/tasks/tasks/releases/download/15.13/tasks-fdroid-15.13.apk)

- SHA-256: `7df9620d84a824a834598843f954943009012d75fbb16572e5ec88a414a576b9`
- Official signer SHA-256: `5efd4ed0baccbfd3c117987ebeac34cf601d0831ec4bb3e597467742130569fd`
- Alex Baker and Tasks.org contributors, GPL-3.0. See NOTICE and source attribution.

The patch checks eight canonical shipped-DEX class hashes, retaining fields,
signatures, code, annotations and handlers while normalizing only debug items.
It binds TaskEditFragment lifecycle, the native Compose top-bar action group,
TaskEditViewModel/TaskDao and MainActivityViewModel's existing task selection.
R8 removed/inlined several source APIs; bindings use the **actual APK**, including
its retained save transaction and Compose/coroutine implementations.

`tasks.mpe` contains 12 extension-only classes. Kotlin/coroutines are compile-only;
no Compose compiler/runtime, Kotlin library or app stubs are bundled. All 136
extension method/field references resolve against the patched original APK.
The common, Kvaesitso, Clock and Calendar reminder MPEs remain byte-identical to
the prior Calendar-local bundle. Modified/unsupported bytecode and reapplying
the patch are rejected. The Google Play and fdroid.org variants are untested;
matching a version string alone does not make them supported.

Build uses Java 21, official Morphe Gradle plugin 1.3.4 at
`a230c33f7eca1e18b07bf1114ca850421520f98d`, Desktop 1.18.1 / Patcher 1.15.1
and the existing Android SDK. REA's optional Android JADX provider was not
configured; existing Morphe/smali inspection and native Android instrumentation
were used. No installation or configuration of that provider was performed.

Release bundle: `patches-1.0.0-dev.7.mpp`, from [v1.0.0-dev.7](https://github.com/pengusto/penguin-patches/releases/tag/v1.0.0-dev.7), with **12 patches for nine apps**. The tested prototype Tasks MPE SHA-256 is `772b109c825f61319b07db03c79aa5d14e0e26b56c858f1fba583c9ff9486449`.

## Verification and limits

See [repeatable tests](../tests/tasks/README.md). The tests use only synthetic
offline tasks and the existing rooted AOSP Android 15/API 35 ARM64 emulator.
Both original and patched payloads use the same disposable test certificate;
the original payload is verified unchanged before testing. No uninstall or
app-data clearing is used. Every database row, preference and datastore file
survives the same-key APK update unchanged.

Acceptance covers real Compose clicks, hierarchical/sibling navigation, root,
read-only/completed tasks, save/discard/cancel, exact notes/hierarchy/date
retention on title save, other-task row preservation, missing/deleted parents,
cyclic metadata, a destination deleted while the dialog is open, search/Today
filters, changed drafts across activity recreation, dialog dismissal and native
Back. Raw before/after/parent/dialog screenshots stay under ignored local artifacts.
Negative cases cover wrong package/version, already patched APK and a valid
modified-DEX fixture. Build, lint, bundle isolation and actual-APK linkage pass.

Final run on 2026-10-24: **22 original-baseline assertions**, **178 patched
native integration assertions** and **4 negative-input cases** pass. Extension
lint reports no issues. The exact Android MPP, its generated metadata and
Desktop's inventory are checked together; the combined release lists 12 patches / nine apps.

Physical/OEM devices, alternate APK distributions/versions, real CalDAV/Google
sync and concurrent remote edits are unverified. Activity recreation was tested;
process-death draft recovery remains the app's native behavior and is not
claimed as an added capability.

Under explicit user authorization, four reviewed raw screenshots and curated
provenance/checksums were published on `pr-assets` in evidence-only commit
[`f837da0`](https://github.com/pengusto/penguin-patches/tree/f837da057badfccef1ea7b34d4db039e67c16239/tasks-2838/2026-10-24/)
and linked from the issue comment. The images show the original official APK
payload and the local Morphe-patched APK; a native source implementation is a
separate proposed follow-up. The patch source and bundle are now released. APKs, keys, databases and full logs remain private. Await maintainer greenlight before a native PR.
