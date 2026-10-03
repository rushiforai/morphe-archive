package app.aidan.patches.aftership.auth

import app.aidan.patches.aftership.shared.Constants.COMPATIBILITY_AFTERSHIP
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.PatchException

private const val LOGIN_REGISTER_ACTIVITY = "Lcom/aftership/shopper/views/login/LoginRegisterStateActivity;"
private const val ACCOUNT_FRAGMENT = "LN5/k;"
private const val HOME_PRESENTER = "Lcom/aftership/shopper/views/home/presenter/HomePresenter;"
private const val ANONYMOUS_GUIDE_DIALOG = "LM5/e;"

@Suppress("unused")
val bypassSignatureCheckResourcePatch = rawResourcePatch(
    name = "Bypass Native Signature Check",
    description = "Neutralizes APK signature verification in libandroidsig-lib.so so API requests succeed when signed with custom keys.",
    default = true
) {
    compatibleWith(COMPATIBILITY_AFTERSHIP)

    execute {

        // Patch arm64-v8a checkApkSha
        val arm64So = get("lib/arm64-v8a/libandroidsig-lib.so")
        if (arm64So.exists()) {
            val bytes = arm64So.readBytes()
            val offset = 0x48dd8
            if (bytes.size <= offset + 8) {
                throw PatchException("lib/arm64-v8a/libandroidsig-lib.so is too small for patch offset")
            }
            val expected = byteArrayOf(
                0xff.toByte(), 0x43, 0x02, 0xd1.toByte(),
                0xf7.toByte(), 0x2b, 0x00, 0xf9.toByte()
            )
            val replacement = byteArrayOf(
                0x20.toByte(), 0x00.toByte(), 0x80.toByte(), 0x52.toByte(),
                0xc0.toByte(), 0x03.toByte(), 0x5f.toByte(), 0xd6.toByte()
            )
            val alreadyPatched = replacement.indices.all { bytes[offset + it] == replacement[it] }
            if (!alreadyPatched) {
                val matches = expected.indices.all { bytes[offset + it] == expected[it] }
                if (!matches) {
                    throw PatchException("lib/arm64-v8a/libandroidsig-lib.so byte sequence mismatch at offset 0x48dd8")
                }
                System.arraycopy(replacement, 0, bytes, offset, 8)
                arm64So.writeBytes(bytes)
            }
        }

        // Patch armeabi-v7a checkApkSha
        val armV7So = get("lib/armeabi-v7a/libandroidsig-lib.so")
        if (armV7So.exists()) {
            val bytes = armV7So.readBytes()
            val offset = 0x3d54c
            if (bytes.size <= offset + 4) {
                throw PatchException("lib/armeabi-v7a/libandroidsig-lib.so is too small for patch offset")
            }
            val expected = byteArrayOf(
                0xf0.toByte(), 0xb5.toByte(), 0x03, 0xaf.toByte()
            )
            val replacement = byteArrayOf(
                0x01.toByte(), 0x20.toByte(), 0x70.toByte(), 0x47.toByte()
            )
            val alreadyPatched = replacement.indices.all { bytes[offset + it] == replacement[it] }
            if (!alreadyPatched) {
                val matches = expected.indices.all { bytes[offset + it] == expected[it] }
                if (!matches) {
                    throw PatchException("lib/armeabi-v7a/libandroidsig-lib.so byte sequence mismatch at offset 0x3d54c")
                }
                System.arraycopy(replacement, 0, bytes, offset, 4)
                armV7So.writeBytes(bytes)
            }
        }
    }
}

@Suppress("unused")
val removeLoginPatch = bytecodePatch(
    name = "Remove Login",
    description = "Forces guest mode always on first install, removes login buttons and carousels, strips account/login controls from the Account tab, and suppresses login prompts.",
    default = true
) {
    compatibleWith(COMPATIBILITY_AFTERSHIP)
    dependsOn(bypassSignatureCheckResourcePatch)

    execute {
        // 1. Force guest flow and bypass login carousel in LoginRegisterStateActivity.onCreate
        patchLoginRegisterStateActivity()

        // 2. Hide "SIGN UP/LOGIN" card and "Account" menu item in AccountFragment
        patchAccountFragment()

        // 3. Neutralize 2-shipment login prompt nag in HomePresenter
        patchHomePresenter()

        // 4. Neutralize AnonymousGuideLoginDialogFragment if shown
        patchAnonymousGuideDialog()
    }
}

/**
 * Routes login activity creation through guest mode, opening Home for an existing
 * guest or requesting an anonymous token.
 * Missing targets are skipped and patching exceptions are suppressed.
 */
