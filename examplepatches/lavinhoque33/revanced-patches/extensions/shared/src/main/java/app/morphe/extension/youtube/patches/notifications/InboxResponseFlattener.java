/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4896
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.youtube.patches.notifications;

import androidx.annotation.Nullable;

import com.google.protobuf.CodedOutputStream;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.youtube.patches.utils.ProtoNode;

/** Renders grouped video entries as ordinary video notification rows in their original section. */
public final class InboxResponseFlattener {
    private static final String GROUP_TEMPLATE_PREFIX = "expandable_inbox_notification.eml";
    private static final String ROW_TEMPLATE_PREFIX = "inbox_notification.eml";

    private static final int[] TEMPLATE_NAME = {1, 168777401, 3, 172035250};
    private static final int[] ROW_MODEL = {1, 168777401, 5, 363936123};
    private static final int[] GROUP_MODEL = {1, 168777401, 5, 457625295};
    private static final int[] NOTIFICATION_ID = {7, 169495254, 78414307, 1, 2, 14, 1};
    private static final int[][] VIDEO_IDS = {
            {5, 169495254, 48687757},
            {5, 169495254, 139608561},
    };

    private static final int MODEL = 1;
    private static final int GROUP_ENTRY = 1;
    private static final int GROUP_HEADER = 6;
    private static final int SEEN = 1;
    private static final int AVATAR = 2;
    private static final int TEXTS = 3;
    private static final int CHANNEL_NAME = 4;
    private static final int ENTITY_KEYS = 15;
    private static final int SEEN_ENTITY_KEY = 1;
    private static final int MAX_ITEM_DEPTH = 8;

    /** Returns the original array when the response has no safely replaceable groups. */
    public static byte[] flatten(byte[] body) throws IOException {
        List<ProtoNode> root = ProtoNode.parse(body);
        if (root == null) {
            return body;
        }

        List<ProtoNode> allElements = new ArrayList<>();
        collectElements(root, allElements);
        List<ProtoNode> groups = new ArrayList<>();
        List<ProtoNode> singles = new ArrayList<>();
        for (ProtoNode element : allElements) {
            String template = templateName(element.children);
            if (template.startsWith(GROUP_TEMPLATE_PREFIX)) {
                groups.add(element);
            } else if (template.startsWith(ROW_TEMPLATE_PREFIX)) {
                singles.add(element);
            }
        }
        if (groups.isEmpty() && singles.isEmpty()) {
            return body;
        }

        SeenEntities seen = new SeenEntities(root);
        InboxVideos videos = new InboxVideos();
        for (ProtoNode single : singles) {
            ProtoNode model = rowModel(single);
            if (model != null && model.children != null) {
                videos.add(videoId(model.children), notificationUnseen(model.children, seen));
            }
        }

        boolean changed = !groups.isEmpty() && !singles.isEmpty()
                && ungroup(allElements, groups, singles, seen, videos);
        byte[] result = body;
        if (changed) {
            seen.write();
            result = ProtoNode.write(root);
        }
        videos.save();
        return result;
    }

    private static boolean ungroup(List<ProtoNode> allElements, List<ProtoNode> groups, List<ProtoNode> singles,
                                   SeenEntities seen, InboxVideos videos) throws IOException {
        int itemDepth = itemDepth(groups, singles);
        if (itemDepth < 0) {
            return false;
        }

        Set<ProtoNode> occupied = Collections.newSetFromMap(new IdentityHashMap<>());
        Set<ProtoNode> shared = Collections.newSetFromMap(new IdentityHashMap<>());
        for (ProtoNode element : allElements) {
            ProtoNode item = ancestor(element, itemDepth);
            if (item != null && !occupied.add(item)) {
                shared.add(item);
            }
        }

        Map<ProtoNode, Long> singleTimes = new IdentityHashMap<>();
        List<ProtoNode> templates = new ArrayList<>();
        for (ProtoNode single : singles) {
            ProtoNode item = ancestor(single, itemDepth);
            ProtoNode model = rowModel(single);
            if (item == null || shared.contains(item) || model == null || model.children == null) {
                continue;
            }
            templates.add(single);
            if (videoId(model.children) != null) {
                singleTimes.put(item, notificationId(model.children));
            }
        }

        Map<ProtoNode, List<Row>> replacements = new IdentityHashMap<>();
        Map<ProtoNode, RowTemplate> preparedTemplates = new IdentityHashMap<>();
        Set<ProtoNode> affectedLists = new LinkedHashSet<>();
        for (ProtoNode group : groups) {
            ProtoNode item = ancestor(group, itemDepth);
            ProtoNode list = item == null ? null : item.getParent();
            if (list == null || shared.contains(item)) {
                continue;
            }

            RowTemplate template = templateFor(group, itemDepth, templates, preparedTemplates);
            if (template == null) {
                continue;
            }
            List<Row> rows = rows(group, template, seen, videos);
            if (!rows.isEmpty()) {
                replacements.put(item, rows);
                affectedLists.add(list);
            }
        }

        // Materialize inner changes before any enclosing list serializes its opaque items.
        List<ProtoNode> lists = new ArrayList<>(affectedLists);
        lists.sort((left, right) -> Integer.compare(parentCount(right), parentCount(left)));
        for (ProtoNode list : lists) {
            list.setPayload(ProtoNode.encode(output -> writeList(list.children, replacements, singleTimes, output)));
        }
        return !lists.isEmpty();
    }

