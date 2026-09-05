package app.danielthemaniel.patches.defit

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element


private object LoginTutorialAssetMarker

private val LOGIN_TUTORIAL_ASSETS = listOf(
    "0.8.2a.html",
    "0.9.3.html",
    "tutorial.css",
    "images/01-firebase-project.png",
    "images/02-add-android-app.png",
    "images/03-add-sha1.png",
    "images/04-enable-google.png",
    "images/05-cloud-credentials.png",
    "images/06-web-client.png",
    "images/07-create-secret.png",
    "images/example-works.png"
)

/**
 * Internal bytecode portion.
 *
 * Adds:
 * - runtime visibility handling for the supported DeFit version
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

        /*
         * Login-state refresh changed between releases:
         *
         * 0.8.2a:
         *   MainActivity.y()
         *   p2.a.a(Context)
         *
         * 0.9.3:
         *   MainActivity.updateUI()
         *   j6.u.u(Context)
         *
         * The controls are looked up by resource name so this bytecode does
         * not need compile-time IDs for resources added by this patch.
         */
        val legacyRefresh = mainActivity.methods.firstOrNull {
            it.name == "y" &&
                it.parameterTypes.isEmpty() &&
                it.returnType == "V"
        }

        if (legacyRefresh != null) {
            legacyRefresh.addInstructions(
                0,
                """
                move-object/from16 v0, p0

                invoke-static {v0}, Lp2/a;->a(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;
                move-result-object v1

                if-nez v1, :patch_login_help_logged_in

                const/4 v1, 0x0
                goto :patch_login_help_apply

                :patch_login_help_logged_in
                const/16 v1, 0x8

                :patch_login_help_apply
                invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v2

                invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
                move-result-object v3

                const-string v4, "loginFixTutorialButton"
                const-string v5, "id"
                invoke-virtual {v2, v4, v5, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                move-result v4

                if-eqz v4, :patch_login_help_copy
                invoke-virtual {v0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                move-result-object v4
                if-eqz v4, :patch_login_help_copy
                invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

                :patch_login_help_copy
                const-string v4, "copySigningSha1Button"
                invoke-virtual {v2, v4, v5, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                move-result v4

                if-eqz v4, :patch_login_help_done
                invoke-virtual {v0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                move-result-object v4
                if-eqz v4, :patch_login_help_done
                invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

                :patch_login_help_done
                """.trimIndent()
            )
        } else {
            val modernRefresh = mainActivity.methods.first {
                it.name == "updateUI" &&
                    it.parameterTypes.isEmpty() &&
                    it.returnType == "V"
            }

            modernRefresh.addInstructions(
                0,
                """
                move-object/from16 v0, p0

                invoke-static {v0}, Lj6/u;->u(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;
                move-result-object v1

                if-nez v1, :patch_login_help_logged_in

                const/4 v1, 0x0
                goto :patch_login_help_apply

                :patch_login_help_logged_in
                const/16 v1, 0x8

                :patch_login_help_apply
                invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v2

                invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
                move-result-object v3

                const-string v4, "loginFixTutorialButton"
                const-string v5, "id"
                invoke-virtual {v2, v4, v5, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                move-result v4

                if-eqz v4, :patch_login_help_copy
                invoke-virtual {v0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                move-result-object v4
                if-eqz v4, :patch_login_help_copy
                invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

                :patch_login_help_copy
                const-string v4, "copySigningSha1Button"
                invoke-virtual {v2, v4, v5, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                move-result v4

                if-eqz v4, :patch_login_help_oauth
                invoke-virtual {v0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                move-result-object v4
                if-eqz v4, :patch_login_help_oauth
                invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

                :patch_login_help_oauth
                const-string v4, "oauthCredentialsButton"
                invoke-virtual {v2, v4, v5, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                move-result v4

                if-eqz v4, :patch_login_help_panel
                invoke-virtual {v0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                move-result-object v4
                if-eqz v4, :patch_login_help_panel
                invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

                :patch_login_help_panel
                if-eqz v1, :patch_login_help_done

                const-string v4, "oauthCredentialsPanel"
                invoke-virtual {v2, v4, v5, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                move-result v4

                if-eqz v4, :patch_login_help_done
                invoke-virtual {v0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                move-result-object v4
                if-eqz v4, :patch_login_help_done
                const/16 v5, 0x8
                invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

                :patch_login_help_done
                """.trimIndent()
            )
        }

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

        val is093 = mainActivity.methods.any {
            it.name == "updateUI" &&
                it.parameterTypes.isEmpty() &&
                it.returnType == "V"
        }

        if (is093) {
            /*
             * 0.9.3 reads its Web OAuth client ID/secret from resources.
             * Prefer values saved in-app, falling back to the stock resources
             * only until the user has configured their own credentials.
             *
             * Full 0.9.3 DEX audit:
             * - MainActivity.getGoogleSignInOptions():
             *     web_service_client_id (same resource ID read twice)
             * - RestApi.write():
             *     web_service_client_id
             *     web_service_client_secret
             *
             * The getters MUST be public static because RestApi invokes them
             * from a different class.
             */
            fun addOAuthGetter(
                methodName: String,
                preferenceKey: String,
                resourceName: String,
            ) {
                mainActivity.methods.add(
                    ImmutableMethod(
                        mainActivity.type,
                        methodName,
                        listOf(
                            ImmutableMethodParameter(
                                "Landroid/content/Context;",
                                null,
                                null,
                            )
                        ),
                        "Ljava/lang/String;",
                        AccessFlags.PUBLIC.value or
                            AccessFlags.STATIC.value,
                        null,
                        null,
                        MutableMethodImplementation(8),
                    ).toMutable().apply {
                        addInstructions(
                            0,
                            """
                            const-string v0, "defit_patch_oauth"
                            const/4 v1, 0x0
                            invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
                            move-result-object v0

                            const-string v1, "$preferenceKey"
                            const/4 v2, 0x0
                            invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                            move-result-object v0

                            if-eqz v0, :patch_oauth_fallback
                            invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
                            move-result v1
                            if-nez v1, :patch_oauth_fallback
                            return-object v0

                            :patch_oauth_fallback
                            invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                            move-result-object v0

                            const-string v1, "$resourceName"
                            const-string v2, "string"
                            invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
                            move-result-object v3

                            invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                            move-result v0

                            invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;
                            move-result-object v0
                            return-object v0
                            """.trimIndent()
                        )
                    }
                )
            }

            addOAuthGetter(
                "patch_getWebClientId",
                "web_client_id",
                "web_service_client_id",
            )
            addOAuthGetter(
                "patch_getWebClientSecret",
                "web_client_secret",
                "web_service_client_secret",
            )

            val rString = classDefBy(
                "Lcom/googlefit/tester/R\$string;"
            )

            fun resourceId(name: String): Int {
                val field = rString.fields.firstOrNull {
                    it.name == name
                } ?: error("Unable to find R.string.$name")

                return (field.initialValue as? IntEncodedValue)?.value
                    ?: error("Unable to resolve R.string.$name")
            }

            fun methodContextRegister(
                method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
                invoke: Any?,
            ): Int? {
                val implementation =
                    method.implementation ?: return null
                val isStatic =
                    method.accessFlags and AccessFlags.STATIC.value != 0

                fun width(type: CharSequence): Int =
                    if (type == "J" || type == "D") 2 else 1

                var register =
                    implementation.registerCount -
                        method.parameterTypes.sumOf { type ->
                            width(type)
                        } -
                        if (isStatic) 0 else 1

                if (!isStatic) {
                    if (
                        method.definingClass ==
                        "Lcom/googlefit/tester/MainActivity;"
                    ) {
                        return register
                    }
                    register++
                }

                method.parameterTypes.forEach { type ->
                    if (
                        type == "Landroid/content/Context;" ||
                        type == "Landroid/app/Activity;" ||
                        type ==
                            "Lcom/googlefit/tester/MainActivity;"
                    ) {
                        return register
                    }
                    register += width(type)
                }

                return when (invoke) {
                    is FiveRegisterInstruction ->
                        invoke.registerC
                    is RegisterRangeInstruction ->
                        invoke.startRegister
                    else -> null
                }
            }

            fun insertOAuthGetterCall(
                method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
                index: Int,
                contextRegister: Int,
                resultRegister: Int,
                helperName: String,
            ) {
                val reference = ImmutableMethodReference(
                    "Lcom/googlefit/tester/MainActivity;",
                    helperName,
                    listOf("Landroid/content/Context;"),
                    "Ljava/lang/String;",
                )
                val implementation =
                    method.implementation
                        ?: error("Method has no implementation")

                if (contextRegister <= 0xF) {
                    implementation.addInstruction(
                        index,
                        BuilderInstruction35c(
                            Opcode.INVOKE_STATIC,
                            1,
                            contextRegister,
                            0,
                            0,
                            0,
                            0,
                            reference,
                        ),
                    )
                } else {
                    implementation.addInstruction(
                        index,
                        BuilderInstruction3rc(
                            Opcode.INVOKE_STATIC_RANGE,
                            contextRegister,
                            1,
                            reference,
                        ),
                    )
                }

                implementation.addInstruction(
                    index + 1,
                    BuilderInstruction11x(
                        Opcode.MOVE_RESULT_OBJECT,
                        resultRegister,
                    ),
                )
            }

            fun overrideResourceReads(
                classDescriptor: String,
                resourceName: String,
                helperName: String,
            ): Int {
                val target =
                    mutableClassDefBy(classDescriptor)
                val id = resourceId(resourceName)
                var count = 0

                target.methods.forEach { method ->
                    val implementation =
                        method.implementation ?: return@forEach
                    val instructions =
                        implementation.instructions.toList()

                    val resourceIndexes =
                        instructions.withIndex()
                            .filter { (_, instruction) ->
                                val literal =
                                    (instruction as?
                                        NarrowLiteralInstruction)
                                        ?.narrowLiteral == id

                                val field =
                                    (instruction as?
                                        ReferenceInstruction)
                                        ?.reference
                                        ?.toString()
                                        ?.contains(
                                            "R\$string;->$resourceName:I"
                                        ) == true

                                literal || field
                            }
                            .map { it.index }
                            .sortedDescending()

                    resourceIndexes.forEach { resourceIndex ->
                        val end = minOf(
                            instructions.lastIndex,
                            resourceIndex + 8,
                        )

                        val getStringIndex =
                            (resourceIndex + 1..end)
                                .firstOrNull { i ->
                                    val reference =
                                        (instructions[i] as?
                                            ReferenceInstruction)
                                            ?.reference
                                            ?.toString()
                                            .orEmpty()
                                    reference.contains(
                                        "->getString(I)" +
                                            "Ljava/lang/String;"
                                    )
                                }
                                ?: return@forEach

                        val moveIndex =
                            (getStringIndex + 1..end)
                                .firstOrNull { i ->
                                    instructions[i].opcode ==
                                        Opcode.MOVE_RESULT_OBJECT
                                }
                                ?: return@forEach

                        val result =
                            (instructions[moveIndex] as?
                                OneRegisterInstruction)
                                ?.registerA
                                ?: return@forEach

                        val context =
                            methodContextRegister(
                                method,
                                instructions[getStringIndex],
                            ) ?: return@forEach

                        insertOAuthGetterCall(
                            method,
                            moveIndex + 1,
                            context,
                            result,
                            helperName,
                        )
                        count++
                    }
                }

                return count
            }

            val clientIdReads =
                // getGoogleSignInOptions() uses both of these on 0.9.3.
                // They MUST resolve to the same Web OAuth client ID or
                // GoogleSignInOptions.Builder throws:
                // "two different server client ids provided".
                overrideResourceReads(
                    "Lcom/googlefit/tester/MainActivity;",
                    "default_web_client_id",
                    "patch_getWebClientId",
                ) +
                    overrideResourceReads(
                        "Lcom/googlefit/tester/MainActivity;",
                        "web_service_client_id",
                        "patch_getWebClientId",
                    ) +
                    overrideResourceReads(
                        "Lcom/googlefit/tester/RestApi;",
                        "web_service_client_id",
                        "patch_getWebClientId",
                    )

            val clientSecretReads =
                overrideResourceReads(
                    "Lcom/googlefit/tester/MainActivity;",
                    "web_service_client_secret",
                    "patch_getWebClientSecret",
                ) +
                    overrideResourceReads(
                        "Lcom/googlefit/tester/RestApi;",
                        "web_service_client_secret",
                        "patch_getWebClientSecret",
                    )

            if (clientIdReads == 0) {
                error("Unable to patch 0.9.3 Google/Web OAuth client ID reads")
            }
            if (clientSecretReads == 0) {
                error(
                    "Unable to patch 0.9.3 Web OAuth client secret reads"
                )
            }

            /*
             * getGoogleSignInOptions() starts from
             * GoogleSignInOptions.DEFAULT_SIGN_IN. That stock object already
             * contains DeFit's original serverClientId in field E.
             *
             * 0.9.3 then reads web_service_client_id and performs Google's
             * builder consistency assertion:
             *
             *   existingServerClientId == requestedServerClientId
             *
             * Once we substitute the user's saved Web client ID, the inherited
             * stock value and the requested value differ, causing:
             *
             *   IllegalArgumentException:
             *   "two different server client ids provided"
             *
             * In the exact 0.9.3/930 method the inherited value is loaded into
             * v0 and our requested client ID is in v5. Replacing v0 with v5
             * immediately after the field read makes the consistency check
             * compare the requested value with itself. This does NOT disable
             * server auth or change the value passed into the final
             * GoogleSignInOptions constructor.
             */
            val googleOptionsMethod =
                mainActivity.methods.firstOrNull {
                    it.name == "getGoogleSignInOptions" &&
                        it.parameterTypes.isEmpty() &&
                        it.returnType ==
                            "Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;"
                }
                    ?: error(
                        "Unable to find DeFit 0.9.3 " +
                            "getGoogleSignInOptions()"
                    )

            val inheritedClientIdIndex =
                googleOptionsMethod.implementation
                    ?.instructions
                    ?.withIndex()
                    ?.firstOrNull { (_, instruction) ->
                        val reference =
                            (instruction as? ReferenceInstruction)
                                ?.reference
                                ?.toString()

                        reference ==
                            "Lcom/google/android/gms/auth/api/signin/" +
                            "GoogleSignInOptions;->E:Ljava/lang/String;"
                    }
                    ?.index
                    ?: error(
                        "Unable to find inherited GoogleSignInOptions " +
                            "server client ID check"
                    )

            googleOptionsMethod.addInstructions(
                inheritedClientIdIndex + 1,
                """
                move-object v0, v5
                """.trimIndent()
            )

            /*
             * The same web_service_client_id resource is read a SECOND time
             * later in getGoogleSignInOptions(). The resource ID is loaded
             * only once and reused, so the generic resource scanner above
             * only sees/overrides the first getString() result.
             *
             * Exact 0.9.3 flow:
             *
             *   first getString()  -> v5  (our saved client ID)
             *   ...
             *   second getString() -> v0  (stock client ID)
             *   assert(v5 == v0)   -> crash
             *
             * Force the second result to the already-resolved v5. The same
             * v0 is later passed to GoogleSignInOptions as serverClientId, so
             * this also ensures the final options object uses the saved ID.
             */
            val getStringInvocations =
                googleOptionsMethod.implementation
                    ?.instructions
                    ?.withIndex()
                    ?.filter { (_, instruction) ->
                        val reference =
                            (instruction as? ReferenceInstruction)
                                ?.reference
                                ?.toString()

                        reference ==
                            "Landroid/content/Context;->getString(I)" +
                            "Ljava/lang/String;"
                    }
                    ?.toList()
                    .orEmpty()

            if (getStringInvocations.size < 2) {
                error(
                    "Unable to find both DeFit 0.9.3 Web client ID " +
                        "getString() calls"
                )
            }

            val secondGetStringIndex =
                getStringInvocations[1].index

            val secondMoveResultIndex =
                googleOptionsMethod.implementation
                    ?.instructions
                    ?.withIndex()
                    ?.drop(secondGetStringIndex + 1)
                    ?.firstOrNull { (_, instruction) ->
                        instruction.opcode ==
                            Opcode.MOVE_RESULT_OBJECT
                    }
                    ?.index
                    ?: error(
                        "Unable to find the second Web client ID " +
                            "move-result-object"
                    )

            googleOptionsMethod.addInstructions(
                secondMoveResultIndex + 1,
                """
                move-object v0, v5
                """.trimIndent()
            )

            // Toggle the inline credential editor.
            mainActivity.methods.add(
                ImmutableMethod(
                    mainActivity.type,
                    "patch_editOAuthCredentials",
                    listOf(
                        ImmutableMethodParameter(
                            "Landroid/view/View;",
                            null,
                            null,
                        )
                    ),
                    "V",
                    AccessFlags.PUBLIC.value or
                        AccessFlags.FINAL.value,
                    null,
                    null,
                    MutableMethodImplementation(14),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                        invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                        move-result-object v0
                        invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
                        move-result-object v1

                        const-string v2, "oauthCredentialsPanel"
                        const-string v3, "id"
                        invoke-virtual {v0, v2, v3, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                        move-result v2
                        invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                        move-result-object v2

                        invoke-virtual {v2}, Landroid/view/View;->getVisibility()I
                        move-result v4
                        if-nez v4, :patch_oauth_editor_show

                        const/16 v4, 0x8
                        invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V
                        return-void

                        :patch_oauth_editor_show
                        const/4 v4, 0x0
                        invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

                        const-string v2, "defit_patch_oauth"
                        invoke-virtual {p0, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
                        move-result-object v2

                        const-string v5, "webClientIdInput"
                        invoke-virtual {v0, v5, v3, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                        move-result v5
                        invoke-virtual {p0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                        move-result-object v5
                        check-cast v5, Landroid/widget/EditText;

                        const-string v6, "web_client_id"
                        const-string v7, ""
                        invoke-interface {v2, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v6
                        invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

                        const-string v5, "webClientSecretInput"
                        invoke-virtual {v0, v5, v3, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                        move-result v5
                        invoke-virtual {p0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                        move-result-object v5
                        check-cast v5, Landroid/widget/EditText;

                        const-string v6, "web_client_secret"
                        invoke-interface {v2, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v6
                        invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

                        return-void
                        """.trimIndent()
                    )
                }
            )

            // Save the credentials. A process restart is enough; no repatch.
            mainActivity.methods.add(
                ImmutableMethod(
                    mainActivity.type,
                    "patch_saveOAuthCredentials",
                    listOf(
                        ImmutableMethodParameter(
                            "Landroid/view/View;",
                            null,
                            null,
                        )
                    ),
                    "V",
                    AccessFlags.PUBLIC.value or
                        AccessFlags.FINAL.value,
                    null,
                    null,
                    MutableMethodImplementation(16),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                        invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                        move-result-object v0
                        invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
                        move-result-object v1

                        const-string v2, "id"

                        const-string v3, "webClientIdInput"
                        invoke-virtual {v0, v3, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                        move-result v3
                        invoke-virtual {p0, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                        move-result-object v3
                        check-cast v3, Landroid/widget/EditText;
                        invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;
                        move-result-object v3
                        invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;
                        move-result-object v3
                        invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;
                        move-result-object v3

                        const-string v4, "webClientSecretInput"
                        invoke-virtual {v0, v4, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                        move-result v4
                        invoke-virtual {p0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                        move-result-object v4
                        check-cast v4, Landroid/widget/EditText;
                        invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;
                        move-result-object v4
                        invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;
                        move-result-object v4
                        invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
                        move-result-object v4

                        invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z
                        move-result v5
                        if-nez v5, :patch_oauth_missing
                        invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z
                        move-result v5
                        if-nez v5, :patch_oauth_missing

                        const-string v5, "defit_patch_oauth"
                        const/4 v6, 0x0
                        invoke-virtual {p0, v5, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
                        move-result-object v5
                        invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
                        move-result-object v5

                        const-string v7, "web_client_id"
                        invoke-interface {v5, v7, v3}, Landroid/content/SharedPreferences${'$'}Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
                        move-result-object v5
                        const-string v7, "web_client_secret"
                        invoke-interface {v5, v7, v4}, Landroid/content/SharedPreferences${'$'}Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
                        move-result-object v5
                        invoke-interface {v5}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V

                        const-string v3, "oauthCredentialsPanel"
                        invoke-virtual {v0, v3, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                        move-result v0
                        invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                        move-result-object v0
                        const/16 v1, 0x8
                        invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

                        const-string v0, "OAuth credentials saved. Fully close and reopen DeFit++ before signing in."
                        const/4 v1, 0x1
                        invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
                        move-result-object v0
                        invoke-virtual {v0}, Landroid/widget/Toast;->show()V
                        return-void

                        :patch_oauth_missing
                        const-string v0, "Enter both the Web client ID and client secret."
                        const/4 v1, 0x1
                        invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
                        move-result-object v0
                        invoke-virtual {v0}, Landroid/widget/Toast;->show()V
                        return-void
                        """.trimIndent()
                    )
                }
            )
        }

        // android:onClick target for the tutorial button.
        //
        // The HTML/images are copied into assets/defit_login_tutorial by the
        // resource half of this patch. We select the page at patch time so the
        // installed app never needs JavaScript just to determine its version.
        val tutorialAsset = if (
            mainActivity.methods.any {
                it.name == "updateUI" &&
                    it.parameterTypes.isEmpty() &&
                    it.returnType == "V"
            }
        ) {
            "file:///android_asset/defit_login_tutorial/0.9.3.html"
        } else {
            "file:///android_asset/defit_login_tutorial/0.8.2a.html"
        }

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
                    new-instance v0, Landroid/webkit/WebView;
                    invoke-direct {v0, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

                    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;
                    move-result-object v1

                    const/4 v2, 0x1
                    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V
                    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V
                    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

                    const/4 v2, 0x0
                    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V
                    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

                    const-string v1, "$tutorialAsset"
                    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

                    new-instance v1, Landroid/app/AlertDialog${'$'}Builder;
                    invoke-direct {v1, p0}, Landroid/app/AlertDialog${'$'}Builder;-><init>(Landroid/content/Context;)V

                    const-string v2, "Login Fix Tutorial"
                    invoke-virtual {v1, v2}, Landroid/app/AlertDialog${'$'}Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog${'$'}Builder;

                    invoke-virtual {v1, v0}, Landroid/app/AlertDialog${'$'}Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog${'$'}Builder;

                    const-string v0, "Close"
                    const/4 v2, 0x0
                    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog${'$'}Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface${'$'}OnClickListener;)Landroid/app/AlertDialog${'$'}Builder;

                    invoke-virtual {v1}, Landroid/app/AlertDialog${'$'}Builder;->show()Landroid/app/AlertDialog;

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

@Suppress("unused")
val loginFixTutorialPatch = resourcePatch(
    name = "Login Fix Tutorial",
    description = "Adds an in-app Google Fit login setup guide and a button to copy the installed APK's signing SHA-1.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DEFIT)
    dependsOn(loginFixTutorialBytecodePatch)

    execute {
        // Bundle the local tutorial into the target APK. Keep source files in:
        //
        // patches/src/main/resources/defit/login_tutorial/
        //
        // The HTML references images relatively, so the directory structure is
        // copied unchanged under assets/defit_login_tutorial/.
        LOGIN_TUTORIAL_ASSETS.forEach { asset ->
            val sourcePath = "/defit/login_tutorial/$asset"
            val source = LoginTutorialAssetMarker::class.java
                .getResourceAsStream(sourcePath)
                ?: error("Missing bundled login tutorial asset: $sourcePath")

            val target = get(
                "assets/defit_login_tutorial/$asset",
                copy = false,
            )

            target.parentFile?.mkdirs()

            source.use { input ->
                target.outputStream().use(input::copyTo)
            }
        }

        document("res/layout/activity_main.xml").use { document ->
            val nodes = document.getElementsByTagName("*")

            var loginButton: Element? = null
            var syncSwitch: Element? = null
            var rootScroll: Element? = null

            for (i in 0 until nodes.length) {
                val element = nodes.item(i) as? Element ?: continue

                when (element.getAttribute("android:id")) {
                    "@+id/logButton", "@id/logButton" -> loginButton = element
                    "@+id/syncSwitch", "@id/syncSwitch" -> syncSwitch = element
                    "@+id/scroll", "@id/scroll" -> rootScroll = element
                }
            }

            val login = loginButton
                ?: error("Unable to find DeFit's logButton")
            val sync = syncSwitch
                ?: error("Unable to find DeFit's syncSwitch")
            val parent = login.parentNode

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

                // Copy only placement/margin attributes from logButton. Do not
                // inherit its enabled state: stock logButton starts disabled.
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
                        button.setAttribute(
                            attr,
                            login.getAttribute(attr)
                        )
                    }
                }

                if (
                    !button.hasAttribute(
                        "app:layout_constraintStart_toStartOf"
                    ) &&
                    !button.hasAttribute(
                        "app:layout_constraintStart_toEndOf"
                    ) &&
                    !button.hasAttribute(
                        "app:layout_constraintLeft_toLeftOf"
                    ) &&
                    !button.hasAttribute(
                        "app:layout_constraintLeft_toRightOf"
                    )
                ) {
                    button.setAttribute(
                        "app:layout_constraintStart_toStartOf",
                        "parent"
                    )
                }

                if (
                    !button.hasAttribute(
                        "app:layout_constraintEnd_toStartOf"
                    ) &&
                    !button.hasAttribute(
                        "app:layout_constraintEnd_toEndOf"
                    ) &&
                    !button.hasAttribute(
                        "app:layout_constraintRight_toLeftOf"
                    ) &&
                    !button.hasAttribute(
                        "app:layout_constraintRight_toRightOf"
                    )
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

            val is093Layout = sync.parentNode != parent

            val oauthButton = if (is093Layout) {
                freshButton(
                    id = "oauthCredentialsButton",
                    text = "Edit OAuth credentials",
                    onClick = "patch_editOAuthCredentials",
                )
            } else {
                null
            }

            val oauthPanel = if (is093Layout) {
                val panel = document.createElement("LinearLayout")
                panel.setAttribute(
                    "android:id",
                    "@+id/oauthCredentialsPanel"
                )
                panel.setAttribute("android:layout_width", "0dp")
                panel.setAttribute(
                    "android:layout_height",
                    "wrap_content"
                )
                panel.setAttribute(
                    "android:orientation",
                    "vertical"
                )
                panel.setAttribute(
                    "android:visibility",
                    "gone"
                )
                panel.setAttribute(
                    "app:layout_constraintStart_toStartOf",
                    "parent"
                )
                panel.setAttribute(
                    "app:layout_constraintEnd_toEndOf",
                    "parent"
                )

                fun oauthInput(
                    id: String,
                    hint: String,
                    inputType: String,
                ): Element {
                    val input = document.createElement("EditText")
                    input.setAttribute(
                        "android:id",
                        "@+id/$id"
                    )
                    input.setAttribute(
                        "android:layout_width",
                        "match_parent"
                    )
                    input.setAttribute(
                        "android:layout_height",
                        "wrap_content"
                    )
                    input.setAttribute("android:hint", hint)
                    input.setAttribute(
                        "android:inputType",
                        inputType
                    )
                    input.setAttribute(
                        "android:singleLine",
                        "true"
                    )
                    return input
                }

                panel.appendChild(
                    oauthInput(
                        "webClientIdInput",
                        "Web OAuth client ID",
                        "textNoSuggestions",
                    )
                )
                panel.appendChild(
                    oauthInput(
                        "webClientSecretInput",
                        "Web OAuth client secret",
                        "textPassword",
                    )
                )

                val save = document.createElement("Button")
                save.setAttribute(
                    "android:id",
                    "@+id/saveOAuthCredentialsButton"
                )
                save.setAttribute(
                    "android:layout_width",
                    "match_parent"
                )
                save.setAttribute(
                    "android:layout_height",
                    "wrap_content"
                )
                save.setAttribute(
                    "android:text",
                    "Save OAuth credentials"
                )
                save.setAttribute(
                    "android:textAllCaps",
                    "false"
                )
                save.setAttribute(
                    "android:onClick",
                    "patch_saveOAuthCredentials"
                )
                panel.appendChild(save)
                panel
            } else {
                null
            }

            tutorialButton.setAttribute(
                "app:layout_constraintTop_toBottomOf",
                "@id/logButton"
            )

            copyButton.setAttribute(
                "app:layout_constraintTop_toBottomOf",
                "@id/loginFixTutorialButton"
            )

            parent.appendChild(tutorialButton)
            parent.appendChild(copyButton)

            if (is093Layout) {
                oauthButton!!.setAttribute(
                    "app:layout_constraintTop_toBottomOf",
                    "@id/copySigningSha1Button"
                )
                oauthPanel!!.setAttribute(
                    "app:layout_constraintTop_toBottomOf",
                    "@id/oauthCredentialsButton"
                )
                parent.appendChild(oauthButton)
                parent.appendChild(oauthPanel)
            }

            if (!is093Layout) {
                // 0.8.2a: login and Sync fitness data are in the same
                // ConstraintLayout. Put sync below the new buttons.
                listOf(
                    "app:layout_constraintTop_toTopOf",
                    "app:layout_constraintTop_toBottomOf",
                    "android:layout_below",
                ).forEach(sync::removeAttribute)

                sync.setAttribute(
                    "app:layout_constraintTop_toBottomOf",
                    "@id/copySigningSha1Button"
                )
            } else {
                // 0.9.3: the entire behavior/sync section moved into a
                // root-level ScrollView directly below logButton.
                val scroll = rootScroll
                    ?: error(
                        "Unable to find DeFit 0.9.3's root ScrollView"
                    )

                if (scroll.parentNode != parent) {
                    error(
                        "Unsupported DeFit activity_main layout: " +
                            "logButton and root ScrollView have " +
                            "different parents"
                    )
                }

                listOf(
                    "app:layout_constraintTop_toTopOf",
                    "app:layout_constraintTop_toBottomOf",
                    "android:layout_below",
                ).forEach(scroll::removeAttribute)

                scroll.setAttribute(
                    "app:layout_constraintTop_toBottomOf",
                    "@id/oauthCredentialsPanel"
                )
            }
        }
    }
}
