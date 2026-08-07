.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public A:I

.field public final synthetic B:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;

.field public a:J

.field public b:J

.field public c:I

.field public d:I

.field public e:Landroid/view/animation/DecelerateInterpolator;

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:Z

.field public k:Z

.field public l:Ljava/lang/String;

.field public m:Z

.field public n:Z

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:I

.field public t:I

.field public u:I

.field public v:I

.field public w:I

.field public x:I

.field public y:I

.field public z:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->B:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/view/animation/DecelerateInterpolator;

    .line 7
    .line 8
    const v0, 0x3fd9999a    # 1.7f

    .line 9
    .line 10
    .line 11
    invoke-direct {p1, v0}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->e:Landroid/view/animation/DecelerateInterpolator;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j:Z

    .line 18
    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->k:Z

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->m:Z

    .line 23
    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->n:Z

    .line 25
    .line 26
    const/16 v0, 0x14

    .line 27
    .line 28
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->o:I

    .line 29
    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->p:I

    .line 31
    .line 32
    const/4 v0, -0x1

    .line 33
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->q:I

    .line 34
    .line 35
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r:I

    .line 36
    .line 37
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->s:I

    .line 38
    .line 39
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->t:I

    .line 40
    .line 41
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->u:I

    .line 42
    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->v:I

    .line 44
    .line 45
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->w:I

    .line 46
    .line 47
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->x:I

    .line 48
    .line 49
    new-instance v0, Landroid/util/SparseArray;

    .line 50
    .line 51
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->z:Landroid/util/SparseArray;

    .line 55
    .line 56
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->A:I

    .line 57
    .line 58
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->v:I

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->x:I

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->u:I

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->y:I

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->w:I

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->l:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->m:Z

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->h:I

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i:I

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->s:I

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->t:I

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->Q()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->S()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;JI)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->T(JI)V

    return-void
.end method

.method public static bridge synthetic O(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->U()V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->q:I

    return p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->p:I

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->o:I

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r:I

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->n:Z

    return p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j:Z

    return p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->g:I

    return p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->k:Z

    return p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->v:I

    return p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->x:I

    return p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Landroid/util/SparseArray;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->z:Landroid/util/SparseArray;

    return-object p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->u:I

    return p0
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->y:I

    return p0
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->w:I

    return p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->l:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->m:Z

    return p0
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i:I

    return p0
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->s:I

    return p0
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->t:I

    return p0
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->q:I

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->o:I

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->n:Z

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j:Z

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->f:I

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->g:I

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->k:Z

    return-void
.end method


# virtual methods
.method public P(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->A:I

    .line 2
    .line 3
    or-int/2addr p1, v0

    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->A:I

    .line 5
    .line 6
    return-void
.end method

.method public final Q()Z
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->b:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-lez v0, :cond_2

    .line 9
    .line 10
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->a:J

    .line 11
    .line 12
    cmp-long v0, v4, v2

    .line 13
    .line 14
    if-gtz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->a:J

    .line 22
    .line 23
    cmp-long p0, v2, v4

    .line 24
    .line 25
    if-lez p0, :cond_1

    .line 26
    .line 27
    return v1

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_2
    :goto_0
    return v1
.end method

.method public R(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->A:I

    .line 2
    .line 3
    if-ne p0, p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final S()I
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->a:J

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->b:J

    .line 4
    .line 5
    sub-long/2addr v0, v2

    .line 6
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 7
    .line 8
    .line 9
    move-result-wide v2

    .line 10
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->b:J

    .line 11
    .line 12
    sub-long/2addr v2, v4

    .line 13
    long-to-float v2, v2

    .line 14
    long-to-float v0, v0

    .line 15
    div-float/2addr v2, v0

    .line 16
    const/4 v0, 0x0

    .line 17
    cmpg-float v1, v2, v0

    .line 18
    .line 19
    if-gez v1, :cond_0

    .line 20
    .line 21
    :goto_0
    move v2, v0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 24
    .line 25
    cmpl-float v1, v2, v0

    .line 26
    .line 27
    if-lez v1, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->e:Landroid/view/animation/DecelerateInterpolator;

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Landroid/view/animation/DecelerateInterpolator;->getInterpolation(F)F

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->c:I

    .line 37
    .line 38
    if-lez v1, :cond_2

    .line 39
    .line 40
    int-to-float v1, v1

    .line 41
    mul-float/2addr v1, v0

    .line 42
    float-to-double v0, v1

    .line 43
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    :goto_2
    double-to-int v0, v0

    .line 48
    goto :goto_3

    .line 49
    :cond_2
    int-to-float v1, v1

    .line 50
    mul-float/2addr v1, v0

    .line 51
    float-to-double v0, v1

    .line 52
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    goto :goto_2

    .line 57
    :goto_3
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->c:I

    .line 62
    .line 63
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-lt v1, v2, :cond_3

    .line 68
    .line 69
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->c:I

    .line 70
    .line 71
    const-wide/16 v1, 0x0

    .line 72
    .line 73
    iput-wide v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->b:J

    .line 74
    .line 75
    :cond_3
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->d:I

    .line 76
    .line 77
    sub-int v1, v0, v1

    .line 78
    .line 79
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->d:I

    .line 80
    .line 81
    return v1
.end method

.method public final T(JI)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->b:J

    .line 6
    .line 7
    add-long/2addr v0, p1

    .line 8
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->a:J

    .line 9
    .line 10
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->c:I

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->d:I

    .line 14
    .line 15
    return-void
.end method

.method public final U()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j:Z

    .line 3
    .line 4
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->A:I

    .line 5
    .line 6
    const/16 v2, 0x10

    .line 7
    .line 8
    if-eq v1, v2, :cond_1

    .line 9
    .line 10
    const/16 v3, 0x11

    .line 11
    .line 12
    if-ne v1, v3, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->A:I

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->A:I

    .line 19
    .line 20
    :goto_1
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->u:I

    .line 21
    .line 22
    new-instance v1, Landroid/util/SparseArray;

    .line 23
    .line 24
    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->z:Landroid/util/SparseArray;

    .line 28
    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->x:I

    .line 30
    .line 31
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->v:I

    .line 32
    .line 33
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->y:I

    .line 34
    .line 35
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->w:I

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->l:Ljava/lang/String;

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->m:Z

    .line 42
    .line 43
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->n:Z

    .line 44
    .line 45
    const/4 v0, -0x1

    .line 46
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->q:I

    .line 47
    .line 48
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r:I

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->B:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;

    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 53
    .line 54
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->B(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public V()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->b:J

    .line 4
    .line 5
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->a:J

    .line 6
    .line 7
    return-void
.end method
