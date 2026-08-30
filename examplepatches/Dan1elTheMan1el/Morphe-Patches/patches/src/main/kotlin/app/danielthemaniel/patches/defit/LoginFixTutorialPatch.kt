package app.danielthemaniel.patches.defit

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

/**
 * Internal bytecode portion.
 *
 * Adds three methods to MainActivity:
 * - patch_getSigningSha1()
 * - patch_loginFixTutorial(View)
 * - patch_copySha1(View)
 */
private val loginFixTutorialBytecodePatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_DEFIT)

    execute {
        val mainActivity = mutableClassDefBy(
            "Lcom/googlefit/tester/MainActivity;"
        )

        // MainActivity.y() is DeFit's normal login-state UI refresh.
        // Inject the visibility logic directly so InlineSmaliCompiler only
        // needs to resolve methods/classes that already exist in the APK.
        mainActivity.methods
            .firstOrNull {
                it.name == "y" &&
                    it.parameterTypes.isEmpty() &&
                    it.returnType == "V"
            }
            ?.addInstructions(
                0,
                """
                move-object/from16 v0, p0

                invoke-static {v0}, Lp2/a;->a(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;
                move-result-object v1

                if-nez v1, :patch_logged_in

                const/4 v1, 0x0
                goto :patch_apply_visibility

                :patch_logged_in
                const/16 v1, 0x8

                :patch_apply_visibility
                invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v2

                invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
                move-result-object v3

                const-string v4, "loginFixTutorialButton"
                const-string v5, "id"
                invoke-virtual {v2, v4, v5, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                move-result v4

                if-eqz v4, :patch_copy_button
                invoke-virtual {v0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                move-result-object v4
                if-eqz v4, :patch_copy_button
                invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

                :patch_copy_button
                const-string v4, "copySigningSha1Button"
                invoke-virtual {v2, v4, v5, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                move-result v4

                if-eqz v4, :patch_visibility_done
                invoke-virtual {v0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                move-result-object v4
                if-eqz v4, :patch_visibility_done
                invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

                :patch_visibility_done
                """.trimIndent()
            )


        // Return the installed APK's actual signing certificate SHA-1
        // as AA:BB:CC:... so it can be pasted directly into Firebase.
        mainActivity.methods.add(
            ImmutableMethod(
                mainActivity.type,
                "patch_getSigningSha1",
                emptyList(),
                "Ljava/lang/String;",
                AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                null,
                null,
                MutableMethodImplementation(12),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
                    move-result-object v0

                    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
                    move-result-object v1

                    const/16 v2, 0x40
                    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
                    move-result-object v0

                    iget-object v0, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;
                    const/4 v1, 0x0
                    aget-object v0, v0, v1

                    invoke-virtual {v0}, Landroid/content/pm/Signature;->toByteArray()[B
                    move-result-object v0

                    const-string v1, "SHA-1"
                    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
                    move-result-object v1

                    invoke-virtual {v1, v0}, Ljava/security/MessageDigest;->digest([B)[B
                    move-result-object v0

                    new-instance v1, Ljava/math/BigInteger;
                    const/4 v2, 0x1
                    invoke-direct {v1, v2, v0}, Ljava/math/BigInteger;-><init>(I[B)V

                    const-string v2, "%040X"
                    const/4 v3, 0x1
                    new-array v3, v3, [Ljava/lang/Object;
                    const/4 v4, 0x0
                    aput-object v1, v3, v4

                    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v0

                    const-string v1, "..(?!$)"
                    const-string v2, "$0:"
                    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v0

                    return-object v0
                    """.trimIndent()
                )
            }
        )

        // android:onClick target for the tutorial button.
        mainActivity.methods.add(
            ImmutableMethod(
                mainActivity.type,
                "patch_loginFixTutorial",
                listOf(
                    ImmutableMethodParameter(
                        "Landroid/view/View;",
                        null,
                        null,
                    )
                ),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                null,
                null,
                MutableMethodImplementation(12),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                    invoke-direct {p0}, Lcom/googlefit/tester/MainActivity;->patch_getSigningSha1()Ljava/lang/String;
                    move-result-object v0

                    const-string v1, "Google Fit sign-in requires Google to recognize this patched APK's package name and signing certificate.\n\n1. Sign in to Firebase Console and create a project:\nhttps://console.firebase.google.com/\n\n2. Add an Android app using this exact package name:\ncom.fitness.debugger\n\nThe other Android-app fields do not matter for this fix.\n\n3. In that Android app's settings, add this SHA-1 fingerprint:\n%s\n\nUse the Step 3 — Copy SHA-1 button below the tutorial button to copy it.\n\n4. In the Firebase project categories, go to Security > Authentication > Sign-in method, then add Google as a sign-in provider.\n\n5. Fully close DeFit++, reopen it, and try signing in again.\n\nIf you later patch/sign DeFit with a different signing key, the SHA-1 will change and the new fingerprint must also be added."

                    const/4 v2, 0x1
                    new-array v2, v2, [Ljava/lang/Object;
                    const/4 v3, 0x0
                    aput-object v0, v2, v3

                    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v1

                    new-instance v2, Landroid/text/SpannableString;
                    invoke-direct {v2, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

                    const-string v3, "https://console.firebase.google.com/"
                    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
                    move-result v4

                    invoke-virtual {v3}, Ljava/lang/String;->length()I
                    move-result v5
                    add-int v5, v4, v5

                    new-instance v6, Landroid/text/style/URLSpan;
                    invoke-direct {v6, v3}, Landroid/text/style/URLSpan;-><init>(Ljava/lang/String;)V

                    const/16 v7, 0x21
                    invoke-virtual {v2, v6, v4, v5, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

                    new-instance v0, Landroid/app/AlertDialog${'$'}Builder;
                    invoke-direct {v0, p0}, Landroid/app/AlertDialog${'$'}Builder;-><init>(Landroid/content/Context;)V

                    const-string v1, "Login Fix Tutorial"
                    invoke-virtual {v0, v1}, Landroid/app/AlertDialog${'$'}Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog${'$'}Builder;

                    invoke-virtual {v0, v2}, Landroid/app/AlertDialog${'$'}Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog${'$'}Builder;

                    const-string v1, "OK"
                    const/4 v2, 0x0
                    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog${'$'}Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface${'$'}OnClickListener;)Landroid/app/AlertDialog${'$'}Builder;

                    invoke-virtual {v0}, Landroid/app/AlertDialog${'$'}Builder;->show()Landroid/app/AlertDialog;
                    move-result-object v0

                    const v1, 0x102000b
                    invoke-virtual {v0, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
                    move-result-object v0
                    check-cast v0, Landroid/widget/TextView;

                    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;
                    move-result-object v1
                    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

                    return-void
                    """.trimIndent()
                )
            }
        )

        // android:onClick target for the Copy SHA-1 button.
        mainActivity.methods.add(
            ImmutableMethod(
                mainActivity.type,
                "patch_copySha1",
                listOf(
                    ImmutableMethodParameter(
                        "Landroid/view/View;",
                        null,
                        null,
                    )
                ),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                null,
                null,
                MutableMethodImplementation(12),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                    invoke-direct {p0}, Lcom/googlefit/tester/MainActivity;->patch_getSigningSha1()Ljava/lang/String;
                    move-result-object v0

                    const-string v1, "clipboard"
                    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
                    move-result-object v1
                    check-cast v1, Landroid/content/ClipboardManager;

                    const-string v2, "DeFit++ SHA-1"
                    invoke-static {v2, v0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;
                    move-result-object v0

                    invoke-virtual {v1, v0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

                    const-string v0, "SHA-1 copied to clipboard"
                    const/4 v1, 0x0
                    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
                    move-result-object v0
                    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

                    return-void
                    """.trimIndent()
                )
            }
        )
    }
}

/**
 * Adds the visible tutorial/copy controls.
 *
 * The bytecode dependency is nameless, so Morphe should expose only this
 * user-facing patch.
 */
@Suppress("unused")
val loginFixTutorialPatch = resourcePatch(
    name = "Login Fix Tutorial",
    description = "Adds an in-app Google Fit login setup guide and a button to copy the installed APK's signing SHA-1.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DEFIT)
    dependsOn(loginFixTutorialBytecodePatch)

    execute {
        document("res/layout/activity_main.xml").use { document ->
            val nodes = document.getElementsByTagName("*")

            var loginButton: Element? = null
            var syncSwitch: Element? = null

            for (i in 0 until nodes.length) {
                val element = nodes.item(i) as? Element ?: continue

                when (element.getAttribute("android:id")) {
                    "@+id/logButton", "@id/logButton" -> loginButton = element
                    "@+id/syncSwitch", "@id/syncSwitch" -> syncSwitch = element
                }
            }

            val login = loginButton ?: return@use
            val sync = syncSwitch ?: return@use

            // Both controls must live in the same layout container as the
            // existing login/sync controls so ConstraintLayout can position
            // them without overlaying the rest of the screen.
            val parent = login.parentNode
            if (sync.parentNode != parent) return@use

            fun freshButton(
                id: String,
                text: String,
                onClick: String,
            ): Element {
                val button = document.createElement("Button")

                button.setAttribute("android:id", "@+id/$id")
                button.setAttribute("android:layout_width", "0dp")
                button.setAttribute("android:layout_height", "wrap_content")
                button.setAttribute("android:text", text)
                button.setAttribute("android:onClick", onClick)
                button.setAttribute("android:textAllCaps", "false")
                button.setAttribute("android:enabled", "true")
                button.setAttribute("android:clickable", "true")
                button.setAttribute("android:visibility", "gone")

                // Match the login button's horizontal placement/margins when
                // those attributes exist, but deliberately do NOT copy its
                // enabled/visibility/state attributes.
                listOf(
                    "android:layout_marginStart",
                    "android:layout_marginEnd",
                    "android:layout_marginLeft",
                    "android:layout_marginRight",
                    "android:layout_marginTop",
                    "android:layout_marginBottom",
                    "app:layout_constraintStart_toStartOf",
                    "app:layout_constraintStart_toEndOf",
                    "app:layout_constraintEnd_toStartOf",
                    "app:layout_constraintEnd_toEndOf",
                    "app:layout_constraintLeft_toLeftOf",
                    "app:layout_constraintLeft_toRightOf",
                    "app:layout_constraintRight_toLeftOf",
                    "app:layout_constraintRight_toRightOf",
                ).forEach { attr ->
                    if (login.hasAttribute(attr)) {
                        button.setAttribute(attr, login.getAttribute(attr))
                    }
                }

                // Fallback for layouts where the original button does not
                // explicitly declare horizontal constraints.
                if (!button.hasAttribute("app:layout_constraintStart_toStartOf") &&
                    !button.hasAttribute("app:layout_constraintStart_toEndOf") &&
                    !button.hasAttribute("app:layout_constraintLeft_toLeftOf") &&
                    !button.hasAttribute("app:layout_constraintLeft_toRightOf")
                ) {
                    button.setAttribute(
                        "app:layout_constraintStart_toStartOf",
                        "parent"
                    )
                }

                if (!button.hasAttribute("app:layout_constraintEnd_toStartOf") &&
                    !button.hasAttribute("app:layout_constraintEnd_toEndOf") &&
                    !button.hasAttribute("app:layout_constraintRight_toLeftOf") &&
                    !button.hasAttribute("app:layout_constraintRight_toRightOf")
                ) {
                    button.setAttribute(
                        "app:layout_constraintEnd_toEndOf",
                        "parent"
                    )
                }

                return button
            }

            val tutorialButton = freshButton(
                id = "loginFixTutorialButton",
                text = "Login Fix Tutorial",
                onClick = "patch_loginFixTutorial",
            )

            val copyButton = freshButton(
                id = "copySigningSha1Button",
                text = "Step 3 — Copy SHA-1",
                onClick = "patch_copySha1",
            )

            // Explicit vertical chain:
            //
            // Google login
            // ↓
            // Login Fix Tutorial
            // ↓
            // Copy SHA-1
            // ↓
            // Sync fitness data section
            tutorialButton.setAttribute(
                "app:layout_constraintTop_toBottomOf",
                "@id/logButton"
            )

            copyButton.setAttribute(
                "app:layout_constraintTop_toBottomOf",
                "@id/loginFixTutorialButton"
            )

            // Remove whatever originally tied the sync section to the login
            // area and make it begin below our new controls.
            listOf(
                "app:layout_constraintTop_toTopOf",
                "app:layout_constraintTop_toBottomOf",
                "android:layout_below",
            ).forEach(sync::removeAttribute)

            sync.setAttribute(
                "app:layout_constraintTop_toBottomOf",
                "@id/copySigningSha1Button"
            )

            parent.appendChild(tutorialButton)
            parent.appendChild(copyButton)
        }
    }
}
