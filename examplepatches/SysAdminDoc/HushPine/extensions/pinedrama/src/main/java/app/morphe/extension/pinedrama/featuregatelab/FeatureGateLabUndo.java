/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.pinedrama.featuregatelab;

import android.util.AtomicFile;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.settings.SettingsJson;
import app.morphe.extension.pinedrama.settings.L10n;
import app.morphe.extension.pinedrama.settings.SettingsBackup;
import app.morphe.extension.pinedrama.settings.SettingsOperationJournal;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

/** Worker-thread recovery for resets and imports; unrelated patch settings are untouched. */
final class FeatureGateLabUndo {
    private static Runnable observationsUndo;

    /** One Undo snapshot shared by a burst of ordered edits from one detail screen. */
    static final class UndoBaseline {
        private String settingsJson;
    }

    private FeatureGateLabUndo() {}

    static synchronized void resetForTests() {
        observationsUndo = null;
    }

    /** @return whether this reset wrote an undo snapshot. */
    static synchronized boolean reset(boolean allData) throws Exception {
        if (allData && FeatureGateLabStore.storedRuleCount() > FeatureGateLabStore.MAX_RULES) {
            FeatureGateLabStore.clearAllLabDataWithoutParsing();
            observationsUndo = null;
            discardUndoAfterRecovery();
            return false;
        }
        replace(List.of(), !allData && FeatureGateLabStore.masterEnabled(),
                !allData && FeatureGateLabStore.warningAcknowledged(), allData);
        return true;
    }

    static synchronized void setMasterEnabled(boolean enabled) throws Exception {
        replace(new ArrayList<>(FeatureGateLabStore.rules()), enabled,
                enabled || FeatureGateLabStore.warningAcknowledged(), false);
    }

    static synchronized void saveRule(String manager, String key, String type, String value,
            boolean enabled) throws Exception {
        saveRule(manager, key, type, value, enabled, null);
    }

    static synchronized void saveRule(String manager, String key, String type, String value,
            boolean enabled, UndoBaseline undoBaseline) throws Exception {
        String id = FeatureGateLabStore.idFor(manager, key, type);
        List<FeatureGateLabStore.Rule> next = new ArrayList<>();
        boolean replaced = false;
        for (FeatureGateLabStore.Rule rule : FeatureGateLabStore.rules()) {
            if (rule.id.equals(id)) {
                next.add(new FeatureGateLabStore.Rule(id, manager, key,
                        FeatureGateLabStore.normalizeType(type), value, enabled,
                        System.currentTimeMillis()));
                replaced = true;
            } else {
                next.add(rule);
            }
        }
        if (!replaced) {
            next.add(new FeatureGateLabStore.Rule(id, manager, key,
                    FeatureGateLabStore.normalizeType(type), value, enabled,
                    System.currentTimeMillis()));
        }
        replace(next, FeatureGateLabStore.masterEnabled(),
                FeatureGateLabStore.warningAcknowledged(), false, undoBaseline);
    }

    /**
     * Forces a whole selection to one boolean value, in one operation.
     *
     * <p>Every gate in {@code gates} that the Lab can force a boolean on gets a rule saying so,
     * replacing whatever rule it had. One journal entry covers all of them and one undo puts them
     * all back, which is the point: a selection half applied is worse than one not applied, and
     * the single-gate path repeated N times gives N of each.
     *
     * @return how many gates were written. Anything in the selection the Lab cannot force a
     *         boolean on is skipped, so a caller can say so.
     */
    static synchronized int forceBoolean(List<FeatureGateCatalog.Entry> gates, boolean value)
            throws Exception {
        var merged = new LinkedHashMap<String, FeatureGateLabStore.Rule>();
        for (var rule : FeatureGateLabStore.rules()) merged.put(rule.id, rule);
        int written = 0;
        long now = System.currentTimeMillis();
        for (FeatureGateCatalog.Entry gate : gates) {
            String type = FeatureGateLabStore.normalizeType(gate.type);
            if (!"BOOLEAN".equals(type)
                    || !FeatureGateLabStore.supportsOverride(gate.manager, gate.type)) {
                continue;
            }
            String id = FeatureGateLabStore.idFor(gate.manager, gate.key, type);
            merged.put(id, new FeatureGateLabStore.Rule(id, gate.manager, gate.key, type,
                    String.valueOf(value), true, now));
            written++;
        }
        if (written == 0) return 0;
        replace(new ArrayList<>(merged.values()), FeatureGateLabStore.masterEnabled(),
                FeatureGateLabStore.warningAcknowledged(), false);
        return written;
    }

