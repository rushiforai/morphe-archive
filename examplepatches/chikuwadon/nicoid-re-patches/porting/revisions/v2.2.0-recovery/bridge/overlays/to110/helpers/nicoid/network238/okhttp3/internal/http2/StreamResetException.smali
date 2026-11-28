.class public final Lnicoid/network238/okhttp3/internal/http2/StreamResetException;
.super Ljava/io/IOException;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0010\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0006"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/StreamResetException;",
        "Ljava/io/IOException;",
        "errorCode",
        "Lnicoid/network238/okhttp3/internal/http2/ErrorCode;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V",
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
.field public final errorCode:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "stream was reset: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 21
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 22
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/StreamResetException;->errorCode:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    return-void
.end method
