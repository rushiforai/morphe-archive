package com.nimbusds.jose;

import h6.c1;

/* loaded from: classes4.dex */
public class KeyTypeException extends KeyException {
    public KeyTypeException(Class cls) {
        super(c1.r(cls, "Invalid key: Must be an instance of "));
    }
}
