package app.template.patches.flightradar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.FLIGHTRADAR_COMPATIBILITY
import app.template.patches.shared.clearBody
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

private const val WEATHER = "Lapp/template/extension/extension/Fr24Weather;"
private const val URL_TILE_PROVIDER = "Lcom/google/android/gms/maps/model/UrlTileProvider;"

// The app has three UrlTileProvider subclasses. The weather one is the only one that
// requests 256 pixel tiles; the ATC boundary and navdata providers use 512.
private fun ClassDef.isWeatherTileProvider(): Boolean =
    superclass == URL_TILE_PROVIDER && methods.any { method ->
        method.name == "<init>" && method.implementation?.instructions?.any { instruction ->
            (instruction as? WideLiteralInstruction)?.wideLiteral == 256L
        } == true
    }

val WeatherTileProviderConstructorFingerprint = fingerprint {
    returns("V")
    parameters("Ljava/lang/String;")
    custom { method: Method, classDef: ClassDef ->
        method.name == "<init>" && classDef.isWeatherTileProvider()
    }
}

val WeatherTileProviderUrlFingerprint = fingerprint {
    returns("Ljava/net/URL;")
    parameters("I", "I", "I")
    custom { _: Method, classDef: ClassDef -> classDef.isWeatherTileProvider() }
}

// Parses the weather credential response into shared preferences and returns whether it
// succeeded. MainActivity only creates weather overlays at startup when it returns true.
val WeatherAuthParserFingerprint = fingerprint {
    returns("Z")
    parameters("Landroid/content/SharedPreferences;", "Ljava/lang/String;")
    strings("prefWxEndpoint", "prefWxLightningApiKey", "prefWxLightningApiSignature")
}

val WeatherRadarIndexUrlFingerprint = Fingerprint(
    definingClass = WEATHER,
    name = "getRadarIndexUrl",
    returnType = "Ljava/lang/String;",
)

@Suppress("unused")
val flightradarOpenWeatherPatch = bytecodePatch(
    name = "Open weather radar",
    description = "Draws the precipitation radar layers (global, North American and Australian) " +
        "from RainViewer's public radar tiles when Flightradar24 does not issue weather " +
        "credentials to the account. Layers that have no open source (satellite cloud, " +
        "forecast wind, icing, turbulence and lightning) are left as they are.",
    default = true,
) {
    compatibleWith(FLIGHTRADAR_COMPATIBILITY)

    dependsOn(flightradarUnlockBusinessPatch)

    extendWith("extensions/extension.mpe")

    val radarIndexUrl by stringOption(
        key = "radarIndexUrl",
        default = "https://api.rainviewer.com/public/weather-maps.json",
        title = "Radar index URL",
        description = "RainViewer weather maps index that lists the current radar frames.",
        required = false,
    )

    execute {
        WeatherTileProviderConstructorFingerprint.method.addInstructions(
            0,
            """
            invoke-static {p1}, $WEATHER->rewriteTemplate(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p1
            """.trimIndent(),
        )

        // The original body formats the template as TMS (flipped y) and caps zoom at 14.
        // The extension reproduces that for ordinary templates and serves RainViewer
        // tiles for the radar marker, so the whole body is replaced.
        WeatherTileProviderUrlFingerprint.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                invoke-static {p0, p1, p2, p3}, $WEATHER->tileUrl(Ljava/lang/Object;III)Ljava/net/URL;
                move-result-object v0
                return-object v0
                """.trimIndent(),
            )
        }

        WeatherAuthParserFingerprint.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                invoke-static {p0, p1}, $WEATHER->storeWeatherAuth(Ljava/lang/Object;Ljava/lang/String;)Z
                move-result v0
                return v0
                """.trimIndent(),
            )
        }

        radarIndexUrl?.trim()?.takeIf { it.isNotEmpty() }?.let { url ->
            WeatherRadarIndexUrlFingerprint.method.apply {
                clearBody()
                addInstructions(0, "const-string v0, \"$url\"\nreturn-object v0")
            }
        }
    }
}
