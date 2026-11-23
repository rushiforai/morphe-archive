package app.ckzombies.patches.nativelib

internal object NativeEdits {
    const val LIBRARY = "libandroidplatformjni.so"

    /** sha256 of Glu's untouched library, per ABI. Anything else is refused. */
    val STOCK_SHA256: Map<String, String> = mapOf(
        "armeabi" to "e806f976a6eb44d13e99260ba4f1f8fca85c835c7740a629343f98e43b474653",
        "armeabi-v7a" to "c5957845b85e8bde873c6c476bb1729e0ba4b32c8ce920bcb7fd7f92819be6f8",
    )

    val TEXT_RELOCATION: Map<String, List<WordEdit>> = mapOf(
        "armeabi" to listOf(
            WordEdit(0x0002C69C, 0x00000017L, 0x00000000L),
            WordEdit(0x00054048, 0xE28F0004L, 0xE59F0004L),
            WordEdit(0x0005404C, 0xE5900000L, 0xE08F0000L),
            WordEdit(0x00054054, 0x005C51E0L, 0x0057118CL),
            WordEdit(0x005ABFF8, 0x00000016L, 0x00000015L),
        ),
        "armeabi-v7a" to listOf(
            WordEdit(0x0002C2F0, 0x00000017L, 0x00000000L),
            WordEdit(0x00053AC8, 0xE28F0004L, 0xE59F0004L),
            WordEdit(0x00053ACC, 0xE5900000L, 0xE08F0000L),
            WordEdit(0x00053AD4, 0x00594E50L, 0x0054137CL),
            WordEdit(0x0057BCD0, 0x00000016L, 0x00000015L),
        ),
    )
    val IS_AVAILABLE: Map<String, List<WordEdit>> = mapOf(
        "armeabi" to listOf(
            WordEdit(0x000C43F4, 0xE92D4010L, 0xE3A00000L),
            WordEdit(0x000C43F8, 0xE59F3020L, 0xE12FFF1EL),
        ),
        "armeabi-v7a" to listOf(
            WordEdit(0x000C4734, 0xE59F3024L, 0xE3A00000L),
            WordEdit(0x000C4738, 0xE92D4010L, 0xE12FFF1EL),
        ),
    )

    val UNLIMITED_AMMO: Map<String, List<WordEdit>> = mapOf(
        "armeabi" to listOf(
            WordEdit(0x0041298C, 0xAAFFFFDEL, 0xE1A00000L),
            WordEdit(0x004BBEE4, 0xE2433001L, 0xE1A00000L),
            WordEdit(0x004BC0C0, 0xE2433001L, 0xE1A00000L),
        ),
        "armeabi-v7a" to listOf(
            WordEdit(0x003F6748, 0xAAFFFFDDL, 0xE1A00000L),
            WordEdit(0x00493E04, 0xE2433001L, 0xE1A00000L),
            WordEdit(0x00493FBC, 0xE2433001L, 0xE1A00000L),
        ),
    )
    val HUD_RELOAD: Map<String, HudPlan> = mapOf(
        "armeabi" to HudPlan(
            cave = 0x00596E80,
            caveBytes = "9c2193e59000d3e5000050e30200001a880093e5030050e30000001a0020a0e31eff2fe1",
            edits = listOf(
                WordEdit(0x00417280, 0xE593219CL, 0xEB05FEFEL),
            ),
        ),
        "armeabi-v7a" to HudPlan(
            cave = 0x00566E80,
            caveBytes = "9c1190e59020d0e5000052e30200001a882090e5030052e30000001a0010a0e31eff2fe1",
            edits = listOf(
                WordEdit(0x003FB0E8, 0xE590119CL, 0xEB05AF64L),
            ),
        ),
    )

