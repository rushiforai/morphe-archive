.class public interface abstract Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Socket;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008f\u0018\u00002\u00020\u0001R\u0012\u0010\u0002\u001a\u00020\u0003X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0005R\u0012\u0010\u0006\u001a\u00020\u0007X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0008\u0010\t\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\n\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;",
        "Lnicoid/network238/okio/Socket;",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "getSource",
        "()Lnicoid/network238/okio/BufferedSource;",
        "sink",
        "Lnicoid/network238/okio/BufferedSink;",
        "getSink",
        "()Lnicoid/network238/okio/BufferedSink;",
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
.method public abstract getSink()Lnicoid/network238/okio/BufferedSink;
.end method

.method public abstract getSource()Lnicoid/network238/okio/BufferedSource;
.end method
