/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-16
 */
package app.morphe.extension.music.legacy;

import java.util.ArrayList;
import java.util.List;

/** Supplies modern response themes directly to the models consumed by Music 6.20's old Elements binder. */
public final class LegacyThemeBridge {
    private static final int FRAMEWORK_UPDATES = 777;
    private static final int THEME_UPDATE = 421320458;
    private static final int COMPONENT_TYPE = 168777401;
    private static final int THEME_SUBSCRIPTION = 386334485;
    private static final int CAPABILITIES_UPDATE = 423179876;
    private static final int CAPABILITIES_SUBSCRIPTION = 386334486;
    private static final int CONTEXT_THEME_KEY = 470784583;
    private static final int CONTEXT_CAPABILITIES_KEY = 516665666;
    private static final int COLLECTION_LAYOUT_TYPE = 404917441;
    private static final int GRID_COLLECTION_LAYOUT = 405782140;
    private static final int COLLECTION_TYPE = 258876563;
    private static final int COLLECTION_LAYOUT_FIELD = 17;
    private static final int MUSIC_BLURRED_BACKGROUND_HEADER = 373186255;
    private static final int MAX_DEPTH = 64;
    private static final byte[] COMPONENT_TAG = tagBytes(COMPONENT_TYPE);
    private static final byte[] THEME_KEY_TAG = tagBytes(CONTEXT_THEME_KEY);
    private static final byte[] CAPABILITIES_KEY_TAG = tagBytes(CONTEXT_CAPABILITIES_KEY);

    private LegacyThemeBridge() {}

    public static byte[] hydrateResponse(byte[] response) {
        // Music 6.20's application theme is always dark, independently of Android's night mode.
        // An explicitly LIGHT or DARK subscription key still takes precedence.
        return hydrate(response, true);
    }

    static byte[] hydrate(byte[] response, boolean dark) {
        if (response == null || response.length == 0) return response;

        try {
            Slice root = new Slice(response, 0, response.length);
            Slice framework = field(root, FRAMEWORK_UPDATES);
            if (framework == null) return response;

            Resources resources = resources(framework);
            if (resources.themes.isEmpty() && resources.capabilities.isEmpty()) return response;

            byte[] rewritten = rewrite(root, resources, dark, 0);
            return rewritten == null ? response : rewritten;
        } catch (IllegalArgumentException unsupportedWireData) {
            // This parser is also used for non-UI responses. Unknown wire shapes must stay byte-for-byte stock.
            return response;
        }
    }

    private static Resources resources(Slice framework) {
        Resources resources = new Resources();
        Slice updates = field(framework, 2);
        if (updates == null) return resources;

        Cursor update = new Cursor(updates);
        while (update.next()) {
            if (update.number != 1 || update.wire != 2) continue;

            Cursor resource = new Cursor(update.payload());
            while (resource.next()) {
                if (resource.wire != 2) continue;

                if (resource.number == THEME_UPDATE) {
                    addThemes(resource.payload(), resources.themes);
                } else if (resource.number == CAPABILITIES_UPDATE) {
                    Slice capabilityUpdate = resource.payload();
                    Slice identifier = field(capabilityUpdate, 1);
                    Slice payload = field(capabilityUpdate, 2);
                    if (identifier != null && payload != null) {
                        resources.capabilities.add(new Capabilities(identifier, projectCapabilities(payload)));
                    }
                }
            }
        }
        return resources;
    }

    private static void addThemes(Slice update, List<Theme> themes) {
        Slice identifier = field(update, 1);
        Slice bundle = field(update, 4);
        if (identifier == null || bundle == null) return;

        Cursor entry = new Cursor(bundle);
        while (entry.next()) {
            if (entry.number != 1 || entry.wire != 2) continue;

            Slice variant = entry.payload();
            Slice key = field(variant, 1);
            Slice theme = field(variant, 2);
            int appearance = scalar(variant, 3);
            if (key == null || theme == null || (appearance != 1 && appearance != 2)) continue;

            if (equal(identifier, field(key, 1)) && scalar(theme, 6) == appearance) {
                themes.add(new Theme(identifier, appearance, theme));
            }
        }
    }

