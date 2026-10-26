package app.pigfoot.patches.camscanner

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

internal const val WATCH_CONTROL = "Lcom/intsig/camscanner/attention/WatchAdControl;"
internal const val WATCH_CALLBACK = "Lcom/intsig/camscanner/attention/WatchAdControl\$startLoadAd\$1;"
internal val rewardSkipPins72701 = mapOf(
    "Lcom/intsig/advertisement/adapters/AbsPositionAdapter;" to "ae90d98595ed494c634735dc0f8a86836fa5a45bb6fa2c5e24027781a989607a",
    "Lcom/intsig/advertisement/adapters/positions/reward/video/LeftRewardVideoManager;" to "07c69fe481ef03ac6c21b04a65d407bc2054fbbc339255d40515404aebdec717",
    "Lcom/intsig/advertisement/listener/OnAdPositionListener;" to "c28fd08ec4d6a1f5512695f8eedacfc13f42045781e0bae3c037d82e0b444bd3",
    "Lcom/intsig/camscanner/attention/CallAppData;" to "eeccf2e5bde68ac429eb89d3c9b0037fac0d7675058967b8865863b6632c66b5",
    "Lcom/intsig/camscanner/attention/O0〇OO8;" to "d0c8494a054cfd689932dae007c40f60a54ccad20a4ee10c8f5e2d68c4c994b8",
    "Lcom/intsig/camscanner/attention/WatchAdControl\$startLoadAd\$1;" to "78b6a1963967a53fecc30bb55896f1422f86d249c3a57a4ad244b9f0d34cb52f",
    "Lcom/intsig/camscanner/attention/WatchAdControl;" to "30bc95526fdbcc82ad214bdc01aab59035974e673e3e762b8769df7af883446c",
    "Lcom/intsig/camscanner/gift/interval/IntervalTaskStateManager\$getLotteryCode\$1;" to "1b2984d2c03da7f980e1e5694a921f170e0e37954b5586c35c94f08f9f3b1e21",
    "Lcom/intsig/camscanner/gift/interval/IntervalTaskStateManager;" to "e0e7732c666bef2fe6c89339da60ef9913be39ab64feaf23e51dd9d5f2dc87db",
    "Lcom/intsig/camscanner/web/WebAction;" to "e85fea052e53ee233018e8f37e39c89aa779c114ed122d4b1363f56857fb44ed"
)
internal fun requireRewardSkipVersion(name: String, code: String) {
    require(name == "7.27.0.2609220000" && code == "72701") {
        "Lottery video skipping is qualified only for CamScanner 7.27.0 (72701)"
    }
}

/** Two existing UI-thread dispatch paths, before either cached show or fresh load. */
internal enum class RewardSkipSite(val methodName: String, val registers: Int,
    val control: String, val activity: String, val fragment: String, val manager: String, val data: String) {
    MAIN("〇O00", 13, "p0", "p1", "p2", "p3", "p4"),
    POSTED("〇〇8O0〇8", 7, "p0", "p3", "p4", "p2", "p1")
}
internal fun rewardSkipIndex(method: Method, site: RewardSkipSite): Int {
    require(method.definingClass == WATCH_CONTROL && method.name == site.methodName &&
        method.returnType == "V" && method.parameterTypes.size == (if (site == RewardSkipSite.MAIN) 4 else 5)) {
        "Unsupported lottery dispatch method"
    }
    require(AccessFlags.STATIC.isSet(method.accessFlags) == (site == RewardSkipSite.POSTED))
    val impl = requireNotNull(method.implementation)
    require(impl.registerCount == site.registers)
    if (site == RewardSkipSite.POSTED) return 0
    var address = 0
    for ((index, i) in impl.instructions.withIndex()) {
        if (address == 37) {
            require(i.opcode == Opcode.MOVE_OBJECT && (i as TwoRegisterInstruction).registerA == 3 && i.registerB == 8) {
                "Unsupported lottery UI-thread branch"
            }
            // Insert after the branch-target instruction, so the original label cannot skip the prefix.
            return index + 1
        }
        address += i.codeUnits
    }
    error("Missing lottery UI-thread branch")
}

