package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableField

private const val AVAILABILITY = "LlllllIlIIIIlIlI;"
private const val NATIVE_SONG = "LlIlIlIIIIIll;"
private const val MANAGER = "LIllIIllIlIlIIIIl;"
private const val ACTION = "LIIIIlIlllIllll;"
private const val CALLBACK = "LIIIllIIllIIlIlll;"

private fun MutableClass.member(name: String, result: String, vararg params: String) = methods.single {
    it.name == name && it.returnType == result && it.parameterTypes.map(CharSequence::toString) == params.toList()
}
private fun ref(method: MutableMethod, index: Int) = (method.instructions.toList().getOrNull(index) as? ReferenceInstruction)?.reference?.toString()

private fun alias(owner: MutableClass, original: MutableMethod, name: String, locals: Int, code: String) {
    check(owner.methods.none { it.name == name }) { "Lyrics bridge already applied" }
    val native = ImmutableMethod(original.definingClass, name, original.parameters, original.returnType,
        AccessFlags.PRIVATE.value, original.annotations, original.hiddenApiRestrictions, original.implementation).toMutable()
    val wrapper = lyricMethod(original.definingClass, original.name, original.returnType,
        original.parameterTypes.map(CharSequence::toString), locals, code, flags = original.accessFlags)
    check(owner.methods.remove(original))
    owner.methods.addAll(listOf(native, wrapper))
}

