.class public Ll/mjm;
.super Ll/ki2;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;
.implements Ll/xem0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ki2<",
        "Ll/qim;",
        ">;",
        "Ljava/io/Closeable;",
        "Ll/xem0;"
    }
.end annotation


# instance fields
.field public final b:Ll/l610;

.field public final c:Ll/ljm;

.field public final d:Ll/jjm;

.field public e:Ll/jjm;

.field public final f:Z


# direct methods
.method public constructor <init>(Ll/l610;Ll/ljm;Ll/jjm;)V
    .locals 1

    const/4 v0, 0x1

    .line 16
    invoke-direct {p0, p1, p2, p3, v0}, Ll/mjm;-><init>(Ll/l610;Ll/ljm;Ll/jjm;Z)V

    return-void
.end method

.method public constructor <init>(Ll/l610;Ll/ljm;Ll/jjm;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ki2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/mjm;->e:Ll/jjm;

    .line 6
    .line 7
    iput-object p1, p0, Ll/mjm;->b:Ll/l610;

    .line 8
    .line 9
    iput-object p2, p0, Ll/mjm;->c:Ll/ljm;

    .line 10
    .line 11
    iput-object p3, p0, Ll/mjm;->d:Ll/jjm;

    .line 12
    .line 13
    iput-boolean p4, p0, Ll/mjm;->f:Z

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public bridge synthetic b(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Ll/qim;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/mjm;->m(Ljava/lang/String;Ll/qim;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public close()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mjm;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Ljava/lang/String;Ljava/lang/Throwable;Ll/u36$a;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mjm;->b:Ll/l610;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/l610;->now()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object v2, p0, Ll/mjm;->c:Ll/ljm;

    .line 8
    .line 9
    invoke-virtual {v2, p3}, Ll/ljm;->F(Ll/u36$a;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, v0, v1}, Ll/ljm;->z(J)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, p1}, Ll/ljm;->B(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2, p2}, Ll/ljm;->E(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    sget-object p1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->ERROR:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    .line 22
    .line 23
    invoke-virtual {p0, v2, p1}, Ll/mjm;->u(Ll/ljm;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v2, v0, v1}, Ll/mjm;->n(Ll/ljm;J)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public g(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mjm;->c:Ll/ljm;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/mjm;->b:Ll/l610;

    .line 6
    .line 7
    invoke-interface {p1}, Ll/l610;->now()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    invoke-virtual {p0, v0, v1, v2}, Ll/mjm;->q(Ll/ljm;J)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Ll/mjm;->b:Ll/l610;

    .line 16
    .line 17
    invoke-interface {p1}, Ll/l610;->now()J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    invoke-virtual {p0, v0, v1, v2}, Ll/mjm;->n(Ll/ljm;J)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public bridge synthetic h(Ljava/lang/String;Ljava/lang/Object;Ll/u36$a;)V
    .locals 0

    .line 1
    check-cast p2, Ll/qim;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/mjm;->k(Ljava/lang/String;Ll/qim;Ll/u36$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Ljava/lang/String;Ljava/lang/Object;Ll/u36$a;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mjm;->b:Ll/l610;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/l610;->now()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object v2, p0, Ll/mjm;->c:Ll/ljm;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/ljm;->x()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, v0, v1}, Ll/ljm;->D(J)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, p1}, Ll/ljm;->B(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2, p2}, Ll/ljm;->y(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2, p3}, Ll/ljm;->F(Ll/u36$a;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->REQUESTED:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    .line 25
    .line 26
    invoke-virtual {p0, v2, p1}, Ll/mjm;->u(Ll/ljm;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 27
    .line 28
    .line 29
    iget-boolean p1, p0, Ll/mjm;->f:Z

    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0, v2, v0, v1}, Ll/mjm;->q(Ll/ljm;J)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public j(Ljava/lang/String;Ll/u36$a;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mjm;->b:Ll/l610;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/l610;->now()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object v2, p0, Ll/mjm;->c:Ll/ljm;

    .line 8
    .line 9
    invoke-virtual {v2, p2}, Ll/ljm;->F(Ll/u36$a;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, p1}, Ll/ljm;->B(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object p1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->RELEASED:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    .line 16
    .line 17
    invoke-virtual {p0, v2, p1}, Ll/mjm;->u(Ll/ljm;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 18
    .line 19
    .line 20
    iget-boolean p1, p0, Ll/mjm;->f:Z

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, v2, v0, v1}, Ll/mjm;->n(Ll/ljm;J)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public k(Ljava/lang/String;Ll/qim;Ll/u36$a;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mjm;->b:Ll/l610;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/l610;->now()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object v2, p0, Ll/mjm;->c:Ll/ljm;

    .line 8
    .line 9
    invoke-virtual {v2, p3}, Ll/ljm;->F(Ll/u36$a;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, v0, v1}, Ll/ljm;->A(J)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, v0, v1}, Ll/ljm;->J(J)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2, p1}, Ll/ljm;->B(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2, p2}, Ll/ljm;->G(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->SUCCESS:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    .line 25
    .line 26
    invoke-virtual {p0, v2, p1}, Ll/mjm;->u(Ll/ljm;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public m(Ljava/lang/String;Ll/qim;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mjm;->b:Ll/l610;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/l610;->now()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object v2, p0, Ll/mjm;->c:Ll/ljm;

    .line 8
    .line 9
    invoke-virtual {v2, v0, v1}, Ll/ljm;->C(J)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, p1}, Ll/ljm;->B(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, p2}, Ll/ljm;->G(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    sget-object p1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->INTERMEDIATE_AVAILABLE:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    .line 19
    .line 20
    invoke-virtual {p0, v2, p1}, Ll/mjm;->u(Ll/ljm;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final n(Ll/ljm;J)V
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Ll/ljm;->R(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1, p2, p3}, Ll/ljm;->L(J)V

    .line 6
    .line 7
    .line 8
    sget-object p2, Lcom/facebook/fresco/ui/common/VisibilityState;->INVISIBLE:Lcom/facebook/fresco/ui/common/VisibilityState;

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Ll/mjm;->v(Ll/ljm;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onDraw()V
    .locals 0

    .line 1
    return-void
.end method

.method public q(Ll/ljm;J)V
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Ll/ljm;->R(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1, p2, p3}, Ll/ljm;->Q(J)V

    .line 6
    .line 7
    .line 8
    sget-object p2, Lcom/facebook/fresco/ui/common/VisibilityState;->VISIBLE:Lcom/facebook/fresco/ui/common/VisibilityState;

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Ll/mjm;->v(Ll/ljm;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mjm;->c:Ll/ljm;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ljm;->w()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final u(Ll/ljm;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V
    .locals 1

    .line 1
    invoke-virtual {p1, p2}, Ll/ljm;->H(Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/mjm;->d:Ll/jjm;

    .line 5
    .line 6
    invoke-interface {v0, p1, p2}, Ll/jjm;->a(Ll/ljm;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/mjm;->e:Ll/jjm;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0, p1, p2}, Ll/jjm;->a(Ll/ljm;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final v(Ll/ljm;Lcom/facebook/fresco/ui/common/VisibilityState;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mjm;->d:Ll/jjm;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2}, Ll/jjm;->b(Ll/ljm;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/mjm;->e:Ll/jjm;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0, p1, p2}, Ll/jjm;->b(Ll/ljm;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
