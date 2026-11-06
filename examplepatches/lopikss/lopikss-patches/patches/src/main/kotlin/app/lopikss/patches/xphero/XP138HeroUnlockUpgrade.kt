package app.lopikss.patches.xphero

import app.lopikss.patches.shared.Constants.XP_HERO
import app.morphe.patcher.patch.rawResourcePatch
import java.security.MessageDigest

/**
 * Version-pinned XP Hero 26.2.0 and 27.0.0 hero data edits.
 * Both preserve Unity file length and verify the *original* asset SHA-256.
 */
private object XP138Heroes {
    const val HERO_DATA = "assets/bin/Data/ac161aa51303a4fce8138bf3242d0920"
    const val HERO_DATA_27 = "assets/bin/Data/6ee8d550509fc420fa99cd817379de6f"
    const val HERO_STAR = "assets/bin/Data/02ce5273e9c794059afe2ada0670d172"
    const val HERO_STAR_27 = "assets/bin/Data/ad2670771b384455ebef2391d9ec5592"

    private const val HERO_DATA_SHA = "ff5d1c8e995e8169b643227d7e87a202910dc81c8e141d12ca0d8c0488018408"
    private const val HERO_DATA_SHA_27 = "98c3b1475724db40dce90f2c22bc08c9c2f46af95cb17d682c3b4ebfea6537d3"
    private const val HERO_STAR_SHA = "818570c2ec087bab93583352fbe6e6ff9dd859b5f06cd14b9d1995842467df87"
    private const val HERO_STAR_SHA_27 = "4ad3a365ac10ec3ae2314f0c089ba5803bb4a4fb1265c8eb868be765987f90e1"

    private fun digest(input: ByteArray): String = MessageDigest.getInstance("SHA-256")
        .digest(input).joinToString("") { "%02x".format(it) }

    fun unlockAllHeroes(input: ByteArray): ByteArray {
        val sha = digest(input)
        val v27 = sha == HERO_DATA_SHA_27
        require(v27 || sha == HERO_DATA_SHA) {
            "Unsupported XP Hero CostumeData"
        }
        val source = String(input, Charsets.ISO_8859_1)
        // Every hero has its own UnlockRequiredPieces entry. Keep the exact
        // original digit width so Unity resource offsets/file length stay intact.
        val requiredPieces = Regex("""("UnlockRequiredPieces":")([0-9]+)(")""")
        val matches = requiredPieces.findAll(source).toList()
        val expectedHeroes = if (v27) 26 else 24
        check(matches.size == expectedHeroes) {
            "Expected $expectedHeroes hero unlock requirements; found ${matches.size}"
        }
        check(matches.count { it.groupValues[2].any { digit -> digit != '0' } } >= 2) {
            "Unexpected already-free XP Hero CostumeData"
        }
        val edited = requiredPieces.replace(source) { match ->
            match.groupValues[1] + "0".repeat(match.groupValues[2].length) + match.groupValues[3]
        }.toByteArray(Charsets.ISO_8859_1)
        check(edited.size == input.size && !edited.contentEquals(input)) {
            "Hero unlock asset unexpectedly changed"
        }
        return edited
    }

    fun freeStarUpgrades(input: ByteArray): ByteArray {
        val sha = digest(input)
        val v27 = sha == HERO_STAR_SHA_27
        require(v27 || sha == HERO_STAR_SHA) { "Unsupported XP Hero CostumeStarGradeOptionData" }
        val text = String(input, Charsets.ISO_8859_1)
        val price = Regex("""("Cost1_Amount":")([0-9]+)(")""")
        check(price.findAll(text).count() == (if (v27) 156 else 144)) {
            "Unexpected hero star upgrade data"
        }
        val edited = price.replace(text) { match ->
            match.groupValues[1] + "0".repeat(match.groupValues[2].length) + match.groupValues[3]
        }.toByteArray(Charsets.ISO_8859_1)
        check(edited.size == input.size) { "Hero upgrade asset changed length" }
        return edited
    }
}

/**
 * Remove the unlock-piece cost for every hero, including Vlad, by editing
 * all original CostumeData rows. Leave paid IAP offers and other costs intact.
 */
@Suppress("unused")
val xp138UnlockAllHeroes = rawResourcePatch(
    name = "XP Hero | Unlock All Heroes (FREE)",
    description = "Experimental: all heroes cost 0 unlock pieces; the native zero-amount consume path keeps its normal notifications. Other unlock conditions may still apply.",
    default = false,
) {
    compatibleWith(XP_HERO)
    execute {
        val heroData27 = get(XP138Heroes.HERO_DATA_27)
        val heroFile = if (heroData27.isFile) heroData27 else get(XP138Heroes.HERO_DATA)
        val native = get(XP135NativeEditor.ARM64)
        // Validate the original asset and native game logic before changing
        // either file. This remains opt-in and version-specific.
        val newHeroData = XP138Heroes.unlockAllHeroes(heroFile.readBytes())
        val newNative = XP135NativeEditor.allowZeroPieceHeroUnlock(native.readBytes())
        heroFile.writeBytes(newHeroData)
        native.writeBytes(newNative)
    }
}

/**
 * This is the actual zero-shard alternative to the confirmed one-shard
 * fallback. Never select both upgrade modules, as both rewrite the same
 * hero star data and expect its original SHA-256.
 */
@Suppress("unused")
val xp138FreeHeroStarUpgrades = rawResourcePatch(
    name = "XP Hero | Free Hero Upgrade (0 Shards)",
    description = "Experimental: shows 0 shards, credits +1 just before the normal 1-shard upgrade, then consumes it. Net cost 0; do not combine with 1-shard fallback.",
    default = false,
) {
    compatibleWith(XP_HERO)
    execute {
        val v27Star = get(XP138Heroes.HERO_STAR_27)
        val starFile = if (v27Star.isFile) v27Star else get(XP138Heroes.HERO_STAR)
        val native = get(XP135NativeEditor.ARM64)
        // Validate every source before modifying either file.
        val modifiedStars = XP138Heroes.freeStarUpgrades(starFile.readBytes())
        val modifiedNative = XP135NativeEditor.freeHeroStarUpgrades(native.readBytes())
        starFile.writeBytes(modifiedStars)
        native.writeBytes(modifiedNative)
    }
}