    /**
     * Drops the rules for a whole selection, in one operation.
     *
     * @return how many rules were there to drop.
     */
    static synchronized int resetAll(List<FeatureGateCatalog.Entry> gates) throws Exception {
        var wanted = new LinkedHashMap<String, Boolean>();
        for (FeatureGateCatalog.Entry gate : gates) {
            wanted.put(FeatureGateLabStore.idFor(gate.manager, gate.key,
                    FeatureGateLabStore.normalizeType(gate.type)), Boolean.TRUE);
        }
        List<FeatureGateLabStore.Rule> next = new ArrayList<>();
        int dropped = 0;
        for (FeatureGateLabStore.Rule rule : FeatureGateLabStore.rules()) {
            if (wanted.containsKey(rule.id)) dropped++;
            else next.add(rule);
        }
        if (dropped == 0) return 0;
        replace(next, FeatureGateLabStore.masterEnabled(),
                FeatureGateLabStore.warningAcknowledged(), false);
        return dropped;
    }

    static synchronized void deleteRule(String manager, String key, String type) throws Exception {
        deleteRule(manager, key, type, null);
    }

    static synchronized void deleteRule(String manager, String key, String type,
            UndoBaseline undoBaseline) throws Exception {
        String id = FeatureGateLabStore.idFor(manager, key, type);
        List<FeatureGateLabStore.Rule> next = new ArrayList<>();
        for (FeatureGateLabStore.Rule rule : FeatureGateLabStore.rules()) {
            if (!rule.id.equals(id)) next.add(rule);
        }
        replace(next, FeatureGateLabStore.masterEnabled(),
                FeatureGateLabStore.warningAcknowledged(), false, undoBaseline);
    }

    static synchronized void importRules(FeatureGateLabStore.ImportReview review) throws Exception {
        importRules(review, false);
    }

    static synchronized void applyPreset(String build, String id,
            java.util.Map<String, FeatureGateCatalog.Entry> catalog) throws Exception {
        // Recheck after the preview, before taking an undo snapshot or changing any rule.
        importRules(FeatureGateLabStore.reviewPreset(build, id, catalog), true);
    }

    private static void importRules(FeatureGateLabStore.ImportReview review, boolean enabled)
            throws Exception {
        if (review.accepted.isEmpty()) return;
        var merged = new LinkedHashMap<String, FeatureGateLabStore.Rule>();
        for (var rule : FeatureGateLabStore.rules()) merged.put(rule.id, rule);
        for (var rule : review.accepted) {
            merged.put(rule.id, new FeatureGateLabStore.Rule(rule.id, rule.manager, rule.key,
                    rule.type, rule.value, enabled, rule.updatedAtMs));
        }
        replace(new ArrayList<>(merged.values()), FeatureGateLabStore.masterEnabled(),
                FeatureGateLabStore.warningAcknowledged(), false);
    }

    private static void replace(List<FeatureGateLabStore.Rule> rules, boolean master,
            boolean acknowledged, boolean clearObservations) throws Exception {
        replace(rules, master, acknowledged, clearObservations, null);
    }

