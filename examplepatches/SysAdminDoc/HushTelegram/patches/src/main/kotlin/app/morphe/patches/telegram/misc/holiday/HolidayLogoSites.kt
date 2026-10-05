/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.holiday

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.smali.toInstructions
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val CANVAS = "Landroid/graphics/Canvas;"
private const val VIEW = "Landroid/view/View;"
private const val TEXT = "Ljava/lang/CharSequence;"
private const val SPAN = "Landroid/text/style/ImageSpan;"
private const val BUILDER = "Landroid/text/SpannableStringBuilder;"
private const val LOGO = "Lorg/telegram/messenger/R\$drawable;->telegram_logo_2:I"
private const val APP_NAME = "Lorg/telegram/messenger/R\$string;->AppName:I"
private const val FONT_METRICS = "Landroid/graphics/Paint\$FontMetricsInt;"
private const val PORTER_MODE = "Landroid/graphics/PorterDuff\$Mode;"
private const val REGISTER = "$HOLIDAY_LOOK->registerLogoSpan($SPAN)V"
private const val GATE = "$HOLIDAY_LOOK->isLogoTitle($TEXT)Z"
private const val BRIDGE = "$HOLIDAY_LOOK->drawLogoHat($CANVAS$VIEW$DRAWABLE$VIEW)V"
private const val DRAW = "$HOLIDAY_LOOK->drawLogoHatAt($CANVAS$TEXT${DRAWABLE}IIIIIII)V"

/** The additive logo path. Its stock String block, span ownership and caller are all preflighted. */
internal class HolidayLogoSites(
    val bar: MutableMethod,
    val gate: Int,
    val afterHat: Int,
    val create: MutableMethod,
    val registerAt: Int,
    private val overlay: FieldReference,
    private val titleType: String,
    private val themeType: String,
    private val stub: MutableMethod,
) {
    private lateinit var bridge: MutableMethod

    fun prepare() {
        try {
            insertBar(MutableMethod(ImmutableMethod.of(bar)))
            insertRegistration(MutableMethod(ImmutableMethod.of(create)))
            bridge = MutableMethod(ImmutableMethod(stub.definingClass, stub.name, stub.parameters,
                stub.returnType, stub.accessFlags, stub.annotations, stub.hiddenApiRestrictions, MutableMethodImplementation(16)))
            bridge.addInstructions(0, """
                move-object v0, p0
                check-cast p1, $titleType
                invoke-virtual {p1}, $titleType->getText()$TEXT
                move-result-object v1
                move-object v2, p2
                invoke-virtual {p1}, $titleType->getTextStartX()I
                move-result v3
                invoke-virtual {p1}, $titleType->getTextStartY()I
                move-result v4
                invoke-virtual {p1}, $titleType->getTextHeight()I
                move-result v5
                sget v6, $themeType->D1:I
                sget v7, $themeType->E1:I
                const/high16 v8, 0x41000000
                invoke-static {v8}, Lorg/telegram/messenger/AndroidUtilities;->dp(F)I
                move-result v8
                int-to-float v8, v8
                invoke-virtual {p3}, $VIEW->getScaleY()F
                move-result v9
                const/high16 v10, 0x3f800000
                sub-float v9, v10, v9
                mul-float/2addr v8, v9
                float-to-int v8, v8
                invoke-virtual {p3}, $VIEW->getAlpha()F
                move-result v9
                const/high16 v10, 0x437f0000
                mul-float/2addr v9, v10
                invoke-virtual {p1}, $VIEW->getAlpha()F
                move-result v10
                mul-float/2addr v9, v10
                float-to-int v9, v9
                invoke-static/range {v0 .. v9}, $DRAW
                return-void
            """.trimIndent())
        } catch (changed: PatchException) {
            refuse("logo bridge cannot be inserted: ${changed.message}")
        }
    }

    fun apply(context: BytecodePatchContext) {
        insertBar(bar)
        insertRegistration(create)
        val runtime = context.mutableClassDefBy(HOLIDAY_LOOK)
        runtime.methods.remove(stub)
        runtime.methods.add(bridge)
    }

    private fun insertBar(method: MutableMethod) {
        val scratch = method.freeLocalsAt("Holiday logo hat", gate, 1, targets = listOf(afterHat)).single()
        method.addInstructionsAtControlFlowLabel(gate, """
            invoke-static {v13}, $GATE
            move-result v$scratch
            if-eqz v$scratch, :hush_plain_title
            iget-object v$scratch, v0, $overlay
            invoke-static {v1, v8, v9, v$scratch}, $BRIDGE
            const/high16 v23, 0x437f0000
            const/high16 v24, 0x3f800000
            goto :hush_after_hat
            :hush_plain_title
            nop
        """.trimIndent(), ExternalLabel("hush_after_hat", method.getInstruction(afterHat)))
    }

    private fun insertRegistration(method: MutableMethod) {
        method.addInstructionsAtControlFlowLabel(registerAt, "invoke-static {v5}, $REGISTER")
    }
}

