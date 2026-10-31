package y4;

import e30.j;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: b, reason: collision with root package name */
    public static final String f96636b;

    /* renamed from: c, reason: collision with root package name */
    public static final String f96637c;

    /* renamed from: d, reason: collision with root package name */
    public static final b f96638d;

    /* renamed from: e, reason: collision with root package name */
    public static final b f96639e;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f96640a;

    static {
        j jVar = f.f96648c;
        f96636b = Character.toString((char) 8206);
        f96637c = Character.toString((char) 8207);
        f96638d = new b(false);
        f96639e = new b(true);
    }

    public b(boolean z11) {
        j jVar = f.f96646a;
        this.f96640a = z11;
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x006e, code lost:
    
        if (r1 != 0) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0071, code lost:
    
        if (r2 == 0) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x0073, code lost:
    
        return r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0076, code lost:
    
        if (r0.f96634c <= 0) goto L63;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x007c, code lost:
    
        switch(r0.a()) {
            case 14: goto L66;
            case 15: goto L66;
            case 16: goto L65;
            case 17: goto L65;
            case 18: goto L64;
            default: goto L70;
        };
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0080, code lost:
    
        r3 = r3 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0083, code lost:
    
        if (r1 != r3) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0085, code lost:
    
        return 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0086, code lost:
    
        r3 = r3 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x0089, code lost:
    
        if (r1 != r3) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x008c, code lost:
    
        return 0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int a(CharSequence charSequence) {
        byte directionality;
        a aVar = new a(charSequence);
        aVar.f96634c = 0;
        int i5 = 0;
        int i11 = 0;
        int i12 = 0;
        while (true) {
            int i13 = aVar.f96634c;
            if (i13 < aVar.f96633b && i5 == 0) {
                CharSequence charSequence2 = aVar.f96632a;
                char cCharAt = charSequence2.charAt(i13);
                aVar.f96635d = cCharAt;
                if (Character.isHighSurrogate(cCharAt)) {
                    int iCodePointAt = Character.codePointAt(charSequence2, aVar.f96634c);
                    aVar.f96634c = Character.charCount(iCodePointAt) + aVar.f96634c;
                    directionality = Character.getDirectionality(iCodePointAt);
                } else {
                    aVar.f96634c++;
                    char c11 = aVar.f96635d;
                    directionality = c11 < 1792 ? a.f96631e[c11] : Character.getDirectionality(c11);
                }
                if (directionality != 0) {
                    if (directionality == 1 || directionality == 2) {
                        if (i12 == 0) {
                        }
                    } else if (directionality != 9) {
                        switch (directionality) {
                            case 14:
                            case 15:
                                i12++;
                                i11 = -1;
                                continue;
                            case 16:
                            case 17:
                                i12++;
                                i11 = 1;
                                continue;
                            case 18:
                                i12--;
                                i11 = 0;
                                continue;
                        }
                    }
                } else if (i12 == 0) {
                }
                i5 = i12;
            }
        }
        return -1;
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0034, code lost:
    
        return 1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int b(CharSequence charSequence) {
        a aVar = new a(charSequence);
        aVar.f96634c = aVar.f96633b;
        int i5 = 0;
        while (true) {
            int i11 = i5;
            while (aVar.f96634c > 0) {
                byte bA = aVar.a();
                if (bA != 0) {
                    if (bA == 1 || bA == 2) {
                        if (i5 != 0) {
                            if (i11 == 0) {
                                break;
                            }
                        }
                    } else if (bA != 9) {
                        switch (bA) {
                            case 14:
                            case 15:
                                if (i11 == i5) {
                                    return -1;
                                }
                                i5--;
                                break;
                            case 16:
                            case 17:
                                if (i11 == i5) {
                                    break;
                                }
                                i5--;
                                break;
                            case 18:
                                i5++;
                                break;
                            default:
                                if (i11 != 0) {
                                    break;
                                } else {
                                    break;
                                }
                        }
                    } else {
                        continue;
                    }
                } else {
                    if (i5 == 0) {
                        return -1;
                    }
                    if (i11 == 0) {
                        break;
                    }
                }
            }
            return 0;
        }
    }
}