private fun BytecodePatchContext.patchLoginRegisterStateActivity() {
    try {
        val classDef = classDefByOrNull(LOGIN_REGISTER_ACTIVITY) ?: return
        val mutableClass = mutableClassDefBy(classDef)
        val onCreateMethod = mutableClass.methods.firstOrNull {
            it.name == "onCreate" && it.returnType == "V" && it.implementation != null
        } ?: return

        onCreateMethod.addInstructions(
            0,
            """
                invoke-super {p0, p1}, Lcom/aftership/common/mvp/base/abs/AbsCommonActivity;->onCreate(Landroid/os/Bundle;)V

                invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;
                move-result-object v0
                invoke-virtual {v0, p0}, Lorg/greenrobot/eventbus/EventBus;->register(Ljava/lang/Object;)V

                sget-object v0, Ld8/b${'$'}a;->f:Ld8/b${'$'}a;
                iput-object v0, p0, Lcom/aftership/shopper/views/login/LoginRegisterStateActivity;->r:Ld8/b${'$'}a;

                invoke-static {}, LB4/h;->W()Z
                move-result v0
                if-eqz v0, :cond_gen_token

                invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
                move-result-object v0
                invoke-static {p0, v0}, Lcom/aftership/shopper/views/home/HomeActivity;->W2(Lcom/aftership/common/mvp/base/abs/AbsCommonActivity;Landroid/content/Intent;)V
                invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                return-void

                :cond_gen_token
                invoke-virtual {p0}, Lcom/aftership/shopper/views/login/LoginRegisterStateActivity;->L1()Lcom/aftership/shopper/views/login/contract/ILoginRegisterContract${'$'}AbsLoginRegisterPresenter;
                move-result-object v0
                invoke-virtual {v0}, Lcom/aftership/shopper/views/login/contract/ILoginRegisterContract${'$'}AbsLoginRegisterPresenter;->generateAnonymousToken()V
                return-void
            """.trimIndent()
        )
    } catch (_: Exception) {
    }
}

/**
 * Hides the login card and account menu item when the Account view is created.
 * Missing targets are skipped and patching exceptions are suppressed.
 */
private fun BytecodePatchContext.patchAccountFragment() {
    try {
        val classDef = classDefByOrNull(ACCOUNT_FRAGMENT) ?: return
        val mutableClass = mutableClassDefBy(classDef)
        val onViewCreatedMethod = mutableClass.methods.firstOrNull {
            it.name == "onViewCreated" && it.returnType == "V" && it.implementation != null
        } ?: return
        // Insert right after super.onViewCreated(view, bundle) (index 3)
        // Uses straight-line bytecode without labels to avoid Dexlib2 branch offset miscalculations
        onViewCreatedMethod.addInstructions(
            3,
            """
                const/16 v0, 0x8
                iget-object v1, p0, LN5/k;->p:Lz2/p;
                iget-object v2, v1, Lz2/p;->d:Landroid/widget/LinearLayout;
                invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V
                iget-object v1, v1, Lz2/p;->f:LM0/d;
                iget-object v1, v1, LM0/d;->b:Ljava/lang/Object;
                check-cast v1, Landroid/view/View;
                invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V
            """.trimIndent()
        )
    } catch (_: Exception) {
    }
}

/**
 * Disables the login prompt before adding two shipments.
 * Missing targets are skipped and patching exceptions are suppressed.
 */
private fun BytecodePatchContext.patchHomePresenter() {
    try {
        val classDef = classDefByOrNull(HOME_PRESENTER) ?: return
        val mutableClass = mutableClassDefBy(classDef)
        val method = mutableClass.methods.firstOrNull {
            it.name == "handleAnonymousLoginBeforeAddTwoTracking" && it.returnType == "V" && it.implementation != null
        } ?: return

        method.addInstructions(0, "return-void")
    } catch (_: Exception) {
    }
}
/**
 * Makes the anonymous-login guide return no view and dismiss itself on start.
 * Missing targets are skipped and patching exceptions are suppressed.
 */
private fun BytecodePatchContext.patchAnonymousGuideDialog() {
    try {
        val classDef = classDefByOrNull(ANONYMOUS_GUIDE_DIALOG) ?: return
        val mutableClass = mutableClassDefBy(classDef)

        for (method in mutableClass.methods) {
            if (method.name == "onStart" && method.returnType == "V" && method.implementation != null) {
                method.addInstructions(
                    0,
                    """
                        invoke-virtual {p0}, Landroidx/fragment/app/g;->dismissAllowingStateLoss()V
                        return-void
                    """.trimIndent()
                )
            } else if (method.name == "onCreateView" && method.returnType == "Landroid/view/View;" && method.implementation != null) {
                method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
            }
        }
    } catch (_: Exception) {
    }
}
