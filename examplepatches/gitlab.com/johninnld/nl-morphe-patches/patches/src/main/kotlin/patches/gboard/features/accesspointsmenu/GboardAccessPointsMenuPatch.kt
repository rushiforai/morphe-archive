package patches.gboard.features.accesspointsmenu

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import patches.gboard.shared.GboardFieldTarget
import patches.gboard.shared.GboardMethodTarget
import patches.gboard.shared.addHelperMethodIfMissing
import patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import patches.gboard.shared.isFieldReference
import patches.gboard.shared.isMethodReference
import patches.gboard.shared.mutableClass
import patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import patches.gboard.shared.runtimeabi.RuntimeCallId
import patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import patches.gboard.Constants.COMPATIBILITY_GBOARD

private const val KEYBOARD = "Lcom/google/android/libraries/inputmethod/keyboard/impl/Keyboard;"
private const val VIEW_DEF = "Lcom/google/android/libraries/inputmethod/metadata/KeyboardViewDef;"
private const val MOTION = "[Lcom/google/android/libraries/inputmethod/metadata/KeyboardViewDef\$MotionEventHandlerInfo;"
private const val POPUP = "Lcom/google/android/libraries/inputmethod/accesspoint/impl/AccessPointDragPopupView;"
private const val ICON = "Lcom/google/android/libraries/inputmethod/widgets/NonLinearScaleImageView;"
private const val VIEW = "Landroid/view/View;"
private const val PRIVATE_FINAL = 0x12

internal val gboardAccessPointsMenu1853Patch = bytecodePatch(
    description = "Restore the 18.5.4 toolbar menu style, next-open cache, full keyboard and drag icons.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)
    execute {
        val bind = GboardMethodTarget("Laajh;", "k", listOf("Lxno;"), "V").resolve(this)
        val open = GboardMethodTarget("Laajh;", "r", emptyList(), "V").resolve(this)
        val native = GboardMethodTarget(KEYBOARD, "F", listOf(VIEW_DEF, "Lafgs;"), "Lafgt;").resolve(this)
        val drag = GboardMethodTarget("Laajy;", "z", listOf("Ljava/lang/String;", "Z"), "V").resolve(this)
        val inflate = GboardMethodTarget(POPUP, "onFinishInflate", emptyList(), "V").resolve(this)
        val publicFinal = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
        check(bind.accessFlags == publicFinal && open.accessFlags == publicFinal && drag.accessFlags == publicFinal)
        check(native.accessFlags == PRIVATE_FINAL)
        check(inflate.accessFlags == (AccessFlags.PROTECTED.value or AccessFlags.FINAL.value))

        requireMenuPanelCleanup(mutableClass("Laarm;"), mutableClass("Laadb;"))
        listOf(
            GboardMethodTarget("Lafhp;", "f", listOf("I"), "V"),
            GboardMethodTarget(ICON, "<init>", listOf("Landroid/content/Context;"), "V"),
            GboardMethodTarget(VIEW_DEF, "<init>", listOf("I", "Lagoz;", "Z", "I", "Z", "Z", "Lagot;",
                "Lcom/google/android/libraries/inputmethod/metadata/KeyMappingDef;", MOTION), "V"),
        ).forEach { it.resolve(this) }
        listOf(
            GboardFieldTarget("Laajh;", "e", "Lafhp;"),
            GboardFieldTarget("Laajh;", "p", "Z"), GboardFieldTarget("Laajh;", "r", "Z"),
            GboardFieldTarget("Laajh;", "k", "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;"),
            GboardFieldTarget("Laajh;", "l", "Laarm;"), GboardFieldTarget("Lafhp;", "k", "I"),
            GboardFieldTarget("Laagz;", "d", "Z"), GboardFieldTarget("Lagoz;", "b", "Lagoz;"),
            GboardFieldTarget(POPUP, "a", "F"), GboardFieldTarget(POPUP, "d", VIEW),
            GboardFieldTarget(POPUP, "e", "Laahe;"),
        ).forEach { it.resolve(this) }
        val types = listOf("I", "Lagoz;", "Z", "I", "Z", "Z", "Lagot;",
            "Lcom/google/android/libraries/inputmethod/metadata/KeyMappingDef;", MOTION)
        types.forEachIndexed { i, type ->
            val field = GboardFieldTarget(VIEW_DEF, ('a' + i).toString(), type).resolve(this)
            check(field.accessFlags == (AccessFlags.PUBLIC.value or AccessFlags.FINAL.value))
        }
        requireMenu1853Shape(bind, open, native, drag, inflate)

        mutableClass("Laajh;").addHelperMethodIfMissing("morpheRefreshMenuBody", emptyList(), "V",
            PRIVATE_FINAL, 5, menuRefreshBody())
        mutableClass("Lafhp;").addHelperMethodIfMissing("morpheMenuBodyId", emptyList(), "I",
            publicFinal, 2, """
                iget v0, p0, Lafhp;->k:I
                return v0
            """)
        mutableClass(KEYBOARD).addHelperMethodIfMissing("morpheMenuViewDef", listOf(VIEW_DEF), VIEW_DEF,
            PRIVATE_FINAL, 12, menuViewDefBody())
        bind.applyMenu1853Bind()
        open.addInstructions(0, "invoke-direct {p0}, Lnib;->morpheRefreshMenuBody()V")
        native.addInstructions(0, """
            invoke-direct {p0, p1}, $KEYBOARD->morpheMenuViewDef($VIEW_DEF)$VIEW_DEF
            move-result-object p1
        """)
        drag.applyMenu1853Drag()

        val popup = mutableClass(POPUP)
        val stockInflate = ImmutableMethod(inflate.definingClass, "morpheStockMenuInflate", inflate.parameters,
            inflate.returnType, PRIVATE_FINAL, inflate.annotations, inflate.hiddenApiRestrictions,
            inflate.implementation).toMutable()
        check(popup.methods.remove(inflate) && popup.methods.add(stockInflate))
        popup.addHelperMethodIfMissing("onFinishInflate", emptyList(), "V",
            AccessFlags.PROTECTED.value or AccessFlags.FINAL.value, 5, menuInflateBody())
    }
}

