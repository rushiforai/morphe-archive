package ux;

import android.content.Context;
import android.database.Cursor;
import android.provider.ContactsContract;
import java.io.IOException;
import java.util.LinkedHashSet;
import kotlin.Unit;
import kotlin.io.CloseableKt;

/* loaded from: classes4.dex */
public final class h {
    public static final void a(Context context, LinkedHashSet linkedHashSet) throws IOException {
        Cursor cursorQuery;
        if (linkedHashSet.size() < 15 && (cursorQuery = context.getContentResolver().query(ContactsContract.Contacts.CONTENT_URI, new String[]{"display_name", "photo_thumb_uri"}, "has_phone_number = 1 AND starred = 1", null, "display_name ASC")) != null) {
            try {
                int columnIndexOrThrow = cursorQuery.getColumnIndexOrThrow("display_name");
                int columnIndexOrThrow2 = cursorQuery.getColumnIndexOrThrow("photo_thumb_uri");
                while (cursorQuery.moveToNext() && linkedHashSet.size() < 15) {
                    String string = cursorQuery.getString(columnIndexOrThrow);
                    if (string != null) {
                        if (r70.k.U0(string)) {
                            string = null;
                        }
                        if (string != null) {
                            linkedHashSet.add(new e(string, cursorQuery.getString(columnIndexOrThrow2)));
                        }
                    }
                }
                Unit unit = Unit.f71706a;
                cursorQuery.close();
            } catch (Throwable th2) {
                try {
                    throw th2;
                } catch (Throwable th3) {
                    CloseableKt.a(cursorQuery, th2);
                    throw th3;
                }
            }
        }
    }
}
