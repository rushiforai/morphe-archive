.class public final Ll/vn50$c;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vn50;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final e:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation
.end field

.field public final f:Ll/vn50$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vn50$d<",
            "TT;>;"
        }
    .end annotation
.end field

.field public g:Z


# direct methods
.method public constructor <init>(JLl/gcg0;Ll/vn50$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ll/gcg0<",
            "-TT;>;",
            "Ll/vn50$d<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/vn50$c;->e:Ll/gcg0;

    .line 5
    .line 6
    iput-object p4, p0, Ll/vn50$c;->f:Ll/vn50$d;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic g(Ll/vn50$c;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/vn50$c;->i(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private h()Z
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/vn50$c;->g:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, p0, Ll/vn50$c;->f:Ll/vn50$d;

    .line 8
    .line 9
    iget-object v0, v0, Ll/vn50$d;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-ne v0, p0, :cond_1

    .line 16
    .line 17
    iput-boolean v1, p0, Ll/vn50$c;->g:Z

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    iget-object v0, p0, Ll/vn50$c;->f:Ll/vn50$d;

    .line 21
    .line 22
    iget-object v0, v0, Ll/vn50$d;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-static {v0, v2, p0}, Ll/m31;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v2, p0, Ll/vn50$c;->f:Ll/vn50$d;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {v2, p0}, Ll/vn50$d;->b(Ll/vn50$c;)V

    .line 34
    .line 35
    .line 36
    iput-boolean v1, p0, Ll/vn50$c;->g:Z

    .line 37
    .line 38
    return v1

    .line 39
    :cond_2
    invoke-virtual {v2}, Ll/vn50$d;->a()V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method private i(J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/vn50$c;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/vn50$c;->e:Ll/gcg0;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/vn50$c;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/vn50$c;->e:Ll/gcg0;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/vn50$c;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/vn50$c;->e:Ll/gcg0;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
