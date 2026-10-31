package com.google.gson;

import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public interface FieldNamingStrategy {
    default List<String> alternateNames(Field field) {
        return Collections.EMPTY_LIST;
    }

    String translateName(Field field);
}
