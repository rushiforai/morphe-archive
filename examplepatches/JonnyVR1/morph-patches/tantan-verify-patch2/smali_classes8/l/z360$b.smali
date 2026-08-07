.class public Ll/z360$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/z360;->a(Ll/gcg0;)Ll/gcg0;
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
.field public final synthetic e:Ljava/util/concurrent/atomic/AtomicReference;

.field public final synthetic f:Ll/are0;

.field public final synthetic g:Ll/gcg0;

.field public final synthetic h:Ll/z360;


# direct methods
.method public constructor <init>(Ll/z360;Ljava/util/concurrent/atomic/AtomicReference;Ll/are0;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z360$b;->h:Ll/z360;

    .line 2
    .line 3
    iput-object p2, p0, Ll/z360$b;->e:Ljava/util/concurrent/atomic/AtomicReference;

    .line 4
    .line 5
    iput-object p3, p0, Ll/z360$b;->f:Ll/are0;

    .line 6
    .line 7
    iput-object p4, p0, Ll/z360$b;->g:Ll/gcg0;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z360$b;->g:Ll/gcg0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, v1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/z360$b;->f:Ll/are0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/are0;->onCompleted()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/z360$b;->g:Ll/gcg0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z360$b;->f:Ll/are0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/are0;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/z360$b;->g:Ll/gcg0;

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
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z360$b;->e:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
