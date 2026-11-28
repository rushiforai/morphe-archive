.class public final Lnicoid/network238/okio/internal/-BufferedSource;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a,\u0010\u0000\u001a\u0004\u0018\u0001H\u0001\"\u0008\u0008\u0000\u0010\u0001*\u00020\u0002*\u00020\u00032\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u0002H\u00010\u0005H\u0080\u0008\u00a2\u0006\u0002\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "commonSelect",
        "T",
        "",
        "Lnicoid/network238/okio/BufferedSource;",
        "options",
        "Lnicoid/network238/okio/TypedOptions;",
        "(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okio/TypedOptions;)Ljava/lang/Object;",
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
.method public static final commonSelect(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okio/TypedOptions;)Ljava/lang/Object;
    .registers 5
    .param p0, "$this$commonSelect"    # Lnicoid/network238/okio/BufferedSource;
    .param p1, "options"    # Lnicoid/network238/okio/TypedOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/okio/BufferedSource;",
            "Lnicoid/network238/okio/TypedOptions<",
            "TT;>;)TT;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "options"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 27
    .local v0, "$i$f$commonSelect":I
    invoke-virtual {p1}, Lnicoid/network238/okio/TypedOptions;->getOptions$okio()Lnicoid/network238/okio/Options;

    move-result-object v1

    invoke-interface {p0, v1}, Lnicoid/network238/okio/BufferedSource;->select(Lnicoid/network238/okio/Options;)I

    move-result v1

    .line 28
    .local v1, "index":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p1, v1}, Lnicoid/network238/okio/TypedOptions;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 27
    .end local v1    # "index":I
    :goto_0
    return-object v2
.end method