internal fun BytecodePatchContext.resolveHolidayLogoSites(holiday: HolidayLookSites): HolidayLogoSites {
    val stub = runtimeMethod("drawLogoHat", listOf(CANVAS, VIEW, DRAWABLE, VIEW), "V")
    runtimeMethod("registerLogoSpan", listOf(SPAN), "V")
    runtimeMethod("isLogoTitle", listOf(TEXT), "Z")
    runtimeMethod("drawLogoHatAt", listOf(CANVAS, TEXT, DRAWABLE) + List(7) { "I" }, "V")

    val originalBar = holiday.readers.single { it.name == "drawChild" }
    val bar = mutableClassDefBy(originalBar.definingClass).methods.single { it.name == "drawChild" &&
        it.parameterTypes.map(CharSequence::toString) == listOf(CANVAS, VIEW, "J") && it.returnType == "Z" }
    val body = bar.body()
    val asks = body.indices.filter { body[it].call()?.toString() == "${holiday.check.definingClass}->${holiday.check.name}()$DRAWABLE" }
    shape(asks.size == 1 && body.size > asks.single() + 96, "the bar no longer has one bounded holiday draw")
    val ask = asks.single()
    val at = ask + 10
    shape(body.count { it.opcode == Opcode.INSTANCE_OF && it.reference() == "Ljava/lang/String;" } == 1,
        "the bar no longer has one String gate")
    shape(bar.implementation!!.tryBlocks.isEmpty(), "the top bar gained a handler around its title")
    val titleType = body[at + 4].call()?.definingClass ?: refuse("the title has no text getter")
    val overlay = ownField(bar, body[ask + 3], null)
    val metrics = ownField(bar, body[at + 10], "Landroid/graphics/Paint\$FontMetricsInt;")
    val rect = ownField(bar, body[at + 15], "Landroid/graphics/Rect;")
    val animate = ownField(bar, body[at + 79], "Z")
    val theme = holiday.check.definingClass
    val supportFlag = ownField(bar, body[ask - 18], "Z")
    val searchFlag = ownField(bar, body[ask - 16], "Z")
    val titleViews = ownField(bar, body[ask - 12], "[$titleType")
    val overlayFlag = ownField(bar, body[ask - 5], "Z")
    val supports = classDefByOrNull(bar.definingClass)!!.methods.filter { it.name == "setSupportsHolidayImage" }
    shape(supports.size == 1 && supports.single().parameterTypes.map(CharSequence::toString) == listOf("Z") &&
        supports.single().returnType == "V" && AccessFlags.PUBLIC.isSet(supports.single().accessFlags) &&
        !AccessFlags.STATIC.isSet(supports.single().accessFlags) && !AccessFlags.ABSTRACT.isSet(supports.single().accessFlags) &&
        !AccessFlags.NATIVE.isSet(supports.single().accessFlags),
        "the holiday support flag no longer guards the title draw")
    window(MutableMethod(ImmutableMethod.of(supports.single())), 0, """
        iput-boolean p1, p0, $supportFlag
        if-eqz p1, :done
        new-instance p1, $FONT_METRICS
        invoke-direct {p1}, $FONT_METRICS-><init>()V
        iput-object p1, p0, $metrics
        new-instance p1, Landroid/graphics/Rect;
        invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V
        iput-object p1, p0, $rect
        :done
        invoke-virtual {p0}, $VIEW->invalidate()V
        return-void
        nop
    """.trimIndent(), "holiday support and bounds ownership")
    val prefix = """
        iget-boolean v8, v0, $supportFlag
        if-eqz v8, :skip
        iget-boolean v8, v0, $searchFlag
        if-nez v8, :skip
        sget-boolean v8, Lorg/telegram/messenger/LocaleController;->isRTL:Z
        if-nez v8, :skip
        iget-object v8, v0, $titleViews
        aget-object v9, v8, v6
        if-eq v2, v9, :ask
        aget-object v9, v8, v4
        if-eq v2, v9, :ask
        iget-object v9, v0, $overlay
        if-ne v2, v9, :skip
        iget-boolean v9, v0, $overlayFlag
        if-eqz v9, :skip
        goto :ask
        :skip
        move/from16 v17, v3
        goto/16 :end
        :ask
        invoke-static {}, ${holiday.check.definingClass}->${holiday.check.name}()$DRAWABLE
        move-result-object v9
        if-eqz v9, :skip
        iget-object v10, v0, $overlay
        if-ne v2, v10, :child
        aget-object v8, v8, v6
        goto :title
        :child
        move-object v8, v2
        check-cast v8, $titleType
        :title
        const/4 v12, 0x2
        :end
        nop
    """.trimIndent().toInstructions(bar).toList()
    shape(body.subList(ask - 18, at).map(::operation) == prefix.dropLast(1).map(::operation),
        "the holiday drawable or supported title selection changed")
    val barFlow = ControlFlow.of(bar)
    val branches = mapOf(-17 to listOf(-16, -2), -15 to listOf(-14, -2), -13 to listOf(-12, -2),
        -10 to listOf(-9, 0), -8 to listOf(-7, 0), -6 to listOf(-5, -2), -4 to listOf(-3, -2),
        -3 to listOf(0), 2 to listOf(3, -2), 4 to listOf(5, 7), 6 to listOf(9))
    branches.forEach { (source, targets) -> shape(barFlow.normal[ask + source].toSet() == targets.map { it + ask }.toSet(),
        "the holiday title selection changed a branch") }
    shape(body[13].opcode == Opcode.CONST_4 && body[13].namedRegisters() == listOf(4) && body[13].literal() == 1L &&
        body[21].opcode == Opcode.CONST_4 && body[21].namedRegisters() == listOf(6) && body[21].literal() == 0L &&
        barFlow.preservesValue(13, ask - 9, 4) && barFlow.preservesValue(21, ask - 11, 6) &&
        barFlow.preservesValue(21, at + 16, 6), "the title array or first-letter bounds operands changed")
    shape(body[ask + 8].reference() == titleType && body[ask + 8].opcode == Opcode.CHECK_CAST,
        "the holiday title no longer has its original type")
    val titleClass = classDefByOrNull(titleType)
    shape(titleClass != null && AccessFlags.PUBLIC.isSet(titleClass.accessFlags), "the title class is no longer public")
    for ((name, result) in listOf("getText" to TEXT, "getTextStartX" to "I", "getTextStartY" to "I", "getTextHeight" to "I")) {
        shape(titleClass!!.methods.count { it.name == name && it.parameterTypes.isEmpty() && it.returnType == result &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) &&
            !AccessFlags.ABSTRACT.isSet(it.accessFlags) && !AccessFlags.NATIVE.isSet(it.accessFlags) && it.body().isNotEmpty() } == 1,
            "the title's $name is no longer callable")
    }
    val geometryTitle = mutableClassDefBy(titleType)
    val height = geometryTitle.methods.single { it.name == "getTextHeight" && it.parameterTypes.isEmpty() }
    val startX = geometryTitle.methods.single { it.name == "getTextStartX" && it.parameterTypes.isEmpty() }
    val startY = geometryTitle.methods.single { it.name == "getTextStartY" && it.parameterTypes.isEmpty() }
    // These two complete field layouts belong to the declared web and beta fixtures. Keep them
    // coherent: accepting any same-typed field would also accept a width as the line height.
    val heightField = ownField(height, height.body().first(), "I")
    val (padding, rightInside, offset) = when (heightField.name) {
        "f0" -> Triple("H", "E", "b0")
        "g0" -> Triple("I", "F", "c0")
        else -> refuse("the title geometry field layout changed")
    }
    for ((getter, registers, count) in listOf(Triple(height, 2, 2), Triple(startX, 5, 33), Triple(startY, 2, 8))) {
        shape(getter.implementation!!.registerCount == registers && getter.body().size == count &&
            getter.implementation!!.tryBlocks.isEmpty(), "the title's ${getter.name} geometry shape changed")
        getter.body().filter { it.field() != null }.forEach { ownField(getter, it, null) }
    }
    window(height, 0, """
        iget v0, p0, $heightField
        return v0
        nop
    """.trimIndent(), "title line height")
    window(startX, 0, """
        iget-object v0, p0, $titleType->c:Landroid/text/StaticLayout;
        const/4 v1, 0x0
        if-nez v0, :layout
        return v1
        :layout
        iget-object v0, p0, $titleType->v:$DRAWABLE
        const/4 v2, 0x3
        if-eqz v0, :right
        iget v3, p0, $titleType->n:I
        and-int/lit8 v3, v3, 0x7
        if-ne v3, v2, :right
        iget v1, p0, $titleType->$padding:I
        invoke-virtual {v0}, $DRAWABLE->getIntrinsicWidth()I
        move-result v0
        add-int/2addr v1, v0
        :right
        iget-object v0, p0, $titleType->y:$DRAWABLE
        if-eqz v0, :position
        iget v3, p0, $titleType->$rightInside:I
        if-gez v3, :position
        iget v3, p0, $titleType->n:I
        and-int/lit8 v3, v3, 0x7
        if-ne v3, v2, :position
        iget v2, p0, $titleType->$padding:I
        invoke-virtual {v0}, $DRAWABLE->getIntrinsicWidth()I
        move-result v0
        add-int/2addr v0, v2
        add-int/2addr v1, v0
        :position
        invoke-virtual {p0}, $VIEW->getX()F
        move-result v0
        float-to-int v0, v0
        iget v2, p0, $titleType->$offset:I
        add-int/2addr v0, v2
        add-int/2addr v0, v1
        return v0
        nop
    """.trimIndent(), "title horizontal placement")
    window(startY, 0, """
        iget-object v0, p0, $titleType->c:Landroid/text/StaticLayout;
        if-nez v0, :layout
        const/4 v0, 0x0
        return v0
        :layout
        invoke-virtual {p0}, $VIEW->getY()F
        move-result v0
        float-to-int v0, v0
        return v0
        nop
    """.trimIndent(), "title vertical placement")
    for (offset in listOf("D1", "E1")) {
        shape(classDefByOrNull(theme)?.fields?.count { it.name == offset && it.type == "I" &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) } == 1,
            "the holiday $offset offset is no longer public static")
    }
    window(bar, at, """
        if-eqz v8, :no_hat
        invoke-virtual {v8}, $VIEW->getVisibility()I
        move-result v13
        if-nez v13, :no_hat
        invoke-virtual {v8}, $titleType->getText()$TEXT
        move-result-object v13
        instance-of v13, v13, Ljava/lang/String;
        if-eqz v13, :no_hat
        invoke-virtual {v8}, $titleType->getTextPaint()Landroid/text/TextPaint;
        move-result-object v13
        iget-object v14, v0, $metrics
        invoke-virtual {v13, v14}, Landroid/graphics/Paint;->getFontMetricsInt($FONT_METRICS)I
        invoke-virtual {v8}, $titleType->getText()$TEXT
        move-result-object v14
        check-cast v14, Ljava/lang/String;
        iget-object v15, v0, $rect
        invoke-virtual {v13, v14, v6, v4, v15}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V
        invoke-virtual {v8}, $titleType->getTextStartX()I
        move-result v13
        sget v14, $theme->D1:I
        add-int/2addr v13, v14
        iget-object v14, v0, $rect
        invoke-virtual {v14}, Landroid/graphics/Rect;->width()I
        move-result v14
        invoke-virtual {v9}, $DRAWABLE->getIntrinsicWidth()I
        move-result v15
        sget v16, $theme->D1:I
        add-int v15, v15, v16
        sub-int/2addr v14, v15
        div-int/2addr v14, v12
        add-int/2addr v14, v13
        invoke-virtual {v8}, $titleType->getTextStartY()I
        move-result v13
        sget v15, $theme->E1:I
        add-int/2addr v13, v15
        invoke-virtual {v8}, $titleType->getTextHeight()I
        move-result v15
        const/high16 v23, 0x437f0000
        iget-object v10, v0, $rect
        invoke-virtual {v10}, Landroid/graphics/Rect;->height()I
        move-result v10
        sub-int/2addr v15, v10
        int-to-float v10, v15
        const/high16 v15, 0x40000000
        div-float/2addr v10, v15
        const/high16 v24, 0x3f800000
        float-to-double v11, v10
        invoke-static {v11, v12}, Ljava/lang/Math;->ceil(D)D
        move-result-wide v10
        double-to-int v10, v10
        add-int/2addr v13, v10
        const/high16 v10, 0x41000000
        invoke-static {v10}, Lorg/telegram/messenger/AndroidUtilities;->dp(F)I
        move-result v10
        int-to-float v10, v10
        iget-object v11, v0, $overlay
        invoke-virtual {v11}, $VIEW->getScaleY()F
        move-result v11
        sub-float v11, v24, v11
        mul-float v11, v11, v10
        float-to-int v10, v11
        add-int/2addr v13, v10
        invoke-virtual {v9}, $DRAWABLE->getIntrinsicHeight()I
        move-result v10
        sub-int v10, v13, v10
        invoke-virtual {v9}, $DRAWABLE->getIntrinsicWidth()I
        move-result v11
        add-int/2addr v11, v14
        invoke-virtual {v9, v14, v10, v11, v13}, $DRAWABLE->setBounds(IIII)V
        iget-object v10, v0, $overlay
        invoke-virtual {v10}, $VIEW->getAlpha()F
        move-result v10
        mul-float v10, v10, v23
        invoke-virtual {v8}, $VIEW->getAlpha()F
        move-result v8
        mul-float v8, v8, v10
        float-to-int v8, v8
        invoke-virtual {v9, v8}, $DRAWABLE->setAlpha(I)V
        invoke-virtual {v9, v1}, $DRAWABLE->draw($CANVAS)V
        iget-boolean v8, v0, $animate
        if-eqz v8, :snow
        invoke-virtual {v2}, $VIEW->invalidate()V
        invoke-virtual {v0}, $VIEW->invalidate()V
        goto :snow
        :no_hat
        const/high16 v23, 0x437f0000
        const/high16 v24, 0x3f800000
        :snow
        nop
    """.trimIndent(), "String gate and holiday placement math")

    val screens = mutableListOf<Method>()
    classDefForEach { owner -> if (!owner.type.startsWith("Lapp/hushtelegram/extension/")) {
        owner.methods.filterTo(screens) { method -> method.body().any { it.call()?.let { call ->
            call.definingClass == bar.definingClass && call.name == "setSupportsHolidayImage" &&
                call.parameterTypes.map(CharSequence::toString) == listOf("Z") && call.returnType == "V" } == true } }
    } }
    shape(screens.size == 1 && screens.single().name == "createView", "the holiday image no longer belongs to one chat list screen")
    val originalCreate = screens.single()
    val create = mutableClassDefBy(originalCreate.definingClass).methods.single { it.name == "createView" &&
        it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") && it.returnType == VIEW }
    val title = create.body()
    val logoReads = title.indices.filter { title[it].reference() == LOGO }
    shape(logoReads.size == 1 && logoReads.single() > 59 && title.size > logoReads.single() + 50,
        "the chat list no longer has one bounded logo title")
    val logo = logoReads.single()
    val start = logo - 2
    val logoField = ownField(create, title[logo + 5], DRAWABLE)
    val titleSetter = title[logo + 38].call() ?: refuse("no logo title setter")
    val actionBar = title[logo + 36].field() ?: refuse("no logo action bar")
    val decoration = ownField(create, title[logo + 37], null)
    val color = title[logo + 20].field() ?: refuse("no logo theme color")
    val colorGetter = title[logo + 21].call() ?: refuse("no logo color getter")
    shape(actionBar.name == "actionBar" && actionBar.type == bar.definingClass && titleSetter.definingClass == bar.definingClass &&
        titleSetter.name == "I" && titleSetter.returnType == "V" &&
        titleSetter.parameterTypes.map(CharSequence::toString) == listOf(TEXT, decoration.type) &&
        color.definingClass == theme && color.type == "I" && colorGetter.name == "getThemedColor",
        "the logo is no longer the chat list's action bar title")
    requireTitleStorage(titleSetter, titleType, titleViews)
    window(create, start, """
        invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
        move-result-object v3
        sget v5, $LOGO
        invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDrawable(I)$DRAWABLE
        move-result-object v3
        invoke-virtual {v3}, $DRAWABLE->mutate()$DRAWABLE
        move-result-object v3
        iput-object v3, v1, $logoField
        const/high16 v5, 0x40000000
        invoke-static {v5}, Lorg/telegram/messenger/AndroidUtilities;->dp(F)I
        move-result v9
        iget-object v10, v1, $logoField
        invoke-virtual {v10}, $DRAWABLE->getIntrinsicWidth()I
        move-result v10
        invoke-static {v5}, Lorg/telegram/messenger/AndroidUtilities;->dp(F)I
        move-result v5
        iget-object v12, v1, $logoField
        invoke-virtual {v12}, $DRAWABLE->getIntrinsicHeight()I
        move-result v12
        add-int/2addr v12, v5
        invoke-virtual {v3, v11, v9, v10, v12}, $DRAWABLE->setBounds(IIII)V
        iget-object v3, v1, $logoField
        sget v5, $color
        invoke-virtual {v1, v5}, $colorGetter
        move-result v5
        sget-object v9, $PORTER_MODE->MULTIPLY:$PORTER_MODE
        invoke-virtual {v3, v5, v9}, $DRAWABLE->setColorFilter(I$PORTER_MODE)V
        new-instance v3, $BUILDER
        sget v5, $APP_NAME
        invoke-static {v5}, Lorg/telegram/messenger/LocaleController;->getString(I)Ljava/lang/String;
        move-result-object v5
        invoke-direct {v3, v5}, $BUILDER-><init>($TEXT)V
        new-instance v5, $SPAN
        iget-object v9, v1, $logoField
        invoke-direct {v5, v9}, $SPAN-><init>($DRAWABLE)V
        invoke-virtual {v3}, $BUILDER->length()I
        move-result v9
        invoke-virtual {v3, v5, v11, v9, v6}, $BUILDER->setSpan(Ljava/lang/Object;III)V
        iget-object v5, v1, $actionBar
        iget-object v9, v1, $decoration
        invoke-virtual {v5, v3, v9}, $titleSetter
        nop
    """.trimIndent(), "logo bounds, ImageSpan ownership and title placement")
    val flow = ControlFlow.of(create)
    shape(create.implementation!!.tryBlocks.isEmpty(), "the logo title gained a handler")
    shape(flow.preservesValue(2, logo + 18, 11) && flow.preservesValue(2, logo + 35, 11) &&
        title[2].opcode == Opcode.CONST_4 && title[2].namedRegisters() == listOf(11) && title[2].literal() == 0L,
        "the logo no longer starts its bounds and span at zero")
    val flags = (0 until start).lastOrNull { title[it].writes(6) } ?: refuse("no logo span flags")
    shape(title[flags].opcode == Opcode.CONST_16 && title[flags].literal() == 33L &&
        flow.preservesValue(flags, logo + 35, 6), "the logo's span flags changed or can be overwritten")
    val support = title.indices.singleOrNull { title[it].call()?.name == "setSupportsHolidayImage" }
        ?: refuse("no unique holiday support call")
    val mode = title[support - 3].field() ?: refuse("no chat list mode gate")
    shape(mode.definingClass == create.definingClass && mode.type == "I" &&
        title[support - 2].opcode == Opcode.IF_NEZ && title[support - 2].namedRegisters() == listOf(3) &&
        flow.normal[support - 2].toSet() == setOf(support - 1, support + 1) &&
        flow.preservesValue(66, support, 8) && title[66].opcode == Opcode.CONST_4 && title[66].literal() == 1L,
        "holiday support no longer belongs only to the main chat list")
    val modeRead = start - 57
    shape(title[modeRead].opcode == Opcode.IGET && title[modeRead].field()?.toString() == mode.toString() &&
        title[modeRead].namedRegisters() == listOf(3, 1) && title[modeRead + 1].opcode == Opcode.IF_EQZ &&
        title[modeRead + 1].namedRegisters() == listOf(3) &&
        flow.normal[modeRead + 1].toSet() == setOf(modeRead + 2, modeRead + 8) &&
        flow.normal[modeRead + 7] == listOf(support - 3) && flow.dominates(modeRead + 1, start),
        "the logo is no longer confined to chat list mode zero")
    return HolidayLogoSites(bar, at + 6, at + 79, create, logo + 33, overlay, titleType, theme, stub)
}