    private static void replace(List<FeatureGateLabStore.Rule> rules, boolean master,
            boolean acknowledged, boolean clearObservations, UndoBaseline undoBaseline)
            throws Exception {
        FeatureGateLabStore.requireRuleLimit(rules);
        SettingsOperationJournal.Operation operation = SettingsOperationJournal.acquire(Utils.getContext());
        boolean closed = false;
        try {
            JSONObject before = FeatureGateLabStore.exportSettings();
            FeatureGateLabStore.parseSettings(before);
            Runnable observations = clearObservations ? SettingsManagerObservationRecorder.checkpoint() : null;
            AtomicFile file = file();
            String beforeText = before.toString();
            String undoText = beforeText;
            if (undoBaseline != null) {
                if (undoBaseline.settingsJson == null) {
                    undoBaseline.settingsJson = beforeText;
                }
                undoText = undoBaseline.settingsJson;
            }
            writeUndo(file, undoText);
            operation.recordLab(
                    beforeText, replacement(rules, master, acknowledged).toString());
            observationsUndo = observations;
            try {
                FeatureGateLabStore.replaceSettings(rules, master, acknowledged);
                if (clearObservations) SettingsManagerObservationRecorder.clear();
                operation.complete();
                closed = true;
            } catch (Exception error) {
                try { apply(before, true); } catch (Exception recovery) { error.addSuppressed(recovery); }
                boolean rollbackComplete = matches(before);
                if (rollbackComplete) operation.complete();
                else operation.retainForRecovery();
                closed = true;
                throw error;
            }
        } finally {
            if (!closed) operation.abort();
        }
    }

    /**
     * Whether there is anything to undo.
     *
     * <p>The menu offered Undo whether or not there was, and the only way to find out was to
     * press it and be told off. Same answer as the check inside {@link #undo()}, asked before
     * the item is drawn rather than after it is tapped.
     */
    static synchronized boolean canUndo() {
        try {
            AtomicFile undoFile = file();
            return undoFile.getBaseFile().isFile()
                    || new File(undoFile.getBaseFile().getPath() + ".bak").isFile();
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not tell whether there is a Lab change to undo", ex);
            // A menu item that might work beats one that is wrongly greyed out: the tap still
            // ends in the same check, which says so properly.
            return true;
        }
    }

    static synchronized void undo() throws Exception {
        // Asked before the journal is taken: with nothing to undo the file is simply absent,
        // and the reader was shown the private path of a file that does not exist.
        AtomicFile undoFile = file();
        if (!undoFile.getBaseFile().isFile()
                && !new File(undoFile.getBaseFile().getPath() + ".bak").isFile()) {
            throw new IllegalStateException(
                    L10n.t(Utils.getContext(), "There is no Lab change to undo."));
        }
        SettingsOperationJournal.Operation operation = SettingsOperationJournal.acquire(Utils.getContext());
        boolean closed = false;
        try {
            JSONObject saved;
            try (var input = file().openRead()) {
                saved = SettingsJson.parseObject(SettingsBackup.read(input));
                FeatureGateLabStore.parseSettings(saved);
            }
            JSONObject before = FeatureGateLabStore.exportSettings();
            operation.recordLab(before.toString(), saved.toString());
            try {
                apply(saved, false);
                operation.complete();
                closed = true;
            } catch (Exception error) {
                try { apply(before, true); } catch (Exception recovery) { error.addSuppressed(recovery); }
                boolean rollbackComplete = matches(before);
                if (rollbackComplete) operation.complete();
                else operation.retainForRecovery();
                closed = true;
                throw error;
            }
            if (observationsUndo != null) observationsUndo.run();
        } finally {
            if (!closed) operation.abort();
        }
    }

    private static void writeUndo(AtomicFile file, String text) throws Exception {
        byte[] bytes = text.getBytes(StandardCharsets.UTF_8);
        if (bytes.length > 2 * 1024 * 1024) throw new IOException("Lab undo copy exceeds 2 MB");
        FileOutputStream output = null;
        try {
            output = file.startWrite();
            output.write(bytes);
            file.finishWrite(output);
        } catch (Exception error) {
            if (output != null) file.failWrite(output);
            throw error;
        }
        try (var input = file.openRead()) {
            if (!text.equals(SettingsBackup.read(input))) throw new IOException("Could not verify Lab undo copy");
        }
    }

