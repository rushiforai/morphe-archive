.class public Ll/y0i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public A:Lv/VText;

.field public B:Landroid/widget/TextView;

.field public C:Ll/x0m;

.field public D:Z

.field public E:I

.field public F:I

.field public G:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public H:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/SwipeDirection;",
            ">;"
        }
    .end annotation
.end field

.field public I:J

.field public J:Z

.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/LinearLayout;

.field public g:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public h:Lv/VDraweeView;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public l:Lv/VDraweeView;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public p:Lv/VDraweeView;

.field public q:Lv/VText;

.field public r:Lv/VText;

.field public s:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public t:Lv/VDraweeView;

.field public u:Lv/VText;

.field public v:Lv/VText;

.field public w:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public x:Lv/VDraweeView;

.field public y:Lv/VText;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Ll/x0m;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/y0i0;->D:Z

    .line 6
    .line 7
    iput v0, p0, Ll/y0i0;->E:I

    .line 8
    .line 9
    new-instance v1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Ll/y0i0;->G:Ljava/util/List;

    .line 15
    .line 16
    new-instance v1, Ll/r0i0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/r0i0;-><init>(Ll/y0i0;)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ll/y0i0;->H:Ll/y20;

    .line 22
    .line 23
    const-wide/16 v1, 0x0

    .line 24
    .line 25
    iput-wide v1, p0, Ll/y0i0;->I:J

    .line 26
    .line 27
    iput-boolean v0, p0, Ll/y0i0;->J:Z

    .line 28
    .line 29
    iput-object p1, p0, Ll/y0i0;->C:Ll/x0m;

    .line 30
    .line 31
    return-void
.end method

