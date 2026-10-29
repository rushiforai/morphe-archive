package patches.nrc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FRONT = "Lpinch/nrcnext/ui/frontpage/NRCFrontPageActivity;"
private const val BAR = "Lpinch/nrcnext/compose/interop/bottomtabbar/BottomTabBarView;"
private const val ITEM = "Lpinch/nrcnext/compose/interop/bottomtabbar/BottomMenuItem;"
private const val OPTION = "Lpinch/nrcnext/ui/frontpage/NRCFrontPageNavigationOption;"
private const val CONTROLLER = "Lcom/ncapdevi/fragnav/FragNavController;"
private const val BUNDLE = "Landroid/os/Bundle;"
private const val SCHEMA = "morphe.nrc.navigation.four-tabs.v1"

@Suppress("unused")
val hideNewspaperTab = bytecodePatch(
    name = "Hide newspaper tab",
    description = "Removes the Krant tab, routes newspaper destinations to Nieuws and safely rebuilds legacy newspaper navigation state. Does not change account or newspaper access rights.",
) {
    compatibleWith(nrc)
    dependsOn(originalInput)
    execute {
        val roots = exact(FRONT, "P0", "Ljava/util/Set;")
        val menu = exact(BAR, "i", "Ljava/util/List;", BAR)
        val navigate = exact(FRONT, "navigateToTab", "V", OPTION)
        val create = exact(FRONT, "onCreate", "V", BUNDLE)
        val save = exact(FRONT, "onSaveInstanceState", "V", BUNDLE)
        val result = exact(FRONT, "onActivityResult", "V", "I", "I", "Landroid/content/Intent;")
        exact(ITEM, "getItemId", "I")
        exact(CONTROLLER, "initialize", "V", "I", BUNDLE)
        check(roots.classDef.methods.none { it.name.startsWith("morpheNoNewspaper") || it.name == "morpheInitializeNews" }) { "NRC newspaper navigation already present" }
        check(menu.classDef.methods.none { it.name == "morpheNoNewspaperMenu" }) { "NRC newspaper menu already present" }
        val rootReturn = roots.method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        val menuReturn = menu.method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        val saveReturn = save.method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        check(rootReturn.size == 1 && menuReturn.size == 1 && saveReturn.size == 1) { "NRC navigation factory/save cardinality changed" }
        val reader = create.method.implementation!!.instructions.withIndex().filter { (_, insn) ->
            ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                it.definingClass == OPTION && it.name == "READER" && it.type == OPTION
            } == true
        }
        val initialize = create.method.implementation!!.instructions.withIndex().filter { (_, insn) ->
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == CONTROLLER && it.name == "initialize" && it.parameterTypes == listOf("I", BUNDLE) && it.returnType == "V"
            } == true
        }
        val resultReader = result.method.implementation!!.instructions.withIndex().filter { (_, insn) ->
            ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                it.definingClass == OPTION && it.name == "READER" && it.type == OPTION
            } == true
        }
        check(reader.size == 1 && resultReader.size == 1 && initialize.size == 1) { "NRC initial tab/controller dispatch changed" }
        roots.classDef.methods.add(helper(FRONT, "morpheNoNewspaperRoots", "Ljava/util/Set;", listOf("Ljava/util/Set;"), 2, """
            new-instance v0, Ljava/util/LinkedHashSet;
            invoke-direct {v0, p0}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V
            sget-object v1, $OPTION->READER:$OPTION
            invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->remove(Ljava/lang/Object;)Z
            return-object v0
        """))
        menu.classDef.methods.add(helper(BAR, "morpheNoNewspaperMenu", "Ljava/util/List;", listOf("Ljava/util/List;"), 5, """
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
            invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
            move-result-object v1
            sget v4, Lpinch/nrcnext/R${'$'}id;->menu_reader:I
            :next
            invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
            move-result v2
            if-eqz v2, :done
            invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v2
            check-cast v2, $ITEM
            invoke-virtual {v2}, $ITEM->getItemId()I
            move-result v3
            if-eq v3, v4, :next
            invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            goto :next
            :done
            return-object v0
        """))
        roots.classDef.methods.add(helper(FRONT, "morpheNewsDestination", OPTION, listOf(OPTION), 1, """
            sget-object v0, $OPTION->READER:$OPTION
            if-ne p0, v0, :keep
            sget-object p0, $OPTION->NEWS:$OPTION
            :keep
            return-object p0
        """))
        roots.classDef.methods.add(helper(FRONT, "morpheInitializeNews", "V", listOf(CONTROLLER, "I", BUNDLE), 2, """
            if-eqz p2, :initialize
            const-string v0, "$SCHEMA"
            invoke-virtual {p2, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I
            move-result v0
            const/4 v1, 0x1
            if-eq v0, v1, :initialize
            const/4 p2, 0x0
            :initialize
            invoke-virtual {p0, p1, p2}, $CONTROLLER->initialize(I$BUNDLE)V
            return-void
        """))
        roots.classDef.methods.add(helper(FRONT, "morpheMarkNavigation", "V", listOf(BUNDLE), 2, """
            const-string v0, "$SCHEMA"
            const/4 v1, 0x1
            invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V
            return-void
        """))
        roots.method.addInstructions(rootReturn.single().index, """
            invoke-static {v0}, $FRONT->morpheNoNewspaperRoots(Ljava/util/Set;)Ljava/util/Set;
            move-result-object v0
        """.trimIndent())
        menu.method.addInstructions(menuReturn.single().index, """
            invoke-static {p0}, $BAR->morpheNoNewspaperMenu(Ljava/util/List;)Ljava/util/List;
            move-result-object p0
        """.trimIndent())
        navigate.method.addInstructions(0, """
            invoke-static {p1}, $FRONT->morpheNewsDestination($OPTION)$OPTION
            move-result-object p1
        """.trimIndent())
        create.method.replaceInstruction(reader.single().index, "sget-object v4, $OPTION->NEWS:$OPTION")
        create.method.replaceInstruction(initialize.single().index, "invoke-static {v0, v3, p1}, $FRONT->morpheInitializeNews(${CONTROLLER}I$BUNDLE)V")
        result.method.replaceInstruction(resultReader.single().index, "sget-object p3, $OPTION->NEWS:$OPTION")
        save.method.addInstructions(saveReturn.single().index, "invoke-static {p1}, $FRONT->morpheMarkNavigation($BUNDLE)V")
    }
}
