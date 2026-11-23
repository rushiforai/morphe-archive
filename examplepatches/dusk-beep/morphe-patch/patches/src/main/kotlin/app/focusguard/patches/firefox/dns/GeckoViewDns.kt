package app.focusguard.patches.firefox.dns

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags

private const val TRR_MODE_ONLY = 3

internal const val GECKO_RUNTIME = "Lorg/mozilla/geckoview/GeckoRuntime;"

internal const val GECKO_RUNTIME_SETTINGS = "Lorg/mozilla/geckoview/GeckoRuntimeSettings;"

private val setTrrModeFingerprint =
    Fingerprint(
        definingClass = GECKO_RUNTIME_SETTINGS,
        name = "setTrustedRecursiveResolverMode",
        parameters = listOf("I"),
    )

private val setTrrUriFingerprint =
    Fingerprint(
        definingClass = GECKO_RUNTIME_SETTINGS,
        name = "setTrustedRecursiveResolverUri",
        parameters = listOf("Ljava/lang/String;"),
    )

private val setTrrExcludedDomainsFingerprint =
    Fingerprint(
        definingClass = GECKO_RUNTIME_SETTINGS,
        name = "setTrustedRecursiveResolverExcludedDomains",
        parameters = listOf("Ljava/util/List;"),
    )

private val runtimeCreateFingerprint =
    Fingerprint(
        definingClass = GECKO_RUNTIME,
        name = "create",
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
        returnType = GECKO_RUNTIME,
        parameters =
            listOf(
                "Landroid/content/Context;",
                GECKO_RUNTIME_SETTINGS,
            ),
    )

internal fun forceGeckoViewDns(url: String) {
  val setMode = setTrrModeFingerprint.method
  val setUri = setTrrUriFingerprint.method
  val setExcluded = setTrrExcludedDomainsFingerprint.method

  setMode.addInstructions(
      0,
      "const/4 p1, 0x3",
  )

  setUri.addInstructions(
      0,
      """const-string p1, "$url"""",
  )

  setExcluded.addInstructions(
      0,
      """
      invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
      move-result-object p1
      """
          .trimIndent(),
  )

  val create = runtimeCreateFingerprint.method

  val parameterRegisters =
      create.parameterTypes.size + if (AccessFlags.STATIC.isSet(create.accessFlags)) 0 else 1

  if (create.implementation!!.registerCount <= parameterRegisters) {
    throw PatchException("$GECKO_RUNTIME->create has no local register")
  }

  create.addInstructions(
      0,
      """
        const/4 v0, 0x3
        invoke-virtual {p1, v0}, $GECKO_RUNTIME_SETTINGS->${setMode.name}(I)${setMode.returnType}
        const-string v0, "$url"
        invoke-virtual {p1, v0}, $GECKO_RUNTIME_SETTINGS->${setUri.name}(Ljava/lang/String;)${setUri.returnType}
        """
          .trimIndent(),
  )
}
