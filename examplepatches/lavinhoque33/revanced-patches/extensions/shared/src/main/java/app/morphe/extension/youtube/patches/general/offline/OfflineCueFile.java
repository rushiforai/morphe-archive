/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-05.
 */
package app.morphe.extension.youtube.patches.general.offline;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/** Cue data is read once on the player's worker, never rewritten with resume-position metadata. */
final class OfflineCueFile {
    private String fileName;
    private List<OfflineSubtitle.Cue> cached;

    OfflineCueFile(List<OfflineSubtitle.Cue> cues) {
        cached = List.copyOf(cues);
        fileName = "";
    }

    private OfflineCueFile(String fileName, List<OfflineSubtitle.Cue> inline) {
        this.fileName = fileName.matches("[a-f0-9-]+\\.json") ? fileName : "";
        cached = inline;
    }

    static OfflineCueFile fromJson(JSONObject json) {
        JSONArray inline = json.optJSONArray("cues");
        return new OfflineCueFile(json.optString("cueFile"), inline == null ? null : parse(inline));
    }

    synchronized String store(File directory) throws IOException {
        if (!fileName.isEmpty() || cached == null || cached.isEmpty()) return fileName;
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Could not create cue directory");
        String name = UUID.randomUUID() + ".json";
        File temporary = new File(directory, name + ".tmp");
        try {
            Files.write(temporary.toPath(), encode(cached).toString().getBytes(StandardCharsets.UTF_8));
            if (!temporary.renameTo(new File(directory, name))) throw new IOException("Could not save cue file");
            fileName = name;
        } finally {
            temporary.delete();
        }
        return fileName;
    }

    synchronized List<OfflineSubtitle.Cue> load(File directory) throws Exception {
        if (cached == null) {
            cached = fileName.isEmpty() ? List.of() : parse(new JSONArray(
                    new String(Files.readAllBytes(new File(directory, fileName).toPath()), StandardCharsets.UTF_8)));
        }
        return cached;
    }

    synchronized void delete(File directory) {
        if (!fileName.isEmpty()) new File(directory, fileName).delete();
    }

    private static JSONArray encode(List<OfflineSubtitle.Cue> cues) {
        JSONArray result = new JSONArray();
        for (OfflineSubtitle.Cue cue : cues) {
            result.put(new JSONArray().put(cue.startMs()).put(cue.endMs()).put(cue.text()));
        }
        return result;
    }

    private static List<OfflineSubtitle.Cue> parse(JSONArray array) {
        List<OfflineSubtitle.Cue> cues = new ArrayList<>();
        long previousEnd = 0;
        for (int index = 0; index < array.length(); index++) {
            JSONArray cue = array.optJSONArray(index);
            if (cue == null) continue;
            long start = cue.optLong(0, -1);
            long end = cue.optLong(1, -1);
            String text = cue.optString(2, "");
            if (start >= previousEnd && end > start && !text.isEmpty()) {
                cues.add(new OfflineSubtitle.Cue(start, end, text));
                previousEnd = end;
            }
        }
        return List.copyOf(cues);
    }
}
