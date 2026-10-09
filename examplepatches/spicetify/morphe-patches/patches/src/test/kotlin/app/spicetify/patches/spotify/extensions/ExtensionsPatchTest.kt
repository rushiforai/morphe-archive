package app.spicetify.patches.spotify.extensions

import app.spicetify.patches.spotify.home.homePinsPatch
import app.spicetify.patches.spotify.settings.settingsPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertNull
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test
import java.io.File
import java.util.Properties

private const val PROVIDED = "Lcom/spotify/casita/v1/resolved/Provided;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private const val BUTTON = "Landroidx/appcompat/widget/AppCompatImageButton;"
private const val LIST = "Ljava/util/List;"

class ExtensionsPatchTest {
    /** Each class the extensions patch changes: H1, T1, T2, A, B, N1, M1 and P1 to P6. */
    private val changed = setOf("Lcom/spotify/cosmos/sharedcosmosrouterservice/SharedCosmosRouterService;",
        "Lp/b9p0;", "Lp/lr5;", "Lp/qrl;", "Lp/a4v;", "Lp/xkp;", "Lp/sv70;",
        "Lp/mz1;", PROVIDED, "Lp/xqw;", "Lp/bzw0;", "Lp/ipy;", "Lp/b90;")

    @Test
    fun `changes no class another patch pins with a digest`() {
        // Patches run in name order, and each compares its pinned classes before it changes anything. A
        // class this patch changes and another pins would make that one refuse whenever it ran second.
        val snapshots = File("src/main/resources").walk()
            .filter { it.extension == "properties" && it.parentFile.name != "extensions" }.toList()
        assertTrue(snapshots.any { it.parentFile.name == "localfiles" }, "no snapshots found in $snapshots")
        val pinned = snapshots.flatMap { file -> Properties().apply { file.inputStream().use(::load) }.stringPropertyNames() }
        assertEquals(emptySet<String>(), changed intersect pinned.toSet())
    }

    @Test
    fun `reports each field number that changed`() {
        val apk = mapOf("A#X" to 1, "A#Y" to 3)
        assertEquals(listOf("A#Y expected 2, found 3"),
            fieldNumberMismatches(mapOf("A#X" to 1, "A#Y" to 2), apk::get))
    }

    @Test
    fun `reports a field whose class is missing`() {
        assertEquals(listOf("A#X missing"), fieldNumberMismatches(mapOf("A#X" to 1)) { null })
    }

    @Test
    fun `the extensions and Home pins both get the player bridge from one shared patch`() {
        assertTrue(playerBridgePatch in extensionsPatch.dependencies)
        assertTrue(playerBridgePatch in homePinsPatch.dependencies)
        // H1 calls into the extension, which the settings patch merges.
        assertTrue(settingsPatch in playerBridgePatch.dependencies)
        assertNull(playerBridgePatch.name, "internal, so Manager never lists it")
    }

    @Test
    fun `the protocol check covers the names and covers the Home pins picker reads`() {
        val info = "Lspotify/your_library/proto/YourLibraryDecoratedEntityOuterClass\$YourLibraryEntityInfo;#"
        assertEquals(mapOf("NAME" to 2, "URI" to 3, "IMAGE_URI" to 6),
            esperantoFieldNumbers.filterKeys { it.startsWith(info) }
                .mapKeys { it.key.removePrefix(info).removeSuffix("_FIELD_NUMBER") })
    }

    @Test
    fun `the protocol check covers every field of the Your Library request`() {
        val header = "Lspotify/your_library/esperanto/proto/YourLibraryRequestHeader;#"
        assertEquals(mapOf("LENGTH" to 12, "FILTERS" to 14, "ALL_PLAYLISTS" to 17, "NUM_LINK_TYPES_IN_PLAYLISTS" to 25,
            "IGNORE_PINNING" to 26),
            esperantoFieldNumbers.filterKeys { it.startsWith(header) }
                .mapKeys { it.key.removePrefix(header).removeSuffix("_FIELD_NUMBER") })
    }