/** The owned ImageSpan must reach the exact field getText reads, without a String conversion. */
private fun BytecodePatchContext.requireTitleStorage(setter: MethodReference, titleType: String, titleViews: FieldReference) {
    fun method(reference: MethodReference): MutableMethod {
        val methods = mutableClassDefBy(reference.definingClass).methods.filter { it.name == reference.name &&
            it.parameterTypes.map(CharSequence::toString) == reference.parameterTypes.map(CharSequence::toString) &&
            it.returnType == reference.returnType }
        shape(methods.size == 1 && AccessFlags.PUBLIC.isSet(methods.single().accessFlags) &&
            !AccessFlags.STATIC.isSet(methods.single().accessFlags) && !AccessFlags.NATIVE.isSet(methods.single().accessFlags) &&
            !AccessFlags.ABSTRACT.isSet(methods.single().accessFlags) && methods.single().body().isNotEmpty(),
            "the logo title forwarding method is no longer callable")
        return methods.single()
    }
    val actionBarSetter = method(setter)
    val body = actionBarSetter.body()
    shape(body.size > 17 && actionBarSetter.implementation!!.registerCount == 7 &&
        actionBarSetter.implementation!!.tryBlocks.isEmpty() && body[0].opcode == Opcode.IGET_OBJECT &&
        body[0].field()?.toString() == titleViews.toString() && body[0].namedRegisters() == listOf(0, 4) &&
        body[1].opcode == Opcode.CONST_4 && body[1].namedRegisters() == listOf(1) && body[1].literal() == 0L &&
        body[15].opcode == Opcode.AGET_OBJECT && body[15].namedRegisters() == listOf(2, 0, 1) &&
        body[16].opcode == Opcode.IPUT_OBJECT && body[16].namedRegisters() == listOf(5, 4) &&
        body[17].opcode == Opcode.INVOKE_VIRTUAL && body[17].namedRegisters() == listOf(2, 5),
        "the logo title no longer forwards unchanged to its first title view")
    ownField(actionBarSetter, body[16], TEXT)
    val flow = ControlFlow.of(actionBarSetter)
    val hidden = ownField(actionBarSetter, body[9], "Z")
    val storedTitle = body[16].field()!!
    val createTitle = body[5].call() ?: refuse("no title view creation")
    shape(createTitle.definingClass == setter.definingClass && createTitle.parameterTypes.map(CharSequence::toString) == listOf("I") &&
        createTitle.returnType == "V", "the logo's title view creation changed")
    val forwardingPrefix = """
        iget-object v0, p0, $titleViews
        const/4 v1, 0x0
        if-eqz p1, :title_view
        aget-object v2, v0, v1
        if-nez v2, :title_view
        invoke-virtual {p0, v1}, $createTitle
        :title_view
        aget-object v2, v0, v1
        if-eqz v2, :no_title
        if-eqz p1, :invisible
        iget-boolean v3, p0, $hidden
        if-nez v3, :invisible
        const/4 v3, 0x0
        goto :visibility
        :invisible
        const/4 v3, 0x4
        :visibility
        invoke-virtual {v2, v3}, $VIEW->setVisibility(I)V
        aget-object v2, v0, v1
        iput-object p1, p0, $storedTitle
        invoke-virtual {v2, p1}, ${body[17].call()}
        :no_title
        nop
    """.trimIndent().toInstructions(actionBarSetter).toList().dropLast(1)
    shape(body.take(18).map(::operation) == forwardingPrefix.map(::operation), "the logo's visible title forwarding changed")
    for ((source, targets) in mapOf(2 to listOf(3, 6), 4 to listOf(5, 6), 7 to listOf(8, 40),
        8 to listOf(9, 13), 10 to listOf(11, 13), 12 to listOf(14))) {
        shape(flow.normal[source].toSet() == targets.toSet(), "the logo title forwarding changed a branch")
    }
    shape(flow.preservesValue(0, 15, 0) && flow.preservesValue(1, 15, 1) && flow.preservesParameter(17, 5) &&
        flow.normal[15] == listOf(16) && flow.normal[16] == listOf(17) && flow.dominates(15, 17),
        "the logo title or its destination can be overwritten before forwarding")
    val forward = body[17].call() ?: refuse("no logo title forwarding call")
    shape(forward.definingClass == titleType && forward.parameterTypes.map(CharSequence::toString) == listOf(TEXT) &&
        forward.returnType == "Z", "the logo title no longer reaches the text view as a CharSequence")
    val wrapper = method(forward)
    val nested = wrapper.body().getOrNull(1)?.call() ?: refuse("no logo title storage call")
    shape(nested.definingClass == titleType && nested.parameterTypes.map(CharSequence::toString) == listOf(TEXT, "Z") &&
        nested.returnType == "Z", "the logo title storage signature changed")
    window(wrapper, 0, """
        const/4 v0, 0x0
        invoke-virtual {p0, p1, v0}, $nested
        move-result p1
        return p1
        nop
    """.trimIndent(), "logo title forwarding")
    val storage = method(nested)
    shape(storage.body().size == 16 && storage.implementation!!.tryBlocks.isEmpty(), "the logo text storage shape changed")
    val textField = ownField(storage, storage.body()[0], TEXT)
    val refreshField = ownField(storage, storage.body()[12], "I")
    val refresh = storage.body()[13].call() ?: refuse("no title layout refresh")
    shape(refresh.definingClass == titleType && refresh.parameterTypes.isEmpty() && refresh.returnType == "Z",
        "the logo text layout refresh changed")
    window(storage, 0, """
        iget-object v0, p0, $textField
        if-nez v0, :existing
        if-eqz p1, :same
        :existing
        if-nez p2, :update
        if-eqz v0, :update
        invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
        move-result p2
        if-eqz p2, :update
        :same
        const/4 p1, 0x0
        return p1
        :update
        iput-object p1, p0, $textField
        const/16 p1, 0x1f4
        iput p1, p0, $refreshField
        invoke-virtual {p0}, $refresh
        const/4 p1, 0x1
        return p1
        nop
    """.trimIndent(), "owned logo CharSequence storage")
    val getter = mutableClassDefBy(titleType).methods.single { it.name == "getText" && it.parameterTypes.isEmpty() }
    window(getter, 0, """
        iget-object v0, p0, $textField
        if-nez v0, :done
        const-string v0, ""
        :done
        return-object v0
        nop
    """.trimIndent(), "owned logo text getter")
}

