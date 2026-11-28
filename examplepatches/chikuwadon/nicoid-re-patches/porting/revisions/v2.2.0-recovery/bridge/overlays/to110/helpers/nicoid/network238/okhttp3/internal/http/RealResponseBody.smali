.class public final Lnicoid/network238/okhttp3/internal/http/RealResponseBody;
.super Lnicoid/network238/okhttp3/ResponseBody;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B!\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0008\u0010\u0004\u001a\u00020\u0005H\u0016J\n\u0010\n\u001a\u0004\u0018\u00010\u000bH\u0016J\u0008\u0010\u0006\u001a\u00020\u0007H\u0016R\u0010\u0010\u0002\u001a\u0004\u0018\u00010\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http/RealResponseBody;",
        "Lnicoid/network238/okhttp3/ResponseBody;",
        "contentTypeString",
        "",
        "contentLength",
        "",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "<init>",
        "(Ljava/lang/String;JLnicoid/network238/okio/BufferedSource;)V",
        "contentType",
        "Lnicoid/network238/okhttp3/MediaType;",
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
.field private final contentLength:J

.field private final contentTypeString:Ljava/lang/String;

.field private final source:Lnicoid/network238/okio/BufferedSource;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLnicoid/network238/okio/BufferedSource;)V
    .registers 5

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    invoke-direct {p0}, Lnicoid/network238/okhttp3/ResponseBody;-><init>()V

    .line 28
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http/RealResponseBody;->contentTypeString:Ljava/lang/String;

    .line 29
    iput-wide p2, p0, Lnicoid/network238/okhttp3/internal/http/RealResponseBody;->contentLength:J

    .line 30
    iput-object p4, p0, Lnicoid/network238/okhttp3/internal/http/RealResponseBody;->source:Lnicoid/network238/okio/BufferedSource;

    return-void
.end method


# virtual methods
.method public contentLength()J
    .registers 3

    .line 32
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http/RealResponseBody;->contentLength:J

    return-wide v0
.end method

.method public contentType()Lnicoid/network238/okhttp3/MediaType;
    .registers 3

    .line 34
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealResponseBody;->contentTypeString:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v1, Lnicoid/network238/okhttp3/MediaType;->Companion:Lnicoid/network238/okhttp3/MediaType$Companion;

    invoke-virtual {v1, v0}, Lnicoid/network238/okhttp3/MediaType$Companion;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public source()Lnicoid/network238/okio/BufferedSource;
    .registers 2

    .line 36
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealResponseBody;->source:Lnicoid/network238/okio/BufferedSource;

    return-object v0
.end method
