package app.matthew.chrome.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.w3c.dom.Element

private const val MICROG = "Lapp/matthew/chrome/extension/MicroGSupport;"
private const val MICROG_PACKAGE = "app.revanced.android.gms"

private val microGResources = resourcePatch {
    execute {
        requireTarget(packageMetadata)
        document("AndroidManifest.xml").use { doc ->
            val root = doc.documentElement
            val application = doc.getElementsByTagName("application").item(0)
            for ((name, value) in mapOf(
                "$MICROG_PACKAGE.SPOOFED_PACKAGE_NAME" to ORIGINAL_PACKAGE,
                "$MICROG_PACKAGE.SPOOFED_PACKAGE_SIGNATURE" to "38918a453d07199354f8b19af05ec6562ced5788",
                "app.revanced.MICROG_PACKAGE_NAME" to MICROG_PACKAGE,
            )) {
                val entry = doc.createElement("meta-data")
                entry.setAttribute("android:name", name)
                entry.setAttribute("android:value", value)
                application.appendChild(entry)
            }
            val queries = doc.getElementsByTagName("queries").item(0) ?: doc.createElement("queries").also { root.appendChild(it) }
            val provider = doc.createElement("package")
            provider.setAttribute("android:name", MICROG_PACKAGE)
            queries.appendChild(provider)
            check((0 until doc.getElementsByTagName("uses-permission").length).any {
                (doc.getElementsByTagName("uses-permission").item(it) as Element)
                    .getAttribute("android:name") == "android.permission.GET_ACCOUNTS"
            }) { "Chrome account permission declaration changed" }
        }
    }
}

