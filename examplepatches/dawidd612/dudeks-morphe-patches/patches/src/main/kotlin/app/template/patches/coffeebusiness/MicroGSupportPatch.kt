package app.template.patches.coffeebusiness

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.replaceBody
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Element

internal const val MICROG = "app.revanced.android.gms"
private const val GAME = "com.tapblaze.coffeebusiness"
// SHA-1 of the verified APK signing certificate, not of the APK contents.
private const val SIGNER = "aa6e781863cdfb8d32b8f7b368534ace25a0ae7e"
private const val GAME_ACTIVITY = "Lcom/tapblaze/coffeebusiness/MyUnityActivity;"

private val coffeeMicroGResources = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            checkCoffee(manifest.getAttribute("package") == GAME &&
                manifest.getAttribute("android:versionCode") == CoffeeProfiles.forPackage(packageMetadata).versionCode, "MicroG manifest target changed")
            val application = document.getElementsByTagName("application").item(0) as Element
            val metadata = mapOf(
                "$MICROG.SPOOFED_PACKAGE_NAME" to GAME,
                "$MICROG.SPOOFED_PACKAGE_SIGNATURE" to SIGNER,
                "app.revanced.MICROG_PACKAGE_NAME" to MICROG,
            )
            val existing = application.getElementsByTagName("meta-data")
            checkCoffee((0 until existing.length).none {
                (existing.item(it) as Element).getAttribute("android:name") in metadata
            }, "MicroG metadata already present; use a clean APK")
            metadata.forEach { (name, value) ->
                application.appendChild(document.createElement("meta-data").apply {
                    setAttribute("android:name", name)
                    setAttribute("android:value", value)
                })
            }
            val queries = (document.getElementsByTagName("queries").item(0) as? Element)
                ?: document.createElement("queries").also { manifest.appendChild(it) }
            val packages = queries.getElementsByTagName("package")
            if ((0 until packages.length).none {
                (packages.item(it) as Element).getAttribute("android:name") == MICROG
            }) queries.appendChild(document.createElement("package").apply {
                setAttribute("android:name", MICROG)
            })
        }
    }
}

