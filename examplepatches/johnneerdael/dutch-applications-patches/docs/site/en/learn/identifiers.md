# How an app recognises a returning installation

A service does not need your name to link two actions. If both carry the same persistent code, it can recognise that they came from the same app installation or account.

## Different codes answer different questions

| Identifier | What it can connect |
| --- | --- |
| Session ID | Actions during one visit or period of use. |
| Installation ID | Activity from one installed app over time. |
| Account/user ID | Activity from the account, possibly on several devices. |
| Advertising ID | An advertising code supplied by the platform and subject to its controls. |
| Publisher-provided ID (PPID) | A label supplied by the publisher. What it can link depends on how the publisher creates and shares it. |
| Push token | An address for delivering notifications to an app installation. It is also information the service can use to recognise an installation. |

The codes each have their own role. Removing the advertising ID leaves the app's own account and installation IDs in place. [Snowplow's identifier documentation](https://docs.snowplow.io/docs/events/identifiers/) illustrates several kinds and their different lifetimes.

## A finding from these apps

The inspected Buienalarm code adds a PPID shared across apps to a request for targeted ads. The request also includes the selected city, country and ad context. Buienradar's audience-measurement plugin copies its Snowplow user ID into the Kantar field `cs_fpid`. These connections were traced in the code. See [Buienalarm](../apps/buienalarm.md) and [Kantar/NMO](../trackers/kantar-nmo.md).

## Does “anonymous” mean unrecognisable?

A code can look random and contain no name, yet stay the same long enough to link your activity. A hash can also leave repeated values recognisable. If a provider says data is anonymous, ask which identifiers remain, how long they last, whether accounts can be linked and what extra information is included. [Cracked Labs explains linking and matching](https://crackedlabs.org/en/corporate-surveillance#linking).

Our patches suppress the specific identifier paths listed in each app audit. Login, push and playback services that keep running can still use their own identifiers. We have not shown that every remaining request is free of data that can still be linked.
