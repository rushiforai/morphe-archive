package dev.personal.patches.weather

import com.google.gson.JsonParser
import kotlinx.datetime.LocalDateTime
import java.io.File
import java.net.URI

/** Reproduces MorpheAsset.createdAt parsing against the actual generated source manifest. */
fun main(args: Array<String>) {
    check(runCatching {
        LocalDateTime.parse("2026-10-31T18:51:32.222710500Z")
    }.isFailure) { "The fixture should reproduce the rejected original timestamp." }
    val manifest = JsonParser.parseString(File(args.single()).readText()).asJsonObject
    val timestamp = manifest.get("created_at").asString
    val parsed = LocalDateTime.parse(timestamp)
    check(parsed.year >= 2026)
    check(!timestamp.endsWith("Z"))
    val version = manifest.get("version").asString
    check(version.isNotBlank())
    val uri = URI(manifest.get("download_url").asString)
    check(uri.scheme == "https" && uri.host == "gitlab.com")
    val releasePath = "/rokuOP/personal-niagara-weather/-/releases/v$version/downloads/patches-$version.mpp"
    val legacyPath = "/rokuOP/personal-niagara-weather/-/raw/main/bundles/patches-$version.mpp"
    check(uri.path == releasePath || (version == "1.0.2" && uri.path == legacyPath))
    System.getenv("SOURCE_RELEASE_VERSION")?.let { expected ->
        check(version == expected && uri.path == releasePath) { "Release metadata/version mismatch" }
    }
    check(manifest.get("description").asString.isNotBlank())
    println("Morphe source metadata accepted: version=$version created_at=$parsed")
}
