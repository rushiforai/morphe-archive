.class public final Lnicoid/network238/okhttp3/internal/dns/_StateMachineDnsCallKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\u001a\"\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00042\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u0006H\u0000\u00a8\u0006\u0008"
    }
    d2 = {
        "onFailure",
        "",
        "Lnicoid/network238/okhttp3/Dns$Callback;",
        "call",
        "Lnicoid/network238/okhttp3/Dns$Call;",
        "exceptions",
        "",
        "Ljava/io/IOException;",
        "okhttp"
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
.method public static final onFailure(Lnicoid/network238/okhttp3/Dns$Callback;Lnicoid/network238/okhttp3/Dns$Call;Ljava/util/List;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/Dns$Callback;",
            "Lnicoid/network238/okhttp3/Dns$Call;",
            "Ljava/util/List<",
            "+",
            "Ljava/io/IOException;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 377
    invoke-static {p2}, Lnicoid/network238/kotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/IOException;

    .line 378
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    :goto_0
    if-ge v2, v1, :cond_0

    .line 379
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v0, v3}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 382
    :cond_0
    invoke-interface {p0, p1, v0}, Lnicoid/network238/okhttp3/Dns$Callback;->onFailure(Lnicoid/network238/okhttp3/Dns$Call;Ljava/io/IOException;)V

    return-void
.end method
