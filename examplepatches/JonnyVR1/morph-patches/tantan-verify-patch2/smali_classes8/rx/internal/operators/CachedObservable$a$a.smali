.class public Lrx/internal/operators/CachedObservable$a$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/CachedObservable$a;->f()V
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
.field public final synthetic e:Lrx/internal/operators/CachedObservable$a;


# direct methods
.method public constructor <init>(Lrx/internal/operators/CachedObservable$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/CachedObservable$a$a;->e:Lrx/internal/operators/CachedObservable$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/operators/CachedObservable$a$a;->e:Lrx/internal/operators/CachedObservable$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/internal/operators/CachedObservable$a;->onCompleted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/operators/CachedObservable$a$a;->e:Lrx/internal/operators/CachedObservable$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/CachedObservable$a;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
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
    iget-object p0, p0, Lrx/internal/operators/CachedObservable$a$a;->e:Lrx/internal/operators/CachedObservable$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/CachedObservable$a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
