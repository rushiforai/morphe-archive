.class public final Lnicoid/network238/okio/-GzipSinkExtensions;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\r\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0086\u0008\u00a8\u0006\u0003"
    }
    d2 = {
        "gzip",
        "Lnicoid/network238/okio/GzipSink;",
        "Lnicoid/network238/okio/Sink;",
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
.method public static final gzip(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/GzipSink;
    .registers 3
    .param p0, "$this$gzip"    # Lnicoid/network238/okio/Sink;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 151
    .local v0, "$i$f$gzip":I
    new-instance v1, Lnicoid/network238/okio/GzipSink;

    invoke-direct {v1, p0}, Lnicoid/network238/okio/GzipSink;-><init>(Lnicoid/network238/okio/Sink;)V

    return-object v1
.end method
