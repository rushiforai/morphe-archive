package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.insertAt
import app.mightymorphing.patches.shared.setBody
import app.mightymorphing.patches.shared.writeBody
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val LAYER = """
    if-nez p0, :layer_start
    return-void
    :layer_start
    instance-of v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    if-eqz v0, :layer_group
    const/4 v0, 0x0
    invoke-virtual {p0, p1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V
    return-void
    :layer_group
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-eqz v0, :layer_end
    move-object v0, p0
    check-cast v0, Landroid/view/ViewGroup;
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    const/4 v2, 0x0
    :layer_loop
    if-ge v2, v1, :layer_end
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
    invoke-static {v3, p1}, Lo/o/joey/CustomViews/AnySwipeLayout;->s(Landroid/view/View;I)V
    add-int/lit8 v2, v2, 0x1
    goto :layer_loop
    :layer_end
    return-void
"""

private const val VIEWER_WINDOW = """
    sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
    const/16 v1, 0x1e
    if-lt v0, v1, :old_window
    const/4 v0, 0x1
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTranslucent(Z)Z
    return-void
    :old_window
    invoke-static {p0}, Lzd/p1;->c(Landroid/app/Activity;)V
    return-void
"""

@Suppress("unused")
val dismissWithoutTearingPatch = bytecodePatch(
    name = "Dismiss without tearing",
    description = "Swiping a photo away to close it looks smooth instead of tearing.",
) {
    compatibleWith(JOEY)

    execute {
        val swipe = SwipeResetFingerprint.classDef
        val layer = ImmutableMethod(
            "Lo/o/joey/CustomViews/AnySwipeLayout;",
            "s",
            listOf(
                ImmutableMethodParameter("Landroid/view/View;", null, null),
                ImmutableMethodParameter("I", null, null),
            ),
            "V",
            AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(6),
        ).toMutable()
        swipe.methods.add(layer)
        swipe.directMethods.add(layer)
        // .locals 4 plus the view and the layer type.
        layer.setBody(6, LAYER)

        val reset = SwipeResetFingerprint.method
        reset.insertAt(
            0,
            """
            iget-object v0, p0, Lo/o/joey/CustomViews/AnySwipeLayout;->j:Landroid/view/View;
            if-eqz v0, :layer_clear
            const/4 v1, 0x0
            invoke-static {v0, v1}, Lo/o/joey/CustomViews/AnySwipeLayout;->s(Landroid/view/View;I)V
            """,
            ExternalLabel("layer_clear", reset.instructions[0]),
        )

        val capture = SwipeCaptureFingerprint.method
        capture.insertAt(
            0,
            """
            iget-object p2, p0, Lo/o/joey/CustomViews/AnySwipeLayout${'$'}d;->a:Lo/o/joey/CustomViews/AnySwipeLayout;
            iput-object p1, p2, Lo/o/joey/CustomViews/AnySwipeLayout;->j:Landroid/view/View;
            const/4 p2, 0x1
            invoke-static {p1, p2}, Lo/o/joey/CustomViews/AnySwipeLayout;->s(Landroid/view/View;I)V
            """,
        )

        // Static method, .locals 2 plus the activity.
        writeBody(ViewerWindowFingerprint.method, 3, VIEWER_WINDOW)
    }
}
