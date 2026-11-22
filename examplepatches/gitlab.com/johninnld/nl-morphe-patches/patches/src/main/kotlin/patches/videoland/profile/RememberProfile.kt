package patches.videoland.profile

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import patches.atv.exact
import patches.shared.platformTitleSuffix
import patches.videolandatv.subscriptionMethodDigest

internal enum class ProfileEvent(val instruction: String) {
    LAUNCH("invoke-static/range {p0 .. p1}, %s->launch(Landroid/app/Activity;Landroid/os/Bundle;)V"),
    PHONE_STORE("invoke-static/range {p1 .. p3}, %s->bindPhone(Ljava/lang/Object;Ljava/lang/Object;Landroid/content/Context;)V"),
    TV_STORE("invoke-static/range {p1 .. p3}, %s->bindTv(Ljava/lang/Object;Ljava/lang/Object;Landroid/content/Context;)V"),
    LOGOUT("invoke-static {}, %s->logout()V"),
    NEW_INTENT("invoke-static/range {p1 .. p1}, %s->incoming(Landroid/content/Intent;)V"),
    CANCEL("invoke-static {}, %s->disarm()V"),
    RENDER("invoke-static/range {p0 .. p2}, %s->rendered(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V"),
    CHOICE("invoke-static/range {p0 .. p3}, %s->clicked(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V"),
    HOME("invoke-static/range {p1 .. p1}, %s->homeState(Ljava/lang/Object;)V"),
}

internal data class ProfileSite(val event: ProfileEvent, val owner: String, val signature: String,
    val registers: Int, val count: Int, val digest: String)

internal fun rememberProfile(target: Compatibility, input: Patch<*>, sites: List<ProfileSite>) = bytecodePatch(
    name = "Remember last profile (experimental) ${platformTitleSuffix(target)}",
    description = "Remembers a successful profile choice for this account and selects it on the next online launch. Manual switching and native PIN prompts remain available.",
    default = false,
) {
    compatibleWith(target)
    dependsOn(input)
    extendWith("extensions/videoland-profile.mpe")
    execute {
        val methods = sites.map { site ->
            exact(site.owner, site.signature, site.registers, site.count).also {
                check(subscriptionMethodDigest(it) == site.digest) { "Changed Videoland profile hook: ${site.event}" }
            }
        }
        sites.zip(methods).forEach { (site, method) ->
            val index = if (site.signature.startsWith("<init>(")) {
                // The original supplier and Context are live here. R8 reuses both
                // parameter registers for subscriptions before this constructor returns.
                method.instructions.withIndex().single {
                    (it.value as? ReferenceInstruction)?.reference?.toString() == "Ljava/lang/Object;-><init>()V"
                }.index + 1
            } else 0
            method.addInstructions(index, site.event.instruction.format("Lpatches/videoland/profile/ProfileRecall;"))
        }
    }
}
