package app.template.patches.keyflow

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.addFreeRegisters
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY

@Suppress("unused")
val allProPatch = patch(
    name = "[ALL] Pro Unlock",
    description = "Forces all Pro features enabled using fingerprint matching (version-robust for method name changes).",
    default = false
) {
    compatibleWith(COMPATIBILITY)

    execute {
        // --- mx6nK.KEsFip5xs()V -> returnEarly() ---
        Fingerprint(
            definingClass = "Lmx6nK;",
            name = "KEsFip5xs",
            parameters = listOf(),
            returnType = "V"
        ).method.returnEarly()

        // --- mx6nK.xBtItM()V -> returnEarly() ---
        Fingerprint(
            definingClass = "Lmx6nK;",
            name = "xBtItM",
            parameters = listOf(),
            returnType = "V"
        ).method.returnEarly()

        // --- mx6nK.xo0eU()V -> force xBtItM=true, publish true to pX6SrQYLl ---
        Fingerprint(
            definingClass = "Lmx6nK;",
            name = "xo0eU",
            parameters = listOf(),
            returnType = "V"
        ).method.addInstructions(0, """
            const/4 v0, 0x1
            sput-boolean v0, Lmx6nK;->xBtItM:Z
            invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
            move-result-object v0
            sget-object v1, Lmx6nK;->pX6SrQYLl:LEEoBErp8u;
            const/4 v2, 0x0
            invoke-virtual {v1, v2, v0}, LEEoBErp8u;->H2h1oPylj(Ljava/lang/Object;Ljava/lang/Object;)Z
            return-void
        """)

        // --- mx6nK.pX6SrQYLl()LS19NG6; -> return fake S19NG6("", "") ---
        val s19ng6Name = "LS19NG6;"
        Fingerprint(
            definingClass = "Lmx6nK;",
            name = "pX6SrQYLl",
            parameters = listOf(),
            returnType = "LS19NG6;"
        ).method.addInstructions(0, """
            new-instance v0, $s19ng6Name
            const-string v1, ""
            const-string v2, ""
            invoke-direct {v0, v1, v2}, $s19ng6Name-><init>(Ljava/lang/String;Ljava/lang/String;)V
            return-object v0
        """)

        // --- Qx0hrwEl.H2h1oPylj(Context, RbDM1) -> fake confirmation ---
        val kzr7wwName = "LKZr7ww;"
        val s19ng6Name2 = "LS19NG6;"
        Fingerprint(
            definingClass = "LQx0hrwEl;",
            name = "H2h1oPylj",
            parameters = listOf("Landroid/content/Context;", "LRbDM1;"),
            returnType = "Ljava/lang/Object;"
        ).method.addInstructions(0, """
            new-instance v0, $kzr7wwName
            new-instance v1, $s19ng6Name2
            const-string v2, ""
            const-string v3, ""
            invoke-direct {v1, v2, v3}, $s19ng6Name2-><init>(Ljava/lang/String;Ljava/lang/String;)V
            invoke-direct {v0, v1}, $kzr7wwName-><init>(LS19NG6;)V
            return-object v0
        """)

        // --- Qx0hrwEl.azrbON(Context, RbDM1) -> always call H2h1oPylj ---
        val qx0hrwElName = "LQx0hrwEl;"
        Fingerprint(
            definingClass = "LQx0hrwEl;",
            name = "azrbON",
            parameters = listOf("Landroid/content/Context;", "LRbDM1;"),
            returnType = "Ljava/lang/Object;"
        ).method.addInstructions(0, """
            invoke-virtual {p0, p1, p2}, $qx0hrwElName->H2h1oPylj(Landroid/content/Context;LRbDM1;)Ljava/lang/Object;
            move-result-object p0
            return-object p0
        """)

        // --- Wd8lizD.xo0eU(DUL3JxrY)Z -> returnEarly(true) ---
        Fingerprint(
            definingClass = "LWd8lizD;",
            name = "xo0eU",
            parameters = listOf("LDUL3JxrY;"),
            returnType = "Z"
        ).method.returnEarly(true)

        // --- kjXTc.znlhtRTp()Z -> returnEarly(true) ---
        Fingerprint(
            definingClass = "LkjXTc;",
            name = "znlhtRTp",
            parameters = listOf(),
            returnType = "Z"
        ).method.returnEarly(true)

        // --- kjXTc.KEsFip5xs(Activity, E89G7LwNy) -> return new QA6hx2MOZ() ---
        val qa6hx2mozName = "LQA6hx2MOZ;"
        Fingerprint(
            definingClass = "LkjXTc;",
            name = "KEsFip5xs",
            parameters = listOf("Landroid/app/Activity;", "LE89G7LwNy;"),
            returnType = "LQA6hx2MOZ;"
        ).method.addInstructions(0, """
            new-instance v0, $qa6hx2mozName
            invoke-direct {v0}, Ljava/lang/Object;-><init>()V
            return-object v0
        """)

        // --- uhgAYKl2b.xo0eU(DoCsWqGhG)Z -> returnEarly(true) ---
        Fingerprint(
            definingClass = "LuhgAYKl2b;",
            name = "xo0eU",
            parameters = listOf("LDoCsWqGhG;"),
            returnType = "Z"
        ).method.returnEarly(true)
    }
}
