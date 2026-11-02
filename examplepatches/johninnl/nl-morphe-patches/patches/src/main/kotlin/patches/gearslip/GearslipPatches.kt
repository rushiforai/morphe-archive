package patches.gearslip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private const val TEMPLATE = "Lapp/seb3thehacker/gearslip/host/TemplateApp;"
private const val MEDIA = "Lapp/seb3thehacker/gearslip/media/MediaApp;"
private const val SCREEN = "Lapp/seb3thehacker/gearslip/car/AppTile\$Screen;"
private const val PLAYER = "Lapp/seb3thehacker/gearslip/car/AppTile\$Player;"
private const val OWNER = "Lapp/seb3thehacker/gearslip/car/CallOverlayKt;"
private const val ENTRY = "Lapp/seb3thehacker/gearslip/car/Entry;"
private const val CACHE = "Lapp/seb3thehacker/gearslip/car/LauncherCache;"
private const val GROUP = "Lapp/seb3thehacker/gearslip/ui/CarGroup;"
private const val IMAGE = "Landroidx/compose/ui/graphics/AndroidImageBitmap;"
private const val DRAWER = "Lpatches/gearslip/DrawerApps;"
private const val DRAWER_ACTIVITY = "patches.gearslip.DrawerAppsActivity"
private const val CARD = "MORPHE_APPS"
private const val APPS_TITLE = "crumb_apps"
private const val LIST = "Ljava/util/List;"
private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"

private val gearslip = Compatibility(
    name = "Gearslip", packageName = "app.seb3thehacker.gearslip", apkFileType = ApkFileType.APK,
    appIconColor = 0x7C95D6,
    targets = listOf(AppTarget(version = "0.3.12-alpha", versionCode = 12), AppTarget(version = "0.3.31-alpha", versionCode = 13)),
)

@Suppress("unused")
val gearslipMusicPlayers = bytecodePatch(
    name = "Keep music player entries",
    description = "Keeps a music app's player available when it also provides a car Settings screen, including YT Music Morphe. Uses Gearslip's existing docked player.",
) {
    compatibleWith(gearslip)
    execute {
        val owner = mutableClassDefBy(OWNER)
        val tiles = owner.methods.singleOrNull {
            it.name == "access\$tilesFor" && it.returnType == LIST &&
                it.parameterTypes.map(CharSequence::toString) in listOf(
                    listOf(TEMPLATE, MEDIA, "Lapp/seb3thehacker/gearslip/notify/MessagingApp;"),
                    listOf(TEMPLATE, MEDIA, "Lapp/seb3thehacker/gearslip/notify/MessagingApp;", "Ljava/lang/String;"),
                )
        } ?: throw PatchException("Gearslip tile selection contract changed")
        if (tiles.implementation!!.registerCount <= tiles.parameterTypes.size ||
            tiles.accessFlags and AccessFlags.STATIC.value == 0) throw PatchException("Gearslip tile registers changed")
        for ((type, parameters) in listOf(PLAYER to listOf(MEDIA), SCREEN to listOf(TEMPLATE, "Ljava/lang/String;"))) {
            if (classDefBy(type).methods.none { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == parameters }) {
                throw PatchException("Gearslip tile constructor changed: $type")
            }
        }
        val helper = "morpheSettingsPlayer"
        if (owner.methods.any { it.name == helper }) throw PatchException("Gearslip player patch already applied")
        owner.methods.add(ImmutableMethod(
            OWNER, helper,
            listOf(TEMPLATE, MEDIA).map { ImmutableMethodParameter(it, null, null) }, LIST,
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(7),
        ).toMutable().apply {
            addInstructions(0, """
                if-eqz p0, :original
                if-eqz p1, :original
                invoke-virtual { p0 }, $TEMPLATE->getKind()Ljava/lang/String;
                move-result-object v0
                const-string v1, "settings"
                invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :original
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
                new-instance v1, $PLAYER
                invoke-direct { v1, p1 }, $PLAYER-><init>($MEDIA)V
                invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
                iget-object v2, p0, $TEMPLATE->label:Ljava/lang/String;
                const-string v3, " · Settings"
                invoke-virtual { v2, v3 }, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v2
                new-instance v1, $SCREEN
                invoke-direct { v1, p0, v2 }, $SCREEN-><init>(${TEMPLATE}Ljava/lang/String;)V
                invoke-interface { v0, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
                return-object v0
                :original
                const/4 v0, 0x0
                return-object v0
            """)
        })
        tiles.addInstructionsWithLabels(0, """
            invoke-static/range { p0 .. p1 }, $OWNER->$helper($TEMPLATE$MEDIA)$LIST
            move-result-object v0
            if-eqz v0, :original_tiles
            return-object v0
        """, ExternalLabel("original_tiles", tiles.implementation!!.instructions.first()))
    }
}

