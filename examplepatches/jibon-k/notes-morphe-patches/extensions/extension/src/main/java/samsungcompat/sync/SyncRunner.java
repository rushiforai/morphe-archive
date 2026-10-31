package samsungcompat.sync;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Runs one sync: read manifests, plan, act, publish. If any action fails nothing is published, and the
 * next run plans again from the same base.
 */
public final class SyncRunner {

    /** The replicated folder (Syncthing etc.). Payload writes must be atomic: complete or absent. */
    public interface SharedFolder {
        /** deviceId -> manifest JSON for every {@code devices/*.json}. */
        Map<String, String> readManifests() throws IOException;

        void writeManifest(String deviceId, String json) throws IOException;

        boolean hasPayload(String uuid, String hash);

        void writePayload(String uuid, String hash, PayloadWriter writer) throws IOException;

        InputStream openPayload(String uuid, String hash) throws IOException;
    }

    public interface PayloadWriter {
        void writeTo(OutputStream out) throws IOException;
    }

    /** This app's notes and private sync state. */
    public interface NoteStore {
        List<SyncPlanner.LocalNote> listNotes() throws IOException;

        /** Notes that exist locally but must not be synced (e.g. locked). */
        Set<String> excludedUuids() throws IOException;

        /**
         * Write the current file of {@code uuid}. Must throw if its content no longer has
         * {@code expectedHash} (edited since it was listed).
         */
        void exportContent(String uuid, String expectedHash, OutputStream out) throws IOException;

        /** Replace content and metadata of {@code target.uuid} (create it if missing). */
        void applyContent(NoteRecord target, InputStream payload) throws IOException;

        /** Metadata and trash state only; content is already {@code target.hash}. */
        void applyMetadata(NoteRecord target) throws IOException;

        /** New note {@code copy.uuid} with {@code payload} as content. */
        void createCopy(NoteRecord copy, InputStream payload) throws IOException;

        /** Manifest JSON of the last successful run, or null. */
        String readBase() throws IOException;

        void writeBase(String json) throws IOException;
    }

    public static final class Result {
        public final boolean success;
        public final SyncPlanner.Plan plan;
        public final List<String> warnings;
        public final Exception error;

        Result(boolean success, SyncPlanner.Plan plan, List<String> warnings, Exception error) {
            this.success = success;
            this.plan = plan;
            this.warnings = Collections.unmodifiableList(warnings);
            this.error = error;
        }
    }

    private final String deviceId;
    private final SyncPlanner planner;
    private final SharedFolder folder;
    private final NoteStore store;

    public SyncRunner(String deviceId, SyncPlanner planner, SharedFolder folder, NoteStore store) {
        this.deviceId = deviceId;
        this.planner = planner;
        this.folder = folder;
        this.store = store;
    }

    public Result run(long now) {
        List<String> warnings = new ArrayList<>();
        SyncPlanner.Plan plan = null;
        try {
            Manifest base = readBase(warnings);
            List<Manifest> remotes = new ArrayList<>();
            for (Map.Entry<String, String> e : folder.readManifests().entrySet()) {
                if (deviceId.equals(e.getKey())) continue;
                try {
                    Manifest m = Manifest.fromJson(e.getValue());
                    if (!e.getKey().equals(m.deviceId)) {
                        warnings.add("manifest " + e.getKey() + " names device " + m.deviceId + "; ignored");
                        continue;
                    }
                    remotes.add(m);
                } catch (IllegalArgumentException bad) {
                    // A newer app version or a half-synced file: skip that device this run.
                    warnings.add("manifest " + e.getKey() + " skipped: " + bad.getMessage());
                }
            }
            plan = planner.plan(base, store.listNotes(), store.excludedUuids(), remotes,
                folder::hasPayload, now);
            for (SyncPlanner.Action a : plan.actions) execute(a);
            String json = plan.manifest.toJson();
            folder.writeManifest(deviceId, json);
            store.writeBase(json);
            return new Result(true, plan, warnings, null);
        } catch (Exception e) {
            return new Result(false, plan, warnings, e);
        }
    }

    private Manifest readBase(List<String> warnings) throws IOException {
        String json = store.readBase();
        if (json == null) return Manifest.empty(deviceId);
        try {
            Manifest m = Manifest.fromJson(json);
            if (deviceId.equals(m.deviceId)) return m;
            warnings.add("base belongs to device " + m.deviceId + "; starting fresh");
        } catch (IllegalArgumentException bad) {
            warnings.add("base unreadable (" + bad.getMessage() + "); starting fresh");
        }
        // Without a base every note looks new; identical content still converges without copies.
        return Manifest.empty(deviceId);
    }

    private void execute(SyncPlanner.Action a) throws IOException {
        NoteRecord r = a.record;
        switch (a.type) {
            case PUBLISH:
                if (!folder.hasPayload(r.uuid, r.hash)) {
                    folder.writePayload(r.uuid, r.hash,
                        out -> store.exportContent(r.uuid, r.hash, out));
                }
                break;
            case APPLY:
                if (a.contentChanged) {
                    try (InputStream in = folder.openPayload(r.uuid, r.hash)) {
                        store.applyContent(r, in);
                    }
                } else {
                    store.applyMetadata(r);
                }
                break;
            case CREATE_COPY:
                try (InputStream in = folder.openPayload(a.sourceUuid, r.hash)) {
                    store.createCopy(r, in);
                }
                break;
            case WAIT:
            default:
                break;
        }
    }
}
