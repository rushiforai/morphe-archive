package patches.easypark

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"
private const val MICROG = "app.revanced.android.gms"
private const val SIGN_IN = "com.google.android.gms.auth.api.identity.service.signin.START"
private const val RE_SIGN_IN = "app.revanced.android.gms.auth.api.identity.service.signin.START"
private const val PROVIDER = "Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;"

private val microgResources = resourcePatch {
    dependsOn(nlOriginalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val root = doc.documentElement
            val queries = doc.getElementsByTagName("queries").item(0) as? Element
                ?: doc.createElement("queries").also(root::appendChild)
            val packages = queries.getElementsByTagName("package")
            if ((0 until packages.length).none {
                (packages.item(it) as Element).getAttributeNS(ANDROID, "name") == MICROG
            }) queries.appendChild(doc.createElement("package").apply {
                setAttributeNS(ANDROID, "android:name", MICROG)
            })
            val app = doc.getElementsByTagName("application").item(0) as Element
            for ((name, value) in mapOf(
                "$MICROG.SPOOFED_PACKAGE_NAME" to "com.parkmobile",
                "$MICROG.SPOOFED_PACKAGE_SIGNATURE" to "0865f8607c562bb6b4386cb4f627eadb929efdb1",
                "app.revanced.MICROG_PACKAGE_NAME" to MICROG,
                "$MICROG.MICROG_PACKAGE_NAME" to MICROG,
            )) {
                check((0 until app.getElementsByTagName("meta-data").length).none {
                    (app.getElementsByTagName("meta-data").item(it) as Element)
                        .getAttributeNS(ANDROID, "name") == name
                }) { "EasyPark NL already declares microG identity metadata" }
                app.appendChild(doc.createElement("meta-data").apply {
                    setAttributeNS(ANDROID, "android:name", name)
                    setAttributeNS(ANDROID, "android:value", value)
                })
            }
        }
    }
}

