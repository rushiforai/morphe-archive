package t0;

import android.content.res.Resources;
import android.os.Build;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class e1 {

    /* renamed from: d, reason: collision with root package name */
    public static final e1 f87969d;

    /* renamed from: e, reason: collision with root package name */
    public static final e1 f87970e;

    /* renamed from: f, reason: collision with root package name */
    public static final e1 f87971f;

    /* renamed from: g, reason: collision with root package name */
    public static final e1 f87972g;

    /* renamed from: h, reason: collision with root package name */
    public static final e1 f87973h;

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ e1[] f87974i;

    /* renamed from: a, reason: collision with root package name */
    public final Object f87975a;

    /* renamed from: b, reason: collision with root package name */
    public final int f87976b;

    /* renamed from: c, reason: collision with root package name */
    public final int f87977c;

    static {
        e1 e1Var = new e1("Cut", 0, w0.e.f93420a, 17039363, 16843537);
        f87969d = e1Var;
        e1 e1Var2 = new e1("Copy", 1, w0.e.f93421b, 17039361, 16843538);
        f87970e = e1Var2;
        e1 e1Var3 = new e1("Paste", 2, w0.e.f93422c, 17039371, 16843539);
        f87971f = e1Var3;
        e1 e1Var4 = new e1("SelectAll", 3, w0.e.f93423d, 17039373, 16843646);
        f87972g = e1Var4;
        e1 e1Var5 = new e1("Autofill", 4, w0.e.f93424e, Build.VERSION.SDK_INT <= 26 ? 2132017534 : 17039386, 0);
        f87973h = e1Var5;
        e1[] e1VarArr = {e1Var, e1Var2, e1Var3, e1Var4, e1Var5};
        f87974i = e1VarArr;
        EnumEntriesKt.a(e1VarArr);
    }

    public e1(String str, int i5, Object obj, int i11, int i12) {
        this.f87975a = obj;
        this.f87976b = i11;
        this.f87977c = i12;
    }

    public static e1 valueOf(String str) {
        return (e1) Enum.valueOf(e1.class, str);
    }

    public static e1[] values() {
        return (e1[]) f87974i.clone();
    }

    public final int a() {
        return this.f87977c;
    }

    public final Object b() {
        return this.f87975a;
    }

    public final String c(Resources resources) {
        return resources.getString(this.f87976b);
    }
}
