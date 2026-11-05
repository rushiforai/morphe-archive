package app.template.patches.shared.misc.dns

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.AccessFlags

private const val TRR_MODE_FIRST = 2
private const val TRR_MODE_ONLY = 3

/** network.trr.mode the "DNS filter" patches force: TRR only (strict) or TRR first (fallback). */
internal fun geckoTrrMode(strict: Boolean) = if (strict) TRR_MODE_ONLY else TRR_MODE_FIRST

/**
 * Pins GeckoView's DNS-over-HTTPS settings to [url] in [strict] or fallback mode, whatever the app
 * passes: the mode and URI setters overwrite their argument at entry, the excluded-domains setter
 * always stores an empty list, and GeckoRuntime.create(Context, GeckoRuntimeSettings) calls the
 * mode and URI setters on the settings it starts Gecko with (Focus never sets them at all).
 */
internal fun BytecodePatchContext.forceGeckoViewDns(url: String, strict: Boolean) {
    val mode = geckoTrrMode(strict)

    // ── 1. Setters: the app (Fenix's DoH screen and exceptions, the engine settings) can call them
    //  at any time, so each one stores the forced value instead of its argument.
    val setMode = GeckoSetTrrModeFingerprint.method
    val setUri = GeckoSetTrrUriFingerprint.method
    val setExcluded = GeckoSetTrrExcludedDomainsFingerprint.method
    listOf(setMode, setUri, setExcluded).forEach { it.requireNoBranchTargetAt(0, "forced DoH argument") }
    setMode.addInstructionChecked(0, "const/4 p1, 0x$mode")
    setUri.addInstructionChecked(0, "const-string p1, \"$url\"")
    setExcluded.addInstructionsChecked(
        0,
        """
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object p1
        """,
    )

    // ── 2. Runtime start: apply both before init sends the settings to Gecko. At the entry of
    //  this static method every local is free; v0 carries each value.
    val create = GeckoRuntimeCreateWithSettingsFingerprint.method
    val parameterRegisters = create.parameterTypes.size + if (AccessFlags.STATIC.isSet(create.accessFlags)) 0 else 1
    if (create.implementation!!.registerCount <= parameterRegisters) {
        throw PatchException("$GECKO_RUNTIME->create has no local register")
    }
    create.addInstructionsChecked(
        0,
        """
            const/4 v0, 0x$mode
            invoke-virtual {p1, v0}, $GECKO_RUNTIME_SETTINGS->${setMode.name}(I)${setMode.returnType}
            const-string v0, "$url"
            invoke-virtual {p1, v0}, $GECKO_RUNTIME_SETTINGS->${setUri.name}(Ljava/lang/String;)${setUri.returnType}
        """,
    )
}
