package bp;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

/* loaded from: classes4.dex */
public final class a implements Serializable {

    /* renamed from: c, reason: collision with root package name */
    public static final a f18344c = new a("P-256", "secp256r1");

    /* renamed from: d, reason: collision with root package name */
    public static final a f18345d = new a("secp256k1", "secp256k1");

    /* renamed from: e, reason: collision with root package name */
    public static final a f18346e = new a("P-256K", "secp256k1");

    /* renamed from: f, reason: collision with root package name */
    public static final a f18347f = new a("P-384", "secp384r1");

    /* renamed from: g, reason: collision with root package name */
    public static final a f18348g = new a("P-521", "secp521r1");

    /* renamed from: h, reason: collision with root package name */
    public static final a f18349h = new a("Ed25519", "Ed25519");

    /* renamed from: i, reason: collision with root package name */
    public static final a f18350i = new a("Ed448", "Ed448");

    /* renamed from: j, reason: collision with root package name */
    public static final a f18351j = new a("X25519", "X25519");

    /* renamed from: k, reason: collision with root package name */
    public static final a f18352k = new a("X448", "X448");

    /* renamed from: a, reason: collision with root package name */
    public final String f18353a;

    /* renamed from: b, reason: collision with root package name */
    public final String f18354b;

    public a(String str, String str2) {
        Objects.requireNonNull(str);
        this.f18353a = str;
        this.f18354b = str2;
    }

    public static Set a(uo.m mVar) {
        if (uo.m.f91482i.equals(mVar)) {
            return Collections.singleton(f18344c);
        }
        if (uo.m.f91483j.equals(mVar)) {
            return Collections.singleton(f18345d);
        }
        if (uo.m.f91484k.equals(mVar)) {
            return Collections.singleton(f18347f);
        }
        if (uo.m.f91485l.equals(mVar)) {
            return Collections.singleton(f18348g);
        }
        if (uo.m.f91487p.equals(mVar)) {
            return Collections.unmodifiableSet(new HashSet(Arrays.asList(f18349h, f18350i)));
        }
        return null;
    }

    public static a b(String str) {
        if (str == null || str.trim().isEmpty()) {
            throw new IllegalArgumentException("The cryptographic curve string must not be null or empty");
        }
        a aVar = f18344c;
        if (str.equals(aVar.f18353a)) {
            return aVar;
        }
        a aVar2 = f18346e;
        if (str.equals(aVar2.f18353a)) {
            return aVar2;
        }
        a aVar3 = f18345d;
        if (str.equals(aVar3.f18353a)) {
            return aVar3;
        }
        a aVar4 = f18347f;
        if (str.equals(aVar4.f18353a)) {
            return aVar4;
        }
        a aVar5 = f18348g;
        if (str.equals(aVar5.f18353a)) {
            return aVar5;
        }
        a aVar6 = f18349h;
        if (str.equals(aVar6.f18353a)) {
            return aVar6;
        }
        a aVar7 = f18350i;
        if (str.equals(aVar7.f18353a)) {
            return aVar7;
        }
        a aVar8 = f18351j;
        if (str.equals(aVar8.f18353a)) {
            return aVar8;
        }
        a aVar9 = f18352k;
        return str.equals(aVar9.f18353a) ? aVar9 : new a(str, null);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof a) {
            return this.f18353a.equals(((a) obj).f18353a);
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(this.f18353a);
    }

    public final String toString() {
        return this.f18353a;
    }
}
