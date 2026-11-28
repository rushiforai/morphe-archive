.class public interface abstract Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Plan"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0008f\u0018\u00002\u00020\u0001J\u0008\u0010\u0005\u001a\u00020\u0006H&J\u0008\u0010\u0007\u001a\u00020\u0006H&J\u0008\u0010\u0008\u001a\u00020\tH&J\u0008\u0010\n\u001a\u00020\u000bH&J\n\u0010\u000c\u001a\u0004\u0018\u00010\u0000H&R\u0012\u0010\u0002\u001a\u00020\u0003X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0002\u0010\u0004\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\r\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;",
        "",
        "isReady",
        "",
        "()Z",
        "connectTcp",
        "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;",
        "connectTlsEtc",
        "handleSuccess",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
        "cancel",
        "",
        "retry",
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

.method public abstract connectTcp()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;
.end method

.method public abstract connectTlsEtc()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;
.end method

.method public abstract handleSuccess()Lnicoid/network238/okhttp3/internal/connection/RealConnection;
.end method

.method public abstract isReady()Z
.end method

.method public abstract retry()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;
.end method