private var appsTitleAvailable = false

/** Declares the phone screen. The extension supplies its code. */
private val drawerAppsScreen = resourcePatch {
    execute {
        document("res/values/strings.xml").use { doc ->
            val strings = doc.getElementsByTagName("string")
            appsTitleAvailable = (0 until strings.length).any {
                (strings.item(it) as Element).getAttribute("name") == APPS_TITLE
            }
        }
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element
            application.appendChild(doc.createElement("activity").apply {
                setAttribute("android:name", DRAWER_ACTIVITY)
                setAttribute("android:exported", "false")
                setAttribute("android:theme", "@android:style/Theme.DeviceDefault.DayNight")
            })
        }
    }
}

internal val gearslipExtension = bytecodePatch { extendWith("extensions/gearslip.mpe") }

private fun Method.instructionList() = implementation?.instructions?.toList().orEmpty()

private fun Instruction.methodCall() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.fieldAccess() = (this as? ReferenceInstruction)?.reference as? FieldReference

@Suppress("unused")
val gearslipHideApps = bytecodePatch(
    name = "Hide apps from drawer",
    description = "Adds an Apps card to Gearslip's phone settings. Every installed car app is ticked by default; " +
        "unticking one hides its tile from the car drawer. Does not disable or uninstall apps.",
) {
    compatibleWith(gearslip)
    dependsOn(drawerAppsScreen, gearslipExtension)

    execute {
        // Checked here so a changed Gearslip fails the patch rather than the phone screen.
        val entry = classDefBy(ENTRY)
        if (entry.methods.none { it.name == "getComponentId" && it.returnType == STRING } ||
            setOf("label", "icon").any { name -> entry.fields.none { it.name == name } } ||
            classDefBy(IMAGE).fields.none { it.name == "bitmap" } ||
            classDefBy(CACHE).methods.none {
                it.name == "load" && it.returnType == LIST &&
                    it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Z")
            }) throw PatchException("Gearslip tile model changed")

        // The card: Home draws one row per CarGroup, so one more entry is one more card.
        val group = mutableClassDefBy(GROUP)
        val init = group.methods.single { it.name == "<clinit>" }
        val writes = init.instructionList().withIndex().filter {
            it.value.opcode == Opcode.SPUT_OBJECT && it.value.fieldAccess()?.toString() == "$GROUP->\$VALUES:[$GROUP"
        }
        if (writes.size != 1) throw PatchException("Gearslip card list initializer changed")
        val constructor = group.methods.filter { it.name == "<init>" }.map { it.parameterTypes.map(CharSequence::toString) }
        val build = when (constructor.singleOrNull()) {
            // The title became a translated string resource between these releases.
            listOf("I", "I", STRING) -> if (!appsTitleAvailable) {
                throw PatchException("Gearslip no longer ships the $APPS_TITLE string")
            } else """
                invoke-static {}, $DRAWER->titleResource()I
                move-result v3
                const-string v4, "$CARD"
                invoke-direct { v2, v0, v3, v4 }, $GROUP-><init>(IILjava/lang/String;)V
            """
            listOf("I", STRING, STRING) -> """
                const-string v3, "$CARD"
                const-string v4, "Apps"
                invoke-direct { v2, v0, v3, v4 }, $GROUP-><init>(ILjava/lang/String;Ljava/lang/String;)V
            """
            else -> throw PatchException("Gearslip card constructor changed")
        }
        val helper = "morpheWithApps"
        if (group.methods.any { it.name == helper }) throw PatchException("Gearslip Apps card already added")
        group.methods.add(ImmutableMethod(
            GROUP, helper, listOf(ImmutableMethodParameter("[$GROUP", null, null)), "[$GROUP",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(6),
        ).toMutable().apply {
            addInstructions(0, """
                array-length v0, p0
                add-int/lit8 v1, v0, 0x1
                invoke-static { p0, v1 }, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;
                move-result-object v1
                check-cast v1, [$GROUP
                new-instance v2, $GROUP
                $build
                aput-object v2, v1, v0
                return-object v1
            """)
        })
        val values = (writes.single().value as OneRegisterInstruction).registerA
        init.addInstructions(writes.single().index, """
            invoke-static/range { v$values .. v$values }, $GROUP->$helper([$GROUP)[$GROUP
            move-result-object v$values
        """)

        // The discovery below goes by behaviour: R8 moves these lambdas between classes per release.
        val cards = mutableListOf<ClassDef>()
        val routes = mutableListOf<ClassDef>()
        val orders = mutableListOf<ClassDef>()
        classDefForEach { cls ->
            val methods = cls.methods.toList()
            if (cls.type != GROUP && methods.any { method -> method.instructionList().any {
                it.opcode == Opcode.SGET_OBJECT && it.fieldAccess()?.let { field ->
                    field.definingClass == GROUP && field.name == "\$ENTRIES"
                } == true
            } }) cards += cls
            if (methods.any { method -> method.name == "invoke" && method.returnType == OBJECT &&
                method.parameterTypes.map(CharSequence::toString) == listOf(OBJECT) &&
                method.instructionList().any { it.opcode == Opcode.CHECK_CAST &&
                    (it as ReferenceInstruction).reference.toString() == GROUP }
            }) routes += cls
            if (methods.any { it.name == "launcherOrder" }) orders += cls
        }

        // The card's subtitle. Gearslip's `when` throws on an unknown card, so it never sees this one.
        val card = mutableClassDefBy(cards.singleOrNull()?.type ?: throw PatchException("Gearslip card loop changed"))
        val loop = card.methods.single { method -> method.instructionList().any {
            it.opcode == Opcode.SGET_OBJECT && it.fieldAccess()?.name == "\$ENTRIES"
        } }
        val lines = loop.instructionList()
        val entriesAt = lines.indices.single { lines[it].opcode == Opcode.SGET_OBJECT &&
            lines[it].fieldAccess()?.let { it.definingClass == GROUP && it.name == "\$ENTRIES" } == true }
        val iteratorAt = entriesAt + 1
        val iterator = lines.getOrNull(iteratorAt)?.methodCall()
        val entriesRegister = (lines[entriesAt] as OneRegisterInstruction).registerA
        if (iterator?.name != "iterator" || iterator.returnType != "Ljava/util/Iterator;") {
            throw PatchException("Gearslip settings card iteration changed")
        }
        // Reorder only this rendered list; enum ordinals and Kotlin entries stay unchanged.
        loop.replaceInstruction(iteratorAt,
            "invoke-static/range { v$entriesRegister .. v$entriesRegister }, $DRAWER->orderedCards(Ljava/lang/Iterable;)Ljava/util/Iterator;")
        val ordinals = lines.withIndex().filter { it.value.methodCall()?.name == "ordinal" }
        val joins = lines.withIndex().filter { it.value.methodCall()?.name == "joinToString\$default" }
        if (ordinals.size != 2 || joins.size != 1) throw PatchException("Gearslip card subtitle changed")
        val joined = lines[joins.single().index + 1] as? OneRegisterInstruction
            ?: throw PatchException("Gearslip card subtitle changed")
        val subject = (ordinals.last().value as FiveRegisterInstruction).registerC
        loop.addInstructions(joins.single().index + 2, """
            invoke-static/range { v${joined.registerA} .. v${joined.registerA} }, $DRAWER->subtitle(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v${joined.registerA}
        """)
        loop.replaceInstruction(ordinals.last().index,
            "invoke-static/range { v$subject .. v$subject }, $DRAWER->subtitleOrdinal(Ljava/lang/Enum;)I")

        // The tap. Gearslip would otherwise open its own settings screen for this card.
        val route = mutableClassDefBy(routes.singleOrNull()?.type ?: throw PatchException("Gearslip card routing changed"))
            .methods.single { it.name == "invoke" && it.parameterTypes.map(CharSequence::toString) == listOf(OBJECT) }
        val cast = route.instructionList().indexOfFirst { it.opcode == Opcode.CHECK_CAST &&
            (it as ReferenceInstruction).reference.toString() == GROUP }
        route.addInstructionsWithLabels(cast + 1, """
            invoke-static { p1 }, $DRAWER->open(Ljava/lang/Enum;)Z
            move-result v0
            if-eqz v0, :gearslip_card
            sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
            return-object v0
        """, ExternalLabel("gearslip_card", route.getInstruction(cast + 1)))

        // The drawer. Filtering here leaves pins, car messages and Gearslip's other lists alone.
        val order = mutableClassDefBy(orders.singleOrNull()?.type ?: throw PatchException("Gearslip drawer order changed"))
            .methods.single { it.name == "launcherOrder" }
        if (order.parameterTypes.map(CharSequence::toString) != listOf(LIST, "Z", LIST) || order.returnType != LIST)
            throw PatchException("Gearslip drawer order changed")
        order.addInstructions(0, """
            invoke-static/range { p0 .. p0 }, $DRAWER->visible(Ljava/util/List;)Ljava/util/List;
            move-result-object p0
        """)
    }
}
