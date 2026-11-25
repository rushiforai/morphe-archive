/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4896
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.youtube.patches.notifications;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.youtube.patches.utils.ProtoNode;

/** The inbox stores unread dots as entities outside the individual renderers. */
final class SeenEntities {
    private static final int ENTITY_STORE = 777;
    private static final int MUTATIONS = 1;
    private static final int MUTATION = 1;
    private static final int MUTATION_KEY = 1;
    private static final int MUTATION_TYPE = 2;
    private static final int MUTATION_PAYLOAD = 3;
    private static final int MUTATION_TYPE_REPLACE = 1;
    private static final int UNSEEN_ENTITY = 266;
    private static final int ENTITY_KEY = 1;
    private static final int ENTITY_UNSEEN = 2;
    private static final int KEY_ID = 2;
    private static final int KEY_TYPE = 4;
    private static final int KEY_PERSISTENCE = 5;

    @Nullable
    private final ProtoNode mutations;
    private final Map<String, Boolean> unseen = new LinkedHashMap<>();
    private final Map<String, Boolean> changes = new LinkedHashMap<>();

    SeenEntities(List<ProtoNode> response) {
        mutations = ProtoNode.field(ProtoNode.message(response, ENTITY_STORE), MUTATIONS);
        if (mutations == null || mutations.children == null) {
            return;
        }

        for (ProtoNode mutation : mutations.children) {
            if (mutation.getFieldNumber() != MUTATION || mutation.children == null) {
                continue;
            }
            List<ProtoNode> entity = ProtoNode.message(mutation.children, MUTATION_PAYLOAD, UNSEEN_ENTITY);
            ProtoNode key = ProtoNode.field(entity, ENTITY_KEY);
            if (key == null || !key.isText()) {
                continue;
            }
            ProtoNode value = ProtoNode.field(entity, ENTITY_UNSEEN);
            Long varint = value == null ? Long.valueOf(0) : value.getVarint();
            if (varint != null) {
                unseen.put(key.getText(), varint != 0);
            }
        }
    }

    boolean canAdd() {
        return mutations != null && mutations.isLengthDelimited()
                && (mutations.children != null || !mutations.hasPayload());
    }

    @Nullable
    Boolean isUnseen(@Nullable String key) {
        return key == null ? null : unseen.get(key);
    }

    void setUnseen(String key, boolean isUnseen) {
        if (Boolean.valueOf(isUnseen).equals(unseen.get(key))) {
            changes.remove(key);
        } else {
            changes.put(key, isUnseen);
        }
    }

    /** Appends replacements after server mutations so other entities are not disturbed. */
    void write() throws IOException {
        if (mutations == null || changes.isEmpty()) {
            return;
        }

        mutations.setPayload(ProtoNode.encode(output -> {
            if (mutations.children != null) {
                for (ProtoNode mutation : mutations.children) {
                    mutation.writeTo(output);
                }
            }
            for (Map.Entry<String, Boolean> change : changes.entrySet()) {
                output.writeByteArray(MUTATION, encodeMutation(change.getKey(), change.getValue()));
            }
        }));
    }

    private static byte[] encodeMutation(String key, boolean isUnseen) throws IOException {
        byte[] entity = ProtoNode.encode(output -> {
            output.writeString(ENTITY_KEY, key);
            output.writeBool(ENTITY_UNSEEN, isUnseen);
        });
        byte[] payload = ProtoNode.encode(output -> output.writeByteArray(UNSEEN_ENTITY, entity));
        return ProtoNode.encode(output -> {
            output.writeString(MUTATION_KEY, key);
            output.writeUInt32(MUTATION_TYPE, MUTATION_TYPE_REPLACE);
            output.writeByteArray(MUTATION_PAYLOAD, payload);
        });
    }

    static String key(long notificationId) throws IOException {
        byte[] key = ProtoNode.encode(output -> {
            // The entity's byte id is the UTF-8 unsigned decimal notification ID.
            output.writeString(KEY_ID, Long.toUnsignedString(notificationId));
            output.writeUInt32(KEY_TYPE, UNSEEN_ENTITY);
            output.writeUInt32(KEY_PERSISTENCE, 1);
        });
        // URL-safe Base64 uses only URI-safe characters except for its padding.
        return Base64.getUrlEncoder().encodeToString(key).replace("=", "%3D");
    }
}