    private static List<Row> rows(ProtoNode element, RowTemplate template, SeenEntities seen, InboxVideos videos)
            throws IOException {
        List<ProtoNode> group = ProtoNode.message(element.children, GROUP_MODEL);
        ProtoNode headerNode = ProtoNode.field(group, GROUP_HEADER);
        if (headerNode == null || headerNode.children == null) {
            return List.of();
        }

        List<Entry> entries = new ArrayList<>();
        Set<String> keys = new HashSet<>();
        Set<Long> ids = new HashSet<>();
        for (ProtoNode field : group) {
            if (field.getFieldNumber() != GROUP_ENTRY) {
                continue;
            }
            Entry entry = Entry.from(field.children);
            if (entry == null || !keys.add(entry.key) || !ids.add(entry.sentTime)) {
                // Don't drop an unsupported or malformed entry from a partially readable group.
                return List.of();
            }
            entries.add(entry);
        }

        List<ProtoNode> header = headerNode.children;
        boolean headerUnseen = notificationUnseen(header, seen);
        ProtoNode avatar = ProtoNode.field(header, AVATAR);
        ProtoNode channel = ProtoNode.field(ProtoNode.message(header, TEXTS), CHANNEL_NAME);
        List<Row> rows = new ArrayList<>(entries.size());
        boolean addEntity = seen.canAdd();
        for (Entry entry : entries) {
            Boolean serverUnseen = seen.isUnseen(entry.key);
            boolean inheritedUnseen = serverUnseen != null ? serverUnseen
                    : headerUnseen || SeenVideos.wasShownUnseen(entry.videoId);
            boolean unseen = inheritedUnseen && !SeenVideos.contains(entry.videoId);

            byte[] model = writeModel(entry, avatar, channel, unseen, addEntity);
            rows.add(new Row(template.withModel(model), entry.sentTime));
            if (addEntity) {
                seen.setUnseen(entry.key, unseen);
            }
            videos.add(entry.videoId, unseen);
        }
        return rows;
    }

    /** Uses the original entry for navigation, thumbnail, text, ID and menu commands. */
    private static byte[] writeModel(Entry entry, @Nullable ProtoNode avatar, @Nullable ProtoNode channel,
                                     boolean unseen, boolean addEntity) throws IOException {
        ProtoNode texts = ProtoNode.field(entry.fields, TEXTS);
        boolean addChannel = channel != null && texts != null && texts.children != null
                && ProtoNode.field(texts.children, CHANNEL_NAME) == null;
        ProtoNode entityKeys = ProtoNode.field(entry.fields, ENTITY_KEYS);
        byte[] newKey = addEntity && seenKey(entry.fields) == null
                ? ProtoNode.encode(output -> output.writeString(SEEN_ENTITY_KEY, entry.key)) : null;

        return ProtoNode.encode(output -> {
            for (ProtoNode field : entry.fields) {
                if (field.getFieldNumber() == SEEN) {
                    // Written once below, so a duplicate flag cannot override the result.
                    continue;
                }
                if (field == texts && addChannel) {
                    output.writeByteArray(TEXTS, appendField(texts.children, channel));
                } else if (field == entityKeys && newKey != null) {
                    output.writeByteArray(ENTITY_KEYS, ProtoNode.encode(keys -> {
                        if (entityKeys.children != null) {
                            for (ProtoNode key : entityKeys.children) {
                                key.writeTo(keys);
                            }
                        }
                        keys.writeRawBytes(newKey);
                    }));
                } else {
                    field.writeTo(output);
                }
            }
            if (avatar != null && ProtoNode.field(entry.fields, AVATAR) == null) {
                avatar.writeTo(output);
            }
            if (entityKeys == null && newKey != null) {
                output.writeByteArray(ENTITY_KEYS, newKey);
            }
            output.writeBool(SEEN, !unseen);
        });
    }

