/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.nyandex.patches.yandexmusic.misc.account.isolatePassportAccountPatch
import app.nyandex.patches.yandexmusic.misc.billing.disablePlayBillingPatch
import app.nyandex.patches.yandexmusic.misc.entitlement.unlockYandexPlusPatch
import app.nyandex.patches.yandexmusic.misc.haptics.hapticFeedbackPatch
import app.nyandex.patches.yandexmusic.misc.lyrics.lyricsFallbackPatch
import app.nyandex.patches.yandexmusic.misc.settings.hideBottomBarTabsPatch
import app.nyandex.patches.yandexmusic.misc.settings.nyandexSettingsPatch
import app.nyandex.patches.yandexmusic.misc.theme.monetThemePatch
import app.nyandex.patches.yandexmusic.misc.network.blockPlusEventsPatch
import app.nyandex.patches.yandexmusic.misc.network.cleanShareLinksPatch
import app.nyandex.patches.yandexmusic.misc.network.removeTrackingHeadersPatch
import app.nyandex.patches.yandexmusic.misc.signature.spoofFirebaseCertPatch
import app.nyandex.patches.yandexmusic.misc.telemetry.disableTelemetryPatch
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Annotation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.DexFile
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import java.io.File
import java.nio.file.Files
import java.util.zip.ZipFile
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

private const val STOCK_CERT_SHA1 = "5D224274D9377C35DA777AD934C65C8CCA6E7A20"
private const val STOCK_ACCOUNT_TYPE = "com.yandex.passport"
private const val ISOLATED_ACCOUNT_TYPE = "com.yandex.passport.morphe"
private const val BILLING_MARKER = "app.nyandex.yandexmusic.BILLING_DISABLED"
private const val TELEMETRY_MARKER = "app.nyandex.yandexmusic.TELEMETRY_DISABLED"
private const val TRACKING_MARKER = "X-Nyandex-Disabled-"
private const val LRCLIB_EXTENSION = "Lapp/nyandex/extension/yandexmusic/lyrics/LrcLibLyrics;"
private const val NYANDEX_SETTINGS = "Lapp/nyandex/extension/yandexmusic/settings/NyandexSettings;"
private const val SETTINGS_ENTRY = "Lapp/nyandex/extension/yandexmusic/settings/SettingsEntry;"
private const val SETTINGS_ACTIVITY_TYPE = "Lapp/nyandex/extension/yandexmusic/settings/NyandexSettingsActivity;"
private const val BOTTOM_TABS_HOOK = "Lapp/nyandex/extension/yandexmusic/settings/BottomTabsHook;"
private const val HAPTICS_HOOK = "Lapp/nyandex/extension/yandexmusic/haptics/HapticsHook;"
private const val SHARE_LINKS = "Lapp/nyandex/extension/yandexmusic/share/ShareLinks;"
private const val MONET_COLORS = "Lapp/nyandex/extension/yandexmusic/monet/MonetColors;"

private val BILLING_LITERALS = listOf(
    "com.android.vending.billing.InAppBillingService.BIND",
    "com.android.vending.billing.IN_APP_BILLING_RESULT_UPDATE_ACTION",
    "com.android.vending.billing.IInAppBillingService",
    "com.google.android.play.core.install.BIND_UPDATE_SERVICE",
    "com.google.android.play.core.install.ACTION_INSTALL_STATUS",
    "com.google.android.play.core.appupdate.protocol.IAppUpdateServiceCallback",
    "com.google.android.play.core.appupdate.protocol.IAppUpdateService",
    "com.google.android.play.core.inappreview.protocol.IInAppReviewServiceCallback",
    "com.google.android.play.core.inappreview.protocol.IInAppReviewService",
    "com.google.android.apps.play.billingtestcompanion.BillingOverrideService.BIND",
)

private val TELEMETRY_LITERALS = listOf(
    "https://%sgcdsdk.%s/install_data/v5.0/",
    "https://%spia.%s/api/v1.0/pia-android-event?app_id=",
    "https://%svalidate-and-log.%s/api/v1.0/android/validateAndLog?app_id=",
    "https://%sviap.%s/api/v1/android/validate_purchase_v2?app_id=",
    "https://%sviap.%s/api/v1/android/validate_purchase?app_id=",
    "https://%sars.%s/api/v2/android/validate_subscription_v2?app_id=",
    "https://%sars.%s/api/v2/android/validate_subscription?app_id=",
    "https://%smonitorsdk.%s/remote-debug/exception-manager",
    "https://%scdn-%stestsettings.%s/android/v1/%s/settings",
    "https://%scdn-%ssettings.%s/android/v1/%s/settings",
    "https://privacy-sandbox.appsflyersdk.com/api/trigger",
    "https://%sadrevenue.%s/api/v2/generic/v6.16.2/android?app_id=",
    "https://%sattr.%s/api/v",
    "https://%sconversions.%s/api/v",
    "appsflyersdk.com",
    "https://startup.mobile.yandex.net/",
    "https://appmetrica.yandex.com/docs/",
    "io.appmetrica.analytics.internal.IAppMetricaService",
    "io.appmetrica.analytics.IAppMetricaService",
    "io.opentelemetry.sdk.testing.context.SettableContextStorageProvider",
    "io.opentelemetry.sdk.metrics",
    "io.opentelemetry.context.",
    "io.opentelemetry.api.",
    "https://pagead2.googlesyndication.com/pagead/gen_204?id=gmob-apps",
    "com.google.android.gms.ads.identifier.service.START",
    "https://firebase-settings.crashlytics.com/spi/v2/platforms/android/gmp/",
    "firebase-settings.crashlytics.com",
    "https://www.googleapis.com/auth/games_lite",
    "https://www.googleapis.com/auth/games",
    "/proc/net/tcp",
)

