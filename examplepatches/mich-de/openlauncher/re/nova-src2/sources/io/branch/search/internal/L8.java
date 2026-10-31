package io.branch.search.internal;

import android.content.ContentValues;
import android.database.SQLException;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import io.branch.search.internal.InterfaceC3279n5;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class L8 implements InterfaceC3279n5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final InterfaceC3076b5 f62841a;

    public L8(@NotNull InterfaceC3076b5 dbHelper) {
        Intrinsics.g(dbHelper, "dbHelper");
        this.f62841a = dbHelper;
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    public final void a(@NotNull InterfaceC3365s7 interfaceC3365s7) {
        InterfaceC3279n5.a.a(this, interfaceC3365s7);
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String getName() {
        return "local_entities";
    }

    public final void a(@NotNull String sessionId, @NotNull List<Q8> items) throws JSONException, SQLException {
        JSONArray jSONArray;
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(items, "items");
        for (Q8 item : items) {
            Intrinsics.g(item, "item");
            C3178h5 writableDatabase = this.f62841a.getWritableDatabase();
            ContentValues contentValues = new ContentValues();
            contentValues.put("package_name", item.f63219a);
            contentValues.put("user_id", Long.valueOf(item.f63220b));
            contentValues.put("shortcut_id", item.f63221c);
            contentValues.put("hashed_shortcut_id", item.f63222d);
            contentValues.put(PendingUpgradeStore.KEY_NAME, item.f63223e);
            contentValues.put("rank", Integer.valueOf(item.f63224f));
            contentValues.put("is_dynamic", Boolean.valueOf(item.f63225g));
            try {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("@type", "shortcut");
                jSONObject.put("id", item.f63221c);
                jSONObject.put("isDynamic", item.f63225g);
                jSONObject.put("user", item.f63220b);
                jSONArray = new JSONArray();
                jSONArray.put(jSONObject);
            } catch (JSONException e3) {
                C3296o5.a(sessionId, e3, "LocalShortcut.createShortcutHandler");
                jSONArray = new JSONArray();
            }
            contentValues.put("linking", jSONArray.toString());
            Unit unit = Unit.f71706a;
            writableDatabase.f64647a.insert("local_entities", 5, contentValues);
        }
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String a() {
        return "`package_name` TEXT NOT NULL, `user_id` INTEGER NOT NULL, `shortcut_id` TEXT NOT NULL, `hashed_shortcut_id` TEXT NOT NULL, `is_dynamic` BOOLEAN NOT NULL, `name` TEXT NOT NULL, `rank` INTEGER NOT NULL, `linking` TEXT NOT NULL, PRIMARY KEY(`package_name`, `user_id`, `shortcut_id`)";
    }
}
