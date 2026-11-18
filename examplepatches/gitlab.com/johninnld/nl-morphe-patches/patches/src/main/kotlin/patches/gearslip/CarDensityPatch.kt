package patches.gearslip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private const val DENSITY = "Lpatches/gearslip/CarDensity;"
private const val PROJECTOR = "Lapp/seb3thehacker/gearslip/ScreenProjector;"
private const val CONNECTION = "Lapp/seb3thehacker/gearslip/host/CarAppConnection;"
private const val LENT = "Lapp/seb3thehacker/gearslip/host/CarAppConnection\$Lent;"
private const val COMPOSER = "Landroidx/compose/runtime/GapComposer;"

private val densityScreen = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            (doc.getElementsByTagName("application").item(0) as Element)
                .appendChild(doc.createElement("activity").apply {
                    setAttribute("android:name", "patches.gearslip.CarDensityActivity")
                    setAttribute("android:exported", "false")
                    setAttribute("android:theme", "@android:style/Theme.DeviceDefault.DayNight")
                })
        }
    }
}

private fun BytecodePatchContext.addDensitySubmenu(classes: List<ClassDef>) {
    val groups = classes.flatMap { it.methods }.singleOrNull {
        it.name == "GroupRows" && it.parameterTypes.map(CharSequence::toString) ==
            listOf("Lapp/seb3thehacker/gearslip/ui/CarGroup;", COMPOSER, "I")
    } ?: throw PatchException("Gearslip Screen settings changed")
    val owner = mutableClassDefBy(groups.definingClass)
    val group = owner.methods.single { it.name == groups.name && it.parameterTypes == groups.parameterTypes }
    val code = group.implementation!!.instructions.toList()
    fun call(at: Int) = (code[at] as? ReferenceInstruction)?.reference as? MethodReference
    val sizes = code.indices.singleOrNull { call(it)?.name == "sizeChoices" }
        ?: throw PatchException("Gearslip Size setting changed")
    val at = (sizes + 1 until code.size).firstOrNull { call(it)?.name == "Choice" }
        ?: throw PatchException("Gearslip Size choice changed")
    val choice = code[at] as? RegisterRangeInstruction
        ?: throw PatchException("Gearslip Size choice registers changed")
    val composer = choice.startRegister + 4
    if (choice.registerCount != 6 || call(at)?.parameterTypes?.getOrNull(4)?.toString() != COMPOSER) {
        throw PatchException("Gearslip Size choice signature changed")
    }
    val row = owner.methods.singleOrNull { it.name == "SettingsRow-nBX6wN0" &&
        it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Landroidx/compose/ui/Modifier;",
            "Ljava/lang/String;", "Landroidx/compose/ui/graphics/vector/ImageVector;", "J", "J",
            "Lkotlin/jvm/functions/Function2;", COMPOSER, "I", "I") }
        ?: throw PatchException("Gearslip settings row ABI changed")
    val divider = owner.methods.singleOrNull { it.name == "SettingsDivider" &&
        it.parameterTypes.map(CharSequence::toString) == listOf("I", COMPOSER) }
        ?: throw PatchException("Gearslip settings divider ABI changed")
    val clickableOwner = "Landroidx/compose/foundation/ImageKt;"
    val clickable = classDefBy(clickableOwner).methods.singleOrNull { it.name == "clickable-oSLSa3U\$default" &&
        it.parameterTypes.map(CharSequence::toString) == listOf("I", "Landroidx/compose/ui/Modifier;",
            "Ljava/lang/String;", "Lkotlin/jvm/functions/Function0;", "Z") }
        ?: throw PatchException("Gearslip clickable modifier ABI changed")
    val helper = "morpheDensityRow"
    if (owner.methods.any { it.name == helper }) throw PatchException("Gearslip density submenu already added")
    owner.methods.add(ImmutableMethod(owner.type, helper,
        listOf(ImmutableMethodParameter(COMPOSER, null, null)), "V",
        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(13),
    ).toMutable().apply {
        addInstructions(0, """
            const/4 v0, 0x0
            move-object v1, p0
            invoke-static { v0, v1 }, $divider
            invoke-static {}, $DENSITY->title()Ljava/lang/String;
            move-result-object v0
            sget-object v1, Landroidx/compose/ui/Modifier${'$'}Companion;->${'$'}${'$'}INSTANCE:Landroidx/compose/ui/Modifier${'$'}Companion;
            const/4 v2, 0x0
            invoke-static {}, $DENSITY->openAction()Lkotlin/jvm/functions/Function0;
            move-result-object v3
            const/4 v4, 0x0
            const/16 v5, 0xf
            invoke-static { v5, v1, v2, v3, v4 }, $clickable
            move-result-object v1
            invoke-static {}, $DENSITY->subtitle()Ljava/lang/String;
            move-result-object v2
            const/4 v3, 0x0
            const-wide/16 v4, 0x0
            const-wide/16 v6, 0x0
            const/4 v8, 0x0
            move-object v9, p0
            const/4 v10, 0x0
            const/16 v11, 0x38
            invoke-static/range { v0 .. v11 }, $row
            return-void
        """)
    })
    group.addInstructions(at + 1,
        "invoke-static/range { v$composer .. v$composer }, ${owner.type}->$helper($COMPOSER)V")
}

