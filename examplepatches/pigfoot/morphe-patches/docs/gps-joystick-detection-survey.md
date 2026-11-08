# GPS JoyStick and game detection — 2026-11-07

## Scope
This is a documentation survey, not a current Pokémon GO binary audit or evidence that a particular detection frequency has been measured. Local Premium, ad-free use and working Maps do not imply undetectability.

## Confirmed documentation
- GPS JoyStick's official Privacy Mode documentation describes a clone with a randomized package identifier/name/icon. This addresses known-package-name matching, not every detection path. Package cloning can also require separate Maps identity/key qualification; preserve package identity in our default patch.
- GPS JoyStick's troubleshooting documentation associates error12 with the mock-location flag. Pokémon GO's official GPS troubleshooting independently says mock-location configuration can cause “failed to detect location”; it does not explicitly identify numeric error12. Keep these sources' claims distinct.
- A GPS JoyStick-only patch cannot remove the target game's checks or change Android system privilege boundaries. Enabling a System Mode toggle does not grant system privileges. Old Indirect Mocking/downgrade advice is not a general modern-Android fix.

## Not established by this survey
Exact current game anti-cheat implementation, use of a particular integrity verdict, package-list scanning implementation and server-side motion/risk signals were not verified. They are separate possible layers, not established causes of the user's current result. No “anti-ban” or “undetectable” claim is justified.

## Repository practice
Keep these as separate capability rows: local Premium/ad-free; configurable Maps metadata; app-name/package privacy (not implemented as a new default here); system/mock-location environment; target-game behavior. Do not bundle them under a generic anti-detection claim. Do not change package IDs merely to improve installer wording. No game-detection bypass is implemented by this survey.

## Sources verified
- https://theappninjas.com/docs/faq/unlock-features/ — official Privacy Mode, system/indirect mocking scope; directly fetched.
- https://theappninjas.com/docs/faq/troubleshooting/ — vendor's mock-location/error12 description; directly fetched.
- https://niantic.helpshift.com/hc/en/6-pokemon-go/faq/2520-gps-troubleshooting-guide/?p=Web — official failed-location/mock-location guidance; directly fetched.
- https://developer.android.com/reference/android/location/Location?hl=en — native HTTP retrieval verified the official description: mock locations can be identified through isMock(). This establishes Android capability, not the exact private implementation of a specific game.