@Suppress("unused")
val microgSupportPatch = bytecodePatch(
    name = "Add microG-RE support",
    description = "Enables Google sign-in to EasyPark NL through installed MicroG-RE, required for the " +
        "third-party Android Auto patch. Phone and email sign-in do not work in the patched app.",
    default = true,
) {
    compatibleWith(easyparkNl)
    dependsOn(nlOriginalInput, microgResources)
    execute {
        // This bridge has only the two native Google-ID callers in the inspected build.
        // Select the included compatibility provider, without altering the device API level.
        val bridge = mutableClassDefBy("Lkuc;").methods.single {
            it.name == "g" && it.returnType == "Ljava/lang/Object;" &&
                it.parameterTypes.map(CharSequence::toString) == listOf(
                    "Lkuc;", "Landroid/content/Context;", "Len7;",
                    "Lkotlin/coroutines/jvm/internal/ContinuationImpl;",
                )
        }
        val sdkRead = bridge.implementation!!.instructions.withIndex().single {
            val field = (it.value as? ReferenceInstruction)?.reference as? FieldReference
            field?.definingClass == "Landroid/os/Build\$VERSION;" && field.name == "SDK_INT"
        }
        bridge.replaceInstruction(sdkRead.index,
            "const/16 v${(sdkRead.value as OneRegisterInstruction).registerA}, 0x21")

        // Use the bundled BeginSignIn compatibility controller. Core 7.3 exposes
        // that standard sign-in ABI; all token/nonce processing remains native.
        val provider = mutableClassDefBy(PROVIDER)
        check(provider.fields.any { it.name == "context" && it.type == "Landroid/content/Context;" })
        val get = provider.methods.single {
            it.name == "onGetCredential" && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == listOf(
                    "Landroid/content/Context;", "Len7;", "Landroid/os/CancellationSignal;",
                    "Ljava/util/concurrent/Executor;", "Lp05;",
                )
        }
        val availabilityCall = get.implementation!!.instructions.withIndex().single {
            val ref = (it.value as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == PROVIDER && ref.name == "isAvailableOnDevice" &&
                ref.parameterTypes.map(CharSequence::toString) == listOf("I")
        }
        val result = get.getInstruction<OneRegisterInstruction>(availabilityCall.index + 1)
        check(result.opcode == Opcode.MOVE_RESULT)
        get.replaceInstruction(availabilityCall.index + 1, "const/16 v${result.registerA}, 0x0")

        val old = provider.methods.single {
            it.name == "isAvailableOnDevice" && it.returnType == "Z" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("I")
        }
        val available = ImmutableMethod(old.definingClass, old.name, old.parameters, old.returnType,
            old.accessFlags, old.annotations, old.hiddenApiRestrictions, MutableMethodImplementation(6)).toMutable()
        val source = """
            :lookup_start
            iget-object v0, p0, $PROVIDER->context:Landroid/content/Context;
            invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
            move-result-object v0
            const-string v1, "$MICROG"
            const/4 v2, 0x0
            invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
            move-result-object v0
            :lookup_end
            iget-object v1, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;
            if-eqz v1, :unavailable
            iget-boolean v1, v1, Landroid/content/pm/ApplicationInfo;->enabled:Z
            if-eqz v1, :unavailable
            iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I
            if-lt v0, p1, :unavailable
            const/4 v0, 0x1
            return v0
            :not_found
            move-exception v0
            :unavailable
            const/4 v0, 0x0
            return v0
        """.trimIndent()
        available.addInstructions(0, source)
        fun index(label: String) = source.lineSequence().takeWhile { it.trim() != label }
            .count { it.isNotBlank() && !it.trim().startsWith(":") }
        available.implementation!!.apply {
            addCatch("Landroid/content/pm/PackageManager\$NameNotFoundException;",
                newLabelForIndex(index(":lookup_start")), newLabelForIndex(index(":lookup_end")),
                newLabelForIndex(index(":not_found")))
        }
        check(provider.methods.remove(old))
        provider.methods.add(available)

        // Route only this sign-in action. Location, app verification, payment and
        // every other Play-services connection retain their original route.
        val intent = mutableClassDefBy("Lgoj;").methods.single {
            it.name == "a" && it.returnType == "Landroid/content/Intent;" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Lcqk;")
        }
        check(AccessFlags.STATIC.isSet(intent.accessFlags) && intent.implementation!!.registerCount >= 4)
        intent.addInstructionsWithLabels(0, """
            move-object/from16 v0, p1
            iget-object v0, v0, Lcqk;->a:Ljava/lang/String;
            const-string v1, "$SIGN_IN"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :original_gms
            new-instance v0, Landroid/content/Intent;
            const-string v1, "$RE_SIGN_IN"
            invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
            const-string v1, "$MICROG"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
            return-object v0
        """, ExternalLabel("original_gms", intent.getInstruction(0)))

        // The default account in this one sign-in client's service request uses
        // microG-RE's account type. Preserve the Google type for all other clients.
        val base = mutableClassDefBy("Lsd1;")
        val account = base.methods.flatMap { method ->
            method.implementation?.instructions?.withIndex()?.filter {
                ((it.value as? ReferenceInstruction)?.reference as? StringReference)?.string == "com.google"
            }?.map { method to it } ?: emptyList()
        }.single()
        val register = (account.second.value as OneRegisterInstruction).registerA
        check(!AccessFlags.STATIC.isSet(account.first.accessFlags))
        val accountTypeName = "morpheIdentityAccountType"
        check(base.methods.none { it.name == accountTypeName })
        val accountType = ImmutableMethod(base.type, accountTypeName,
            listOf(ImmutableMethodParameter(base.type, emptySet(), null)), "Ljava/lang/String;",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
            MutableMethodImplementation(3)).toMutable()
        accountType.addInstructions(0, """
            instance-of v0, p0, Limj;
            if-eqz v0, :google_account_type
            const-string v0, "app.revanced"
            return-object v0
            :google_account_type
            const-string v0, "com.google"
            return-object v0
        """)
        base.methods.add(accountType)
        account.first.replaceInstruction(account.second.index,
            "invoke-static/range {p0 .. p0}, Lsd1;->$accountTypeName(Lsd1;)Ljava/lang/String;")
        account.first.addInstructions(account.second.index + 1, "move-result-object v$register")
    }
}
