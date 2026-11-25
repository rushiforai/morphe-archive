package patches.tvgids

import app.morphe.patcher.patch.resourcePatch

internal val trackingNative = resourcePatch {
    dependsOn(originalInput, adNative)
    execute { applyNativePolicy(NativePolicy.TRACKING) }
}

// Background and Comscore retain typed async completion without measurement.
// Sentry uses its genuine no-native-support and empty-DSN close-to-NoOpHub
// branches, then completes integration setup without activating collectors.
// Its existing core initializer still invokes the real app runner.
internal val nativeTrackingEdits = mapOf(
    "arm64-v8a" to listOf(
        NativeEdit(NativeRange("background", 0x6ef3c8, 0x7e8,
            "4c12695de0e4ba3d0c755d4a0def96bb178c488488c89450398137a9a8c13803"), 0x6ef6fc,
            nativeBytes("7c050094"), nativeBytes("e4ffff17")),
        NativeEdit(NativeRange("comscore_start", 0x69d0a4, 0x88,
            "b1f84d434925f66ff2336ef5e6190ad1c72e28675e0603ee906a49a986d25d77"), 0x69d0cc,
            nativeBytes("a0035ff8"), nativeBytes("0d000014")),
        NativeEdit(NativeRange("comscore_init", 0x69d338, 0x104,
            "864491ce0e0f40d62c86800b48c5c0df1644fdfbf91c731aab49c2f4ea1ebd2d"), 0x69d360,
            nativeBytes("e10316aa"), nativeBytes("33000014")),
        NativeEdit(NativeRange("comscore_fpid", 0x69de8c, 0x144,
            "8919092f65bd05ea345c0541dc7d802eec77c665d7f735a1b40b4f852e5850eb"), 0x69de8c,
            nativeBytes("fd79bfa9fd030faa"), nativeBytes("60ab40f9c0035fd6")),
        NativeEdit(NativeRange("comscore_page", 0x6c7320, 0x1a8,
            "a7c28f08132dd4d17131caa16974bfadb65b7255be2dfe9264ce80f6098379c9"), 0x6c7320,
            nativeBytes("fd79bfa9fd030faa"), nativeBytes("e00316aac0035fd6")),
        NativeEdit(NativeRange("sentry_supports", 0xa77620, 0x34,
            "a476f9687d95b6e3549109fdd707198363a8acaf06dcfe362821f30c2486030a"), 0xa77620,
            nativeBytes("fd79bfa9fd030faa"), nativeBytes("c0c20091c0035fd6")),
        NativeEdit(NativeRange("sentry_config", 0xa74d44, 0xc4,
            "c3326dd81f604b40636bdf1fdc9c621a44566d7a5f5066822f2c0de4f43c50bc"), 0xa74d70,
            nativeBytes("017040b821801c8b"), nativeBytes("61ab40f91f2003d5")),
        NativeEdit(NativeRange("sentry_integrations", 0xa73d74, 0x1d4,
            "ea98185fc64e0ba37ced9d45025406d7ae133fd4b97ce98f248ee838cb51d018"), 0xa73da4,
            nativeBytes("a1035ff8"), nativeBytes("63000014")),
    ),
    "x86_64" to listOf(
        NativeEdit(NativeRange("background", 0x711d60, 0xa28,
            "a36969a2d5ff8405fb3f8c649990e08eddfec704b728bdb9c4c01442b074ba56"), 0x71214b,
            nativeBytes("e8a01a0000"), nativeBytes("e95bffffff")),
        NativeEdit(NativeRange("comscore_start", 0x790560, 0xa8,
            "c31fb81133f1080650ce07b5f149411ee44658a73dcea53eb0576477233c716c"), 0x79058a,
            nativeBytes("488b45f08b"), nativeBytes("e93c000000")),
        NativeEdit(NativeRange("comscore_init", 0x790820, 0x120,
            "ffe08e41e11964565fd5d441abb1ae7d2d9c1ce3174012e8b331e916724b76f8"), 0x79084a,
            nativeBytes("498b9e8800"), nativeBytes("e9d7000000")),
        NativeEdit(NativeRange("comscore_fpid", 0x790eb0, 0x180,
            "41b06d75cffc2e0244dc05d0786a67c77bedadadb29c12115093c8589afa4948"), 0x790eb0,
            nativeBytes("554889e54883ec20"), nativeBytes("498b874f010000c3")),
        NativeEdit(NativeRange("comscore_page", 0x70b630, 0x1b4,
            "fda5ed57d56bfd595c258c5667a003707ca879634b48788709044048d33bda9a"), 0x70b630,
            nativeBytes("554889e54883ec30"), nativeBytes("498b8688000000c3")),
        NativeEdit(NativeRange("sentry_supports", 0xaafd0c, 0x28,
            "8fe44696e5d430dc3220a3dd7d7f01e854793522a26d4566147f08f30e46b932"), 0xaafd0c,
            nativeBytes("554889e5493b6648"), nativeBytes("498b86a0000000c3")),
        NativeEdit(NativeRange("sentry_config", 0xaad3e0, 0xf4,
            "eb96b896c77dee6674e9afccfc112be11c30509cc55408a0bb5113c92141ec54"), 0xaad411,
            nativeBytes("8b480749034e58"), nativeBytes("498b8f4f010000")),
        NativeEdit(NativeRange("sentry_integrations", 0xaac418, 0x1e4,
            "788be0641438a50d5fba33225d5f0c5724bd8cb70deded22973267b07e53b490"), 0xaac449,
            nativeBytes("488b7df08b"), nativeBytes("e988010000")),
    ),
    "armeabi-v7a" to listOf(
        NativeEdit(NativeRange("background", 0x7e71c0, 0x8c4,
            "00309bf87e50c9a539b696c2f8bdc3070aaecc0e1c34dbb0934dce97d5acb71c"), 0x7e7554,
            nativeBytes("230600eb"), nativeBytes("5cffffea")),
        NativeEdit(NativeRange("comscore_start", 0x868210, 0x8c,
            "5b61a0dc5833680fdcbd70c58813143feff90c7b7c23b0d2640921da5e3946c8"), 0x86823c,
            nativeBytes("08001be5"), nativeBytes("0d0000ea")),
        NativeEdit(NativeRange("comscore_init", 0x86848c, 0x114,
            "13a537282a1f147a8503da445845b7c89c8a085e75447bc9e8cc6f4fbf2515b5"), 0x8684b8,
            nativeBytes("40109ae5"), nativeBytes("360000ea")),
        NativeEdit(NativeRange("comscore_fpid", 0x868a84, 0x19c,
            "19d6ef761c5db656f5eace9448d4496eda4a7b53ee52fba45c8ec59d8a9b3f63"), 0x868a84,
            nativeBytes("00482de900b08de2"), nativeBytes("a70095e51eff2fe1")),
        NativeEdit(NativeRange("comscore_page", 0x7e1130, 0x194,
            "84a4c158a3baaf789656a8c0c94938aaf8b9118fbe33ab95d644b43089371c45"), 0x7e1130,
            nativeBytes("00482de900b08de2"), nativeBytes("40009ae51eff2fe1")),
        NativeEdit(NativeRange("sentry_supports", 0xb9077c, 0x28,
            "046ca843055552a6ac51dff66831b897ec333251740aed47e47374ccdda5a9ac"), 0xb9077c,
            nativeBytes("00482de900b08de2"), nativeBytes("4c009ae51eff2fe1")),
        NativeEdit(NativeRange("sentry_config", 0xb8dcf0, 0xc8,
            "e34d1a196adc1ce62145d3353160c9c5a6d84d74eb87228d6f655660db77c9fb"), 0xb8dd20,
            nativeBytes("031090e5"), nativeBytes("a71095e5")),
        NativeEdit(NativeRange("sentry_integrations", 0xb8cce8, 0x1ec,
            "eb4b4379a473f57eb2c083bf3f6ed3f7403f54b231d49e952711df78711a5bb5"), 0xb8cd1c,
            nativeBytes("08101be5"), nativeBytes("6a0000ea")),
    ),
)
