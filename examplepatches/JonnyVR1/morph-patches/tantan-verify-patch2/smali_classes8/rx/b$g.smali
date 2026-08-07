.class public final Lrx/b$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/b$h;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/b;->e(Ljava/util/concurrent/Callable;)Lrx/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/concurrent/Callable;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Callable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/b$g;->a:Ljava/util/concurrent/Callable;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lrx/b$j;)V
    .locals 1

    .line 1
    new-instance v0, Ll/k63;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/k63;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, v0}, Lrx/b$j;->onSubscribe(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    :try_start_0
    iget-object p0, p0, Lrx/b$g;->a:Ljava/util/concurrent/Callable;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ll/k63;->isUnsubscribed()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    invoke-interface {p1}, Lrx/b$j;->onCompleted()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    invoke-virtual {v0}, Ll/k63;->isUnsubscribed()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    invoke-interface {p1, p0}, Lrx/b$j;->onError(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lrx/b$j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/b$g;->a(Lrx/b$j;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