private fun BytecodePatchContext.runtimeMethod(name: String, parameters: List<String>, result: String): MutableMethod {
    val owner = mutableClassDefBy(HOLIDAY_LOOK)
    val methods = owner.methods.filter { it.name == name }
    shape(AccessFlags.PUBLIC.isSet(owner.accessFlags) && methods.size == 1, "no unique public logo runtime $name")
    val method = methods.single()
    shape(method.parameterTypes.map(CharSequence::toString) == parameters && method.returnType == result &&
        AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.STATIC.isSet(method.accessFlags) &&
        !AccessFlags.NATIVE.isSet(method.accessFlags) && !AccessFlags.ABSTRACT.isSet(method.accessFlags) && method.body().isNotEmpty(),
        "no callable public static logo runtime $name")
    return method
}

private fun BytecodePatchContext.ownField(method: Method, instruction: Instruction, type: String?): FieldReference {
    val field = instruction.field() ?: refuse("a title field disappeared")
    shape(field.definingClass == method.definingClass && (type == null || field.type == type) &&
        classDefByOrNull(field.definingClass)?.fields?.count { it.name == field.name && it.type == field.type &&
            !AccessFlags.STATIC.isSet(it.accessFlags) } == 1, "a title field no longer belongs to its host")
    return field
}

