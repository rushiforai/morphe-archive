package app.d0nj.patches.niagara

import app.d0nj.patches.niagara.Constants.COMPATIBILITY_NIAGARA
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val ADAPTER_OPEN_METEO = "Lapp/d0nj/extension/niagara/OpenMeteoWeather;"
private const val ADAPTER_BREEZY_WEATHER = "Lapp/d0nj/extension/niagara/BreezyWeather;"
private const val ADAPTER_MET_NORWAY = "Lapp/d0nj/extension/niagara/MetNorwayWeather;"
private const val PROVIDER_BREEZY_WEATHER = "breezy-weather"
private const val PROVIDER_MET_NORWAY = "met-norway"
private const val WEATHER_MODEL_PACKAGE = "Lbitpit/launcher/backend/weather/model/"
private val STORE_PARAMS = listOf("Ljava/lang/String;", "J")

@Suppress("unused")
val weatherProviderPatch = bytecodePatch(
    name = "Custom weather provider",
    description = "Serves the at-a-glance weather tile without a Niagara account, " +
        "using Open-Meteo, MET Norway or Breezy Weather. Breezy Weather needs version 6.1.0 or " +
        "newer with at least one location, and Niagara must be granted the \"Read Breezy Weather " +
        "data\" permission from Niagara's app info → Permissions screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NIAGARA)

    extendWith("extensions/extension.mpe")

    val weatherProviderOption by stringOption(
        key = "weatherProvider",
        default = "open-meteo",
        values = mapOf(
            "Open-Meteo" to "open-meteo",
            "MET Norway" to PROVIDER_MET_NORWAY,
            "Breezy Weather" to PROVIDER_BREEZY_WEATHER,
        ),
        title = "Weather provider",
        description = "Source for the at-a-glance tile's forecast. Open-Meteo and MET Norway " +
            "work out of the box. Breezy Weather reads your installed Breezy Weather app (6.1.0+, " +
            "at least one location) — grant Niagara the Breezy Weather read permission from " +
            "Niagara's app info → Permissions.",
        required = true,
    )

    dependsOn(
        resourcePatch {
            execute {
                if (weatherProviderOption != PROVIDER_BREEZY_WEATHER) return@execute

                document("AndroidManifest.xml").use { manifest ->
                    val root = manifest.documentElement

                    val hasPermission = manifest.getElementsByTagName("uses-permission")
                        .let { nodes ->
                            (0 until nodes.length).any { i ->
                                nodes.item(i).attributes?.getNamedItem("android:name")?.nodeValue ==
                                    "org.breezyweather.READ_PROVIDER"
                            }
                        }
                    if (!hasPermission) {
                        val permission = manifest.createElement("uses-permission")
                        permission.setAttribute("android:name", "org.breezyweather.READ_PROVIDER")
                        root.appendChild(permission)
                    }

                    val queries = manifest.getElementsByTagName("queries").item(0)
                        ?: manifest.createElement("queries").also { root.appendChild(it) }
                    val hasPackage = queries.childNodes
                        .let { nodes ->
                            (0 until nodes.length).any { i ->
                                (nodes.item(i) as? org.w3c.dom.Element)
                                    ?.getAttribute("android:name") == "org.breezyweather"
                            }
                        }
                    if (!hasPackage) {
                        val packageNode = manifest.createElement("package")
                        packageNode.setAttribute("android:name", "org.breezyweather")
                        queries.appendChild(packageNode)
                    }
                }
            }
        },
    )

    execute {
        val repository = weatherRepository()
            ?: throw PatchException("Could not locate the weather repository")
        val fetch = weatherFetchCoroutine(repository.type)
            ?: throw PatchException("Could not locate the Niagara weather fetch coroutine")

        val mutableClass = mutableClassDefBy(fetch.definingClass)
        val method = mutableClass.methods.first {
            it.name == fetch.name && it.parameterTypes == fetch.parameterTypes
        }

        val adapter = when (weatherProviderOption) {
            PROVIDER_BREEZY_WEATHER -> ADAPTER_BREEZY_WEATHER
            PROVIDER_MET_NORWAY -> ADAPTER_MET_NORWAY
            else -> ADAPTER_OPEN_METEO
        }
        redirectFetchToAdapter(repository, method, adapter)
    }
}

/** The repository: the class whose `(String, J)` method parses a `WeatherResponse`. */
private fun BytecodePatchContext.weatherRepository(): ClassDef? {
    var found: ClassDef? = null
    classDefForEach { classDef ->
        if (found != null) return@classDefForEach
        for (method in classDef.methods) {
            if (method.parameterTypes != STORE_PARAMS) continue
            if (!method.returnType.startsWith("L")) continue
            if (referencesWeatherModel(method)) {
                found = classDef
                break
            }
        }
    }
    return found
}

/**
 * The fetch coroutine: builds the `weather2` request with `lat`/`long` params and
 * hands the body to the repository's store method. Structural, so obfuscated
 * names may differ per release.
 */
