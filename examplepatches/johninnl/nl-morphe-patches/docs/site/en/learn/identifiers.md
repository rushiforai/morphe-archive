# How services recognise an app installation

A service can link activity without knowing a person's name. The same identifier on two records can connect them to one visit, installation or account.

| Identifier | What it can connect |
| --- | --- |
| Session ID | Activity during one visit. |
| Installation ID | Use of an installed app over time. |
| Account ID | Activity belonging to an account, possibly across devices. |
| Advertising ID | Activity associated with the platform's advertising code. |
| Publisher ID | Activity associated with a publisher's own code. |
| Push token | Delivery of notifications to an installation. |

Removing an advertising ID does not remove account IDs or the identifiers needed for notifications. A random-looking value can still make repeated activity recognisable.

The [app pages](../apps/index.md) describe which optional tracking the patches reduce. Services that remain available can still use identifiers. See [Snowplow's identifier guide](https://docs.snowplow.io/docs/events/identifiers/) for background.
