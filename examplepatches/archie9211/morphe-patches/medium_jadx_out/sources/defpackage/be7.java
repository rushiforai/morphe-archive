package defpackage;

import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class be7 implements x45 {
    public final /* synthetic */ int a;

    public /* synthetic */ be7(int i) {
        this.a = i;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        String strValueOf;
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                jyb jybVar = (jyb) obj;
                jybVar.getClass();
                hyb.a(jybVar);
                break;
            case 1:
                ((Long) obj).getClass();
                break;
            case 2:
                Locale locale = Locale.US;
                String str = (String) obj;
                str.getClass();
                if (str.length() > 0) {
                    StringBuilder sb = new StringBuilder();
                    char cCharAt = str.charAt(0);
                    if (Character.isLowerCase(cCharAt)) {
                        locale.getClass();
                        strValueOf = kyd.j0(cCharAt, locale);
                    } else {
                        strValueOf = String.valueOf(cCharAt);
                    }
                    sb.append((Object) strValueOf);
                    sb.append(str.substring(1));
                }
                break;
            case 3:
                w7c w7cVar = (w7c) obj;
                w7cVar.getClass();
                break;
            case 4:
                ((Boolean) obj).getClass();
                break;
            case 5:
                ((Boolean) obj).getClass();
                break;
            case 6:
                ((Boolean) obj).getClass();
                break;
            case 7:
                ((Boolean) obj).getClass();
                break;
            case 8:
                ((Boolean) obj).getClass();
                break;
            case 9:
                ((Boolean) obj).getClass();
                break;
            case 10:
                ((Boolean) obj).getClass();
                break;
            case 11:
                ((Boolean) obj).getClass();
                break;
            case 12:
                ((zl3) obj).getClass();
                break;
            case 13:
                jyb jybVar2 = (jyb) obj;
                jybVar2.getClass();
                hyb.a(jybVar2);
                break;
            case 14:
                ((Boolean) obj).getClass();
                break;
            case 15:
                ((Boolean) obj).getClass();
                break;
            case 16:
                ((Boolean) obj).getClass();
                break;
            case 17:
                ((Boolean) obj).getClass();
                break;
            case 18:
                ((Boolean) obj).getClass();
                break;
            case 19:
                ((Boolean) obj).getClass();
                break;
            case 20:
                ((Boolean) obj).getClass();
                break;
            case 21:
                ((Boolean) obj).getClass();
                break;
            case 22:
                Integer num = (Integer) obj;
                num.intValue();
                break;
            case 23:
                ((String) obj).getClass();
                break;
            case 24:
                ((String) obj).getClass();
                break;
            case 25:
                ((String) obj).getClass();
                break;
            case 26:
                ((String) obj).getClass();
                break;
            case 27:
                ((String) obj).getClass();
                break;
            case 28:
                ((String) obj).getClass();
                break;
            default:
                ((String) obj).getClass();
                break;
        }
        return c1eVar;
    }
}
