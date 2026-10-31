package org.chromium.net;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE_USE})
@Retention(RetentionPolicy.SOURCE)
/* loaded from: classes5.dex */
public @interface ConnectionCloseSource {
    public static final int PEER = 1;
    public static final int SELF = 2;
    public static final int UNKNOWN = 0;
}