private fun BytecodePatchContext.correctPreviewCaption(classes: List<ClassDef>) {
    val method = classes.flatMap { it.methods }.singleOrNull { method -> method.implementation?.instructions?.any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "dpi - touches go to the car UI"
    } == true } ?: throw PatchException("Gearslip preview caption changed")
    val code = method.implementation!!.instructions.toList()
    val suffix = code.indices.single { ((code[it] as? ReferenceInstruction)?.reference as? StringReference)?.string ==
        "dpi - touches go to the car UI" }
    val appendAt = (0 until suffix).lastOrNull { at ->
        val ref = (code[at] as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Ljava/lang/StringBuilder;" && ref.name == "append" &&
            ref.parameterTypes.map(CharSequence::toString) == listOf("I")
    } ?: throw PatchException("Gearslip preview DPI append changed")
    val field = code[appendAt - 1]
    val append = code[appendAt] as? FiveRegisterInstruction
    val ref = (field as? ReferenceInstruction)?.reference as? FieldReference
    if (field.opcode != Opcode.IGET || ref?.type != "I" || append == null ||
        (field as OneRegisterInstruction).registerA != append.registerD) {
        throw PatchException("Gearslip preview DPI registers changed")
    }
    mutableClassDefBy(method.definingClass).methods.single {
        it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
    }.addInstructions(appendAt, """
        invoke-static/range { v${append.registerD} .. v${append.registerD} }, $DENSITY->previewDpi(I)I
        move-result v${append.registerD}
    """)
}

/** Match all boundaries before mutation; inlined activity/source methods are deliberately unused. */
internal fun densityHookMethods(classes: List<ClassDef>): List<Method> {
    val contracts = listOf(
        Triple(PROJECTOR, "start", listOf("Landroid/view/Surface;", "I", "I", "I", "Ljava/lang/String;", "Landroidx/compose/runtime/internal/ComposableLambdaImpl;")),
        Triple(CONNECTION, "connect", listOf("Lapp/seb3thehacker/gearslip/host/TemplateApp;", "I", "I", "I", "Ljava/lang/String;")),
        Triple(LENT, "<init>", listOf("Landroid/view/Surface;", "I", "I", "I")),
    )
    return contracts.map { (owner, name, parameters) ->
        val method = classes.filter { it.type == owner }.flatMap { it.methods }.singleOrNull {
            it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters && it.returnType == "V"
        } ?: throw PatchException("Gearslip density contract changed: $owner->$name")
        val body = method.implementation ?: throw PatchException("Gearslip density method has no body: $method")
        if (method.accessFlags and AccessFlags.STATIC.value != 0 || body.registerCount > 255 ||
            body.registerCount < parameters.size + 1 || body.instructions.any {
                (it as? ReferenceInstruction)?.reference?.toString()?.startsWith(DENSITY) == true
            }) throw PatchException("Gearslip density method is unsupported or already patched: $method")
        val anchor = when (owner) {
            PROJECTOR -> "Landroid/hardware/display/DisplayManager;->createVirtualDisplay("
            CONNECTION -> "$CONNECTION->frameDensity:I"
            else -> "$LENT->dpi:I"
        }
        if (body.instructions.none { (it as? ReferenceInstruction)?.reference?.toString()?.startsWith(anchor) == true }) {
            throw PatchException("Gearslip density consumer changed: $method")
        }
        method
    }
}

internal fun applyDensityHooks(methods: List<MutableMethod>) {
    methods.forEachIndexed { index, method ->
        // Parameters are consecutive, all are one word, and no scratch register is needed.
        val call = if (index == 0) "{ p4 .. p5 }, $DENSITY->begin(ILjava/lang/String;)I"
            else "{ p4 .. p4 }, $DENSITY->hosted(I)I"
        method.addInstructions(0, """
            invoke-static/range $call
            move-result p4
        """)
    }
}

@Suppress("unused")
val gearslipCarDensity = bytecodePatch(
    name = "Control car display density",
    description = "Adds a density submenu under Screen for larger text and controls, including hosted navigation apps. " +
        "Choose the car's density or 160–240 DPI. Keeps resolution unchanged; reconnect to apply.",
) {
    compatibleWith(Compatibility(
        name = "Gearslip", packageName = "app.seb3thehacker.gearslip", apkFileType = ApkFileType.APK,
        appIconColor = 0x7C95D6,
        targets = listOf(AppTarget(version = "0.3.31-alpha", versionCode = 13)),
    ))
    dependsOn(densityScreen, gearslipExtension)
    execute {
        val classes = mutableListOf<ClassDef>()
        classDefForEach { classes += it }
        val hooks = densityHookMethods(classes).map { original ->
            mutableClassDefBy(original.definingClass).methods.single {
                it.name == original.name && it.parameterTypes == original.parameterTypes && it.returnType == original.returnType
            }
        }
        applyDensityHooks(hooks)
        addDensitySubmenu(classes)
        correctPreviewCaption(classes)
    }
}
