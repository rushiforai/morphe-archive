package com.google.common.base;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.annotation.Nonnull;
import javax.annotation.meta.TypeQualifierDefault;

@Target({ElementType.TYPE})
@TypeQualifierDefault
@Nonnull
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: assets/audience_network/classes.dex */
public @interface ElementTypesAreNonnullByDefault {
}
