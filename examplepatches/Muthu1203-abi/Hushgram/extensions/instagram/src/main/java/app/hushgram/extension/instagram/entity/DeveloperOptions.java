/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 * https://github.com/crimera/piko/commit/04987953674f98b3f302dc7a8da7492ae96b5267
 *
 * Modified for HushGram (Instagram), 2026.
 * See NOTICE for GPLv3 §7(b) attribution terms.
 */
package app.hushgram.extension.instagram.entity;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;

/** Reads the active Quick Experiment list from Instagram's internal MobileConfig classes. */
public final class DeveloperOptions {
    private static final String QUICK_EXPERIMENT_CLASS = "X.Sb1";
    private static final String EXPERIMENT_ITEM_CLASS = "X.BSw";
    private static volatile ExperimentNames cachedNames;
    private static volatile ExperimentNames recommendedNames;

    private static final class ExperimentNames {
        final Map<Integer, String> configs;
        final Map<Long, String> parameters;

        ExperimentNames(Map<Integer, String> configs, Map<Long, String> parameters) {
            this.configs = configs;
            this.parameters = parameters;
        }
    }

    private static Class<?> getQuickExperimentHelperClass() throws ClassNotFoundException {
        return Class.forName(QUICK_EXPERIMENT_CLASS);
    }

    private static Class<?> getExperimentItemHelperClass() throws ClassNotFoundException {
        return Class.forName(EXPERIMENT_ITEM_CLASS);
    }

    private List<?> getAllExperiments() throws Exception {
        Class<?> helper = getQuickExperimentHelperClass();
        Method method = helper.getDeclaredMethod("A06");
        method.setAccessible(true);
        return (List<?>) method.invoke(null);
    }

    private DeveloperOptionsItem getDeveloperOptionsItem(Object experimentItem) throws Exception {
        Class<?> helper = getExperimentItemHelperClass();
        long specifier = ((Number) getField(helper, experimentItem, "A00")).longValue();
        String paramName = (String) getField(helper, experimentItem, "A01");
        String universalName = (String) getField(helper, experimentItem, "A02");
        return new DeveloperOptionsItem(specifier, universalName, paramName);
    }

    private static Object getField(Class<?> owner, Object instance, String name) throws Exception {
        Field field = owner.getDeclaredField(name);
        field.setAccessible(true);
        return field.get(instance);
    }

    /** Finds a Quick Experiment parameter name by the numeric IDs shown in MetaConfig. */
    public static String parameterName(int config, int index, String fallback) {
        if (config < 0 || index < 0) return fallback;
        // Instagram sometimes supplies generated labels such as "_22" or a numeric ID. Treat
        // those as missing so the exact-ID JSON mapping gets a chance to provide the real name.
        if (usableLabel(fallback)) return fallback;
        String name;
        long key = ((long) config << 32) | (index & 0xffffffffL);
        name = recommendedNames().parameters.get(key);
        if (usableLabel(name)) return name;
        name = names().parameters.get(key);
        if (usableLabel(name)) return name;
        return fallback;
    }

    /** Finds a Quick Experiment config name by the numeric ID shown in MetaConfig. */
    public static String configName(int config, String fallback) {
        if (config < 0) return fallback;
        if (usableLabel(fallback)) return fallback;
        String name;
        name = recommendedNames().configs.get(config);
        if (usableLabel(name)) return name;
        name = names().configs.get(config);
        return usableLabel(name) ? name : fallback;
    }

    private static boolean usableLabel(String name) {
        return name != null && !name.trim().isEmpty() && !name.trim().matches("_?[0-9]+");
    }

    /** Rex IG Lite's curated 453 recommendations are labels only; exact numeric ID matches are used. */
    private static ExperimentNames recommendedNames() {
        ExperimentNames ready = recommendedNames;
        if (ready != null) return ready;
        synchronized (DeveloperOptions.class) {
            ready = recommendedNames;
            if (ready != null) return ready;
            Map<Integer, String> configs = new HashMap<>();
            Map<Long, String> parameters = new HashMap<>();
            try (InputStream stream = DeveloperOptions.class.getClassLoader().getResourceAsStream("rex_recommended_flags_v3.json")) {
                // Exact Instagram IDs are authoritative over the older curated recommendations.
                loadIdNameMapping(configs, parameters);
                if (stream != null) {
                    byte[] bytes = new byte[stream.available()];
                    int offset = 0;
                    while (offset < bytes.length) {
                        int count = stream.read(bytes, offset, bytes.length - offset);
                        if (count < 0) break;
                        offset += count;
                    }
                    JSONArray flags = new JSONArray(new String(bytes, 0, offset, StandardCharsets.UTF_8));
                    for (int i = 0; i < flags.length(); i++) {
                        JSONObject flag = flags.optJSONObject(i);
                        if (flag == null) continue;
                        String label = flag.optString("name", "").trim();
                        String codes = flag.optString("code", "");
                        if (label.isEmpty()) continue;
                        for (String code : codes.split(",")) {
                            String[] ids = code.trim().split("::", -1);
                            if (ids.length == 1) {
                                int config = Integer.parseInt(ids[0]);
                                if (config >= 0) configs.putIfAbsent(config, label);
                            } else if (ids.length == 2) {
                                int config = Integer.parseInt(ids[0]);
                                int index = Integer.parseInt(ids[1]);
                                if (config >= 0 && index >= 0) parameters.putIfAbsent(((long) config << 32) | (index & 0xffffffffL), label);
                            }
                        }
                    }
                }
            } catch (Exception e) {
                Logger.printException(() -> "Could not load recommended developer-option labels", e);
            }
            ready = new ExperimentNames(Collections.unmodifiableMap(configs), Collections.unmodifiableMap(parameters));
            recommendedNames = ready;
            return ready;
        }
    }

