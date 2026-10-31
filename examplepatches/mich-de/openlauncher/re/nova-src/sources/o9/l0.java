package o9;

import android.content.Context;
import android.graphics.Rect;
import com.android.launcher3.folder.FolderNameProvider;
import com.android.launcher3.logging.InstanceId;
import java.security.SecureRandom;

/* loaded from: classes2.dex */
public final class l0 {

    /* renamed from: l, reason: collision with root package name */
    public o7.g0 f79960l;

    /* renamed from: m, reason: collision with root package name */
    public FolderNameProvider f79961m;

    /* renamed from: a, reason: collision with root package name */
    public int f79949a = -1;

    /* renamed from: b, reason: collision with root package name */
    public int f79950b = -1;

    /* renamed from: c, reason: collision with root package name */
    public int f79951c = -1;

    /* renamed from: d, reason: collision with root package name */
    public int f79952d = -1;

    /* renamed from: e, reason: collision with root package name */
    public boolean f79953e = false;

    /* renamed from: f, reason: collision with root package name */
    public x9.u f79954f = null;

    /* renamed from: g, reason: collision with root package name */
    public ga.e f79955g = null;

    /* renamed from: h, reason: collision with root package name */
    public ga.e f79956h = null;

    /* renamed from: i, reason: collision with root package name */
    public k0 f79957i = null;

    /* renamed from: j, reason: collision with root package name */
    public boolean f79958j = false;

    /* renamed from: k, reason: collision with root package name */
    public boolean f79959k = true;
    public final InstanceId n = new InstanceId(new SecureRandom().nextInt(Math.min(Math.max(1, 1048576), 1048576)) + 1);

    public l0(Context context) {
        if (u9.b.f90695h.f90687d) {
            ya.j.f97149d.a(new kz.c(11, this, context));
        }
    }

    public final float[] a(float[] fArr) {
        if (fArr == null) {
            fArr = new float[2];
        }
        Rect rect = this.f79954f.n;
        int i5 = (this.f79949a - this.f79951c) - rect.left;
        int i11 = (this.f79950b - this.f79952d) - rect.top;
        fArr[0] = (rect.width() / 2) + i5;
        fArr[1] = (rect.height() / 2) + i11;
        return fArr;
    }
}
