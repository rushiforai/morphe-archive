package app.morphe.patches.tvcolombia

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val GRID = "Lcolombia/tv/plus/MyGridView;"
private const val GRID_VIEW = "Landroid/widget/GridView;"
private const val RUNNABLE = "Ljava/lang/Runnable;"
private const val PENDING = "televisionLaunchPending"
private const val SCHEDULE = "scheduleTelevisionOpen"
private const val CARD_TITLE_ID = "0x7f0a06da" // tv_menugrid

private val startupNavigation = Fingerprint(
    definingClass = "Lcolombia/tv/plus/empezar;",
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        string("es_menu"),
        string("ind_secc_sel"),
        string("intent_abrir"),
        methodCall(definingClass = "Landroid/content/Context;", name = "startActivity"),
    ),
)

private fun gridMethod(
    name: String,
    parameters: List<String>,
    visibility: AccessFlags,
    registers: Int,
    body: String,
) = MutableMethod(
    ImmutableMethod(
        GRID,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        "V",
        visibility.value,
        null,
        null,
        MutableMethodImplementation(registers),
    ),
).apply {
    addInstructionsWithLabels(0, body.trimIndent())
}

private fun openRenderedCard() = gridMethod(
    "run",
    emptyList(),
    AccessFlags.PUBLIC,
    12,
    """
    sget-boolean v0, $GRID->$PENDING:Z
    if-eqz v0, :done
    invoke-virtual {p0}, $GRID->hasWindowFocus()Z
    move-result v0
    if-eqz v0, :done
    invoke-virtual {p0}, $GRID->isShown()Z
    move-result v0
    if-eqz v0, :done
    invoke-virtual {p0}, $GRID->getOnItemClickListener()Landroid/widget/AdapterView${'$'}OnItemClickListener;
    move-result-object v0
    if-eqz v0, :done
    invoke-virtual {p0}, $GRID->getChildCount()I
    move-result v0
    const/4 v1, 0x3
    if-lt v0, v1, :done

    const/4 v1, 0x0
    const/4 v2, 0x0
    const/4 v6, 0x0
    const/4 v7, 0x0
    :next_card
    if-ge v1, v0, :select_tv
    invoke-virtual {p0, v1}, $GRID->getChildAt(I)Landroid/view/View;
    move-result-object v3
    if-eqz v3, :advance
    const v4, $CARD_TITLE_ID
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v4
    instance-of v5, v4, Landroid/widget/TextView;
    if-eqz v5, :advance
    check-cast v4, Landroid/widget/TextView;
    invoke-virtual {v4}, Landroid/widget/TextView;->getVisibility()I
    move-result v5
    if-nez v5, :advance
    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v4
    if-eqz v4, :advance
    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4

    const-string v5, "(?i)[\\s\\p{Zs}]*iniciar[\\s\\p{Zs}]+app[\\s\\p{Zs}]+televisi[oóÓ]n[.!]?[\\s\\p{Zs}]*"
    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :radio_card
    if-nez v6, :done
    move-object v6, v3
    move v7, v1
    goto :advance

    :radio_card
    const-string v5, "RadioHub"
    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :weather_card
    or-int/lit8 v2, v2, 0x1
    goto :advance

    :weather_card
    const-string v5, "GeoSky"
    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :advance
    or-int/lit8 v2, v2, 0x2

    :advance
    add-int/lit8 v1, v1, 0x1
    goto :next_card

    :select_tv
    if-eqz v6, :done
    const/4 v3, 0x3
    if-ne v2, v3, :done
    invoke-virtual {p0}, $GRID->getFirstVisiblePosition()I
    move-result v8
    add-int v7, v7, v8
    invoke-virtual {p0, v7}, $GRID->getItemIdAtPosition(I)J
    move-result-wide v8
    const/4 v0, 0x0
    sput-boolean v0, $GRID->$PENDING:Z
    invoke-virtual {p0, v6, v7, v8, v9}, $GRID->performItemClick(Landroid/view/View;IJ)Z

    :done
    return-void
    """,
)

@Suppress("unused")
val directTelevision = patch(
    name = "Open television on launch",
    description = "Opens the television section directly when the startup menu contains the TV, RadioHub, and GeoSky cards.",
) {
    category("Interaction")
    compatibleWith(tvColombia)

    execute {
        val startup = startupNavigation.matchAll().single().method
        // Start watching before launch routing chooses the main menu or an app submenu.
        startup.addInstructionsWithLabels(
            0,
            """
            invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
            move-result-object v0
            const/4 v2, 0x0
            if-eqz v0, :set_pending
            const-string v1, "android.intent.category.LAUNCHER"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->hasCategory(Ljava/lang/String;)Z
            move-result v2
            :set_pending
            sput-boolean v2, $GRID->$PENDING:Z
            """.trimIndent(),
        )

        val grid = mutableClassDefBy(GRID)
        grid.interfaces.add(RUNNABLE)
        grid.fields.add(MutableField(ImmutableField(GRID, PENDING, "Z", AccessFlags.STATIC.value, null, null, null)))
        grid.methods.addAll(
            listOf(
                gridMethod(
                    "onLayout", listOf("Z", "I", "I", "I", "I"), AccessFlags.PROTECTED, 6,
                    """
                    invoke-super/range {p0 .. p5}, $GRID_VIEW->onLayout(ZIIII)V
                    invoke-direct {p0}, $GRID->$SCHEDULE()V
                    return-void
                    """,
                ),
                gridMethod(
                    "onWindowFocusChanged", listOf("Z"), AccessFlags.PUBLIC, 2,
                    """
                    invoke-super {p0, p1}, $GRID_VIEW->onWindowFocusChanged(Z)V
                    invoke-direct {p0}, $GRID->$SCHEDULE()V
                    return-void
                    """,
                ),
                gridMethod(
                    SCHEDULE, emptyList(), AccessFlags.PRIVATE, 2,
                    """
                    sget-boolean v0, $GRID->$PENDING:Z
                    if-eqz v0, :done
                    invoke-virtual {p0}, $GRID->hasWindowFocus()Z
                    move-result v0
                    if-eqz v0, :done
                    invoke-virtual {p0, p0}, $GRID->removeCallbacks($RUNNABLE)Z
                    invoke-virtual {p0, p0}, $GRID->post($RUNNABLE)Z
                    :done
                    return-void
                    """,
                ),
                openRenderedCard(),
            ),
        )
    }
}
