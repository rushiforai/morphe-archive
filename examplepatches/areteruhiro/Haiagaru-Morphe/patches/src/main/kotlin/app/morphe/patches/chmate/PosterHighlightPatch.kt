package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val POSTER_HIGHLIGHT = "Lapp/morphe/extension/chmate/PosterHighlight;"

/** Wrap the exact response renderer, retaining its parameter/return types and native spans. */
internal fun BytecodePatchContext.patchPosterHighlight(version: String) {
    val (owner, name, model) = when(version) {
        "0.8.10.191 dev" -> Triple("Lo/m9ExternalSyntheticLambda1;", "SC_", "Lo/processAdDisplayErrorPostbackForUserError;")
        "0.8.10.226 dev" -> Triple("Lo/listener;", "c", "Lo/BouncyCastleSocketAdapterCompanion;")
        "0.8.10.242 dev" -> Triple("Lo/WorkSourceUtil;", "d", "Lo/KeJ11;")
        else -> return
    }
    val klass = mutableClassDefBy(owner)
    val original = klass.methods.single {
        it.name == name && it.returnType == "Landroid/text/Spanned;" && it.parameterTypes.getOrNull(2) == model
            && it.accessFlags and 8 == 0
    }
    val words = 1 + original.parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
    val renamed = MutableMethod(ImmutableMethod(owner, "haiagaruRenderPoster", original.parameters,
        original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions, original.implementation))
    val wrapper = MutableMethod(ImmutableMethod(owner, name, original.parameters, original.returnType,
        original.accessFlags, original.annotations, original.hiddenApiRestrictions,
        ImmutableMethodImplementation(words + 3, emptyList(), emptyList(), emptyList())))
    val invoke = if(original.accessFlags and 2 != 0) "invoke-direct/range" else "invoke-virtual/range"
    wrapper.addInstructions(0, """
        $invoke {p0 .. p${words - 1}}, $renamed
        move-result-object v0
        move-object/from16 v1, p0
        move-object/from16 v2, p3
        invoke-static {v0, v1, v2}, $POSTER_HIGHLIGHT->decorate(Landroid/text/Spanned;Ljava/lang/Object;Ljava/lang/Object;)Landroid/text/Spanned;
        move-result-object v0
        return-object v0
    """.trimIndent())
    klass.methods.remove(original)
    klass.methods.add(renamed)
    klass.methods.add(wrapper)

    if(version == "0.8.10.242 dev") {
        val dialog = mutableClassDefBy("Ljp/syoboi/a2chMate/fragment/ResMenuDialogFragment;")
        val builder = dialog.methods.single {
            it.name == "g" && it.parameterTypes.isEmpty() && it.returnType == "Lo/TTPlayableLandingPageActivity10;"
        }
        val delegate = MutableMethod(ImmutableMethod(dialog.type, "haiagaruPosterMenu", builder.parameters,
            builder.returnType, builder.accessFlags, builder.annotations, builder.hiddenApiRestrictions, builder.implementation))
        val entry = MutableMethod(ImmutableMethod(dialog.type, builder.name, builder.parameters, builder.returnType,
            builder.accessFlags, builder.annotations, builder.hiddenApiRestrictions,
            ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList())))
        val call = if(builder.accessFlags and 2 != 0) "invoke-direct" else "invoke-virtual"
        entry.addInstructions(0, """
            $call {p0}, $delegate
            move-result-object v0
            invoke-static {p0, v0}, Lapp/morphe/extension/chmate/ResponseArchive;->appendDialog242(Ljava/lang/Object;Ljava/lang/Object;)V
            invoke-static {v0}, Lapp/morphe/extension/chmate/ResponseMenuSettings;->finishResponseMenu(Ljava/lang/Object;)V
            return-object v0
        """.trimIndent())
        dialog.methods.remove(builder)
        dialog.methods.add(delegate)
        dialog.methods.add(entry)
    }
    println("Poster highlight: $version exact response renderer and menu bindings")
}
