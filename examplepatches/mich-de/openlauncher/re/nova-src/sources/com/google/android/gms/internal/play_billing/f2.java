package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class f2 implements a3 {

    /* renamed from: b, reason: collision with root package name */
    public static final f2 f33393b = new f2(0);

    /* renamed from: c, reason: collision with root package name */
    public static final f2 f33394c = new f2(1);

    /* renamed from: d, reason: collision with root package name */
    public static final f2 f33395d = new f2(2);

    /* renamed from: e, reason: collision with root package name */
    public static final f2 f33396e = new f2(3);

    /* renamed from: f, reason: collision with root package name */
    public static final f2 f33397f = new f2(4);

    /* renamed from: g, reason: collision with root package name */
    public static final f2 f33398g = new f2(5);

    /* renamed from: h, reason: collision with root package name */
    public static final f2 f33399h = new f2(6);

    /* renamed from: i, reason: collision with root package name */
    public static final f2 f33400i = new f2(7);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33401a;

    public /* synthetic */ f2(int i5) {
        this.f33401a = i5;
    }

    @Override // com.google.android.gms.internal.play_billing.a3
    public final boolean zza(int i5) {
        switch (this.f33401a) {
            case 0:
                switch (i5) {
                }
            case 1:
                switch (i5) {
                    default:
                        switch (i5) {
                        }
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                    case 8:
                    case 9:
                    case 10:
                    case 11:
                    case 12:
                    case 13:
                    case 14:
                    case 15:
                        return true;
                }
            case 2:
                if (w4.a(i5) != null) {
                }
                break;
            case 3:
                if ((i5 != 0 ? i5 != 1 ? i5 != 2 ? i5 != 3 ? null : z4.ALTERNATIVE_BILLING_ACTION : z4.LOCAL_PURCHASES_UPDATED_ACTION : z4.PURCHASES_UPDATED_ACTION : z4.BROADCAST_ACTION_UNSPECIFIED) != null) {
                }
                break;
            case 4:
                if (i5 == 0 || i5 == 1 || i5 == 2 || i5 == 3) {
                }
                break;
            case 5:
                switch (i5) {
                }
            case 6:
                switch (i5) {
                }
            default:
                if (i5 == 0 || i5 == 1) {
                }
                break;
        }
        return true;
    }
}
