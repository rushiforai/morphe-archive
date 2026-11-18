/*
 * Afterglow native tab composition for YouTube 21.43.523.
 * Uses the native pivot factory identified by Morphe v2.0.0's Navigation bar patch
 * (GPLv3, https://github.com/MorpheApp/morphe-patches). Native factory fingerprints
 * remain in the attributed vendored source; composition and row policy are Afterglow's.
 */
package app.afterglow.patches.tweaks.navigation

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.smali
import app.afterglow.patches.shared.writtenRegisters
import app.afterglow.patches.video.addPublicMethod
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.youtube.layout.buttons.navigation.PivotBarItemProtoFactoryFingerprint
import app.morphe.patches.youtube.layout.buttons.navigation.PivotBarRendererFingerprint
import app.morphe.patches.youtube.layout.buttons.navigation.PivotBarRendererListFingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val TABS = "$EXTENSION_PACKAGE/navigation/NativeTabs;"
private const val TAB_HOST = "$EXTENSION_PACKAGE/navigation/NativeTabHost;"
private const val TAB_ITEM = "$EXTENSION_PACKAGE/navigation/NativeTabItem;"
private const val PIVOT = "Lcom/google/android/libraries/youtube/rendering/ui/pivotbar/PivotBar;"
private const val LIST = "Ljava/util/List;"
private const val VIEW = "Landroid/view/View;"
private const val LINEAR = "Landroid/widget/LinearLayout;"

