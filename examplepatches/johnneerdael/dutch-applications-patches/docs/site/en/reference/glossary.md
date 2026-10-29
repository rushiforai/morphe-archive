# Words used in this guide

| Term | Meaning |
| --- | --- |
| API | A way for software to communicate with a service to request content or send data. |
| BFF | Backend for Frontend: the point of contact on the server that an app uses to fetch content and coordinate its delivery. |
| CITS | A connected-traffic service that exchanges positions and warnings. The Flitsmeister page describes which exchanges keep working. |
| FCD | A component that collects traffic data. In the inspected Flitsmeister code, it batches GPS data, timing, speed and direction of travel. |
| FCM | Firebase Cloud Messaging, used to deliver push notifications. Analytics about those notifications is a separate function. |
| Native | Built into the app or platform itself, rather than a remotely loaded web page. In technical audits it can also mean compiled machine code. The meaning depends on the context. |
| UDS header | A persistent identifier used for tracking by the publisher and sent with a request. NU.nl's audit distinguishes it from headers needed by the service. |
| Analytics | Measurement and analysis of activity, such as screens opened or videos played. |
| Attribution | Associating an action, installation or purchase with a campaign or source. |
| Audience measurement | Counting or estimating who uses content and how many people do so. The method may combine measurement tags and research panels. |
| Collector | Code or a service that collects measurements. It can run in the app or on a server. |
| Endpoint | A server address that receives requests. An address for loading code or fetching settings has a different role from one that receives events. |
| Consent management platform (CMP) | Software for displaying privacy choices and communicating or recording them. |
| Cookie / local storage | Ways to store values for web content. Values can include identifiers. Storing something does not by itself prove tracking. |
| Event | A record that an action occurred, with optional context and identifiers. |
| Geofence | A defined geographic area. An app can use it to trigger an action when a device enters or leaves the area. |
| Hash | A computed representation of a value. Repeated matching inputs can remain recognisable. |
| Identifier / ID | A label for an account, installation, session or other entity. |
| Pseudonymous | Represented by a label instead of a directly readable identity. The data may still be linkable. |
| SDK | Software Development Kit: reusable software a developer includes in an app. |
| Session | A period in which you use an app or service. The app or service determines which actions belong to one session. |
| Telemetry | Information an app or service reports about use, operation or performance. Check the exact fields and purpose to understand what is being measured. |
| WebView | A browser built into an Android app. It can load remote scripts as well as content. |

See [how tracking works](../learn/how-tracking-works.md) for an example using these terms together. The [tracker profiles](../trackers/index.md) explain what the named services do.