private fun BytecodePatchContext.weatherFetchCoroutine(repositoryType: String): Method? {
    var match: Method? = null
    classDefForEach { classDef ->
        if (match != null) return@classDefForEach
        if (!classDef.type.startsWith("Lb/")) return@classDefForEach
        for (method in classDef.methods) {
            if (match != null) break
            val body = method.implementation?.instructions ?: continue

            val strings = body.filterIsInstance<ReferenceInstruction>()
                .mapNotNull { (it.reference as? StringReference)?.string }
            if (!strings.containsAll(listOf("weather2", "lat", "long"))) continue

            val callsStore = body.filterIsInstance<ReferenceInstruction>()
                .mapNotNull { it.reference as? MethodReference }
                .any { it.definingClass == repositoryType && it.parameterTypes == STORE_PARAMS }
            if (!callsStore) continue

            if (body.any { it.opcode == Opcode.PACKED_SWITCH }) {
                match = method
                break
            }
        }
    }
    return match
}

/**
 * Replaces the weather fetch's fall-through body with an adapter call that
 * feeds Niagara's own parse-and-store method.
 */
private fun BytecodePatchContext.redirectFetchToAdapter(repository: ClassDef, method: MutableMethod, adapter: String) {
    val repositoryType = repository.type
    val repositoryCapture = captureField(method, repositoryType)
        ?: throw PatchException("Weather repository field not found on ${method.definingClass}")

    val coordinatesField = repository.fields
        .firstOrNull { field ->
            field.type != "F" && classDefByOrNull(field.type)?.fields?.count { it.type == "F" } == 2
        }
        ?: throw PatchException("Weather coordinates field not found on $repositoryType")
    val coordinatesType = coordinatesField.type
    if (classDefByOrNull(coordinatesType)?.fields?.count { it.type == "F" }!! < 2) {
        throw PatchException("Weather coordinates lacks two floats")
    }

    val store = repository.methods.firstOrNull {
        it.parameterTypes == STORE_PARAMS && it.returnType.startsWith("L")
    } ?: throw PatchException("Weather store method not found")

    val coordinatesCapture = captureField(method, coordinatesType)
        ?: throw PatchException("Weather coordinates capture field not found on ${method.definingClass}")

    // Weather is the packed-switch fall-through; its body throws "st missing"
    // for accountless users before any network call, so the entry right after
    // the switch is the only seam that covers them. Injected code must stay
    // branch-free (VerifyError) and must not throw (fatal crash).
    val switchIndex = method.instructions.indexOfFirst { it.opcode == Opcode.PACKED_SWITCH }
    if (switchIndex < 0) throw PatchException("Weather dispatch packed-switch not found")

    val receiver = (method.instructions[repositoryCapture.first] as TwoRegisterInstruction).registerB

    method.addInstructions(
        switchIndex + 1,
        """
            iget-object v0, v$receiver, ${method.definingClass}->${repositoryCapture.second.name}:${repositoryCapture.second.type}
            check-cast v0, $repositoryType
            iget-object v1, v$receiver, ${method.definingClass}->${coordinatesCapture.second.name}:${coordinatesCapture.second.type}
            invoke-static {v1}, $adapter->forecast(Ljava/lang/Object;)Ljava/lang/String;
            move-result-object v1
            invoke-static {v1}, $adapter->requireForecast(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v1
            invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
            move-result-wide v3
            invoke-virtual {v0, v1, v3, v4}, $repositoryType->${store.name}(Ljava/lang/String;J)${store.returnType}
            move-result-object v0
            return-object v0
        """.trimIndent(),
    )
}

/** Capture: an Object field immediately check-cast to [type]; returns its instruction index and field. */
private fun captureField(method: MutableMethod, type: String): Pair<Int, FieldReference>? {
    val instructions = method.implementation?.instructions?.toList() ?: return null
    for (index in instructions.indices) {
        val field = (instructions[index] as? ReferenceInstruction)?.reference as? FieldReference ?: continue
        if (field.definingClass != method.definingClass) continue
        if (field.type != "Ljava/lang/Object;") continue
        val cast = (instructions.getOrNull(index + 1) as? ReferenceInstruction)?.reference as? TypeReference
        if (cast?.type == type) return index to field
    }
    return null
}

private fun referencesWeatherModel(method: Method): Boolean =
    method.implementation?.instructions
        ?.filterIsInstance<ReferenceInstruction>()
        ?.any { ref ->
            when (val r = ref.reference) {
                is MethodReference -> r.definingClass.startsWith(WEATHER_MODEL_PACKAGE)
                is TypeReference -> r.type.startsWith(WEATHER_MODEL_PACKAGE)
                is FieldReference -> r.definingClass.startsWith(WEATHER_MODEL_PACKAGE) ||
                    r.type.startsWith(WEATHER_MODEL_PACKAGE)
                else -> false
            }
        } == true
