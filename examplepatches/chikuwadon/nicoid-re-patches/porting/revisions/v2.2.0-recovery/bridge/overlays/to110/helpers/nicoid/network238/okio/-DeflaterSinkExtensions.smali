.class public final Lnicoid/network238/okio/-DeflaterSinkExtensions;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a \u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u000c\u0008\u0002\u0010\u0003\u001a\u00060\u0004j\u0002`\u0005H\u0086\u0008\u00a2\u0006\u0002\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "deflate",
        "Lnicoid/network238/okio/DeflaterSink;",
        "Lnicoid/network238/okio/Sink;",
        "deflater",
        "Ljava/util/zip/Deflater;",
        "Lnicoid/network238/okio/Deflater;",
        "(Lnicoid/network238/okio/Sink;Ljava/util/zip/Deflater;)Lnicoid/network238/okio/DeflaterSink;",
        "okio"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final deflate(Lnicoid/network238/okio/Sink;Ljava/util/zip/Deflater;)Lnicoid/network238/okio/DeflaterSink;
    .registers 4
    .param p0, "$this$deflate"    # Lnicoid/network238/okio/Sink;
    .param p1, "deflater"    # Ljava/util/zip/Deflater;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "deflater"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 63
    .local v0, "$i$f$deflate":I
    new-instance v1, Lnicoid/network238/okio/DeflaterSink;

    invoke-direct {v1, p0, p1}, Lnicoid/network238/okio/DeflaterSink;-><init>(Lnicoid/network238/okio/Sink;Ljava/util/zip/Deflater;)V

    return-object v1
.end method

.method public static synthetic deflate$default(Lnicoid/network238/okio/Sink;Ljava/util/zip/Deflater;ILjava/lang/Object;)Lnicoid/network238/okio/DeflaterSink;
    .registers 4
    .param p0, "$this$deflate_u24default"    # Lnicoid/network238/okio/Sink;
    .param p1, "deflater"    # Ljava/util/zip/Deflater;

    .line 62
    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    new-instance p2, Ljava/util/zip/Deflater;

    invoke-direct {p2}, Ljava/util/zip/Deflater;-><init>()V

    move-object p1, p2

    :cond_0
    const-string p2, "<this>"

    invoke-static {p0, p2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p2, "deflater"

    invoke-static {p1, p2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p2, 0x0

    .line 63
    .local p2, "$i$f$deflate":I
    new-instance p3, Lnicoid/network238/okio/DeflaterSink;

    invoke-direct {p3, p0, p1}, Lnicoid/network238/okio/DeflaterSink;-><init>(Lnicoid/network238/okio/Sink;Ljava/util/zip/Deflater;)V

    return-object p3
.end method
