package app.template.patches.maps.navigation

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITY_GOOGLE_MAPS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
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
            val androidNs = "http://schemas.android.com/apk/res/android"

            // 1. Grant QUERY_ALL_PACKAGES so Android OS never hides any media apps
            val queryAllPerm = doc.createElement("uses-permission").apply {
                setAttribute("android:name", "android.permission.QUERY_ALL_PACKAGES")
                setAttributeNS(androidNs, "android:name", "android.permission.QUERY_ALL_PACKAGES")
            }
            manifest.appendChild(queryAllPerm)

            // 2. Add queries for all YouTube Music variants + generic MediaBrowserService intent
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
                val pkgElement = doc.createElement("package").apply {
                    setAttribute("android:name", pkg)
                    setAttributeNS(androidNs, "android:name", pkg)
                }
                queries.appendChild(pkgElement)
            }

            // Also add generic MediaBrowserService intent filter query
            val intentElem = doc.createElement("intent")
            val actionElem = doc.createElement("action").apply {
                setAttribute("android:name", "android.media.browse.MediaBrowserService")
                setAttributeNS(androidNs, "android:name", "android.media.browse.MediaBrowserService")
            }
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

    val targetPackage by stringOption(
        key = "targetPackage",
        default = "app.morphe.android.apps.youtube.music",
        title = "YouTube Music package name",
        description = "Package name of your modded YouTube Music app."
    )

    execute {
        // 1. Cleanly patch apww.l() so the feature flag always returns true (1)
        val mediaClass = MediaControllerFingerprint.classDef
        val flagMethod = mediaClass.methods.firstOrNull { it.name == "l" && it.returnType == "Z" }
        if (flagMethod != null) {
            val totalInsn = flagMethod.implementation?.instructions?.count() ?: 0
            for (i in 2 until totalInsn) {
                flagMethod.replaceInstruction(i, "nop")
            }
            flagMethod.replaceInstruction(0, "const/4 v0, 0x1")
            flagMethod.replaceInstruction(1, "return v0")
        }

        // 2. Patch navigation media provider resolution method (xzt.ux())
        val method = NavigationMediaProvidersFingerprint.method
        val impl = method.implementation!!

        val ytmMatch = NavigationMediaProvidersFingerprint.instructionMatches.first()
        val ytmIndex = ytmMatch.index
        val register = ytmMatch.getInstruction<OneRegisterInstruction>().registerA

        // 2a. Replace YouTube Music package name string with targetPackage
        method.replaceInstruction(
            ytmIndex,
            "const-string v$register, \"$targetPackage\""
        )

        // 2b. Also replace Google Play Music ("com.google.android.music") at earlier index with Morphe/ReVanced package
        val altPackage = if (targetPackage == "app.morphe.android.apps.youtube.music") {
            "app.revanced.android.apps.youtube.music"
        } else {
            "app.morphe.android.apps.youtube.music"
        }

        // 2b. Replace Google Play Music ("com.google.android.music") with alternate package so both Morphe and ReVanced are supported
        for (i in ytmIndex downTo (ytmIndex - 25).coerceAtLeast(0)) {
            val insn = impl.instructions.elementAt(i)
            if ((insn as? ReferenceInstruction)?.reference?.let { (it as? StringReference)?.string == "com.google.android.music" } == true) {
                val reg = (insn as OneRegisterInstruction).registerA
                method.replaceInstruction(i, "const-string v$reg, \"$altPackage\"")
                
                // Also bypass server-side cpwy.b flag check (if-eqz v4, :cond_1e7)
                for (j in i downTo (i - 10).coerceAtLeast(0)) {
                    val checkInsn = impl.instructions.elementAt(j)
                    if (checkInsn.opcode == Opcode.IF_EQZ) {
                        method.replaceInstruction(j, "nop")
                        break
                    }
                }
                break
            }
        }

        // 2c. Bypass server-side cpwy.d flag check before ytmIndex (if-eqz v4, :cond_203)
        for (i in ytmIndex downTo (ytmIndex - 10).coerceAtLeast(0)) {
            val insn = impl.instructions.elementAt(i)
            if (insn.opcode == Opcode.IF_EQZ) {
                method.replaceInstruction(i, "nop")
                break
            }
        }

        // 2d. Case 9: Bypass apww.l() check before ytmIndex (replace move-result v2 with const/4 v2, 0x1)
        for (i in ytmIndex downTo (ytmIndex - 40).coerceAtLeast(0)) {
            val insn = impl.instructions.elementAt(i)
            if ((insn as? ReferenceInstruction)?.reference?.let { (it as? MethodReference)?.name == "l" && (it as? MethodReference)?.returnType == "Z" } == true) {
                val nextInsn = impl.instructions.elementAt(i + 1)
                if (nextInsn.opcode == Opcode.MOVE_RESULT) {
                    val reg = (nextInsn as OneRegisterInstruction).registerA
                    method.replaceInstruction(i + 1, "const/4 v$reg, 0x1")
                }
                break
            }
        }

        // 2f. Case 8: Bypass apww.l() check (if-eqz v2, :cond_338 -> nop)
        for (i in ytmIndex until impl.instructions.count()) {
            val insn = impl.instructions.elementAt(i)
            if ((insn as? ReferenceInstruction)?.reference?.let { (it as? MethodReference)?.name == "l" && (it as? MethodReference)?.returnType == "Z" } == true) {
                val branchInsn = impl.instructions.elementAt(i + 2)
                if (branchInsn.opcode == Opcode.IF_EQZ) {
                    method.replaceInstruction(i + 2, "nop")
                }
                break
            }
        }

        // 2g. Inject Morphe YT Music ResolveInfo fallback into the media providers map (bwyf).
        // On modern Android (API 30+, Android 14/15/16), queryIntentServices returns empty
        // for non-system/untrusted packages even with package visibility granted.
        // We inject a complete ResolveInfo (with valid ApplicationInfo, exported=true, processName)
        // and call bwyf.d(false) to gracefully suppress duplicate key exceptions if already present.
        val queryIntentIndex = impl.instructions.indexOfFirst { insn ->
            (insn as? ReferenceInstruction)?.reference?.let {
                (it as? MethodReference)?.name == "queryIntentServices"
            } == true
        }

        var dIndex = -1
        for (i in queryIntentIndex until impl.instructions.count()) {
            val insn = impl.instructions.elementAt(i)
            if ((insn as? ReferenceInstruction)?.reference?.let {
                (it as? MethodReference)?.definingClass == "Lbwyf;" && (it as? MethodReference)?.name == "d"
            } == true) {
                dIndex = i
                break
            }
        }

        if (dIndex != -1) {
            val invokeInsn = impl.instructions.elementAt(dIndex) as FiveRegisterInstruction
            val builderReg = invokeInsn.registerC

            // Replace invoke-virtual Lbwyf;->d(Z) with the first instruction so that any
            // branch jumping to dIndex (such as the if-eqz when queryIntentServices returns empty)
            // jumps directly to our fallback injection logic without shifting loop branch offsets.
            val firstSmali = "new-instance v3, Landroid/content/pm/ResolveInfo;"
            method.replaceInstruction(dIndex, firstSmali)

            val fallbackSmali = """
                invoke-direct {v3}, Landroid/content/pm/ResolveInfo;-><init>()V
                new-instance v4, Landroid/content/pm/ServiceInfo;
                invoke-direct {v4}, Landroid/content/pm/ServiceInfo;-><init>()V
                const-string v5, "$targetPackage"
                iput-object v5, v4, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;
                const-string v5, "com.google.android.apps.youtube.music.mediabrowser.MusicBrowserService"
                iput-object v5, v4, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;
                new-instance v5, Landroid/content/pm/ApplicationInfo;
                invoke-direct {v5}, Landroid/content/pm/ApplicationInfo;-><init>()V
                const-string v7, "$targetPackage"
                iput-object v7, v5, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;
                iput-object v5, v4, Landroid/content/pm/ServiceInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;
                const/4 v5, 0x1
                iput-boolean v5, v4, Landroid/content/pm/ServiceInfo;->exported:Z
                iput-object v7, v4, Landroid/content/pm/ServiceInfo;->processName:Ljava/lang/String;
                iput-object v4, v3, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;
                new-instance v4, Lampc;
                const v5, 0x7f060d3c
                const v7, 0x7f060d3d
                const-string v8, "$targetPackage"
                invoke-direct {v4, v8, v5, v7}, Lampc;-><init>(Ljava/lang/String;II)V
                invoke-virtual {v$builderReg, v4, v3}, Lbwyf;->e(Ljava/lang/Object;Ljava/lang/Object;)V
                const/4 v5, 0x0
                invoke-virtual {v$builderReg, v5}, Lbwyf;->d(Z)Lbwyj;
            """.trimIndent()
            method.addInstructions(dIndex + 1, fallbackSmali)
        }
    }
}
