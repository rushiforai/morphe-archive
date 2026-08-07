.class public Ll/zqe0;
.super Ll/wbg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ll/wbg0<",
        "TT;TR;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/yqe0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/yqe0<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final b:Ll/wbg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wbg0<",
            "TT;TR;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/wbg0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "TT;TR;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/zqe0$a;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/zqe0$a;-><init>(Ll/wbg0;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Ll/wbg0;-><init>(Lrx/c$a;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/zqe0;->b:Ll/wbg0;

    .line 10
    .line 11
    new-instance v0, Ll/yqe0;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/yqe0;-><init>(Ll/bb50;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/zqe0;->a:Ll/yqe0;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zqe0;->a:Ll/yqe0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/yqe0;->onCompleted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zqe0;->a:Ll/yqe0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yqe0;->onError(Ljava/lang/Throwable;)V

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
    iget-object p0, p0, Ll/zqe0;->a:Ll/yqe0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yqe0;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
