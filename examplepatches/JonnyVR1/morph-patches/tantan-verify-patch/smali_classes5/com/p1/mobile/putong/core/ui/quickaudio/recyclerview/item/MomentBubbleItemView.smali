.class public Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;
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

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->k(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method private synthetic k(Ll/y20;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->g:Lv/VLinear;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->j:Landroid/widget/TextView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->k:Landroid/widget/TextView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->n:Lv/VDraweeView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->i:Landroid/widget/TextView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->i:Landroid/widget/TextView;

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->l:Landroidx/legacy/widget/Space;

    .line 15
    .line 16
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->m:Landroid/view/View;

    .line 20
    .line 21
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->n:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->g:Lv/VLinear;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->g:Lv/VLinear;

    .line 38
    .line 39
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->h:Lv/VDraweeView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->h:Lv/VDraweeView;

    .line 51
    .line 52
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->k:Landroid/widget/TextView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->k:Landroid/widget/TextView;

    .line 64
    .line 65
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->j:Landroid/widget/TextView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->j:Landroid/widget/TextView;

    .line 77
    .line 78
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->s:Landroid/view/View;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

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
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->setContentAlpha(Ljava/lang/Float;)V

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->e:Lv/VRelative;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mh00;->a(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l(Ljava/lang/String;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;",
            ">;)V"
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->o:Lv/VFrame;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->m(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    new-instance v0, Ll/lh00;

    .line 23
    .line 24
    invoke-direct {v0, p0, p2}, Ll/lh00;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final m(Ljava/lang/String;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 4
    .line 5
    iget-object v0, v0, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 15
    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 17
    .line 18
    iget-object v0, v0, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const-string v1, "p_state_explore"

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    if-eqz v0, :cond_4

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 32
    .line 33
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 34
    .line 35
    iget-object v0, v0, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 40
    .line 41
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 48
    .line 49
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 50
    .line 51
    iget-object v0, v0, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 56
    .line 57
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    goto/16 :goto_1

    .line 64
    .line 65
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 66
    .line 67
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 68
    .line 69
    iget-object v0, v0, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Ljava/lang/String;

    .line 80
    .line 81
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 82
    .line 83
    check-cast v3, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 84
    .line 85
    iget-object v3, v3, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 86
    .line 87
    iget-object v3, v3, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 88
    .line 89
    iget-object v3, v3, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    check-cast v3, Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->e:Lv/VRelative;

    .line 102
    .line 103
    if-eqz v4, :cond_2

    .line 104
    .line 105
    iget-object v4, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 106
    .line 107
    check-cast v4, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 108
    .line 109
    iget-object v4, v4, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 110
    .line 111
    iget-object v4, v4, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 112
    .line 113
    iget-object v4, v4, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 114
    .line 115
    invoke-static {v4}, Ll/zce;->a(Ljava/util/List;)Landroid/graphics/drawable/GradientDrawable;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    invoke-virtual {v5, v4}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 120
    .line 121
    .line 122
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->j:Landroid/widget/TextView;

    .line 123
    .line 124
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->k:Landroid/widget/TextView;

    .line 128
    .line 129
    const/4 v5, 0x2

    .line 130
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_2
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    invoke-virtual {v5, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 139
    .line 140
    .line 141
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->e:Lv/VRelative;

    .line 142
    .line 143
    sget v5, Ll/qa00;->t:I

    .line 144
    .line 145
    invoke-static {v4, v5}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 146
    .line 147
    .line 148
    :goto_0
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->g:Lv/VLinear;

    .line 149
    .line 150
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    invoke-virtual {v4, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 155
    .line 156
    .line 157
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->g:Lv/VLinear;

    .line 158
    .line 159
    sget v4, Ll/qa00;->r:I

    .line 160
    .line 161
    invoke-static {v3, v4}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 162
    .line 163
    .line 164
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->s:Landroid/view/View;

    .line 165
    .line 166
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    move-result v4

    .line 170
    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 171
    .line 172
    .line 173
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->s:Landroid/view/View;

    .line 174
    .line 175
    sget v4, Ll/qa00;->h:I

    .line 176
    .line 177
    invoke-static {v3, v4}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 178
    .line 179
    .line 180
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->m:Landroid/view/View;

    .line 181
    .line 182
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    invoke-virtual {v3, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->m:Landroid/view/View;

    .line 190
    .line 191
    sget v3, Ll/qa00;->s:I

    .line 192
    .line 193
    invoke-static {v0, v3}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 194
    .line 195
    .line 196
    goto :goto_2

    .line 197
    :cond_3
    :goto_1
    new-instance v0, Ljava/lang/Exception;

    .line 198
    .line 199
    const-string v3, "bubbleInfo backgroundColor isEmpty"

    .line 200
    .line 201
    invoke-direct {v0, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    sget-object v3, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p5:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 205
    .line 206
    const/16 v4, 0x64

    .line 207
    .line 208
    const-string v5, "core_onlinematch"

    .line 209
    .line 210
    invoke-static {v0, v5, v3, v4}, Lcom/tantanapp/common/utils/CrashHelper;->i(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;I)V

    .line 211
    .line 212
    .line 213
    :cond_4
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 214
    .line 215
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 216
    .line 217
    iget-object v0, v0, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 218
    .line 219
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 220
    .line 221
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    const/4 v3, 0x1

    .line 226
    if-eqz v0, :cond_9

    .line 227
    .line 228
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 229
    .line 230
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 231
    .line 232
    iget-object v0, v0, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 233
    .line 234
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 235
    .line 236
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 237
    .line 238
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->h:Lv/VDraweeView;

    .line 243
    .line 244
    if-eqz v0, :cond_5

    .line 245
    .line 246
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 247
    .line 248
    .line 249
    goto :goto_3

    .line 250
    :cond_5
    invoke-static {v4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 251
    .line 252
    .line 253
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 254
    .line 255
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->h:Lv/VDraweeView;

    .line 256
    .line 257
    iget-object v5, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 258
    .line 259
    check-cast v5, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 260
    .line 261
    iget-object v5, v5, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 262
    .line 263
    iget-object v5, v5, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 264
    .line 265
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 266
    .line 267
    sget v6, Ll/qa00;->y:I

    .line 268
    .line 269
    invoke-virtual {v0, v4, v5, v6, v6}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 270
    .line 271
    .line 272
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 273
    .line 274
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 275
    .line 276
    iget-object v0, v0, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 277
    .line 278
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 279
    .line 280
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 281
    .line 282
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->i:Landroid/widget/TextView;

    .line 287
    .line 288
    if-eqz v0, :cond_6

    .line 289
    .line 290
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 291
    .line 292
    .line 293
    goto :goto_4

    .line 294
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 295
    .line 296
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 297
    .line 298
    iget-object v0, v0, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 299
    .line 300
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 301
    .line 302
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 303
    .line 304
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 305
    .line 306
    .line 307
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->i:Landroid/widget/TextView;

    .line 308
    .line 309
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 310
    .line 311
    .line 312
    :goto_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->g:Lv/VLinear;

    .line 313
    .line 314
    iget-object v4, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 315
    .line 316
    check-cast v4, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 317
    .line 318
    iget-object v4, v4, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 319
    .line 320
    iget-object v4, v4, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 321
    .line 322
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 323
    .line 324
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 325
    .line 326
    .line 327
    move-result v4

    .line 328
    if-eqz v4, :cond_8

    .line 329
    .line 330
    iget-object v4, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 331
    .line 332
    check-cast v4, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 333
    .line 334
    iget-object v4, v4, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 335
    .line 336
    iget-object v4, v4, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 337
    .line 338
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 339
    .line 340
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 341
    .line 342
    .line 343
    move-result v4

    .line 344
    if-nez v4, :cond_7

    .line 345
    .line 346
    goto :goto_5

    .line 347
    :cond_7
    move v4, v2

    .line 348
    goto :goto_6

    .line 349
    :cond_8
    :goto_5
    move v4, v3

    .line 350
    :goto_6
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 351
    .line 352
    .line 353
    goto :goto_7

    .line 354
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->h:Lv/VDraweeView;

    .line 355
    .line 356
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 357
    .line 358
    .line 359
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->i:Landroid/widget/TextView;

    .line 360
    .line 361
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 362
    .line 363
    .line 364
    :goto_7
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 365
    .line 366
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 367
    .line 368
    iget-object v0, v0, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 369
    .line 370
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 371
    .line 372
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 373
    .line 374
    .line 375
    move-result v0

    .line 376
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->k:Landroid/widget/TextView;

    .line 377
    .line 378
    if-eqz v0, :cond_a

    .line 379
    .line 380
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 381
    .line 382
    .line 383
    goto :goto_8

    .line 384
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 385
    .line 386
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 387
    .line 388
    iget-object v0, v0, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 389
    .line 390
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 391
    .line 392
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 393
    .line 394
    .line 395
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->k:Landroid/widget/TextView;

    .line 396
    .line 397
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 398
    .line 399
    .line 400
    :goto_8
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 401
    .line 402
    .line 403
    move-result v0

    .line 404
    if-eqz v0, :cond_b

    .line 405
    .line 406
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->k:Landroid/widget/TextView;

    .line 407
    .line 408
    const-string v3, "#000000"

    .line 409
    .line 410
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 411
    .line 412
    .line 413
    move-result v4

    .line 414
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 415
    .line 416
    .line 417
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->i:Landroid/widget/TextView;

    .line 418
    .line 419
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 420
    .line 421
    .line 422
    move-result v3

    .line 423
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 424
    .line 425
    .line 426
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 427
    .line 428
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 429
    .line 430
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->f:Lcom/p1/mobile/putong/core/data/Bubbles;

    .line 431
    .line 432
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Bubbles;->photoURL:Ljava/lang/String;

    .line 433
    .line 434
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 435
    .line 436
    .line 437
    move-result v0

    .line 438
    if-nez v0, :cond_e

    .line 439
    .line 440
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 441
    .line 442
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 443
    .line 444
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->f:Lcom/p1/mobile/putong/core/data/Bubbles;

    .line 445
    .line 446
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Bubbles;->userID:Ljava/lang/String;

    .line 447
    .line 448
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 449
    .line 450
    .line 451
    move-result-object v3

    .line 452
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 453
    .line 454
    .line 455
    move-result-object v3

    .line 456
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 457
    .line 458
    .line 459
    move-result v0

    .line 460
    if-eqz v0, :cond_c

    .line 461
    .line 462
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 463
    .line 464
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->n:Lv/VDraweeView;

    .line 465
    .line 466
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 467
    .line 468
    check-cast v1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 469
    .line 470
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->f:Lcom/p1/mobile/putong/core/data/Bubbles;

    .line 471
    .line 472
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Bubbles;->photoURL:Ljava/lang/String;

    .line 473
    .line 474
    sget v3, Ll/qa00;->s:I

    .line 475
    .line 476
    invoke-virtual {p1, v0, v1, v3, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 477
    .line 478
    .line 479
    goto :goto_9

    .line 480
    :cond_c
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 481
    .line 482
    .line 483
    move-result p1

    .line 484
    if-eqz p1, :cond_d

    .line 485
    .line 486
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 487
    .line 488
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->n:Lv/VDraweeView;

    .line 489
    .line 490
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 491
    .line 492
    check-cast v1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 493
    .line 494
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->f:Lcom/p1/mobile/putong/core/data/Bubbles;

    .line 495
    .line 496
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Bubbles;->photoURL:Ljava/lang/String;

    .line 497
    .line 498
    sget v3, Ll/qa00;->s:I

    .line 499
    .line 500
    invoke-virtual {p1, v0, v1, v3, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 501
    .line 502
    .line 503
    goto :goto_9

    .line 504
    :cond_d
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 505
    .line 506
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->n:Lv/VDraweeView;

    .line 507
    .line 508
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 509
    .line 510
    check-cast v1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 511
    .line 512
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->f:Lcom/p1/mobile/putong/core/data/Bubbles;

    .line 513
    .line 514
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Bubbles;->photoURL:Ljava/lang/String;

    .line 515
    .line 516
    const/4 v3, 0x4

    .line 517
    const/16 v4, 0x8

    .line 518
    .line 519
    invoke-virtual {p1, v0, v1, v3, v4}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 520
    .line 521
    .line 522
    :cond_e
    :goto_9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->o:Lv/VFrame;

    .line 523
    .line 524
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 525
    .line 526
    .line 527
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/MomentBubbleItemView;->j(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
