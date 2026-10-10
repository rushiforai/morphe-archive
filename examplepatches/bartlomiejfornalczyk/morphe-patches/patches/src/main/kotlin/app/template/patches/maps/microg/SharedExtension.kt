package app.template.patches.maps.microg

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.template.patches.shared.addInstructionsAtLabel
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c

private const val SHAPES = "Lorg/ungoogled/ui/Shapes;"

val sharedExtensionPatch = bytecodePatch(
    description = "Adds the MicroG runtime extension classes.",
) {
    extendWith("extensions/extension.mpe")
}

internal fun BytecodePatchContext.markPatched(marker: String) {
    val method = mutableClassDefBy(SHAPES).methods.singleOrNull {
        it.name == marker && it.parameterTypes.isEmpty() && it.returnType == "Z"
    } ?: throw PatchException("extension marker $SHAPES->$marker() not found")
    val first = method.implementation!!.instructions.first()
    if (first.opcode != Opcode.CONST_4 || (first as NarrowLiteralInstruction).narrowLiteral != 0) {
        throw PatchException("$marker() no longer starts with const/4 v0, 0x0")
    }
    method.replaceInstruction(0, "const/4 v0, 0x1")
}

internal object AppCompatAttachBaseContextFingerprint : Fingerprint(
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("rebase"),
        methodCall(opcode = Opcode.INVOKE_SUPER, name = "attachBaseContext"),
    ),
)

internal val activityContextHookPatch = bytecodePatch(
    description = "Routes every Activity's base context through the extension.",
) {
    dependsOn(sharedExtensionPatch)

    execute {
        AppCompatAttachBaseContextFingerprint.let { fp ->
            val superCall = fp.instructionMatches.last().index
            val registers = (fp.method.implementation!!.instructions[superCall] as Instruction35c)
            if (registers.registerCount != 2) throw PatchException("super.attachBaseContext takes ${registers.registerCount} registers")
            val context = "v${registers.registerD}"
            fp.method.addInstructionsAtLabel(
                superCall,
                """
                    invoke-static { $context }, $SHAPES->wrap(Landroid/content/Context;)Landroid/content/Context;
                    move-result-object $context
                """,
            )
        }
    }
}

internal object ApplicationAttachBaseContextFingerprint : Fingerprint(
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(string("CommonGoogleMapsApplication.attachBaseContext")),
)

internal val applicationStartHookPatch = bytecodePatch(
    description = "Applies the extension's process-wide settings when the app starts.",
) {
    dependsOn(sharedExtensionPatch)

    execute {
        ApplicationAttachBaseContextFingerprint.method.apply {
            val first = implementation!!.instructions.first()
            if (first.location.labels.isNotEmpty()) throw PatchException("Application.attachBaseContext starts at a branch target")
            val context = "p1"
            addInstructions(
                0,
                "invoke-static { $context }, $SHAPES->processStart(Landroid/content/Context;)V",
            )
        }
    }
}

/** org.ungoogled.ui.Screens: opens the extension's screens, inside a host when they are not declared. */
private const val SCREENS = "Lorg/ungoogled/ui/Screens;"
/** androidx.core's AppComponentFactory, which Maps' manifest names: it creates every Activity of the app. */
private const val COMPONENT_FACTORY = "androidx.core.app.CoreComponentFactory"
/** Stock Maps' open-source licences screen, Screens.HOST. */
private const val SCREEN_HOST = "com.google.android.libraries.social.licenses.LicenseActivity"

/**
 * The screen host works from stock Maps' manifest, so it relies on two things in it: the
 * component factory it names, and the licences screen declared as a plain Activity private
 * to the app.
 */
private val screenHostManifestPatch = app.morphe.patcher.patch.resourcePatch(
    description = "Checks the component factory and the screen host in Maps' manifest.",
) {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as org.w3c.dom.Element
            val factory = application.getAttribute("android:appComponentFactory")
            if (factory != COMPONENT_FACTORY) throw PatchException("the manifest's component factory is '$factory', not $COMPONENT_FACTORY")
            val activities = manifest.getElementsByTagName("activity")
            val host = (0 until activities.length).map { activities.item(it) as org.w3c.dom.Element }
                .singleOrNull { it.getAttribute("android:name") == SCREEN_HOST }
                ?: throw PatchException("the manifest no longer declares $SCREEN_HOST")
            val unexpected = listOf(
                "android:process", "android:launchMode", "android:taskAffinity", "android:enabled",
                "android:noHistory", "android:excludeFromRecents", "android:screenOrientation", "android:permission",
            ).filter(host::hasAttribute)
            if (host.getAttribute("android:exported") != "false" || unexpected.isNotEmpty()) {
                throw PatchException("$SCREEN_HOST is no longer a plain private Activity ($unexpected)")
            }
        }
    }
}