    private static byte[] appendField(List<ProtoNode> fields, ProtoNode extra) throws IOException {
        return ProtoNode.encode(output -> {
            for (ProtoNode field : fields) {
                field.writeTo(output);
            }
            extra.writeTo(output);
        });
    }

    private record Entry(List<ProtoNode> fields, String videoId, long sentTime, String key) {
        @Nullable
        static Entry from(@Nullable List<ProtoNode> fields) throws IOException {
            if (fields == null) {
                return null;
            }
            String videoId = InboxResponseFlattener.videoId(fields);
            Long sentTime = notificationId(fields);
            if (videoId == null || sentTime == null || sentTime == 0) {
                return null;
            }
            ProtoNode texts = ProtoNode.field(fields, TEXTS);
            if (texts == null || texts.children == null) {
                return null;
            }

            boolean hasEntityKeys = false;
            for (ProtoNode field : fields) {
                if (field.getFieldNumber() == SEEN && field.getVarint() == null) {
                    return null;
                }
                if (field.getFieldNumber() == ENTITY_KEYS) {
                    if (hasEntityKeys || !field.isLengthDelimited() || (field.children == null && field.hasPayload())) {
                        return null;
                    }
                    hasEntityKeys = true;
                }
            }
            ProtoNode ownKey = seenKey(fields);
            if (ownKey != null && !ownKey.isText()) {
                return null;
            }
            String key = ownKey == null ? SeenEntities.key(sentTime) : ownKey.getText();
            return new Entry(fields, videoId, sentTime, key);
        }
    }

    private record Row(@Nullable byte[] replacement, @Nullable ProtoNode original, long sentTime) {
        Row(byte[] replacement, long sentTime) {
            this(replacement, null, sentTime);
        }

        Row(ProtoNode original, long sentTime) {
            this(null, original, sentTime);
        }

        void write(CodedOutputStream output) throws IOException {
            if (replacement != null) {
                output.writeRawBytes(replacement);
            } else if (original != null) {
                original.writeTo(output);
            }
        }
    }

    /** Only consecutive video notification rows are sorted; other items are never moved across. */
    private static void writeList(List<ProtoNode> items, Map<ProtoNode, List<Row>> replacements,
                                  Map<ProtoNode, Long> singleTimes, CodedOutputStream output) throws IOException {
        List<Row> run = new ArrayList<>();
        for (ProtoNode item : items) {
            List<Row> rows = replacements.get(item);
            if (rows != null) {
                run.addAll(rows);
                continue;
            }
            Long sentTime = singleTimes.get(item);
            if (sentTime != null) {
                run.add(new Row(item, sentTime));
                continue;
            }

            writeSorted(run, output);
            item.writeTo(output);
        }
        writeSorted(run, output);
    }

    private static void writeSorted(List<Row> run, CodedOutputStream output) throws IOException {
        run.sort((left, right) -> Long.compareUnsigned(right.sentTime, left.sentTime));
        for (Row row : run) {
            row.write(output);
        }
        run.clear();
    }

    private record RowTemplate(List<ProtoNode> item, ProtoNode model) {
        byte[] withModel(byte[] entry) throws IOException {
            model.setPayload(entry);
            return ProtoNode.write(item);
        }
    }

    @Nullable
    private static RowTemplate templateFor(ProtoNode group, int itemDepth, List<ProtoNode> singles,
                                           Map<ProtoNode, RowTemplate> preparedTemplates) throws IOException {
        for (ProtoNode single : singles) {
            if (!hasSamePath(group, single, itemDepth)) {
                continue;
            }
            RowTemplate prepared = preparedTemplates.get(single);
            if (prepared != null) {
                return prepared;
            }

            ProtoNode originalItem = ancestor(single, itemDepth);
            List<ProtoNode> item = ProtoNode.parse(ProtoNode.write(List.of(originalItem)));
            if (item == null) {
                continue;
            }
            List<ProtoNode> elements = new ArrayList<>();
            collectElements(item, elements);
            if (elements.size() == 1) {
                ProtoNode model = rowModel(elements.get(0));
                if (model != null) {
                    RowTemplate template = new RowTemplate(item, model);
                    preparedTemplates.put(single, template);
                    return template;
                }
            }
        }
        return null;
    }

