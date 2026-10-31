/* Copyright 2026 Hexclyde. SPDX-License-Identifier: GPL-3.0-or-later */
import app.morphe.patcher.patch.*;

import java.io.File;
import java.nio.file.*;
import java.util.*;
import java.util.jar.JarFile;

/** Dumps patch declarations from an MPP using Morphe's JAR loader. */
public final class ExportPatchList {
    static String json(Object value) {
        if (value == null) return "null";
        if (value instanceof Boolean || value instanceof Number) return value.toString();
        if (value instanceof Map<?, ?> map) {
            List<String> entries = new ArrayList<>();
            for (var entry : map.entrySet())
                entries.add(json(String.valueOf(entry.getKey())) + ":" + json(entry.getValue()));
            return "{" + String.join(",", entries) + "}";
        }
        if (value instanceof Iterable<?> list) {
            List<String> entries = new ArrayList<>();
            for (Object entry : list) entries.add(json(entry));
            return "[" + String.join(",", entries) + "]";
        }
        String text = String.valueOf(value);
        StringBuilder escaped = new StringBuilder("\"");
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (c == '\"' || c == '\\') escaped.append('\\').append(c);
            else if (c < 32) escaped.append(String.format("\\u%04x", (int) c));
            else escaped.append(c);
        }
        return escaped.append('"').toString();
    }

    static Map<String, Object> fields(Object... entries) {
        Map<String, Object> result = new LinkedHashMap<>();
        for (int i = 0; i < entries.length; i += 2) result.put((String) entries[i], entries[i + 1]);
        return result;
    }

    public static void main(String[] args) throws Exception {
        File bundle = new File(args[0]);
        String version;
        try (JarFile archive = new JarFile(bundle)) {
            version = archive.getManifest().getMainAttributes().getValue("Version");
        }
        List<Patch<?>> patches = new ArrayList<>(new PatchLoader.Jar(Set.of(bundle)));
        patches.removeIf(patch -> patch.getName() == null);
        patches.sort(Comparator.comparing(Patch::getName));
        List<Object> exported = new ArrayList<>();
        for (Patch<?> patch : patches) {
            List<Object> compatible = null;
            if (patch.getCompatibility() != null) {
                compatible = new ArrayList<>();
                for (Compatibility app : patch.getCompatibility()) {
                    List<Object> targets = new ArrayList<>();
                    for (AppTarget target : app.getTargets())
                        targets.add(
                                fields(
                                        "version",
                                        target.getVersion(),
                                        "versionCodes",
                                        target.getVersionCodes(),
                                        "isExperimental",
                                        target.isExperimental(),
                                        "minSdk",
                                        target.getMinSdk(),
                                        "description",
                                        target.getDescription()));
                    compatible.add(
                            fields(
                                    "packageName",
                                    app.getPackageName(),
                                    "name",
                                    app.getName(),
                                    "description",
                                    app.getDescription(),
                                    "apkFileType",
                                    app.getApkFileType(),
                                    "appIconColor",
                                    app.getAppIconColor() == null
                                            ? null
                                            : String.format("#%06X", app.getAppIconColor()),
                                    "signatures",
                                    app.getSignatures(),
                                    "formFactor",
                                    app.getFormFactor(),
                                    "targets",
                                    targets));
                }
            }
            List<Object> options = new ArrayList<>();
            for (Option<?> option : patch.getOptions().values())
                options.add(
                        fields(
                                "key",
                                option.getKey(),
                                "title",
                                option.getTitle(),
                                "description",
                                option.getDescription(),
                                "required",
                                option.getRequired(),
                                "type",
                                option.getType().toString(),
                                "default",
                                option.getDefault(),
                                "values",
                                option.getValues()));
            exported.add(
                    fields(
                            "name",
                            patch.getName(),
                            "description",
                            patch.getDescription(),
                            "default",
                            patch.getDefault(),
                            "category",
                            patch.getCategory(),
                            "compatiblePackages",
                            compatible,
                            "options",
                            options));
        }
        Files.writeString(
                Path.of(args[1]),
                json(
                                fields(
                                        "NOTE",
                                        "Generated from the verified MPP by"
                                            + " tools/prepare_mobile_source.py; do not hand-edit.",
                                        "version",
                                        version,
                                        "patches",
                                        exported))
                        + "\n");
    }
}
