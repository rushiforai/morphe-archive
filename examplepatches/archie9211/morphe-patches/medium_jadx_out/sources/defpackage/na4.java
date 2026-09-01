package defpackage;

import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class na4 {
    public static final na4 a = new na4();
    public static final HashMap b = new HashMap();

    public static final void a(ha4 ha4Var, ka4 ka4Var) {
        ka4Var.getClass();
        we4.d(new ma4(ha4Var, ka4Var));
    }

    public static final boolean b(ka4 ka4Var) {
        boolean z;
        ka4Var.getClass();
        boolean z2 = false;
        if (ka4.Unknown != ka4Var) {
            if (ka4.Core != ka4Var) {
                String string = f94.a().getSharedPreferences("com.facebook.internal.FEATURE_MANAGER", 0).getString(ka4Var.toKey(), null);
                if (string == null || !string.equals("18.2.3")) {
                    ka4 parent = ka4Var.getParent();
                    if (parent == ka4Var) {
                        switch (la4.a[ka4Var.ordinal()]) {
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
                            case 16:
                            case 17:
                            case 18:
                            case 19:
                            case 20:
                            case 21:
                            case 22:
                            case 23:
                            case 24:
                            case 25:
                            case 26:
                            case 27:
                            case 28:
                            case 29:
                            case 30:
                            case 31:
                            case 32:
                            case 33:
                            case 34:
                            case 35:
                            case 36:
                            case 37:
                                break;
                            default:
                                z2 = true;
                                break;
                        }
                        return we4.b(ka4Var.toKey(), f94.b(), z2);
                    }
                    if (b(parent)) {
                        switch (la4.a[ka4Var.ordinal()]) {
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
                            case 16:
                            case 17:
                            case 18:
                            case 19:
                            case 20:
                            case 21:
                            case 22:
                            case 23:
                            case 24:
                            case 25:
                            case 26:
                            case 27:
                            case 28:
                            case 29:
                            case 30:
                            case 31:
                            case 32:
                            case 33:
                            case 34:
                            case 35:
                            case 36:
                            case 37:
                                z = false;
                                break;
                            default:
                                z = true;
                                break;
                        }
                        if (we4.b(ka4Var.toKey(), f94.b(), z)) {
                        }
                    }
                }
            }
            return true;
        }
        return false;
    }
}
