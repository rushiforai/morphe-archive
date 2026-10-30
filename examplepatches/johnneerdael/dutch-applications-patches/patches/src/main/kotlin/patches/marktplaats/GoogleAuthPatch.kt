package patches.marktplaats

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private const val provider = "Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;"
private const val factory = "Lrt3;"
private const val action = "com.google.android.gms.identitycredentials.service.START"
private const val microg = "app.revanced.android.gms"
private const val available = "morpheMicrogAvailable(Landroid/content/Context;)Z"
private const val choose = "morpheGoogleProvider(${factory}Ljava/lang/Object;)Lit3;"

private fun helper(name: String, parameters: List<String>, result: String, code: String, locals: Int = 4) =
    MutableMethod(ImmutableMethod(provider, name,
        parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, result, 9, emptySet(), emptySet(),
        ImmutableMethodImplementation(locals + parameters.size, emptyList(), emptyList(), emptyList()),
    )).apply { addInstructions(0, code.trimIndent()) }

internal val googleAuthResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val ns = "http://schemas.android.com/apk/res/android"
            val app = doc.getElementsByTagName("application").item(0) as Element
            // Same metadata convention as Morphe's shared GmsCore support. The
            // SHA1 is the original publisher certificate, not the source stamp.
            val values = mapOf(
                "$microg.SPOOFED_PACKAGE_NAME" to "nl.marktplaats.android",
                "$microg.SPOOFED_PACKAGE_SIGNATURE" to "e650094b1bcb91997173c1261fd0136ab7592984",
                "app.revanced.MICROG_PACKAGE_NAME" to microg,
            )
            val metadata = doc.getElementsByTagName("meta-data")
            check((0 until metadata.length).none {
                (metadata.item(it) as Element).getAttributeNS(ns, "name") in values
            }) { "Marktplaats microG metadata already exists" }
            values.forEach { (name, value) ->
                app.appendChild(doc.createElement("meta-data").apply {
                    setAttributeNS(ns, "android:name", name)
                    setAttributeNS(ns, "android:value", value)
                })
            }
            val queries = doc.getElementsByTagName("queries")
            check(queries.length == 1) { "Marktplaats package queries changed" }
            val packages = (queries.item(0) as Element).getElementsByTagName("package")
            check((0 until packages.length).none {
                (packages.item(it) as Element).getAttributeNS(ns, "name") == microg
            }) { "Marktplaats microG query already exists" }
            queries.item(0).appendChild(doc.createElement("package").apply {
                setAttributeNS(ns, "android:name", microg)
            })
        }
    }
}

