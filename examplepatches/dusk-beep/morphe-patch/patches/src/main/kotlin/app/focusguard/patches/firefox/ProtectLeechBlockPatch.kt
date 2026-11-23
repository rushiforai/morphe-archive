package app.focusguard.patches.firefox

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.cloneMutable
import app.morphe.util.transformMethods

val protectLeechBlockPatch =
    patch(
        name = "Protect LeechBlock NG",
        description =
            "Protects LeechBlock NG from disabling, uninstalling and losing private browsing access.",
    ) {
      compatibleWith(
          Compatibility(
              packageName = "org.mozilla.firefox",
              name = "Firefox",
              targets = listOf(AppTarget(version = null)),
          ),
      )

      execute {
        val engineClassName = "Lmozilla/components/browser/engine/gecko/GeckoEngine;"

        val disableFingerprint =
            Fingerprint(
                definingClass = engineClassName,
                name = "disableWebExtension",
                returnType = "V",
                // drop parameters, or at most assert count:
                // match parameters only if not null
            )

        val uninstallFingerprint =
            Fingerprint(
                definingClass = engineClassName,
                name = "uninstallWebExtension",
                returnType = "V",
            )

        val privateBrowsingFingerprint =
            Fingerprint(
                definingClass = engineClassName,
                name = "setAllowedInPrivateBrowsing",
                returnType = "V",
            )

        // Resolve all original methods before replacing any.
        // Resolve all original methods before replacing any.
        val originalDisable = disableFingerprint.method
        val originalUninstall = uninstallFingerprint.method
        val originalPrivateBrowsing = privateBrowsingFingerprint.method

        // --- Runtime register layout checks -------------------------------
        // The guards we insert use 2 scratch registers. In a cloned method,
        // cloneMutable places the added registers starting at the ORIGINAL
        // registerCount, and pX aliases the top paramSize registers of the
        // added range. So v[rc] and v[rc+1] are always free scratch registers
        // as long as additionalRegisters > paramSize + 1.

        fun assertLayout(
            method: MutableMethod,
            paramSize: Int,
            methodName: String,
        ) {
          check(method.implementation != null) { "$methodName has no implementation" }
          check(method.parameters.size == paramSize - 1) {
            "$methodName parameter count changed (${method.parameters.size}); " +
                "guard smali references p-registers by index and must be updated"
          }
        }

        assertLayout(originalDisable, 5, "disableWebExtension") // this + 4 params
        assertLayout(originalUninstall, 4, "uninstallWebExtension") // this + 3 params
        assertLayout(originalPrivateBrowsing, 5, "setAllowedInPrivateBrowsing")

        var protectedDisable: MutableMethod? = null
        var protectedUninstall: MutableMethod? = null
        var protectedPrivateBrowsing: MutableMethod? = null

        val engineClass = mutableClassDefBy(engineClassName)

        engineClass.transformMethods {
          when (name) {
            originalDisable.name -> {
              cloneMutable(additionalRegisters = 9).also { protectedDisable = it }
            }

            originalUninstall.name -> {
              cloneMutable(additionalRegisters = 8).also { protectedUninstall = it }
            }

            originalPrivateBrowsing.name -> {
              cloneMutable(additionalRegisters = 9).also { protectedPrivateBrowsing = it }
            }

            else -> {
              this
            }
          }
        }

        val disableMethod =
            requireNotNull(protectedDisable) {
              "Could not replace disableWebExtension"
            }

        val uninstallMethod =
            requireNotNull(protectedUninstall) {
              "Could not replace uninstallWebExtension"
            }

        val privateBrowsingMethod =
            requireNotNull(protectedPrivateBrowsing) {
              "Could not replace setAllowedInPrivateBrowsing"
            }

        // Scratch registers: first two registers of the added range.
        val disableScratch1 = originalDisable.implementation!!.registerCount // v[rc]
        val disableScratch2 = disableScratch1 + 1

        disableMethod.addInstructions(
            0,
            """
                iget-object v$disableScratch1, p1, Lmozilla/components/concept/engine/webextension/WebExtension;->id:Ljava/lang/String;
                const-string/jumbo v$disableScratch2, "leechblockng@proginosko.com"
                invoke-virtual {v$disableScratch1, v$disableScratch2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v$disableScratch1
                if-eqz v$disableScratch1, :leechblock_disable_continue

                new-instance v$disableScratch1, Ljava/lang/IllegalStateException;
                const-string/jumbo v$disableScratch2, "LeechBlock NG is protected by Focus Guard"
                invoke-direct {v$disableScratch1, v$disableScratch2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
                invoke-interface {p4, v$disableScratch1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                return-void

                :leechblock_disable_continue
                """
                .trimIndent(),
        )
        // Protect uninstallWebExtension.
        val uninstallRc = originalUninstall.implementation!!.registerCount
        val uninstallScratch1 = uninstallRc
        val uninstallScratch2 = uninstallRc + 1

        uninstallMethod.addInstructions(
            0,
            """
                iget-object v$uninstallScratch1, p1, Lmozilla/components/concept/engine/webextension/WebExtension;->id:Ljava/lang/String;
                const-string/jumbo v$uninstallScratch2, "leechblockng@proginosko.com"
                invoke-virtual {v$uninstallScratch1, v$uninstallScratch2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v$uninstallScratch1
                if-eqz v$uninstallScratch1, :leechblock_uninstall_continue

                new-instance v$uninstallScratch1, Ljava/lang/IllegalStateException;
                const-string/jumbo v$uninstallScratch2, "LeechBlock NG is protected by Focus Guard"
                invoke-direct {v$uninstallScratch1, v$uninstallScratch2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
                invoke-interface {p3, p1, v$uninstallScratch1}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                return-void

                :leechblock_uninstall_continue
                """
                .trimIndent(),
        )

        val privateRc = originalPrivateBrowsing.implementation!!.registerCount
        val privateScratch1 = privateRc
        val privateScratch2 = privateRc + 1

        privateBrowsingMethod.addInstructions(
            0,
            """
                iget-object v$privateScratch1, p1, Lmozilla/components/concept/engine/webextension/WebExtension;->id:Ljava/lang/String;
                const-string/jumbo v$privateScratch2, "leechblockng@proginosko.com"
                invoke-virtual {v$privateScratch1, v$privateScratch2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v$privateScratch1
                if-eqz v$privateScratch1, :leechblock_private_continue

                const/4 p2, 0x1

                :leechblock_private_continue
                """
                .trimIndent(),
        )
      }
    }
