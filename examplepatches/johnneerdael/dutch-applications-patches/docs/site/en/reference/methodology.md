# What our evidence establishes

Our findings apply to the app version and parts inspected, and to the checks performed. The app investigations use main commit `6102fa9`, released as v1.8.0. The evidence was reviewed on 28 October 2026. The Dumpert investigation uses main `8ca0ddb` (v1.9.0). Each app investigation keeps its original source references. Later app or patch versions need a new review.

## Five kinds of evidence

| Label | What it establishes | What it leaves open |
| --- | --- | --- |
| Documented capability | A provider documents a feature or data field. | Whether this app enables or uses it. |
| Traced in app code | The inspected code creates events, passes values or calls a sender. | Whether a phone ran that part of the code during a particular session. |
| Configured / shipped endpoint | A resource or SDK specifies or selects a destination. | Whether a request occurred and what the server retained. |
| Web policy coverage | The patch blocks an identified request if the web content makes it. | Whether every listed domain was present in a session. |
| Runtime observation | A recorded action, log or inspected request shows specific behaviour. | What happens with other actions, devices, accounts or later settings, and how the server uses the data. |

An embedded SDK may be inactive. Exodus makes the same distinction in its [methodology FAQ](https://exodus-privacy.eu.org/en/page/faq/). A DNS connection record shows which name was contacted. It does not reveal every field in the encrypted data.

## How the patches are checked

The project tests individual patch options and combinations. It builds and signs the modified files and decodes the output for an independent check. It checks both the changed behaviour and what must keep working. Device reports add information about startup and features. These checks cover code changes, installation and, for example, opening articles. They do not amount to an audit of captured network traffic.

The [destination evidence register](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_DESTINATIONS.md) records where the evidence comes from and what remains unknown. The app pages link their detailed audits. This documentation review did not include new packet captures or device tests.

## Claims we keep separate

A hostname alone does not tell us whether data is sold or shared further, how long it is kept, whether its use follows the law or who a person is. A field that *can* connect events shows that linking is possible. Establishing whether someone then builds a profile requires separate evidence. If a sender is blocked, other services in the app may still collect data.

## When something changes

Recheck the original app version, patch bundle version, inspected parts and services that keep running. Keep the old source references available. Make clear when new evidence comes from captured traffic, separately from earlier findings in code. Corrections are welcome through [GitHub issues](https://github.com/johnneerdael/dutch-applications-patches/issues).
