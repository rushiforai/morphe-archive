package ads_mobile_sdk;

import hn.o;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import org.chromium.net.CronetProvider;

/* loaded from: classes2.dex */
public final class u extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public static final u f10157a;
    public static final u a$1;
    public static final u a$10;
    public static final u a$11;
    public static final u a$12;
    public static final u a$13;
    public static final u a$2;
    public static final u a$3;
    public static final u a$4;
    public static final u a$5;
    public static final u a$6;
    public static final u a$7;
    public static final u a$8;
    public static final u a$9;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f10158j;

    static {
        int i5 = 1;
        a$1 = new u(i5, 1);
        a$2 = new u(i5, 2);
        a$3 = new u(i5, 3);
        a$4 = new u(i5, 4);
        a$5 = new u(i5, 5);
        a$6 = new u(i5, 6);
        a$7 = new u(i5, 7);
        a$8 = new u(i5, 8);
        a$9 = new u(i5, 9);
        a$10 = new u(i5, 10);
        a$11 = new u(i5, 11);
        f10157a = new u(i5, 0);
        a$12 = new u(i5, 12);
        a$13 = new u(i5, 13);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ u(int i5, int i11) {
        super(i5);
        this.f10158j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f10158j) {
            case 0:
                WeakReference it = (WeakReference) obj;
                Intrinsics.g(it, "it");
                return Boolean.valueOf(it.get() == null);
            case 1:
                com.google.gson.p it2 = (com.google.gson.p) obj;
                Intrinsics.g(it2, "it");
                Duration.Companion companion = Duration.f72038b;
                return new Duration(DurationKt.g(it2.g(), DurationUnit.f72045d));
            case 2:
                com.google.gson.p it3 = (com.google.gson.p) obj;
                Intrinsics.g(it3, "it");
                Duration.Companion companion2 = Duration.f72038b;
                return new Duration(DurationKt.g(it3.g(), DurationUnit.f72047f));
            case 3:
                com.google.gson.p it4 = (com.google.gson.p) obj;
                Intrinsics.g(it4, "it");
                Duration.Companion companion3 = Duration.f72038b;
                return new Duration(DurationKt.g(it4.g(), DurationUnit.f72046e));
            case 4:
                com.google.gson.p it5 = (com.google.gson.p) obj;
                Intrinsics.g(it5, "it");
                String strO = it5.o();
                Intrinsics.f(strO, "getAsString(...)");
                return r70.k.i1(strO, new String[]{";"}, 6);
            case 5:
                return Boolean.valueOf(Intrinsics.b(((CronetProvider) obj).getName(), "Google-Play-Services-Cronet-Provider"));
            case 6:
                return Boolean.valueOf(((p31) obj) == null);
            case 7:
                com.google.gson.p it6 = (com.google.gson.p) obj;
                Intrinsics.g(it6, "it");
                String strO2 = it6.o();
                Intrinsics.f(strO2, "getAsString(...)");
                return strO2;
            case 8:
                com.google.gson.p it7 = (com.google.gson.p) obj;
                Intrinsics.g(it7, "it");
                o oVar = it7.j().f34795a;
                Intrinsics.f(oVar, "asMap(...)");
                LinkedHashMap linkedHashMap = new LinkedHashMap(b70.k.d0(oVar.f59936d));
                for (Map.Entry entry : oVar.entrySet()) {
                    linkedHashMap.put(entry.getKey(), ((com.google.gson.p) entry.getValue()).o());
                }
                return linkedHashMap;
            case 9:
                return String.format("%02x", Arrays.copyOf(new Object[]{Byte.valueOf(((Number) obj).byteValue())}, 1));
            case 10:
                Map.Entry entry2 = (Map.Entry) obj;
                return entry2.getKey() + ":" + entry2.getValue();
            case 11:
                p60 it8 = (p60) obj;
                Intrinsics.g(it8, "it");
                long jL = Duration.l(it8.f8110c, it8.f8109b.f5743b);
                return it8.f8108a + "." + Duration.h(jL);
            case 12:
                gh1 it9 = (gh1) obj;
                Intrinsics.g(it9, "it");
                return new by2(it9);
            default:
                com.google.gson.p it10 = (com.google.gson.p) obj;
                Intrinsics.g(it10, "it");
                return Long.valueOf(it10.l());
        }
    }
}