private val PLUS_HOSTS = listOf(
    "api.events.plus.yandex.net",
    "api.acquisition-gwe.plus.yandex.net",
)

private val V2_TRIGGER_PATHS = listOf(
    "dynamic-pages/v2/trigger/shown",
    "dynamic-pages/v2/trigger/polling",
    "dynamic-pages/v2/trigger/action",
)

private val TRACKING_HEADERS = listOf(
    "X-Request-Id",
    "X-Yandex-DeviceID",
    "X-Yandex-Music-Device",
)

private data class Entitlement(val classType: String, val fieldName: String, val value: Int)

private val ENTITLEMENTS = listOf(
    Entitlement("Lcom/yandex/passport/data/network/d4;", "b", 1),
    Entitlement("Lcom/yandex/passport/internal/database/b;", "c", 0),
    Entitlement("Lcom/yandex/passport/internal/database/b;", "d", 1),
    Entitlement("Lcom/yandex/passport/common/core/g;", "p", 1),
    Entitlement("Lcom/yandex/passport/common/core/g;", "q", 1),
    Entitlement("Lcom/yandex/passport/common/core/g;", "x", 0),
    Entitlement("Lcom/yandex/passport/data/models/w;", "q", 1),
    Entitlement("Lcom/yandex/passport/data/models/w;", "r", 1),
    Entitlement("Lcom/yandex/passport/data/models/w;", "y", 0),
    Entitlement("Lcom/yandex/passport/internal/account/g;", "o", 1),
    Entitlement("Lcom/yandex/passport/internal/ui/bouncer/model/m2;", "h", 1),
    Entitlement("Lcom/yandex/passport/internal/ui/bouncer/roundabout/items/h0;", "g", 1),
    Entitlement("Lcom/yandex/passport/internal/ui/bouncer/roundabout/items/i0;", "i", 1),
)

/** Same shape match as the patch: R8 renames the session DTO between builds. */
private fun isMusicSessionClass(classDef: ClassDef): Boolean =
    classDef.interfaces.contains("Landroid/os/Parcelable;") &&
        classDef.fields.any { it.name == "b" && it.type == "I" } &&
        classDef.fields.any { it.name == "c" && it.type == "Ljava/lang/String;" } &&
        classDef.fields.any { it.name == "d" && it.type == "Z" } &&
        classDef.fields.any { it.name == "f" && it.type == "Z" } &&
        classDef.fields.any { it.name == "g" && it.type == "Z" } &&
        classDef.fields.any { it.name == "h" && it.type == "Z" } &&
        classDef.fields.any { it.name == "i" && it.type == "Ljava/util/List;" } &&
        classDef.methods.any { method ->
            method.name == "<init>" &&
                method.parameterTypes.size == 9 &&
                method.parameterTypes[1] == "I" &&
                method.parameterTypes[2] == "Ljava/lang/String;" &&
                method.parameterTypes[3] == "Z" &&
                method.parameterTypes[5] == "Z" &&
                method.parameterTypes[6] == "Z" &&
                method.parameterTypes[7] == "Z" &&
                method.parameterTypes[8] == "Ljava/util/List;"
        }