/** Pin every operand and edge, including unused arithmetic results, before adding the alternate path. */
private fun window(method: MutableMethod, start: Int, smali: String, what: String) {
    val expected = smali.toInstructions(method).toList()
    val size = expected.size - 1 // The final nop stands in for the stock instruction just after the window.
    val body = method.body()
    shape(start >= 0 && start + size <= body.size &&
        body.subList(start, start + size).map(::operation) == expected.take(size).map(::operation), "$what changed")
    val trial = MutableMethod(ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
        method.accessFlags, null, null, MutableMethodImplementation(method.implementation!!.registerCount)))
    trial.addInstructions(0, smali)
    val stock = ControlFlow.of(method)
    val pinned = ControlFlow.of(trial)
    for (i in 0 until size) shape(stock.normal[start + i] == pinned.normal[i].map { it + start }, "$what changed a branch")
    for (i in body.indices) if (i !in start until start + size) {
        shape(stock.normal[i].none { it in start + 1 until start + size }, "$what gained an outside entry")
    }
}

private fun ControlFlow.dominates(source: Int, use: Int): Boolean {
    val pending = ArrayDeque<Int>()
    val visited = mutableSetOf<Int>()
    pending += 0
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == source || !visited.add(at)) continue
        if (at == use) return false
        pending.addAll(normal[at] + exceptional[at])
    }
    return true
}

