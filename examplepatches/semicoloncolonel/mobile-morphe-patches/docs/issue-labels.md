# Issue labels

Every issue carries labels that say what it is, where it stands, and how it
ended. The labels are grouped into four namespaces, each with its own prefix
and color, so an issue can be read at a glance. This page lists every label and
the lifecycle an issue follows from open to resolved.

Most labels are applied for you. The issue forms set the type when you open an
issue, and the automation sets most status and resolution labels as the issue
moves along. You do not need to add any label yourself.

## type: what the issue is

One of these is set by the form you choose when you open an issue. It is shown
in blue, except for a bug, which is red, and an app update, which is yellow.

| Label | Meaning |
| --- | --- |
| `type: bug` | A patch fails, or a patched app does not work as described. |
| `type: enhancement` | A request to improve a working patch. |
| `type: request` | A new app, a new patch, or another app version. |
| `type: question` | A question or an idea. |
| `type: app update` | The daily update check found a newer app version. These issues are opened and kept up to date by the automation. |

## status: where an open issue stands

These are shown in amber. An open issue usually has one. Several are set by the
automation that triages reports and tracks app updates.

| Label | Meaning |
| --- | --- |
| `status: needs info` | Required details are missing. The issue closes after 7 days without an update. |
| `status: untargeted version` | The reported version or build is not one the patches support. The issue closes after 7 days without an update. |
| `status: version not accepted` | Morphe Manager does not accept the app version or build. |
| `status: waiting for reporter` | Waiting for an answer from the person who opened the issue. |
| `status: confirmed` | Reproduced, and the patches cause it. |
| `status: planned` | Accepted, and planned for a future release. |
| `status: in development` | Being worked on now. |
| `status: needs review` | A new app version needs a manual check or a patch change. |
| `status: ready to bump` | Every patch applies to a new app version. |
| `status: testing on dev` | The change is in a dev pre-release, awaiting confirmation on a device. |
| `status: dev pre-release` | Reported against a dev pre-release of the patches. |
| `status: may reopen` | Closed for now, and reopened if new details arrive within 7 days. |

## resolution: how it ended

One of these is set when the issue closes. A released issue is shown in green.
An issue that closed without a change is shown in grey.

| Label | Meaning |
| --- | --- |
| `resolution: released` | Fixed or added in a main release. |
| `resolution: not patchable` | The app blocks patched copies, for example with Play Integrity or App Check. |
| `resolution: out of scope` | Outside what the project does, such as paid content or posts not about these patches. |
| `resolution: upstream` | Caused by the app, Morphe Manager, or another tool, not by the patches. |
| `resolution: duplicate` | Another issue already covers this. |
| `resolution: cannot reproduce` | The problem could not be reproduced. |
| `resolution: wontfix` | This will not be changed. |

## Other labels

| Label | Meaning |
| --- | --- |
| `experimental` | A target that is in the dev pre-releases only, and that has not been checked on a device yet. |
| `documentation` | The README, the docs, or the issue forms. |

Pull requests also carry `dependencies`, `github_actions`, `javascript`, and
`java`, which Dependabot and the labeler apply automatically.

## The lifecycle, from open to resolved

1. **Open.** You choose a form, and it sets the type: `type: bug`,
   `type: enhancement`, `type: request`, `type: question`, or
   `status: version not accepted` for a version or build report.
2. **Triage.** The automation checks the report. If it is missing required
   details, it gets `status: needs info`. If it names a version or build the
   patches do not support, it gets `status: untargeted version`. Either of
   these closes after 7 days without an update, and fixing the report removes
   the label. A report against a dev pre-release gets `status: dev pre-release`.
3. **In progress.** A reproduced bug caused by the patches gets
   `status: confirmed`. Accepted work moves through `status: planned` and
   `status: in development`. An app update issue moves from
   `status: needs review` to `status: ready to bump`, then
   `status: testing on dev` once it ships in a dev pre-release.
4. **Resolved.** When the issue closes, it gets a resolution. Work that shipped
   gets `resolution: released`. An issue that closed without a change gets
   `resolution: not patchable`, `resolution: out of scope`,
   `resolution: upstream`, `resolution: duplicate`,
   `resolution: cannot reproduce`, or `resolution: wontfix`. A close that can
   still reopen is marked `status: may reopen` until 7 quiet days pass.