class YandexMusicPatchApplyTest {
    @Test
    fun `all patches apply and the patched dex matches the expected changes`() {
        val apkPath = System.getenv("YM_APK")
        assumeTrue(apkPath != null, "Set YM_APK to a stock Yandex Music base.apk to run this test")
        val apk = File(apkPath!!)
        assertTrue(apk.isFile, "Test APK not found: $apk")

        val workDirectory = File(System.getProperty("java.io.tmpdir"), "ym-patch-run")
        val output = File(System.getProperty("java.io.tmpdir"), "ym-patched.apk")

        Patcher(
            PatcherConfig(
                apkFile = apk,
                temporaryFilesPath = workDirectory,
                validate = true,
            ),
        ).use { patcher ->
            patcher += setOf(
                unlockYandexPlusPatch,
                disablePlayBillingPatch,
                disableTelemetryPatch,
                blockPlusEventsPatch,
                removeTrackingHeadersPatch,
                spoofFirebaseCertPatch,
                isolatePassportAccountPatch,
                lyricsFallbackPatch,
                nyandexSettingsPatch,
                hideBottomBarTabsPatch,
                monetThemePatch,
                cleanShareLinksPatch,
                hapticFeedbackPatch,
            )

            val results = runBlocking { patcher().toList() }
            results.forEach { result ->
                result.exception?.let { throw AssertionError("${result.patch.name} failed", it) }
            }

            // Compiling the patched DEX catches invalid instructions and register errors.
            patcher.writeApk(output)
        }

        assertTrue(output.isFile && output.length() > 0, "Patched APK was not written")

        val dexFiles = extractDexFiles(output)
        val instructionStrings = dexFiles.flatMapTo(mutableSetOf()) { dex ->
            dex.classes.flatMap { classDef ->
                classDef.methods.flatMap { method ->
                    (method.implementation?.instructions ?: emptyList()).mapNotNull { instruction ->
                        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                    }
                }
            }
        }

        assertTrue(instructionStrings.any { it.contains(BILLING_MARKER) }, "Billing was not patched")
        assertTrue(instructionStrings.any { it.contains(TELEMETRY_MARKER) }, "Telemetry was not patched")
        assertTrue(instructionStrings.any { it.contains(TRACKING_MARKER) }, "Tracking headers were not patched")
        assertTrue(instructionStrings.contains(STOCK_CERT_SHA1), "Firebase certificate was not patched")
        assertTrue(instructionStrings.contains("127.0.0.1"), "Plus/trigger hosts were not redirected")

        BILLING_LITERALS.forEach { literal ->
            assertFalse(instructionStrings.any { it.contains(literal) }, "Billing literal remains: $literal")
        }
        TELEMETRY_LITERALS.forEach { literal ->
            assertFalse(instructionStrings.any { it.contains(literal) }, "Telemetry literal remains: $literal")
        }
        PLUS_HOSTS.forEach { host ->
            assertFalse(instructionStrings.any { it.contains(host) }, "Plus host remains: $host")
        }
        TRACKING_HEADERS.forEach { header ->
            assertFalse(instructionStrings.any { it.contains(header) }, "Tracking header remains: $header")
        }
        V2_TRIGGER_PATHS.forEach { path ->
            assertFalse(instructionStrings.any { it.contains(path) }, "v2 trigger path remains: $path")
        }

        verifyVuTriggerAnnotations(dexFiles)
        verifyFirebaseCertificate(dexFiles)
        verifyPassportAccountType(dexFiles, output)
        verifyLyricsFallback(dexFiles)
        verifyLyricsPrefetch(dexFiles)
        verifyTrackCacheRow(dexFiles)
        verifyShareLinks(dexFiles)
        verifySettingsAndTabs(dexFiles, output)
        verifyHaptics(dexFiles)
        verifyMonetTheme(output)
        verifyWaveButtonColors(dexFiles)
        verifyThemeLogoColor(dexFiles, output)
        verifyEntitlements(dexFiles)
        verifyBranchTargets(dexFiles)
    }

    private fun verifyEntitlements(dexFiles: List<DexFile>) {
        val sessionClass = dexFiles.asSequence()
            .flatMap { it.classes.asSequence() }
            .firstOrNull(::isMusicSessionClass)
            ?.type
            ?: throw AssertionError("Music session DTO was not found")

        val expected = (
            listOf(
                Entitlement(sessionClass, "d", 1),
                Entitlement(sessionClass, "f", 0),
                Entitlement(sessionClass, "g", 1),
                Entitlement(sessionClass, "h", 1),
            ) + ENTITLEMENTS
        ).associate { (it.classType to it.fieldName) to it.value }
        val writes = mutableMapOf<Pair<String, String>, MutableList<Boolean>>()

        dexFiles.forEach { dex ->
            dex.classes.forEach { classDef ->
                classDef.methods.forEach { method ->
                    val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                    instructions.forEachIndexed { index, instruction ->
                        if (instruction.opcode != Opcode.IPUT_BOOLEAN) return@forEachIndexed
                        val field = ((instruction as? ReferenceInstruction)?.reference as? FieldReference)
                            ?: return@forEachIndexed
                        val key = field.definingClass to field.name
                        val value = expected[key] ?: return@forEachIndexed

                        val valueRegister = (instruction as TwoRegisterInstruction).registerA
                        val previous = instructions.getOrNull(index - 1)
                        val forced = previous?.opcode == Opcode.CONST_4 &&
                            (previous as OneRegisterInstruction).registerA == valueRegister &&
                            (previous as NarrowLiteralInstruction).narrowLiteral == value
                        writes.getOrPut(key) { mutableListOf() }.add(forced)
                    }
                }
            }
        }

        ENTITLEMENTS.forEach { entitlement ->
            val key = entitlement.classType to entitlement.fieldName
            val fieldWrites = writes[key]
            assertTrue(
                !fieldWrites.isNullOrEmpty(),
                "No write found for ${entitlement.classType}->${entitlement.fieldName}",
            )
            assertTrue(
                fieldWrites.all { it },
                "Not every write of ${entitlement.classType}->${entitlement.fieldName} was forced",
            )
        }
    }