/**
 * Root "mount" installs (issue #25): Morphe Manager bind-mounts the patched APK over stock
 * Maps' base.apk, and Android keeps the manifest it parsed from the stock one, so none of the
 * extension's Activities exist there. Screens then opens them through stock Maps' licences
 * screen, with an action naming the screen, and the app's component factory -- hooked here --
 * creates the extension's class in the host's place:
 *
 *     instantiateActivity(classLoader, className, intent)
 *  -> className = Screens.activityFor(className, intent), then as before
 *
 * Any other Activity, the licences screen opened by Maps included, keeps its class.
 */
internal val screenHostPatch = bytecodePatch(
    description = "Opens the extension's screens inside an Activity stock Maps declares, for root mount installs.",
) {
    dependsOn(sharedExtensionPatch, screenHostManifestPatch)

    execute {
        val factory = "L${COMPONENT_FACTORY.replace('.', '/')};"
        val method = mutableClassDefBy(factory).methods.singleOrNull {
            it.name == "instantiateActivity" && it.returnType == "Landroid/app/Activity;" &&
                it.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/lang/ClassLoader;", "Ljava/lang/String;", "Landroid/content/Intent;")
        } ?: throw PatchException("$factory->instantiateActivity not found")
        if (method.implementation!!.instructions.first().location.labels.isNotEmpty()) {
            throw PatchException("instantiateActivity starts at a branch target")
        }
        method.addInstructions(
            0,
            """
                invoke-static { p2, p3 }, $SCREENS->activityFor(Ljava/lang/String;Landroid/content/Intent;)Ljava/lang/String;
                move-result-object p2
            """,
        )
    }
}

/**
 * Avatars -- a signed-in account's picture, drawn inside Google's coloured account ring, which
 * is drawn round. Squared by Rectangle Shapes, the picture sat in the ring as a square, so the
 * code that makes avatars round keeps its circles; its colours still go through the shims. The
 * picture is cut round by a circle crop and the letter avatar painted by a monogram painter,
 * both found by what they draw (see [drawsAvatar]); the avatar view keeps its round clip.
 */
private val ROUND_AVATARS = setOf(
    "Lcom/google/android/libraries/onegoogle/account/disc/AvatarView;",
    "Lcom/google/android/libraries/onegoogle/account/disc/SimpleAvatarView;",
)

private fun com.android.tools.smali.dexlib2.iface.reference.MethodReference.isCall(owner: String, name: String, parameters: String) =
    definingClass == owner && this.name == name && parameterTypes.joinToString("") == parameters

private enum class AvatarPainter { CIRCLE_CROP, MONOGRAM }

