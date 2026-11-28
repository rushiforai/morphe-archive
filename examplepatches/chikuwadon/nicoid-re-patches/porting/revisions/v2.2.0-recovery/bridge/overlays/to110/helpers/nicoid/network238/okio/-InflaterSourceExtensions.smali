.class public final Lnicoid/network238/okio/-InflaterSourceExtensions;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a \u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u000c\u0008\u0002\u0010\u0003\u001a\u00060\u0004j\u0002`\u0005H\u0086\u0008\u00a2\u0006\u0002\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "inflate",
        "Lnicoid/network238/okio/InflaterSource;",
        "Lnicoid/network238/okio/Source;",
        "inflater",
        "Ljava/util/zip/Inflater;",
        "Lnicoid/network238/okio/Inflater;",
        "(Lnicoid/network238/okio/Source;Ljava/util/zip/Inflater;)Lnicoid/network238/okio/InflaterSource;",
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
.method public static final inflate(Lnicoid/network238/okio/Source;Ljava/util/zip/Inflater;)Lnicoid/network238/okio/InflaterSource;
    .registers 4
    .param p0, "$this$inflate"    # Lnicoid/network238/okio/Source;
    .param p1, "inflater"    # Ljava/util/zip/Inflater;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "inflater"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 48
    .local v0, "$i$f$inflate":I
    new-instance v1, Lnicoid/network238/okio/InflaterSource;

    invoke-direct {v1, p0, p1}, Lnicoid/network238/okio/InflaterSource;-><init>(Lnicoid/network238/okio/Source;Ljava/util/zip/Inflater;)V

    return-object v1
.end method

.method public static synthetic inflate$default(Lnicoid/network238/okio/Source;Ljava/util/zip/Inflater;ILjava/lang/Object;)Lnicoid/network238/okio/InflaterSource;
    .registers 4
    .param p0, "$this$inflate_u24default"    # Lnicoid/network238/okio/Source;
    .param p1, "inflater"    # Ljava/util/zip/Inflater;

    .line 47
    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    new-instance p2, Ljava/util/zip/Inflater;

    invoke-direct {p2}, Ljava/util/zip/Inflater;-><init>()V

    move-object p1, p2

    :cond_0
    const-string p2, "<this>"

    invoke-static {p0, p2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p2, "inflater"

    invoke-static {p1, p2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p2, 0x0

    .line 48
    .local p2, "$i$f$inflate":I
    new-instance p3, Lnicoid/network238/okio/InflaterSource;

    invoke-direct {p3, p0, p1}, Lnicoid/network238/okio/InflaterSource;-><init>(Lnicoid/network238/okio/Source;Ljava/util/zip/Inflater;)V

    return-object p3
.end method
