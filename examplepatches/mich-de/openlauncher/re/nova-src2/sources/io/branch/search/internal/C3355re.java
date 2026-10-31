package io.branch.search.internal;

import android.database.Cursor;
import com.instabridge.ai.proactive.AiDatabase;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.re, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3355re implements InterfaceC3167gb<u40.t, Collection<? extends u40.t>> {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final C3355re f65646a = new C3355re();

    @Override // io.branch.search.internal.InterfaceC3167gb
    public final Object a(Cursor cur, String sessionId) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(cur, "cur");
        try {
            String string = cur.getString(R4.a(cur, "entity_id"));
            Intrinsics.f(string, "getString(checkColumnIndex(column))");
            String string2 = cur.getString(R4.a(cur, "package_name"));
            Intrinsics.f(string2, "getString(checkColumnIndex(column))");
            String string3 = cur.getString(R4.a(cur, PendingUpgradeStore.KEY_NAME));
            Intrinsics.f(string3, "getString(checkColumnIndex(column))");
            String strF = R4.f(cur, TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION);
            double d5 = cur.getDouble(R4.a(cur, AiDatabase.COL_INSIGHT_SCORE));
            String string4 = cur.getString(R4.a(cur, "image_url"));
            Intrinsics.f(string4, "getString(checkColumnIndex(column))");
            String string5 = cur.getString(R4.a(cur, "linking"));
            Intrinsics.f(string5, "getString(checkColumnIndex(column))");
            return new u40.t(string, string2, string3, strF, d5, string4, string5);
        } catch (Exception unused) {
            return null;
        }
    }

    @Override // io.branch.search.internal.InterfaceC3167gb
    public final Object a(String sessionId, ArrayList queryResults) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(queryResults, "queryResults");
        ArrayList arrayList = new ArrayList();
        Iterator it = queryResults.iterator();
        while (it.hasNext()) {
            u40.t tVar = (u40.t) it.next();
            if (tVar != null) {
                arrayList.add(tVar);
            }
        }
        return arrayList;
    }
}
