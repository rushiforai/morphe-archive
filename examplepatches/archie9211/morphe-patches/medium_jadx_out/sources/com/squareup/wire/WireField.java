package com.squareup.wire;

import defpackage.g04;
import defpackage.i04;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Target({ElementType.FIELD})
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\n\b\u0087\u0002\u0018\u00002\u00020\u0001:\u0001\u0013BV\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b\u0012\b\b\u0002\u0010\t\u001a\u00020\n\u0012\b\b\u0002\u0010\u000b\u001a\u00020\u0005\u0012\b\b\u0002\u0010\f\u001a\u00020\u0005\u0012\b\b\u0002\u0010\r\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u000e\u001a\u00020\u0003R\u000f\u0010\u0002\u001a\u00020\u0003¢\u0006\u0006\u001a\u0004\b\u0002\u0010\u000fR\u000f\u0010\u0004\u001a\u00020\u0005¢\u0006\u0006\u001a\u0004\b\u0004\u0010\u0010R\u000f\u0010\u0006\u001a\u00020\u0005¢\u0006\u0006\u001a\u0004\b\u0006\u0010\u0010R\u000f\u0010\u0007\u001a\u00020\b¢\u0006\u0006\u001a\u0004\b\u0007\u0010\u0011R\u000f\u0010\t\u001a\u00020\n¢\u0006\u0006\u001a\u0004\b\t\u0010\u0012R\u000f\u0010\u000b\u001a\u00020\u0005¢\u0006\u0006\u001a\u0004\b\u000b\u0010\u0010R\u000f\u0010\f\u001a\u00020\u0005¢\u0006\u0006\u001a\u0004\b\f\u0010\u0010R\u000f\u0010\r\u001a\u00020\u0005¢\u0006\u0006\u001a\u0004\b\r\u0010\u0010R\u000f\u0010\u000e\u001a\u00020\u0003¢\u0006\u0006\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0014"}, d2 = {"Lcom/squareup/wire/WireField;", "", "tag", "", "keyAdapter", "", "adapter", "label", "Lcom/squareup/wire/WireField$Label;", "redacted", "", "declaredName", "jsonName", "oneofName", "schemaIndex", "()I", "()Ljava/lang/String;", "()Lcom/squareup/wire/WireField$Label;", "()Z", "Label", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
@Retention(RetentionPolicy.RUNTIME)
public @interface WireField {

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0011\u0010\n\u001a\u00020\u000b8G¢\u0006\u0006\u001a\u0004\b\n\u0010\fR\u0011\u0010\r\u001a\u00020\u000b8G¢\u0006\u0006\u001a\u0004\b\r\u0010\fR\u0011\u0010\u000e\u001a\u00020\u000b8G¢\u0006\u0006\u001a\u0004\b\u000e\u0010\fj\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\bj\u0002\b\t¨\u0006\u000f"}, d2 = {"Lcom/squareup/wire/WireField$Label;", "", "<init>", "(Ljava/lang/String;I)V", "REQUIRED", "OPTIONAL", "REPEATED", "ONE_OF", "PACKED", "OMIT_IDENTITY", "isRepeated", "", "()Z", "isPacked", "isOneOf", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class Label {
        private static final /* synthetic */ g04 $ENTRIES;
        private static final /* synthetic */ Label[] $VALUES;
        public static final Label REQUIRED = new Label("REQUIRED", 0);
        public static final Label OPTIONAL = new Label("OPTIONAL", 1);
        public static final Label REPEATED = new Label("REPEATED", 2);
        public static final Label ONE_OF = new Label("ONE_OF", 3);
        public static final Label PACKED = new Label("PACKED", 4);
        public static final Label OMIT_IDENTITY = new Label("OMIT_IDENTITY", 5);

        private static final /* synthetic */ Label[] $values() {
            return new Label[]{REQUIRED, OPTIONAL, REPEATED, ONE_OF, PACKED, OMIT_IDENTITY};
        }

        static {
            Label[] labelArr$values = $values();
            $VALUES = labelArr$values;
            $ENTRIES = new i04(labelArr$values);
        }

        private Label(String str, int i) {
        }

        public static g04 getEntries() {
            return $ENTRIES;
        }

        public static Label valueOf(String str) {
            return (Label) Enum.valueOf(Label.class, str);
        }

        public static Label[] values() {
            return (Label[]) $VALUES.clone();
        }

        public final boolean isOneOf() {
            return this == ONE_OF;
        }

        public final boolean isPacked() {
            return this == PACKED;
        }

        public final boolean isRepeated() {
            return this == REPEATED || this == PACKED;
        }
    }

    String adapter();

    String declaredName() default "";

    String jsonName() default "";

    String keyAdapter() default "";

    Label label() default Label.OPTIONAL;

    String oneofName() default "";

    boolean redacted() default false;

    int schemaIndex() default -1;

    int tag();
}