/** This signals one local completion, then uses the original task API/code and JS callback. */
internal fun rewardSkipPrefix(site: RewardSkipSite): String {
    val args = if (site == RewardSkipSite.MAIN) """
        move-object v1, p0
        move-object v2, p1
        move-object v3, p3
        move-object v4, p2
        move-object v5, p4
    """ else """
        move-object v1, p0
        move-object v2, p3
        move-object v5, p1
        move-object v3, p2
        move-object v4, p4
    """
    return """
        if-eqz ${site.data}, :reward_skip_original
        if-eqz ${site.manager}, :reward_skip_original
        instance-of v0, ${site.manager}, Lcom/intsig/advertisement/adapters/positions/reward/video/LeftRewardVideoManager;
        if-eqz v0, :reward_skip_original
        iget-object v0, ${site.data}, Lcom/intsig/camscanner/attention/CallAppData;->action:Ljava/lang/String;
        const-string v1, "watchad_lottery"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :reward_skip_original
        # Page mounted() sends prestrain=1. Never treat a preload as reward completion.
        # Reuse the pinned original parser, including its malformed/empty cancellation.
        iget-object v0, ${site.data}, Lcom/intsig/camscanner/attention/CallAppData;->data:Ljava/lang/String;
        invoke-direct {${site.control}, v0}, $WATCH_CONTROL->〇O888o0o(Ljava/lang/String;)Z
        move-result v0
        if-nez v0, :reward_skip_cancel
        iget-object v0, ${site.data}, Lcom/intsig/camscanner/attention/CallAppData;->id:Ljava/lang/String;
        if-eqz v0, :reward_skip_original
        invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
        move-result v0
        if-nez v0, :reward_skip_original
        if-eqz ${site.activity}, :reward_skip_cancel
        if-eqz ${site.fragment}, :reward_skip_cancel
        invoke-virtual {${site.fragment}}, Landroidx/fragment/app/Fragment;->isDetached()Z
        move-result v0
        if-nez v0, :reward_skip_cancel
        invoke-virtual {${site.fragment}}, Landroidx/fragment/app/Fragment;->isRemoving()Z
        move-result v0
        if-nez v0, :reward_skip_cancel
        invoke-virtual {${site.activity}}, Landroid/app/Activity;->isFinishing()Z
        move-result v0
        if-nez v0, :reward_skip_cancel
        invoke-virtual {${site.activity}}, Landroid/app/Activity;->isDestroyed()Z
        move-result v0
        if-nez v0, :reward_skip_cancel
        ${args.trimIndent()}
        new-instance v0, $WATCH_CALLBACK
        invoke-direct/range {v0 .. v5}, $WATCH_CALLBACK-><init>(${WATCH_CONTROL}Landroid/app/Activity;Lcom/intsig/advertisement/adapters/positions/reward/video/RewardVideo;Lcom/intsig/webview/WebViewFragment;Lcom/intsig/camscanner/attention/CallAppData;)V
        const/4 v1, 0x0
        invoke-virtual {v0, v1}, $WATCH_CALLBACK->〇〇888(Lcom/intsig/advertisement/interfaces/RealRequestAbs;)V
        invoke-virtual {v0, v1}, $WATCH_CALLBACK->〇O8o08O(Lcom/intsig/advertisement/interfaces/RealRequestAbs;)V
        :reward_skip_cancel
        return-void
        :reward_skip_original
        nop
    """.trimIndent()
}

/** Install using the qualified real dispatch site, including its nonzero MAIN offset. */
internal fun installRewardSkip(method: MutableMethod, site: RewardSkipSite) {
    method.addInstructionsWithLabels(rewardSkipIndex(method, site), rewardSkipPrefix(site))
}
