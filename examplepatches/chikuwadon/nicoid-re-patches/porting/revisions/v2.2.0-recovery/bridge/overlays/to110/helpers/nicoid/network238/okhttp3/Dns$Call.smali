.class public interface abstract Lnicoid/network238/okhttp3/Dns$Call;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Dns;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Call"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\u0008f\u0018\u00002\u00020\u0001J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH&J\u0008\u0010\n\u001a\u00020\u0007H&J\u0008\u0010\u000b\u001a\u00020\u000cH&R\u0012\u0010\u0002\u001a\u00020\u0003X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0005\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\r\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Dns$Call;",
        "",
        "request",
        "Lnicoid/network238/okhttp3/Dns$Request;",
        "getRequest",
        "()Lnicoid/network238/okhttp3/Dns$Request;",
        "enqueue",
        "",
        "callback",
        "Lnicoid/network238/okhttp3/Dns$Callback;",
        "cancel",
        "isCanceled",
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


# virtual methods
.method public abstract cancel()V
.end method

.method public abstract enqueue(Lnicoid/network238/okhttp3/Dns$Callback;)V
.end method

.method public abstract getRequest()Lnicoid/network238/okhttp3/Dns$Request;
.end method

.method public abstract isCanceled()Z
.end method
