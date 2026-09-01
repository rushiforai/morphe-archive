package com.squareup.wire.internal;

import j$.time.Instant;
import j$.time.format.DateTimeFormatter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\bÆ\u0002\u0018\u00002\f\u0012\b\u0012\u00060\u0002j\u0002`\u00030\u0001B\t\b\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u001b\u0010\b\u001a\u00020\u00072\n\u0010\u0006\u001a\u00060\u0002j\u0002`\u0003H\u0016¢\u0006\u0004\b\b\u0010\tJ\u001b\u0010\u000b\u001a\u00060\u0002j\u0002`\u00032\u0006\u0010\u0006\u001a\u00020\nH\u0016¢\u0006\u0004\b\u000b\u0010\f¨\u0006\r"}, d2 = {"Lcom/squareup/wire/internal/InstantJsonFormatter;", "Lcom/squareup/wire/internal/JsonFormatter;", "j$/time/Instant", "Lcom/squareup/wire/Instant;", "<init>", "()V", "value", "", "toStringOrNumber", "(Lj$/time/Instant;)Ljava/lang/Object;", "", "fromString", "(Ljava/lang/String;)Lj$/time/Instant;", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class InstantJsonFormatter implements JsonFormatter<Instant> {
    public static final InstantJsonFormatter INSTANCE = new InstantJsonFormatter();

    private InstantJsonFormatter() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.squareup.wire.internal.JsonFormatter
    public final Instant fromString(String value) {
        value.getClass();
        Instant instantFrom = Instant.from(DateTimeFormatter.ISO_OFFSET_DATE_TIME.parse(value));
        instantFrom.getClass();
        return instantFrom;
    }

    @Override // com.squareup.wire.internal.JsonFormatter
    public final Object toStringOrNumber(Instant value) {
        value.getClass();
        String str = DateTimeFormatter.ISO_INSTANT.format(value);
        str.getClass();
        return str;
    }
}
