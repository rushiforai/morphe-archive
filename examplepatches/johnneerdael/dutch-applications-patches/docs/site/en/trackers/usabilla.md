# Usabilla/GetFeedback: when does feedback become automatic measurement?

## What is the service for?

Usabilla, also encountered through GetFeedback documentation, helps organisations collect feedback and show surveys. An SDK, a packaged library inside the app, can open a form when you request it. It can also receive app events and select an automatic survey campaign.

The provider documents **custom variables**: named values attached to feedback or used to target surveys, such as subscription type or a previously visited page. These are supported features, not proof that every inspected app sends those examples. A survey answer and the context attached to it are separate pieces of information. [GetFeedback custom variables](https://help.surveymonkey.com/en/getfeedback/builder/custom-variables/).

## How can a survey tool observe behaviour?

**Hypothetical example:** an app reports “video failed” three times and a survey tool then offers a questionnaire. You have not yet typed an answer, but the trigger already describes app use. If the eventual answer includes an installation ID and subscription status, it gains more context than the words you submit. This explains why a feedback button and automatic event collection need separate treatment.

**Telemetry** is information software sends about its operation or use. It can serve purposes other than advertising. Using it to improve quality does not automatically make it anonymous.

## What did the inspected integrations do?

[Buienradar 7.4.8](../apps/buienradar.md) configures `UbTelemetryRecorder` and calls `Usabilla.sendEvent`; the identified destination is `sdk.out.usbla.net`. **Disable tracking** forces telemetry level zero and stops automatic events. Its manual Settings feedback form remains. [Buienradar investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/BUIENRADAR_TRACKING_AUDIT.md).

In [NU.nl 26.9.0](../apps/nunl.md), the patch also stops Usabilla startup, queued events and the final sending function. Feedback forms or surveys you choose to open may therefore be unavailable.

In [AD 9.22.0](../apps/ad.md), automatic events and custom variables stop, while startup, readiness notifications and responses from the manual feedback form keep working. [NU.nl investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/NUNL_TRACKING_AUDIT.md), [AD investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/AD_PATCH_AUDIT.md).

In [RTL Nieuws 12.7.1 (build 1558)](../apps/rtl-nieuws.md), **Disable tracking** stops automatic feedback events and custom variables about screens, article/video completion and interactions. This stops the inspected automatic sharing of usage context while leaving deliberate feedback submission available. Initialisation and form-close responses keep working. RTL's exact Usabilla upload host was not established; Buienradar's address above must not be assumed to apply to RTL. [RTL Nieuws investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md).

## What does the evidence leave open?

The code shows how the app collects and sends data. It does not include a captured feedback message from your phone. A manual form you choose to submit can still transmit its contents through retained functionality. Neither a domain name nor the presence of a survey SDK establishes retention, resale or every use of an answer.

Evidence reviewed **28 October 2026**. See [tracking mechanisms](../learn/how-tracking-works.md), [identifiers](../learn/identifiers.md) and [methodology](../reference/methodology.md).
