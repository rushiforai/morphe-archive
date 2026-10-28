package app.template.patches.niagara.weather

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal const val NIAGARA_WEATHER_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/niagara/NiagaraWeather;"

internal const val WEATHERKIT_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/niagara/WeatherKitExtension;"

internal const val WEATHER_APP_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/niagara/WeatherAppExtension;"

/**
 * The weather manager's refresh. Its class is the weather manager.
 */
internal val fetchWeatherFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("location missing")
)

/**
 * Parses a server response.
 */
internal val decodeWeatherFingerprint = Fingerprint(
    classFingerprint = fetchWeatherFingerprint,
    parameters = listOf("Ljava/lang/String;", "J")
)

/**
 * Caches a server response for startup.
 */
internal val saveResponseFingerprint = Fingerprint(
    classFingerprint = fetchWeatherFingerprint,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("weather2")
)

/**
 * The weather location class, built from a [android.location.Location].
 */
internal val weatherLocationFingerprint = Fingerprint(
    name = "<init>",
    parameters = listOf("Landroid/location/Location;"),
    custom = { _, classDef ->
        classDef.fields.count { it.type == "F" && !AccessFlags.STATIC.isSet(it.accessFlags) } == 2
    }
)

/**
 * `(latitude, longitude)` constructor.
 */
internal val weatherLocationCoordinatesFingerprint = Fingerprint(
    classFingerprint = weatherLocationFingerprint,
    name = "<init>",
    parameters = listOf("F", "F")
)

/**
 * The server fetch: one case of a coroutine class shared by several.
 */
internal val fetchFromServerFingerprint = Fingerprint(
    strings = listOf("st missing")
)

/**
 * `(manager, location, language, continuation, selector)` constructor.
 */
internal val fetchFromServerConstructorFingerprint = Fingerprint(
    classFingerprint = fetchFromServerFingerprint,
    name = "<init>",
    custom = { method, _ ->
        method.parameterTypes.size == 5 &&
            method.parameterTypes.take(3).all { it == "Ljava/lang/Object;" } &&
            method.parameterTypes.last() == "I"
    }
)

/**
 * The forecast's long press, which opens OpenWeather.
 */
internal val openWeatherAppFingerprint = Fingerprint(
    strings = listOf("uk.co.openweather.MainActivity")
)

private fun extensionMethodFingerprint(name: String) = Fingerprint(
    name = name,
    custom = { _, classDef -> classDef.type == NIAGARA_WEATHER_CLASS_DESCRIPTOR }
)

// NiagaraWeather placeholders.
internal val extensionFetchFromSourceFingerprint = extensionMethodFingerprint("fetchFromSource")
internal val extensionDecodeFingerprint = extensionMethodFingerprint("decode")
internal val extensionSaveResponseFingerprint = extensionMethodFingerprint("saveResponse")
internal val extensionLatitudeFingerprint = extensionMethodFingerprint("latitude")
internal val extensionLongitudeFingerprint = extensionMethodFingerprint("longitude")

private fun credentialFingerprint(name: String) = Fingerprint(
    name = name,
    custom = { _, classDef -> classDef.type == WEATHERKIT_CLASS_DESCRIPTOR }
)

// WeatherKitExtension credential placeholders.
internal val teamIdFingerprint = credentialFingerprint("teamId")
internal val keyIdFingerprint = credentialFingerprint("keyId")
internal val servicesIdFingerprint = credentialFingerprint("servicesId")
internal val privateKeyFingerprint = credentialFingerprint("privateKeyBase64")
