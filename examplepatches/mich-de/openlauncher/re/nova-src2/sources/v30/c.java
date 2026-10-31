package v30;

import android.net.Uri;
import b.c0;
import b90.j;
import com.tiktok.util.UrlConst;
import cw.l2;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import w20.n;
import x80.d0;
import x80.e0;
import x80.g0;
import x80.m0;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final e0 f92050a;

    public c() {
        d0 d0Var = new d0();
        d0Var.a(n.f93704a);
        this.f92050a = new e0(d0Var);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0050, code lost:
    
        if (r12.equals("www.duckduckgo.com") != false) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x005a, code lost:
    
        if (r12.equals("duck.com") == false) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0073, code lost:
    
        if (r12.equals("duckduckgo.com") == false) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x00d9, code lost:
    
        return l10.q.f74444f;
     */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00c2 A[Catch: Exception -> 0x0034, TRY_LEAVE, TryCatch #1 {Exception -> 0x0034, blocks: (B:12:0x002f, B:42:0x00ba, B:44:0x00c2), top: B:57:0x002f }] */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:41:0x00b6 -> B:42:0x00ba). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:48:0x00ca -> B:49:0x00cc). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Comparable a(String str, ContinuationImpl continuationImpl) {
        b bVar;
        int i5;
        c cVar;
        String[] strArr;
        String str2;
        int i11;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i12 = bVar.B;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                bVar.B = i12 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, continuationImpl);
            }
        }
        Object obj = bVar.f92049z;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = bVar.B;
        if (i13 == 0) {
            ResultKt.b(obj);
            switch (str.hashCode()) {
                case -1609944339:
                    break;
                case 1041889936:
                    if (str.equals("ecosia.org")) {
                        return Uri.parse("https://cdn-static.ecosia.org/assets/images/png/apple-touch-icon.png");
                    }
                    i5 = 0;
                    cVar = this;
                    strArr = d.f92051a;
                    str2 = str;
                    i11 = 4;
                    if (i5 >= i11) {
                    }
                    break;
                case 1880661708:
                    break;
                case 2131475492:
                    break;
                default:
                    i5 = 0;
                    cVar = this;
                    strArr = d.f92051a;
                    str2 = str;
                    i11 = 4;
                    if (i5 >= i11) {
                    }
                    break;
            }
        } else {
            if (i13 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i11 = bVar.f92048y;
            i5 = bVar.f92047x;
            String str3 = bVar.f92046w;
            strArr = bVar.f92045v;
            String str4 = bVar.f92044u;
            cVar = bVar.f92043t;
            try {
                ResultKt.b(obj);
            } catch (Exception e3) {
                e = e3;
                e.printStackTrace();
                str2 = str4;
                i5++;
                if (i5 >= i11) {
                }
            }
            if (((m0) obj).c()) {
                return Uri.parse(str3);
            }
            str2 = str4;
            i5++;
            if (i5 >= i11) {
                String strM = c0.m(UrlConst.HTTPS, str2, "/", strArr[i5]);
                try {
                } catch (Exception e11) {
                    str4 = str2;
                    e = e11;
                    e.printStackTrace();
                    str2 = str4;
                    i5++;
                    if (i5 >= i11) {
                    }
                }
                g0 g0Var = new g0();
                g0Var.k(strM);
                g0Var.g(null, "HEAD");
                j jVarC = cVar.f92050a.c(g0Var.b());
                bVar.f92043t = cVar;
                bVar.f92044u = str2;
                bVar.f92045v = strArr;
                bVar.f92046w = strM;
                bVar.f92047x = i5;
                bVar.f92048y = i11;
                bVar.B = 1;
                Object objN = l2.n(jVarC, bVar);
                if (objN == coroutineSingletons) {
                    return coroutineSingletons;
                }
                str4 = str2;
                obj = objN;
                str3 = strM;
                if (((m0) obj).c()) {
                }
                str2 = str4;
                i5++;
                if (i5 >= i11) {
                    return p6.j.d(str2, null);
                }
            }
        }
    }
}
