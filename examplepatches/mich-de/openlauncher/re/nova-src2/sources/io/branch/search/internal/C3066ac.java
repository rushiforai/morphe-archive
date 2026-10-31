package io.branch.search.internal;

import android.content.ContentValues;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import io.branch.search.internal.Rb;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.ac, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3066ac extends Lambda implements Function1<InterfaceC3365s7, List<? extends Pair<? extends Long, ? extends Long>>> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ List<Pair<Rb, Long>> f63954a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3066ac(ArrayList arrayList) {
        super(1);
        this.f63954a = arrayList;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Pair pair;
        InterfaceC3365s7 inTransaction = (InterfaceC3365s7) obj;
        Intrinsics.g(inTransaction, "$this$inTransaction");
        List<Pair<Rb, Long>> list = this.f63954a;
        ArrayList arrayList = new ArrayList();
        Iterator<T> it = list.iterator();
        while (it.hasNext()) {
            Pair pair2 = (Pair) it.next();
            Rb rb2 = (Rb) pair2.f71683a;
            long jLongValue = ((Number) pair2.f71684b).longValue();
            if (rb2 instanceof Rb.a) {
                ContentValues contentValues = new ContentValues();
                contentValues.put("create_time", Long.valueOf(rb2.a()));
                contentValues.put(TTConst.TRACK_TYPE, "CLICK_EVENT");
                contentValues.put("state", rb2.b().name());
                contentValues.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, ((Rb.a) rb2).f63279d);
                contentValues.put("crash_count", Integer.valueOf(rb2.d()));
                contentValues.put("fail_count", Integer.valueOf(rb2.c()));
                Unit unit = Unit.f71706a;
                pair = new Pair(Long.valueOf(inTransaction.insert("retry_entry", 5, contentValues)), Long.valueOf(jLongValue));
            } else {
                pair = null;
            }
            if (pair != null) {
                arrayList.add(pair);
            }
        }
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            Pair pair3 = (Pair) it2.next();
            long jLongValue2 = ((Number) pair3.f71683a).longValue();
            long jLongValue3 = ((Number) pair3.f71684b).longValue();
            ContentValues contentValues2 = new ContentValues();
            contentValues2.put("retry_entry_id", Long.valueOf(jLongValue2));
            contentValues2.put("time", Long.valueOf(jLongValue3));
            Unit unit2 = Unit.f71706a;
            inTransaction.insert("retry_entry_schedule", 5, contentValues2);
        }
        return arrayList;
    }
}
