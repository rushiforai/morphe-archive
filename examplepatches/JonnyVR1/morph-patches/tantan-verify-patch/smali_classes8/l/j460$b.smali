.class public Ll/j460$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/j460;->a(Ll/gcg0;)Ll/gcg0;
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
.field public final synthetic e:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic f:Ll/are0;

.field public final synthetic g:Ll/j460;


# direct methods
.method public constructor <init>(Ll/j460;Ll/gcg0;Ljava/util/concurrent/atomic/AtomicBoolean;Ll/are0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j460$b;->g:Ll/j460;

    .line 2
    .line 3
    iput-object p3, p0, Ll/j460$b;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    iput-object p4, p0, Ll/j460$b;->f:Ll/are0;

    .line 6
    .line 7
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j460$b;->f:Ll/are0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/are0;->onCompleted()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j460$b;->f:Ll/are0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/are0;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/j460$b;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/j460$b;->f:Ll/are0;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/are0;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-wide/16 v0, 0x1

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Ll/gcg0;->e(J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