    val DEAD_SERVERS: Map<String, List<WordEdit>> = mapOf(
        "armeabi" to listOf(
            WordEdit(0x002B8638, 0xEB07BCDEL, 0xE1A00000L),
            WordEdit(0x0035E438, 0x1A000001L, 0xE1A00000L),
            WordEdit(0x00360AC0, 0xE2853058L, 0xE2853030L),
            WordEdit(0x0037B498, 0x1A000059L, 0xE1A00000L),
            WordEdit(0x003CE9B0, 0xE92D47F0L, 0xE12FFF1EL),
        ),
        "armeabi-v7a" to listOf(
            WordEdit(0x002AAC68, 0xEB0753C3L, 0xE1A00000L),
            WordEdit(0x00341C28, 0x1A000001L, 0xE1A00000L),
            WordEdit(0x00344074, 0xE2853058L, 0xE2853030L),
            WordEdit(0x0035EA0C, 0x1A00005AL, 0xE1A00000L),
            WordEdit(0x003B24EC, 0xE92D47F0L, 0xE12FFF1EL),
        ),
    )
    val JNI_ARGUMENTS: Map<String, List<WordEdit>> = mapOf(
        "armeabi" to listOf(
            WordEdit(0x00162014, 0xE58D6000L, 0xE58D6004L),
            WordEdit(0x00162A74, 0xE58D7000L, 0xE58D7004L),
        ),
        "armeabi-v7a" to listOf(
            WordEdit(0x00162CE8, 0xE58D6000L, 0xE58D6004L),
            WordEdit(0x00163720, 0xE58D6000L, 0xE58D6004L),
        ),
    )
    val SOUND_CACHE_MODE: Map<String, List<WordEdit>> = mapOf(
        "armeabi" to listOf(
            WordEdit(0x0016DFAC, 0xEBFB957FL, 0xE3A02E1BL),
            WordEdit(0x0016DFB0, 0xE3700001L, 0xEBFB957EL),
            WordEdit(0x0016DFB4, 0xE1A0A000L, 0xE1B0A000L),
            WordEdit(0x0016DFB8, 0x0A000004L, 0x4A000004L),
        ),
        "armeabi-v7a" to listOf(
            WordEdit(0x0016EB0C, 0xEBFB9191L, 0xE3A02E1BL),
            WordEdit(0x0016EB10, 0xE3700001L, 0xEBFB9190L),
            WordEdit(0x0016EB14, 0xE1A0A000L, 0xE1B0A000L),
            WordEdit(0x0016EB18, 0x0A000004L, 0x4A000004L),
        ),
    )
    val DAILY_DEAL: Map<String, List<WordEdit>> = mapOf(
        "armeabi" to listOf(
            WordEdit(0x003AD2E0, 0x0A00000BL, 0xEA00000BL),
        ),
        "armeabi-v7a" to listOf(
            WordEdit(0x00390B24, 0x0A00000BL, 0xEA00000BL),
        ),
    )
    val HIDDEN_WEAPONS: Map<String, List<WordEdit>> = mapOf(
        "armeabi" to listOf(
            WordEdit(0x0038A010, 0xE5D00004L, 0xE3A00000L),
        ),
        "armeabi-v7a" to listOf(
            WordEdit(0x0036D8C0, 0xE5D00004L, 0xE3A00000L),
        ),
    )
    val EXPLOSION_SHAKE: Map<String, List<WordEdit>> = mapOf(
        "armeabi" to listOf(
            WordEdit(0x0030EC74, 0xEB059442L, 0xE1A00000L),
            WordEdit(0x0030F7DC, 0xEB059168L, 0xE1A00000L),
        ),
        "armeabi-v7a" to listOf(
            WordEdit(0x002F599C, 0xEB058448L, 0xE1A00000L),
            WordEdit(0x002F6224, 0xEB058226L, 0xE1A00000L),
        ),
    )
    val JNI_GUARDS: Map<String, List<WordEdit>> = mapOf(
        "armeabi" to listOf(
            WordEdit(0x000F39A0, 0xE5906040L, 0xE3A06001L),
            WordEdit(0x000F22E0, 0xE5903010L, 0xE3A03001L),
            WordEdit(0x00055A00, 0xE5D35010L, 0xE3A05001L),
            WordEdit(0x000F2EFC, 0xE5946010L, 0xE3A06001L),
            WordEdit(0x000F311C, 0xE5946010L, 0xE3A06001L),
        ),
        "armeabi-v7a" to listOf(
            WordEdit(0x000F42A0, 0xE5906040L, 0xE3A06001L),
            WordEdit(0x000F2BDC, 0xE5903010L, 0xE3A03001L),
            WordEdit(0x00055488, 0xE5D35010L, 0xE3A05001L),
            WordEdit(0x000F37F4, 0xE5946010L, 0xE3A06001L),
            WordEdit(0x000F3A18, 0xE5946010L, 0xE3A06001L),
        ),
    )
    /**
     * First-segment end after the currency cave's page is mapped. Civilian immunity writes
     * its stubs at the far end of the same padding so the two patches compose in either order.
     */
    val PADDING: Map<String, PaddingPlan> = mapOf(
        "armeabi" to PaddingPlan(
            load1End = 0x00597000,
            spliceAtOffset = 0x00596340,
            spliceSize = 0x1000,
        ),
        "armeabi-v7a" to PaddingPlan(
            load1End = 0x00567000,
            spliceAtOffset = null,
            spliceSize = 0,
        ),
    )

