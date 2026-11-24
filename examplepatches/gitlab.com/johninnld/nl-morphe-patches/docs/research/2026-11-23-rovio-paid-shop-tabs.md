# Selective paid shop tabs

Owner screenshots identify only Angry Birds 2 Shop and Friends Bird Coins. Based on owner-accepted phone review 85e48f13b6a4. The separate native telemetry experiment c85c7d3f is excluded.

The patch hides only the corresponding tab button and remaps requested tab zero to tab one. Angry Birds 2 keeps Bonus/Loyalty and Daily Deals; Friends keeps Power-ups, Slingshots and other nonzero tab routes. Angry Birds 2 covers the full-screen and popup tab-button variants plus the central click, switch and visible-tab entries. Friends covers the paid button's OnEnable and the central ChangeTab entry. Requests for another existing tab retain their value. No balance, item, entitlement or purchase-result change is made.

All target methods were resolved from version-39 Unity metadata and native module pointers, with unique addresses within their modules. Unity Component.get_gameObject and GameObject.SetActive were resolved independently. Native stubs preserve live arguments, the caller stack and each displaced prologue before continuing the original method. The original native library SHA-256 and target preimages are required.

A 16 KiB aligned file insertion after the executable load adds the app-specific stubs in the existing virtual gap. Existing virtual addresses remain unchanged; later program/section file offsets and the section-header location move by 16 KiB. The executable load grows only by the small payload, ending before the next writable load's page. Streaming and atomic file replacement avoid full-library copies and partial source modification on a guard failure.

Complete repository verification passed. Regression checks cover ELF table/segment preservation and refusal without mutation on a changed entry. The production writer was also executed against both exact original ARM64 libraries; llvm-readelf accepted both outputs without warnings, and non-executable loaded data retained its virtual address, sizes and complete bytes. These checks do not prove rendered behavior. Owner validation through normal Morphe installation must confirm both hidden paid tabs, the remaining tabs, repeated openings, and startup/consent behavior before release of the four-game batch.

Bounded mappings, assembly/disassembly, exact preimages and verification receipts are retained in the ignored `.tools/artifacts/rovio-paid-shop-tabs-20261123/` directory. All native-analysis scratch libraries and assembler scratch directories were removed.
