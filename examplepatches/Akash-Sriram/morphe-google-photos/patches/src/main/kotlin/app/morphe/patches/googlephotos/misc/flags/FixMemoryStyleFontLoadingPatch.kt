package app.morphe.patches.googlephotos.misc.flags

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Patches the Skottie font resolver class in Google Photos DEX to redirect
 * remote/CDN font requests to bundled system fonts.
 *
 * In the mod package (app.morphe.*), Google's font CDN is inaccessible, so
 * memory card animations render blank text without this fix.
 *
 * The patched class has two methods identified by signature:
 *   - fontUriResolver(String, CancellationSignal): Uri  → redirected to system font URIs
 *   - fontDataReader(Uri): byte[]                       → reads bytes from local file path
 *
 * Font mapping:
 *   "serif" requests  →  file:///system/fonts/NotoSerif-Italic.ttf
 *   all others        →  file:///system/fonts/Roboto-Regular.ttf
 *
 * Note: Legacy flag baking (45417849 / 45417850 / 45422890 / 45418195) was removed.
 * Those string literals do not exist anywhere in Google Photos v7.92 DEX — Google
 * removed those old Phenotype call-sites. Story flags are now guaranteed via
 * PhenotypeSeedData (2,496-flag official seed) + PhotoFlagsRegistry overrides.
 */
val fixMemoryStyleFontLoadingPatch = bytecodePatch(
    name = "Fix memory style font loading",
    description = "Redirects Skottie animation font loading to system fonts for mod package compatibility, fixing blank text and cutout crashes in Memories.",
    default = true,
) {
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)

    execute {
        classDefForEach { classDef ->
            val methodA = classDef.methods.find {
                it.parameterTypes == listOf("Ljava/lang/String;", "Landroid/os/CancellationSignal;") &&
                it.returnType == "Landroid/net/Uri;"
            }

            val methodB = classDef.methods.find {
                it.parameterTypes == listOf("Landroid/net/Uri;") &&
                it.returnType == "[B"
            }

            if (methodA != null && methodB != null) {
                val mutableClass by lazy { mutableClassDefBy(classDef) }

                var streamReaderRef: MethodReference? = null
                methodB.implementation?.instructions?.forEach { instr ->
                    if (instr.opcode == Opcode.INVOKE_STATIC) {
                        val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
                        if (ref?.parameterTypes == listOf("Ljava/io/InputStream;") && ref.returnType == "[B") {
                            streamReaderRef = ref
                        }
                    }
                }

                if (streamReaderRef != null) {
                    val streamReaderClass = streamReaderRef!!.definingClass
                    val streamReaderMethod = streamReaderRef!!.name

                    // Patch font URI resolver: redirect to system font paths
                    val mutableMethodA = mutableClass.findMutableMethodOf(methodA)
                    mutableMethodA.addInstructions(0, """
                        if-eqz p1, :cond_default_a
                        invoke-virtual { p1 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
                        move-result-object v0
                        const-string v1, "serif"
                        invoke-virtual { v0, v1 }, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                        move-result v0
                        if-eqz v0, :cond_default_a
                        const-string v0, "file:///system/fonts/NotoSerif-Italic.ttf"
                        goto :cond_parse_a
                        :cond_default_a
                        const-string v0, "file:///system/fonts/Roboto-Regular.ttf"
                        :cond_parse_a
                        invoke-static { v0 }, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
                        move-result-object v0
                        return-object v0
                    """.trimIndent())

                    // Patch font data reader: read bytes from local file system path
                    val mutableMethodB = mutableClass.findMutableMethodOf(methodB)
                    mutableMethodB.addInstructions(0, """
                        if-eqz p1, :cond_default_b
                        invoke-virtual { p1 }, Landroid/net/Uri;->getPath()Ljava/lang/String;
                        move-result-object v0
                        if-eqz v0, :cond_default_b
                        new-instance v1, Ljava/io/File;
                        invoke-direct { v1, v0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
                        invoke-virtual { v1 }, Ljava/io/File;->exists()Z
                        move-result v0
                        if-eqz v0, :cond_default_b
                        new-instance v0, Ljava/io/FileInputStream;
                        invoke-direct { v0, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
                        invoke-static { v0 }, $streamReaderClass->$streamReaderMethod(Ljava/io/InputStream;)[B
                        move-result-object v1
                        invoke-virtual { v0 }, Ljava/io/FileInputStream;->close()V
                        return-object v1
                        :cond_default_b
                        new-instance v0, Ljava/io/File;
                        const-string v1, "/system/fonts/Roboto-Regular.ttf"
                        invoke-direct { v0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
                        new-instance v1, Ljava/io/FileInputStream;
                        invoke-direct { v1, v0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
                        invoke-static { v1 }, $streamReaderClass->$streamReaderMethod(Ljava/io/InputStream;)[B
                        move-result-object v0
                        invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
                        return-object v0
                    """.trimIndent())
                }
            }
        }
    }
}

