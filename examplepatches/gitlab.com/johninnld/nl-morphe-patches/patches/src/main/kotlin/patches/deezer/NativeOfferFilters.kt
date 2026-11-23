package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val OFFER_ENTRIES = "LlIlIIlllIIll;"
internal const val OFFER_RESULT = "Lcore/auth/module/models/AppConversionEntrypoint;"
internal const val NATIVE_OFFER_LOOKUP = "morpheNativeOfferLookup"
internal const val HIDE_DOWNLOAD_OFFER = "morpheHideDownloadOffer"
internal const val HIDE_ADS_FREE_OFFER = "morpheHideAdsFreeOffer"

internal fun offerFilterEnabled(name: String) = ImmutableMethod(OFFER_ENTRIES, name, emptyList(), "Z",
    AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
    MutableMethodImplementation(1)).toMutable().apply {
        addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }

/** Keep the original zero-local getter intact; wrapper registers never alias its receiver. */
internal fun wrapNativeOfferLookup(original: MutableMethod): Pair<MutableMethod, MutableMethod> {
    check(original.definingClass == OFFER_ENTRIES && original.name == "IllIlIlIIlIllIll" &&
        original.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
        original.returnType == OFFER_RESULT && !AccessFlags.STATIC.isSet(original.accessFlags))
    val references = original.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
    check(references == listOf("$OFFER_ENTRIES->llIIIIIIlIIIIll:Ljava/util/HashMap;",
        "Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;", OFFER_RESULT)) {
        "Deezer conversion-entry lookup changed"
    }
    val native = ImmutableMethod(OFFER_ENTRIES, NATIVE_OFFER_LOOKUP, original.parameters, OFFER_RESULT,
        AccessFlags.PRIVATE.value, original.annotations, original.hiddenApiRestrictions,
        original.implementation).toMutable()
    val wrapper = ImmutableMethod(OFFER_ENTRIES, original.name, original.parameters, OFFER_RESULT,
        original.accessFlags, original.annotations, original.hiddenApiRestrictions,
        MutableMethodImplementation(3)).toMutable().apply {
        addInstructions(0, """
            const-string v0, "CONTEXTUAL_MENU_DOWNLOAD"
            invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :ads_free
            invoke-static {}, $OFFER_ENTRIES->$HIDE_DOWNLOAD_OFFER()Z
            move-result v0
            if-nez v0, :hide
            :ads_free
            const-string v0, "CONTEXTUAL_MENU_ADS_FREE"
            invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :native
            invoke-static {}, $OFFER_ENTRIES->$HIDE_ADS_FREE_OFFER()Z
            move-result v0
            if-nez v0, :hide
            :native
            invoke-direct {p0, p1}, $OFFER_ENTRIES->$NATIVE_OFFER_LOOKUP(Ljava/lang/String;)$OFFER_RESULT
            move-result-object v0
            return-object v0
            :hide
            const/4 v0, 0x0
            return-object v0
        """.trimIndent())
    }
    return wrapper to native
}

internal val deezerNativeOfferFilters = bytecodePatch {
    dependsOn(deezerBase)
    execute {
        val cls = mutableClassDefBy(OFFER_ENTRIES)
        check(cls.methods.none { it.name in setOf(NATIVE_OFFER_LOOKUP, HIDE_DOWNLOAD_OFFER, HIDE_ADS_FREE_OFFER) })
        val original = exact(OFFER_ENTRIES, "IllIlIlIIlIllIll", OFFER_RESULT, "Ljava/lang/String;").method
        val (wrapper, native) = wrapNativeOfferLookup(original)
        check(cls.methods.remove(original))
        cls.methods.addAll(listOf(wrapper, native, offerFilterEnabled(HIDE_DOWNLOAD_OFFER), offerFilterEnabled(HIDE_ADS_FREE_OFFER)))
    }
}

@Suppress("unused")
val deezerOfflineDownloads = bytecodePatch(
    name = "Enable offline downloads",
    description = "Enables Deezer's native album, playlist and Favorite tracks downloads using the offline rights enabled by full streaming. " +
        "Removes the contextual download upgrade offer. Downloaded media, library registration and offline playback remain native.",
    default = true,
) {
    compatibleWith(deezer)
    dependsOn(deezerEnableFullStreaming, deezerNativeOfferFilters)
    execute {
        mutableClassDefBy(OFFER_ENTRIES).methods.single { it.name == HIDE_DOWNLOAD_OFFER }
            .replaceInstruction(0, "const/4 v0, 0x1")
    }
}
