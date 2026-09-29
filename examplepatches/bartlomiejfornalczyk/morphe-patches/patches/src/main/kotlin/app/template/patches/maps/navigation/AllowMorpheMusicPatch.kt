package app.template.patches.maps.navigation

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITY_GOOGLE_MAPS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

val allowMorpheMusicManifestPatch = resourcePatch(
    name = "Allow Morphe YouTube Music package visibility",
    description = "Adds package queries and permission to AndroidManifest.xml for full media apps visibility.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GOOGLE_MAPS)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement

            val queryAllPerm = doc.createElement("uses-permission")
            queryAllPerm.setAttribute("android:name", "android.permission.QUERY_ALL_PACKAGES")
            manifest.appendChild(queryAllPerm)

            val queriesNodes = doc.getElementsByTagName("queries")
            val queries: Element = if (queriesNodes.length > 0) {
                queriesNodes.item(0) as Element
            } else {
                val newQueries = doc.createElement("queries")
                manifest.appendChild(newQueries)
                newQueries
            }

            val packagesToAdd = listOf(
                "app.morphe.android.apps.youtube.music",
                "app.revanced.android.apps.youtube.music",
                "app.rvx.android.apps.youtube.music",
                "com.google.android.apps.youtube.music",
                "com.spotify.music"
            )

            for (pkg in packagesToAdd) {
                val pkgElement = doc.createElement("package")
                pkgElement.setAttribute("android:name", pkg)
                queries.appendChild(pkgElement)
            }

            val intentElem = doc.createElement("intent")
            val actionElem = doc.createElement("action")
            actionElem.setAttribute("android:name", "android.media.browse.MediaBrowserService")
            intentElem.appendChild(actionElem)
            queries.appendChild(intentElem)
        }
    }
}

@Suppress("unused")
val allowMorpheMusicPatch = bytecodePatch(
    name = "Allow Morphe YouTube Music mini player",
    description = "Enables YouTube Music and modded media apps as the navigation mini player.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GOOGLE_MAPS)
    dependsOn(allowMorpheMusicManifestPatch)

    val targetPackageOpt = stringOption(
        key = "targetPackage",
        default = "app.morphe.android.apps.youtube.music",
        title = "YouTube Music package name",
        description = "Package name of your modded YouTube Music app."
    )

    execute {
        val targetPackage = targetPackageOpt.value!!

        val method = NavigationMediaProvidersFingerprint.method
        val impl = method.implementation!!

        val ytmMatch = NavigationMediaProvidersFingerprint.instructionMatches.first()
        val ytmIndex = ytmMatch.index
        val register = ytmMatch.getInstruction<OneRegisterInstruction>().registerA

        // 1. Replace YouTube Music package name string with targetPackage
        method.replaceInstruction(
            ytmIndex,
            "const-string v$register, \"$targetPackage\""
        )

        // 2. Bypass server-side cpwy.d flag check by forcing the loaded boolean to true (1) before it is evaluated
        for (i in ytmIndex downTo (ytmIndex - 15).coerceAtLeast(0)) {
            val insn = impl.instructions.elementAt(i)
            if (insn.opcode == Opcode.IGET_BOOLEAN) {
                val reg = (insn as TwoRegisterInstruction).registerA
                method.replaceInstruction(i, "const/4 v$reg, 0x1")
                break
            } else if (insn.opcode == Opcode.MOVE_RESULT) {
                val reg = (insn as OneRegisterInstruction).registerA
                method.replaceInstruction(i, "const/4 v$reg, 0x1")
                break
            }
        }

        // 3. Force queryIntentServices to use MATCH_ALL (0x20000) instead of 0
        var queryIntentIndex = -1
        for (i in ytmIndex until impl.instructions.count()) {
            val insn = impl.instructions.elementAt(i)
            if ((insn as? ReferenceInstruction)?.reference?.let { (it as? MethodReference)?.name == "queryIntentServices" } == true) {
                queryIntentIndex = i
                break
            }
        }

        if (queryIntentIndex != -1) {
            val invokeInsn = impl.instructions.elementAt(queryIntentIndex) as Instruction35c
            val pmReg = invokeInsn.registerC
            val intentReg = invokeInsn.registerD
            val flagsReg = invokeInsn.registerE

            val injection = """
                const v$flagsReg, 0x20000
                invoke-virtual {v$pmReg, v$intentReg, v$flagsReg}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;
            """.trimIndent()
            
            method.replaceInstruction(queryIntentIndex, injection)
        }

        // 4. Case 9: Bypass apww.l() check
        for (i in 0 until impl.instructions.count()) {
            val insn = impl.instructions.elementAt(i)
            if ((insn as? ReferenceInstruction)?.reference?.let { (it as? MethodReference)?.name == "l" && (it as? MethodReference)?.returnType == "Z" } == true) {
                val nextInsn = impl.instructions.elementAt(i + 1)
                if (nextInsn.opcode == Opcode.MOVE_RESULT) {
                    val reg = (nextInsn as OneRegisterInstruction).registerA
                    method.replaceInstruction(i + 1, "const/4 v$reg, 0x1")
                }
            }
        }
    }
}
