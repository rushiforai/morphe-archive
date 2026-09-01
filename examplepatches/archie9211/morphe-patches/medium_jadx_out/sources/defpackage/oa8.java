package defpackage;

import android.os.Bundle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class oa8 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Bundle b;

    public /* synthetic */ oa8(int i, Bundle bundle) {
        this.a = i;
        this.b = bundle;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        boolean zContainsKey;
        int i = this.a;
        Bundle bundle = this.b;
        String str = (String) obj;
        switch (i) {
            case 0:
                str.getClass();
                zContainsKey = bundle.containsKey(str);
                break;
            default:
                str.getClass();
                zContainsKey = bundle.containsKey(str);
                break;
        }
        return Boolean.valueOf(!zContainsKey);
    }
}
