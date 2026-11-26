package app.hushmessenger.patches

import app.hushmessenger.patches.controls.AI_USER_ROUTE
import app.hushmessenger.patches.controls.AUTO_REPLY_PICTURES
import app.hushmessenger.patches.controls.AUTO_REPLY_PICTURE_MESSAGES
import app.hushmessenger.patches.controls.AUTO_REPLY_SEND_MESSAGE
import app.hushmessenger.patches.controls.BUNDLED_CONTROLS
import app.hushmessenger.patches.controls.HIDDEN_CHAT_ROUTE
import app.hushmessenger.patches.controls.INBOX_REFRESH_ROUTE
import app.hushmessenger.patches.controls.JOINED_COMMUNITY_ROW
import app.hushmessenger.patches.controls.LEGACY_SECTION
import app.hushmessenger.patches.controls.LOGOUT_ROUTE
import app.hushmessenger.patches.controls.MAIN_INBOX_SCOPE
import app.hushmessenger.patches.controls.MARK_READ_BUILD
import app.hushmessenger.patches.controls.MARK_READ_BUTTON_BUILD
import app.hushmessenger.patches.controls.MESSAGE_LOG_BUTTON_BUILD
import app.hushmessenger.patches.controls.MESSAGE_LOG_BUTTON_ID_OF
import app.hushmessenger.patches.controls.NATIVE_BUBBLE_ROUTES
import app.hushmessenger.patches.controls.ORIGINAL_BUILD
import app.hushmessenger.patches.controls.PINNED_CHAT_ROUTE
import app.hushmessenger.patches.controls.SAVE_VOICE_MENU_ADD_ROW
import app.hushmessenger.patches.controls.SAVE_VOICE_MENU_FETCH
import app.hushmessenger.patches.controls.SAVE_VOICE_MENU_FETCH_URI
import app.hushmessenger.patches.controls.SAVE_VOICE_MENU_HELD
import app.hushmessenger.patches.controls.SAVE_VOICE_MENU_IS_VOICE
import app.hushmessenger.patches.controls.SAVE_VOICE_MENU_ROW
import app.hushmessenger.patches.controls.SAVE_VOICE_MENU_ROW_ID
import app.hushmessenger.patches.controls.SAVE_VOICE_MENU_SESSION
import app.hushmessenger.patches.controls.SAVE_VOICE_MENU_SHEET_SESSION
import app.hushmessenger.patches.controls.SAVE_VOICE_MENU_VOICE_URI
import app.hushmessenger.patches.controls.SEARCH_ICON_STUB
import app.hushmessenger.patches.controls.TAB_SWIPE_ROUTE
import app.hushmessenger.patches.controls.collectLifecycle
import app.hushmessenger.patches.controls.hookId
import app.hushmessenger.patches.controls.lifecycleDex
import app.hushmessenger.patches.controls.lifecycleExtension
import app.hushmessenger.patches.misc.GMS_CORE_BUNDLED
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.Patch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.value.ImmutableEncodedValueFactory
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.io.TempDir
import java.io.ByteArrayInputStream
import java.io.File
import java.lang.reflect.Modifier
import java.nio.file.Files
import java.nio.file.Path
import kotlin.io.path.extension
import kotlin.io.path.invariantSeparatorsPathString
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * Patches a real stock build the way a user gets it and checks the extension came through as it was built. A patch that
 * finds code to rewrite by a string or a shape can match the extension's own classes too: the clone's dedup rewrite once
 * turned CloneCompat's names into null and Messenger stopped at launch, with every unit test green, because those tests
 * read the stock dex without the extension. Opt-in patches that scan the whole app run here on top of the defaults.
 */
class WholePatchTest {
    /** The extension stubs default patches fill in with this build's code on purpose. Anything else that differs was rewritten by mistake. */
    private val intendedWrites = setOf(
        BUNDLED_CONTROLS, ORIGINAL_BUILD, LOGOUT_ROUTE, AI_USER_ROUTE, HIDDEN_CHAT_ROUTE, PINNED_CHAT_ROUTE, INBOX_REFRESH_ROUTE,
        TAB_SWIPE_ROUTE, NATIVE_BUBBLE_ROUTES, JOINED_COMMUNITY_ROW, MAIN_INBOX_SCOPE,
        MARK_READ_BUILD, MARK_READ_BUTTON_BUILD, MESSAGE_LOG_BUTTON_BUILD, MESSAGE_LOG_BUTTON_ID_OF,
        SAVE_VOICE_MENU_ADD_ROW, SAVE_VOICE_MENU_FETCH, SAVE_VOICE_MENU_FETCH_URI, SAVE_VOICE_MENU_HELD,
        SAVE_VOICE_MENU_IS_VOICE, SAVE_VOICE_MENU_ROW, SAVE_VOICE_MENU_ROW_ID, SAVE_VOICE_MENU_SESSION,
        SAVE_VOICE_MENU_SHEET_SESSION, SAVE_VOICE_MENU_VOICE_URI,
        AUTO_REPLY_PICTURES, AUTO_REPLY_PICTURE_MESSAGES, AUTO_REPLY_SEND_MESSAGE, LEGACY_SECTION, SEARCH_ICON_STUB,
    )

