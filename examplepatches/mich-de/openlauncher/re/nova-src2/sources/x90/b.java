package x90;

import cf.c;
import java.util.ArrayList;
import java.util.Iterator;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import w90.d;
import w90.e;
import w90.f;
import y90.g;
import y90.k;

/* loaded from: classes5.dex */
public final class b extends da0.a {

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f95730c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f95731d;

    /* renamed from: a, reason: collision with root package name */
    public final w90.a f95728a = new w90.a();

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f95729b = new ArrayList();

    /* renamed from: e, reason: collision with root package name */
    public boolean f95732e = true;

    public b(ArrayList arrayList, ArrayList arrayList2) {
        this.f95730c = arrayList;
        this.f95731d = arrayList2;
    }

    public static ArrayList j(CharSequence charSequence) {
        String strTrim = charSequence.toString().trim();
        if (strTrim.startsWith("|")) {
            strTrim = strTrim.substring(1);
        }
        ArrayList arrayList = new ArrayList();
        StringBuilder sb2 = new StringBuilder();
        int i5 = 0;
        while (i5 < strTrim.length()) {
            char cCharAt = strTrim.charAt(i5);
            if (cCharAt == '\\') {
                int i11 = i5 + 1;
                if (i11 >= strTrim.length() || strTrim.charAt(i11) != '|') {
                    sb2.append(AbstractJsonLexerKt.STRING_ESC);
                } else {
                    sb2.append('|');
                    i5 = i11;
                }
            } else if (cCharAt != '|') {
                sb2.append(cCharAt);
            } else {
                arrayList.add(sb2.toString());
                sb2.setLength(0);
            }
            i5++;
        }
        if (sb2.length() > 0) {
            arrayList.add(sb2.toString());
        }
        return arrayList;
    }

    @Override // da0.a
    public final void a(CharSequence charSequence) {
        if (this.f95732e) {
            this.f95732e = false;
        } else {
            this.f95729b.add(charSequence);
        }
    }

    @Override // da0.a
    public final ba0.a e() {
        return this.f95728a;
    }

    @Override // da0.a
    public final void g(k kVar) {
        ArrayList arrayList = this.f95731d;
        int size = arrayList.size();
        e eVar = new e();
        w90.a aVar = this.f95728a;
        aVar.b(eVar);
        f fVar = new f();
        eVar.b(fVar);
        for (int i5 = 0; i5 < size; i5++) {
            d dVarI = i((String) arrayList.get(i5), i5, kVar);
            dVarI.f94124f = true;
            fVar.b(dVarI);
        }
        Iterator it = this.f95729b.iterator();
        w90.b bVar = null;
        while (it.hasNext()) {
            ArrayList arrayListJ = j((CharSequence) it.next());
            f fVar2 = new f();
            int i11 = 0;
            while (i11 < size) {
                fVar2.b(i(i11 < arrayListJ.size() ? (String) arrayListJ.get(i11) : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, i11, kVar));
                i11++;
            }
            if (bVar == null) {
                bVar = new w90.b();
                aVar.b(bVar);
            }
            bVar.b(fVar2);
        }
    }

    @Override // da0.a
    public final c h(g gVar) {
        if (gVar.f97031a.toString().contains("|")) {
            return c.a(gVar.f97032b);
        }
        return null;
    }

    public final d i(String str, int i5, k kVar) {
        d dVar = new d();
        ArrayList arrayList = this.f95730c;
        if (i5 < arrayList.size()) {
            dVar.f94125g = (w90.c) arrayList.get(i5);
        }
        kVar.f(str.trim(), dVar);
        return dVar;
    }
}