    val CIVILIAN_IMMUNITY: Map<String, CivilianPlan> = mapOf(
        "armeabi" to CivilianPlan(
            blastCave = 0x00596F80,
            fragCave = 0x00596FB0,
            blastCaveBytes = "9c0094e55500d0e5000050e30100001aa303d4e51eff2fe1f08fbde8",
            fragCaveBytes = "9c3090e55530d3e5000053e30100001aa333d0e51eff2fe10cd08de2f08fbde8",
            edits = listOf(
                WordEdit(0x0031F2F0, 0x1A000004L, 0xE1A00000L),
                WordEdit(0x0031EDC0, 0xE5D003A3L, 0xEB09E06EL),
                WordEdit(0x0031FA80, 0xE5D033A3L, 0xEB09DD4AL),
            ),
        ),
        "armeabi-v7a" to CivilianPlan(
            blastCave = 0x00566F80,
            fragCave = 0x00566FB0,
            blastCaveBytes = "9c2090e55520d2e5000052e30100001aa323d0e51eff2fe1048bbdecf08fbde8",
            fragCaveBytes = "9c3090e55530d3e5000053e30100001aa333d0e51eff2fe10cd08de2f08fbde8",
            edits = listOf(
                WordEdit(0x003052DC, 0x1A000005L, 0xE1A00000L),
                WordEdit(0x00304E90, 0xE5D023A3L, 0xEB09883AL),
                WordEdit(0x00305A08, 0xE5D033A3L, 0xEB098568L),
            ),
        ),
    )

    val CURRENCY: Map<String, CurrencyPlan> = mapOf(
        "armeabi" to CurrencyPlan(
            cave = 0x00596340,
            load1End = 0x00597000,
            spliceAtOffset = 0x00596340,
            spliceSize = 0x1000,
            caveBytes = "1e502de944109fe501108fe0002091e5000052e30b00001a0120a0e3002081e50400a0e128109fe528209fe502208fe024309fe503308fe0f444f9eb0400a0e118109fe53743f9eb0400a0e11e90bde808790300ffc99a3b8c51fffff432ffff15be9a3b00000000000000000000000001402de902208ae008009fe5000052e10020a0c10180bde8ffc99a3b01402de902b08be008009fe500005be100b0a0c10180bde8ffc99a3b",
            edits = listOf(
                WordEdit(0x000E00E8, 0xE92D4010L, 0xE3A00000L),
                WordEdit(0x000E00EC, 0xEB002E90L, 0xE12FFF1EL),
                WordEdit(0x003E7164, 0xE08A2002L, 0xEB06BC91L),
                WordEdit(0x003E7894, 0xE08BB002L, 0xEB06BACCL),
                WordEdit(0x003E92AC, 0xE1A00004L, 0xEB06B423L),
                WordEdit(0x003EA368, 0xE1A00004L, 0xEB06AFF4L),
                WordEdit(0x003EB498, 0xE1A00004L, 0xEB06ABA8L),
                WordEdit(0x003EC18C, 0xE1A00004L, 0xEB06A86BL),
            ),
        ),
        "armeabi-v7a" to CurrencyPlan(
            cave = 0x00566854,
            load1End = 0x00567000,
            spliceAtOffset = null,
            spliceSize = 0x0,
            caveBytes = "1e502de944109fe501108fe0002091e5000052e30b00001a0120a0e3002081e50400a0e128109fe528209fe502208fe024309fe503308fe0b992f9eb0400a0e118109fe5f890f9eb0400a0e11e90bde864700300ffc99a3b2c5effffc441ffff15be9a3b00000000000000000000000001402de903308ae008009fe5000053e10030a0c10180bde8ffc99a3b01402de903b08be008009fe500005be100b0a0c10180bde8ffc99a3b",
            edits = listOf(
                WordEdit(0x000E0920, 0xE92D4010L, 0xE3A00000L),
                WordEdit(0x000E0924, 0xEB002EC1L, 0xE12FFF1EL),
                WordEdit(0x003CAD94, 0xE08A3003L, 0xEB066ECAL),
                WordEdit(0x003CB4DC, 0xE08BB003L, 0xEB066CFFL),
                WordEdit(0x003CCF18, 0xE1A00004L, 0xEB06664DL),
                WordEdit(0x003CE020, 0xE1A00004L, 0xEB06620BL),
                WordEdit(0x003CF188, 0xE1A00004L, 0xEB065DB1L),
                WordEdit(0x003CFE90, 0xE1A00004L, 0xEB065A6FL),
            ),
        ),
    )
}