    private static ExperimentNames names() {
        ExperimentNames ready = cachedNames;
        if (ready != null) return ready;
        synchronized (DeveloperOptions.class) {
            ready = cachedNames;
            if (ready != null) return ready;
            Map<Integer, String> configs = new HashMap<>();
            Map<Long, String> parameters = new HashMap<>();
            try {
                DeveloperOptions reader = new DeveloperOptions();
                List<?> experiments = reader.getAllExperiments();
                if (experiments != null) {
                    for (Object experiment : experiments) {
                        DeveloperOptionsItem item = reader.getDeveloperOptionsItem(experiment);
                        int config = Integer.parseInt(item.getUniversalId());
                        int index = Integer.parseInt(item.getParamId());
                        if (config < 0 || index < 0) continue;
                        String configName = item.getUniversalName();
                        String parameterName = item.getParamName();
                        if (configName != null && !configName.trim().isEmpty()) configs.putIfAbsent(config, configName);
                        if (parameterName != null && !parameterName.trim().isEmpty()) {
                            parameters.putIfAbsent(((long) config << 32) | (index & 0xffffffffL), parameterName);
                        }
                    }
                }
            } catch (Exception e) {
                Logger.printException(() -> "Could not build Instagram developer-option names", e);
            }
            ready = new ExperimentNames(Collections.unmodifiableMap(configs), Collections.unmodifiableMap(parameters));
            cachedNames = ready;
            return ready;
        }
    }

    public JSONObject toJSONObject() {
        JSONObject mappings = new JSONObject();
        try {
            List<?> experiments = getAllExperiments();
            if (experiments == null) return mappings;
            for (Object item : experiments) {
                DeveloperOptionsItem option = getDeveloperOptionsItem(item);
                String universalId = option.getUniversalId();
                String paramId = option.getParamId();
                if (mappings.has(universalId)) {
                    mappings.accumulate(universalId, paramId);
                } else {
                    mappings.put(universalId, new JSONArray().put(paramId));
                }
            }
        } catch (Exception e) {
            Logger.printException(() -> "Could not extract Instagram developer option IDs", e);
        }
        return mappings;
    }

    /** Loads the supplied Instagram ID-to-name map: config:name:index:paramName[:index:paramName...]. */
    private static void loadIdNameMapping(Map<Integer, String> configs, Map<Long, String> parameters) throws Exception {
        android.content.Context context = Utils.getContext();
        java.io.File downloaded = context == null ? null
                : app.hushgram.extension.instagram.download.DeveloperFlagMapping.mappingFile(context);
        InputStream selected = downloaded != null && downloaded.isFile() && downloaded.length() > 10 * 1024
                ? new java.io.FileInputStream(downloaded)
                : DeveloperOptions.class.getClassLoader().getResourceAsStream("id_name_mapping.json");
        try (InputStream stream = selected) {
            if (stream == null) return;
            java.io.ByteArrayOutputStream output = new java.io.ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int count;
            while ((count = stream.read(buffer)) != -1) output.write(buffer, 0, count);
            JSONArray rows = new JSONArray(output.toString("UTF-8"));
            for (int i = 0; i < rows.length(); i++) {
                String row = rows.optString(i, "");
                String[] fields = row.split(":", -1);
                if (fields.length < 4 || fields.length % 2 != 0) continue;
                try {
                    int config = Integer.parseInt(fields[0]);
                    if (config < 0 || fields[1].trim().isEmpty()) continue;
                    configs.putIfAbsent(config, fields[1].trim());
                    for (int field = 2; field + 1 < fields.length; field += 2) {
                        int index = Integer.parseInt(fields[field]);
                        String name = fields[field + 1].trim();
                        if (index >= 0 && !name.isEmpty()) {
                            parameters.putIfAbsent(((long) config << 32) | (index & 0xffffffffL), name);
                        }
                    }
                } catch (NumberFormatException ignored) {
                    // Ignore malformed rows without preventing the other known labels from loading.
                }
            }
        }
    }

    @Override
    public String toString() {
        StringBuilder output = new StringBuilder("All Experiments\n=====================\n\n");
        try {
            List<?> experiments = getAllExperiments();
            if (experiments == null) return output.toString();
            Set<String> seenUniversalNames = new HashSet<>();
            for (Object item : experiments) {
                DeveloperOptionsItem option = getDeveloperOptionsItem(item);
                String universalName = option.getUniversalName();
                if (seenUniversalNames.add(universalName)) {
                    output.append("---------------------\nUniversal name: ")
                            .append(universalName).append("\n\n");
                }
                output.append("Param name: ").append(option.getParamName()).append('\n')
                        .append("Hex id: ").append(Long.toHexString(option.getMobileConfigSpecifier())).append('\n')
                        .append("Config id: ").append(option.getConfigId()).append("\n\n");
            }
        } catch (Exception e) {
            Logger.printException(() -> "Could not list Instagram developer options", e);
            output.append("Could not read Instagram's experiment list: ")
                    .append(e.getClass().getSimpleName()).append('\n');
        }
        return output.toString();
    }
}
