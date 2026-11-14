package patches.soundcloud

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val HOME = "Lnl/johninnl/soundcloud/HomeSections;"
private const val SECTIONS_SERVICE = "Lcom/soundcloud/android/sdui/data/SDUIService;"
private const val DEFAULT_SECTIONS_SERVICE = "Lcom/soundcloud/android/sdui/data/DefaultSDUIService;"
private const val SERVICE_FACTORY = "Lcom/soundcloud/android/sdui/wiring/SDUIModule_Companion_ProvidesSDUIServiceFactory;"
private const val DISCOVERY_ENTRY = "Lcom/soundcloud/android/playback/mediabrowser/impl/entries/DiscoveryCatalogEntry;"
private const val ITEM_BUILDER = "Lcom/soundcloud/android/playback/mediabrowser/impl/MediaItemBuilder;"
private const val MEDIA_ITEM = "Landroid/support/v4/media/MediaBrowserCompat\$MediaItem;"
private const val MEDIA_COLLECTION = "Lcom/soundcloud/android/foundation/media/MediaCollection;"
private const val SINGLE = "Lio/reactivex/rxjava3/core/Single;"
private const val SINGLE_JUST = "Lio/reactivex/rxjava3/internal/operators/single/SingleJust;"
private const val CONTINUATION = "Lkotlin/coroutines/Continuation;"
private const val STRING = "Ljava/lang/String;"

private fun Method.strings() = (implementation?.instructions ?: emptyList())
    .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }

@Suppress("unused")
val androidAutoHomePatch = bytecodePatch(
    name = "Home in Android Auto",
    description = "Fills the car Home tab with regular cover tiles from the phone's Home, " +
        "using the app's existing account. Tracks, mixes and artists play; playlists and albums open. " +
        "Publishes the real playback queue for Up next, with queue item selection. " +
        "Falls back to SoundCloud's original car Home if the phone Home cannot load.",
    default = true,
) {
    compatibleWith(soundcloud)
    dependsOn(originalInput)
    extendWith("extensions/soundcloud.mpe")

    execute {
        // The car browser uses MediaId(urn, MediaCollection.DISCOVERY); the extension formats the same ID.
        if (classDefBy(MEDIA_COLLECTION).methods.none { it.name == "<clinit>" && "discover" in it.strings() })
            throw PatchException("SoundCloud's discovery media collection changed")

        // The phone Home uses GraphQL SDUI. /home/query's home-library layout only serves library banners.
        val queryParameters = listOf(STRING, STRING, "Ljava/lang/Integer;", "Lkotlin/coroutines/jvm/internal/ContinuationImpl;")
        val homeQueries = classDefBy(DEFAULT_SECTIONS_SERVICE).methods.filter {
            it.returnType == "Ljava/lang/Object;" && it.parameterTypes.map(CharSequence::toString) == queryParameters
        }
        val homeQuery = homeQueries.singleOrNull()?.name ?: throw PatchException("SoundCloud phone Home request not found")
        if (classDefBy(SECTIONS_SERVICE).methods.none {
            it.name == homeQuery && it.parameterTypes.map(CharSequence::toString) == queryParameters
        }) throw PatchException("SoundCloud SDUIService does not declare the phone Home request")
        bindSduiHomeModels()
        bindQueueExport()

        fun builderMethod(vararg parameters: String) = classDefBy(ITEM_BUILDER).methods.filter {
            it.returnType == MEDIA_ITEM && it.parameterTypes.map(CharSequence::toString) == parameters.toList()
        }.singleOrNull()?.name ?: throw PatchException("SoundCloud car media item builder changed")
        val playable = builderMethod(STRING, STRING, STRING, STRING)
        val browsable = builderMethod(STRING, STRING, STRING, STRING, "Z")

        classDefBy(SINGLE_JUST).let { just ->
            if (just.superclass != SINGLE || just.methods.none {
                it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;")
            }) throw PatchException("RxJava SingleJust changed")
        }

        // Bridges: the extension calls the app's own renamed methods through these bodies.
        val home = mutableClassDefBy(HOME)
        fun bridge(name: String, body: String) = home.methods.single { it.name == name }.addInstructions(0, body)
        home.methods.removeAll { it.name == "queryHome" }
        home.methods.add(MutableMethod(ImmutableMethod(HOME, "queryHome", listOf("Ljava/lang/Object;", CONTINUATION).map {
            ImmutableMethodParameter(it, emptySet(), null)
        }, "Ljava/lang/Object;", AccessFlags.STATIC.value, emptySet(), emptySet(),
            ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList()))).apply { addInstructions(0, """
            check-cast p0, $SECTIONS_SERVICE
            check-cast p1, Lkotlin/coroutines/jvm/internal/ContinuationImpl;
            const/4 v0, 0x0
            invoke-interface { p0, v0, v0, v0, p1 }, $SECTIONS_SERVICE->$homeQuery($STRING${STRING}Ljava/lang/Integer;Lkotlin/coroutines/jvm/internal/ContinuationImpl;)Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """) })
        bridge("playable", """
            check-cast p0, $ITEM_BUILDER
            invoke-virtual/range { p0 .. p4 }, $ITEM_BUILDER->$playable($STRING$STRING$STRING$STRING)$MEDIA_ITEM
            move-result-object v0
            return-object v0
        """)
        bridge("browsable", """
            check-cast p0, $ITEM_BUILDER
            invoke-virtual/range { p0 .. p5 }, $ITEM_BUILDER->$browsable($STRING$STRING$STRING${STRING}Z)$MEDIA_ITEM
            move-result-object v0
            return-object v0
        """)

        // Capture the SectionsService provider when Dagger builds the application graph.
        mutableClassDefBy(SERVICE_FACTORY).methods.single { it.name == "<init>" }.apply {
            val end = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (end < 0) throw PatchException("SoundCloud SectionsService factory changed")
            addInstruction(end, "invoke-static { p0 }, $HOME->setServiceProvider(Ljava/lang/Object;)V")
        }

        // Serve the phone Home for the car Home root ("discovery"); playlist children keep the original path.
        val entry = mutableClassDefBy(DISCOVERY_ENTRY)
        val builderField = entry.fields.singleOrNull { it.type == ITEM_BUILDER }
            ?: throw PatchException("SoundCloud car Home builder field changed")
        val load = entry.methods.singleOrNull {
            it.returnType == SINGLE && it.parameterTypes.map(CharSequence::toString) == listOf(STRING, "Z") &&
                "loadDiscoveryItems" in it.strings()
        } ?: throw PatchException("SoundCloud car Home loader not found")
        if (load.implementation!!.registerCount < load.parameterTypes.size + 3)
            throw PatchException("SoundCloud car Home loader has no free registers")
        load.addInstructionsWithLabels(0, """
            if-eqz p1, :morphe_home
            const-string v0, "discovery"
            invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :morphe_original
            :morphe_home
            iget-object v0, p0, $DISCOVERY_ENTRY->${builderField.name}:$ITEM_BUILDER
            invoke-static { v0 }, $HOME->load(Ljava/lang/Object;)Ljava/util/List;
            move-result-object v0
            if-eqz v0, :morphe_original
            new-instance v1, $SINGLE_JUST
            invoke-direct { v1, v0 }, $SINGLE_JUST-><init>(Ljava/lang/Object;)V
            return-object v1
        """, ExternalLabel("morphe_original", load.getInstruction(0)))
    }
}