@Suppress("unused")
val googleSignIn = bytecodePatch(
    name = "Google sign-in via microG-Re",
    description = "Routes Google sign-in through an installed microG-Re with Credential Manager support. Preserves the original route when that service is unavailable; device sign-in testing is required.",
) {
    dependsOn(originalInput, googleAuthResources)
    compatibleWith(marktplaats)
    execute {
        val availability = exact(provider, "isAvailableOnDevice(I)Z", 17, 4, 20)
        val owner = target(provider, "isAvailableOnDevice(I)Z").classDef
        check(owner.fields.none { it.name == "morpheGoogleMicrog" } &&
            owner.methods.none { it.name.startsWith("morphe") }) { "Marktplaats Google route already exists" }
        owner.fields.add(MutableField(ImmutableField(provider, "morpheGoogleMicrog", "Z", 2,
            null, emptySet(), emptySet())))
        owner.methods.add(helper("morpheGoogleRequest", listOf("Ljava/lang/Object;"), "Z", """
            instance-of v0, p0, Llj6;
            if-eqz v0, :no
            check-cast p0, Llj6;
            iget-object v0, p0, Llj6;->a:Ljava/util/List;
            if-eqz v0, :no
            invoke-interface {v0}, Ljava/util/List;->size()I
            move-result v1
            const/4 v2, 0x1
            if-ne v1, v2, :no
            const/4 v1, 0x0
            invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;
            move-result-object v0
            instance-of v1, v0, Lik6;
            if-nez v1, :yes
            instance-of v0, v0, Lsj6;
            return v0
            :yes
            const/4 v0, 0x1
            return v0
            :no
            const/4 v0, 0x0
            return v0
        """))
        owner.methods.add(helper("morpheMicrogAvailable", listOf("Landroid/content/Context;"), "Z", """
            if-eqz p0, :no
            new-instance v0, Landroid/content/Intent;
            const-string v1, "${action.replace("com.google", "app.revanced")}"
            invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
            const-string v1, "$microg"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
            invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
            move-result-object v1
            const/4 v2, 0x0
            invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->resolveService(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;
            move-result-object v0
            if-eqz v0, :no
            iget-object v0, v0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;
            if-eqz v0, :no
            iget-boolean v1, v0, Landroid/content/pm/ServiceInfo;->enabled:Z
            if-eqz v1, :no
            iget-boolean v1, v0, Landroid/content/pm/ServiceInfo;->exported:Z
            if-eqz v1, :no
            iget-object v0, v0, Landroid/content/pm/ServiceInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;
            if-eqz v0, :no
            iget-boolean v0, v0, Landroid/content/pm/ApplicationInfo;->enabled:Z
            return v0
            :no
            const/4 v0, 0x0
            return v0
        """))
        owner.methods.add(helper("morpheGoogleProvider", listOf(factory, "Ljava/lang/Object;"), "Lit3;", """
            invoke-static {p1}, $provider->morpheGoogleRequest(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :no
            iget-object v0, p0, $factory->a:Landroid/content/Context;
            invoke-static {v0}, $provider->$available
            move-result v1
            if-eqz v1, :no
            new-instance v1, $provider
            invoke-direct {v1, v0}, $provider-><init>(Landroid/content/Context;)V
            const/4 v0, 0x1
            iput-boolean v0, v1, $provider->morpheGoogleMicrog:Z
            return-object v1
            :no
            const/4 v0, 0x0
            return-object v0
        """))
        // microG-Re relocates GoogleID protocol strings as well as its service
        // action. Translate only the selected provider's wire objects; the app's
        // original request and native Google fallback retain their own namespace.
        val nativeGoogleId = "com.google.android.libraries.identity.googleid."
        val microgGoogleId = "app.revanced.android.libraries.identity.googleid."
        val googleType = "TYPE_GOOGLE_ID_TOKEN_CREDENTIAL"
        val bundle = "morpheGoogleBundle(Landroid/os/Bundle;Z)Landroid/os/Bundle;"
        owner.methods.add(helper("morpheGoogleBundle", listOf("Landroid/os/Bundle;", "Z"), "Landroid/os/Bundle;", """
            if-eqz p0, :unchanged
            new-instance v0, Landroid/os/Bundle;
            invoke-direct {v0, p0}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V
            const-string v1, "$nativeGoogleId"
            const-string v2, "$microgGoogleId"
            if-nez p1, :keys
            const-string v1, "$microgGoogleId"
            const-string v2, "$nativeGoogleId"
            :keys
            invoke-virtual {p0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;
            move-result-object v3
            invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;
            move-result-object v3
            :loop
            invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
            move-result v7
            if-eqz v7, :picture
            invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v4
            check-cast v4, Ljava/lang/String;
            invoke-virtual {v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
            move-result v7
            if-eqz v7, :loop
            invoke-virtual {v4, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
            move-result-object v5
            invoke-virtual {p0, v4}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;
            move-result-object v6
            if-eqz v6, :null
            instance-of v7, v6, Landroid/os/Parcelable;
            if-eqz v7, :serializable
            check-cast v6, Landroid/os/Parcelable;
            invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V
            goto :loop
            :serializable
            instance-of v7, v6, Ljava/io/Serializable;
            if-eqz v7, :loop
            check-cast v6, Ljava/io/Serializable;
            invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V
            goto :loop
            :null
            const/4 v6, 0x0
            invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
            goto :loop
            :picture
            if-nez p1, :done
            const-string v1, "${nativeGoogleId}BUNDLE_KEY_PROFILE_PICTURE_URI"
            invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;
            move-result-object v2
            instance-of v3, v2, Ljava/lang/String;
            if-eqz v3, :done
            check-cast v2, Ljava/lang/String;
            invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
            move-result-object v2
            invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V
            :done
            return-object v0
            :unchanged
            return-object p0
        """, locals = 8))
        owner.methods.add(helper("morpheGoogleOption", listOf(provider, "Lft3;"), "Lft3;", """
            iget-boolean v0, p0, $provider->morpheGoogleMicrog:Z
            if-eqz v0, :unchanged
            iget-object v0, p1, Lft3;->a:Ljava/lang/String;
            const-string v1, "$nativeGoogleId$googleType"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :unchanged
            new-instance v0, Lft3;
            const-string v1, "$microgGoogleId$googleType"
            iget-object v2, p1, Lft3;->b:Landroid/os/Bundle;
            const/4 v4, 0x1
            invoke-static {v2, v4}, $provider->$bundle
            move-result-object v2
            iget-object v3, p1, Lft3;->c:Landroid/os/Bundle;
            invoke-static {v3, v4}, $provider->$bundle
            move-result-object v3
            iget-object v4, p1, Lft3;->d:Ljava/lang/String;
            iget-object v5, p1, Lft3;->e:Ljava/lang/String;
            iget-object v6, p1, Lft3;->f:Ljava/lang/String;
            invoke-direct/range {v0 .. v6}, Lft3;-><init>(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
            return-object v0
            :unchanged
            return-object p1
        """, locals = 7))
        owner.methods.add(helper("morpheGoogleLegacyResult", listOf("Landroid/content/Intent;"), "Z", """
            invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;
            move-result-object v0
            if-eqz v0, :no
            const-string v1, "android.service.credentials.extra.GET_CREDENTIAL_RESPONSE"
            invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;
            move-result-object v2
            instance-of v3, v2, Landroid/os/Bundle;
            if-eqz v3, :exception
            check-cast v2, Landroid/os/Bundle;
            const-string v1, "androidx.credentials.provider.extra.EXTRA_CREDENTIAL_TYPE"
            invoke-virtual {v2, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v0
            const-string v3, "$microgGoogleId$googleType"
            invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :yes
            new-instance v0, Landroid/os/Bundle;
            invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V
            move-object v2, v0
            const-string v0, "$nativeGoogleId$googleType"
            invoke-virtual {v2, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
            const-string v1, "androidx.credentials.provider.extra.EXTRA_CREDENTIAL_DATA"
            invoke-virtual {v2, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;
            move-result-object v0
            const/4 v3, 0x0
            invoke-static {v0, v3}, $provider->$bundle
            move-result-object v0
            invoke-virtual {v2, v1, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V
            const-string v1, "android.service.credentials.extra.GET_CREDENTIAL_RESPONSE"
            invoke-virtual {p0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;
            :yes
            const/4 v0, 0x1
            return v0
            :exception
            const-string v1, "android.service.credentials.extra.GET_CREDENTIAL_EXCEPTION"
            invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;
            move-result-object v0
            instance-of v0, v0, Landroid/os/Bundle;
            return v0
            :no
            const/4 v0, 0x0
            return v0
        """))
        exact(provider, "onGetCredential(Landroid/content/Context;Llj6;Landroid/os/CancellationSignal;Ljava/util/concurrent/Executor;Ldt3;)V", 1, 25, 155).addInstructions(84, """
            move-object/from16 v10, p0
            invoke-static {v10, v11}, $provider->morpheGoogleOption(${provider}Lft3;)Lft3;
            move-result-object v11
        """.trimIndent())
        exact("Landroidx/credentials/playservices/controllers/identitycredentials/getcredential/a;", "onReceiveResult(ILandroid/os/Bundle;)V", 17, 10, 155).apply {
            addInstructionsWithLabels(85, """
                invoke-static {p2}, $provider->morpheGoogleLegacyResult(Landroid/content/Intent;)Z
                move-result v4
                if-eqz v4, :framework
                const/16 p1, 0x20
            """.trimIndent(), ExternalLabel("framework", getInstruction(85)))
        }
        exact(factory, "a(${factory}Ljava/lang/Object;)Lit3;", 9, 5, 59).apply {
            addInstructionsWithLabels(0, """
                invoke-static {p0, p1}, $provider->$choose
                move-result-object v0
                if-eqz v0, :native
                return-object v0
            """.trimIndent(), ExternalLabel("native", getInstruction(0)))
        }
        availability.addInstructionsWithLabels(0, """
            iget-boolean v0, p0, $provider->morpheGoogleMicrog:Z
            if-eqz v0, :native
            iget-object v0, p0, $provider->context:Landroid/content/Context;
            invoke-static {v0}, $provider->$available
            move-result v0
            return v0
        """.trimIndent(), ExternalLabel("native", availability.getInstruction(0)))
        exact("Lfdj;", "a(Landroid/content/Context;Lnsk;)Landroid/content/Intent;", 9, 6, 91).apply {
            addInstructionsWithLabels(0, """
                iget-object v0, p1, Lnsk;->a:Ljava/lang/String;
                const-string v1, "$action"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :native
                invoke-static {p0}, $provider->$available
                move-result v0
                if-eqz v0, :native
                new-instance v0, Landroid/content/Intent;
                const-string v1, "${action.replace("com.google", "app.revanced")}"
                invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
                const-string v1, "$microg"
                invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
                move-result-object v0
                return-object v0
            """.trimIndent(), ExternalLabel("native", getInstruction(0)))
        }
    }
}
