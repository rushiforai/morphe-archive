package ep;

/* loaded from: classes4.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static final int f52875a;

    static {
        int i5;
        String property = System.getProperty("java.version");
        try {
            String[] strArrSplit = property.split("[._]", 3);
            i5 = Integer.parseInt(strArrSplit[0]);
            if (i5 == 1 && strArrSplit.length > 1) {
                i5 = Integer.parseInt(strArrSplit[1]);
            }
        } catch (NumberFormatException unused) {
            i5 = -1;
        }
        if (i5 == -1) {
            try {
                StringBuilder sb2 = new StringBuilder();
                for (int i11 = 0; i11 < property.length(); i11++) {
                    char cCharAt = property.charAt(i11);
                    if (!Character.isDigit(cCharAt)) {
                        break;
                    }
                    sb2.append(cCharAt);
                }
                i5 = Integer.parseInt(sb2.toString());
            } catch (NumberFormatException unused2) {
                i5 = -1;
            }
        }
        if (i5 == -1) {
            i5 = 6;
        }
        f52875a = i5;
    }
}
