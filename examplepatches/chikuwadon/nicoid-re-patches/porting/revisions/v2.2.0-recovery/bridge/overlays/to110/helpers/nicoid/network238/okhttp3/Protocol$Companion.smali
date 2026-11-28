.class public final Lnicoid/network238/okhttp3/Protocol$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Protocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Protocol$Companion;",
        "",
        "<init>",
        "()V",
        "get",
        "Lnicoid/network238/okhttp3/Protocol;",
        "protocol",
        "",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/Protocol$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/String;)Lnicoid/network238/okhttp3/Protocol;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 120
    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_0:Lnicoid/network238/okhttp3/Protocol;

    # getter for: Lnicoid/network238/okhttp3/Protocol;->protocol:Ljava/lang/String;
    invoke-static {v0}, Lnicoid/network238/okhttp3/Protocol;->access$getProtocol$p(Lnicoid/network238/okhttp3/Protocol;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 124
    :cond_0
    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

    # getter for: Lnicoid/network238/okhttp3/Protocol;->protocol:Ljava/lang/String;
    invoke-static {v0}, Lnicoid/network238/okhttp3/Protocol;->access$getProtocol$p(Lnicoid/network238/okhttp3/Protocol;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 128
    :cond_1
    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->H2_PRIOR_KNOWLEDGE:Lnicoid/network238/okhttp3/Protocol;

    # getter for: Lnicoid/network238/okhttp3/Protocol;->protocol:Ljava/lang/String;
    invoke-static {v0}, Lnicoid/network238/okhttp3/Protocol;->access$getProtocol$p(Lnicoid/network238/okhttp3/Protocol;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    .line 132
    :cond_2
    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_2:Lnicoid/network238/okhttp3/Protocol;

    # getter for: Lnicoid/network238/okhttp3/Protocol;->protocol:Ljava/lang/String;
    invoke-static {v0}, Lnicoid/network238/okhttp3/Protocol;->access$getProtocol$p(Lnicoid/network238/okhttp3/Protocol;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_0

    .line 136
    :cond_3
    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->SPDY_3:Lnicoid/network238/okhttp3/Protocol;

    # getter for: Lnicoid/network238/okhttp3/Protocol;->protocol:Ljava/lang/String;
    invoke-static {v0}, Lnicoid/network238/okhttp3/Protocol;->access$getProtocol$p(Lnicoid/network238/okhttp3/Protocol;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_0

    .line 140
    :cond_4
    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->QUIC:Lnicoid/network238/okhttp3/Protocol;

    # getter for: Lnicoid/network238/okhttp3/Protocol;->protocol:Ljava/lang/String;
    invoke-static {v0}, Lnicoid/network238/okhttp3/Protocol;->access$getProtocol$p(Lnicoid/network238/okhttp3/Protocol;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_0

    .line 146
    :cond_5
    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_3:Lnicoid/network238/okhttp3/Protocol;

    # getter for: Lnicoid/network238/okhttp3/Protocol;->protocol:Ljava/lang/String;
    invoke-static {v0}, Lnicoid/network238/okhttp3/Protocol;->access$getProtocol$p(Lnicoid/network238/okhttp3/Protocol;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {p1, v1, v4, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    :goto_0
    return-object v0

    :cond_6
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unexpected protocol: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
