package cy;

import android.content.SharedPreferences;

/* loaded from: classes4.dex */
public final /* synthetic */ class v implements SharedPreferences.OnSharedPreferenceChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48540a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f48541b;

    public /* synthetic */ v(Object obj, int i5) {
        this.f48540a = i5;
        this.f48541b = obj;
    }

    @Override // android.content.SharedPreferences.OnSharedPreferenceChangeListener
    public final void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String str) {
        switch (this.f48540a) {
            case 0:
                v70.x xVar = (v70.x) this.f48541b;
                if (str != null && str.hashCode() == -317239989 && str.equals("plus_active")) {
                    ((v70.w) xVar).j(Boolean.valueOf(sharedPreferences.getBoolean("plus_active", false)));
                    break;
                }
                break;
            default:
                ((ib0.a) this.f48541b).c(str);
                break;
        }
    }
}
