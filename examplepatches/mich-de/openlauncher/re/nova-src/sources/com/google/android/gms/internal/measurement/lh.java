package com.google.android.gms.internal.measurement;

import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class lh extends th {

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f32800f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lh(String str, Class cls, boolean z11, boolean z12, int i5) {
        super(str, cls, z11, z12);
        this.f32800f = i5;
    }

    @Override // com.google.android.gms.internal.measurement.th
    public void a(Iterator it, fi fiVar) {
        switch (this.f32800f) {
            case 0:
                if (it.hasNext()) {
                    Object next = it.next();
                    boolean zHasNext = it.hasNext();
                    String str = this.f33092a;
                    if (!zHasNext) {
                        fiVar.a(next, str);
                        break;
                    } else {
                        StringBuilder sb2 = new StringBuilder("[");
                        sb2.append(next);
                        do {
                            sb2.append(AbstractJsonLexerKt.COMMA);
                            sb2.append(it.next());
                        } while (it.hasNext());
                        sb2.append(AbstractJsonLexerKt.END_LIST);
                        fiVar.a(sb2.toString(), str);
                        break;
                    }
                }
                break;
            default:
                super.a(it, fiVar);
                break;
        }
    }

    @Override // com.google.android.gms.internal.measurement.th
    public void b(Object obj, fi fiVar) {
        switch (this.f32800f) {
            case 1:
                x xVar = (x) obj;
                if (xVar == null) {
                    return;
                }
                v vVar = xVar.f33206a.f33167c;
                vVar.getClass();
                int i5 = 0;
                while (true) {
                    if (!(i5 < vVar.d() - vVar.c())) {
                        return;
                    }
                    if (i5 >= vVar.d() - vVar.c()) {
                        throw new NoSuchElementException();
                    }
                    w wVar = vVar.f33119b;
                    int iC = vVar.c() + i5;
                    i5++;
                    Map.Entry entry = (Map.Entry) wVar.f33165a[iC];
                    if (((Set) entry.getValue()).isEmpty()) {
                        fiVar.a(null, (String) entry.getKey());
                    } else {
                        Iterator it = ((Set) entry.getValue()).iterator();
                        while (it.hasNext()) {
                            fiVar.a(it.next(), (String) entry.getKey());
                        }
                    }
                }
            default:
                super.b(obj, fiVar);
                return;
        }
    }
}
