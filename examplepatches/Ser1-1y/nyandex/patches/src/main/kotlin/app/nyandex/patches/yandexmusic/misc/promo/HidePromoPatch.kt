/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic.misc.promo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.nyandex.patches.yandexmusic.misc.settings.NYANDEX_SETTINGS_CLASS
import app.nyandex.patches.yandexmusic.misc.settings.nyandexSettingsPatch
import app.nyandex.patches.yandexmusic.shared.Constants.COMPATIBILITY_YANDEX_MUSIC
import com.android.tools.smali.dexlib2.AccessFlags
import java.util.logging.Logger

private val logger = Logger.getLogger("YandexMusicHidePromo")

private const val PROMO_HOOK = "Lapp/nyandex/extension/yandexmusic/settings/PromoHook;"
private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"

val hidePromoPatch = patch(
    name = "Скрыть рекламу и промо",
    description = "Добавляет настройки скрытия промо и рекламы в параметры Nyandex.",
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    dependsOn(nyandexSettingsPatch)

    execute {
        // The settings page shows the promo section only when this patch is applied.
        mutableClassDefBy(NYANDEX_SETTINGS_CLASS).methods
            .single { it.name == "promoAvailable" }
            .addInstructions(0, "const/4 v0, 0x1\nreturn v0")

        hookBlockRegistry()
    }
}

/**
 * The screens of the app (home feed, artist page, ...) are lists of blocks, each with a type such
 * as `PROMOTIONS` or `BANNER`. A small registry class (`mvh` in 2026.11.2) maps a type name to the
 * code that builds the block: `a(String[] types, Function0 factory)` registers and `b(String)`
 * looks a type up and returns null for a type it does not know, which the screens skip.
 *
 * `b` passes the type name through the extension first. A hidden type comes back as a name that is
 * not registered, so the block is never built. It is checked on every lookup, so the setting
 * applies the next time a screen loads, without a restart.
 */
private fun hookBlockRegistry() {
    val candidates = mutableListOf<String>()
    classDefForEach { classDef ->
        val instanceFields = classDef.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
        if (instanceFields.size != 1 || instanceFields.single().type != "Ljava/util/HashMap;") return@classDefForEach
        val methods = classDef.methods.filter { it.name != "<init>" }
        val register = methods.any {
            it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("[$STRING", FUNCTION0)
        }
        val lookup = methods.any {
            it.returnType == OBJECT && it.parameterTypes.map(CharSequence::toString) == listOf(STRING)
        }
        if (methods.size == 2 && register && lookup) candidates += classDef.type
    }

    val registry = candidates.singleOrNull()
        ?: throw PatchException("Expected one block registry class, found $candidates")

    val lookup = mutableClassDefBy(registry).methods.single {
        it.returnType == OBJECT && it.parameterTypes.map(CharSequence::toString) == listOf(STRING)
    }
    // p0 is the registry, p1 the type name.
    lookup.addInstructions(
        0,
        """
            invoke-static {p1}, $PROMO_HOOK->lookupKey($STRING)$STRING
            move-result-object p1
        """.trimIndent(),
    )
    logger.info("Hooked the block registry lookup in $registry.${lookup.name}")
}
