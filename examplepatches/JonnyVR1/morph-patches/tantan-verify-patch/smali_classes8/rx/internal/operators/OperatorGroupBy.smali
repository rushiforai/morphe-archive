.class public final Lrx/internal/operators/OperatorGroupBy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorGroupBy$State;,
        Lrx/internal/operators/OperatorGroupBy$d;,
        Lrx/internal/operators/OperatorGroupBy$c;,
        Lrx/internal/operators/OperatorGroupBy$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "Ll/oqk<",
        "TK;TV;>;TT;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TT;+TK;>;"
        }
    .end annotation
.end field

.field public final b:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TT;+TV;>;"
        }
    .end annotation
.end field

.field public final c:I

.field public final d:Z

.field public final e:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Ll/y20<",
            "TK;>;",
            "Ljava/util/Map<",
            "TK;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/qcj;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;+TK;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/internal/util/UtilityFunctions;->b()Ll/qcj;

    .line 2
    .line 3
    .line 4
    move-result-object v2

    .line 5
    sget v3, Ll/urd0;->g:I

    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    const/4 v5, 0x0

    .line 9
    move-object v0, p0

    .line 10
    move-object v1, p1

    .line 11
    invoke-direct/range {v0 .. v5}, Lrx/internal/operators/OperatorGroupBy;-><init>(Ll/qcj;Ll/qcj;IZLl/qcj;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Ll/qcj;Ll/qcj;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;+TK;>;",
            "Ll/qcj<",
            "-TT;+TV;>;)V"
        }
    .end annotation

    .line 15
    sget v3, Ll/urd0;->g:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lrx/internal/operators/OperatorGroupBy;-><init>(Ll/qcj;Ll/qcj;IZLl/qcj;)V

    return-void
.end method

.method public constructor <init>(Ll/qcj;Ll/qcj;IZLl/qcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;+TK;>;",
            "Ll/qcj<",
            "-TT;+TV;>;IZ",
            "Ll/qcj<",
            "Ll/y20<",
            "TK;>;",
            "Ljava/util/Map<",
            "TK;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lrx/internal/operators/OperatorGroupBy;->a:Ll/qcj;

    .line 19
    iput-object p2, p0, Lrx/internal/operators/OperatorGroupBy;->b:Ll/qcj;

    .line 20
    iput p3, p0, Lrx/internal/operators/OperatorGroupBy;->c:I

    .line 21
    iput-boolean p4, p0, Lrx/internal/operators/OperatorGroupBy;->d:Z

    .line 22
    iput-object p5, p0, Lrx/internal/operators/OperatorGroupBy;->e:Ll/qcj;

    return-void
.end method

.method public constructor <init>(Ll/qcj;Ll/qcj;Ll/qcj;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;+TK;>;",
            "Ll/qcj<",
            "-TT;+TV;>;",
            "Ll/qcj<",
            "Ll/y20<",
            "TK;>;",
            "Ljava/util/Map<",
            "TK;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 16
    sget v3, Ll/urd0;->g:I

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lrx/internal/operators/OperatorGroupBy;-><init>(Ll/qcj;Ll/qcj;IZLl/qcj;)V

    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Ll/oqk<",
            "TK;TV;>;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Lrx/internal/operators/OperatorGroupBy$c;

    .line 2
    .line 3
    iget-object v2, p0, Lrx/internal/operators/OperatorGroupBy;->a:Ll/qcj;

    .line 4
    .line 5
    iget-object v3, p0, Lrx/internal/operators/OperatorGroupBy;->b:Ll/qcj;

    .line 6
    .line 7
    iget v4, p0, Lrx/internal/operators/OperatorGroupBy;->c:I

    .line 8
    .line 9
    iget-boolean v5, p0, Lrx/internal/operators/OperatorGroupBy;->d:Z

    .line 10
    .line 11
    iget-object v6, p0, Lrx/internal/operators/OperatorGroupBy;->e:Ll/qcj;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 12
    .line 13
    move-object v1, p1

    .line 14
    :try_start_1
    invoke-direct/range {v0 .. v6}, Lrx/internal/operators/OperatorGroupBy$c;-><init>(Ll/gcg0;Ll/qcj;Ll/qcj;IZLl/qcj;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    .line 16
    .line 17
    new-instance p1, Lrx/internal/operators/OperatorGroupBy$a;

    .line 18
    .line 19
    invoke-direct {p1, p0, v0}, Lrx/internal/operators/OperatorGroupBy$a;-><init>(Lrx/internal/operators/OperatorGroupBy;Lrx/internal/operators/OperatorGroupBy$c;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v1, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, v0, Lrx/internal/operators/OperatorGroupBy$c;->l:Lrx/internal/operators/OperatorGroupBy$b;

    .line 30
    .line 31
    invoke-virtual {v1, p0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 32
    .line 33
    .line 34
    return-object v0

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    :goto_0
    move-object p0, v0

    .line 37
    goto :goto_1

    .line 38
    :catchall_1
    move-exception v0

    .line 39
    move-object v1, p1

    .line 40
    goto :goto_0

    .line 41
    :goto_1
    invoke-static {p0, v1}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Ll/icg0;->a()Ll/gcg0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 49
    .line 50
    .line 51
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorGroupBy;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