    @Test fun theDefaultPatchesLeaveTheExtensionAsBuilt(@TempDir temporary: Path) =
        assertExtensionAsBuilt(temporary, patches().filterTo(mutableSetOf()) { it.default }, intendedWrites)

    @Test fun aCloneLeavesTheExtensionAsBuilt(@TempDir temporary: Path) =
        assertExtensionAsBuilt(temporary, withDefaults("Clone install under another package name"), intendedWrites)

    @Test fun gmsCoreAndASpoofedVersionLeaveTheExtensionAsBuilt(@TempDir temporary: Path) =
        assertExtensionAsBuilt(temporary, withDefaults("GmsCore support", "Spoof package version"), intendedWrites + GMS_CORE_BUNDLED)

    private fun assertExtensionAsBuilt(temporary: Path, patches: Set<Patch>, intended: Set<String>) {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apk = File(root!!, "messenger-588.1-347617503.apk")
        assertTrue(apk.isFile, "$apk is missing")
        // The built dex also carries framework classes it was compiled against (android/speech/RecognitionSupportCallback),
        // which aren't the extension's own code.
        val built = DexBackedDexFile.fromInputStream(Opcodes.forApi(35), ByteArrayInputStream(lifecycleExtension())).classes
            .filter { it.isExtension() }.associateBy { it.type }
        Patcher(PatcherConfig(apk, temporary.resolve("patcher").toFile())).use { patcher ->
            patcher += patches
            val failed = collectLifecycle(patcher).mapNotNull { result ->
                result.exception?.let { "${result.patch.name ?: result.patch}: ${it.stackTraceToString().lines().take(6).joinToString("\n")}" }
            }
            assertEquals(emptyList(), failed, "patches that failed on the stock build")
            val patched = patcher.get().dexFiles.flatMap { file ->
                file.stream.buffered().use { DexBackedDexFile.fromInputStream(Opcodes.forApi(35), it) }.classes.filter { it.isExtension() }
            }.associateBy { it.type }
            assertEquals(built.keys, patched.keys, "extension classes in the patched APK")
            val changed = built.values.flatMap { cls -> changes(cls, patched.getValue(cls.type)) }.sorted()
            assertEquals(intended.sorted(), changed, "extension code that differs from the built extension")
        }
    }

    /** The default patches plus the named opt-in ones, failing if a name no longer exists. */
    private fun withDefaults(vararg names: String): Set<Patch> {
        val all = patches()
        val extra = names.map { name -> all.singleOrNull { it.name == name } ?: error("no patch named $name") }
        assertTrue(extra.none { it.default }, "these are meant to be opt-in: ${names.toList()}")
        return all.filterTo(mutableSetOf()) { it.default } + extra
    }

    /** Every named patch, read from the compiled patch classes the way Morphe reads them from the bundle. */
    private fun patches(): Set<Patch> {
        val classes = Path.of(MessengerTarget::class.java.protectionDomain.codeSource.location.toURI())
        val found = Files.walk(classes).use { files ->
            files.filter { it.extension == "class" }.map { classes.relativize(it).invariantSeparatorsPathString }.toList()
        }.flatMap { file ->
            val type = Class.forName(file.removeSuffix(".class").replace('/', '.'), false, javaClass.classLoader)
            type.declaredMethods.filter {
                Modifier.isStatic(it.modifiers) && Modifier.isPublic(it.modifiers) && it.parameterCount == 0 &&
                    Patch::class.java.isAssignableFrom(it.returnType)
            }.map { it.invoke(null) as Patch }
        }.filter { it.name != null }.toSet()
        assertTrue(found.count { it.default } > 100, "only ${found.count { it.default }} default patches were found")
        return found
    }

    /** What differs between a built class and its patched copy, by method, ignoring debug information. */
    private fun changes(built: ClassDef, patched: ClassDef): List<String> {
        val before = built.methods.associateBy { it.hookId() }
        val after = patched.methods.associateBy { it.hookId() }
        val methods = (before.keys + after.keys).filter { id ->
            val old = before[id]
            val new = after[id]
            old == null || new == null || !old.code().contentEquals(new.code())
        }
        val fields = if (built.staticFields.values() != patched.staticFields.values()) listOf("${built.type} static values") else emptyList()
        return methods + fields
    }

    private fun Iterable<com.android.tools.smali.dexlib2.iface.Field>.values() =
        associate { field -> field.name to field.initialValue?.let { ImmutableEncodedValueFactory.of(it) } }

    /** The method alone, without parameter names or line numbers, in the dex form the patcher writes. */
    private fun Method.code(): ByteArray {
        val implementation = implementation?.let { ImmutableMethodImplementation(it.registerCount, it.instructions, it.tryBlocks, null) }
        val method = ImmutableMethod(definingClass, name, parameters.map { ImmutableMethodParameter(it.type, null, null) },
            returnType, accessFlags, null, null, implementation)
        return lifecycleDex(listOf(ImmutableClassDef(definingClass, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null,
            null, null, listOf(method))))
    }
}
