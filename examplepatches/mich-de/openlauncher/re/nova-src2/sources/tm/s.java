package tm;

import android.text.TextUtils;
import bn.s0;
import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public final class s {

    /* renamed from: b, reason: collision with root package name */
    public static WeakReference f89509b;

    /* renamed from: a, reason: collision with root package name */
    public s0 f89510a;

    public final synchronized r a() {
        String str;
        r rVar;
        s0 s0Var = this.f89510a;
        synchronized (((ArrayDeque) s0Var.f18282e)) {
            str = (String) ((ArrayDeque) s0Var.f18282e).peek();
        }
        Pattern pattern = r.f89505d;
        rVar = null;
        if (!TextUtils.isEmpty(str)) {
            String[] strArrSplit = str.split("!", -1);
            if (strArrSplit.length == 2) {
                rVar = new r(strArrSplit[0], strArrSplit[1]);
            }
        }
        return rVar;
    }
}
