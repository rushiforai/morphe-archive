.class public final Lnicoid/network238/okhttp3/internal/http1/HeadersReader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0006\u0010\n\u001a\u00020\u000bJ\u0006\u0010\u000c\u001a\u00020\rR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000e"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http1/HeadersReader;",
        "",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "<init>",
        "(Lnicoid/network238/okio/BufferedSource;)V",
        "getSource",
        "()Lnicoid/network238/okio/BufferedSource;",
        "headerLimit",
        "",
        "readLine",
        "",
        "readHeaders",
        "Lnicoid/network238/okhttp3/Headers;",
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


# instance fields
.field private headerLimit:J

.field private final source:Lnicoid/network238/okio/BufferedSource;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/BufferedSource;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http1/HeadersReader;->source:Lnicoid/network238/okio/BufferedSource;

    .line 28
    const-wide/32 v0, 0x40000

    iput-wide v0, p0, Lnicoid/network238/okhttp3/internal/http1/HeadersReader;->headerLimit:J

    return-void
.end method


# virtual methods
.method public final getSource()Lnicoid/network238/okio/BufferedSource;
    .registers 2

    .line 26
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/HeadersReader;->source:Lnicoid/network238/okio/BufferedSource;

    return-object v0
.end method

.method public final readHeaders()Lnicoid/network238/okhttp3/Headers;
    .registers 4

    .line 39
    new-instance v0, Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Headers$Builder;-><init>()V

    .line 41
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/HeadersReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 42
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 45
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    return-object v0

    .line 43
    :cond_0
    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Headers$Builder;->addLenient$okhttp(Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    goto :goto_0
.end method

.method public final readLine()Ljava/lang/String;
    .registers 6

    .line 32
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/HeadersReader;->source:Lnicoid/network238/okio/BufferedSource;

    iget-wide v1, p0, Lnicoid/network238/okhttp3/internal/http1/HeadersReader;->headerLimit:J

    invoke-interface {v0, v1, v2}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict(J)Ljava/lang/String;

    move-result-object v0

    .line 33
    iget-wide v1, p0, Lnicoid/network238/okhttp3/internal/http1/HeadersReader;->headerLimit:J

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    int-to-long v3, v3

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lnicoid/network238/okhttp3/internal/http1/HeadersReader;->headerLimit:J

    return-object v0
.end method
