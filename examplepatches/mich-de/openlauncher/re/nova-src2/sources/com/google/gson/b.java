package com.google.gson;

import java.lang.reflect.Field;

/* loaded from: classes.dex */
public enum b extends i {
    public b() {
        super("IDENTITY", 0);
    }

    @Override // com.google.gson.FieldNamingStrategy
    public final String translateName(Field field) {
        return field.getName();
    }
}