private fun avatarPainter(classDef: com.android.tools.smali.dexlib2.iface.ClassDef): AvatarPainter? {
    for (method in classDef.methods) {
        val calls = method.implementation?.instructions
            ?.mapNotNull { (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference }.orEmpty()
        fun has(owner: String, name: String, parameters: String) = calls.any { it.isCall(owner, name, parameters) }
        val canvas = "Landroid/graphics/Canvas;"
        val paint = "Landroid/graphics/Paint;"
        if (!has("Landroid/graphics/Bitmap;", "createBitmap", "IILandroid/graphics/Bitmap\$Config;") ||
            !has(canvas, "drawCircle", "FFF$paint")
        ) continue
        if (has(paint, "setXfermode", "Landroid/graphics/Xfermode;") && has(canvas, "drawBitmap", "Landroid/graphics/Bitmap;FF$paint")) {
            return AvatarPainter.CIRCLE_CROP
        }
        if (has(paint, "setTextAlign", "Landroid/graphics/Paint\$Align;") && has(canvas, "drawText", "Ljava/lang/String;FF$paint")) {
            return AvatarPainter.MONOGRAM
        }
    }
    return null
}

internal val shapeShimsPatch = bytecodePatch(
    description = "Routes framework shape and colour calls through the UI extension.",
) {
    dependsOn(sharedExtensionPatch)

    execute {
        val gd = "Landroid/graphics/drawable/GradientDrawable;"
        val path = "Landroid/graphics/Path;"
        val canvas = "Landroid/graphics/Canvas;"
        val outline = "Landroid/graphics/Outline;"
        val dir = "Landroid/graphics/Path\$Direction;"
        val rectF = "Landroid/graphics/RectF;"
        val rect = "Landroid/graphics/Rect;"
        val paint = "Landroid/graphics/Paint;"

        // (owner, method, parameters) -- the shim takes (owner, parameters...), same name, void.
        val shapeVirtuals = listOf(
            Triple(gd, "setCornerRadius", "F"), Triple(gd, "setCornerRadii", "[F"), Triple(gd, "setShape", "I"),
            Triple(path, "addRoundRect", rectF + "FF" + dir), Triple(path, "addRoundRect", rectF + "[F" + dir),
            Triple(path, "addRoundRect", "FFFFFF$dir"), Triple(path, "addRoundRect", "FFFF[F$dir"),
            Triple(path, "addOval", rectF + dir), Triple(path, "addOval", "FFFF$dir"), Triple(path, "addCircle", "FFF$dir"),
            Triple(canvas, "drawRoundRect", rectF + "FF" + paint), Triple(canvas, "drawRoundRect", "FFFFFF$paint"),
            Triple(canvas, "drawCircle", "FFF$paint"), Triple(canvas, "drawOval", rectF + paint), Triple(canvas, "drawOval", "FFFF$paint"),
            Triple(outline, "setRoundRect", "IIIIF"), Triple(outline, "setRoundRect", rect + "F"),
            Triple(outline, "setOval", "IIII"), Triple(outline, "setOval", rect),
        )
        val virtuals = shapeVirtuals + listOf(
            // Black theme: literal colours handed to the framework
            Triple(gd, "setColor", "I"), Triple("Landroid/graphics/drawable/ColorDrawable;", "setColor", "I"),
            Triple(paint, "setColor", "I"), Triple("Landroid/view/View;", "setBackgroundColor", "I"),
            Triple("Landroid/widget/TextView;", "setTextColor", "I"), Triple(canvas, "drawColor", "I"),
            Triple("Landroid/view/Window;", "setStatusBarColor", "I"), Triple("Landroid/view/Window;", "setNavigationBarColor", "I"),
            Triple("Landroid/graphics/drawable/Drawable;", "setTint", "I"),
            // draw-time Paint colour remap (Material elevation overlays etc.)
            Triple(canvas, "drawPath", path + paint), Triple(canvas, "drawRect", rectF + paint),
            Triple(canvas, "drawRect", rect + paint), Triple(canvas, "drawRect", "FFFF$paint"),
        )
        fun params(descriptor: String): List<String> {
            val out = mutableListOf<String>()
            var i = 0
            while (i < descriptor.length) {
                var j = i
                while (descriptor[j] == '[') j++
                j = if (descriptor[j] == 'L') descriptor.indexOf(';', j) + 1 else j + 1
                out += descriptor.substring(i, j)
                i = j
            }
            return out
        }
        fun key(owner: String, name: String, parameters: List<String>, returnType: String) =
            "$owner->$name(${parameters.joinToString("")})$returnType"

        val rules = HashMap<String, com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference>()
        for ((owner, name, p) in virtuals) {
            val ps = params(p)
            rules[key(owner, name, ps, "V")] = com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference(SHAPES, name, listOf(owner) + ps, "V")
        }
        val shapeKeys = shapeVirtuals.map { (owner, name, p) -> key(owner, name, params(p), "V") }.toSet()
        val colourRules = rules.filterKeys { it !in shapeKeys }
        val csl = "Landroid/content/res/ColorStateList;"
        val staticRules = mapOf(
            key(csl, "valueOf", listOf("I"), csl) to com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference(SHAPES, "valueOf", listOf("I"), csl),
        )
        val shapeSubclasses = mapOf(
            "Landroid/graphics/drawable/shapes/RoundRectShape;" to "Lorg/ungoogled/ui/URoundRectShape;",
            "Landroid/graphics/drawable/shapes/OvalShape;" to "Lorg/ungoogled/ui/UOvalShape;",
        )
        // Colour arguments of two constructors, remapped in place right before the constructor runs.
        val ctorColourArgs = mapOf(
            key("Landroid/graphics/drawable/ColorDrawable;", "<init>", listOf("I"), "V") to (1 to "color(I)I"),
            key(csl, "<init>", listOf("[[I", "[I"), "V") to (2 to "colors([I)[I"),
        )

        var sites = 0
        var classes = 0
        val work = mutableListOf<Pair<String, com.android.tools.smali.dexlib2.iface.Method>>()
        val reparent = mutableListOf<String>()
        val roundAvatars = ROUND_AVATARS.toMutableSet()
        val painters = mutableSetOf<AvatarPainter>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lorg/ungoogled/")) return@classDefForEach
            avatarPainter(classDef)?.let { painters += it; roundAvatars += classDef.type }
        }
        if (painters.size != AvatarPainter.entries.size) throw PatchException("avatar circle crop or monogram painter not found: $painters")
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lorg/ungoogled/")) return@classDefForEach
            if (classDef.superclass in shapeSubclasses) reparent += classDef.type
            val classRules = if (classDef.type in roundAvatars) colourRules else rules
            for (method in classDef.methods) {
                val instructions = method.implementation?.instructions ?: continue
                if (instructions.any { insn -> rewriteKind(insn, classRules, staticRules, shapeSubclasses, ctorColourArgs) != null }) {
                    work += classDef.type to method
                }
            }
        }
        // A subclass's constructor calls its parent's <init>, which is rewritten to the
        // extension's subclass below, so the declared parent has to move with it.
        for (type in reparent) {
            val mutableClass = mutableClassDefBy(type)
            mutableClass.setSuperClass(shapeSubclasses.getValue(mutableClass.superclass!!))
        }
        for ((type, method) in work) {
            val mutableClass = mutableClassDefBy(type)
            val mutableMethod = mutableClass.methods.first {
                it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
            }
            sites += rewriteMethod(mutableMethod, if (type in roundAvatars) colourRules else rules, staticRules, shapeSubclasses, ctorColourArgs)
            classes++
        }
        if (sites == 0) throw PatchException("no framework shape or colour calls found to reroute")

        // Every rerouted framework method must be gone (invoke-super excepted: a
        // class calling its own parent implementation must keep doing so).
        val watched = listOf(
            "Landroid/graphics/drawable/GradientDrawable;->(setCornerRadius|setCornerRadii|setShape)\\(",
            "Landroid/graphics/Path;->(addRoundRect|addOval|addCircle)\\(",
            "Landroid/graphics/Canvas;->(drawRoundRect|drawCircle|drawOval|drawPath|drawRect)\\(",
            "Landroid/graphics/Outline;->(setRoundRect|setOval)\\(",
            "Landroid/graphics/drawable/shapes/(RoundRectShape|OvalShape);-><init>\\(",
            "Landroid/graphics/drawable/(GradientDrawable|ColorDrawable);->setColor\\(I\\)",
            "Landroid/graphics/Paint;->setColor\\(I\\)", "Landroid/view/View;->setBackgroundColor\\(",
            "Landroid/widget/TextView;->setTextColor\\(I\\)", "Landroid/graphics/Canvas;->drawColor\\(I\\)",
            "Landroid/view/Window;->set(StatusBar|NavigationBar)Color\\(", "Landroid/content/res/ColorStateList;->valueOf\\(",
        ).joinToString("|").toRegex()
        val leftovers = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lorg/ungoogled/")) return@classDefForEach
            for (method in classDef.methods) {
                for (insn in method.implementation?.instructions ?: continue) {
                    if (insn.opcode == Opcode.INVOKE_SUPER || insn.opcode == Opcode.INVOKE_SUPER_RANGE) continue
                    val ref = (insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference ?: continue
                    val k = key(ref.definingClass, ref.name, ref.parameterTypes.map { it.toString() }, ref.returnType)
                    if (classDef.type in roundAvatars && k in shapeKeys) continue
                    if (watched.containsMatchIn(k)) leftovers += "${classDef.type}->${method.name}: $k"
                }
            }
        }
        if (leftovers.isNotEmpty()) {
            throw PatchException("unhandled framework shape/colour call(s), add a shim for them:\n" + leftovers.take(10).joinToString("\n"))
        }
        logger.info("Shape/colour shims: $sites call sites in $classes methods")
    }
}

