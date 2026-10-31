package eb;

import android.text.TextUtils;
import java.util.function.IntPredicate;
import ya.g0;

/* loaded from: classes2.dex */
public final /* synthetic */ class k implements IntPredicate {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52483a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f52484b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f52485c;

    public /* synthetic */ k(int i5, Object obj, Object obj2) {
        this.f52483a = i5;
        this.f52484b = obj;
        this.f52485c = obj2;
    }

    @Override // java.util.function.IntPredicate
    public final boolean test(int i5) {
        switch (this.f52483a) {
            case 0:
                l lVar = (l) this.f52484b;
                g0 g0Var = (g0) this.f52485c;
                db.c cVar = (db.c) lVar.f52491f.get(i5);
                if (!(cVar instanceof db.b) || !l.b(cVar, g0Var)) {
                }
                break;
            default:
                CharSequence[] charSequenceArr = (CharSequence[]) this.f52484b;
                String str = (String) this.f52485c;
                if (TextUtils.isEmpty(charSequenceArr[i5]) || !str.equalsIgnoreCase(charSequenceArr[i5].toString())) {
                }
                break;
        }
        return false;
    }
}
