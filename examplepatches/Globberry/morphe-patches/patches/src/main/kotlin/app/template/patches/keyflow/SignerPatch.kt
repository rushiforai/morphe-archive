package app.template.patches.keyflow

import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.addFreeRegisters
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef

private const val CERT_SHA256 = "FEAB54C4AD8175C6191E852DE4887638C7B3E7121D7DAB1C369BA0D426FE5F02"
private const val NATIVE_KEK = "56E164D0280D23B7DFC33E920548CB3D3113185D3A0B6C6761DEF99E927846C1"

private const val CERT_BASE64 =
    "MIIDczCCAlugAwIBAgIIO0ztybmwZ7IwDQYJKoZIhvcNAQEMBQAwZzELMAkGA1UEBhMCSUQxEDAOBgNVBAgTB1Vua25vd24xEDAOBgNVBAcTB1Vua25vd24xEDAOBgNVBAoTB0tleWZsb3cxEDAOBgNVBAsTB0tleWZsb3cxEDAOBgNVBAMTB0tleWZsb3cwIBcNMjYwODAyMDYyMTQ4WhgPMjA1MzEyMTgwNjIxNDhaMGcxCzAJBgNVBAYTAklEMRAwDgYDVQQIEwdVbmtub3duMRAwDgYDVQQHEwdVbmtub3duMRAwDgYDVQQKEwdLZXlmbG93MRAwDgYDVQQLEwdLZXlmbG93MRAwDgYDVQQDEwdLZXlmbG93MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqcNL4DjaenzRBAzUA/LttRA7TUq6pJ4K20aBhwJG1u1ChzeDgc5xW5mm71wH+DEGbJ6iN5mno+jJw2UWSzE4Z7cchiRc79kLRndtu/NvxL1/JNjVTUng1+vtk79RwG/uOQ4Yt6wpTili0F9YTPVvdQALQNMKl9ySSHUzwz4oDrXZmuacoj386Vhp+1nx4NxW/Vso2I1bwWTDaFJ0Pn05+PlgIs4H1i9Fg59JnyztL5m8hyNLn9E8iV7ieGKPL2Gj8iwUW8Ces12MBsbo5TKIpeykBlvRJUuKvCW4yErF7XeP8gFRHtZXJ93vS6D1gCa/kFmjfFic60KhHS8x0afXwwIDAQABoyEwHzAdBgNVHQ4EFgQUFY+b2FXXvhJHdpSE/R0PBVp2scEwDQYJKoZIhvcNAQEMBQADggEBAECWizRUzgj0s1UCMc1PPGw4vdBNfTOaeP7kpv3scX/w0/95zl7V7KzfociQAmi2G+UUf4Nyz7H+aCNihjWPslP3rSMkqpdnPWBOM70XUaZgcoAycnf6VvqIsAV5cd1XqmhRPrk0mvKK4am/Lzz2ZtA35Wuaa7u8w6R6fG1DX2aFuD4rZ9S0M3/gHSkM8Pf6aw8NAPn6Rzk8T5lpr0g7uhPryHe3+PgazrDD+FjhPxO65x/CCCxukSyZeFHgsXUpiOPY31X612A32BtvID/Vd9SkOkGRFnLu23WyOIO0fkI8PsOAr8ZJfS0ud0+3aJ1/fhzrt6kvcg+WsLjHeIswkQQ="