private val logger = java.util.logging.Logger.getLogger("ShapeShims")

private fun rewriteKind(
    insn: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
    rules: Map<String, com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference>,
    staticRules: Map<String, com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference>,
    subclasses: Map<String, String>,
    ctorArgs: Map<String, Pair<Int, String>>,
): String? {
    val ref = (insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference ?: return null
    if (insn.opcode == Opcode.NEW_INSTANCE) return if ((ref as com.android.tools.smali.dexlib2.iface.reference.TypeReference).type in subclasses) "new" else null
    if (ref !is com.android.tools.smali.dexlib2.iface.reference.MethodReference) return null
    val k = "${ref.definingClass}->${ref.name}(${ref.parameterTypes.joinToString("")})${ref.returnType}"
    return when (insn.opcode) {
        Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE -> if (k in rules) "virtual" else null
        Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE -> if (k in staticRules) "static" else null
        Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE -> when {
            ref.name == "<init>" && ref.definingClass in subclasses -> "ctor"
            k in ctorArgs && insn.opcode == Opcode.INVOKE_DIRECT -> "ctorArg"
            else -> null
        }
        else -> null
    }
}

/** Rewrites every matching site in one method, last to first so indices stay valid. */
private fun rewriteMethod(
    method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
    rules: Map<String, com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference>,
    staticRules: Map<String, com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference>,
    subclasses: Map<String, String>,
    ctorArgs: Map<String, Pair<Int, String>>,
): Int {
    val instructions = method.implementation!!.instructions
    var count = 0
    for (i in instructions.indices.reversed()) {
        val insn = instructions[i]
        val kind = rewriteKind(insn, rules, staticRules, subclasses, ctorArgs) ?: continue
        val ref = (insn as com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction).reference
        when (kind) {
            "new" -> {
                val type = subclasses.getValue((ref as com.android.tools.smali.dexlib2.iface.reference.TypeReference).type)
                method.replaceInstruction(i, "new-instance v${(insn as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA}, $type")
            }
            "virtual", "static", "ctor" -> {
                ref as com.android.tools.smali.dexlib2.iface.reference.MethodReference
                val target: com.android.tools.smali.dexlib2.iface.reference.MethodReference = when (kind) {
                    "virtual" -> rules.getValue("${ref.definingClass}->${ref.name}(${ref.parameterTypes.joinToString("")})${ref.returnType}")
                    "static" -> staticRules.getValue("${ref.definingClass}->${ref.name}(${ref.parameterTypes.joinToString("")})${ref.returnType}")
                    else -> com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference(subclasses.getValue(ref.definingClass), "<init>", ref.parameterTypes, "V")
                }
                val opcodeRange = when (kind) { "ctor" -> Opcode.INVOKE_DIRECT_RANGE; else -> Opcode.INVOKE_STATIC_RANGE }
                val opcode = when (kind) { "ctor" -> Opcode.INVOKE_DIRECT; else -> Opcode.INVOKE_STATIC }
                val replacement = if (insn is com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc) {
                    com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc(opcodeRange, insn.startRegister, insn.registerCount, target)
                } else {
                    insn as Instruction35c
                    com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c(
                        opcode, insn.registerCount,
                        insn.registerC, insn.registerD, insn.registerE, insn.registerF, insn.registerG, target,
                    )
                }
                method.replaceInstruction(i, replacement)
            }
            "ctorArg" -> {
                ref as com.android.tools.smali.dexlib2.iface.reference.MethodReference
                val (argIndex, shim) = ctorArgs.getValue("${ref.definingClass}->${ref.name}(${ref.parameterTypes.joinToString("")})${ref.returnType}")
                insn as Instruction35c
                val reg = listOf(insn.registerC, insn.registerD, insn.registerE, insn.registerF, insn.registerG)[argIndex]
                val move = if (shim.startsWith("colors")) "move-result-object" else "move-result"
                method.addInstructionsAtLabel(i, "invoke-static { v$reg }, $SHAPES->$shim\n$move v$reg")
            }
        }
        count++
    }
    return count
}

