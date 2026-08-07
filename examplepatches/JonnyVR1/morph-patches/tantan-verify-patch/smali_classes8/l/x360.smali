.class public final Ll/x360;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "TT;TT;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Ljava/lang/Throwable;",
            "+",
            "Lrx/c<",
            "+TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/qcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Ljava/lang/Throwable;",
            "+",
            "Lrx/c<",
            "+TT;>;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/x360;->a:Ll/qcj;

    .line 5
    .line 6
    return-void
.end method

.method public static b(Lrx/c;)Ll/x360;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;)",
            "Ll/x360<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/x360;

    .line 2
    .line 3
    new-instance v1, Ll/x360$c;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/x360$c;-><init>(Lrx/c;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/x360;-><init>(Ll/qcj;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static c(Lrx/c;)Ll/x360;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;)",
            "Ll/x360<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/x360;

    .line 2
    .line 3
    new-instance v1, Ll/x360$b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/x360$b;-><init>(Lrx/c;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/x360;-><init>(Ll/qcj;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static d(Ll/qcj;)Ll/x360;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "Ljava/lang/Throwable;",
            "+TT;>;)",
            "Ll/x360<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/x360;

    .line 2
    .line 3
    new-instance v1, Ll/x360$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/x360$a;-><init>(Ll/qcj;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/x360;-><init>(Ll/qcj;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/xk90;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xk90;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/wqe0;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/wqe0;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ll/x360$d;

    .line 12
    .line 13
    invoke-direct {v2, p0, p1, v0, v1}, Ll/x360$d;-><init>(Ll/x360;Ll/gcg0;Ll/xk90;Ll/wqe0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ll/wqe0;->b(Ll/kcg0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 23
    .line 24
    .line 25
    return-object v2
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x360;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
