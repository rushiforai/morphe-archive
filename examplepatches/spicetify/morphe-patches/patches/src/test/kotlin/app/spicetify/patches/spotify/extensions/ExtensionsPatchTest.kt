package app.spicetify.patches.spotify.extensions

import app.spicetify.patches.spotify.home.homePinsPatch
import app.spicetify.patches.spotify.settings.settingsPatch
import com.android.tools.smali.dexlib2.HiddenApiRestriction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.MethodParameter
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.Annotation as DexAnnotation
import com.android.tools.smali.dexlib2.iface.Field as DexField
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
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
private const val OBJECT = "Ljava/lang/Object;"
private const val ROUTER = "Lcom/spotify/cosmos/cosmosimpl/NativeRouter;"
private const val ARTIST = "Lspotify/collection/esperanto/proto/CollectionArtist;"
private const val ARTIST_METADATA = "Lcom/spotify/cosmos/util/proto/ArtistMetadata;"

class ExtensionsPatchTest {
    /** Each class the extensions patch changes: H1, T1, T2, A, B, N1, M1 and P1 to P6. */
    private val changed = setOf("Lp/ggb1;", "Lp/umj1;", "Lp/jz6;", "Lp/xh10;", "Lp/mex;", "Lp/u3u;", "Lp/mve0;",
        "Lp/w4u;", PROVIDED, "Lp/x820;", "Lp/ne81;", "Lp/rh40;", "Lp/sfu;")

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
        // Without its scheduler argument the call has no receiver to tell apart from it.
        assertNull(bridgeHookIndex(listOf(invoke(Opcode.INVOKE_VIRTUAL, count = 1), returnVoid)))
    }

    @Test
    fun `hooks the shutdown that stops the router it loaded`() {
        assertEquals(1, shutdownHookIndex(listOf(loadRouter(0), stop(0), returnVoid)))
        assertEquals(1, shutdownHookIndex(listOf(loadRouter(3), stop(3))))
    }

    @Test
    fun `refuses a shutdown of any other shape`() {
        assertNull(shutdownHookIndex(emptyList()))
        assertNull(shutdownHookIndex(listOf(loadRouter(0))))
        assertNull(shutdownHookIndex(listOf(stop(0), loadRouter(0))))
        assertNull(shutdownHookIndex(listOf(returnVoid, loadRouter(0), stop(0))))
        // Another register, another field type, another load, another call, another receiver class.
        assertNull(shutdownHookIndex(listOf(loadRouter(0), stop(1))))
        assertNull(shutdownHookIndex(listOf(field(Opcode.IGET, 0, 5, "Lp/ggb1;", "b", ROUTER), stop(0))))
        assertNull(shutdownHookIndex(listOf(loadRouter(0), stop(0, "destroy"))))
        assertNull(shutdownHookIndex(listOf(loadRouter(0), stop(0, owner = "Lp/other;"))))
        assertNull(shutdownHookIndex(listOf(loadRouter(0), stop(0, opcode = Opcode.INVOKE_DIRECT))))
        assertNull(shutdownHookIndex(listOf(loadRouter(0), stop(0, count = 2))))
    }

    @Test
    fun `finds the cosmos service by the constructor that starts the router`() {
        assertTrue(isCosmosService(classOf(method("<init>", schedule, returnVoid))))
        assertTrue(isCosmosService(classOf(method("a", returnVoid), method("<init>", schedule, returnVoid))))
    }

    @Test
    fun `finds no other class as the cosmos service`() {
        assertFalse(isCosmosService(classOf()))
        assertFalse(isCosmosService(classOf(method("<init>", returnVoid))))
        assertFalse(isCosmosService(classOf(method("run", schedule, returnVoid)))) // not a constructor
        assertFalse(isCosmosService(classOf(method("<init>", invoke(Opcode.INVOKE_VIRTUAL, "shutdown"), returnVoid))))
        assertFalse(isCosmosService(classOf(method("<init>", invoke(Opcode.INVOKE_VIRTUAL, owner = "Lp/other;"), returnVoid))))
        assertFalse(isCosmosService(classOf(method("<init>", invoke(Opcode.INVOKE_DIRECT), returnVoid))))
        // An abstract method has no body to read.
        val bodyless: MethodImplementation? = null
        assertFalse(isCosmosService(classOf(ImmutableMethod("Lp/ggb1;", "<init>", emptyList<MethodParameter>(), "V", 0x401,
            emptySet<DexAnnotation>(), emptySet<HiddenApiRestriction>(), bodyless))))
    }

    @Test
    fun `accepts the menu model that T2 inserts before and finds the artist it reads`() {
        assertEquals(35, artistRegister(listOf(type(Opcode.NEW_INSTANCE, 1, "Lp/bjn;"), readArtist(35)), 0))
        assertEquals(35, artistRegister(listOf(returnVoid, type(Opcode.NEW_INSTANCE, 1, "Lp/bjn;"), readArtist(35)), 1))
        assertTrue(isMenuModel(type(Opcode.NEW_INSTANCE, 1, "Lp/bjn;")))
    }

    @Test
    fun `refuses any other instruction at T2`() {
        val model = type(Opcode.NEW_INSTANCE, 1, "Lp/bjn;")
        assertNull(artistRegister(listOf(model, readArtist(35)), 1))
        assertNull(artistRegister(listOf(model), 0))
        assertNull(artistRegister(listOf(type(Opcode.NEW_INSTANCE, 2, "Lp/bjn;"), readArtist(35)), 0))
        assertNull(artistRegister(listOf(type(Opcode.NEW_INSTANCE, 1, "Lp/other;"), readArtist(35)), 0))
        assertNull(artistRegister(listOf(type(Opcode.CONST_CLASS, 1, "Lp/bjn;"), readArtist(35)), 0))
        assertNull(artistRegister(listOf(model, returnVoid), 0))
        assertNull(artistRegister(listOf(model, readArtist(35, owner = "Lp/other;")), 0))
        assertNull(artistRegister(listOf(model, readArtist(35, result = "Ljava/lang/String;")), 0))
        assertNull(artistRegister(listOf(model, readArtist(35, opcode = Opcode.INVOKE_STATIC_RANGE)), 0))
        assertNull(artistRegister(listOf(model, readArtist(35, count = 2)), 0))
        assertFalse(isMenuModel(null))
        assertFalse(isMenuModel(type(Opcode.NEW_INSTANCE, 2, "Lp/bjn;")))
        assertFalse(isMenuModel(type(Opcode.NEW_INSTANCE, 1, "Lp/other;")))
        assertFalse(isMenuModel(type(Opcode.CONST_CLASS, 1, "Lp/bjn;")))
        assertFalse(isMenuModel(returnVoid))
    }

    @Test
    fun `accepts the end of the track menu that T1 goes in before`() {
        assertTrue(isTrackMenuEnd(trackMenuEnd(), 6))
        // The same code later in a method.
        assertTrue(isTrackMenuEnd(listOf(returnVoid, returnVoid) + trackMenuEnd(), 8))
    }

    @Test
    fun `refuses any other end of the track menu`() {
        val end = trackMenuEnd()
        assertFalse(isTrackMenuEnd(end, 5))
        assertFalse(isTrackMenuEnd(end, 7))
        assertFalse(isTrackMenuEnd(end, 0))
        assertFalse(isTrackMenuEnd(end.take(7), 6))
        // The model, the mask and the constructor call each have to match.
        assertFalse(isTrackMenuEnd(trackMenuEnd(model = type(Opcode.NEW_INSTANCE, 2, "Lp/bjn;")), 6))
        assertFalse(isTrackMenuEnd(trackMenuEnd(model = type(Opcode.NEW_INSTANCE, 3, "Lp/other;")), 6))
        assertFalse(isTrackMenuEnd(trackMenuEnd(model = type(Opcode.CONST_CLASS, 3, "Lp/bjn;")), 6))
        assertFalse(isTrackMenuEnd(trackMenuEnd(mask = ImmutableInstruction11n(Opcode.CONST_4, 5, 4)), 6))
        assertFalse(isTrackMenuEnd(trackMenuEnd(mask = ImmutableInstruction11n(Opcode.CONST_4, 4, 3)), 6))
        assertFalse(isTrackMenuEnd(trackMenuEnd(mask = ImmutableInstruction11x(Opcode.MOVE_RESULT, 4)), 6))
        assertFalse(isTrackMenuEnd(trackMenuEnd(build = buildModel(3, 0, 1, 5)), 6))
        assertFalse(isTrackMenuEnd(trackMenuEnd(build = buildModel(3, 0, 2, 4)), 6))
        assertFalse(isTrackMenuEnd(trackMenuEnd(build = buildModel(3, 1, 0, 4)), 6))
        assertFalse(isTrackMenuEnd(trackMenuEnd(build = buildModel(2, 0, 1, 4)), 6))
        assertFalse(isTrackMenuEnd(trackMenuEnd(build = buildModel(3, 0, 1, 4, name = "<clinit>")), 6))
        assertFalse(isTrackMenuEnd(trackMenuEnd(build = buildModel(3, 0, 1, 4, owner = "Lp/other;")), 6))
        assertFalse(isTrackMenuEnd(trackMenuEnd(build = buildModel(3, 0, 1, 4, opcode = Opcode.INVOKE_STATIC)), 6))
        assertFalse(isTrackMenuEnd(trackMenuEnd(build = buildModel(3, 0, 1, 4, count = 3)), 6))
    }

    @Test
    fun `finds the register of a parameter past this`() {
        // umj1.e: 78 registers, 30 one-word parameters, so this is v47 and the track, the third, v50.
        assertEquals(50, parameterRegister(78, List(30) { "Ljava/lang/Object;" }, 2))
        assertEquals(48, parameterRegister(78, List(30) { "Ljava/lang/Object;" }, 0))
        assertEquals(77, parameterRegister(78, List(30) { "Ljava/lang/Object;" }, 29))
        // A long takes two registers, so the parameters after it sit one register further on.
        assertEquals(9, parameterRegister(10, listOf("J", "I", "Ljava/lang/String;"), 2))
        assertEquals(8, parameterRegister(10, listOf("J", "I", "Ljava/lang/String;"), 1))
        assertEquals(6, parameterRegister(10, listOf("J", "I", "Ljava/lang/String;"), 0))
    }

    /** `iget-object v[register], v5, Lp/ggb1;->b:NativeRouter`, the first thing shutdown does. */
    private fun loadRouter(register: Int) = field(Opcode.IGET_OBJECT, register, 5, "Lp/ggb1;", "b", ROUTER)

    /** `invoke-virtual {v[receiver]}, NativeRouter;->[name]()V`, the first thing shutdown does to the router. */
    private fun stop(receiver: Int, name: String = "deinitializeScheduling", owner: String = ROUTER,
        opcode: Opcode = Opcode.INVOKE_VIRTUAL, count: Int = 1) =
        ImmutableInstruction35c(opcode, count, receiver, 0, 0, 0, 0, ImmutableMethodReference(owner, name, emptyList(), "V"))

    /** `invoke-virtual/range {v[start]}, CollectionArtist;->q()ArtistMetadata`, which T2's artist is read by. */
    private fun readArtist(start: Int, owner: String = ARTIST, result: String = ARTIST_METADATA,
        opcode: Opcode = Opcode.INVOKE_VIRTUAL_RANGE, count: Int = 1) =
        ImmutableInstruction3rc(opcode, start, count, ImmutableMethodReference(owner, "q", emptyList(), result))

    /** The tail of umj1.e up to T1's place: the model, its three arguments, the header, the header's result, the mask, the build. */
    private fun trackMenuEnd(
        model: Instruction = type(Opcode.NEW_INSTANCE, 3, "Lp/bjn;"),
        mask: Instruction = ImmutableInstruction11n(Opcode.CONST_4, 4, 4),
        build: Instruction = buildModel(3, 0, 1, 4),
    ): List<Instruction> = listOf(model, ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 4, 51),
        ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 5, 53), ImmutableInstruction22x(Opcode.MOVE_FROM16, 6, 69),
        ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 5, 0, 2, 4, 5, 6,
            ImmutableMethodReference("Lp/umj1;", "f", listOf("Lp/a;", "Lp/b;", "Lp/c;", "Z"), "Lp/yfn;")),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0), mask, build)

    /** `invoke-direct {v[model], v[header], v[list], v[flags]}, Lp/bjn;-><init>(Lp/yfn;List;I)V`. */
    private fun buildModel(model: Int, header: Int, list: Int, flags: Int, name: String = "<init>",
        owner: String = "Lp/bjn;", opcode: Opcode = Opcode.INVOKE_DIRECT, count: Int = 4) =
        ImmutableInstruction35c(opcode, count, model, header, list, flags, 0,
            ImmutableMethodReference(owner, name, listOf("Lp/yfn;", LIST, "I"), "V"))

    private fun method(name: String, vararg code: Instruction): ImmutableMethod {
        val body: List<Instruction> = code.toList()
        val implementation: MethodImplementation = ImmutableMethodImplementation(4, body, emptyList(), emptyList())
        return ImmutableMethod("Lp/ggb1;", name, emptyList<MethodParameter>(), "V", 0x10001, emptySet<DexAnnotation>(),
            emptySet<HiddenApiRestriction>(), implementation)
    }

    private fun classOf(vararg methods: ImmutableMethod) = ImmutableClassDef("Lp/ggb1;", 1, OBJECT, emptyList<String>(),
        null, emptySet<DexAnnotation>(), emptyList<DexField>(), methods.toList())

    @Test
    fun `accepts the copy of Home's chips that A goes in before`() {
        assertTrue(isChipsCopy(listOf(chips(4), copy(5)), 1))
    }

    @Test
    fun `refuses any other place for A`() {
        val site = listOf(chips(4), copy(5))
        assertFalse(isChipsCopy(site, 0))
        assertFalse(isChipsCopy(site, 2))
        assertFalse(isChipsCopy(listOf(chips(0), copy(5)), 1))
        assertFalse(isChipsCopy(listOf(chips(1), copy(2)), 1)) // where the chips were before 9.2.4
        assertFalse(isChipsCopy(listOf(ImmutableInstruction11x(Opcode.MOVE_RESULT, 4), copy(5)), 1))
        assertFalse(isChipsCopy(listOf(chips(4), copy(4)), 1))
        assertFalse(isChipsCopy(listOf(chips(4), type(Opcode.NEW_INSTANCE, 5, "Ljava/util/LinkedList;")), 1))
        assertFalse(isChipsCopy(listOf(chips(4), type(Opcode.CONST_CLASS, 5, ARRAY_LIST)), 1))
    }

    @Test
    fun `accepts the send of a chip tap that B goes in before, and the return B skips to`() {
        assertTrue(isChipTapSend(listOf(sendTap(3, 0), returnObject(11)), 0, 1))
    }

    @Test
    fun `refuses any other place for B`() {
        val site = listOf(sendTap(3, 0), returnObject(11))
        assertFalse(isChipTapSend(site, 1, 1))
        assertFalse(isChipTapSend(site, 0, 0))
        assertFalse(isChipTapSend(site, 0, 2))
        assertFalse(isChipTapSend(listOf(sendTap(0, 3), returnObject(11)), 0, 1))
        assertFalse(isChipTapSend(listOf(sendTap(1, 0), returnObject(11)), 0, 1))
        assertFalse(isChipTapSend(listOf(sendTap(3, 1), returnObject(11)), 0, 1))
        assertFalse(isChipTapSend(listOf(sendTap(3, 2), returnObject(11)), 0, 1)) // where the event was before 9.2.4
        assertFalse(isChipTapSend(listOf(sendTap(3, 0, "b"), returnObject(11)), 0, 1))
        assertFalse(isChipTapSend(listOf(sendTap(3, 0, opcode = Opcode.INVOKE_INTERFACE), returnObject(11)), 0, 1))
        assertFalse(isChipTapSend(listOf(sendTap(3, 0), returnObject(13)), 0, 1)) // where Unit was before 9.2.4
        assertFalse(isChipTapSend(listOf(sendTap(3, 0), returnObject(12)), 0, 1))
        assertFalse(isChipTapSend(listOf(sendTap(3, 0), ImmutableInstruction11x(Opcode.THROW, 11)), 0, 1))
        assertFalse(isChipTapSend(listOf(sendTap(3, 0), returnVoid), 0, 1))
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
        assertFalse(isShuffleButtonEnd(listOf(field(Opcode.IPUT_OBJECT, 2, 4, "Lp/u3u;", "i", OBJECT), returnVoid), 1))
        assertFalse(isShuffleButtonEnd(listOf(field(Opcode.IPUT_OBJECT, 2, 4, "Lp/u3u;", "t", BUTTON), returnVoid), 1)) // typed as before 9.2.4
        assertFalse(isShuffleButtonEnd(listOf(field(Opcode.IGET_OBJECT, 2, 4, "Lp/u3u;", "t", OBJECT), returnVoid), 1))
        assertFalse(isShuffleButtonEnd(listOf(field(Opcode.IPUT_OBJECT, 2, 4, "Lp/other;", "t", OBJECT), returnVoid), 1))
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
        assertFalse(isItemProvidersStore(field(Opcode.IPUT_OBJECT, 4, 0, "Lp/mve0;", "c", LIST)))
        assertFalse(isItemProvidersStore(field(Opcode.IGET_OBJECT, 4, 0, "Lp/mve0;", "d", LIST)))
        assertFalse(isItemProvidersStore(returnVoid))
    }

    /** `iput-object v[value], v[instance], Lp/mve0;->d`, the list menu's constructor storing its item providers. */
    private fun storeProviders(value: Int, instance: Int) = field(Opcode.IPUT_OBJECT, value, instance, "Lp/mve0;", "d", LIST)

    /** `iput-object v[value], v[instance], Lp/u3u;->t`, the shuffle button's constructor storing its button. */
    private fun storeButton(value: Int, instance: Int) = field(Opcode.IPUT_OBJECT, value, instance, "Lp/u3u;", "t", OBJECT)

    private fun field(opcode: Opcode, value: Int, instance: Int, owner: String, name: String, type: String) =
        ImmutableInstruction22c(opcode, value, instance, ImmutableFieldReference(owner, name, type))

    /** `move-result-object v[register]`, which takes `Lp/x820;->a`'s chips in Home's feed mapping. */
    private fun chips(register: Int) = ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, register)

    /** `new-instance v[register], ArrayList`, the copy of the chips that follows. */
    private fun copy(register: Int) = type(Opcode.NEW_INSTANCE, register, ARRAY_LIST)

    private fun returnObject(register: Int) = ImmutableInstruction11x(Opcode.RETURN_OBJECT, register)

    /** `invoke-virtual {v[loop], v[event]}, Lp/po50;->[name]`, which sends a chip tap's event to Home's loop. */
    private fun sendTap(loop: Int, event: Int, name: String = "invoke", opcode: Opcode = Opcode.INVOKE_VIRTUAL) =
        ImmutableInstruction35c(opcode, 2, loop, event, 0, 0, 0,
            ImmutableMethodReference("Lp/po50;", name, listOf("Ljava/lang/Object;"), "Ljava/lang/Object;"))

    @Test
    fun `accepts the instruction a Hide podcasts hook expects at its index`() {
        val section = "Lcom/spotify/casita/v1/resolved/Section;"
        val mapSection = ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 3, 4, 0, 0, 0,
            ImmutableMethodReference("Lp/w4u;", "d", listOf(section), "Lp/tj80;"))
        assertTrue(isHookSite(mapSection, Opcode.INVOKE_VIRTUAL, "Lp/w4u;->d($section)Lp/tj80;"))
        assertTrue(isHookSite(type(Opcode.NEW_INSTANCE, 0, ARRAY_LIST), Opcode.NEW_INSTANCE, ARRAY_LIST))
        assertTrue(isHookSite(ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 44), Opcode.MOVE_OBJECT_FROM16))
        assertTrue(isHookSite(field(Opcode.IPUT_OBJECT, 1, 0, "Lp/rh40;", "a", ARRAY_LIST),
            Opcode.IPUT_OBJECT, "Lp/rh40;->a:$ARRAY_LIST"))
    }

    @Test
    fun `refuses any other instruction at a Hide podcasts hook`() {
        assertFalse(isHookSite(null, Opcode.MOVE_OBJECT_FROM16))
        assertFalse(isHookSite(returnVoid, Opcode.MOVE_OBJECT_FROM16))
        assertFalse(isHookSite(type(Opcode.NEW_INSTANCE, 0, "Ljava/util/LinkedList;"), Opcode.NEW_INSTANCE, ARRAY_LIST))
        assertFalse(isHookSite(type(Opcode.CONST_CLASS, 0, ARRAY_LIST), Opcode.NEW_INSTANCE, ARRAY_LIST))
        assertFalse(isHookSite(type(Opcode.NEW_INSTANCE, 0, ARRAY_LIST), Opcode.NEW_INSTANCE))
        assertFalse(isHookSite(field(Opcode.IPUT_OBJECT, 1, 0, "Lp/rh40;", "b", ARRAY_LIST),
            Opcode.IPUT_OBJECT, "Lp/rh40;->a:$ARRAY_LIST"))
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
        assertFalse(isItemsGetter(listOf(field(Opcode.IGET_OBJECT, 0, 0, PROVIDED, "other_", "Lp/r0b0;"), returnObject(0))))
        assertFalse(isItemsGetter(listOf(field(Opcode.IGET_OBJECT, 0, 0, PROVIDED, "items_", "Lp/ih40;"), returnObject(0))))
    }

    /** `iget-object v[register], v0, Provided;->items_`, v0 being `this` as well in the one-register getter. */
    private fun items(register: Int) = field(Opcode.IGET_OBJECT, register, 0, PROVIDED, "items_", "Lp/r0b0;")

    private fun type(opcode: Opcode, register: Int, type: String) =
        ImmutableInstruction21c(opcode, register, ImmutableTypeReference(type))

    private val returnVoid = ImmutableInstruction10x(Opcode.RETURN_VOID)
    private val schedule = invoke(Opcode.INVOKE_VIRTUAL)

    private fun invoke(
        opcode: Opcode,
        name: String = "initializeScheduling",
        owner: String = ROUTER,
        count: Int = 2,
    ) = ImmutableInstruction35c(opcode, count, 3, 0, 0, 0, 0,
        ImmutableMethodReference(owner, name, listOf("Lcom/spotify/cosmos/cosmosimpl/Scheduler;"), "V"))
}
