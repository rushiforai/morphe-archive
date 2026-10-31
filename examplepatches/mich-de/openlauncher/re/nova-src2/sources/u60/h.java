package u60;

import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class h implements f {

    /* renamed from: a, reason: collision with root package name */
    public final String f90652a;

    /* renamed from: b, reason: collision with root package name */
    public final List f90653b;

    /* renamed from: c, reason: collision with root package name */
    public final String f90654c;

    /* renamed from: d, reason: collision with root package name */
    public final String f90655d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f90656e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f90657f;

    public h(String str, List list, String str2, String str3, boolean z11, boolean z12) {
        this.f90652a = str;
        this.f90653b = list;
        this.f90654c = str2;
        this.f90655d = str3;
        this.f90656e = z11;
        this.f90657f = z12;
    }

    @Override // u60.f
    public final int a() {
        return this.f90655d.length();
    }

    @Override // u60.f
    public final boolean b() {
        return true;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SyntaxImpl{type='");
        sb2.append(this.f90652a);
        sb2.append("', children=");
        sb2.append(this.f90653b);
        sb2.append(", alias='");
        sb2.append(this.f90654c);
        sb2.append("', matchedString='");
        sb2.append(this.f90655d);
        sb2.append("', greedy=");
        sb2.append(this.f90656e);
        sb2.append(", tokenized=");
        return a2.c.p(sb2, this.f90657f, AbstractJsonLexerKt.END_OBJ);
    }
}
