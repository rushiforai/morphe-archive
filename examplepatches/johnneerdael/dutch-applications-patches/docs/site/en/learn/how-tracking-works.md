# From a tap to a record about your activity

An app can send two requests after one action. To open an article, the app requests its text. A separate request can report that you opened it. Only the first request is needed to deliver the text.

## Follow an example

Imagine opening the radar for Utrecht in a weather app. A record could look like this. This example does not come from captured traffic:

```text
Action: open the radar
Event: radar_opened
Context: selected place = Utrecht, time = 08:15
Identifier: installation = example-7f3
```

The event says what happened, and the context gives more detail. The identifier lets a service link this record to another one. A series of records could show how often the same app installation returns and which places it checks. Whether a service performs that analysis depends on its settings and use.

## How the record leaves the phone

The developer can write code to send the data or include an SDK: a reusable software component from another organisation. An SDK can track screen changes or receive events from the app. Some SDKs store events in a queue on the phone and send several together later. One network request therefore need not mean one action.

```text
Your action → app or SDK → local queue → collector → storage and analysis
```

[Snowplow's architecture](https://docs.snowplow.io/docs/fundamentals/) documents one implementation of collection and processing. [Contentsquare's data collection reference](https://docs.contentsquare.com/en/csq-sdk-android/experience-analytics/data-collection/) shows screen and interaction events sent in batches. These documents explain what the products can do. The exact settings can differ between apps in this project.

## Who receives it?

The data can go to the publisher, a service provider or infrastructure used by either. A publisher hostname can run tracking software. A third-party hostname can deliver a map or privacy settings. Check who sends the request, which fields it contains and what it is for. The name alone cannot tell you that.

## What a patch can change

A patch can stop a component that collects data from starting. It can also stop the app from creating events or uploading queued data, omit identifiers or block a specific web request. If an element disappears from the screen, you still do not know whether those parts stopped. [Read how we check](../reference/methodology.md), then explore [your app](../apps/index.md).