private fun ControlFlow.preservesParameter(use: Int, register: Int): Boolean {
    val pending = ArrayDeque<Pair<Int, Boolean>>()
    val visited = mutableSetOf<Pair<Int, Boolean>>()
    var reached = false
    pending += 0 to false
    while (pending.isNotEmpty()) {
        val state = pending.removeFirst()
        if (!visited.add(state)) continue
        val (at, changed) = state
        if (at == use) {
            if (changed) return false
            reached = true
        }
        normal[at].forEach { pending += it to (changed || instructions[at].writes(register)) }
        exceptional[at].forEach { pending += it to changed }
    }
    return reached
}

private fun ControlFlow.preservesValue(source: Int, use: Int, register: Int): Boolean {
    if (!dominates(source, use)) return false
    val predecessors = Array(instructions.size) { mutableListOf<Int>() }
    instructions.indices.forEach { at -> (normal[at] + exceptional[at]).forEach { predecessors[it] += at } }
    val pending = ArrayDeque<Int>()
    val reachesUse = mutableSetOf<Int>()
    pending += use
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == source || !reachesUse.add(at)) continue
        pending.addAll(predecessors[at])
    }
    val visited = mutableSetOf<Int>()
    pending.addAll(normal[source])
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == source || !visited.add(at)) continue
        if (at in reachesUse && instructions[at].writes(register)) return false
        pending.addAll(normal[at] + exceptional[at])
    }
    return use in visited
}

private fun Instruction.writes(register: Int): Boolean {
    val destination = namedRegisters().firstOrNull() ?: return false
    return opcode.setsRegister() && (destination == register || opcode.setsWideRegister() && destination + 1 == register)
}
private fun operation(instruction: Instruction) = listOf(instruction.opcode, instruction.namedRegisters(), instruction.reference(), instruction.literal())
private fun Instruction.literal() = (this as? WideLiteralInstruction)?.wideLiteral
private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Method.body() = implementation?.instructions?.toList().orEmpty()
private fun shape(valid: Boolean, reason: String) { if (!valid) refuse(reason) }
private fun refuse(reason: String): Nothing = throw PatchException("Holiday look all year: $reason (before editing)")
