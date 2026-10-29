# Contentsquare and Heap: what can interaction measurement record?

## Are these tools just page counters?

Contentsquare's experience analytics and Heap's product analytics measure how people use an app. Alongside totals, they can record which screens someone views and which actions they take. Current Contentsquare documentation distinguishes ordinary analytics from Session Replay and describes batches of events with device and session information. Those current features do not prove that an older SDK in an inspected app records a full visual replay. [Contentsquare data collection](https://docs.contentsquare.com/en/csq-sdk-android/experience-analytics/data-collection/).

Heap's Android documentation describes **autocapture**: collecting supported interactions automatically after recording and the required connections have been set up. Apps can also send custom events and identity information explicitly. What gets collected automatically depends on the setup and components; it does not mean every text field or screen is captured in every app. [Heap Android guide](https://developers.heap.io/docs/android).

## How can individual taps become a behavioural picture?

**Hypothetical example:** a screen-view event is followed by two taps on an unresponsive button and a return to the previous screen. Joined by a session identifier, those records can show where someone struggled. Across visits, a persistent identity may connect repeated behaviour. The measurement system defines a **session** as a period of use. This need not coincide with an account login.

This example explains the purpose and possible sensitivity of interaction data. It does not claim that our inspected news apps recorded screenshots, passwords or a full visual replay. Those stronger claims require separate evidence.

## What did we find in the news apps?

The investigation of [de Volkskrant 7.53.1](../apps/volkskrant.md) follows how Contentsquare starts, records events and screens, queues events, is enabled through consent, sets identity and connects to web pages. The investigation examines Heap separately: its startup providers, recording, saved events, identity and properties, uploads and web connections. A **WebView** displays a web page inside the app. A connection between the page and the app can pass web activity to the app's built-in measurement code. [Volkskrant investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/VOLKSKRANT_TRACKING_AUDIT.md).

[Trouw](../apps/trouw.md) and [Parool](../apps/parool.md), both 7.53.1, have independently checked related paths. The web filters can block domains including `contentsquare.net`, `contentsquare.com`, `heapanalytics.com` and `heap.io` if the app loads them. A filter entry does not prove that an upload was observed. [Trouw investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/trouw-audit.md), [Parool investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/parool-audit.md).

## What changes after patching?

The patches stop the inspected paths for startup, recording, events, identity, uploads and connections to web pages. The app still receives the readiness messages it needs to finish starting. Web cookie and update functions also remain where they need to send a response back to the app. This lets the app keep working while the identified measurement routes are interrupted.

Evidence reviewed **28 October 2026**. There is no network recording showing that web pages the app embeds later will be free of tracking. Read [tracking mechanisms](../learn/how-tracking-works.md), [identifiers](../learn/identifiers.md) and [methodology](../reference/methodology.md).