    /** Advertise only the two multirow-layout features demonstrated by Music 6.20's native capability profile. */
    private static Slice projectCapabilities(Slice capabilities) {
        List<Change> changes = new ArrayList<>();
        Cursor group = new Cursor(capabilities);
        while (group.next()) {
            if (group.number != 1 || group.wire != 2) continue;

            Slice original = group.payload();
            int type = scalar(original, 1);
            int feature = type == COLLECTION_LAYOUT_TYPE ? GRID_COLLECTION_LAYOUT
                    : type == COLLECTION_TYPE ? COLLECTION_LAYOUT_FIELD : 0;
            Slice supported = feature == 0 ? null : supportedCapabilityGroup(original, feature);
            if (supported != original) changes.add(group.change(supported));
        }
        byte[] projected = apply(capabilities, changes);
        return projected == null ? capabilities : new Slice(projected, 0, projected.length);
    }

    private static Slice supportedCapabilityGroup(Slice group, int feature) {
        Slice entries = field(group, 2);
        if (entries == null) return null;

        boolean present = false;
        List<Change> changes = new ArrayList<>();
        Cursor entry = new Cursor(entries);
        while (entry.next()) {
            if (entry.number != 1 || entry.wire != 2) continue;

            Slice flag = entry.payload();
            int value = scalar(flag, 2);
            if (scalar(flag, 1) == feature && (value == 0 || value == 1)) {
                present = true;
            } else {
                changes.add(entry.change(null));
            }
        }
        if (!present) return null;

        byte[] projected = apply(entries, changes);
        if (projected == null) return group;

        byte[] updated = replace(group, 2, new Slice(projected, 0, projected.length));
        return new Slice(updated, 0, updated.length);
    }

    private static byte[] rewrite(Slice message, Resources resources, boolean dark, int depth) {
        if (depth > MAX_DEPTH || !containsTag(message, COMPONENT_TAG)) return null;

        List<Change> changes = new ArrayList<>();
        try {
            Cursor cursor = new Cursor(message);
            while (cursor.next()) {
                if (cursor.wire != 2 || (depth == 0 && cursor.number == FRAMEWORK_UPDATES)) continue;

                Slice child = cursor.payload();
                byte[] replacement = cursor.number == COMPONENT_TYPE ? hydrateComponent(child, resources, dark) : null;
                Slice nested = replacement == null ? child : new Slice(replacement, 0, replacement.length);
                byte[] descendants = rewrite(nested, resources, dark, depth + 1);
                if (descendants != null) replacement = descendants;

                if (replacement != null) {
                    changes.add(cursor.change(new Slice(replacement, 0, replacement.length)));
                }
            }
        } catch (IllegalArgumentException opaqueField) {
            // Length-delimited protobuf fields can also contain strings, compiled templates or opaque bytes.
            return null;
        }
        return apply(message, changes);
    }

    private static byte[] hydrateComponent(Slice component, Resources resources, boolean dark) {
        Slice model = field(component, 5);
        Slice subscriptions = field(component, 6);
        if (model == null || subscriptions == null) return null;

        byte[] modified = hydrateSubscription(model, field(subscriptions, THEME_SUBSCRIPTION), resources, dark, true);
        if (modified != null) model = new Slice(modified, 0, modified.length);

        byte[] capabilities = hydrateSubscription(model, field(subscriptions, CAPABILITIES_SUBSCRIPTION),
                resources, dark, false);
        if (capabilities != null) modified = capabilities;

        return modified == null ? null : replace(component, 5, new Slice(modified, 0, modified.length));
    }

    private static byte[] hydrateSubscription(Slice model, Slice subscription, Resources resources,
                                            boolean dark, boolean theme) {
        if (subscription == null) return null;

        int modelField = scalar(subscription, 2);
        Slice modelData = field(model, modelField);
        if (modelData == null) return null;

        byte[] modified = null;
        Cursor mapping = new Cursor(subscription);
        while (mapping.next()) {
            if (mapping.number != 1 || mapping.wire != 2) continue;

            Slice destination = mapping.payload();
            Slice key = field(destination, 1);
            Slice payload = theme ? resolve(key, resources.themes, dark) : resolveCapabilities(key, resources);
            int target = themeDestination(destination);
            if (payload == null || target == 0) continue;

            byte[] changed = hydrateModel(modelData, modelField, target, payload, key,
                    theme ? CONTEXT_THEME_KEY : CONTEXT_CAPABILITIES_KEY);
            if (changed != null) {
                modified = changed;
                modelData = new Slice(changed, 0, changed.length);
            }
        }
        return modified == null ? null : replace(model, modelField, new Slice(modified, 0, modified.length));
    }

