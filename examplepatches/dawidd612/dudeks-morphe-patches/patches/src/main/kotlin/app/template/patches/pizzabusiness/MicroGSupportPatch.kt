package app.template.patches.pizzabusiness

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
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
private const val GAME = "com.tapblaze.pizzabusiness"
// SHA-1 of the verified APK signing certificate, not of the APK contents.
private const val SIGNER = "828d99f1d85e52eb473af06d690f84ee72904330"
private const val GAME_ACTIVITY = "Lcom/tapblaze/pizzabusiness/BaseAppActivity;"
private val gamesActions = listOf("games.internal.connect.service.START", "games.service.START")

private val pizzaMicroGResources = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            PizzaProfiles.forPackage(packageMetadata)
            val application = document.getElementsByTagName("application").item(0) as Element
            val metadata = mapOf(
                "$MICROG.SPOOFED_PACKAGE_NAME" to GAME,
                "$MICROG.SPOOFED_PACKAGE_SIGNATURE" to SIGNER,
                "app.revanced.MICROG_PACKAGE_NAME" to MICROG,
            )
            val existing = application.getElementsByTagName("meta-data")
            requirePizza((0 until existing.length).none {
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
val pizzaMicroGSupportPatch = bytecodePatch(
    name = "Google Play Games via MicroG-RE",
    description = "Routes Google Play Games sign-in and player/server authorization through MicroG-RE 7.1.0+ and suppresses obsolete stock Play services update prompts. Requires app.revanced.android.gms.",
    default = true,
) {
    compatibleWith(PizzaProfiles.compatibility)
    dependsOn(pizzaStartupSupport, pizzaMicroGResources)
    execute {
        suppressPizzaPlayServicesUpdatePrompts()
        // SDK/R8 class names may change between releases. Service actions and
        // inherited transport contracts identify the two clients instead.
        val gamesClients = gamesActions.associate { action ->
            val candidates = classDefByStrings("com.google.android.gms.$action").filter { cls ->
                cls.methods.any { it.name == "getStartServiceAction" && it.parameterTypes.isEmpty() &&
                    it.returnType == STRING && it.hasString("com.google.android.gms.$action") }
            }
            requirePizza(candidates.size == 1, "Games service client missing or ambiguous: $action")
            candidates.single().type to action
        }
        fun inheritedOwner(client: String, name: String, returns: String): String {
            var owner = classDefBy(client).superclass
            while (owner != null) {
                val cls = classDefBy(owner)
                if (cls.methods.any { it.name == name && it.parameterTypes.isEmpty() && it.returnType == returns }) return owner
                owner = cls.superclass
            }
            throw app.morphe.patcher.patch.PatchException("Pizza Games inherited transport method missing: $name")
        }
        // Authentication still comes from the remote service. These overrides
        // select its transport; none returns an authenticated player or token.
        val overrides = mapOf(
            "getStartServicePackage" to (STRING to "const-string v0, \"$MICROG\"\nreturn-object v0"),
            "getUseDynamicLookup" to ("Z" to "const/4 v0, 0x0\nreturn v0"),
            "requiresGooglePlayServices" to ("Z" to "const/4 v0, 0x0\nreturn v0"),
        )
        gamesClients.keys.forEach { client ->
            overrides.forEach { (name, shape) ->
                val inherited = pizzaMethod(inheritedOwner(client, name, shape.first), name, emptyList(), shape.first, static = false)
                requirePizza(!AccessFlags.FINAL.isSet(inherited.accessFlags), "$name cannot be overridden")
            }
        }
        val actions = gamesClients.map { (owner, action) ->
            requirePizza(classDefBy(owner).methods.none { it.name in overrides }, "Games client inheritance changed")
            pizzaMethod(owner, "getStartServiceAction", emptyList(), STRING, static = false).also {
                requirePizza(it.hasString("com.google.android.gms.$action"), "Games service action changed")
            }
        }
        val installed = pizzaMethod(GAME_ACTIVITY, "isGooglePlayGamesInstalled", emptyList(), "Z")
        requirePizza(installed.hasString("com.google.android.play.games") &&
            installed.calls("Landroid/content/pm/PackageManager;", "getApplicationInfo"), "Games presence check changed")

        // Register the SDK lifecycle observer before this Activity starts. Late
        // initialization from the login button misses onResume and leaves the
        // SDK without an Activity for its genuine account-selection resolution.
        val create = pizzaMethod(GAME_ACTIVITY, "onCreate", listOf("Landroid/os/Bundle;"), "V", static = false)
        val init = pizzaMethod(GAME_ACTIVITY, "lambda\$initializeGooglePlayGames\$3", emptyList(), "V")
        val lateInitIndex = init.implementation!!.instructions.indexOfFirst {
            val call = (it as? ReferenceInstruction)?.reference as? MethodReference
            call?.definingClass == "Lcom/google/android/gms/internal/games_v2/zzbw;" && call.name == "zza"
        }
        requirePizza(lateInitIndex >= 0 && create.calls("Lorg/cocos2dx/lib/Cocos2dxActivity;", "onCreate"),
            "Games lifecycle initialization changed")
        // Cocos finishes duplicate/non-root Activities in super.onCreate. The
        // game's existing root check must accept this Activity before the SDK
        // starts watching it; initializing a rejected window can launch Games
        // resolution while the real game has not created its renderer yet.
        val acceptedActivity = create.implementation!!.instructions.indexOfFirst {
            val field = (it as? ReferenceInstruction)?.reference as? FieldReference
            it.opcode == Opcode.SPUT_OBJECT && field?.definingClass == GAME_ACTIVITY &&
                field.name == "activity" && field.type == "Landroid/app/Activity;"
        }
        requirePizza(acceptedActivity >= 0 && create.calls("Landroid/app/Activity;", "isTaskRoot"),
            "accepted Games Activity initialization changed")
        create.addInstructions(acceptedActivity + 1,
            "invoke-static {p0}, Lcom/google/android/gms/internal/games_v2/zzbw;->zza(Landroid/content/Context;)V")
        init.removeInstruction(lateInitIndex)

        val resolutionOwner = "Lcom/google/android/gms/internal/games_v2/zzbq;"
        val resolution = pizzaMethod(resolutionOwner, "zzo", listOf(
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
        } ?: throw app.morphe.patcher.patch.PatchException("Pizza Games resolution entry changed")
        val tag = resolutionCode.single {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "GamesApiManager"
        } as OneRegisterInstruction
        val boundary = resolutionCode.take(start).sumOf { it.codeUnits }
        requirePizza(start > 2 && resolution.hasString("com.google.android.gms.version") &&
            resolution.hasString("PlayStore is not installed") &&
            resolution.calls("Lcom/google/android/gms/games/internal/v2/resolution/a;", "a") &&
            resolution.implementation!!.tryBlocks.all { it.startCodeAddress + it.codeUnitCount <= boundary },
            "legacy Play Store resolution probe changed")

        // The returned PendingIntent belongs to the selected Games service. The
        // stock GMS/Play Store version probe only predicts Play Games installation
        // behavior and cannot describe MicroG. Keep the main-thread check, actual
        // resolution launch, cancellation, retries and service authentication.
        val resolvedCode = MutableMethodImplementation(resolution.implementation!!)
        repeat(start - 2) { resolvedCode.removeInstruction(2) }
        resolvedCode.addInstruction(2, BuilderInstruction21c(Opcode.CONST_STRING, tag.registerA,
            ImmutableStringReference("GamesApiManager")))
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
        // Preserve the actual package-manager check and its failure handling.
        // MicroG hosts Games itself; the separate Play Games app is unnecessary.
        val instructions = installed.implementation!!.instructions.toList()
        instructions.forEachIndexed { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference
            if (reference?.string == "com.google.android.play.games") {
                val register = (instruction as OneRegisterInstruction).registerA
                installed.replaceInstruction(index,
                    BuilderInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(MICROG)))
            }
        }
    }
}
