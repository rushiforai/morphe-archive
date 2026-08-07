.class public Ll/l460$a$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/l460$a;->call()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final synthetic e:Ljava/lang/Thread;

.field public final synthetic f:Ll/l460$a;


# direct methods
.method public constructor <init>(Ll/l460$a;Ll/gcg0;Ljava/lang/Thread;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l460$a$a;->f:Ll/l460$a;

    .line 2
    .line 3
    iput-object p3, p0, Ll/l460$a$a;->e:Ljava/lang/Thread;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l460$a$a;->f:Ll/l460$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/l460$a;->a:Ll/gcg0;

    .line 4
    .line 5
    new-instance v1, Ll/l460$a$a$a;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/l460$a$a$a;-><init>(Ll/l460$a$a;Ll/vk90;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/l460$a$a;->f:Ll/l460$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/l460$a;->a:Ll/gcg0;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/bb50;->onCompleted()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/l460$a$a;->f:Ll/l460$a;

    .line 9
    .line 10
    iget-object p0, p0, Ll/l460$a;->b:Ll/f2e0$a;

    .line 11
    .line 12
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    iget-object p0, p0, Ll/l460$a$a;->f:Ll/l460$a;

    .line 18
    .line 19
    iget-object p0, p0, Ll/l460$a;->b:Ll/f2e0$a;

    .line 20
    .line 21
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 22
    .line 23
    .line 24
    throw v0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/l460$a$a;->f:Ll/l460$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/l460$a;->a:Ll/gcg0;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/l460$a$a;->f:Ll/l460$a;

    .line 9
    .line 10
    iget-object p0, p0, Ll/l460$a;->b:Ll/f2e0$a;

    .line 11
    .line 12
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    iget-object p0, p0, Ll/l460$a$a;->f:Ll/l460$a;

    .line 18
    .line 19
    iget-object p0, p0, Ll/l460$a;->b:Ll/f2e0$a;

    .line 20
    .line 21
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 22
    .line 23
    .line 24
    throw p1
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l460$a$a;->f:Ll/l460$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/l460$a;->a:Ll/gcg0;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
