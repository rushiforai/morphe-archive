package k9;

import android.view.View;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final int[] f71232a;

    public f(int i5) {
        switch (i5) {
            case 1:
                this.f71232a = new int[2];
                break;
            default:
                this.f71232a = new int[1];
                break;
        }
    }

    public JSONObject a(View view) {
        if (view == null) {
            return ao.b.a(0, 0, 0, 0);
        }
        int width = view.getWidth();
        int height = view.getHeight();
        int[] iArr = this.f71232a;
        view.getLocationOnScreen(iArr);
        return ao.b.a(iArr[0], iArr[1], width, height);
    }
}
