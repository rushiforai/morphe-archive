package app.template.patches.flightradar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.FLIGHTRADAR_COMPATIBILITY
import app.template.patches.shared.clearBody
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val OPEN_DATA = "Lapp/template/extension/extension/Fr24OpenData;"
private const val CLICKHANDLER = "Lcom/flightradar24free/models/clickhandler/"

// The primary constructor of the immutable panel model. Every path that builds the
// aircraft panel (gRPC stream and partial refreshes) ends in this constructor, so a
// hook before its return sees the fully assembled object.
val ClickhandlerDataConstructorFingerprint = Fingerprint(
    definingClass = "${CLICKHANDLER}ClickhandlerData;",
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(
        "${CLICKHANDLER}ClickhandlerAircraftInfo;",
        "${CLICKHANDLER}ClickhandlerScheduleInfo;",
        "${CLICKHANDLER}ClickhandlerFlightProgress;",
        "${CLICKHANDLER}ClickhandlerExtendedFlightInfo;",
        "Ljava/util/List;",
        "${CLICKHANDLER}MappedAirportsAndAirline;",
    ),
)

val OpenDataBaseUrlFingerprint = Fingerprint(
    definingClass = OPEN_DATA,
    name = "getDataBaseUrl",
    returnType = "Ljava/lang/String;",
)

val OpenDataAdsbApiUrlFingerprint = Fingerprint(
    definingClass = OPEN_DATA,
    name = "getAdsbApiUrl",
    returnType = "Ljava/lang/String;",
)

@Suppress("unused")
val flightradarOpenDataPatch = bytecodePatch(
    name = "Open data for premium fields",
    description = "Fills the aircraft panel fields that the Flightradar24 server withholds from " +
        "non-subscribers using open data: extended Mode S values (IAS, TAS, Mach, outside air " +
        "temperature, GPS altitude and wind) from the adsb.lol and adsb.fi public APIs, serial " +
        "number and aircraft age from the OpenSky Network aircraft database, and the flight " +
        "information region from VATSpy boundaries. The aircraft and FIR data are downloaded " +
        "once a month from a GitHub release. Values the server does send are never replaced.",
    default = true,
) {
    compatibleWith(FLIGHTRADAR_COMPATIBILITY)

    dependsOn(flightradarUnlockBusinessPatch)

    extendWith("extensions/extension.mpe")

    val openDataBaseUrl by stringOption(
        key = "openDataBaseUrl",
        default = "https://github.com/jagjordi/morphe-patches/releases/download/open-data/",
        title = "Open data bundle URL",
        description = "Base URL that serves aircraft.db.gz and firs.json.gz. Defaults to the " +
            "weekly build published as the open-data prerelease of jagjordi/morphe-patches.",
        required = false,
    )

    val adsbApiUrl by stringOption(
        key = "adsbApiUrl",
        default = "https://api.adsb.lol/v2/hex/",
        title = "ADS-B aggregator URL",
        description = "Base URL of a readsb style v2 API, queried as <url><hex>. Defaults to " +
            "api.adsb.lol; opendata.adsb.fi is tried as a fallback.",
        required = false,
    )

    execute {
        FR24ApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static {p0}, $OPEN_DATA->init(Ljava/lang/Object;)V",
        )

        ClickhandlerDataConstructorFingerprint.method.apply {
            val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            addInstruction(
                returnIndex,
                "invoke-static {p0}, $OPEN_DATA->enrich(Ljava/lang/Object;)V",
            )
        }

        openDataBaseUrl?.trim()?.takeIf { it.isNotEmpty() }?.let { url ->
            val normalized = if (url.endsWith("/")) url else "$url/"
            OpenDataBaseUrlFingerprint.method.apply {
                clearBody()
                addInstructions(0, "const-string v0, \"$normalized\"\nreturn-object v0")
            }
        }

        adsbApiUrl?.trim()?.takeIf { it.isNotEmpty() }?.let { url ->
            OpenDataAdsbApiUrlFingerprint.method.apply {
                clearBody()
                addInstructions(0, "const-string v0, \"$url\"\nreturn-object v0")
            }
        }
    }
}