    /**
     * A settings restore, reset or undo rewrote the Lab. This copy still held the rules from
     * before the Lab's own last change, and pressed after the restore it took back every rule
     * the restore had written. The settings Undo carries the Lab half instead, and gives this
     * copy back from the one {@link #holdForSettingsUndo} kept.
     */
    static synchronized void discardAfterSettingsChange() {
        try {
            file().delete();
        } catch (Exception error) {
            Logger.printException(() -> "Could not discard the Lab undo a settings change replaced", error);
        }
    }

    /**
     * Keeps this copy beside the settings' undo copy, written with it, so the two belong to the
     * same moment. A restore that goes on to rewrite the Lab discards this copy, and the settings'
     * Undo that puts the Lab back gives it back through {@link #swapWithSettingsUndo}.
     */
    static synchronized void holdForSettingsUndo() {
        try {
            String current = readIfPresent(file());
            AtomicFile held = heldFile();
            if (current == null) held.delete();
            else writeUndo(held, current);
        } catch (Exception error) {
            Logger.printException(() -> "Could not keep the Lab undo for the settings Undo", error);
            // A held copy left from an earlier restore would come back with this one's Undo.
            discardHeld();
        }
    }

    /**
     * After the settings' Undo put the Lab back: the copy held with it comes back, and the one it
     * replaces waits beside the new settings undo copy, so a second Undo swaps them again.
     */
    static synchronized void swapWithSettingsUndo() {
        try {
            AtomicFile current = file();
            AtomicFile held = heldFile();
            String now = readIfPresent(current);
            String kept = readIfPresent(held);
            if (now == null) held.delete();
            else writeUndo(held, now);
            if (kept == null) current.delete();
            else writeUndo(current, kept);
        } catch (Exception error) {
            Logger.printException(() -> "Could not bring the Lab undo back with the settings Undo", error);
            // Half swapped, either copy may belong to the other side of the Undo.
            discardAfterSettingsChange();
            discardHeld();
        }
    }

    private static void discardHeld() {
        try {
            heldFile().delete();
        } catch (Exception error) {
            Logger.printException(() -> "Could not discard the held Lab undo", error);
        }
    }

    private static String readIfPresent(AtomicFile file) throws Exception {
        if (!file.getBaseFile().isFile() && !new File(file.getBaseFile().getPath() + ".bak").isFile()) {
            return null;
        }
        try (var input = file.openRead()) {
            return SettingsBackup.read(input);
        }
    }

    private static void discardUndoAfterRecovery() {
        try {
            file().delete();
        } catch (Exception error) {
            Logger.printException(() -> "Could not discard the stale Lab undo after recovery", error);
        }
    }

    private static JSONObject replacement(List<FeatureGateLabStore.Rule> rules, boolean master,
            boolean acknowledged) throws Exception {
        JSONObject root = new JSONObject().put("schema", 1).put("target", "TikTok global")
                .put("tiktok_version", FeatureGateLabStore.targetVersion());
        JSONArray items = new JSONArray();
        for (FeatureGateLabStore.Rule rule : rules) {
            items.put(new JSONObject().put("manager", rule.manager).put("key", rule.key)
                    .put("type", rule.type).put("value", rule.value).put("force", rule.enabled));
        }
        return root.put("rules", items).put("master", master).put("acknowledged", acknowledged);
    }

    private static boolean matches(JSONObject expected) {
        return FeatureGateLabStore.settingsMatch(expected);
    }

    private static void apply(JSONObject saved, boolean puttingBack) throws Exception {
        FeatureGateLabStore.replaceSettings(FeatureGateLabStore.parseSettings(saved),
                saved.getBoolean("master"), saved.getBoolean("acknowledged"), puttingBack);
    }

    private static AtomicFile file() throws IOException {
        return file("feature-gate-lab-undo.json");
    }

    private static AtomicFile heldFile() throws IOException {
        return file("feature-gate-lab-undo-held.json");
    }

    private static AtomicFile file(String name) throws IOException {
        if (Utils.getContext() == null) throw new IOException("Lab storage unavailable");
        File directory = Utils.getContext().getFilesDir();
        if (directory == null || !directory.isDirectory()) {
            throw new IOException("Lab storage directory is unavailable");
        }
        return new AtomicFile(new File(directory, name));
    }
}
