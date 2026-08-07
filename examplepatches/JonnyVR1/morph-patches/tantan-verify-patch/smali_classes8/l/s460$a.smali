.class public Ll/s460$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/s460;->a(Ll/gcg0;)Ll/gcg0;
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
.field public final synthetic e:Ll/gcg0;

.field public final synthetic f:Ll/s460;


# direct methods
.method public constructor <init>(Ll/s460;Ll/gcg0;ZLl/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s460$a;->f:Ll/s460;

    .line 2
    .line 3
    iput-object p4, p0, Ll/s460$a;->e:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0, p2, p3}, Ll/gcg0;-><init>(Ll/gcg0;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/s460$a;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bb50;->onCompleted()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/s460$a;->e:Ll/gcg0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    iget-object p0, p0, Ll/s460$a;->e:Ll/gcg0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 16
    .line 17
    .line 18
    throw v0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/s460$a;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/s460$a;->e:Ll/gcg0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    iget-object p0, p0, Ll/s460$a;->e:Ll/gcg0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 16
    .line 17
    .line 18
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
    iget-object p0, p0, Ll/s460$a;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
