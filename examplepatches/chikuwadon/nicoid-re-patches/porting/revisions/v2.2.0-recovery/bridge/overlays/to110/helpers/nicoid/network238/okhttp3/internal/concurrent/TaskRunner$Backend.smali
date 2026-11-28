.class public interface abstract Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Backend"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\u0008f\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H&J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H&J\u0018\u0010\u0008\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\t\u001a\u00020\u0003H&J\"\u0010\n\u001a\u0008\u0012\u0004\u0012\u0002H\u000c0\u000b\"\u0004\u0008\u0000\u0010\u000c2\u000c\u0010\r\u001a\u0008\u0012\u0004\u0012\u0002H\u000c0\u000bH&J\u0018\u0010\u000e\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u0010H&\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\u0011\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;",
        "",
        "nanoTime",
        "",
        "coordinatorNotify",
        "",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "coordinatorWait",
        "nanos",
        "decorate",
        "Ljava/util/concurrent/BlockingQueue;",
        "T",
        "queue",
        "execute",
        "runnable",
        "Ljava/lang/Runnable;",
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
.method public abstract coordinatorNotify(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V
.end method

.method public abstract coordinatorWait(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;J)V
.end method

.method public abstract decorate(Ljava/util/concurrent/BlockingQueue;)Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/BlockingQueue<",
            "TT;>;)",
            "Ljava/util/concurrent/BlockingQueue<",
            "TT;>;"
        }
    .end annotation
.end method

.method public abstract execute(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Ljava/lang/Runnable;)V
.end method

.method public abstract nanoTime()J
.end method