/** Only supported 9002703 bindings. Preserve original source queries and observeOn(main). */
internal fun bindLyricsFallback(type: (String) -> MutableClass) {
    val artwork = type(LYRIC_ARTWORK_ADAPTER)
    val holder = type(LYRIC_ARTWORK_HOLDER)
    val viewHolder = "Landroidx/recyclerview/widget/IIIlIIllIlIllIll;"
    val bind = artwork.member("onBindViewHolder", "V", viewHolder, "I")
    val bindRefs = bind.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
    check(bindRefs.count { it == "$LYRIC_TRACK->IlIIIIIIIlllIIl()I" } == 2 &&
        bindRefs.contains("$LYRIC_ARTWORK_HOLDER->lIlIIlIIlIlIllI:Landroid/widget/TextView;") &&
        holder.fields.none { it.name == LYRIC_HOLDER_FLOW }) { "Native artwork lyrics binding changed" }
    holder.fields.add(MutableField(ImmutableField(LYRIC_ARTWORK_HOLDER, LYRIC_HOLDER_FLOW, LYRIC_FLOW,
        AccessFlags.PUBLIC.value or AccessFlags.VOLATILE.value or AccessFlags.TRANSIENT.value,
        null, emptySet(), emptySet())))
    alias(artwork, bind, "morpheNativeArtworkBind", 0, """
        invoke-direct {p0, p1, p2}, $LYRIC_ARTWORK_ADAPTER->morpheNativeArtworkBind(${viewHolder}I)V
        check-cast p1, $LYRIC_ARTWORK_HOLDER
        invoke-static {p1}, $LYRIC_FACTORY->bindArtwork($LYRIC_ARTWORK_HOLDER)V
        return-void
    """)
    val recycle = artwork.member("onViewRecycled", "V", viewHolder)
    check(recycle.instructions.any { (it as? ReferenceInstruction)?.reference?.toString() ==
        "$LYRIC_ARTWORK_HOLDER->IIIIIlIIIlIlllI:Landroid/widget/ImageView;" })
    alias(artwork, recycle, "morpheNativeArtworkRecycle", 0, """
        check-cast p1, $LYRIC_ARTWORK_HOLDER
        invoke-static {p1}, $LYRIC_FACTORY->unbindArtwork($LYRIC_ARTWORK_HOLDER)V
        invoke-direct {p0, p1}, $LYRIC_ARTWORK_ADAPTER->morpheNativeArtworkRecycle($viewHolder)V
        return-void
    """)

    val availability = type(AVAILABILITY)
    val source = availability.member("IllIlIlIIlIllIll", LYRIC_RX, NATIVE_SONG)
    check(ref(source, 0)?.isNotBlank() == true && source.instructions.any {
        (it as? ReferenceInstruction)?.reference?.toString() == "$LYRIC_TRACK->IlIIIIIIIlllIIl()I"
    }) { "Native lyrics availability source changed" }
    alias(availability, source, "morpheNativeLyricsAvailability", 2, """
        invoke-direct {p0, p1}, $AVAILABILITY->morpheNativeLyricsAvailability($NATIVE_SONG)$LYRIC_RX
        move-result-object v0
        const/4 v1, 0x0
        invoke-static {v0, p1, v1}, $LYRIC_FACTORY->wrap($LYRIC_RX${LYRIC_TRACK}I)$LYRIC_RX
        move-result-object v0
        return-object v0
    """)

    val manager = type(MANAGER).member("IllIlIlIIlIllIll", "V", LYRIC_TRACK, LYRIC_TRACK)
    check(manager.implementation!!.registerCount == 8 &&
        ref(manager, 20) == "$LYRIC_TRACK->IlIIIIIIIlllIIl()I" &&
        ref(manager, 60) == "LIIllIIllIllIIll;->IllIlIlIIlIllIll()LlIIlIIllIlIIllI;" &&
        ref(manager, 62) == "$LYRIC_RX->IIllIIIIIIIllIll(LIIIllIIlIllIlllI;)LIIIIIlIIllIIlI;" &&
        ref(manager, 75) == "LlIIIlIIlIIIllI;->IIlllIIIIIIIIIlI(I)V" &&
        manager.instructions.toList()[76].opcode == Opcode.RETURN_VOID) {
        "Native full-screen lyrics stream changed"
    }
    // Native state 0 emits CloseLyrics and finishes the screen. Replace that edge
    // with a loading lookup; its completion emits state 0 only after a real miss.
    manager.replaceInstruction(75,
        "invoke-static {v5, v6}, $LYRIC_FACTORY->loadMissing($LYRIC_MANAGER$LYRIC_TRACK)V")
    // The downstream consumer expects pair(track, model). Existing main-thread scheduling stays.
    manager.addInstructions(60, """
        const/4 v0, 0x1
        invoke-static {v7, v6, v0, v5}, $LYRIC_FACTORY->wrapOwned($LYRIC_RX${LYRIC_TRACK}I$LYRIC_MANAGER)$LYRIC_RX
        move-result-object v7
        nop
    """)

    val model = type(LYRIC_MODEL).member("<init>", "V", "Ljava/lang/String;", "Ljava/util/ArrayList;", "I",
        "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;")
    check(model.implementation!!.registerCount == 7)
    val licence = model.instructions.indexOfFirst {
        it.opcode == Opcode.IPUT_OBJECT && (it as? ReferenceInstruction)?.reference?.toString() ==
            "$LYRIC_MODEL->IIlllIlIIlIlII:Ljava/lang/String;"
    }
    check(licence >= 0)
    model.addInstructions(licence, """
        invoke-static {p1, p6}, $LYRIC_FACTORY->licence(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
        move-result-object p6
    """)

    val activity = type(LYRIC_ACTIVITY)
    val menu = activity.member("IIlllIllIlIIlII", "Ljava/util/List;")
    alias(activity, menu, "morpheNativeLyricsMenu", 1, """
        invoke-static {p0}, $LYRIC_FACTORY->mayReport($LYRIC_ACTIVITY)Z
        move-result v0
        if-nez v0, :native
        invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
        move-result-object v0
        return-object v0
        :native
        invoke-direct {p0}, $LYRIC_ACTIVITY->morpheNativeLyricsMenu()Ljava/util/List;
        move-result-object v0
        return-object v0
    """)
    val action = activity.member("IIIIIllIlIIllll", "Z", ACTION)
    alias(activity, action, "morpheNativeLyricsAction", 2, """
        iget v0, p1, $ACTION->IllIlIlIIlIllIll:I
        const/16 v1, 0x22
        if-ne v0, v1, :native
        invoke-static {p0}, $LYRIC_FACTORY->mayReport($LYRIC_ACTIVITY)Z
        move-result v0
        if-nez v0, :native
        const/4 v0, 0x1
        return v0
        :native
        invoke-direct {p0, p1}, $LYRIC_ACTIVITY->morpheNativeLyricsAction($ACTION)Z
        move-result v0
        return v0
    """)
    val callback = type(CALLBACK).member("invoke", "Ljava/lang/Object;", "Ljava/lang/Object;")
    check(callback.implementation!!.registerCount == 25 &&
        ref(callback, 407) == LYRIC_ACTIVITY &&
        ref(callback, 414) == "LIlllIlIlIlIIIll;->IlIllIIIlIIIllIl:$LYRIC_MODEL") {
        "Native lyrics display callback changed"
    }
    // v0 is the activity in this exact updateData branch. Keep payload alignment even.
    callback.addInstructions(415, """
        invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V
        nop
    """)
}
