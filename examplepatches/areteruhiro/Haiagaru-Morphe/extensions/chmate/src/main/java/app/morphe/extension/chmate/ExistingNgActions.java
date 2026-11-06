package app.morphe.extension.chmate;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/** Existing-rule operations use the native store and preserve all unrelated metadata. */
public final class ExistingNgActions {
    static NativeNgStore.Entry find(List<NativeNgStore.Entry> entries, String pattern, String board, short flags) {
        NativeNgStore.Entry found = null;
        for (NativeNgStore.Entry entry : entries) if (entry.pattern.equals(pattern)
                && Objects.equals(entry.board, board) && entry.flags == flags) return entry;
        for (NativeNgStore.Entry entry : entries) {
            // Compare the condition itself, never evaluate a regex against a candidate.
            if (!entry.pattern.equals(pattern) || !Objects.equals(entry.board, board)
                    || (entry.flags & 0x70) != (flags & 0x70)) continue;
            if (found != null) return null; // Ambiguous variants require the native editor.
            found = entry;
        }
        return found;
    }

    static void change(NativeNgStore store, NativeNgStore.Entry target, int action) throws ReflectiveOperationException {
        if (action < 0 || action > 2) throw new IllegalArgumentException("Unknown NG action");
        List<NativeNgStore.Entry> before = store.entries();
        NativeNgStore.Entry current = null;
        for (NativeNgStore.Entry entry : before) if (entry.same(target)) { current = entry; break; }
        if (current == null) throw new IllegalStateException("NGが変更されました。画面を開き直してください");
        if ((action == 1 && (current.flags & 4) == 0)
                || (action == 2 && (current.flags & 4) != 0)) return;
        List<Object> after = new ArrayList<>();
        for (NativeNgStore.Entry entry : before) {
            if (entry != current) after.add(entry.nativeItem);
            else if (action != 0) after.add(store.item(entry.pattern,
                    (short) (action == 1 ? entry.flags & ~4 : entry.flags | 4), entry.timestamp, entry.board));
        }
        store.replace(before, after);
        PersonalNgSubmissions.changed();
    }

    private ExistingNgActions() {}
}
