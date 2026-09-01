package defpackage;

import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qf4 implements rf4 {
    public static final qf4 IDENTITY;
    public static final qf4 LOWER_CASE_WITH_DASHES;
    public static final qf4 LOWER_CASE_WITH_DOTS;
    public static final qf4 LOWER_CASE_WITH_UNDERSCORES;
    public static final qf4 UPPER_CAMEL_CASE;
    public static final qf4 UPPER_CAMEL_CASE_WITH_SPACES;
    public static final qf4 UPPER_CASE_WITH_UNDERSCORES;
    public static final /* synthetic */ qf4[] a;

    static {
        qf4 qf4Var = new qf4() { // from class: jf4
            @Override // defpackage.qf4, defpackage.rf4
            public List alternateNames(Field field) {
                return Collections.EMPTY_LIST;
            }

            @Override // defpackage.qf4, defpackage.rf4
            public String translateName(Field field) {
                return field.getName();
            }
        };
        IDENTITY = qf4Var;
        qf4 qf4Var2 = new qf4() { // from class: kf4
            @Override // defpackage.qf4, defpackage.rf4
            public List alternateNames(Field field) {
                return Collections.EMPTY_LIST;
            }

            @Override // defpackage.qf4, defpackage.rf4
            public String translateName(Field field) {
                return qf4.b(field.getName());
            }
        };
        UPPER_CAMEL_CASE = qf4Var2;
        qf4 qf4Var3 = new qf4() { // from class: lf4
            @Override // defpackage.qf4, defpackage.rf4
            public List alternateNames(Field field) {
                return Collections.EMPTY_LIST;
            }

            @Override // defpackage.qf4, defpackage.rf4
            public String translateName(Field field) {
                return qf4.b(qf4.a(field.getName(), ' '));
            }
        };
        UPPER_CAMEL_CASE_WITH_SPACES = qf4Var3;
        qf4 qf4Var4 = new qf4() { // from class: mf4
            @Override // defpackage.qf4, defpackage.rf4
            public List alternateNames(Field field) {
                return Collections.EMPTY_LIST;
            }

            @Override // defpackage.qf4, defpackage.rf4
            public String translateName(Field field) {
                return qf4.a(field.getName(), '_').toUpperCase(Locale.ENGLISH);
            }
        };
        UPPER_CASE_WITH_UNDERSCORES = qf4Var4;
        qf4 qf4Var5 = new qf4() { // from class: nf4
            @Override // defpackage.qf4, defpackage.rf4
            public List alternateNames(Field field) {
                return Collections.EMPTY_LIST;
            }

            @Override // defpackage.qf4, defpackage.rf4
            public String translateName(Field field) {
                return qf4.a(field.getName(), '_').toLowerCase(Locale.ENGLISH);
            }
        };
        LOWER_CASE_WITH_UNDERSCORES = qf4Var5;
        qf4 qf4Var6 = new qf4() { // from class: of4
            @Override // defpackage.qf4, defpackage.rf4
            public List alternateNames(Field field) {
                return Collections.EMPTY_LIST;
            }

            @Override // defpackage.qf4, defpackage.rf4
            public String translateName(Field field) {
                return qf4.a(field.getName(), '-').toLowerCase(Locale.ENGLISH);
            }
        };
        LOWER_CASE_WITH_DASHES = qf4Var6;
        qf4 qf4Var7 = new qf4() { // from class: pf4
            @Override // defpackage.qf4, defpackage.rf4
            public List alternateNames(Field field) {
                return Collections.EMPTY_LIST;
            }

            @Override // defpackage.qf4, defpackage.rf4
            public String translateName(Field field) {
                return qf4.a(field.getName(), '.').toLowerCase(Locale.ENGLISH);
            }
        };
        LOWER_CASE_WITH_DOTS = qf4Var7;
        a = new qf4[]{qf4Var, qf4Var2, qf4Var3, qf4Var4, qf4Var5, qf4Var6, qf4Var7};
    }

    public static String a(String str, char c) {
        StringBuilder sb = new StringBuilder();
        int length = str.length();
        for (int i = 0; i < length; i++) {
            char cCharAt = str.charAt(i);
            if (Character.isUpperCase(cCharAt) && sb.length() != 0) {
                sb.append(c);
            }
            sb.append(cCharAt);
        }
        return sb.toString();
    }

    public static String b(String str) {
        int length = str.length();
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            char cCharAt = str.charAt(i);
            if (!Character.isLetter(cCharAt)) {
                i++;
            } else if (!Character.isUpperCase(cCharAt)) {
                char upperCase = Character.toUpperCase(cCharAt);
                if (i == 0) {
                    return upperCase + str.substring(1);
                }
                return str.substring(0, i) + upperCase + str.substring(i + 1);
            }
        }
        return str;
    }

    public static qf4 valueOf(String str) {
        return (qf4) Enum.valueOf(qf4.class, str);
    }

    public static qf4[] values() {
        return (qf4[]) a.clone();
    }

    public List alternateNames(Field field) {
        return Collections.EMPTY_LIST;
    }

    public abstract /* synthetic */ String translateName(Field field);
}