@Suppress("unused")
val signerPatch = patch(
    name = "Signer Identity",
    description = "Forces the app's signer identity to match the original publisher certificate.",
    default = true
) {
    compatibleWith(COMPATIBILITY)

    execute {
        // --- NativeIdentity: com.angkin.keyflow.nativeverify.NativeIdentity ---
        // Methods renamed in 1.5.10:
        //   xo0eU(Context) -> NMGZ06(Context)
        //   KEsFip5xs(Context) -> c3oEd(Context)
        //   pX6SrQYLl() -> GX9XN3ZIZ()
        classDefForEach { classDef: ClassDef ->
            if (classDef.type == "Lcom/angkin/keyflow/nativeverify/NativeIdentity;") {
                val mutable = mutableClassDefBy(classDef)

                // NMGZ06(Context) -> return original cert SHA-256
                val (nmgz06Cloned, nmgz06Added) = mutable.methods.first { m ->
                    m.name == "NMGZ06" &&
                        m.parameters.size == 1 &&
                        m.parameters[0].type == "Landroid/content/Context;" &&
                        m.returnType == "Ljava/lang/String;" &&
                        (m.accessFlags and AccessFlags.STATIC.value) == 0
                }.addFreeRegisters(1)
                nmgz06Cloned.addInstructions(nmgz06Added, buildCertSmali(CERT_SHA256))

                // c3oEd(Context) -> return native KEK
                val (c3oedCloned, c3oedAdded) = mutable.methods.first { m ->
                    m.name == "c3oEd" &&
                        m.parameters.size == 1 &&
                        m.parameters[0].type == "Landroid/content/Context;" &&
                        m.returnType == "Ljava/lang/String;" &&
                        (m.accessFlags and AccessFlags.STATIC.value) == 0
                }.addFreeRegisters(1)
                c3oedCloned.addInstructions(c3oedAdded, buildCertSmali(NATIVE_KEK))

                // GX9XN3ZIZ() -> return true
                mutable.methods.first { m ->
                    m.name == "GX9XN3ZIZ" &&
                        m.parameters.isEmpty() &&
                        m.returnType == "Z" &&
                        (m.accessFlags and AccessFlags.STATIC.value) == 0
                }.returnEarly(true)

                // Force the c3oEd static boolean field to true (checked directly by mMDNzWiQL)
                val (clinitCloned, clinitAdded) = mutable.methods.first { m ->
                    m.name == "<clinit>" && m.parameters.isEmpty() && m.returnType == "V" && (m.accessFlags and AccessFlags.STATIC.value) != 0
                }.addFreeRegisters(1)
                clinitCloned.addInstructions(clinitAdded, """
                    const/4 v0, 0x1
                    sput-boolean v0, Lcom/angkin/keyflow/nativeverify/NativeIdentity;->c3oEd:Z
                """)
            }
        }

        // --- jO2pqaX -> LUuxmVJjT: pX6SrQYLl(PackageInfo) -> GX9XN3ZIZ(PackageInfo) ---
        classDefForEach { classDef: ClassDef ->
            if (classDef.type == "LuuxmVJjT;") {
                val mutable = mutableClassDefBy(classDef)

                // GX9XN3ZIZ(PackageInfo) -> return original cert as singleton list
                val (cloned, added) = mutable.methods.first { m ->
                    m.name == "GX9XN3ZIZ" &&
                        m.parameters.size == 1 &&
                        m.parameters[0].type == "Landroid/content/pm/PackageInfo;" &&
                        m.returnType == "Ljava/util/List;" &&
                        (m.accessFlags and AccessFlags.STATIC.value) != 0
                }.addFreeRegisters(2)

                val chunks = CERT_BASE64.chunked(100)
                cloned.addInstructions(added, buildCertListSmali(chunks))
            }
        }
    }
}

private fun buildCertSmali(hex: String): String {
    return buildString {
        appendLine("    const-string v0, \"$hex\"")
        appendLine("    return-object v0")
    }
}

private fun buildCertListSmali(chunks: List<String>): String {
    return buildString {
        appendLine("    const-string v0, \"${chunks[0]}\"")
        appendLine("    new-instance v1, Ljava/lang/StringBuilder;")
        appendLine("    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V")
        appendLine("    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;")
        appendLine("    move-result-object v1")
        for (i in 1 until chunks.size) {
            appendLine("    const-string v0, \"${chunks[i]}\"")
            appendLine("    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;")
            appendLine("    move-result-object v1")
        }
        appendLine("    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;")
        appendLine("    move-result-object v0")
        appendLine("    const/4 v1, 0x0")
        appendLine("    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B")
        appendLine("    move-result-object v0")
        appendLine("    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;")
        appendLine("    move-result-object v0")
        appendLine("    return-object v0")
    }
}

private fun StringBuilder.appendLine(line: String) {
    append(line)
    append("\n")
}
