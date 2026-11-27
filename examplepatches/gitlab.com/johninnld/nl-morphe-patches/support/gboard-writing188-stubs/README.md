# Gboard 18.8 compile-only native contracts

These are product compilation inputs for the typed writing-handler adapter, never runtime implementations or test fixtures. None may be packaged in the extension. Exact original APK/DEX descriptors and method fingerprints are in patches/src/main/resources/gboard/shared-writing-18.8-contract.json. Validate both ABIs before emitting a patch. The APK's own classes satisfy these references at runtime.

Use original DEX member names. JADX restores enum labels that differ from the actual static field names; the adapter reads native enum names/values rather than inventing those fields.
