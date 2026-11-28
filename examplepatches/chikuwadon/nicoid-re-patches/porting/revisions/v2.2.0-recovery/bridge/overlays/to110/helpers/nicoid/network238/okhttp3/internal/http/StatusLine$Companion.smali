.class public final Lnicoid/network238/okhttp3/internal/http/StatusLine$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http/StatusLine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007J\u000e\u0010\u0008\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http/StatusLine$Companion;",
        "",
        "<init>",
        "()V",
        "get",
        "Lnicoid/network238/okhttp3/internal/http/StatusLine;",
        "response",
        "Lnicoid/network238/okhttp3/Response;",
        "parse",
        "statusLine",
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

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http/StatusLine$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final get(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/internal/http/StatusLine;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    new-instance v0, Lnicoid/network238/okhttp3/internal/http/StatusLine;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->protocol()Lnicoid/network238/okhttp3/Protocol;

    move-result-object v1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v2

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->message()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lnicoid/network238/okhttp3/internal/http/StatusLine;-><init>(Lnicoid/network238/okhttp3/Protocol;ILjava/lang/String;)V

    return-object v0
.end method

.method public final parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/internal/http/StatusLine;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    const-string v0, "HTTP/1."

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {p1, v0, v1, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    const/16 v4, 0x20

    const/4 v5, 0x4

    const-string v6, "Unexpected status line: "

    if-eqz v0, :cond_3

    .line 53
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x9

    if-lt v0, v1, :cond_2

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v4, :cond_2

    .line 56
    const/4 v0, 0x7

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    add-int/lit8 v0, v0, -0x30

    if-eqz v0, :cond_1

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    .line 61
    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

    goto :goto_0

    .line 62
    :cond_0
    new-instance v0, Ljava/net/ProtocolException;

    invoke-virtual {v6, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 60
    :cond_1
    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_0:Lnicoid/network238/okhttp3/Protocol;

    goto :goto_0

    .line 54
    :cond_2
    new-instance v0, Ljava/net/ProtocolException;

    invoke-virtual {v6, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 64
    :cond_3
    const-string v0, "ICY "

    invoke-static {p1, v0, v1, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 66
    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_0:Lnicoid/network238/okhttp3/Protocol;

    move v1, v5

    goto :goto_0

    .line 68
    :cond_4
    const-string v0, "SOURCETABLE "

    invoke-static {p1, v0, v1, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 70
    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

    const/16 v1, 0xc

    .line 77
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v3, v1, 0x3

    if-lt v2, v3, :cond_8

    .line 81
    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lnicoid/network238/kotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_7

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 88
    nop

    .line 89
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-le v7, v3, :cond_6

    .line 90
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v4, :cond_5

    add-int/2addr v1, v5

    .line 93
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 91
    :cond_5
    new-instance v0, Ljava/net/ProtocolException;

    invoke-virtual {v6, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 89
    :cond_6
    const-string p1, ""

    .line 96
    :goto_1
    new-instance v1, Lnicoid/network238/okhttp3/internal/http/StatusLine;

    invoke-direct {v1, v0, v2, p1}, Lnicoid/network238/okhttp3/internal/http/StatusLine;-><init>(Lnicoid/network238/okhttp3/Protocol;ILjava/lang/String;)V

    return-object v1

    .line 82
    :cond_7
    new-instance v0, Ljava/net/ProtocolException;

    .line 83
    invoke-virtual {v6, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 82
    invoke-direct {v0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_8
    new-instance v0, Ljava/net/ProtocolException;

    invoke-virtual {v6, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_9
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
