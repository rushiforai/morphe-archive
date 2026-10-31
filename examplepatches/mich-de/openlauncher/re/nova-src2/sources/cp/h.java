package cp;

import java.lang.reflect.Field;
import java.util.Locale;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public abstract class h {

    /* renamed from: a, reason: collision with root package name */
    public static final a f47744a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ h[] f47745b;

    static {
        a aVar = new a();
        f47744a = aVar;
        f47745b = new h[]{aVar, new h() { // from class: cp.b
            @Override // cp.h
            public final String b(Field field) {
                return h.c(field.getName());
            }
        }, new h() { // from class: cp.c
            @Override // cp.h
            public final String b(Field field) {
                return h.c(h.a(field.getName(), ' '));
            }
        }, new h() { // from class: cp.d
            @Override // cp.h
            public final String b(Field field) {
                return h.a(field.getName(), '_').toUpperCase(Locale.ENGLISH);
            }
        }, new h() { // from class: cp.e
            @Override // cp.h
            public final String b(Field field) {
                return h.a(field.getName(), '_').toLowerCase(Locale.ENGLISH);
            }
        }, new h() { // from class: cp.f
            @Override // cp.h
            public final String b(Field field) {
                return h.a(field.getName(), '-').toLowerCase(Locale.ENGLISH);
            }
        }, new h() { // from class: cp.g
            @Override // cp.h
            public final String b(Field field) {
                return h.a(field.getName(), '.').toLowerCase(Locale.ENGLISH);
            }
        }};
    }

    public static String a(String str, char c11) {
        StringBuilder sb2 = new StringBuilder();
        int length = str.length();
        for (int i5 = 0; i5 < length; i5++) {
            char cCharAt = str.charAt(i5);
            if (Character.isUpperCase(cCharAt) && sb2.length() != 0) {
                sb2.append(c11);
            }
            sb2.append(cCharAt);
        }
        return sb2.toString();
    }

    public static String c(String str) {
        int length = str.length();
        int i5 = 0;
        while (true) {
            if (i5 >= length) {
                break;
            }
            char cCharAt = str.charAt(i5);
            if (!Character.isLetter(cCharAt)) {
                i5++;
            } else if (!Character.isUpperCase(cCharAt)) {
                char upperCase = Character.toUpperCase(cCharAt);
                if (i5 == 0) {
                    return upperCase + str.substring(1);
                }
                return str.substring(0, i5) + upperCase + str.substring(i5 + 1);
            }
        }
        return str;
    }

    public static h valueOf(String str) {
        return (h) Enum.valueOf(h.class, str);
    }

    public static h[] values() {
        return (h[]) f47745b.clone();
    }

    public abstract String b(Field field);
}
