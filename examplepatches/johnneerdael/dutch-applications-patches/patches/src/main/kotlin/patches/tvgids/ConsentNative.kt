package patches.tvgids

import app.morphe.patcher.patch.resourcePatch

internal val consentNative = resourcePatch {
    dependsOn(originalInput, trackingNative)
    execute { applyNativePolicy(NativePolicy.CONSENT) }
}

// The checkConsent closure has already created its real frame and async state.
// Redirect its parent-context load through a captured forceCmp gate: automatic
// calls use the original typed return tail before any CMP URL request; manual
// calls restore that load and continue at the next original instruction.
//
// The trampoline occupies the original valid-consent, forceCmp=false branch.
// Its sole original ingress is that later false decision. It is unreachable
// after the early gate: false returns early and true follows the manual branch.
// Both regions must compose together, after the hard tracking policy. Neither
// consent storage nor any manual CMP/native helper is replaced.
internal val nativeConsentEdits = mapOf(
    "arm64-v8a" to listOf(
        NativeEdit(NativeRange("checkConsentClosure", 0x7c5280, 0x41c,
            "0cd3e68329f0e5e06097be5732a1120806213f838d08bbacb1d8b20729c9ca3a"), 0x7c52e8,
            nativeBytes("a00357f8"), nativeBytes("7b000014")),
        NativeEdit(NativeRange("checkConsentClosure", 0x7c5280, 0x41c,
            "0cd3e68329f0e5e06097be5732a1120806213f838d08bbacb1d8b20729c9ca3a"), 0x7c54d4,
            nativeBytes("a48355f865f040b8a5801c8ba50315f8"),
            nativeBytes("a00357f8017041b8810d203783ffff17")),
    ),
    "x86_64" to listOf(
        NativeEdit(NativeRange("checkConsentClosure", 0x70900c, 0x538,
            "caa658b4fa54966ed4605b5be5948ef00d64747da09a1ec491c42f49c636a5bf"), 0x709088,
            nativeBytes("488b8570ffffff"), nativeBytes("e9790200009090")),
        NativeEdit(NativeRange("checkConsentClosure", 0x70900c, 0x538,
            "caa658b4fa54966ed4605b5be5948ef00d64747da09a1ec491c42f49c636a5bf"), 0x709306,
            nativeBytes("488b9558ffffff8b580f49035e5848899d50ffffff8b4aff"),
            nativeBytes("488b8570fffffff64017100f8515020000e973fdffff9090")),
    ),
    "armeabi-v7a" to listOf(
        NativeEdit(NativeRange("checkConsentClosure", 0x7def00, 0x400,
            "bae7bfb0a7270ca7fe5e116da0ef0760bd94d72bf31574c0d0a4e960dcb245eb"), 0x7def68,
            nativeBytes("48001be5"), nativeBytes("7a0000ea")),
        NativeEdit(NativeRange("checkConsentClosure", 0x7def00, 0x400,
            "bae7bfb0a7270ca7fe5e116da0ef0760bd94d72bf31574c0d0a4e960dcb245eb"), 0x7df158,
            nativeBytes("54601be50b8094e558800be5010016e55006f3e70610a0e1"),
            nativeBytes("48001be5131090e548c09ae50c0051e16200001a7effffea")),
    ),
)
