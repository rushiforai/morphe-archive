.class public interface abstract Lnicoid/network238/okhttp3/internal/http2/PushObserver;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/http2/PushObserver$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008f\u0018\u0000 \u00142\u00020\u0001:\u0001\u0014J\u001e\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007H&J&\u0010\t\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u00072\u0006\u0010\u000b\u001a\u00020\u0003H&J(\u0010\u000c\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00052\u0006\u0010\u000b\u001a\u00020\u0003H&J\u0018\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0012\u001a\u00020\u0013H&\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\u0015\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/PushObserver;",
        "",
        "onRequest",
        "",
        "streamId",
        "",
        "requestHeaders",
        "",
        "Lnicoid/network238/okhttp3/internal/http2/Header;",
        "onHeaders",
        "responseHeaders",
        "last",
        "onData",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "byteCount",
        "onReset",
        "",
        "errorCode",
        "Lnicoid/network238/okhttp3/internal/http2/ErrorCode;",
        "Companion",
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


# static fields
.field public static final CANCEL:Lnicoid/network238/okhttp3/internal/http2/PushObserver;

.field public static final Companion:Lnicoid/network238/okhttp3/internal/http2/PushObserver$Companion;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/PushObserver$Companion;->$$INSTANCE:Lnicoid/network238/okhttp3/internal/http2/PushObserver$Companion;

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/PushObserver;->Companion:Lnicoid/network238/okhttp3/internal/http2/PushObserver$Companion;

    .line 90
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/PushObserver$Companion$PushObserverCancel;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/http2/PushObserver$Companion$PushObserverCancel;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/PushObserver;->CANCEL:Lnicoid/network238/okhttp3/internal/http2/PushObserver;

    return-void
.end method


# virtual methods
.method public abstract onData(ILnicoid/network238/okio/BufferedSource;IZ)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract onHeaders(ILjava/util/List;Z)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;Z)Z"
        }
    .end annotation
.end method

.method public abstract onRequest(ILjava/util/List;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;)Z"
        }
    .end annotation
.end method

.method public abstract onReset(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V
.end method