/** Reorders/builds native tab models and retains their views, commands, avatar and theme hooks. */
internal val nativeTabsHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(tabBarHooksPatch, startupHooksPatch)

    execute {
        // Other optional native navigation patches can have touched these methods already.
        // Capture each match once; strict validation must not rematch a method after our edits.
        PivotBarRendererFingerprint.clearMatch()
        PivotBarRendererListFingerprint.clearMatch()
        PivotBarItemProtoFactoryFingerprint.clearMatch()
        val renderer = PivotBarRendererFingerprint.match()
        val listMatch = PivotBarRendererListFingerprint.match()
        val factory = PivotBarItemProtoFactoryFingerprint.match().method
        val item = renderer.classDef
        val host = listMatch.classDef
        val listField = (listMatch.instructionMatches[2].instruction as ReferenceInstruction).reference as FieldReference
        require(listField.definingClass == host.type && item.type == "Lavcl;" && host.type == "Lrun;") {
            "Native tab model/controller ownership changed"
        }
        val listBuilder = Fingerprint(accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
            returnType = listField.type, parameters = listOf("Ljava/util/Collection;")).method
        // G() updates both V and R's pivot-index/page-index correlations. Updating only V
        // lets a synthetic tab become selected without opening a page. Reuse that exact
        // native map update after every composed list, including live preference changes.
        val listInstructions = listMatch.method.implementation!!.instructions.toList()
        val mapUpdateIndex = listInstructions.indices.single { index ->
            val instruction = listInstructions[index]
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_INTERFACE && call?.definingClass == "Lrvi;" &&
                call.name == "f" && call.parameterTypes == listOf(listField.type) && call.returnType == "V"
        }
        val mapUpdate = listInstructions[mapUpdateIndex] as Instruction35c
        val mapFieldRead = listInstructions[mapUpdateIndex - 2]
        val mapListRead = listInstructions[mapUpdateIndex - 1]
        val mapField = (mapFieldRead as ReferenceInstruction).reference as FieldReference
        require(mapFieldRead.opcode == Opcode.IGET_OBJECT && mapListRead.opcode == Opcode.IGET_OBJECT &&
                mapField.definingClass == host.type && mapField.name == "R" && mapField.type == "Lrvi;" &&
                ((mapListRead as ReferenceInstruction).reference as FieldReference).smali == listField.smali &&
                mapUpdate.registerCount == 2 && mapUpdate.registerC == (mapFieldRead as TwoRegisterInstruction).registerA &&
                mapUpdate.registerD == (mapListRead as TwoRegisterInstruction).registerA) {
            "Native tab navigation-map update changed"
        }
        val updateMap = mapUpdate.reference as MethodReference
        val iconType = factory.parameterTypes[2].toString()
        val iconLookup = Fingerprint(definingClass = iconType, isStatic = true,
            returnType = iconType, parameters = listOf("I")).method
        require(factory.returnType == renderer.method.parameterTypes.single() &&
                renderer.method.returnType == "Lj$/util/Optional;") { "Native tab factory signature changed" }

        val extension = mutableClassDefBy(TABS)
        val placeholder = extension.methods.single { it.name == "buildNative" &&
                it.parameterTypes == listOf("Ljava/lang/String;", "Ljava/lang/String;", "I") }
        extension.methods.remove(placeholder)
        extension.methods.add(ImmutableMethod(TABS, placeholder.name, placeholder.parameters,
            placeholder.returnType, placeholder.accessFlags, placeholder.annotations,
            placeholder.hiddenApiRestrictions, MutableMethodImplementation(5)).toMutable().apply {
            addInstructions(0, """
                invoke-static { p2 }, ${iconLookup.smali}
                move-result-object v0
                const/4 v1, 0x0
                invoke-static { p0, p1, v0, v1 }, ${factory.smali}
                move-result-object v0
                invoke-static { v0 }, ${renderer.method.smali}
                move-result-object v0
                invoke-virtual { v0, v1 }, ${renderer.method.returnType}->orElse(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                return-object v0
            """)
        })
        val proto = item.fields.single { it.type == "Lcom/google/protobuf/MessageLite;" }
        item.interfaces.add(TAB_ITEM)
        item.addMethod("afterglow_tabProto", "[B", 2, """
            iget-object v0, p0, ${proto.smali}
            invoke-interface { v0 }, Lcom/google/protobuf/MessageLite;->toByteArray()[B
            move-result-object v0
            return-object v0
        """)

        val render = Fingerprint(definingClass = host.type, parameters = listOf("Z"), returnType = "V",
            strings = listOf("FEvideo_picker"), filters = listOf(methodCall(definingClass = PIVOT, name = "c"))).match().method
        val rootField = render.implementation!!.instructions.mapNotNull {
            if (it.opcode != Opcode.IGET_OBJECT) null else
                ((it as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { field ->
                    field.definingClass == host.type && field.type == "Lj$/util/Optional;"
                }
        }.first()
        require(rootField.name == "o" && render.name == "O") { "Native tab render/root boundary changed" }
        val pivot = mutableClassDefBy(PIVOT)
        val rowOwner = mutableClassDefBy(pivot.superclass!!)
        require(rowOwner.superclass == "Landroid/widget/HorizontalScrollView;") { "Native pivot row superclass changed" }
        val viewsField = rowOwner.fields.single { it.type == "Ljava/util/ArrayList;" }
        require(AccessFlags.PUBLIC.isSet(viewsField.accessFlags)) { "Native tab view list is not public" }

        host.interfaces.add(TAB_HOST)
        host.addMethod("afterglow_tabRoot", VIEW, 3, """
            iget-object v0, p0, ${rootField.smali}
            const/4 v1, 0x0
            invoke-virtual { v0, v1 }, ${rootField.type}->orElse(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            check-cast v0, $VIEW
            return-object v0
        """)
        host.addMethod("afterglow_tabItems", LIST, 2, """
            iget-object v0, p0, ${listField.smali}
            return-object v0
        """)
        host.addMethod("afterglow_tabViews", LIST, 2, """
            invoke-virtual { p0 }, ${host.type}->afterglow_tabRoot()$VIEW
            move-result-object v0
            if-eqz v0, :unbound
            check-cast v0, $PIVOT
            iget-object v0, v0, ${viewsField.smali}
            return-object v0
            :unbound
            invoke-static { }, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v0
            return-object v0
        """)
        host.addPublicMethod("afterglow_replaceTabs", listOf(LIST), "V", 4, """
            invoke-static { p1 }, ${listBuilder.smali}
            move-result-object v0
            iput-object v0, p0, ${listField.smali}
            iget-object v1, p0, ${mapField.smali}
            invoke-interface { v1, v0 }, ${updateMap.smali}
            return-void
        """)
        host.addMethod("afterglow_rebuildTabs", "V", 2, """
            const/4 v0, 0x1
            invoke-virtual { p0, v0 }, ${render.smali}
            return-void
        """)

        // Compose at the actual renderer boundary, after upstream list adapters. This avoids
        // patch-order dependence at G()'s early list store and keeps original native objects.
        val thisRegister = render.implementation!!.registerCount - 2
        require(render.implementation!!.instructions.none { thisRegister in it.writtenRegisters }) {
            "Native tab renderer reuses its controller parameter"
        }
        val returns = render.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        require(returns.size == 1) { "Native tab renderer return flow changed" }
        returns.asReversed().forEach { (index, _) ->
            render.addInstructionsAtControlFlowLabel(index, "invoke-static/range { p0 .. p0 }, $TABS->bind($TAB_HOST)V")
        }
        render.addInstructions(0, "invoke-static/range { p0 .. p0 }, $TABS->prepare($TAB_HOST)V")

        // Native item construction passes the same model and actual child view to this lazy
        // icon/avatar binder. Preserve the native listener for every item except our own route.
        val bind = Fingerprint(definingClass = "Lrup;", name = "a", returnType = "V",
            parameters = listOf(item.type, VIEW, "Lavfz;"), filters = listOf(
                methodCall(smali = "Lavgi;->c(Lbgbd;Landroid/view/View;Ljava/lang/Object;Langf;Lavfz;)V"))).match().method
        val bindRegisters = bind.implementation!!.registerCount
        require(bind.implementation!!.instructions.none { instruction ->
            instruction.writtenRegisters.any { it == bindRegisters - 3 || it == bindRegisters - 2 }
        }) { "Native tab binder reuses its item/view parameters" }
        bind.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
            .asReversed().forEach { (index, _) ->
                bind.addInstructionsAtControlFlowLabel(index,
                    "invoke-static/range { p1 .. p2 }, $TABS->bindItem(Ljava/lang/Object;Landroid/view/View;)V")
            }

        val create = Fingerprint(definingClass = rowOwner.type, parameters = listOf("Landroid/content/Context;"), returnType = "V",
            filters = listOf(methodCall(smali = "$LINEAR-><init>(Landroid/content/Context;)V"),
                fieldAccess(opcode = Opcode.IPUT_OBJECT, definingClass = rowOwner.type, type = LINEAR))).match()
        val store = create.instructionMatches.last()
        val assignment = store.instruction as TwoRegisterInstruction
        create.method.addInstructions(store.index, """
            ${invokeStatic(assignment.registerB, assignment.registerA, method = "$TABS->createRow(${VIEW}${LINEAR})$LINEAR")}
            move-result-object v${assignment.registerA}
        """)
    }
}
