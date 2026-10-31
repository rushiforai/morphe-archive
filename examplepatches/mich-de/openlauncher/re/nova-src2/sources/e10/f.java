package e10;

import android.app.ActivityOptions;
import android.view.View;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public class f implements gy.w {

    /* renamed from: e, reason: collision with root package name */
    public static final d f51509e;

    /* renamed from: f, reason: collision with root package name */
    public static final a f51510f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ f[] f51511g;

    /* renamed from: a, reason: collision with root package name */
    public final int f51512a;

    /* renamed from: b, reason: collision with root package name */
    public final int f51513b;

    /* renamed from: c, reason: collision with root package name */
    public final int f51514c;

    /* renamed from: d, reason: collision with root package name */
    public final int f51515d;

    static {
        e eVar = new e(0, 2132020100, 16973825, 0, 0, "SYSTEM");
        d dVar = new d(1, 2132017494, 2132082692, 2130771980, 2130771981, "PSEUDO_PIE");
        f51509e = dVar;
        a aVar = new a(2, 2132017886, 2132082692, 2130771980, 2130771981, "CIRCLE");
        f51510f = aVar;
        f[] fVarArr = {eVar, dVar, aVar, new c(3, 2132017465, 2132082692, 2130772039, 2130772040, "MARSHMALLOW"), new f(4, 2132017469, 2132082692, 2130772039, 2130772040, "SLIDE_UP"), new b(5, 2132017470, 2132082690, 2130772013, 2130772014, "JELLYBEAN"), new f(6, 2132017463, 2132082689, 2130772009, 2130772010, "ICS"), new f(7, 2132017468, 2132082691, 2130772035, 2130772036, "SLIDE")};
        f51511g = fVarArr;
        EnumEntriesKt.a(fVarArr);
    }

    public f(int i5, int i11, int i12, int i13, int i14, String str) {
        this.f51512a = i11;
        this.f51513b = i12;
        this.f51514c = i13;
        this.f51515d = i14;
    }

    public static f valueOf(String str) {
        return (f) Enum.valueOf(f.class, str);
    }

    public static f[] values() {
        return (f[]) f51511g.clone();
    }

    @Override // gy.n0
    public final void a(p1.o oVar, int i5) {
        lb0.b.h(this, oVar);
    }

    @Override // gy.w
    public final int b() {
        return this.f51512a;
    }

    public boolean d() {
        return false;
    }

    public ActivityOptions g(o9.l lVar, View view, int i5, int i11, int i12, int i13) {
        return ActivityOptions.makeCustomAnimation(lVar, this.f51514c, this.f51515d);
    }
}
