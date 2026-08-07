.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/i6t;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Landroid/view/View;

.field public e:Lv/VDraweeView;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;

.field public h:Ll/i6t;

.field public i:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->n0()V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->q0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->r0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->s0()V

    return-void
.end method

.method private synthetic q0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->h:Ll/i6t;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    instance-of p1, p0, Ll/gv70;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/gv70;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/gv70;->P3()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    instance-of p1, p0, Ll/av70;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    check-cast p0, Ll/av70;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/av70;->P3()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->d:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/iv70;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/iv70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->g:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ll/jv70;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/jv70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic r0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->h:Ll/i6t;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    instance-of p1, p0, Ll/gv70;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/gv70;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/gv70;->R3()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    instance-of p1, p0, Ll/av70;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    check-cast p0, Ll/av70;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/av70;->R3()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->p0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/i6t;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->m0(Ll/i6t;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final l0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mv70;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m0(Ll/i6t;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->h:Ll/i6t;

    .line 2
    .line 3
    return-void
.end method

.method public final n0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->e:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final o0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->i:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->end()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->o0()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->l0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->g:Lv/VText;

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->o0()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->f:Lv/VDraweeView;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, v0}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final s0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->e:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getController()Ll/lde;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->e:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getController()Ll/lde;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/lde;->f()Landroid/graphics/drawable/Animatable;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->e:Lv/VDraweeView;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getController()Ll/lde;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Ll/lde;->f()Landroid/graphics/drawable/Animatable;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p0}, Landroid/graphics/drawable/Animatable;->start()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->e:Lv/VDraweeView;

    .line 36
    .line 37
    sget-object v0, Ll/zft;->o:Ljava/lang/String;

    .line 38
    .line 39
    const-string v1, "context_livingAct"

    .line 40
    .line 41
    invoke-static {v1, p0, v0}, Ll/izs;->k(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public t0(Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->f:Lv/VDraweeView;

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;->giftPicture:Ljava/lang/String;

    .line 8
    .line 9
    sget v2, Ll/qa00;->q:I

    .line 10
    .line 11
    const-string v3, "context_single_room"

    .line 12
    .line 13
    invoke-static {v3, v0, v1, v2, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->g:Lv/VText;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;->giftName:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->u0()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final u0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->o0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    const/16 v1, 0x1770

    .line 6
    .line 7
    filled-new-array {v0, v1}, [I

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->i:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->i:Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    const/4 v1, -0x1

    .line 24
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->i:Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    new-instance v1, Ll/kv70;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/kv70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/gt0;->r(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->i:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    const-wide/16 v1, 0x1770

    .line 40
    .line 41
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->i:Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    new-instance v1, Ll/kv70;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/kv70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->i:Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    new-instance v1, Ll/lv70;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/lv70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->i:Landroid/animation/ValueAnimator;

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 67
    .line 68
    .line 69
    return-void
.end method