    @Test
    fun `hooks the return that follows initializeScheduling`() {
        assertEquals(2, bridgeHookIndex(listOf(schedule, schedule, returnVoid)))
    }

    @Test
    fun `refuses a constructor whose ending changed`() {
        assertNull(bridgeHookIndex(listOf(returnVoid)))
        assertNull(bridgeHookIndex(listOf(schedule, returnVoid, schedule, returnVoid)))
        assertNull(bridgeHookIndex(listOf(invoke(Opcode.INVOKE_DIRECT), returnVoid)))
        assertNull(bridgeHookIndex(listOf(invoke(Opcode.INVOKE_VIRTUAL, "shutdown"), returnVoid)))
        assertNull(bridgeHookIndex(listOf(invoke(Opcode.INVOKE_VIRTUAL, owner = "Lp/other;"), returnVoid)))
    }

    @Test
    fun `accepts the menu model the menu hooks insert before`() {
        assertTrue(isMenuModel(type(Opcode.NEW_INSTANCE, 1, "Lp/krj;")))
    }

    @Test
    fun `refuses any other instruction at a menu hook`() {
        assertFalse(isMenuModel(null))
        assertFalse(isMenuModel(type(Opcode.NEW_INSTANCE, 2, "Lp/krj;")))
        assertFalse(isMenuModel(type(Opcode.NEW_INSTANCE, 1, "Lp/other;")))
        assertFalse(isMenuModel(type(Opcode.CONST_CLASS, 1, "Lp/krj;")))
        assertFalse(isMenuModel(returnVoid))
    }

    @Test
    fun `accepts the copy of Home's chips that A goes in before`() {
        assertTrue(isChipsCopy(listOf(chips(1), copy(2)), 1))
    }

    @Test
    fun `refuses any other place for A`() {
        val site = listOf(chips(1), copy(2))
        assertFalse(isChipsCopy(site, 0))
        assertFalse(isChipsCopy(site, 2))
        assertFalse(isChipsCopy(listOf(chips(0), copy(2)), 1))
        assertFalse(isChipsCopy(listOf(ImmutableInstruction11x(Opcode.MOVE_RESULT, 1), copy(2)), 1))
        assertFalse(isChipsCopy(listOf(chips(1), copy(1)), 1))
        assertFalse(isChipsCopy(listOf(chips(1), type(Opcode.NEW_INSTANCE, 2, "Ljava/util/LinkedList;")), 1))
        assertFalse(isChipsCopy(listOf(chips(1), type(Opcode.CONST_CLASS, 2, ARRAY_LIST)), 1))
    }

    @Test
    fun `accepts the send of a chip tap that B goes in before, and the return B skips to`() {
        assertTrue(isChipTapSend(listOf(sendTap(3, 2), returnObject(13)), 0, 1))
    }

    @Test
    fun `refuses any other place for B`() {
        val site = listOf(sendTap(3, 2), returnObject(13))
        assertFalse(isChipTapSend(site, 1, 1))
        assertFalse(isChipTapSend(site, 0, 0))
        assertFalse(isChipTapSend(site, 0, 2))
        assertFalse(isChipTapSend(listOf(sendTap(2, 3), returnObject(13)), 0, 1))
        assertFalse(isChipTapSend(listOf(sendTap(1, 2), returnObject(13)), 0, 1))
        assertFalse(isChipTapSend(listOf(sendTap(3, 1), returnObject(13)), 0, 1))
        assertFalse(isChipTapSend(listOf(sendTap(3, 2, "b"), returnObject(13)), 0, 1))
        assertFalse(isChipTapSend(listOf(sendTap(3, 2, opcode = Opcode.INVOKE_INTERFACE), returnObject(13)), 0, 1))
        assertFalse(isChipTapSend(listOf(sendTap(3, 2), returnObject(12)), 0, 1))
        assertFalse(isChipTapSend(listOf(sendTap(3, 2), ImmutableInstruction11x(Opcode.THROW, 13)), 0, 1))
        assertFalse(isChipTapSend(listOf(sendTap(3, 2), returnVoid), 0, 1))
    }

