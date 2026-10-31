package com.facebook.kotlin.compilerplugins.dataclassgenerate.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import kotlin.Metadata;

@Target({ElementType.TYPE})
@Metadata
@kotlin.annotation.Target
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: assets/audience_network/classes.dex */
public @interface DataClassGenerate {
}
