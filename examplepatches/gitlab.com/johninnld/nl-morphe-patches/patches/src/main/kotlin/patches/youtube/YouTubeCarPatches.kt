package patches.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.cloneParameters
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.w3c.dom.Element

private const val CAR_DISPLAY = "Lpatches/youtube/CarDisplay;"
private const val CAR_LAYOUT = "Lpatches/youtube/CarLayout;"
private const val CAR_NAVIGATION_BAR = "Lpatches/youtube/CarNavigationBar;"
private const val ANDROID = "http://schemas.android.com/apk/res/android"
private const val CAR_LAUNCHER = "android.intent.category.CAR_LAUNCHER"
private const val CAR_CONNECTION_AUTHORITY = "androidx.car.app.connection"
private const val CLIENT_CONTEXT_HELPER = "nlCarSetClientContext"
private const val MORPHE_FORM_FACTOR = "Lapp/morphe/extension/youtube/patches/ChangeFormFactorPatch;"

/** Morphe's GmsCore support renames the package; both are the same original app. */
private val packages = setOf("com.google.android.youtube", "app.morphe.android.youtube")

private val anyVersion = Compatibility(
    name = "YouTube", packageName = "com.google.android.youtube",
    apkFileType = ApkFileType.APK, targets = listOf(AppTarget(version = null)),
)

private val testedVersion = Compatibility(
    name = "YouTube", packageName = "com.google.android.youtube",
    apkFileType = ApkFileType.APK, targets = listOf(AppTarget(version = "21.30.216", versionCode = 1561187872)),
)

private val detectionValues = mapOf("Car displays" to "car", "Any external display" to "any")
private const val DETECTION_DESCRIPTION =
    "Car displays: Android Auto, DriveDeck and hosts that use the car UI mode, and on Android 15 and later " +
        "phone mirroring by DriveDeck, Gearslip, graphene-auto or MyCar. " +
        "Any external display: also other car hosts, but also a TV or a monitor."

/** "any" wins when both car display patches are selected with different detection. */
private var configuredDetection = "car"
private var layoutIncluded = false
private var navigationBarIncluded = false
private var hideDelaySeconds = 5

private fun BytecodePatchContext.returnConstant(method: String, smali: String) {
    val owner = mutableClassDefBy(CAR_DISPLAY.takeIf { method != "getConfiguredHideDelaySeconds" } ?: CAR_NAVIGATION_BAR)
    owner.methods.single { it.name == method }.addInstructions(0, smali)
}

/** Car hosts that mirror the phone screen; the extension checks if one is installed. */
private val mirroringCarHosts = listOf(
    "app.johninnl.drivedeck", "app.johninnl.drivedeck.dev",
    "app.seb3thehacker.gearslip", "app.seb3thehacker.gearslip.dev",
    "io.github.psychobarge.grapheneauto",
    "io.github.sirionero.mycar",
)

/** Lets the app see whether its window is captured (Android 15+) and whether a mirroring car host is installed. */
private val carDisplayManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            fun Element.children(tag: String) = (0 until childNodes.length)
                .map { childNodes.item(it) }.filterIsInstance<Element>().filter { it.tagName == tag }

            if (root.children("uses-permission").none {
                    it.getAttributeNS(ANDROID, "name") == "android.permission.DETECT_SCREEN_RECORDING"
                }
            ) {
                root.appendChild(manifest.createElement("uses-permission").apply {
                    setAttributeNS(ANDROID, "android:name", "android.permission.DETECT_SCREEN_RECORDING")
                })
            }

            val application = root.children("application").first()
            val queries = root.children("queries").firstOrNull()
                ?: manifest.createElement("queries").also { root.insertBefore(it, application) }
            val declared = queries.children("package").map { it.getAttributeNS(ANDROID, "name") }.toSet()
            mirroringCarHosts.filter { it !in declared }.forEach { host ->
                queries.appendChild(manifest.createElement("package").apply {
                    setAttributeNS(ANDROID, "android:name", host)
                })
            }
        }
    }
}

