import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.Compatibility;
import app.morphe.patcher.patch.Option;
import app.morphe.patcher.patch.Patch;
import app.morphe.patcher.patch.PatchLoader;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * Regenerates patches-list.json from a built patch bundle (.mpp), using the same published shape
 * the repository documented for its inventory: stable targets win over experimental ones, and any
 * version-less target means "all versions" (null).
 *
 * Usage: java -cp "libs/morphe-cli.jar;libs/gson.jar" tools/bindings/Inventory.java \
 *            <patches.mpp> <version> [existingInventory.json] [output.json]
 *
 * With a single inventory argument it is rewritten in place, keeping its entry order where a patch
 * still exists and appending new patches in name order so the diff stays reviewable.
 */
public final class Inventory {
    public static void main(String[] args) throws Exception {
        if (args.length < 3) {
            System.err.println("usage: Inventory <patches.mpp> <version> <inventory.json> [output.json]");
            System.exit(2);
        }
        File bundle = new File(args[0]);
        String version = args[1];
        Path existing = Path.of(args[2]);
        Path output = args.length > 3 ? Path.of(args[3]) : existing;

        PatchLoader loader = new PatchLoader.Jar(Set.of(bundle));
        Map<String, JsonObject> byName = new LinkedHashMap<>();
        for (Patch patch : loader) {
            String name = patch.getName();
            if (name == null) continue;
            byName.put(name, describe(patch));
        }

        // Keep the previous file's order where a patch still exists so the diff stays reviewable,
        // then append everything new in name order.
        List<String> order = new ArrayList<>();
        if (Files.exists(existing)) {
            JsonObject old = com.google.gson.JsonParser.parseString(
                    Files.readString(existing, StandardCharsets.UTF_8)).getAsJsonObject();
            for (com.google.gson.JsonElement element : old.getAsJsonArray("patches")) {
                String name = element.getAsJsonObject().get("name").getAsString();
                if (byName.containsKey(name) && !order.contains(name)) order.add(name);
            }
        }
        for (String name : new TreeSet<>(byName.keySet())) {
            if (!order.contains(name)) order.add(name);
        }

        JsonArray patches = new JsonArray();
        for (String name : order) patches.add(byName.get(name));

        JsonObject inventory = new JsonObject();
        inventory.addProperty("version", version);
        inventory.add("patches", patches);

        Gson gson = new GsonBuilder()
                .serializeNulls()
                .disableHtmlEscaping()
                .setPrettyPrinting()
                .create();
        Files.writeString(output, gson.toJson(inventory) + "\n", StandardCharsets.UTF_8);
        System.out.println("Wrote " + order.size() + " patches to " + output);
    }

    private static JsonObject describe(Patch patch) {
        JsonObject entry = new JsonObject();
        entry.addProperty("name", patch.getName());
        entry.addProperty("description", patch.getDescription());
        entry.addProperty("use", patch.getDefault());

        JsonArray dependencies = new JsonArray();
        new TreeSet<>(dependencyNames(patch)).forEach(dependencies::add);
        entry.add("dependencies", dependencies);

        Map<String, Set<String>> packages = new LinkedHashMap<>();
        boolean anyPackage = false;
        if (patch.getCompatibility() != null) {
            for (Compatibility compatibility : patch.getCompatibility()) {
                String packageName = compatibility.getPackageName();
                if (packageName == null) continue;
                anyPackage = true;
                packages.put(packageName, publishedVersions(compatibility));
            }
        }
        if (!anyPackage) {
            entry.add("compatiblePackages", JsonNull.INSTANCE);
        } else {
            JsonObject compatible = new JsonObject();
            for (Map.Entry<String, Set<String>> packageEntry : packages.entrySet()) {
                if (packageEntry.getValue() == null) {
                    compatible.add(packageEntry.getKey(), JsonNull.INSTANCE);
                } else {
                    JsonArray versions = new JsonArray();
                    packageEntry.getValue().forEach(versions::add);
                    compatible.add(packageEntry.getKey(), versions);
                }
            }
            entry.add("compatiblePackages", compatible);
        }

        JsonArray options = new JsonArray();
        if (patch.getOptions() != null) {
            for (Option<?> option : patch.getOptions().values()) {
                JsonObject described = new JsonObject();
                described.addProperty("key", option.getKey());
                described.addProperty("title", option.getTitle());
                described.addProperty("description", option.getDescription());
                described.addProperty("required", option.getRequired());
                described.addProperty("type", String.valueOf(option.getType()));
                described.add("default", value(option.getDefault()));
                if (option.getValues() == null) {
                    described.add("values", JsonNull.INSTANCE);
                } else {
                    JsonObject values = new JsonObject();
                    for (Map.Entry<String, ?> value : option.getValues().entrySet()) {
                        values.add(value.getKey(), value(value.getValue()));
                    }
                    described.add("values", values);
                }
                options.add(described);
            }
        }
        entry.add("options", options);
        return entry;
    }

    private static com.google.gson.JsonElement value(Object raw) {
        if (raw == null) return JsonNull.INSTANCE;
        return com.google.gson.JsonParser.parseString(String.valueOf(new Gson().toJson(raw)));
    }

    private static Set<String> dependencyNames(Patch patch) {
        Set<String> names = new LinkedHashSet<>();
        if (patch.getDependencies() == null) return names;
        for (Patch dependency : patch.getDependencies()) {
            if (dependency.getName() != null) names.add(dependency.getName());
        }
        return names;
    }

    /** Stable targets win over experimental ones; no targets or a version-less one means all versions. */
    private static Set<String> publishedVersions(Compatibility compatibility) {
        List<AppTarget> targets = compatibility.getTargets();
        if (targets == null || targets.isEmpty()) return null;
        List<AppTarget> stable = new ArrayList<>();
        for (AppTarget target : targets) if (!target.isExperimental()) stable.add(target);
        List<AppTarget> listed = stable.isEmpty() ? targets : stable;
        Set<String> versions = new LinkedHashSet<>();
        for (AppTarget target : listed) {
            if (target.getVersion() == null) return null;
            versions.add(target.getVersion());
        }
        return versions;
    }
}
