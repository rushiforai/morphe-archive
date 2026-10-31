package ay;

import android.content.Context;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public abstract class a implements p {

    /* renamed from: a, reason: collision with root package name */
    public final int f15735a;

    /* renamed from: b, reason: collision with root package name */
    public final String f15736b;

    /* renamed from: c, reason: collision with root package name */
    public final String f15737c;

    public a(int i5, String str, String str2) {
        this.f15735a = i5;
        this.f15736b = str;
        this.f15737c = str2;
    }

    @Override // ay.p
    public final String a(Context context) {
        return this.f15736b;
    }

    public abstract boolean b(ArrayList arrayList);

    public final String c() {
        return this.f15737c;
    }
}
