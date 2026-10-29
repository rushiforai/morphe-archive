# Read beyond this project

To find out what a service does, start with an independent profile. Technical documentation explains its fields and settings. Our app audits describe how the service is built into the apps we inspected.

| Source | Useful for | Keep in mind |
| --- | --- | --- |
| [Exodus Privacy](https://reports.exodus-privacy.eu.org/en/trackers/) | Android SDK profiles, categories, signatures and app reports. | An SDK found in code may be inactive. Coverage is incomplete. |
| [Ghostery WhoTracks.Me](https://www.ghostery.com/whotracksme) | Web services, company relationships, categories and prevalence. | Web observations do not establish which data a particular Android app sends. |
| [DuckDuckGo Tracker Radar](https://github.com/duckduckgo/tracker-radar) | Domain ownership, classification and cookie/fingerprinting metadata. | This technical dataset does not give a complete picture of a company's practices. |
| [Privacy International's app investigation](https://www.privacyinternational.org/appdata) | How investigators inspect data that was actually sent and explain the implications. | This investigation dates to 2018; its findings concern its tested sample. |
| [Cracked Labs: Corporate Surveillance in Everyday Life](https://crackedlabs.org/en/corporate-surveillance) | How data collection, identifier matching, profiling and data trading connect. | Published in 2017. Check newer sources for current ownership and products. |
| [TrackerControl](https://trackercontrol.org/) | Exploring app connections and recognised tracking companies on Android. | It does not decrypt TLS data. You can see the destination, but not every field that was sent. |

## How to read vendor documentation

An API field list can reveal far more than marketing copy. Look for automatically collected fields, persistent identifiers, optional user attributes, upload queues, opt-outs and links to other systems. An available feature may not be enabled in the app. Read [our evidence labels](methodology.md).

The profiles link directly to the relevant technical pages. The sources were reviewed on 28 October 2026. Both language versions explain English-language sources. A Dutch explanation does not mean the external source is available in Dutch.
