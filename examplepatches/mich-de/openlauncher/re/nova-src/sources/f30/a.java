package f30;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
/* loaded from: classes4.dex */
public @interface a {
    String defaultValue() default "";

    boolean fullText() default false;

    boolean indexed() default false;

    boolean unique() default false;

    String value();
}
