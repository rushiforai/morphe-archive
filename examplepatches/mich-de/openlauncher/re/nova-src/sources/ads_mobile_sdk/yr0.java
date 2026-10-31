package ads_mobile_sdk;

import android.view.View;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.regex.Pattern;

/* loaded from: classes2.dex */
public final class yr0 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f12274a = new ArrayList();

    static {
        Pattern.compile("^[a-zA-Z0-9 ]+$");
    }

    public final void a(View view, xr0 xr0Var) {
        wr0 wr0Var;
        if (view == null) {
            throw new IllegalArgumentException("FriendlyObstruction is null");
        }
        ArrayList arrayList = this.f12274a;
        Iterator it = arrayList.iterator();
        while (true) {
            if (!it.hasNext()) {
                wr0Var = null;
                break;
            } else {
                wr0Var = (wr0) it.next();
                if (wr0Var.f11368a.get() == view) {
                    break;
                }
            }
        }
        if (wr0Var == null) {
            arrayList.add(new wr0(view, xr0Var));
        }
    }
}
