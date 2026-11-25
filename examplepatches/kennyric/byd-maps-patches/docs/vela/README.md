# Native Vela provider integration

Morphe patches the supplied publisher APK; the Vela source tag is a read-only reference. No rebuilt Vela fork, web view, floating window, alternative location subscription or bundled Compose/car framework is used.

The existing phone settings and speed-widget slot share one local receiver with the native car provider screen and map surface. Current speed sits beside the limit sign; an active zone adds Ø average, a matching-width progress track and compact percentage/distance. No provider label, zone heading, divider or enclosing background is drawn on the map. Native units, map palette and speed preference remain effective. Browse-mode content clears Vela’s scale and attribution.

Native speeding logic uses the same selected fresh scalar inputs. Advance warnings use provider pre-entry distance or fresh report coordinates, projecting onto Vela’s active route when available and using a heading check otherwise. Speech follows the original voice/mute/Alerts-only behavior. Unknown speed remains distinct from measured zero.

Fresh usable data from either supported provider temporarily masks native Flock map, route, detour, card and voice consumers when an external provider is selected. Saved settings are untouched. An in-flight startup refresh and an already-issued card/utterance may finish. Expiry is applied by the one-second publication tick.

[Validation record](validation.json) lists exact input identity, checks and acceptance limits. [Phone capture](screenshots/phone.png) and [car/media capture](screenshots/car-media.png) show real native rendering with public Davis test fixtures; they are not driving measurements. Producer and read-only consumer instrumentation is in `scripts/vela/probes/`.

The sustained Vela display/average tests use actual Flitsmeister callbacks. Waze’s actual callbacks independently verify new approach/report export and clearing; a live engine empty update can supersede the injected insight, so the strict sustained fixture is not recorded as a passing route/average test. Physical cars and Google’s host remain unverified.
