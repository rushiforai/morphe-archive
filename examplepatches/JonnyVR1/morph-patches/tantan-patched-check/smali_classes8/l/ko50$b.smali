.class public final Ll/ko50$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ko50;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
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


# static fields
.field public static final h:Ljava/lang/Object;


# instance fields
.field public final e:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation
.end field

.field public final f:Ll/rcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/rcj<",
            "TT;TT;TT;>;"
        }
    .end annotation
.end field

.field public g:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ko50$b;->h:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ll/gcg0;Ll/rcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;",
            "Ll/rcj<",
            "TT;TT;TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ko50$b;->e:Ll/gcg0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ko50$b;->f:Ll/rcj;

    .line 7
    .line 8
    sget-object p1, Ll/ko50$b;->h:Ljava/lang/Object;

    .line 9
    .line 10
    iput-object p1, p0, Ll/ko50$b;->g:Ljava/lang/Object;

    .line 11
    .line 12
    const-wide/16 p1, 0x0

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public g(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-wide p1, 0x7fffffffffffffffL

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void

    .line 18
    :cond_1
    const-string p0, "n >= 0 required but it was "

    .line 19
    .line 20
    invoke-static {p0, p1, p2}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onCompleted()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ko50$b;->g:Ljava/lang/Object;

    .line 2
    .line 3
    sget-object v1, Ll/ko50$b;->h:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ko50$b;->e:Ll/gcg0;

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    invoke-interface {v2, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ko50$b;->e:Ll/gcg0;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 19
    .line 20
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-interface {v2, p0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ko50$b;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
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
    iget-object v0, p0, Ll/ko50$b;->g:Ljava/lang/Object;

    .line 2
    .line 3
    sget-object v1, Ll/ko50$b;->h:Ljava/lang/Object;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Ll/ko50$b;->g:Ljava/lang/Object;

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    :try_start_0
    iget-object v1, p0, Ll/ko50$b;->f:Ll/rcj;

    .line 11
    .line 12
    invoke-interface {v1, v0, p1}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/ko50$b;->g:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    invoke-static {p1}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/ko50$b;->e:Ll/gcg0;

    .line 27
    .line 28
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