internal fun requireMenuPanelCleanup(panelInterface: MutableClass, declaringInterface: MutableClass): MutableMethod {
    val interfaceFlags = AccessFlags.PUBLIC.value or AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value
    check(panelInterface.type == "Laarm;" && panelInterface.accessFlags == interfaceFlags) {
        "Expected exact1853 public abstract menu panel interface mte"
    }
    check("Laadb;" in panelInterface.interfaces) { "mte must inherit the exact mtc cleanup contract" }
    check(declaringInterface.type == "Laadb;" && declaringInterface.accessFlags == interfaceFlags) {
        "Expected exact1853 public abstract cleanup declaring interface mtc"
    }
    val cleanup = GboardMethodTarget("Laadb;", "k", emptyList(), "V").resolve(declaringInterface)
    check(cleanup.accessFlags == (AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value)) {
        "mtc.l must remain public abstract instance ()V"
    }
    return cleanup
}

internal fun requireMenu1853Shape(bind: MutableMethod, open: MutableMethod, native: MutableMethod,
    drag: MutableMethod, inflate: MutableMethod) {
    check(bind.implementation!!.registerCount == 2)
    check(open.implementation!!.registerCount == 12)
    check(native.implementation!!.registerCount == 10)
    check(drag.implementation!!.registerCount == 19)
    check(inflate.implementation!!.registerCount == 3)
    check(bind.implementation!!.instructions.count { it.isMethodReference("Lagel;->f(I)V") } == 1)
    check(bind.implementation!!.instructions.count { (it as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f0b070d } == 1)
    check(open.implementation!!.instructions.any { it.isFieldReference("Labbv;->p:Z") })
    check(open.implementation!!.instructions.any { it.isFieldReference("Labbv;->r:Z") })
    check(drag.implementation!!.instructions.count { it.isFieldReference("Laazq;->d:Z") } == 1)
    check(drag.implementation!!.instructions.count { it.isFieldReference("$POPUP->a:F") } == 1)
    check(inflate.implementation!!.instructions.count { it.isMethodReference("Laahe;-><init>($VIEW)V") } == 1)
    listOf(bind, open, native, drag, inflate).forEach { method ->
        check(method.implementation!!.instructions.none {
            it.isMethodReference(RuntimeAbiCatalog.abi(RuntimeCallId.ACCESS_POINTS_MENU_RUNTIME_SELECT_BODY).reference) ||
                it.isMethodReference("Laajh;->morpheRefreshMenuBody()V")
        }) { "Refusing partially/repeatedly transformed1853 menu group" }
    }
}

internal fun MutableMethod.applyMenu1853Bind() {
    val index = implementation!!.instructions.indexOfFirst {
        (it as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f0b070d
    }
    check(index >= 0)
    val register = (implementation!!.instructions[index] as OneRegisterInstruction).registerA
    addInstructions(index + 1, """
        ${RuntimeCallEmitter.invoke(RuntimeCallId.ACCESS_POINTS_MENU_RUNTIME_SELECT_BODY, "v$register")}
        move-result v$register
    """)
}

internal fun MutableMethod.applyMenu1853Drag() {
    val scale = implementation!!.instructions.indexOfFirst { it.isFieldReference("$POPUP->a:F") }
    val scaleRead = implementation!!.instructions[scale] as TwoRegisterInstruction
    check(scaleRead.registerA == 15 && scaleRead.registerB == 1)
    addInstructions(scale + 1, """
        ${RuntimeCallEmitter.invoke(RuntimeCallId.ACCESS_POINTS_MENU_RUNTIME_DRAG_SCALE, "v1, v15")}
        move-result v15
    """)
    val mode = implementation!!.instructions.indexOfFirst { it.isFieldReference("Laazq;->d:Z") }
    val modeRead = implementation!!.instructions[mode] as TwoRegisterInstruction
    check(modeRead.registerA == 10 && modeRead.registerB == 0)
    addInstructions(mode + 1, """
        ${RuntimeCallEmitter.invoke(RuntimeCallId.ACCESS_POINTS_MENU_RUNTIME_DRAG_MODE, "v1, v10")}
        move-result v10
    """)
}

internal fun menuRefreshBody(): String = """
    iget-boolean v0, p0, Laajh;->p:Z
    if-nez v0, :done
    iget-boolean v0, p0, Laajh;->r:Z
    if-nez v0, :done
    iget-object v0, p0, Laajh;->e:Lafhp;
    invoke-virtual {v0}, Lafhp;->morpheMenuBodyId()I
    move-result v1
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ACCESS_POINTS_MENU_RUNTIME_SELECT_BODY, "v1")}
    move-result v2
    if-eq v1, v2, :done
    iget-object v3, p0, Laajh;->l:Laarm;
    :try_start
    invoke-virtual {v0, v2}, Lafhp;->f(I)V
    if-eqz v3, :try_end
    invoke-interface {v3}, Laarm;->l()V
    :try_end
    const/4 v0, 0x0
    iput-object v0, p0, Laajh;->k:Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;
    iput-object v0, p0, Laajh;->l:Laarm;
    :done
    return-void
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :cleanup
    :cleanup
    move-exception v1
    const/4 v0, 0x0
    iput-object v0, p0, Laajh;->k:Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;
    iput-object v0, p0, Laajh;->l:Laarm;
    throw v1
""".trimIndent()

internal fun menuViewDefBody(): String = """
    if-eqz p1, :unchanged
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    const-class v1, Lcom/google/android/libraries/inputmethod/accesspoint/impl/AccessPointKeyboard;
    if-ne v0, v1, :unchanged
    iget-object v0, p1, $VIEW_DEF->b:Lagoz;
    sget-object v1, Lzbg;->b:Lzbg;
    if-ne v0, v1, :unchanged
    iget v0, p1, $VIEW_DEF->d:I
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ACCESS_POINTS_MENU_RUNTIME_SELECT_KEYBOARD_LAYOUT, "v0")}
    move-result v4
    if-eq v0, v4, :unchanged
    new-instance v0, $VIEW_DEF
    iget v1, p1, $VIEW_DEF->a:I
    iget-object v2, p1, $VIEW_DEF->b:Lagoz;
    iget-boolean v3, p1, $VIEW_DEF->c:Z
    iget-boolean v5, p1, $VIEW_DEF->e:Z
    iget-boolean v6, p1, $VIEW_DEF->f:Z
    iget-object v7, p1, $VIEW_DEF->g:Lagot;
    iget-object v8, p1, $VIEW_DEF->h:Lcom/google/android/libraries/inputmethod/metadata/KeyMappingDef;
    iget-object v9, p1, $VIEW_DEF->i:$MOTION
    invoke-direct/range {v0 .. v9}, $VIEW_DEF-><init>(ILagoz;ZIZZLagot;Lcom/google/android/libraries/inputmethod/metadata/KeyMappingDef;$MOTION)V
    return-object v0
    :unchanged
    return-object p1
""".trimIndent()

internal fun menuInflateBody(): String = """
    iget-object v2, p0, $POPUP->d:$VIEW
    iget-object v3, p0, $POPUP->e:Lnha;
    :prepare_start
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ACCESS_POINTS_MENU_RUNTIME_WANTS_LEGACY, "")}
    move-result v0
    if-eqz v0, :prepare_end
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    new-instance v1, $ICON
    invoke-direct {v1, v0}, $ICON-><init>(Landroid/content/Context;)V
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ACCESS_POINTS_MENU_RUNTIME_PREPARE_DRAG, "p0, v1")}
    :prepare_end
    goto :stock_start
    .catch Ljava/lang/Throwable; {:prepare_start .. :prepare_end} :prepare_failed
    :prepare_failed
    move-exception v0
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ACCESS_POINTS_MENU_RUNTIME_ROLLBACK_DRAG, "p0")}
    :stock_start
    invoke-direct {p0}, $POPUP->morpheStockMenuInflate()V
    :stock_end
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ACCESS_POINTS_MENU_RUNTIME_COMPLETE_DRAG, "p0")}
    return-void
    .catch Ljava/lang/Throwable; {:stock_start .. :stock_end} :stock_failed
    :stock_failed
    move-exception v0
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ACCESS_POINTS_MENU_RUNTIME_ROLLBACK_DRAG, "p0")}
    iput-object v2, p0, $POPUP->d:$VIEW
    iput-object v3, p0, $POPUP->e:Lnha;
    throw v0
""".trimIndent()
