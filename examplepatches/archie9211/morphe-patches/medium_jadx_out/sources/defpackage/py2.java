package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.membership.UpsellReferrer;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.donkey.launcher.LauncherActivity;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class py2 implements nw2 {
    public static final x2b i = new x2b("@(.*)");
    public static final x2b j = new x2b("tag|topic");
    public static final List k;
    public static final List l;
    public final iu7 a;
    public final l95 b;
    public final p13 c;
    public final ty2 d;
    public final pz2 e;
    public final a1a f;
    public final h1c g;
    public final sb2 h;

    static {
        final int i2 = 9;
        x45 x45Var = new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i2) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        };
        final int i3 = 13;
        ql1 ql1Var = new ql1(i3);
        final int i4 = 24;
        ql1 ql1Var2 = new ql1(i4);
        final int i5 = 5;
        x45 x45Var2 = new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i5) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        };
        final int i6 = 17;
        x45 x45Var3 = new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i6) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        };
        final int i7 = 19;
        x45 x45Var4 = new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i7) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        };
        final int i8 = 21;
        x45 x45Var5 = new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i8) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        };
        final int i9 = 22;
        x45 x45Var6 = new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i9) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        };
        final int i10 = 23;
        x45 x45Var7 = new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i10) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        };
        x45 x45Var8 = new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i4) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        };
        final int i11 = 20;
        x45 x45Var9 = new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i11) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        };
        final int i12 = 25;
        final int i13 = 26;
        final int i14 = 27;
        final int i15 = 28;
        final int i16 = 29;
        final int i17 = 10;
        final int i18 = 11;
        final int i19 = 12;
        final int i20 = 14;
        final int i21 = 15;
        final int i22 = 16;
        final int i23 = 18;
        final int i24 = 0;
        final int i25 = 1;
        k = d46.R(x45Var, ql1Var, ql1Var2, x45Var2, x45Var3, x45Var4, x45Var5, x45Var6, x45Var7, x45Var8, x45Var9, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i12) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i13) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i14) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i15) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i16) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new ql1(9), new ql1(i17), new ql1(i18), new ql1(i19), new ql1(i20), new ql1(i21), new ql1(i22), new ql1(17), new ql1(i23), new ql1(19), new ql1(20), new ql1(21), new ql1(22), new ql1(23), new ql1(25), new ql1(26), new ql1(27), new ql1(28), new ql1(29), new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i24) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i25) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        });
        final int i26 = 2;
        final int i27 = 3;
        final int i28 = 4;
        final int i29 = 6;
        final int i30 = 7;
        final int i31 = 8;
        l = d46.R(new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i26) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i27) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i28) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i29) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i30) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i31) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i17) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i18) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i19) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i3) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i20) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i21) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i22) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        }, new x45() { // from class: oy2
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z = false;
                Uri uri = (Uri) obj;
                switch (i23) {
                    case 0:
                        uri.getClass();
                        return ho2.B("choose", uri.getPathSegments());
                    case 1:
                        uri.getClass();
                        return ho2.B("mediumday", uri.getPathSegments());
                    case 2:
                        uri.getClass();
                        List<String> pathSegments = uri.getPathSegments();
                        if (pathSegments.size() >= 2) {
                            x2b x2bVar = py2.i;
                            String str = pathSegments.get(0);
                            str.getClass();
                            if (x2bVar.c(str)) {
                                z = true;
                            }
                        }
                        return Boolean.valueOf(z);
                    case 3:
                        uri.getClass();
                        List<String> pathSegments2 = uri.getPathSegments();
                        if (pathSegments2.size() >= 2 && g76.L(pathSegments2.get(0), "_")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 4:
                        uri.getClass();
                        List<String> pathSegments3 = uri.getPathSegments();
                        if (pathSegments3.size() >= 1 && g76.L(pathSegments3.get(0), "browse")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 5:
                        uri.getClass();
                        return ho2.B("creators", uri.getPathSegments());
                    case 6:
                        uri.getClass();
                        List<String> pathSegments4 = uri.getPathSegments();
                        if (pathSegments4.size() >= 1 && g76.L(pathSegments4.get(0), "ifttt")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 7:
                        uri.getClass();
                        List<String> pathSegments5 = uri.getPathSegments();
                        if (pathSegments5.size() >= 2 && g76.L(pathSegments5.get(0), "m")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 8:
                        uri.getClass();
                        List<String> pathSegments6 = uri.getPathSegments();
                        if (pathSegments6.size() >= 1 && g76.L(pathSegments6.get(0), "me")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 9:
                        uri.getClass();
                        return ho2.B("45", uri.getPathSegments());
                    case 10:
                        uri.getClass();
                        List<String> pathSegments7 = uri.getPathSegments();
                        if (pathSegments7.size() >= 1 && g76.L(pathSegments7.get(0), "membership")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 11:
                        uri.getClass();
                        List<String> pathSegments8 = uri.getPathSegments();
                        if (pathSegments8.size() >= 2 && g76.L(pathSegments8.get(0), "p")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 12:
                        uri.getClass();
                        List<String> pathSegments9 = uri.getPathSegments();
                        if (pathSegments9.size() >= 2 && g76.L(pathSegments9.get(0), "s")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 13:
                        uri.getClass();
                        List<String> pathSegments10 = uri.getPathSegments();
                        if (pathSegments10.size() >= 2 && g76.L(pathSegments10.get(0), "tag")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 14:
                        uri.getClass();
                        List<String> pathSegments11 = uri.getPathSegments();
                        if (pathSegments11.size() >= 2 && g76.L(pathSegments11.get(0), mgKMENwrbHf.jowcKMMWI)) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 15:
                        uri.getClass();
                        List<String> pathSegments12 = uri.getPathSegments();
                        if (pathSegments12.size() >= 1 && g76.L(pathSegments12.get(0), "trending")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 16:
                        uri.getClass();
                        List<String> pathSegments13 = uri.getPathSegments();
                        if (pathSegments13.size() >= 2 && g76.L(pathSegments13.get(0), "v1")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 17:
                        uri.getClass();
                        return ho2.B("creator-tools", uri.getPathSegments());
                    case 18:
                        uri.getClass();
                        List<String> pathSegments14 = uri.getPathSegments();
                        if (pathSegments14.size() >= 1 && g76.L(pathSegments14.get(0), "top-stories")) {
                            z = true;
                        }
                        return Boolean.valueOf(z);
                    case 19:
                        uri.getClass();
                        List<String> pathSegments15 = uri.getPathSegments();
                        pathSegments15.getClass();
                        return Boolean.valueOf(bu1.g1(pathSegments15, 1).equals(d46.Q("earn")));
                    case 20:
                        uri.getClass();
                        return ho2.B("gift-plans", uri.getPathSegments());
                    case 21:
                        uri.getClass();
                        return ho2.B("freakonomicsradio", uri.getPathSegments());
                    case 22:
                        uri.getClass();
                        return ho2.B("futurehuman", uri.getPathSegments());
                    case 23:
                        uri.getClass();
                        return ho2.B("gift", uri.getPathSegments());
                    case 24:
                        uri.getClass();
                        return ho2.B("gift-checkout", uri.getPathSegments());
                    case 25:
                        uri.getClass();
                        return ho2.B("greatescape", uri.getPathSegments());
                    case 26:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "the-trump-45")));
                    case 27:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "ticks")));
                    case 28:
                        uri.getClass();
                        return Boolean.valueOf(g76.L(uri.getPathSegments(), d46.R("l", "tribute")));
                    default:
                        uri.getClass();
                        return ho2.B("lovehate", uri.getPathSegments());
                }
            }
        });
    }

    public py2(iu7 iu7Var, l95 l95Var, p13 p13Var, ty2 ty2Var, pz2 pz2Var, a1a a1aVar, h1c h1cVar, sb2 sb2Var, dm4 dm4Var) {
        i03 i03Var = i03.a;
        this.a = iu7Var;
        this.b = l95Var;
        this.c = p13Var;
        this.d = ty2Var;
        this.e = pz2Var;
        this.f = a1aVar;
        this.g = h1cVar;
        this.h = sb2Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00dd  */
    /* JADX WARN: Type inference failed for: r37v0, types: [java.lang.Object, py2] */
    /* JADX WARN: Type inference failed for: r3v141, types: [java.lang.Integer] */
    /* JADX WARN: Type inference failed for: r5v55, types: [rba] */
    /* JADX WARN: Type inference failed for: r5v6, types: [com.medium.android.core.navigation.s, p13] */
    /* JADX WARN: Type inference failed for: r8v0, types: [n92] */
    /* JADX WARN: Type inference failed for: r8v108, types: [com.medium.android.core.susi.SusiDestination] */
    /* JADX WARN: Type inference failed for: r8v109, types: [com.medium.android.core.susi.SusiDestination$Deeplink] */
    /* JADX WARN: Type inference failed for: r8v110 */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    @Override // defpackage.nw2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a(android.content.Context r38, android.net.Uri r39, java.lang.String r40, defpackage.c55 r41) {
        /*
            Method dump skipped, instruction units count: 5874
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.py2.a(android.content.Context, android.net.Uri, java.lang.String, c55):void");
    }

    public final rj2 b() {
        return this.b.a();
    }

    public final void c(Context context, Uri uri, String str, c55 c55Var) {
        String strV0 = this.g.V0(uri.toString());
        if (strV0 != null) {
            String strConcat = "Extracted deeplink from Branch link: ".concat(strV0);
            km4.I(wld.a, null, strConcat, new Object[0], strConcat);
            Uri uriBuild = Uri.parse(strV0).buildUpon().appendQueryParameter("source", str).build();
            uriBuild.getClass();
            a(context, uriBuild, str, c55Var);
            return;
        }
        km4.I(wld.a, null, "Could not extract deeplink from Branch link, navigating to launcher", new Object[0], "Could not extract deeplink from Branch link, navigating to launcher");
        context.getClass();
        int i2 = LauncherActivity.t;
        Intent intentL0 = no3.L0(context, uri, null, null, 12);
        intentL0.addFlags(268468224);
        context.startActivity(intentL0);
    }

    public final void d(Context context, Uri uri, String str, String str2) throws PendingIntent.CanceledException {
        rj2 rj2VarA = this.b.a();
        p13 p13Var = this.c;
        if (rj2VarA != null) {
            p13Var.J(context, new UpsellInfo(UpsellReferrer.DEEPLINK, null, null, null, null, str2, 30, null), str, null);
            return;
        }
        String string = uri.toString();
        string.getClass();
        p13Var.K(context, str, new SusiDestination.Deeplink(string));
    }
}