    private static byte[] hydrateModel(Slice model, int modelType, int target, Slice payload,
                                       Slice key, int contextKey) {
        boolean found = false;
        List<Change> changes = new ArrayList<>();
        byte[] keyTag = contextKey == CONTEXT_THEME_KEY ? THEME_KEY_TAG : CAPABILITIES_KEY_TAG;
        long metadataColor = 0;
        if (modelType == MUSIC_BLURRED_BACKGROUND_HEADER && contextKey == CONTEXT_THEME_KEY) {
            Slice explicit = field(model, target);
            metadataColor = secondaryColor(explicit != null && explicit.length() != 0 ? explicit : payload);
        }
        Cursor cursor = new Cursor(model);
        while (cursor.next()) {
            if (cursor.number == target) {
                if (found || cursor.wire != 2) throw new IllegalArgumentException();
                found = true;
                // Keep explicit inverse/promo themes and explicitly provided capabilities.
                if (cursor.payload().length() == 0 && payload.length() != 0) {
                    changes.add(cursor.change(payload));
                }
            } else if (cursor.number == 14 && cursor.wire == 2 && metadataColor != 0) {
                byte[] metadata = defaultMetadataForeground(cursor.payload(), metadataColor);
                if (metadata != null) changes.add(cursor.change(new Slice(metadata, 0, metadata.length)));
            } else if (cursor.wire == 2) {
                Slice context = cursor.payload();
                if (!containsTag(context, keyTag)) continue;

                try {
                    if (equal(field(context, contextKey), key)) {
                        // A retained subscription key suppresses inline forwarding to EKO-generated children.
                        byte[] inline = replace(context, contextKey, null);
                        changes.add(cursor.change(new Slice(inline, 0, inline.length)));
                    }
                } catch (IllegalArgumentException opaqueField) {
                    // Other model fields can contain opaque data rather than Context messages.
                }
            }
        }
        if (!found) changes.add(new Change(model.end, model.end, target, payload));
        return apply(model, changes);
    }

    private static long secondaryColor(Slice theme) {
        Slice tokens = field(theme, 7);
        if (tokens != null) {
            Cursor entry = new Cursor(tokens);
            while (entry.next()) {
                if (entry.number == 108 && entry.wire == 2) {
                    Slice color = entry.payload();
                    if (scalar(color, 1) == 72) return scalar(color, 2) & 0xffffffffL;
                }
            }
            int direct = scalar(tokens, 72);
            if (direct != 0) return direct & 0xffffffffL;
        }
        Slice palette = field(theme, 1);
        return palette == null ? 0 : scalar(palette, 78) & 0xffffffffL;
    }

    /** The header's direct formatted-metadata branch omits the secondary default used by its badged-text branch. */
    private static byte[] defaultMetadataForeground(Slice headerData, long color) {
        Slice text = field(headerData, 30);
        if (text == null) return null;

        List<Change> changes = new ArrayList<>();
        Cursor run = new Cursor(text);
        while (run.next()) {
            if (run.number != 6 || run.wire != 2) continue;

            byte[] styled = defaultRunForeground(run.payload(), color);
            if (styled != null) changes.add(run.change(new Slice(styled, 0, styled.length)));
        }
        byte[] styled = apply(text, changes);
        return styled == null ? null : replace(headerData, 30, new Slice(styled, 0, styled.length));
    }

