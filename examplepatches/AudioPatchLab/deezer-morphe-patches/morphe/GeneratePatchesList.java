import app.morphe.patcher.patch.Patch;
import app.morphe.patcher.patch.PatchKt;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Set;
import java.util.jar.JarFile;

/** Exports the published bundle using Morphe's PatchListGenerator JSON format.
 * Format reference: MorpheApp/morphe-patches-template,
 * patches/src/main/kotlin/util/PatchListGenerator.kt.
 * Run with JDK 21, Morphe Desktop 2.2.0 and Gson 2.13.2 on the classpath (see README).
 */
class GeneratePatchesList {
    private static final Gson GSON = new GsonBuilder()
            .serializeNulls().disableHtmlEscaping().setPrettyPrinting().create();

    private static JsonObject object(Object... fields) {
        var result = new JsonObject();
        for (int i = 0; i < fields.length; i += 2) {
            result.add((String) fields[i], GSON.toJsonTree(fields[i + 1]));
        }
        return result;
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 3) {
            throw new IllegalArgumentException(
                    "Usage: GeneratePatchesList.java bundle.mpp patches-bundle.json output.json");
        }
        var bundle = Path.of(args[0]);
        var source = JsonParser.parseString(Files.readString(Path.of(args[1]))).getAsJsonObject();
        String version;
        try (var jar = new JarFile(bundle.toFile())) {
            version = jar.getManifest().getMainAttributes().getValue("Version");
        }
        if (version == null || !version.equals(source.get("version").getAsString())) {
            throw new IllegalArgumentException("Bundle version differs from patches-bundle.json");
        }

        var patches = PatchKt.loadPatchesFromJar(Set.of(bundle.toFile()));
        var list = new JsonArray();
        var names = new HashSet<String>();
        for (var patch : patches.stream().sorted(Comparator.comparing(Patch::getName)).toList()) {
            if (patch.getName() == null || !names.add(patch.getName())) {
                throw new IllegalArgumentException("Missing or duplicate patch name");
            }
            JsonArray compatiblePackages = null;
            if (patch.getCompatibility() != null) {
                compatiblePackages = new JsonArray();
                for (var compatibility : patch.getCompatibility()) {
                    var targets = new JsonArray();
                    for (var target : compatibility.getTargets()) {
                        targets.add(object(
                                "version", target.getVersion(),
                                "versionCodes", target.getVersionCodes(),
                                "isExperimental", target.isExperimental(),
                                "minSdk", target.getMinSdk(),
                                "description", target.getDescription()));
                    }
                    compatiblePackages.add(object(
                            "packageName", compatibility.getPackageName(),
                            "name", compatibility.getName(),
                            "description", compatibility.getDescription(),
                            "apkFileType", compatibility.getApkFileType(),
                            "appIconColor", compatibility.getAppIconColor() == null ? null
                                    : "#%06X".formatted(compatibility.getAppIconColor()),
                            "signatures", compatibility.getSignatures(),
                            "formFactor", compatibility.getFormFactor(),
                            "targets", targets));
                }
            }
            var options = new JsonArray();
            for (var option : patch.getOptions().values()) {
                options.add(object(
                        "key", option.getKey(), "title", option.getTitle(),
                        "description", option.getDescription(), "required", option.getRequired(),
                        "type", option.getType().toString(), "default", option.getDefault(),
                        "values", option.getValues()));
            }
            list.add(object(
                    "name", patch.getName(), "description", patch.getDescription(),
                    "default", patch.getDefault(), "category", patch.getCategory(),
                    "compatiblePackages", compatiblePackages, "options", options));
        }
        if (list.isEmpty()) throw new IllegalArgumentException("The bundle contains no public patches");
        var result = object(
                "NOTE", "Generated from the published MPP by morphe/GeneratePatchesList.java. Do not edit manually.",
                "version", version, "patches", list);
        Files.writeString(Path.of(args[2]), GSON.toJson(result) + "\n");
        System.out.printf("Generated %s: %d patches, version %s%n", args[2], list.size(), version);
    }
}
