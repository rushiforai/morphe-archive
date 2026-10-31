package y9;

import android.os.Process;
import android.os.UserHandle;
import e10.a3;
import java.text.Collator;
import java.util.Comparator;
import kotlin.Pair;

/* loaded from: classes.dex */
public final class i implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f96894a;

    /* renamed from: b, reason: collision with root package name */
    public final Comparator f96895b;

    public i(int i5) {
        this.f96894a = i5;
        switch (i5) {
            case 1:
                this.f96895b = Collator.getInstance();
                break;
            case 2:
                this.f96895b = new i(1);
                break;
            default:
                this.f96895b = Collator.getInstance();
                break;
        }
    }

    public int a(ga.j jVar, ga.j jVar2) {
        if (jVar == jVar2) {
            return 0;
        }
        if (jVar == null) {
            return -1;
        }
        if (jVar2 == null) {
            return 1;
        }
        if (a3.f51435a.f51548d) {
            UserHandle userHandleMyUserHandle = Process.myUserHandle();
            if (x7.f.L(jVar.i(), userHandleMyUserHandle)) {
                if (!x7.f.L(jVar2.i(), userHandleMyUserHandle)) {
                    return -1;
                }
            } else if (x7.f.L(jVar2.i(), userHandleMyUserHandle)) {
                return 1;
            }
        }
        CharSequence charSequence = jVar.f57300l;
        CharSequence charSequence2 = jVar2.f57300l;
        if (charSequence == charSequence2) {
            return 0;
        }
        if (charSequence == null) {
            return -1;
        }
        if (charSequence2 == null) {
            return 1;
        }
        return ((Collator) this.f96895b).compare(charSequence.toString(), charSequence2.toString());
    }

    public int b(String str, String str2) {
        int iCodePointAt = str.length() > 0 ? str.codePointAt(0) : 0;
        boolean z11 = (127462 <= iCodePointAt && iCodePointAt <= 128591) || Character.isLetterOrDigit(iCodePointAt);
        int iCodePointAt2 = str2.length() > 0 ? str2.codePointAt(0) : 0;
        boolean z12 = (127462 <= iCodePointAt2 && iCodePointAt2 <= 128591) || Character.isLetterOrDigit(iCodePointAt2);
        if (z11 && !z12) {
            return -1;
        }
        if (z11 || !z12) {
            return ((Collator) this.f96895b).compare(str, str2);
        }
        return 1;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        switch (this.f96894a) {
            case 0:
                return a((ga.j) obj, (ga.j) obj2);
            case 1:
                return b((String) obj, (String) obj2);
            default:
                return ((i) this.f96895b).b((String) ((Pair) obj).f71684b, (String) ((Pair) obj2).f71684b);
        }
    }
}