    private static boolean hasSamePath(ProtoNode group, ProtoNode single, int itemDepth) {
        for (int depth = 0; depth <= itemDepth; depth++) {
            if (group == null || single == null || group.getFieldNumber() != single.getFieldNumber()) {
                return false;
            }
            group = group.getParent();
            single = single.getParent();
        }
        return true;
    }

    private static void collectElements(List<ProtoNode> message, List<ProtoNode> elements) {
        for (ProtoNode node : message) {
            if (node.children == null) {
                continue;
            }
            String template = templateName(node.children);
            if (template != null) {
                elements.add(node);
                if (template.startsWith(ROW_TEMPLATE_PREFIX) || template.startsWith(GROUP_TEMPLATE_PREFIX)) {
                    continue;
                }
            }
            collectElements(node.children, elements);
        }
    }

    @Nullable
    private static String templateName(List<ProtoNode> element) {
        ProtoNode name = ProtoNode.field(ProtoNode.message(element, TEMPLATE_NAME), 1);
        return name != null && name.isText() ? name.getText() : null;
    }

    @Nullable
    private static ProtoNode rowModel(ProtoNode element) {
        return ProtoNode.field(ProtoNode.message(element.children, ROW_MODEL), MODEL);
    }

    /** Finds the closest repeated wrapper of the known notification elements. */
    private static int itemDepth(List<ProtoNode> groups, List<ProtoNode> singles) {
        List<ProtoNode> elements = new ArrayList<>(groups.size() + singles.size());
        elements.addAll(groups);
        elements.addAll(singles);

        Set<ProtoNode> withElements = Collections.newSetFromMap(new IdentityHashMap<>());
        for (ProtoNode element : elements) {
            for (ProtoNode node = element; node != null; node = node.getParent()) {
                withElements.add(node);
            }
        }
        for (int depth = 0; depth <= MAX_ITEM_DEPTH; depth++) {
            for (ProtoNode element : elements) {
                ProtoNode item = ancestor(element, depth);
                ProtoNode list = item == null ? null : item.getParent();
                if (list == null) {
                    continue;
                }
                for (ProtoNode sibling : list.children) {
                    if (sibling != item && sibling.getFieldNumber() == item.getFieldNumber()
                            && withElements.contains(sibling)) {
                        return depth;
                    }
                }
            }
        }
        return -1;
    }

    private static int parentCount(ProtoNode node) {
        int count = 0;
        for (ProtoNode parent = node.getParent(); parent != null; parent = parent.getParent()) {
            count++;
        }
        return count;
    }

    @Nullable
    private static ProtoNode ancestor(ProtoNode node, int depth) {
        for (int index = 0; index < depth && node != null; index++) {
            node = node.getParent();
        }
        return node;
    }

    private static boolean notificationUnseen(List<ProtoNode> model, SeenEntities seen) {
        ProtoNode key = seenKey(model);
        Boolean entityUnseen = seen.isUnseen(key != null && key.isText() ? key.getText() : null);
        if (entityUnseen != null) {
            return entityUnseen;
        }
        ProtoNode flag = ProtoNode.field(model, SEEN);
        Long varint = flag == null ? null : flag.getVarint();
        return varint == null || varint == 0;
    }

    @Nullable
    private static ProtoNode seenKey(List<ProtoNode> model) {
        return ProtoNode.field(ProtoNode.message(model, ENTITY_KEYS), SEEN_ENTITY_KEY);
    }

    /** A notification ID is also its send timestamp in microseconds. */
    @Nullable
    private static Long notificationId(List<ProtoNode> model) {
        ProtoNode id = ProtoNode.field(ProtoNode.message(model, NOTIFICATION_ID), 1);
        return id == null ? null : id.getVarint();
    }

    @Nullable
    private static String videoId(List<ProtoNode> model) {
        for (int[] path : VIDEO_IDS) {
            ProtoNode id = ProtoNode.field(ProtoNode.message(model, path), 1);
            if (id != null && id.isText() && SeenVideos.isVideoId(id.getText())) {
                return id.getText();
            }
        }
        return null;
    }
}
