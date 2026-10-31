package fa;

import android.animation.Animator;
import android.content.ComponentName;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import com.amplitude.core.events.Plan;
import com.android.launcher3.LauncherProvider;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.util.ComponentKey;
import com.teslacoilsw.launcher.icon.NovaIconSource;

/* loaded from: classes2.dex */
public final /* synthetic */ class f0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54402a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f54403b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f54404c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f54405d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f54406e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f54407f;

    public /* synthetic */ f0(int i5, int i11, Object obj, Object obj2, Object obj3, Object obj4) {
        this.f54402a = i11;
        this.f54403b = obj;
        this.f54404c = i5;
        this.f54405d = obj2;
        this.f54406e = obj3;
        this.f54407f = obj4;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f54402a) {
            case 0:
                String str = (String) this.f54403b;
                BitmapInfo bitmapInfo = (BitmapInfo) this.f54405d;
                LauncherProvider launcherProvider = (LauncherProvider) this.f54406e;
                Uri uri = (Uri) this.f54407f;
                ContentValues contentValues = new ContentValues();
                contentValues.put("_id", Integer.valueOf(this.f54404c));
                if (str == null) {
                    contentValues.putNull(Plan.AMP_PLAN_SOURCE);
                } else {
                    contentValues.put(Plan.AMP_PLAN_SOURCE, str);
                }
                contentValues.put("icon", aa.p.a(bitmapInfo.f21151a));
                contentValues.putNull("adaptivefg");
                launcherProvider.getContext().getContentResolver().insert(uri, contentValues);
                break;
            case 1:
                p0 p0Var = (p0) this.f54405d;
                ComponentKey componentKey = (ComponentKey) this.f54406e;
                String str2 = (String) this.f54403b;
                NovaIconSource novaIconSource = (NovaIconSource) this.f54407f;
                Context context = p0Var.f54455a;
                ya.b bVar = new ya.b(context);
                ComponentName componentName = componentKey.f21251a;
                ContentValues contentValues2 = bVar.f97103a;
                if (componentName == null) {
                    contentValues2.putNull("componentName");
                } else {
                    contentValues2.put("componentName", componentName.flattenToShortString());
                }
                bVar.d(componentKey.f21252b);
                if (str2 != null) {
                    bVar.k("title", str2);
                } else {
                    bVar.m("title");
                }
                if (novaIconSource != null) {
                    bVar.e(novaIconSource);
                } else {
                    bVar.m("customIconSource");
                }
                bVar.h(Integer.valueOf(this.f54404c), "flags");
                context.getContentResolver().insert(Uri.parse("content://com.teslacoilsw.launcher.settings/allapps/"), bVar.b(context));
                break;
            default:
                ra.f fVar = (ra.f) this.f54403b;
                ra.a aVar = (ra.a) this.f54405d;
                ra.a aVar2 = (ra.a) this.f54406e;
                Animator.AnimatorListener animatorListener = (Animator.AnimatorListener) this.f54407f;
                if (((ra.c) fVar.f85760b).f85758g == this.f54404c) {
                    fVar.k(aVar, aVar2, animatorListener);
                    break;
                }
                break;
        }
    }

    public /* synthetic */ f0(p0 p0Var, ComponentKey componentKey, String str, NovaIconSource novaIconSource, int i5) {
        this.f54402a = 1;
        this.f54405d = p0Var;
        this.f54406e = componentKey;
        this.f54403b = str;
        this.f54407f = novaIconSource;
        this.f54404c = i5;
    }
}
