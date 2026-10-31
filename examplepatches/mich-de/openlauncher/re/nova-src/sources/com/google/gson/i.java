package com.google.gson;

import java.lang.reflect.Field;
import java.util.Locale;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public abstract class i implements FieldNamingStrategy {

    /* renamed from: a, reason: collision with root package name */
    public static final b f34782a;

    /* renamed from: b, reason: collision with root package name */
    public static final f f34783b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ i[] f34784c;

    static {
        b bVar = new b();
        f34782a = bVar;
        i iVar = new i() { // from class: com.google.gson.c
            @Override // com.google.gson.FieldNamingStrategy
            public final String translateName(Field field) {
                return i.b(field.getName());
            }
        };
        i iVar2 = new i() { // from class: com.google.gson.d
            @Override // com.google.gson.FieldNamingStrategy
            public final String translateName(Field field) {
                return i.b(i.a(field.getName(), ' '));
            }
        };
        i iVar3 = new i() { // from class: com.google.gson.e
            @Override // com.google.gson.FieldNamingStrategy
            public final String translateName(Field field) {
                return i.a(field.getName(), '_').toUpperCase(Locale.ENGLISH);
            }
        };
        f fVar = new f();
        f34783b = fVar;
        f34784c = new i[]{bVar, iVar, iVar2, iVar3, fVar, new i() { // from class: com.google.gson.g
            @Override // com.google.gson.FieldNamingStrategy
            public final String translateName(Field field) {
                return i.a(field.getName(), '-').toLowerCase(Locale.ENGLISH);
            }
        }, new i() { // from class: com.google.gson.h
            @Override // com.google.gson.FieldNamingStrategy
            public final String translateName(Field field) {
                return i.a(field.getName(), '.').toLowerCase(Locale.ENGLISH);
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

    public static String b(String str) {
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

    public static i valueOf(String str) {
        return (i) Enum.valueOf(i.class, str);
    }

    public static i[] values() {
        return (i[]) f34784c.clone();
    }
}
