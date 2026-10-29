# NRC newspaper navigation

The user requested removal of the unavailable Krant entry instead of exposing a guest feature whose backend returns no newspaper assets. Add a separate default-enabled `Hide newspaper tab` control, preserving the existing five names and NRC 5.12.24/626 compatibility. It depends only on strict original input validation.

Remove exactly READER from the ordered root model and `menu_reader` from the actual bottom menu, keeping all other item identities/order and original click/reselect/toolbar/media callbacks. Initialize on NEWS. Normalize programmatic READER destinations (including saved start preference, auto-download intent and explicit reader intent) to NEWS. Preserve manual account/login, purchases, entitlement state and all transports.

The old five-stack FragNav saved state cannot be reinterpreted as four stacks. Preserve the Activity's original Bundle for super/lifecycle; only pass null to the original controller initialize for unmarked legacy navigation state. Its shipped cleanup removes restored old fragments before building NEWS. Mark the new controller schema on original onSave; later four-tab state restores normally, including podcasts/puzzles/more and their stacks. The patch does not modify the FragNav library or create placeholder screens.

Validation uses actual decoded original/emitted factories and navigation methods with Android boundary doubles, plus independent original method/control-flow hashes and invoke kinds. Show RED on original five-tab factories before implementation; root owns FULL/sign/redecode matrix. No device changes.