    /**
     * ART rejects a class whose branch lands inside an instruction ("target dex pc … is not at
     * instruction start"). Check every branch of every method that calls into a Nyandex extension.
     */
    private fun verifyBranchTargets(dexFiles: List<DexFile>) {
        var checked = 0
        dexFiles.flatMap { it.classes }.forEach { classDef ->
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val touched = instructions.any { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.definingClass?.startsWith("Lapp/nyandex/extension/") == true
                }
                if (!touched) return@forEach

                val starts = mutableSetOf<Int>()
                var offset = 0
                instructions.forEach { instruction ->
                    starts += offset
                    offset += instruction.codeUnits
                }
                offset = 0
                instructions.forEach { instruction ->
                    if (instruction is com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction) {
                        val target = offset + instruction.codeOffset
                        assertTrue(
                            target in starts,
                            "${classDef.type}->${method.name}: branch at 0x${offset.toString(16)} " +
                                "targets 0x${target.toString(16)}, which is not an instruction start",
                        )
                    }
                    offset += instruction.codeUnits
                }
                checked++
            }
        }
        assertTrue(checked >= 4, "Expected the patched methods to be checked, got $checked")
    }

    private fun MethodReference.isCall(owner: String, name: String) = definingClass == owner && this.name == name

    private fun calls(method: com.android.tools.smali.dexlib2.iface.Method) =
        method.implementation?.instructions?.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        }.orEmpty()

    private fun verifySettingsAndTabs(dexFiles: List<DexFile>, apk: File) {
        val classes = dexFiles.flatMap { it.classes }
        val settings = classes.single { it.type == NYANDEX_SETTINGS }
        assertTrue(classes.any { it.type == SETTINGS_ACTIVITY_TYPE }, "Settings activity class was not merged")

        // "Hide bottom bar tabs" turns the tab section on.
        val available = settings.methods.single { it.name == "bottomTabsAvailable" }
        val first = available.implementation!!.instructions.first()
        assertEquals(Opcode.CONST_4, first.opcode, "bottomTabsAvailable was not patched")
        assertEquals(1, (first as NarrowLiteralInstruction).narrowLiteral, "bottomTabsAvailable does not return true")

        // The settings screen draws the Nyandex row with the app's own composables.
        val rowSites = classes.flatMap { classDef ->
            classDef.methods.filter { method -> calls(method).any { it.isCall(SETTINGS_ENTRY, "onClick") } }
        }
        assertEquals(1, rowSites.size, "Expected one settings block calling SettingsEntry.onClick")
        val rowCalls = calls(rowSites.single())
        assertTrue(rowCalls.any { it.isCall(SETTINGS_ENTRY, "header") }, "Nyandex header is not drawn")
        assertTrue(rowCalls.any { it.isCall(SETTINGS_ENTRY, "title") }, "Nyandex row title is not drawn")
        val helper = rowSites.single()
        assertEquals("nyandexSettingsRow", helper.name, "The row is not drawn by the Nyandex helper")
        val helperCallers = classes.flatMap { classDef ->
            classDef.methods.filter { method -> calls(method).any { it.isCall(helper.definingClass, helper.name) } }
        }
        assertEquals(1, helperCallers.size, "Expected one settings block calling the Nyandex row helper")

        // Exactly one bottom bar method filters its tab set.
        val tabSites = classes.flatMap { classDef ->
            classDef.methods.filter { method -> calls(method).any { it.isCall(BOTTOM_TABS_HOOK, "filterTabs") } }
        }
        assertEquals(1, tabSites.size, "Expected one bottom bar method calling filterTabs")

        // The settings activity is declared in the manifest.
        val manifest = aapt2("dump", "xmltree", "--file", "AndroidManifest.xml", apk.absolutePath)
        assertTrue(
            manifest.contains("\"app.nyandex.extension.yandexmusic.settings.NyandexSettingsActivity\""),
            "NyandexSettingsActivity is not declared in the manifest",
        )
    }

    private fun verifyHaptics(dexFiles: List<DexFile>) {
        val classes = dexFiles.flatMap { it.classes }
        assertTrue(classes.any { it.type == HAPTICS_HOOK }, "Haptics extension class was not merged")

        fun callers(owner: String, name: String) = classes
            .filter { it.type != HAPTICS_HOOK }
            .flatMap { classDef -> classDef.methods.map { classDef to it } }
            .filter { (_, method) -> calls(method).any { it.isCall(owner, name) } }

        // Compose's click elements pass their callbacks through the extension in the constructor.
        val click = callers(HAPTICS_HOOK, "wrapClick").map { it.first.type to it.second.name }
        assertEquals(
            listOf(
                "Landroidx/compose/foundation/ClickableElement;" to "<init>",
                "Landroidx/compose/foundation/CombinedClickableElement;" to "<init>",
            ),
            click.sortedBy { it.first },
            "Unexpected callers of wrapClick",
        )
        val longClick = callers(HAPTICS_HOOK, "wrapLongClick")
        assertEquals(
            listOf("Landroidx/compose/foundation/CombinedClickableElement;"),
            longClick.map { it.first.type },
            "Unexpected callers of wrapLongClick",
        )
        val refresh = callers(HAPTICS_HOOK, "onSpinner")
        assertEquals(
            listOf("Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;"),
            refresh.map { it.first.type },
            "Unexpected callers of onSpinner",
        )

        // The bottom bar view overrides dispatchTouchEvent to widen the tab touch area.
        val touch = callers(BOTTOM_TABS_HOOK, "beforeTouch")
        assertEquals(1, touch.size, "Expected one bar calling beforeTouch")
        assertEquals("dispatchTouchEvent", touch.single().second.name)
        assertTrue(
            calls(touch.single().second).any { it.isCall(BOTTOM_TABS_HOOK, "afterTouch") },
            "The touch position is not restored",
        )
        assertEquals(
            touch.single().first.type,
            callers(BOTTOM_TABS_HOOK, "filterTabs").single().first.type,
            "The touch override and the tab filter are in different classes",
        )
    }

    private fun verifyMonetTheme(apk: File) {
        val dump = aapt2("dump", "resources", apk.absolutePath)
        listOf(
            "bg_secondary_day" to "system_neutral2_50",
            "bg_secondary_night" to "system_neutral2_800",
            "button_primary_day" to "system_accent1_600",
            "button_primary_night" to "system_accent1_200",
        ).forEach { (name, systemColor) ->
            val block = Regex("""resource\s+\S+\s+color/$name\s*\r?\n((?:\s+\(.*\r?\n)+)""").find(dump)
                ?.groupValues?.get(1)
                ?: throw AssertionError("Color $name not found in the patched resources")
            val id = "@0x%08x".format(androidColorId(systemColor))
            assertTrue(
                Regex("""\(v31\)\s+(@android:color/$systemColor\b|$id\b)""").containsMatchIn(block),
                "$name has no v31 override to @android:color/$systemColor ($id):\n$block",
            )
            assertTrue(Regex("""^\s+\(\)\s+#""", RegexOption.MULTILINE).containsMatchIn(block), "$name lost its stock value")
        }

        // The page background stays stock black / white.
        listOf("bg_primary_day", "bg_primary_night", "ui_kit_surface_one_night").forEach { name ->
            val block = Regex("""resource\s+\S+\s+color/$name\s*\r?\n((?:\s+\(.*\r?\n)+)""").find(dump)
                ?.groupValues?.get(1) ?: throw AssertionError("Color $name not found")
            assertFalse(block.contains("(v31)"), "$name must keep its stock value:\n$block")
        }
    }

    private fun verifyWaveButtonColors(dexFiles: List<DexFile>) {
        val sites = dexFiles.flatMap { it.classes }.flatMap { classDef ->
            classDef.methods.filter { method ->
                calls(method).any { it.isCall(MONET_COLORS, "waveButtonColor") }
            }
        }
        assertEquals(1, sites.size, "Expected one My Vibe agent mapper calling waveButtonColor")
    }

    private fun verifyThemeLogoColor(dexFiles: List<DexFile>, apk: File) {
        val dump = aapt2("dump", "resources", apk.absolutePath)
        fun color(name: String): Long =
            Regex("""resource\s+0x([0-9a-f]+)\s+color/$name\s*\r?\n""").find(dump)
                ?.groupValues?.get(1)?.toLong(16)
                ?: throw AssertionError("Color $name not found in the patched resources")

        // The Compose theme builder reads every themed color; it now reads icon_accent where the
        // stock app reads icon_logo (the full player's play button and other accents).
        val guards = listOf("button_primary_day", "button_primary_disabled_day", "bg_placeholder_day", "icon_accent_day")
            .map(::color)
        val builders = dexFiles.flatMap { it.classes }.flatMap { it.methods }.filter { method ->
            val literals = method.implementation?.instructions
                ?.mapNotNullTo(mutableSetOf()) { (it as? WideLiteralInstruction)?.wideLiteral }
                ?: return@filter false
            literals.containsAll(guards)
        }
        assertEquals(1, builders.size, "Expected one Compose theme color builder")
        val literals = builders.single().implementation!!.instructions
            .mapNotNull { (it as? WideLiteralInstruction)?.wideLiteral }
        assertEquals(2, literals.count { it == color("icon_accent_day") }, "Theme logo color does not use icon_accent_day")
        assertEquals(2, literals.count { it == color("icon_accent_night") }, "Theme logo color does not use icon_accent_night")
        assertFalse(literals.contains(color("icon_logo_day")), "Theme still reads icon_logo_day")
        assertFalse(literals.contains(color("icon_logo_night")), "Theme still reads icon_logo_night")
    }

    /** Resource id of a framework color, read from the SDK's android.jar. */
    private fun androidColorId(name: String): Int {
        val sdk = listOfNotNull(System.getenv("ANDROID_HOME"), System.getenv("ANDROID_SDK_ROOT"))
            .map(::File).first { it.isDirectory }
        val androidJar = File(sdk, "platforms").listFiles()
            ?.filter { File(it, "android.jar").isFile }
            ?.maxByOrNull { it.name.removePrefix("android-").toIntOrNull() ?: 0 }
            ?.let { File(it, "android.jar") }
            ?: throw AssertionError("android.jar was not found under $sdk/platforms")
        java.net.URLClassLoader(arrayOf(androidJar.toURI().toURL()), null).use { loader ->
            return loader.loadClass("android.R\$color").getField(name).getInt(null)
        }
    }

    private fun aapt2(vararg arguments: String): String {
        val process = ProcessBuilder(listOf(resolveAapt2().absolutePath) + arguments)
            .redirectErrorStream(true)
            .start()
        val output = process.inputStream.bufferedReader().use { it.readText() }
        assertEquals(0, process.waitFor(), "aapt2 ${arguments.first()} failed")
        return output
    }

    private fun verifyLyricsFallback(dexFiles: List<DexFile>) {
        val classes = dexFiles.flatMap { it.classes }
        assertTrue(
            classes.any { it.type == LRCLIB_EXTENSION },
            "LRCLIB extension class was not merged",
        )
        assertTrue(
            classes.any { it.type == "Lapp/nyandex/extension/yandexmusic/lyrics/LrcLibCore;" },
            "LRCLIB core class was not merged",
        )

        fun MethodReference.isCall(owner: String, name: String) = definingClass == owner && this.name == name
        fun calls(method: com.android.tools.smali.dexlib2.iface.Method) =
            method.implementation?.instructions?.mapNotNull {
                (it as? ReferenceInstruction)?.reference as? MethodReference
            }.orEmpty()

        // Track model: a static helper hands id/title/duration/artists to the extension and marks
        // the track as having lyrics, and the constructor calls it.
        val track = classes.single { classDef ->
            classDef.methods.any { method -> method.name == "nyandexRememberLyricsTrack" }
        }
        val remember = track.methods.single { it.name == "nyandexRememberLyricsTrack" }
        assertTrue(
            calls(remember).any { it.isCall(LRCLIB_EXTENSION, "rememberTrack") },
            "Track helper does not call rememberTrack",
        )
        assertTrue(
            calls(remember).any { it.name == "<init>" && it.parameterTypes.map(Any::toString) == listOf("Z", "Z") },
            "Track helper does not build the lyrics availability",
        )
        assertTrue(
            remember.implementation!!.instructions.any { instruction ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                instruction.opcode == Opcode.IPUT_OBJECT && field?.definingClass == track.type
            },
            "Track helper does not store the lyrics availability",
        )
        assertTrue(
            track.methods.filter { it.name == "<init>" }.any { constructor ->
                calls(constructor).any { it.isCall(track.type, "nyandexRememberLyricsTrack") }
            },
            "Track constructor does not call the lyrics helper",
        )

        // Lyrics repository: the download method returns the LRCLIB helper's result right away.
        val repository = classes.single { classDef ->
            classDef.methods.any { it.name == "nyandexLrcLibLyrics" }
        }
        val helper = repository.methods.single { it.name == "nyandexLrcLibLyrics" }
        assertTrue(
            calls(helper).any { it.isCall(LRCLIB_EXTENSION, "lyrics") },
            "Lyrics helper does not call the LRCLIB extension",
        )
        // Entry helper: the extension may load in the background (main-thread callers), else the
        // LRCLIB result helper answers right away.
        val entry = repository.methods.single { it.name == "nyandexLyricsEntry" }
        assertTrue(calls(entry).any { it.isCall(LRCLIB_EXTENSION, "lyricsAsync") }, "Entry does not try the async path")
        assertTrue(calls(entry).any { it.isCall(repository.type, "nyandexLrcLibLyrics") }, "Entry does not build the result")
        assertTrue(
            entry.implementation!!.instructions.any { instruction ->
                instruction.opcode == Opcode.SGET_OBJECT &&
                    ((instruction as ReferenceInstruction).reference as FieldReference).let { field ->
                        classes.single { it.type == field.definingClass }.methods.any { method ->
                            method.implementation?.instructions?.any {
                                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "COROUTINE_SUSPENDED"
                            } == true
                        }
                    }
            },
            "Entry does not return the COROUTINE_SUSPENDED marker",
        )

        val callers = repository.methods.filter { method ->
            calls(method).any { it.isCall(repository.type, "nyandexLyricsEntry") }
        }
        assertEquals(1, callers.size, "Expected exactly one call site of the lyrics entry helper")
        val download = callers.single().implementation!!.instructions.toList()
        assertEquals(
            listOf(
                Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16,
                Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT,
            ),
            download.take(6).map { it.opcode },
            "The download method does not return the entry helper's result first",
        )

        // Lyric view report: returns success before reaching the Yandex API.
        val views = repository.methods.single { method ->
            calls(method).any { reference ->
                reference.definingClass == "Lcom/yandex/music/shared/lyrics/LyricsHttpApi;" &&
                    reference.parameterTypes.size == 1 &&
                    reference.parameterTypes[0].toString() != "Ljava/lang/String;"
            }
        }
        assertEquals(
            listOf(Opcode.SGET_OBJECT, Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.RETURN_OBJECT),
            views.implementation!!.instructions.take(4).map { it.opcode },
            "The lyric views report is not disabled",
        )
    }

    private fun verifyLyricsPrefetch(dexFiles: List<DexFile>) {
        val classes = dexFiles.flatMap { it.classes }
        fun calls(method: com.android.tools.smali.dexlib2.iface.Method) =
            method.implementation?.instructions?.mapNotNull {
                (it as? ReferenceInstruction)?.reference as? MethodReference
            }.orEmpty()

        val track = classes.single { classDef -> classDef.methods.any { it.name == "nyandexPrefetchNextLyrics" } }
        val helper = track.methods.single { it.name == "nyandexPrefetchNextLyrics" }
        assertTrue(
            calls(helper).any { it.definingClass == LRCLIB_EXTENSION && it.name == "prefetch" },
            "Prefetch helper does not call the LRCLIB extension",
        )
        assertTrue(
            track.methods.any { it.name == "nyandexRememberLyricsTrack" },
            "Prefetch helper is not on the track model",
        )

        // Exactly one static queue helper hands its result to the prefetch helper, right before returning.
        val callers = classes.flatMap { classDef ->
            classDef.methods.filter { method ->
                calls(method).any { it.definingClass == track.type && it.name == "nyandexPrefetchNextLyrics" }
            }
        }
        assertEquals(1, callers.size, "Expected one next-queue-item helper calling the prefetch helper")
        val instructions = callers.single().implementation!!.instructions.toList()
        assertEquals(Opcode.RETURN_OBJECT, instructions.last().opcode)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, instructions[instructions.size - 2].opcode)
        assertEquals(
            (instructions.last() as OneRegisterInstruction).registerA,
            (instructions[instructions.size - 2] as com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction).startRegister,
            "The prefetch helper does not receive the returned queue item",
        )
    }

    private fun verifyTrackCacheRow(dexFiles: List<DexFile>) {
        val classes = dexFiles.flatMap { it.classes }
        fun calls(method: com.android.tools.smali.dexlib2.iface.Method) =
            method.implementation?.instructions?.mapNotNull {
                (it as? ReferenceInstruction)?.reference as? MethodReference
            }.orEmpty()

        val row = classes.single { classDef -> classDef.methods.any { it.name == "nyandexLyricsCacheRow" } }
        assertTrue(
            row.methods.any { method ->
                method.name == "toString" && method.implementation!!.instructions.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "TrackCacheRow(trackId="
                }
            },
            "The lyrics cache row helper is not on the track cache row",
        )
        val helper = row.methods.single { it.name == "nyandexLyricsCacheRow" }
        assertTrue(
            calls(helper).any { it.definingClass == LRCLIB_EXTENSION && it.name == "cacheRow" },
            "Cache row helper does not call the LRCLIB extension",
        )
        val constructors = row.methods.filter { method ->
            method.name == "<init>" && calls(method).any { it.definingClass == row.type && it.name == "nyandexLyricsCacheRow" }
        }
        assertEquals(1, constructors.size, "Expected one track cache row constructor calling the helper")
    }

    private fun verifyShareLinks(dexFiles: List<DexFile>) {
        val classes = dexFiles.flatMap { it.classes }
        assertTrue(classes.any { it.type == SHARE_LINKS }, "Share links extension class was not merged")
        val callers = classes.flatMap { classDef ->
            classDef.methods.filter { method ->
                method.implementation?.instructions?.any { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.definingClass == SHARE_LINKS && reference.name == "clean"
                } == true
            }
        }
        assertEquals(1, callers.size, "Expected one share link builder calling ShareLinks.clean")
        val instructions = callers.single().implementation!!.instructions.toList()
        val clean = instructions.indexOfFirst { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == SHARE_LINKS
        }
        val toString = (instructions[clean - 2] as ReferenceInstruction).reference as MethodReference
        assertEquals("toString", toString.name, "ShareLinks.clean does not follow the link's toString()")
        assertEquals(Opcode.MOVE_RESULT_OBJECT, instructions[clean + 1].opcode)
        val register = (instructions[clean + 1] as OneRegisterInstruction).registerA
        assertEquals(register, (instructions[clean - 1] as OneRegisterInstruction).registerA)
        assertTrue(
            instructions.drop(clean + 2).any { it.opcode == Opcode.RETURN_OBJECT && (it as OneRegisterInstruction).registerA == register },
            "The cleaned link is not what the builder returns",
        )
    }

    private fun extractDexFiles(apk: File): List<DexFile> {
        val directory = Files.createTempDirectory("ym-patched-dex").toFile()
        ZipFile(apk).use { zip ->
            zip.entries().asSequence()
                .filter { it.name.matches(Regex("classes\\d*\\.dex")) }
                .forEach { entry ->
                    val dexFile = File(directory, entry.name)
                    zip.getInputStream(entry).use { input ->
                        dexFile.outputStream().use { output -> input.copyTo(output) }
                    }
                }
        }

        return directory.listFiles { file -> file.extension == "dex" }
            .orEmpty()
            .sortedBy { it.name }
            .map { file -> DexFileFactory.loadDexFile(file, Opcodes.getDefault()) }
    }

    private fun verifyVuTriggerAnnotations(dexFiles: List<DexFile>) {
        val triggerApi = dexFiles.asSequence()
            .flatMap { it.classes.asSequence() }
            .firstOrNull { it.type == "Lcom/yandex/music/shared/bdu/trigger/network/TriggerApi;" }
            ?: throw AssertionError("TriggerApi class was not found")

        val annotations = triggerApi.methods.flatMap { method ->
            method.annotations.flatMap { it.stringValues() }
        }
        assertEquals(
            3,
            annotations.count { it == "127.0.0.1" },
            "Expected three redirected v2 trigger annotations",
        )
    }

    private fun verifyFirebaseCertificate(dexFiles: List<DexFile>) {
        val method = dexFiles.asSequence()
            .flatMap { it.classes.asSequence() }
            .flatMap { classDef -> classDef.methods.asSequence() }
            .firstOrNull { candidate ->
                candidate.implementation?.instructions?.any { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference
                    reference is StringReference && reference.string == "X-Android-Cert"
                } == true
            }
            ?: throw AssertionError("Firebase Installations request method was not found")

        val instructions = method.implementation?.instructions?.toList() ?: emptyList()
        val index = instructions.indexOfFirst {
            val reference = (it as? ReferenceInstruction)?.reference
            reference is StringReference && reference.string == STOCK_CERT_SHA1
        }
        assertTrue(index >= 0, "Stock certificate fingerprint was not found")

        val certificate = instructions[index] as OneRegisterInstruction
        val call = instructions.getOrNull(index + 1)
        assertEquals(Opcode.INVOKE_VIRTUAL, call?.opcode, "Fingerprint is not followed by addRequestProperty")
        val methodReference = (call as? ReferenceInstruction)?.reference as? MethodReference
        assertEquals("Ljava/net/URLConnection;", methodReference?.definingClass)
        assertEquals("addRequestProperty", methodReference?.name)
        assertEquals(
            certificate.registerA,
            (call as FiveRegisterInstruction).registerE,
            "Fingerprint is not passed as the third addRequestProperty argument",
        )
    }

    private fun verifyPassportAccountType(dexFiles: List<DexFile>, apk: File) {
        val strings = dexFiles.flatMap { dex ->
            dex.classes.flatMap { classDef ->
                classDef.methods.flatMap { method ->
                    (method.implementation?.instructions ?: emptyList()).mapNotNull { instruction ->
                        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                    }
                }
            }
        }

        val fieldStrings = dexFiles.flatMap { dex ->
            dex.classes.flatMap { classDef ->
                classDef.staticFields.mapNotNull { field ->
                    (field.initialValue as? StringEncodedValue)?.value
                }
            }
        }
        val allStrings = strings + fieldStrings

        assertFalse(
            allStrings.any { it == STOCK_ACCOUNT_TYPE },
            "The stock Passport account type is still used by DEX instructions or static fields",
        )
        assertTrue(
            allStrings.any { it == ISOLATED_ACCOUNT_TYPE },
            "The isolated Passport account type was not written to DEX",
        )

        val aapt2 = resolveAapt2()
        val process = ProcessBuilder(aapt2.absolutePath, "dump", "resources", apk.absolutePath)
            .redirectErrorStream(true)
            .start()
        val dump = process.inputStream.bufferedReader().use { it.readText() }
        assertEquals(0, process.waitFor(), "aapt2 dump resources failed")

        val value = Regex(
            """resource\s+\S+\s+string/passport_account_type\s*\r?\n\s*\(\)\s+"([^"]*)"""",
        ).find(dump)?.groupValues?.get(1)

        assertEquals(
            ISOLATED_ACCOUNT_TYPE,
            value,
            "passport_account_type resource was not renamed",
        )

        // Another Yandex app owns this signature permission on most devices, and redeclaring it
        // fails the install with INSTALL_FAILED_DUPLICATE_PERMISSION.
        val manifest = aapt2("dump", "xmltree", "--file", "AndroidManifest.xml", apk.absolutePath)
        val declaresReadCredentials = Regex(
            """E: permission \(line=\d+\)(?:\r?\n\s+A: [^\n]*)*?\r?\n\s+A: [^\n]*android:name[^\n]*"com\.yandex\.permission\.READ_CREDENTIALS"""",
        ).containsMatchIn(manifest)
        assertFalse(declaresReadCredentials, "com.yandex.permission.READ_CREDENTIALS is still declared")
        assertTrue(
            manifest.contains("\"com.yandex.permission.AM_COMMUNICATION\""),
            "The AM_COMMUNICATION request the Passport library checks for was removed",
        )
    }

    private fun resolveAapt2(): File {
        val sdk = listOfNotNull(
            System.getenv("ANDROID_HOME"),
            System.getenv("ANDROID_SDK_ROOT"),
            System.getenv("ANDROID_SDK"),
        ).map(::File).firstOrNull { it.isDirectory }
            ?: throw AssertionError("Android SDK location is not set")

        val buildTools = File(sdk, "build-tools")
        return buildTools.listFiles()
            ?.filter { it.isDirectory }
            ?.sortedByDescending { it.name }
            ?.map { File(it, "aapt2") }
            ?.firstOrNull { it.isFile }
            ?: throw AssertionError("aapt2 was not found under $buildTools")
    }
}

private fun Annotation.stringValues(): List<String> = elements.mapNotNull { element ->
    (element.value as? StringEncodedValue)?.value
}
