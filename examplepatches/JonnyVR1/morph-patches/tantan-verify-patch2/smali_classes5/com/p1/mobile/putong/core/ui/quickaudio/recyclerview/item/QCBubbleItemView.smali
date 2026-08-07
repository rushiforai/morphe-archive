.class public Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;
.super Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;
.source "SourceFile"


# instance fields
.field public d:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public e:Lv/VRelative;

.field public f:Lcom/tantan/library/svga/SVGAnimationView;

.field public g:Lv/VLinear;

.field public h:Lv/VDraweeView;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Landroidx/legacy/widget/Space;

.field public m:Landroid/view/View;

.field public n:Lv/VDraweeView;

.field public o:Lv/VFrame;

.field public p:Lv/VDraweeView;

.field public q:Lv/VDraweeView;

.field public r:Lv/VDraweeView;

.field public s:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->k(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method private synthetic k(Ll/y20;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/view/View;->getScaleY()F

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/high16 v0, 0x3f000000    # 0.5f

    .line 8
    .line 9
    cmpg-float p2, p2, v0

    .line 10
    .line 11
    if-gez p2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method private setContentAlpha(Ljava/lang/Float;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    cmpg-float v0, v0, v1

    .line 7
    .line 8
    if-gez v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->g:Lv/VLinear;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->j:Landroid/widget/TextView;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->k:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->n:Lv/VDraweeView;

    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 45
    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public c(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->i:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;->h(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->i:Landroid/widget/TextView;

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->l:Landroidx/legacy/widget/Space;

    .line 15
    .line 16
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->m:Landroid/view/View;

    .line 20
    .line 21
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->n:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->g:Lv/VLinear;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;->h(Landroid/view/View;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->g:Lv/VLinear;

    .line 38
    .line 39
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->h:Lv/VDraweeView;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;->h(Landroid/view/View;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->h:Lv/VDraweeView;

    .line 51
    .line 52
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->k:Landroid/widget/TextView;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;->h(Landroid/view/View;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->k:Landroid/widget/TextView;

    .line 64
    .line 65
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->j:Landroid/widget/TextView;

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;->h(Landroid/view/View;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->j:Landroid/widget/TextView;

    .line 77
    .line 78
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->s:Landroid/view/View;

    .line 82
    .line 83
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public e(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v1, v1

    .line 8
    const/high16 v2, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v1, v2

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 28
    .line 29
    .line 30
    float-to-double v0, p1

    .line 31
    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    .line 32
    .line 33
    sub-double/2addr v0, v2

    .line 34
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 35
    .line 36
    mul-double/2addr v0, v2

    .line 37
    double-to-float v0, v0

    .line 38
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->setContentAlpha(Ljava/lang/Float;)V

    .line 43
    .line 44
    .line 45
    sget v0, Ll/qa00;->L:I

    .line 46
    .line 47
    sget v1, Ll/qa00;->t:I

    .line 48
    .line 49
    sub-int v1, v0, v1

    .line 50
    .line 51
    int-to-float v1, v1

    .line 52
    mul-float/2addr v1, p1

    .line 53
    float-to-int p1, v1

    .line 54
    sub-int/2addr v0, p1

    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->e:Lv/VRelative;

    .line 56
    .line 57
    invoke-static {p0, v0}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public getAnimLayout()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bvb0;->a(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l(Ll/y20;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->o:Lv/VFrame;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->m(I)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    new-instance v0, Ll/avb0;

    .line 23
    .line 24
    invoke-direct {v0, p0, p1}, Ll/avb0;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public m(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->j:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->i:Landroid/widget/TextView;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->k:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 19
    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->g:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->j:Landroid/widget/TextView;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 34
    .line 35
    check-cast v2, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->g:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 38
    .line 39
    invoke-static {v2}, Ll/tv50;->b(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->k:Landroid/widget/TextView;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 49
    .line 50
    check-cast v2, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 51
    .line 52
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->g:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    invoke-static {v2}, Ll/tv50;->a(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->n:Lv/VDraweeView;

    .line 66
    .line 67
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 68
    .line 69
    check-cast v3, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 70
    .line 71
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->g:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 72
    .line 73
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->avatarUrl:Ljava/lang/String;

    .line 74
    .line 75
    const/4 v4, 0x4

    .line 76
    const/16 v5, 0x8

    .line 77
    .line 78
    invoke-virtual {v0, v2, v3, v4, v5}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 79
    .line 80
    .line 81
    int-to-long v2, p1

    .line 82
    invoke-static {v2, v3}, Ll/i6c0;->a(J)Ll/bkj0;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->e:Lv/VRelative;

    .line 87
    .line 88
    iget-object v2, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast v2, Ljava/lang/Integer;

    .line 91
    .line 92
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->e:Lv/VRelative;

    .line 100
    .line 101
    sget v2, Ll/qa00;->t:I

    .line 102
    .line 103
    invoke-static {v0, v2}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->s:Landroid/view/View;

    .line 107
    .line 108
    iget-object v2, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 109
    .line 110
    check-cast v2, Ljava/lang/Integer;

    .line 111
    .line 112
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->s:Landroid/view/View;

    .line 120
    .line 121
    sget v2, Ll/qa00;->h:I

    .line 122
    .line 123
    invoke-static {v0, v2}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->m:Landroid/view/View;

    .line 127
    .line 128
    iget-object v2, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 129
    .line 130
    check-cast v2, Ljava/lang/Integer;

    .line 131
    .line 132
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->m:Landroid/view/View;

    .line 140
    .line 141
    sget v2, Ll/qa00;->s:I

    .line 142
    .line 143
    invoke-static {v0, v2}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->g:Lv/VLinear;

    .line 147
    .line 148
    iget-object v2, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 149
    .line 150
    check-cast v2, Ljava/lang/Integer;

    .line 151
    .line 152
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->g:Lv/VLinear;

    .line 160
    .line 161
    sget v2, Ll/qa00;->r:I

    .line 162
    .line 163
    invoke-static {v0, v2}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->h:Lv/VDraweeView;

    .line 167
    .line 168
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->g:Lv/VLinear;

    .line 172
    .line 173
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->h:Lv/VDraweeView;

    .line 177
    .line 178
    sget v1, Ll/qa00;->f:I

    .line 179
    .line 180
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 181
    .line 182
    .line 183
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->h:Lv/VDraweeView;

    .line 184
    .line 185
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 186
    .line 187
    check-cast p1, Ljava/lang/Integer;

    .line 188
    .line 189
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 194
    .line 195
    .line 196
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/QCBubbleItemView;->j(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
