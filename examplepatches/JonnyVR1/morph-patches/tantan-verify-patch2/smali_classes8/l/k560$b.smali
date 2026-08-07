.class public Ll/k560$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/k560;->a(Ll/gcg0;)Ll/gcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TU;>;"
    }
.end annotation


# instance fields
.field public final synthetic e:Ljava/util/concurrent/atomic/AtomicReference;

.field public final synthetic f:Ll/are0;

.field public final synthetic g:Ll/k560;


# direct methods
.method public constructor <init>(Ll/k560;Ljava/util/concurrent/atomic/AtomicReference;Ll/are0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k560$b;->g:Ll/k560;

    .line 2
    .line 3
    iput-object p2, p0, Ll/k560$b;->e:Ljava/util/concurrent/atomic/AtomicReference;

    .line 4
    .line 5
    iput-object p3, p0, Ll/k560$b;->f:Ll/are0;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k560$b;->e:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/k560;->c:Ljava/lang/Object;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/k560$b;->f:Ll/are0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/are0;->onCompleted()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/k560$b;->f:Ll/are0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k560$b;->f:Ll/are0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/are0;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/k560$b;->f:Ll/are0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TU;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/k560$b;->e:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
