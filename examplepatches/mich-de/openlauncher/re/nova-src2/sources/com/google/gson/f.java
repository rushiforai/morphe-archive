package com.google.gson;

import java.lang.reflect.Field;
import java.util.Locale;

/* loaded from: classes.dex */
public enum f extends i {
    public f() {
        super("LOWER_CASE_WITH_UNDERSCORES", 4);
    }

    @Override // com.google.gson.FieldNamingStrategy
    public final String translateName(Field field) {
        return i.a(field.getName(), '_').toLowerCase(Locale.ENGLISH);
    }
}
