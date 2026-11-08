package app.morphe.patches.instaprime.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod


private const val SERVER_BLOCK_MSG = "Feature blocked by the InstaPrime server"


private fun MutableSet<MutableMethod>.rebuild(
    name: String,
    params: List<String>,
    registerCount: Int,
    smali: String,
) {
    val old = first { m -> m.name == name && m.parameterTypes.map { it.toString() } == params }

    val rebuilt = MutableMethod(
        ImmutableMethod(
            old.definingClass,
            old.name,
            old.parameters,
            old.returnType,
            old.accessFlags and AccessFlags.NATIVE.value.inv(),
            old.annotations,
            old.hiddenApiRestrictions,
            MutableMethodImplementation(registerCount),
        ),
    ).apply {
        addInstructionsWithLabels(0, smali)
    }

    remove(old)
    add(rebuilt)
}

private fun listActivityBody(innerClass: String, outerClass: String) = """
    invoke-static {}, Lcom/primemods/utils/UIUtils;->hideProgressDialog()V
    const-string v0, "$SERVER_BLOCK_MSG"
    invoke-static {v0}, Lcom/primemods/utils/UIUtils;->showToast(Ljava/lang/String;)V
    iget-object v0, p0, $innerClass->this${'$'}0:$outerClass
    invoke-virtual {v0}, $outerClass->finish()V
    return-void
"""


internal object InstaPrimeServerBlock {
    @Suppress("unused")
    val patch = bytecodePatch(
        name = "Server block message",
        description = "Troca o texto que o servidor do InstaPrime manda ao recusar um recurso por um aviso de bloqueio por servidor.",
    ) {
        compatibleWith("com.instaprime.android"("435.0.0.37.76"))

        execute {
		
            mutableClassDefBy("Lcom/primemods/utils/IGUtils$1;").methods.rebuild(
                "lambda\$onResponse\$0", listOf("Ljava/lang/String;"), 2,
                """
                    const-string v0, "$SERVER_BLOCK_MSG"
                    invoke-static {v0}, Lcom/primemods/utils/UIUtils;->showToast(Ljava/lang/String;)V
                    return-void
                """,
            )

            mutableClassDefBy("Lcom/primemods/module/profile/activity/HighlightCoverListActivity$1;").methods.rebuild(
                "lambda\$onResponse\$0\$com-primemods-module-profile-activity-HighlightCoverListActivity\$1",
                listOf("Ljava/lang/String;"), 3,
                listActivityBody(
                    "Lcom/primemods/module/profile/activity/HighlightCoverListActivity\$1;",
                    "Lcom/primemods/module/profile/activity/HighlightCoverListActivity;",
                ),
            )

            mutableClassDefBy("Lcom/primemods/module/profile/activity/PostListActivity$2;").methods.rebuild(
                "lambda\$onResponse\$1\$com-primemods-module-profile-activity-PostListActivity\$2",
                listOf("Ljava/lang/String;"), 3,
                listActivityBody(
                    "Lcom/primemods/module/profile/activity/PostListActivity\$2;",
                    "Lcom/primemods/module/profile/activity/PostListActivity;",
                ),
            )

            mutableClassDefBy("Lcom/primemods/module/profile/activity/StoryListActivity$2;").methods.rebuild(
                "lambda\$onResponse\$0\$com-primemods-module-profile-activity-StoryListActivity\$2",
                listOf("Ljava/lang/String;"), 3,
                listActivityBody(
                    "Lcom/primemods/module/profile/activity/StoryListActivity\$2;",
                    "Lcom/primemods/module/profile/activity/StoryListActivity;",
                ),
            )
        }
    }
}
