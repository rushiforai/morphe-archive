package defpackage;

import android.app.Activity;
import java.lang.ref.WeakReference;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hgf extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Activity b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ hgf(Activity activity, int i) {
        super(1);
        this.a = i;
        this.b = activity;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        Activity activity = this.b;
        switch (i) {
            case 0:
                Map.Entry entry = (Map.Entry) obj;
                entry.getClass();
                return Boolean.valueOf(g76.L(((WeakReference) entry.getValue()).get(), activity));
            default:
                Map.Entry entry2 = (Map.Entry) obj;
                entry2.getClass();
                return Boolean.valueOf(g76.L(((WeakReference) entry2.getValue()).get(), activity));
        }
    }
}