val microGSignInPatch = bytecodePatch(
    name = "MicroG sign-in",
    description = "Routes Chrome account sign-in through Morphe MicroG. Requires separate account setup in Morphe settings.",
    default = false,
) {
    compatibleWith(chromeCompatibility)
    dependsOn(settingsPatch, microGResources)
    execute {
        requireTarget(packageMetadata)
        fun replace(type: String, name: String, body: String) {
            val cls = mutableClassDefBy(type)
            val old = cls.methods.single { it.name == name }
            val replacement = MutableMethod(ImmutableMethod(old.definingClass, old.name, old.parameters,
                old.returnType, old.accessFlags, old.annotations, old.hiddenApiRestrictions,
                ImmutableMethodImplementation(8, emptyList(), emptyList(), emptyList())))
            replacement.addInstructions(0, body.trimIndent())
            cls.methods.remove(old)
            cls.methods.add(replacement)
        }
        val auth = classDefBy("Lmkb;")
        check(auth.methods.single { it.name == "d" }.hasString("^^_account_id_^^"))
        check(auth.methods.single { it.name == "f" }.hasString("get_accounts"))
        check(auth.methods.single { it.name == "b" }.parameterTypes ==
            listOf("Landroid/content/Context;", "Landroid/content/ComponentName;", "Llkb;"))
        check(classDefBy("Llkb;").methods.single().toString() == "Llkb;->a(Landroid/os/IBinder;)Ljava/lang/Object;")
        replace("Lmkb;", "e", """
            invoke-static {p0}, $MICROG->accounts(Landroid/content/Context;)[Landroid/accounts/Account;
            move-result-object v0
            return-object v0
        """)
        replace("Lmkb;", "c", """
            invoke-static {p0}, $MICROG->ensureAvailable(Landroid/content/Context;)V
            return-void
        """)
        replace("Lmkb;", "b", """
            invoke-static {p0, p2}, $MICROG->withAuth(Landroid/content/Context;Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """)
        replace(BRIDGE, "microGAuthRequest", """
            check-cast p0, Llkb;
            invoke-interface {p0, p1}, Llkb;->a(Landroid/os/IBinder;)Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """)
        check(classDefBy("Lzc;").fields.any { it.name == "a" && it.type == "Lyc;" })
        check(classDefBy("Lxc;").methods.single { it.name == "<init>" }.parameterTypes ==
            listOf("Lyc;", "Ljava/lang/Runnable;", "B"))
        replace(BRIDGE, "refreshMicroGAccounts", """
            sget-object v0, Lzc;->a:Lyc;
            new-instance v1, Lxc;
            const/4 v2, 0x0
            const/4 v3, 0x0
            invoke-direct {v1, v0, v2, v3}, Lxc;-><init>(Lyc;Ljava/lang/Runnable;B)V
            sget-object v0, Lu91;->f:Lzvn;
            invoke-virtual {v1, v0}, Lu91;->c(La2f;)Lu91;
            return-void
        """)
        replace(MICROG, "isPatched", "const/4 v0, 0x1\nreturn v0")

        // Trusted Vault owns the real encryption-key recovery UI. Route only this
        // client to MicroG; retain Chrome's protocol, status handling and key checks.
        val vault = mutableClassDefBy("Lv1e;")
        val baseClient = "Lcom/google/android/gms/common/internal/a;"
        check(vault.superclass == baseClient)
        check(vault.methods.single { it.name == "h" }.hasString("chromesync"))
        check(vault.methods.single { it.name == "o" }.hasString("com.google.android.gms.auth.key.retrieval.service.START"))
        check(classDefBy(baseClient).methods.single { it.name == "p" }.hasString("com.google.android.gms"))
        check(vault.methods.none { it.name == "p" })
        val packageOverride = MutableMethod(ImmutableMethod(vault.type, "p", emptyList(), "Ljava/lang/String;",
            0x1, emptySet(), emptySet(), ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList())))
        packageOverride.addInstructions(0, "const-string v0, \"$MICROG_PACKAGE\"\nreturn-object v0")
        vault.methods.add(packageOverride)
        replace(vault.type, "o", "const-string v0, \"$MICROG_PACKAGE.auth.key.retrieval.service.START\"\nreturn-object v0")
        // Dynamic service lookup queries Google's Chimera provider; MicroG exports
        // this service directly under the package selected above.
        replace(vault.type, "q", "const/4 v0, 0x0\nreturn v0")

        val capabilities = mutableClassDefBy("Ldgb;").methods.single { it.name == "d" }
        check(capabilities.parameterTypes == listOf("Landroid/accounts/Account;", "Ljava/lang/String;") && capabilities.returnType == "I")
        check(capabilities.hasString("Signin.AccountCapabilities.GetFromSystemLibraryResult"))
        capabilities.addInstructions(0, """
            sget-object v0, Lzb6;->a:Landroid/content/Context;
            invoke-static {v0}, $MICROG->isSupported(Landroid/content/Context;)Z
            move-result v0
            if-nez v0, :supported_provider
            const/4 v0, 0x0
            return v0
            :supported_provider
            invoke-static/range {p1 .. p1}, $MICROG->providerAccount(Landroid/accounts/Account;)Landroid/accounts/Account;
            move-result-object p1
        """.trimIndent())

        // MicroG 7.1.1's password-manager UI is a web launcher. Make that limitation
        // visible rather than silently calling the unavailable stock native service.
        val passwords = "Lp9j;"
        val launchPasswords = classDefBy(passwords).methods.single { it.name == "j" }
        check(launchPasswords.parameterTypes == listOf(
            "Landroid/content/Context;", "I", "Lssg;", "Ljava/lang/String;", "Lk2o;"))
        check(launchPasswords.hasString("PasswordManager.ManagePasswordsReferrer"))
        replace(passwords, "j", """
            invoke-static {p1}, $MICROG->showPasswordManager(Landroid/content/Context;)V
            return-void
        """)

        // MicroG implements the legacy account/token protocol, not Google's newer AANG API.
        check(classDefBy("Lyro;").methods.single { it.name == "<clinit>" }.hasString("MigrateAccountManagerDelegate"))
        check(classDefBy("Luba;").fields.any { it.name == "b" && it.type == "Ljava/lang/String;" })
        mutableClassDefBy("Lxq3;").methods.single { it.name == "b" }.addInstructions(0, """
            iget-object v0, p0, Luba;->b:Ljava/lang/String;
            const-string v1, "MigrateAccountManagerDelegate"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :original
            const/4 v0, 0x0
            return v0
            :original
            nop
        """.trimIndent())

        val add = mutableClassDefBy("Lyc;").methods.single { it.name == "f" && it.hasString("Signin_AddAccountToDevice") }
        val accountType = add.implementation!!.instructions.withIndex().single {
            ((it.value as? ReferenceInstruction)?.reference as? StringReference)?.string == "com.google"
        }
        add.replaceInstruction(accountType.index, "const-string v${(accountType.value as OneRegisterInstruction).registerA}, \"app.revanced\"")

        val observer = mutableClassDefBy("Ldgb;").methods.single { it.name == "a" && it.hasString("android.accounts.LOGIN_ACCOUNTS_CHANGED") }
        val packageFilter = observer.implementation!!.instructions.withIndex().single {
            ((it.value as? ReferenceInstruction)?.reference as? StringReference)?.string == "com.google.android.gms"
        }
        observer.replaceInstruction(packageFilter.index,
            "const-string v${(packageFilter.value as OneRegisterInstruction).registerA}, \"$MICROG_PACKAGE\"")

        // Account repair goes to the same authenticator as Add account, without changing
        // Chromium's internal Account objects or any unrelated Android account operations.
        val repair = mutableClassDefBy("Llc;").methods.single { it.name == "onResult" }
        val calls = repair.implementation!!.instructions.withIndex().filter {
            val ref = (it.value as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Landroid/accounts/AccountManager;" && ref.name in setOf("confirmCredentials", "updateCredentials")
        }.toList()
        check(calls.size == 2)
        for ((index, ins) in calls.reversed()) {
            check(ins.opcode == Opcode.INVOKE_VIRTUAL_RANGE)
            val account = (ins as RegisterRangeInstruction).startRegister + 1
            repair.addInstructions(index, """
                invoke-static/range {v$account .. v$account}, $MICROG->providerAccount(Landroid/accounts/Account;)Landroid/accounts/Account;
                move-result-object v$account
            """.trimIndent())
        }
        println("MicroG: account provider, native token transport, real Gaia IDs and authenticator routing prepared.")
    }
}