.method public static synthetic h(Ll/y0i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y0i0;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->H(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string p0, "\u4fdd\u5b58\u5931\u8d25"

    .line 9
    .line 10
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic j(Ll/y0i0;ZLjava/util/List;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/y0i0;->v(ZLjava/util/List;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/y0i0;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y0i0;->y(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    return-void
.end method

.method public static synthetic l(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Tag;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Tag;

    .line 2
    .line 3
    const-string v1, "personality"

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/data/Tag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static synthetic m(Ll/y0i0;Ljava/lang/String;Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/y0i0;->x(Ljava/lang/String;Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/y0i0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y0i0;->z(Ll/uxj0;)V

    return-void
.end method

.method private synthetic y(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y0i0;->C:Ll/x0m;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->fromValue(I)Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, Ll/x0m;->V(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/NewTags;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/y0i0;->h:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/y0i0;->i:Lv/VText;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/y0i0;->j:Lv/VText;

    .line 18
    .line 19
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localTagUserCounts:J

    .line 20
    .line 21
    invoke-virtual {p0, v1, v2}, Ll/y0i0;->q(J)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/y0i0;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1}, Ll/y0i0;->u(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/y0i0;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, v0, p1}, Ll/y0i0;->t(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public B(Lcom/p1/mobile/putong/core/data/NewTags;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/y0i0;->l:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/y0i0;->m:Lv/VText;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/y0i0;->n:Lv/VText;

    .line 18
    .line 19
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localTagUserCounts:J

    .line 20
    .line 21
    invoke-virtual {p0, v1, v2}, Ll/y0i0;->q(J)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/y0i0;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1}, Ll/y0i0;->u(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/y0i0;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, v0, p1}, Ll/y0i0;->t(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public C(Lcom/p1/mobile/putong/core/data/NewTags;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/y0i0;->p:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/y0i0;->q:Lv/VText;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/y0i0;->r:Lv/VText;

    .line 18
    .line 19
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localTagUserCounts:J

    .line 20
    .line 21
    invoke-virtual {p0, v1, v2}, Ll/y0i0;->q(J)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/y0i0;->o:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1}, Ll/y0i0;->u(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/y0i0;->o:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, v0, p1}, Ll/y0i0;->t(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public D(Lcom/p1/mobile/putong/core/data/NewTags;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/y0i0;->t:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/y0i0;->u:Lv/VText;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/y0i0;->v:Lv/VText;

    .line 18
    .line 19
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localTagUserCounts:J

    .line 20
    .line 21
    invoke-virtual {p0, v1, v2}, Ll/y0i0;->q(J)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/y0i0;->s:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1}, Ll/y0i0;->u(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/y0i0;->s:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, v0, p1}, Ll/y0i0;->t(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public E(Lcom/p1/mobile/putong/core/data/NewTags;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/y0i0;->x:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/y0i0;->y:Lv/VText;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/y0i0;->z:Lv/VText;

    .line 18
    .line 19
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localTagUserCounts:J

    .line 20
    .line 21
    invoke-virtual {p0, v1, v2}, Ll/y0i0;->q(J)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/y0i0;->w:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1}, Ll/y0i0;->u(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/y0i0;->w:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, v0, p1}, Ll/y0i0;->t(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public F(Ljava/util/List;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_6

    .line 9
    .line 10
    const/4 v6, 0x0

    .line 11
    const/4 v7, 0x1

    .line 12
    if-eq v0, v7, :cond_5

    .line 13
    .line 14
    const/4 v8, 0x2

    .line 15
    if-eq v0, v8, :cond_4

    .line 16
    .line 17
    const/4 v9, 0x3

    .line 18
    if-eq v0, v9, :cond_3

    .line 19
    .line 20
    const/4 v10, 0x4

    .line 21
    if-eq v0, v10, :cond_2

    .line 22
    .line 23
    const/4 v1, 0x5

    .line 24
    if-eq v0, v1, :cond_1

    .line 25
    .line 26
    :goto_0
    return-void

    .line 27
    :cond_1
    const/4 v4, 0x0

    .line 28
    const/4 v5, 0x0

    .line 29
    const/4 v1, 0x0

    .line 30
    const/4 v2, 0x0

    .line 31
    const/4 v3, 0x0

    .line 32
    move-object v0, p0

    .line 33
    invoke-virtual/range {v0 .. v5}, Ll/y0i0;->I(IIIII)V

    .line 34
    .line 35
    .line 36
    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 41
    .line 42
    invoke-virtual {p0, v1}, Ll/y0i0;->A(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 43
    .line 44
    .line 45
    invoke-interface {p1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 50
    .line 51
    invoke-virtual {p0, v1}, Ll/y0i0;->B(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {p1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 59
    .line 60
    invoke-virtual {p0, v1}, Ll/y0i0;->C(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 61
    .line 62
    .line 63
    invoke-interface {p1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 68
    .line 69
    invoke-virtual {p0, v1}, Ll/y0i0;->D(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 70
    .line 71
    .line 72
    invoke-interface {p1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 77
    .line 78
    invoke-virtual {p0, v1}, Ll/y0i0;->E(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/y0i0;->a:Landroid/widget/FrameLayout;

    .line 82
    .line 83
    invoke-static {v0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    const/4 v4, 0x0

    .line 88
    const/4 v5, 0x4

    .line 89
    const/4 v1, 0x0

    .line 90
    const/4 v2, 0x0

    .line 91
    const/4 v3, 0x0

    .line 92
    move-object v0, p0

    .line 93
    invoke-virtual/range {v0 .. v5}, Ll/y0i0;->I(IIIII)V

    .line 94
    .line 95
    .line 96
    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 101
    .line 102
    invoke-virtual {p0, v1}, Ll/y0i0;->A(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 103
    .line 104
    .line 105
    invoke-interface {p1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 110
    .line 111
    invoke-virtual {p0, v1}, Ll/y0i0;->B(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 112
    .line 113
    .line 114
    invoke-interface {p1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 119
    .line 120
    invoke-virtual {p0, v1}, Ll/y0i0;->C(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 121
    .line 122
    .line 123
    invoke-interface {p1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 128
    .line 129
    invoke-virtual {p0, v1}, Ll/y0i0;->D(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/y0i0;->a:Landroid/widget/FrameLayout;

    .line 133
    .line 134
    invoke-static {v0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_3
    const/4 v4, 0x4

    .line 139
    const/4 v5, 0x4

    .line 140
    const/4 v1, 0x0

    .line 141
    const/4 v2, 0x0

    .line 142
    const/4 v3, 0x0

    .line 143
    move-object v0, p0

    .line 144
    invoke-virtual/range {v0 .. v5}, Ll/y0i0;->I(IIIII)V

    .line 145
    .line 146
    .line 147
    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 152
    .line 153
    invoke-virtual {p0, v1}, Ll/y0i0;->A(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 154
    .line 155
    .line 156
    invoke-interface {p1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 161
    .line 162
    invoke-virtual {p0, v1}, Ll/y0i0;->B(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 163
    .line 164
    .line 165
    invoke-interface {p1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 170
    .line 171
    invoke-virtual {p0, v1}, Ll/y0i0;->C(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Ll/y0i0;->a:Landroid/widget/FrameLayout;

    .line 175
    .line 176
    invoke-static {v0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :cond_4
    const/4 v4, 0x4

    .line 181
    const/4 v5, 0x4

    .line 182
    const/4 v1, 0x0

    .line 183
    const/4 v2, 0x0

    .line 184
    const/4 v3, 0x4

    .line 185
    move-object v0, p0

    .line 186
    invoke-virtual/range {v0 .. v5}, Ll/y0i0;->I(IIIII)V

    .line 187
    .line 188
    .line 189
    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 194
    .line 195
    invoke-virtual {p0, v1}, Ll/y0i0;->A(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 196
    .line 197
    .line 198
    invoke-interface {p1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 203
    .line 204
    invoke-virtual {p0, v1}, Ll/y0i0;->B(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Ll/y0i0;->a:Landroid/widget/FrameLayout;

    .line 208
    .line 209
    invoke-static {v0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 210
    .line 211
    .line 212
    return-void

    .line 213
    :cond_5
    const/4 v4, 0x4

    .line 214
    const/4 v5, 0x4

    .line 215
    const/4 v1, 0x0

    .line 216
    const/4 v2, 0x4

    .line 217
    const/4 v3, 0x4

    .line 218
    move-object v0, p0

    .line 219
    invoke-virtual/range {v0 .. v5}, Ll/y0i0;->I(IIIII)V

    .line 220
    .line 221
    .line 222
    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 227
    .line 228
    invoke-virtual {p0, v1}, Ll/y0i0;->A(Lcom/p1/mobile/putong/core/data/NewTags;)V

    .line 229
    .line 230
    .line 231
    iget-object v0, p0, Ll/y0i0;->a:Landroid/widget/FrameLayout;

    .line 232
    .line 233
    invoke-static {v0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 234
    .line 235
    .line 236
    return-void

    .line 237
    :cond_6
    const/4 v4, 0x4

    .line 238
    const/4 v5, 0x4

    .line 239
    const/4 v1, 0x4

    .line 240
    const/4 v2, 0x4

    .line 241
    const/4 v3, 0x4

    .line 242
    move-object v0, p0

    .line 243
    invoke-virtual/range {v0 .. v5}, Ll/y0i0;->I(IIIII)V

    .line 244
    .line 245
    .line 246
    iget-object v0, p0, Ll/y0i0;->a:Landroid/widget/FrameLayout;

    .line 247
    .line 248
    invoke-static {v0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 249
    .line 250
    .line 251
    return-void
.end method

.method public G(Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 28
    .line 29
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/16 v2, 0xa

    .line 36
    .line 37
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-interface {p1, v2, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ts(Ljava/util/List;)Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 59
    .line 60
    new-instance v2, Ll/v0i0;

    .line 61
    .line 62
    invoke-direct {v2}, Ll/v0i0;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {p1, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 70
    .line 71
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 74
    .line 75
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_1

    .line 88
    .line 89
    iget-object v0, p0, Ll/y0i0;->C:Ll/x0m;

    .line 90
    .line 91
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 92
    .line 93
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 94
    .line 95
    invoke-virtual {v1, p1}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-interface {v0, p1}, Ll/x0m;->z1(Lrx/c;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    new-instance v0, Ll/w0i0;

    .line 104
    .line 105
    invoke-direct {v0, p0}, Ll/w0i0;-><init>(Ll/y0i0;)V

    .line 106
    .line 107
    .line 108
    new-instance v1, Ll/x0i0;

    .line 109
    .line 110
    invoke-direct {v1}, Ll/x0i0;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_1
    const/4 p1, 0x1

    .line 122
    iput-boolean p1, p0, Ll/y0i0;->J:Z

    .line 123
    .line 124
    iget-object p1, p0, Ll/y0i0;->H:Ll/y20;

    .line 125
    .line 126
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 127
    .line 128
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    const-string p1, "\u5df2\u6dfb\u52a0"

    .line 132
    .line 133
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 137
    .line 138
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 139
    .line 140
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->c2:Ljava/util/HashSet;

    .line 141
    .line 142
    const-string v0, "e_card_add_operation_tag_button"

    .line 143
    .line 144
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    :goto_0
    invoke-virtual {p0, p2}, Ll/y0i0;->p(Ljava/util/List;)V

    .line 148
    .line 149
    .line 150
    :cond_2
    :goto_1
    return-void
.end method

.method public H(Ljava/util/List;II)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;II)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_3

    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    div-int v1, v0, p3

    .line 15
    .line 16
    rem-int/2addr v0, p3

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    add-int/lit8 v1, v1, -0x1

    .line 20
    .line 21
    :cond_1
    const/4 v0, 0x0

    .line 22
    if-le p2, v1, :cond_2

    .line 23
    .line 24
    iput v0, p0, Ll/y0i0;->E:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_2
    iput p2, p0, Ll/y0i0;->E:I

    .line 28
    .line 29
    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    iget v2, p0, Ll/y0i0;->E:I

    .line 35
    .line 36
    mul-int/2addr v2, p3

    .line 37
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-ge v2, v3, :cond_3

    .line 42
    .line 43
    if-ltz v2, :cond_3

    .line 44
    .line 45
    iget v3, p0, Ll/y0i0;->E:I

    .line 46
    .line 47
    add-int/lit8 v3, v3, 0x1

    .line 48
    .line 49
    mul-int/2addr v3, p3

    .line 50
    if-ge v2, v3, :cond_3

    .line 51
    .line 52
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 57
    .line 58
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    add-int/lit8 v2, v2, 0x1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    if-eqz p2, :cond_4

    .line 65
    .line 66
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    if-ge p2, p3, :cond_4

    .line 71
    .line 72
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    sub-int/2addr p3, p2

    .line 77
    :goto_2
    if-ge v0, p3, :cond_4

    .line 78
    .line 79
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    check-cast p2, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 84
    .line 85
    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    add-int/lit8 v0, v0, 0x1

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_4
    invoke-virtual {p0, v1}, Ll/y0i0;->F(Ljava/util/List;)V

    .line 92
    .line 93
    .line 94
    :cond_5
    :goto_3
    return-void
.end method

.method public I(IIIII)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y0i0;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/y0i0;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/y0i0;->o:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 12
    .line 13
    invoke-virtual {p1, p3}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/y0i0;->s:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 17
    .line 18
    invoke-virtual {p1, p4}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    iget-boolean p1, p0, Ll/y0i0;->D:Z

    .line 22
    .line 23
    iget-object p0, p0, Ll/y0i0;->w:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    const/16 p1, 0x8

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p0, p5}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public J()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/y0i0;->G:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/y0i0;->A:Lv/VText;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget v2, Ll/fbc0;->g:I

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/y0i0;->A:Lv/VText;

    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget v1, Ll/e9c0;->d:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget v2, Ll/fbc0;->g:I

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Ll/y0i0;->A:Lv/VText;

    .line 60
    .line 61
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 62
    .line 63
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sget v1, Ll/e9c0;->f:I

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/VirtualCardType;)Landroid/view/View;
    .locals 6

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/y0i0;->o(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v4, 0x4

    .line 6
    const/4 v5, 0x4

    .line 7
    const/4 v1, 0x4

    .line 8
    const/4 v2, 0x4

    .line 9
    const/4 v3, 0x4

    .line 10
    move-object v0, p0

    .line 11
    invoke-virtual/range {v0 .. v5}, Ll/y0i0;->I(IIIII)V

    .line 12
    .line 13
    .line 14
    iget-object p0, v0, Ll/y0i0;->C:Ll/x0m;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/x0m;->l1()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    div-int/lit8 p0, p0, 0x2

    .line 21
    .line 22
    const/high16 p2, 0x42e40000    # 114.0f

    .line 23
    .line 24
    invoke-static {p2}, Ll/rsf0;->c(F)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    sub-int/2addr p0, p2

    .line 29
    iget-object p2, v0, Ll/y0i0;->m:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 32
    .line 33
    .line 34
    iget-object p2, v0, Ll/y0i0;->n:Lv/VText;

    .line 35
    .line 36
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 37
    .line 38
    .line 39
    iget-object p2, v0, Ll/y0i0;->q:Lv/VText;

    .line 40
    .line 41
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 42
    .line 43
    .line 44
    iget-object p2, v0, Ll/y0i0;->r:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, v0, Ll/y0i0;->C:Ll/x0m;

    .line 50
    .line 51
    invoke-interface {p0}, Ll/x0m;->l1()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    const/high16 p2, 0x430e0000    # 142.0f

    .line 56
    .line 57
    invoke-static {p2}, Ll/rsf0;->c(F)I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    sub-int/2addr p0, p2

    .line 62
    iget-object p2, v0, Ll/y0i0;->i:Lv/VText;

    .line 63
    .line 64
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 65
    .line 66
    .line 67
    iget-object p2, v0, Ll/y0i0;->v:Lv/VText;

    .line 68
    .line 69
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 70
    .line 71
    .line 72
    iget-object p2, v0, Ll/y0i0;->y:Lv/VText;

    .line 73
    .line 74
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 75
    .line 76
    .line 77
    return-object p1
.end method

.method public e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V
    .locals 4

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    goto/16 :goto_2

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/y0i0;->r()V

    .line 18
    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    const/4 p4, 0x0

    .line 33
    if-eqz p3, :cond_5

    .line 34
    .line 35
    iget-object p3, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->extensionObject:Ljava/lang/Object;

    .line 36
    .line 37
    instance-of v0, p3, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 38
    .line 39
    if-eqz v0, :cond_5

    .line 40
    .line 41
    check-cast p3, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 42
    .line 43
    iget-object p3, p3, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->content:Lcom/p1/mobile/putong/data/OMSAdCardContent;

    .line 44
    .line 45
    iget-object p3, p3, Lcom/p1/mobile/putong/data/OMSAdCardContent;->tagCard:Lcom/p1/mobile/putong/data/OmsTagCard;

    .line 46
    .line 47
    iget-object v0, p3, Lcom/p1/mobile/putong/data/OmsTagCard;->pictures:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_1

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-interface {v0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 68
    .line 69
    invoke-interface {v1, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ub(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 74
    .line 75
    iget-object v2, p0, Ll/y0i0;->b:Lv/VDraweeView;

    .line 76
    .line 77
    invoke-virtual {v1, v2, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    iget-object v0, p0, Ll/y0i0;->d:Landroid/widget/TextView;

    .line 81
    .line 82
    iget-object v1, p3, Lcom/p1/mobile/putong/data/OmsTagCard;->title:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/y0i0;->e:Landroid/widget/TextView;

    .line 88
    .line 89
    iget-object v1, p3, Lcom/p1/mobile/putong/data/OmsTagCard;->subTitle:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/y0i0;->A:Lv/VText;

    .line 95
    .line 96
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 99
    .line 100
    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iget-object v1, p3, Lcom/p1/mobile/putong/data/OmsTagCard;->tagUserCounts:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ak(Ljava/util/List;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    iget-object p3, p3, Lcom/p1/mobile/putong/data/OmsTagCard;->tagUserCounts:Ljava/util/List;

    .line 124
    .line 125
    invoke-interface {v1, p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ai(Ljava/util/List;)Ljava/util/List;

    .line 126
    .line 127
    .line 128
    move-result-object p3

    .line 129
    iget-boolean v1, p0, Ll/y0i0;->D:Z

    .line 130
    .line 131
    if-eqz v1, :cond_2

    .line 132
    .line 133
    const/4 v1, 0x4

    .line 134
    goto :goto_0

    .line 135
    :cond_2
    const/4 v1, 0x5

    .line 136
    :goto_0
    iput v1, p0, Ll/y0i0;->F:I

    .line 137
    .line 138
    if-eqz v0, :cond_4

    .line 139
    .line 140
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    iget v2, p0, Ll/y0i0;->F:I

    .line 145
    .line 146
    iget-object v3, p0, Ll/y0i0;->B:Landroid/widget/TextView;

    .line 147
    .line 148
    if-gt v1, v2, :cond_3

    .line 149
    .line 150
    const/16 v1, 0x8

    .line 151
    .line 152
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0, p3}, Ll/y0i0;->F(Ljava/util/List;)V

    .line 156
    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_3
    invoke-virtual {v3, p4}, Landroid/view/View;->setVisibility(I)V

    .line 160
    .line 161
    .line 162
    iget v1, p0, Ll/y0i0;->F:I

    .line 163
    .line 164
    invoke-virtual {p0, p3, p4, v1}, Ll/y0i0;->H(Ljava/util/List;II)V

    .line 165
    .line 166
    .line 167
    :cond_4
    :goto_1
    iget-object v1, p0, Ll/y0i0;->B:Landroid/widget/TextView;

    .line 168
    .line 169
    new-instance v2, Ll/s0i0;

    .line 170
    .line 171
    invoke-direct {v2, p0, v0, p3}, Ll/s0i0;-><init>(Ll/y0i0;ZLjava/util/List;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 175
    .line 176
    .line 177
    :cond_5
    if-nez p2, :cond_7

    .line 178
    .line 179
    iget-object p2, p0, Ll/y0i0;->C:Ll/x0m;

    .line 180
    .line 181
    invoke-interface {p2}, Ll/x0m;->O3()V

    .line 182
    .line 183
    .line 184
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result p2

    .line 188
    if-eqz p2, :cond_6

    .line 189
    .line 190
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->extensionObject:Ljava/lang/Object;

    .line 191
    .line 192
    instance-of p2, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 193
    .line 194
    if-eqz p2, :cond_6

    .line 195
    .line 196
    check-cast p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 197
    .line 198
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 199
    .line 200
    .line 201
    move-result-object p2

    .line 202
    invoke-virtual {p2}, Ll/pk50;->f()Ll/rj50;

    .line 203
    .line 204
    .line 205
    move-result-object p2

    .line 206
    iget-object p3, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->identifier:Ljava/lang/String;

    .line 207
    .line 208
    invoke-virtual {p2, p3, p4, p4}, Ll/rj50;->Z(Ljava/lang/String;IZ)Z

    .line 209
    .line 210
    .line 211
    invoke-static {p1}, Ll/fb0;->k(Lcom/p1/mobile/putong/data/OMSAdCardInfo;)V

    .line 212
    .line 213
    .line 214
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 215
    .line 216
    .line 217
    move-result-wide p1

    .line 218
    iget-wide p3, p0, Ll/y0i0;->I:J

    .line 219
    .line 220
    sub-long/2addr p1, p3

    .line 221
    const-wide/16 p3, 0x1f4

    .line 222
    .line 223
    cmp-long p1, p1, p3

    .line 224
    .line 225
    if-lez p1, :cond_6

    .line 226
    .line 227
    iget-boolean p1, p0, Ll/y0i0;->J:Z

    .line 228
    .line 229
    if-nez p1, :cond_6

    .line 230
    .line 231
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 232
    .line 233
    .line 234
    move-result-wide p1

    .line 235
    iput-wide p1, p0, Ll/y0i0;->I:J

    .line 236
    .line 237
    const-string p1, "e_card_add_operation_tag_button"

    .line 238
    .line 239
    const-string p2, "p_suggest_users_home_view"

    .line 240
    .line 241
    invoke-static {p1, p2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    :cond_6
    iget-object p1, p0, Ll/y0i0;->A:Lv/VText;

    .line 245
    .line 246
    new-instance p2, Ll/t0i0;

    .line 247
    .line 248
    invoke-direct {p2, p0}, Ll/t0i0;-><init>(Ll/y0i0;)V

    .line 249
    .line 250
    .line 251
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 252
    .line 253
    .line 254
    :cond_7
    :goto_2
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/z0i0;->b(Ll/y0i0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->F9(Ljava/util/List;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-interface {v2, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->La(Ljava/util/List;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    if-eqz v1, :cond_3

    .line 36
    .line 37
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_3

    .line 42
    .line 43
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 58
    .line 59
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    const-string v3, ","

    .line 66
    .line 67
    if-nez v2, :cond_1

    .line 68
    .line 69
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    :cond_1
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-nez v2, :cond_0

    .line 84
    .line 85
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-eqz v2, :cond_0

    .line 96
    .line 97
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    check-cast v2, Lcom/p1/mobile/putong/core/data/TagCategories;

    .line 102
    .line 103
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/TagCategories;->name:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v4

    .line 109
    if-nez v4, :cond_2

    .line 110
    .line 111
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/TagCategories;->name:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_3
    const-string p1, "personal_tag_category"

    .line 121
    .line 122
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    const-string p1, "personal_tag_name"

    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    const-string p1, "e_card_add_operation_tag_button"

    .line 145
    .line 146
    const-string v0, "p_suggest_users_home_view"

    .line 147
    .line 148
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public q(J)Ljava/lang/String;
    .locals 5

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p0, p1, v0

    .line 4
    .line 5
    if-gez p0, :cond_0

    .line 6
    .line 7
    move-wide p1, v0

    .line 8
    :cond_0
    new-instance p0, Ljava/text/DecimalFormat;

    .line 9
    .line 10
    const-string v0, "0.0"

    .line 11
    .line 12
    invoke-direct {p0, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Ljava/math/RoundingMode;->DOWN:Ljava/math/RoundingMode;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/text/DecimalFormat;->setRoundingMode(Ljava/math/RoundingMode;)V

    .line 18
    .line 19
    .line 20
    long-to-double v0, p1

    .line 21
    const-wide v2, 0x408f400000000000L    # 1000.0

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    cmpg-double v4, v0, v2

    .line 27
    .line 28
    if-gez v4, :cond_1

    .line 29
    .line 30
    new-instance p0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p1, "\u4eba\u5df2\u6dfb\u52a0"

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_1
    const-wide p1, 0x40c3880000000000L    # 10000.0

    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    cmpg-double v4, v0, p1

    .line 54
    .line 55
    if-gez v4, :cond_2

    .line 56
    .line 57
    div-double/2addr v0, v2

    .line 58
    new-instance p1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string p0, "k\u4eba\u5df2\u6dfb\u52a0"

    .line 71
    .line 72
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0

    .line 80
    :cond_2
    const-wide v2, 0x4197d78400000000L    # 1.0E8

    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    cmpg-double v4, v0, v2

    .line 86
    .line 87
    if-gez v4, :cond_3

    .line 88
    .line 89
    div-double/2addr v0, p1

    .line 90
    new-instance p1, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string p0, "w\u4eba\u5df2\u6dfb\u52a0"

    .line 103
    .line 104
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0

    .line 112
    :cond_3
    div-double/2addr v0, v2

    .line 113
    new-instance p1, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string p0, "\u4ebf\u4eba\u5df2\u6dfb\u52a0"

    .line 126
    .line 127
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    return-object p0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y0i0;->C:Ll/x0m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/x0m;->p0()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {v0}, Ll/rsf0;->i(I)F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/high16 v1, 0x44160000    # 600.0f

    .line 12
    .line 13
    cmpg-float v0, v0, v1

    .line 14
    .line 15
    if-gez v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Ll/y0i0;->D:Z

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public s()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v1, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->F9(Ljava/util/List;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v1, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->La(Ljava/util/List;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget-object p0, p0, Ll/y0i0;->G:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    add-int/2addr v0, p0

    .line 54
    const/16 p0, 0xc8

    .line 55
    .line 56
    if-lt v0, p0, :cond_0

    .line 57
    .line 58
    const/4 p0, 0x1

    .line 59
    return p0

    .line 60
    :cond_0
    const/4 p0, 0x0

    .line 61
    return p0
.end method

.method public t(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/u0i0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Ll/u0i0;-><init>(Ll/y0i0;Ljava/lang/String;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public u(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y0i0;->G:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget p2, Ll/fbc0;->h:I

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget p2, Ll/fbc0;->i:I

    .line 32
    .line 33
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic v(ZLjava/util/List;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p1, p0, Ll/y0i0;->E:I

    .line 4
    .line 5
    add-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    iget p3, p0, Ll/y0i0;->F:I

    .line 8
    .line 9
    invoke-virtual {p0, p2, p1, p3}, Ll/y0i0;->H(Ljava/util/List;II)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic w(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/y0i0;->C:Ll/x0m;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/x0m;->q1()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    const-string p0, "\u7f51\u7edc\u65e0\u6cd5\u8fde\u63a5"

    .line 14
    .line 15
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p1, p0, Ll/y0i0;->G:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/4 v0, 0x1

    .line 26
    if-lt p1, v0, :cond_4

    .line 27
    .line 28
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 43
    .line 44
    new-instance v0, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 47
    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iget-object v1, p0, Ll/y0i0;->G:Ljava/util/List;

    .line 54
    .line 55
    if-nez p1, :cond_2

    .line 56
    .line 57
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_1

    .line 66
    .line 67
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Ljava/lang/String;

    .line 72
    .line 73
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    const/4 p1, 0x0

    .line 78
    iget-object v1, p0, Ll/y0i0;->G:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v0, p1, v1}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    move-object v0, v1

    .line 85
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    const/4 v1, 0x5

    .line 90
    if-ge p1, v1, :cond_3

    .line 91
    .line 92
    const-string p0, "\u8bf7\u81f3\u5c11\u9009\u62e95\u4e2a\u6807\u7b7e"

    .line 93
    .line 94
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_3
    iget-object p1, p0, Ll/y0i0;->G:Ljava/util/List;

    .line 99
    .line 100
    invoke-virtual {p0, v0, p1}, Ll/y0i0;->G(Ljava/util/List;Ljava/util/List;)V

    .line 101
    .line 102
    .line 103
    :cond_4
    return-void
.end method

.method public final synthetic x(Ljava/lang/String;Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p3, p0, Ll/y0i0;->G:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p3, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    iget-object p3, p0, Ll/y0i0;->G:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p3, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/y0i0;->s()Z

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-nez p3, :cond_1

    .line 20
    .line 21
    iget-object p3, p0, Ll/y0i0;->G:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-string p3, "\u9009\u62e9\u7684\u6570\u91cf\u8fbe\u5230\u6807\u7b7e\u4e0a\u9650"

    .line 28
    .line 29
    invoke-static {p3}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :goto_0
    invoke-virtual {p0, p2, p1}, Ll/y0i0;->u(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/y0i0;->J()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic z(Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/y0i0;->J:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/y0i0;->H:Ll/y20;

    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "\u5df2\u6dfb\u52a0"

    .line 12
    .line 13
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->c2:Ljava/util/HashSet;

    .line 21
    .line 22
    const-string p1, "e_card_add_operation_tag_button"

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    return-void
.end method