/** Finds the car display when the main activity is created or moved, for the car display patches. */
private val carDisplayDetectionPatch = bytecodePatch {
    extendWith("extensions/youtube-car.mpe")
    dependsOn(carDisplayManifestPatch)

    execute {
        check(packageMetadata.packageName in packages) { "Unsupported YouTube package" }
        // A dependency executes before the patches that set these, once per patching run.
        configuredDetection = "car"
        layoutIncluded = false
        navigationBarIncluded = false
        hideDelaySeconds = 5

        // Before the activity makes its first requests.
        mainActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $CAR_DISPLAY->onMainActivityCreate(Landroid/app/Activity;)V",
        )

        initializeBottomBarContainerFingerprint.let {
            val index = it.instructionMatches.last().index
            val register = it.method.getInstruction<FiveRegisterInstruction>(index).registerC
            it.method.addInstruction(
                index,
                "invoke-static/range { v$register .. v$register }, " +
                    "$CAR_DISPLAY->onBottomBarContainerCreated(Landroid/view/View;)V",
            )
        }
    }

    finalize {
        returnConstant("getConfiguredDetection", "const-string v0, \"$configuredDetection\"\nreturn-object v0")
        returnConstant("isLayoutPatchIncluded", "const/4 v0, ${if (layoutIncluded) 1 else 0}\nreturn v0")
        returnConstant("isNavigationBarPatchIncluded", "const/4 v0, ${if (navigationBarIncluded) 1 else 0}\nreturn v0")
        returnConstant("getConfiguredHideDelaySeconds", "const/16 v0, $hideDelaySeconds\nreturn v0")
    }
}

@Suppress("unused")
val youtubeParkedCarApp = resourcePatch(
    name = "Parked app for Android Auto",
    description = "Declares YouTube a parked video app, so Android Auto and DriveDeck list it on the car screen by themselves. " +
        "Android Auto still needs Unknown sources in its developer settings for a patched app.",
) {
    compatibleWith(anyVersion)

    // Last, so the launcher entries Morphe's Custom branding adds get the category too.
    finalize {
        check(packageMetadata.packageName in packages) { "Unsupported YouTube package" }
        document("AndroidManifest.xml").use { manifest ->
            fun Element.children(tag: String) = (0 until childNodes.length)
                .map { childNodes.item(it) }.filterIsInstance<Element>().filter { it.tagName == tag }
            fun Element.declares(tag: String, name: String) =
                children(tag).any { it.getAttributeNS(ANDROID, "name") == name }

            val application = manifest.getElementsByTagName("application").item(0) as Element
            if (application.getAttributeNS(ANDROID, "appCategory").isNullOrEmpty()) {
                application.setAttributeNS(ANDROID, "android:appCategory", "video")
            }

            for (tag in listOf("activity", "activity-alias")) {
                val activities = manifest.getElementsByTagName(tag)
                for (i in 0 until activities.length) {
                    (activities.item(i) as Element).children("intent-filter").forEach { filter ->
                        if (filter.declares("action", "android.intent.action.MAIN") &&
                            filter.declares("category", "android.intent.category.LAUNCHER") &&
                            !filter.declares("category", CAR_LAUNCHER)
                        ) {
                            filter.appendChild(manifest.createElement("category").apply {
                                setAttributeNS(ANDROID, "android:name", CAR_LAUNCHER)
                            })
                        }
                    }
                }
            }

            // The Android Auto car connection, read to find the car display. YouTube already declares it.
            val queries = (manifest.getElementsByTagName("queries").item(0) as? Element)
                ?: manifest.createElement("queries").also { manifest.documentElement.insertBefore(it, application) }
            if (queries.children("provider").none { it.getAttributeNS(ANDROID, "authorities") == CAR_CONNECTION_AUTHORITY }) {
                queries.appendChild(manifest.createElement("provider").apply {
                    setAttributeNS(ANDROID, "android:authorities", CAR_CONNECTION_AUTHORITY)
                })
            }
        }
    }
}

@Suppress("unused")
val youtubeCarNavigationBarAutoHide = bytecodePatch(
    name = "Auto-hide navigation bar on car displays",
    description = "On a car display, hides the bottom navigation bar after a few seconds, giving its room to the content. " +
        "Swipe up from the bottom edge to show it again.",
) {
    compatibleWith(testedVersion)
    dependsOn(carDisplayDetectionPatch)

    val detection by stringOption(
        key = "detection", default = "car", values = detectionValues,
        title = "Car display detection", description = DETECTION_DESCRIPTION, required = true,
    )
    val delay by intOption(
        key = "hideDelay", default = 5, title = "Hide after (seconds)",
        description = "How long the navigation bar stays after it is shown or touched.", required = true,
    )

    execute {
        val chosen = detection ?: throw PatchException("Choose a car display detection")
        if (chosen !in detectionValues.values) throw PatchException("Unknown car display detection: $chosen")
        if (chosen == "any") configuredDetection = "any"
        hideDelaySeconds = (delay ?: 5).also {
            if (it !in 1..60) throw PatchException("Hide the navigation bar after 1 to 60 seconds")
        }
        navigationBarIncluded = true
    }
}