/** Redirect only the two Games clients; keep Binder descriptors and Bundle keys. */
@Suppress("unused")
val coffeeMicroGSupportPatch = bytecodePatch(
    name = "Google Play Games via MicroG-RE",
    description = "Routes Google Play Games sign-in and player/server authorization through MicroG-RE 7.1.0+. Requires app.revanced.android.gms.",
    default = true,
) {
    compatibleWith(CoffeeProfiles.compatibility)
    dependsOn(coffeeStartupSupport, coffeeMicroGResources)
    execute {
        val profile = CoffeeProfiles.forPackage(packageMetadata)
        val gamesClients = mapOf(profile.gamesConnect to "games.internal.connect.service.START",
            profile.gamesService to "games.service.START")
        // Authentication still comes from the remote service. These overrides
        // select its transport; none returns an authenticated player or token.
        val overrides = mapOf(
            "getStartServicePackage" to (STRING to "const-string v0, \"$MICROG\"\nreturn-object v0"),
            "getUseDynamicLookup" to ("Z" to "const/4 v0, 0x0\nreturn v0"),
            "requiresGooglePlayServices" to ("Z" to "const/4 v0, 0x0\nreturn v0"),
        )
        overrides.forEach { (name, shape) ->
            val inherited = coffeeMethod(profile.gamesBase, name, emptyList(), shape.first, static = false)
            checkCoffee(!AccessFlags.FINAL.isSet(inherited.accessFlags), "$name cannot be overridden")
        }
        val actions = gamesClients.map { (owner, action) ->
            checkCoffee(classDefBy(owner).superclass == profile.gamesParent &&
                classDefBy(owner).methods.none { it.name in overrides }, "Games client inheritance changed")
            coffeeMethod(owner, "getStartServiceAction", emptyList(), STRING, static = false).also {
                checkCoffee(it.hasString("com.google.android.gms.$action"), "Games service action changed")
            }
        }
        val create = coffeeMethod(GAME_ACTIVITY, "onCreate", listOf("Landroid/os/Bundle;"), "V", static = false)
        val returns = create.implementation!!.instructions.toList().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        checkCoffee(returns.size == 1, "Activity startup return changed")
        create.addInstructions(returns.single().index,
            "invoke-static {p0}, Lcom/google/android/gms/games/PlayGamesSdk;->initialize(Landroid/content/Context;)V")

        val resolutionOwner = profile.resolutionOwner
        val resolution = coffeeMethod(resolutionOwner, "d", listOf(
            "Lcom/google/android/gms/tasks/TaskCompletionSource;", "I", "Landroid/app/PendingIntent;", "Z", "Z"),
            "V", static = false)
        val resolutionCode = resolution.implementation!!.instructions.toList()
        val pendingFlag = resolution.implementation!!.registerCount - 2
        val pendingIntent = pendingFlag - 1
        val start = resolutionCode.indices.firstOrNull { index ->
            index + 1 < resolutionCode.size && resolutionCode[index].opcode == Opcode.IF_EQZ &&
                (resolutionCode[index] as? OneRegisterInstruction)?.registerA == pendingFlag &&
                resolutionCode[index + 1].opcode == Opcode.IF_EQZ &&
                (resolutionCode[index + 1] as? OneRegisterInstruction)?.registerA == pendingIntent
        } ?: throw app.morphe.patcher.patch.PatchException("Coffee Games resolution entry changed")
        val tag = resolutionCode.single {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "GamesApiManager"
        } as OneRegisterInstruction
        val boundary = resolutionCode.take(start).sumOf { it.codeUnits }
        checkCoffee(start > 2 && resolution.hasString("com.google.android.gms.version") &&
            resolution.hasString("PlayStore is not installed") &&
            resolution.calls("Lcom/google/android/gms/games/internal/v2/resolution/a;", "a") &&
            resolution.implementation!!.tryBlocks.all { it.startCodeAddress + it.codeUnitCount <= boundary },
            "legacy Play Store resolution probe changed")

        // The returned PendingIntent belongs to the selected Games service. The
        // stock GMS/Play Store version probe only predicts Play Games installation
        // behavior and cannot describe MicroG. Keep the main-thread check, actual
        // resolution launch, cancellation, retries and service authentication.
        val resolvedCode = MutableMethodImplementation(resolution.implementation!!)
        // The newer Coffee SDK keeps cancellation state and the retry's null
        // argument before its version probe. Preserve these live values.
        val keep = resolutionCode.take(start).withIndex().filter { (_, instruction) ->
            val ref = (instruction as? ReferenceInstruction)?.reference
            (ref is FieldReference && ((ref.definingClass == resolutionOwner && ref.name == "a") ||
                (ref.definingClass == profile.retryOwner && ref.name == profile.retryField))) ||
                (ref is StringReference && ref.string == "GamesApiManager") ||
                (instruction.opcode == Opcode.CONST_4 && (instruction as OneRegisterInstruction).registerA == 3)
        }.map { it.index }.toSet()
        checkCoffee(keep.size == 4 && resolution.implementation!!.registerCount == 14,
            "Games cancellation/retry state changed")
        for (index in start - 1 downTo 2) if (index !in keep) resolvedCode.removeInstruction(index)
        val resolutionClass = mutableClassDefBy(resolutionOwner)
        resolutionClass.methods.remove(resolution)
        resolutionClass.methods.add(MutableMethod(ImmutableMethod(resolution.definingClass, resolution.name,
            resolution.parameters, resolution.returnType, resolution.accessFlags, resolution.annotations,
            resolution.hiddenApiRestrictions, ImmutableMethodImplementation(resolvedCode.registerCount,
                resolvedCode.instructions, emptyList(), emptyList()))))

        actions.forEachIndexed { index, method ->
            val (owner, action) = gamesClients.entries.elementAt(index)
            method.replaceBody("const-string v0, \"$MICROG.$action\"\nreturn-object v0")
            overrides.forEach { (name, shape) ->
                val added = MutableMethod(ImmutableMethod(owner, name, emptyList(), shape.first,
                    AccessFlags.PUBLIC.value, emptySet(), emptySet(),
                    ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList())))
                added.addInstructions(0, shape.second)
                mutableClassDefBy(owner).methods.add(added)
            }
        }
    }
}