    @Test
    fun `accepts the end of the shuffle button's constructor that N1 goes in before`() {
        assertTrue(isShuffleButtonEnd(listOf(storeButton(2, 4), returnVoid), 1))
    }

    @Test
    fun `refuses any other end of the shuffle button's constructor`() {
        val end = listOf(storeButton(2, 4), returnVoid)
        assertFalse(isShuffleButtonEnd(end, 0))
        assertFalse(isShuffleButtonEnd(end, 2))
        assertFalse(isShuffleButtonEnd(listOf(storeButton(3, 4), returnVoid), 1))
        assertFalse(isShuffleButtonEnd(listOf(storeButton(2, 5), returnVoid), 1))
        assertFalse(isShuffleButtonEnd(listOf(field(Opcode.IPUT_OBJECT, 2, 4, "Lp/xkp;", "h", BUTTON), returnVoid), 1))
        assertFalse(isShuffleButtonEnd(listOf(field(Opcode.IGET_OBJECT, 2, 4, "Lp/xkp;", "i", BUTTON), returnVoid), 1))
        assertFalse(isShuffleButtonEnd(listOf(storeButton(2, 4), returnObject(2)), 1))
    }

    @Test
    fun `accepts the store of the list menu's item providers that M1 goes in before`() {
        assertTrue(isItemProvidersStore(storeProviders(4, 0)))
    }

    @Test
    fun `refuses any other instruction where M1 goes`() {
        assertFalse(isItemProvidersStore(null))
        assertFalse(isItemProvidersStore(storeProviders(3, 0)))
        assertFalse(isItemProvidersStore(storeProviders(4, 1)))
        assertFalse(isItemProvidersStore(field(Opcode.IPUT_OBJECT, 4, 0, "Lp/sv70;", "c", LIST)))
        assertFalse(isItemProvidersStore(field(Opcode.IGET_OBJECT, 4, 0, "Lp/sv70;", "d", LIST)))
        assertFalse(isItemProvidersStore(returnVoid))
    }

    /** `iput-object v[value], v[instance], Lp/sv70;->d`, the list menu's constructor storing its item providers. */
    private fun storeProviders(value: Int, instance: Int) = field(Opcode.IPUT_OBJECT, value, instance, "Lp/sv70;", "d", LIST)

    /** `iput-object v[value], v[instance], Lp/xkp;->i`, the shuffle button's constructor storing its button. */
    private fun storeButton(value: Int, instance: Int) = field(Opcode.IPUT_OBJECT, value, instance, "Lp/xkp;", "i", BUTTON)

    private fun field(opcode: Opcode, value: Int, instance: Int, owner: String, name: String, type: String) =
        ImmutableInstruction22c(opcode, value, instance, ImmutableFieldReference(owner, name, type))

