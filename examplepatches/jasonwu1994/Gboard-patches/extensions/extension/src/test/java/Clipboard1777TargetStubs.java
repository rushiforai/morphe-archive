import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

class eun {
    public final euo a;
    eun(euo owner) { a = owner; }
    public Object call() { return null; }
}

class euo {
    public final Context b;
    euo(Context context) { b = context; }
}

class evu {
    public final ewb a;
    public final int b;
    evu(ewb handler, int trigger) { a = handler; b = trigger; }
    public Object call() { return null; }
}

class ewb {
    static long primaryTimestamp;
    static long cleanupFailureId = Long.MIN_VALUE;
    static final List<String> events = new ArrayList<>();
    public final Context c;
    public final boolean f;
    public final AtomicInteger g;

    ewb(Context context, boolean disabled, int count) {
        c = context;
        f = disabled;
        g = new AtomicInteger(count);
    }

    public static long a(Context context) { return primaryTimestamp; }

    public Cursor b(Uri uri, int itemType) {
        return c.getContentResolver().query(uri, null, "item_type = ?",
                new String[] { Integer.toString(itemType) }, "timestamp DESC");
    }

    public void l(Cursor cursor) {
        long id = cursor.getLong(cursor.getColumnIndexOrThrow("_id"));
        if (id == cleanupFailureId) {
            events.add("cleanup-failed:" + id);
            throw new IllegalStateException("cleanup failed for " + id);
        }
        events.add("cleanup:" + id);
    }
}

class evm {
    public final List<Integer> removed = new ArrayList<>();
    public void n(int position) { removed.add(Integer.valueOf(position)); }
}

class evn extends evm {
    public final Context e;
    public final List<Object> n;
    public int o;
    public int y;
    public int refreshCount;

    evn(Context context, List<Object> items, int recentCount, int pinnedVisibleCount) {
        e = context;
        n = items;
        o = recentCount;
        y = pinnedVisibleCount;
    }

    public void F() {}
    public void p(kl holder, int position) {}
    public void R() { refreshCount++; }
}

class kl {}

class evl extends kl {
    public final TextView t;
    evl(TextView textView) { t = textView; }
}

class eum {
    public final int c;
    eum(int itemType) { c = itemType; }
}

class euk {
    public static final euk a = new euk(-1L, new j$.time.Instant(0L), 0, false, false);
    public static final euk b = new euk(-2L, new j$.time.Instant(0L), 0, false, false);
    public static final euk c = new euk(-3L, new j$.time.Instant(0L), 2, false, true);

    public final long d;
    public final j$.time.Instant e;
    public final eum g;
    private final boolean pinned;
    private final boolean special;

    euk(long id, j$.time.Instant timestamp, int itemType, boolean isPinned,
            boolean isSpecial) {
        d = id;
        e = timestamp;
        g = new eum(itemType);
        pinned = isPinned;
        special = isSpecial;
    }

    public boolean m() { return pinned; }
    public boolean n() { return special; }
}

class evr {
    static final List<Object> items = new ArrayList<>();
    static final List<String> events = ewb.events;
    static final Uri URI = Uri.parse("content://clipboard1777/items");

    public static Uri c(Context context, int type, long id) { return URI; }

    public static List<Object> i(Context context, String selection, String[] selectionArgs,
            String sortOrder) throws Exception {
        long timestamp = selectionArgs == null || selectionArgs.length == 0
                ? Long.MIN_VALUE : Long.parseLong(selectionArgs[0]);
        List<Object> result = new ArrayList<>();
        for (Object item : items) {
            euk clip = (euk) item;
            long value = clip.e.toEpochMilli();
            if ("timestamp = ?".equals(selection)) {
                if (value == timestamp) result.add(item);
            } else if (clip.m() || clip.n() || value >= timestamp) {
                result.add(item);
            }
        }
        result.sort(Comparator.comparingLong((Object value) ->
                ((euk) value).e.toEpochMilli()).reversed());
        return result;
    }

    public static void g(Context context, List<Long> ids) {
        for (Long id : ids) {
            events.add("delete:" + id);
            context.getContentResolver().delete(URI, "_id = ?",
                    new String[] { Long.toString(id.longValue()) });
        }
    }
}

class cbv {
    static long lastVisibleTimestamp;
    public long m(int key, long defaultValue) { return lastVisibleTimestamp; }
    public void s(int key, long value) { lastVisibleTimestamp = value; }
}

class qnp extends cbv {
    public static qnp N(Context context) { return new qnp(); }
}

class AbstractKeyboard1777Stub {
    public final Object y;
    AbstractKeyboard1777Stub(Object shadow) { y = shadow; }
}

class ClipboardKeyboard1777Stub extends AbstractKeyboard1777Stub {
    public final Context w;
    ClipboardKeyboard1777Stub(Context context, Object shadow) {
        super(shadow);
        w = context;
    }
}
