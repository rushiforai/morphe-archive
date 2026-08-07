.class public abstract Ll/s21;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/s21$d;,
        Ll/s21$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ll/gcg0;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ll/s21;->b()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    invoke-static {}, Ll/s21$d;->a()Ll/s21$d;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ll/s21$c;

    .line 10
    .line 11
    invoke-direct {v2, p0, v0, v1}, Ll/s21$c;-><init>(Ll/s21;Ljava/lang/Object;Ll/s21$d;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/s21$a;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1, v2}, Ll/s21$a;-><init>(Ll/s21;Ll/gcg0;Ll/s21$c;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Lrx/c;->onBackpressureBuffer()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    new-instance v3, Ll/s21$b;

    .line 24
    .line 25
    invoke-direct {v3, p0}, Ll/s21$b;-><init>(Ll/s21;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v3}, Lrx/c;->concatMap(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0, v0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v2}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v2}, Ll/gcg0;->f(Ll/vk90;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    invoke-interface {p1, p0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public abstract b()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation
.end method

.method public abstract c(Ljava/lang/Object;JLl/bb50;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;J",
            "Ll/bb50<",
            "Lrx/c<",
            "+TT;>;>;)TS;"
        }
    .end annotation
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/s21;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .line 1
    return-void
.end method