    /** `move-result-object v[register]`, which takes `Lp/xqw;->a`'s chips in Home's feed mapping. */
    private fun chips(register: Int) = ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, register)

    /** `new-instance v[register], ArrayList`, the copy of the chips that follows. */
    private fun copy(register: Int) = type(Opcode.NEW_INSTANCE, register, ARRAY_LIST)

    private fun returnObject(register: Int) = ImmutableInstruction11x(Opcode.RETURN_OBJECT, register)

    /** `invoke-virtual {v[loop], v[event]}, Lp/bay;->[name]`, which sends a chip tap's event to Home's loop. */
    private fun sendTap(loop: Int, event: Int, name: String = "invoke", opcode: Opcode = Opcode.INVOKE_VIRTUAL) =
        ImmutableInstruction35c(opcode, 2, loop, event, 0, 0, 0,
            ImmutableMethodReference("Lp/bay;", name, listOf("Ljava/lang/Object;"), "Ljava/lang/Object;"))

    @Test
    fun `accepts the instruction a Hide podcasts hook expects at its index`() {
        val section = "Lcom/spotify/casita/v1/resolved/Section;"
        val mapSection = ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 4, 5, 0, 0, 0,
            ImmutableMethodReference("Lp/mz1;", "O", listOf(section), "Lp/n920;"))
        assertTrue(isHookSite(mapSection, Opcode.INVOKE_VIRTUAL, "Lp/mz1;->O($section)Lp/n920;"))
        assertTrue(isHookSite(type(Opcode.NEW_INSTANCE, 0, ARRAY_LIST), Opcode.NEW_INSTANCE, ARRAY_LIST))
        assertTrue(isHookSite(ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 46), Opcode.MOVE_OBJECT_FROM16))
        assertTrue(isHookSite(field(Opcode.IPUT_OBJECT, 1, 0, "Lp/ipy;", "a", ARRAY_LIST),
            Opcode.IPUT_OBJECT, "Lp/ipy;->a:$ARRAY_LIST"))
    }

    @Test
    fun `refuses any other instruction at a Hide podcasts hook`() {
        assertFalse(isHookSite(null, Opcode.MOVE_OBJECT_FROM16))
        assertFalse(isHookSite(returnVoid, Opcode.MOVE_OBJECT_FROM16))
        assertFalse(isHookSite(type(Opcode.NEW_INSTANCE, 0, "Ljava/util/LinkedList;"), Opcode.NEW_INSTANCE, ARRAY_LIST))
        assertFalse(isHookSite(type(Opcode.CONST_CLASS, 0, ARRAY_LIST), Opcode.NEW_INSTANCE, ARRAY_LIST))
        assertFalse(isHookSite(type(Opcode.NEW_INSTANCE, 0, ARRAY_LIST), Opcode.NEW_INSTANCE))
        assertFalse(isHookSite(field(Opcode.IPUT_OBJECT, 1, 0, "Lp/ipy;", "b", ARRAY_LIST),
            Opcode.IPUT_OBJECT, "Lp/ipy;->a:$ARRAY_LIST"))
    }

    @Test
    fun `accepts the items getter P2 hooks`() {
        assertTrue(isItemsGetter(listOf(items(0), returnObject(0))))
    }

    @Test
    fun `refuses an items getter of any other shape`() {
        assertFalse(isItemsGetter(listOf(items(0))))
        assertFalse(isItemsGetter(listOf(items(0), returnObject(0), returnObject(0))))
        assertFalse(isItemsGetter(listOf(returnObject(0), items(0))))
        assertFalse(isItemsGetter(listOf(items(1), returnObject(1))))
        assertFalse(isItemsGetter(listOf(items(0), returnObject(1))))
        assertFalse(isItemsGetter(listOf(items(0), ImmutableInstruction11x(Opcode.THROW, 0))))
        assertFalse(isItemsGetter(listOf(field(Opcode.IGET_OBJECT, 0, 1, PROVIDED, "other_", "Lp/ih40;"), returnObject(0))))
    }

    /** `iget-object v[register], v1, Provided;->items_`, v1 being `this` in the two-register getter. */
    private fun items(register: Int) = field(Opcode.IGET_OBJECT, register, 1, PROVIDED, "items_", "Lp/ih40;")

    private fun type(opcode: Opcode, register: Int, type: String) =
        ImmutableInstruction21c(opcode, register, ImmutableTypeReference(type))

    private val returnVoid = ImmutableInstruction10x(Opcode.RETURN_VOID)
    private val schedule = invoke(Opcode.INVOKE_VIRTUAL)

    private fun invoke(
        opcode: Opcode,
        name: String = "initializeScheduling",
        owner: String = "Lcom/spotify/cosmos/cosmosimpl/NativeRouter;",
    ) = ImmutableInstruction35c(opcode, 2, 3, 0, 0, 0, 0,
        ImmutableMethodReference(owner, name, listOf("Lcom/spotify/cosmos/cosmosimpl/Scheduler;"), "V"))
}