    private static byte[] defaultRunForeground(Slice run, long color) {
        Change change = null;
        Cursor cursor = new Cursor(run);
        while (cursor.next()) {
            if (cursor.number != 5) continue;
            // Zero means no foreground span in 6.20, not an explicitly painted transparent-black span.
            if (change != null || cursor.wire != 0 || cursor.value != 0) return null;
            change = new Change(cursor.start, cursor.position, 5, color);
        }
        if (change == null) change = new Change(run.end, run.end, 5, color);

        List<Change> changes = new ArrayList<>(1);
        changes.add(change);
        return apply(run, changes);
    }

    private static Slice resolveCapabilities(Slice key, Resources resources) {
        for (int index = resources.capabilities.size() - 1; index >= 0; index--) {
            Capabilities capabilities = resources.capabilities.get(index);
            if (equal(key, capabilities.identifier)) return capabilities.payload;
        }
        return null;
    }

    private static Slice resolve(Slice key, List<Theme> themes, boolean dark) {
        if (key == null) return null;

        Slice identifier = field(key, 1);
        int appearance = scalar(key, 2);
        if (appearance == 0) appearance = dark ? 2 : 1;
        if (appearance != 1 && appearance != 2) return null;

        for (int index = themes.size() - 1; index >= 0; index--) {
            Theme theme = themes.get(index);
            if (theme.appearance == appearance && equal(identifier, theme.identifier)) return theme.payload;
        }
        return null;
    }

    private static int themeDestination(Slice mapping) {
        int destination = 0;
        Cursor cursor = new Cursor(mapping);
        while (cursor.next()) {
            if (cursor.number == 1 && cursor.wire == 2) continue;

            if (cursor.number != 2 || cursor.wire != 0 || destination != 0 || !fieldNumber(cursor.value)) {
                return 0;
            }
            destination = (int) cursor.value;
        }
        return destination;
    }

    private static byte[] replace(Slice message, int number, Slice payload) {
        Cursor cursor = new Cursor(message);
        Change change = null;
        while (cursor.next()) {
            if (cursor.number != number) continue;
            if (change != null || cursor.wire != 2) throw new IllegalArgumentException();
            change = cursor.change(payload);
        }
        if (change == null) {
            if (payload == null) return null;
            change = new Change(message.end, message.end, number, payload);
        }

        List<Change> changes = new ArrayList<>(1);
        changes.add(change);
        return apply(message, changes);
    }

    /** Copy only modified messages; preserve all untouched fields, unknown extensions and commands verbatim. */
    private static byte[] apply(Slice message, List<Change> changes) {
        if (changes.isEmpty()) return null;

        long size = message.length();
        for (Change change : changes) {
            size -= change.end - change.start;
            if (change.wire >= 0) {
                size += varintSize(((long) change.number << 3) | change.wire);
                size += change.wire == 0 ? varintSize(change.scalar)
                        : varintSize(change.payload.length()) + (long) change.payload.length();
            }
        }
        if (size > Integer.MAX_VALUE) throw new IllegalArgumentException();
        byte[] result = new byte[(int) size];
        int source = message.start;
        int target = 0;
        for (Change change : changes) {
            int unchanged = change.start - source;
            System.arraycopy(message.data, source, result, target, unchanged);
            target += unchanged;
            if (change.wire >= 0) {
                target = writeVarint(result, target, ((long) change.number << 3) | change.wire);
                if (change.wire == 0) {
                    target = writeVarint(result, target, change.scalar);
                } else {
                    target = writeVarint(result, target, change.payload.length());
                    System.arraycopy(change.payload.data, change.payload.start, result, target,
                            change.payload.length());
                    target += change.payload.length();
                }
            }
            source = change.end;
        }
        System.arraycopy(message.data, source, result, target, message.end - source);
        return result;
    }

    private static Slice field(Slice message, int number) {
        Slice found = null;
        Cursor cursor = new Cursor(message);
        while (cursor.next()) {
            if (cursor.number != number) continue;
            if (found != null || cursor.wire != 2) throw new IllegalArgumentException();
            found = cursor.payload();
        }
        return found;
    }

    private static int scalar(Slice message, int number) {
        int value = 0;
        Cursor cursor = new Cursor(message);
        while (cursor.next()) {
            if (cursor.number == number && cursor.wire == 0) value = (int) cursor.value;
        }
        return value;
    }

