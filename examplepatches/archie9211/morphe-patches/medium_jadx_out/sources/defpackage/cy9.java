package defpackage;

/* JADX INFO: loaded from: classes.dex */
public final class cy9 implements x45 {
    public static final /* synthetic */ cy9 b = new cy9(2);
    public static final /* synthetic */ cy9 c = new cy9(3);
    public final /* synthetic */ int a;

    public /* synthetic */ cy9(int i) {
        this.a = i;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        switch (this.a) {
            case 0:
                ydc ydcVar = (ydc) obj;
                ydcVar.getClass();
                String strConcat = "java/util/".concat("Spliterator");
                y96 y96Var = fy9.b;
                ydcVar.c(strConcat, y96Var, y96Var);
                return c1e.a;
            case 1:
                if (((y05) obj) != null) {
                    return Boolean.valueOf(!r5.equals(lnc.y));
                }
                ay0.e("Argument for @NotNull parameter 'name' of kotlin/reflect/jvm/internal/impl/types/TypeSubstitutor$1.invoke must not be null");
                return null;
            case 2:
                vqf vqfVar = (vqf) obj;
                String strF = kp7.F(vqfVar);
                String str = "REAL";
                switch (vqfVar.ordinal()) {
                    case 1:
                        str = "INTEGER PRIMARY KEY AUTOINCREMENT";
                        break;
                    case 2:
                        str = "BLOB";
                        break;
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                    case 8:
                    case 11:
                    case 12:
                    case 13:
                    case 14:
                    case 17:
                        str = "INTEGER";
                        break;
                    case 9:
                    case 10:
                    case 15:
                    case 16:
                        break;
                    default:
                        str = "COLUMN_UNSPECIFIED";
                        break;
                }
                return y30.s(new StringBuilder(str.length() + strF.length() + 1), strF, " ", str);
            default:
                int i = obg.a;
                return String.valueOf(((tbg) obj).c);
        }
    }
}