@Suppress("unused")
val youtubeCarDisplayLayout = bytecodePatch(
    name = "Automotive layout on car displays",
    description = "Uses the automotive layout on a car display, such as a parked app on Android Auto or DriveDeck, " +
        "and the original layout on the phone. Works with Morphe's Change form factor: on a car display this patch decides.",
) {
    compatibleWith(testedVersion)
    dependsOn(carDisplayDetectionPatch)

    val detection by stringOption(
        key = "detection", default = "car", values = detectionValues,
        title = "Car display detection", description = DETECTION_DESCRIPTION, required = true,
    )

    execute {
        val chosen = detection ?: throw PatchException("Choose a car display detection")
        if (chosen !in detectionValues.values) throw PatchException("Unknown car display detection: $chosen")
        if (chosen == "any") configuredDetection = "any"
        layoutIncluded = true

        // Pages the automotive form factor breaks.
        hookClientContext()
    }

    // After every other patch executed, so Morphe's Change form factor, if selected, finds the original code
    // and this patch can follow it.
    finalize {
        // The form factor of every request. Morphe's Change form factor, if selected, sets it right after the
        // field is read; this patch then runs after it, so on a car display the automotive layout is used.
        val morpheFormFactorIncluded = innerTubeClientConfigFingerprint(formFactorEnumConstructorFingerprint.classDef.type).let {
            val method = it.method
            val index = it.instructionMatches.last().index
            val register = method.getInstruction<TwoRegisterInstruction>(index).registerA
            val instructions = method.instructions.toList()
            val morpheCall = (index + 1 until minOf(index + 8, instructions.size)).firstOrNull { i ->
                ((instructions[i] as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == MORPHE_FORM_FACTOR
            }
            val insertIndex = if (morpheCall != null && instructions.getOrNull(morpheCall + 1)?.opcode == Opcode.MOVE_RESULT) {
                morpheCall + 2
            } else {
                index + 1
            }
            method.addInstructions(
                insertIndex,
                """
                    invoke-static/range { v$register .. v$register }, $CAR_LAYOUT->getUniversalFormFactor(I)I
                    move-result v$register
                """,
            )
            morpheCall != null
        }

        // Morphe's Change form factor has its own guard for this, which changes the code this one matches.
        if (morpheFormFactorIncluded) return@finalize

        // The tablet form factor can make the app parse an item section a page does not have.
        repeatedItemSectionRendererFingerprint.let {
            it.method.apply {
                val match = it.instructionMatches[1]
                val listRegister = match.instruction.registersUsed[0]
                val indexRegister = match.instruction.registersUsed[1]
                val free = findFreeRegister(match.index, listRegister, indexRegister)
                addInstructionsWithLabels(
                    match.index,
                    """
                        invoke-static { v$listRegister, v$indexRegister }, $CAR_LAYOUT->checkItemSectionRenderer(Ljava/util/List;I)Z
                        move-result v$free
                        if-nez v$free, :valid_index
                        return-void
                        :valid_index
                        nop
                    """,
                )
            }
        }
    }
}

/** Ported from Morphe's client context hook: changes the form factor of single endpoints. */
private fun BytecodePatchContext.hookClientContext() {
    val clientInfoField: FieldReference
    val messageLiteBuilderField: FieldReference
    buildDummyClientContextBodyFingerprint.let {
        clientInfoField = it.method.getInstruction<ReferenceInstruction>(it.instructionMatches.last().index)
            .reference as FieldReference
        messageLiteBuilderField = it.method.getInstruction<ReferenceInstruction>(it.instructionMatches.first().index)
            .reference as FieldReference
    }

    val listener = runCatching { authenticationChangeListenerFingerprint.method }
        .getOrElse { authenticationChangeListenerLegacyFingerprint.method }
    val messageLiteBuilderMethod = listener.instructions.firstNotNullOfOrNull { instruction ->
        if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@firstNotNullOfOrNull null
        val reference = (instruction as ReferenceInstruction).reference as MethodReference
        reference.takeIf { it.parameterTypes.isEmpty() && it.returnType == messageLiteBuilderField.definingClass }
    } ?: throw PatchException("Client context builder not found")

    val formFactorOrdinal = clientFormFactorEnumOrdinalFingerprint.method
    val formFactorField = Fingerprint(
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        returnType = "V",
        parameters = listOf("L"),
        filters = listOf(
            fieldAccess(opcode = Opcode.IGET, definingClass = CLIENT_INFO_CLASS, type = "I"),
            methodCall(reference = formFactorOrdinal),
        ),
    ).let { it.method.getInstruction<ReferenceInstruction>(it.instructionMatches.first().index).reference as FieldReference }

    val clientInfoPrefix = """
        invoke-virtual { p0 }, $messageLiteBuilderMethod
        move-result-object v0
        iget-object v0, v0, $messageLiteBuilderField
        check-cast v0, ${clientInfoField.definingClass}
        iget-object v1, v0, $clientInfoField
        if-eqz v1, :ignore
        iget v2, v1, $formFactorField
    """
    val clientInfoSuffix = """
        move-result v2
        iput v2, v1, $formFactorField
        :ignore
        return-void
    """

    val brokenEndpoints = buildList {
        addAll(getWatchEndpointConstructorFingerprint.matchAll().map { it.classDef.type })
        add(guideEndpointConstructorFingerprint.classDef.type)
        add(nextEndpointParentFingerprint.classDef.type)
        add(reelItemWatchEndpointConstructorFingerprint.classDef.type)
        add(reelWatchSequenceEndpointConstructorFingerprint.classDef.type)
    }.distinct()
    brokenEndpoints.forEach { type ->
        hookEndpoint(type, 5, "$clientInfoPrefix\ninvoke-static { v2 }, $CAR_LAYOUT->replaceBrokenFormFactor(I)I\n$clientInfoSuffix")
    }

    // The browse request names its page, so only the pages that work keep the automotive layout.
    val browse = browseEndpointParentFingerprint.classDef
    val browseIdField = browse.methods.firstNotNullOfOrNull { method ->
        val instructions = method.implementation?.instructions?.toList() ?: return@firstNotNullOfOrNull null
        val start = instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "browseId"
        }
        if (start < 0) return@firstNotNullOfOrNull null
        instructions.drop(start + 1).take(5).firstNotNullOfOrNull {
            ((it as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { field ->
                it.opcode == Opcode.IGET_OBJECT && field.definingClass == browse.type && field.type == "Ljava/lang/String;"
            }
        }
    } ?: throw PatchException("Browse page id not found")
    hookEndpoint(
        browse.type, 6,
        "$clientInfoPrefix\niget-object v3, p0, $browseIdField\n" +
            "invoke-static { v2, v3 }, $CAR_LAYOUT->replaceBrowseFormFactor(ILjava/lang/String;)I\n$clientInfoSuffix",
    )
}

/** Runs the helper at every return of the method that builds the request body of an endpoint. */
private fun BytecodePatchContext.hookEndpoint(type: String, registers: Int, helperSmali: String) {
    val endpoint = mutableClassDefBy(type)
    if (endpoint.methods.any { it.name == CLIENT_CONTEXT_HELPER }) return
    val body = endpoint.methods.singleOrNull {
        AccessFlags.PROTECTED.isSet(it.accessFlags) && AccessFlags.FINAL.isSet(it.accessFlags) &&
            it.returnType == "V" && it.parameterTypes.isEmpty()
    } ?: throw PatchException("Request body of $type not found")

    // 21.05+ clobbers p0 in this method.
    val method: MutableMethod = body.cloneParameters()
    endpoint.methods.add(
        ImmutableMethod(
            type, CLIENT_CONTEXT_HELPER, emptyList(), "V",
            AccessFlags.PRIVATE.value or AccessFlags.FINAL.value, null, null,
            MutableMethodImplementation(registers),
        ).toMutable().apply { addInstructionsWithLabels(0, helperSmali) },
    )

    method.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.reversed()
        .forEach { index ->
            // Replacing keeps the branches that jump to the return.
            method.replaceInstruction(index, "invoke-direct/range { p0 .. p0 }, $type->$CLIENT_CONTEXT_HELPER()V")
            method.addInstruction(index + 1, "return-void")
        }
}
