package patches.flitsmeister

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element

private var guestLabelId = 0

private val guestResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("res/values/public.xml").use { doc ->
            val nodes = doc.getElementsByTagName("public")
            val entries = (0 until nodes.length).map { nodes.item(it) as Element }
            check(entries.none { it.getAttribute("name") == "morphe_continue_as_guest" }) {
                "Flitsmeister guest resources already exist"
            }
            val strings = entries.filter { it.getAttribute("type") == "string" }
            guestLabelId = strings.maxOf { it.getAttribute("id").removePrefix("0x").toLong(16) }.toInt() + 1
            check(guestLabelId ushr 16 == 0x7f14) { "Flitsmeister string resource table changed" }
            doc.documentElement.appendChild(doc.createElement("public").apply {
                setAttribute("type", "string")
                setAttribute("name", "morphe_continue_as_guest")
                setAttribute("id", "0x${guestLabelId.toString(16)}")
            })
        }
        mapOf("values" to "Continue as guest", "values-nl" to "Doorgaan als gast").forEach { (folder, label) ->
            val path = "res/$folder/strings.xml"
            val file = get(path)
            if (!file.exists()) {
                file.parentFile.mkdirs()
                file.writeText("<resources/>")
            }
            document(path).use { doc ->
                val strings = doc.getElementsByTagName("string")
                check((0 until strings.length).none {
                    (strings.item(it) as Element).getAttribute("name") == "morphe_continue_as_guest"
                }) { "Flitsmeister guest label already exists" }
                doc.documentElement.appendChild(doc.createElement("string").apply {
                    setAttribute("name", "morphe_continue_as_guest")
                    textContent = label
                })
            }
        }
    }
}

@Suppress("unused")
val guestMode = bytecodePatch(
    name = "Guest mode",
    description = "Adds Continue as guest to onboarding, allows reopening without an account and hides the guest sign-up card. Keeps optional login and services that require a genuine account.",
    default = true,
) {
    compatibleWith(flitsmeister)
    dependsOn(originalInput, startupCompatibility, guestResources)
    execute {
        check(guestLabelId != 0) { "Guest label resource patch did not run" }
        applyPlans(listOf(
            MethodPlan(
                "Lstb;->b(Lz39;Landroidx/compose/runtime/Composer;I)V", 11, 62,
                listOf(
                    Guard(0, Opcode.INVOKE_VIRTUAL, listOf(8), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
                    Guard(30, Opcode.CONST_STRING, listOf(2), "nl.flitsmeister.menu.presentation.MenuNoAccountMessage (MenuBanner.kt:110)"),
                    Guard(47, Opcode.INVOKE_STATIC_RANGE, (1..7).toList(), "Lstb;->a(Ljava/lang/String;Ljava/lang/String;Lkxb;Ljava/lang/String;Lz39;Landroidx/compose/runtime/Composer;I)V"),
                ),
                // This leaf renders only the large account sign-up card. The
                // menu's Login control, reports, rows and other banners remain.
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lria;->b(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;" to 3),
            ),
            MethodPlan(
                "Lu8d;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
                31, 218,
                listOf(
                    Guard(201, Opcode.IGET_OBJECT, listOf(7, 0), "Lu8d;->b:Lz39;"),
                    Guard(203, Opcode.INVOKE_STATIC_RANGE, (2..12).toList(), "Laa8;->a(Landroidx/compose/ui/Modifier;Luy1;Lvy1;Landroidx/compose/foundation/shape/CornerSize;ZLz39;Lz39;Lr49;Landroidx/compose/runtime/Composer;II)V"),
                    Guard(204, Opcode.IGET_OBJECT, listOf(0, 0), "Lu8d;->c:Lh68;"),
                    Guard(207, Opcode.INVOKE_INTERFACE, listOf(10, 0), "Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V"),
                    Guard(208, Opcode.INVOKE_INTERFACE, listOf(10), "Landroidx/compose/runtime/Composer;->endReplaceGroup()V"),
                    Guard(209, Opcode.INVOKE_INTERFACE, listOf(10), "Landroidx/compose/runtime/Composer;->endNode()V"),
                ),
                listOf(Edit(208, "insert", """
                    move-object/from16 v0, p0
                    iget-object v8, v0, Lu8d;->d:Lz39;
                    const/4 v1, 0x0
                    const v2, 0x${guestLabelId.toString(16)}
                    const/4 v3, 0x0
                    invoke-static {v2, v10, v3}, Lria;->b(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;
                    move-result-object v2
                    sget-object v3, Luy1${'$'}f;->a:Luy1${'$'}f;
                    const/4 v5, 0x0
                    const/4 v6, 0x0
                    const/4 v7, 0x0
                    move-object v9, v10
                    const/4 v10, 0x0
                    const/16 v11, 0x71
                    invoke-static/range {v1 .. v11}, Laa8;->b(Landroidx/compose/ui/Modifier;Ljava/lang/String;Luy1;Lvy1;Landroidx/compose/foundation/shape/CornerSize;ZZLz39;Landroidx/compose/runtime/Composer;II)V
                    move-object/from16 v10, v16
                """.trimIndent())),
                mapOf("Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V" to 1),
            ),
            MethodPlan(
                "Lcei;->a(Lvn4;)Ljava/lang/Object;", 7, 73,
                listOf(
                    Guard(46, Opcode.IGET_OBJECT, listOf(6, 6), "Ldhe;->U:Lcge;"),
                    Guard(54, Opcode.INVOKE_VIRTUAL, listOf(6), "Ljava/lang/Boolean;->booleanValue()Z"),
                    Guard(55, Opcode.MOVE_RESULT, listOf(6)),
                    Guard(56, Opcode.IF_EQZ, listOf(6), target = 58),
                    Guard(58, Opcode.IPUT, listOf(2, 0), "Ldei;->c:I"),
                ),
                // Keep first-run onboarding and Dash setup. Only a historical
                // login must no longer force the guest to authenticate again.
                listOf(Edit(56, "goto", target = 58)),
                mapOf("Ldhe;->U:Lcge;" to 1),
            ),
        ))
    }
}