    private static boolean fieldNumber(long value) {
        return value > 0 && value <= 0x1fffffff;
    }

    private static boolean equal(Slice left, Slice right) {
        if (left == null || right == null || left.length() != right.length()) return false;
        for (int index = 0; index < left.length(); index++) {
            if (left.data[left.start + index] != right.data[right.start + index]) return false;
        }
        return true;
    }

    private static boolean containsTag(Slice message, byte[] tag) {
        for (int start = message.start; start <= message.end - tag.length; start++) {
            int index = 0;
            while (index < tag.length && message.data[start + index] == tag[index]) index++;
            if (index == tag.length) return true;
        }
        return false;
    }

    private static byte[] tagBytes(int field) {
        long tag = ((long) field << 3) | 2;
        byte[] bytes = new byte[varintSize(tag)];
        writeVarint(bytes, 0, tag);
        return bytes;
    }

    private static int varintSize(long value) {
        int size = 1;
        while ((value >>>= 7) != 0) size++;
        return size;
    }

    private static int writeVarint(byte[] target, int position, long value) {
        while ((value & ~0x7fL) != 0) {
            target[position++] = (byte) ((value & 0x7f) | 0x80);
            value >>>= 7;
        }
        target[position++] = (byte) value;
        return position;
    }

    private static final class Slice {
        final byte[] data;
        final int start;
        final int end;

        Slice(byte[] data, int start, int end) {
            this.data = data;
            this.start = start;
            this.end = end;
        }

        int length() { return end - start; }
    }

    private static final class Resources {
        final List<Theme> themes = new ArrayList<>();
        final List<Capabilities> capabilities = new ArrayList<>();
    }

    private static final class Capabilities {
        final Slice identifier;
        final Slice payload;

        Capabilities(Slice identifier, Slice payload) {
            this.identifier = identifier;
            this.payload = payload;
        }
    }

    private static final class Theme {
        final Slice identifier;
        final int appearance;
        final Slice payload;

        Theme(Slice identifier, int appearance, Slice payload) {
            this.identifier = identifier;
            this.appearance = appearance;
            this.payload = payload;
        }
    }

    private static final class Change {
        final int start;
        final int end;
        final int number;
        final int wire;
        final long scalar;
        final Slice payload;

        Change(int start, int end, int number, Slice payload) {
            this.start = start;
            this.end = end;
            this.number = number;
            this.payload = payload;
            wire = payload == null ? -1 : 2;
            scalar = 0;
        }

        Change(int start, int end, int number, long scalar) {
            this.start = start;
            this.end = end;
            this.number = number;
            this.scalar = scalar;
            wire = 0;
            payload = null;
        }
    }

    private static final class Cursor {
        final byte[] data;
        final int limit;
        int position;
        int start;
        int payloadStart;
        int number;
        int wire;
        long value;

        Cursor(Slice slice) {
            data = slice.data;
            position = slice.start;
            limit = slice.end;
        }

        boolean next() {
            if (position == limit) return false;
            start = position;
            long tag = varint();
            number = (int) (tag >>> 3);
            wire = (int) tag & 7;
            if (!fieldNumber(tag >>> 3)) throw new IllegalArgumentException();

            switch (wire) {
                case 0:
                    value = varint();
                    break;
                case 1:
                    skip(8);
                    break;
                case 2:
                    long length = varint();
                    if (length < 0 || length > limit - position) throw new IllegalArgumentException();
                    payloadStart = position;
                    skip((int) length);
                    break;
                case 5:
                    skip(4);
                    break;
                default:
                    throw new IllegalArgumentException();
            }
            return true;
        }

        long varint() {
            long value = 0;
            for (int shift = 0; shift < 64 && position < limit; shift += 7) {
                int next = data[position++] & 0xff;
                value |= (long) (next & 0x7f) << shift;
                if ((next & 0x80) == 0) return value;
            }
            throw new IllegalArgumentException();
        }

        void skip(int size) {
            if (size < 0 || size > limit - position) throw new IllegalArgumentException();
            position += size;
        }

        Slice payload() { return new Slice(data, payloadStart, position); }

        Change change(Slice payload) { return new Change(start, position, number, payload); }
    }
}
