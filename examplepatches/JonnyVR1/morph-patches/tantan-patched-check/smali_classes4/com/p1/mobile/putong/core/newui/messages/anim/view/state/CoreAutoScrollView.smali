.class public Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/VDraweeView;

.field public c:Landroid/view/View;

.field public d:Landroid/view/View;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public h:Lv/VDraweeView;

.field public i:Landroid/view/View;

.field public j:Landroid/view/View;

.field public k:Lv/VDraweeView;

.field public l:Lv/VText;

.field public m:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public n:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public o:Landroid/animation/AnimatorSet;

.field public p:Landroid/animation/Animator$AnimatorListener;

.field public final q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation
.end field

.field public r:I

.field public s:Z

.field public t:Z

.field public u:Ljava/lang/Runnable;

.field public v:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public w:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 25
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->q:Ljava/util/List;

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->s:Z

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->t:Z

    .line 16
    .line 17
    new-instance p1, Ll/b07;

    .line 18
    .line 19
    invoke-direct {p1, p0}, Ll/b07;-><init>(Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->u:Ljava/lang/Runnable;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->p()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->u:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;)Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->n:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->r:I

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;)Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->q:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->n:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-void
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->r:I

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-void
.end method


# virtual methods
.method public getBubbleInfoLists()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->q:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->r:I

    .line 2
    .line 3
    return p0
.end method

.method public final j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/c07;->a(Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->q:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public l()Landroid/animation/AnimatorSet;
    .locals 14

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    new-array v3, v2, [F

    .line 10
    .line 11
    fill-array-data v3, :array_0

    .line 12
    .line 13
    .line 14
    const-string v4, "alpha"

    .line 15
    .line 16
    invoke-static {v1, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-wide/16 v3, 0x12c

    .line 21
    .line 22
    invoke-virtual {v1, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 23
    .line 24
    .line 25
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    neg-int v6, v6

    .line 32
    int-to-float v6, v6

    .line 33
    new-array v7, v2, [F

    .line 34
    .line 35
    const/4 v8, 0x0

    .line 36
    const/4 v9, 0x0

    .line 37
    aput v9, v7, v8

    .line 38
    .line 39
    const/4 v10, 0x1

    .line 40
    aput v6, v7, v10

    .line 41
    .line 42
    const-string v6, "translationY"

    .line 43
    .line 44
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    const-wide/16 v11, 0x258

    .line 49
    .line 50
    invoke-virtual {v5, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 51
    .line 52
    .line 53
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->n:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    int-to-float p0, p0

    .line 60
    new-array v13, v2, [F

    .line 61
    .line 62
    aput p0, v13, v8

    .line 63
    .line 64
    aput v9, v13, v10

    .line 65
    .line 66
    invoke-static {v7, v6, v13}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0, v11, v12}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v3, v4}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 74
    .line 75
    .line 76
    const/4 v3, 0x3

    .line 77
    new-array v3, v3, [Landroid/animation/Animator;

    .line 78
    .line 79
    aput-object v1, v3, v8

    .line 80
    .line 81
    aput-object p0, v3, v10

    .line 82
    .line 83
    aput-object v5, v3, v2

    .line 84
    .line 85
    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 86
    .line 87
    .line 88
    return-object v0

    .line 89
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public m(I)Landroid/graphics/drawable/GradientDrawable;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method public o()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->q:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->q:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x1

    .line 16
    if-le p0, v0, :cond_0

    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->t:Z

    .line 6
    .line 7
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->t:Z

    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->j(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Sd()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->v:Ljava/util/List;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->n:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView$a;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->p:Landroid/animation/Animator$AnimatorListener;

    .line 31
    .line 32
    return-void
.end method

.method public final synthetic p()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->q:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_a

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_5

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->n:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_a

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->o()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_a

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->q:Ljava/util/List;

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->r:I

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    add-int/2addr v1, v2

    .line 33
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    rem-int/2addr v1, v3

    .line 38
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 43
    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    goto/16 :goto_5

    .line 47
    .line 48
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->n:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 49
    .line 50
    const/4 v3, 0x4

    .line 51
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Lv/VText;

    .line 56
    .line 57
    iget-object v3, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    if-eqz v4, :cond_2

    .line 64
    .line 65
    iget-object v4, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 66
    .line 67
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    if-eqz v4, :cond_2

    .line 72
    .line 73
    iget-object v3, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 74
    .line 75
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->v:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    if-eqz v4, :cond_2

    .line 84
    .line 85
    new-instance v4, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v5, "\u627e\u4eba\u4e00\u8d77"

    .line 88
    .line 89
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    :cond_2
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->n:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 100
    .line 101
    const/4 v5, 0x0

    .line 102
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    check-cast v4, Lv/VDraweeView;

    .line 107
    .line 108
    iget-object v6, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 109
    .line 110
    if-eqz v6, :cond_4

    .line 111
    .line 112
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    if-nez v6, :cond_4

    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 121
    .line 122
    .line 123
    move-result-object v6

    .line 124
    iget-object v7, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 125
    .line 126
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 127
    .line 128
    invoke-interface {v6, v7}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 129
    .line 130
    .line 131
    move-result-object v6

    .line 132
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v7

    .line 136
    if-eqz v7, :cond_3

    .line 137
    .line 138
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 142
    .line 143
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 144
    .line 145
    .line 146
    move-result-object v6

    .line 147
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 148
    .line 149
    .line 150
    move-result-object v6

    .line 151
    invoke-virtual {v2, v4, v6}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 152
    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_3
    invoke-static {v4, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 156
    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_4
    invoke-static {v4, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 160
    .line 161
    .line 162
    :goto_0
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->locationName:Ljava/lang/String;

    .line 163
    .line 164
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    if-nez v2, :cond_5

    .line 169
    .line 170
    new-instance v2, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    const-string v3, "\u00b7"

    .line 179
    .line 180
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    iget-object v3, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->locationName:Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    :cond_5
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 193
    .line 194
    .line 195
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->n:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 196
    .line 197
    const/4 v2, 0x2

    .line 198
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 203
    .line 204
    const-string v3, "#ffffff"

    .line 205
    .line 206
    if-eqz v2, :cond_7

    .line 207
    .line 208
    iget-object v2, v2, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 209
    .line 210
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 211
    .line 212
    .line 213
    move-result v2

    .line 214
    if-eqz v2, :cond_6

    .line 215
    .line 216
    goto :goto_1

    .line 217
    :cond_6
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 218
    .line 219
    iget-object v2, v2, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 220
    .line 221
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    check-cast v2, Ljava/lang/String;

    .line 226
    .line 227
    goto :goto_2

    .line 228
    :cond_7
    :goto_1
    move-object v2, v3

    .line 229
    :goto_2
    :try_start_0
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 230
    .line 231
    .line 232
    move-result v2

    .line 233
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->m(I)Landroid/graphics/drawable/GradientDrawable;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 238
    .line 239
    .line 240
    goto :goto_3

    .line 241
    :catch_0
    move-exception v2

    .line 242
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 243
    .line 244
    .line 245
    move-result v3

    .line 246
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->m(I)Landroid/graphics/drawable/GradientDrawable;

    .line 247
    .line 248
    .line 249
    move-result-object v3

    .line 250
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 251
    .line 252
    .line 253
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 254
    .line 255
    .line 256
    :goto_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->n:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 257
    .line 258
    const/4 v1, 0x3

    .line 259
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    check-cast p0, Lv/VDraweeView;

    .line 264
    .line 265
    iget-object v1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 266
    .line 267
    if-eqz v1, :cond_9

    .line 268
    .line 269
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 270
    .line 271
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 272
    .line 273
    .line 274
    move-result v1

    .line 275
    if-eqz v1, :cond_8

    .line 276
    .line 277
    goto :goto_4

    .line 278
    :cond_8
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 279
    .line 280
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 281
    .line 282
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 283
    .line 284
    sget v2, Ll/qa00;->k:I

    .line 285
    .line 286
    invoke-virtual {v1, p0, v0, v2, v2}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 287
    .line 288
    .line 289
    return-void

    .line 290
    :cond_9
    :goto_4
    sget v0, Ll/dbc0;->jq:I

    .line 291
    .line 292
    invoke-virtual {p0, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 293
    .line 294
    .line 295
    :cond_a
    :goto_5
    return-void
.end method

.method public r()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->q:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_a

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_5

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_a

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->q:Ljava/util/List;

    .line 22
    .line 23
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->r:I

    .line 24
    .line 25
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    goto/16 :goto_5

    .line 34
    .line 35
    :cond_1
    const-string v1, "state_id"

    .line 36
    .line 37
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    filled-new-array {v1}, [Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "e_state_explore"

    .line 48
    .line 49
    const-string v3, "p_messages_view"

    .line 50
    .line 51
    invoke-static {v2, v3, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 55
    .line 56
    const/4 v2, 0x4

    .line 57
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Lv/VText;

    .line 62
    .line 63
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-eqz v3, :cond_2

    .line 70
    .line 71
    iget-object v3, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 72
    .line 73
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    if-eqz v3, :cond_2

    .line 78
    .line 79
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 80
    .line 81
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->v:Ljava/util/List;

    .line 84
    .line 85
    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    if-eqz v3, :cond_2

    .line 90
    .line 91
    new-instance v3, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    const-string v4, "\u627e\u4eba\u4e00\u8d77"

    .line 94
    .line 95
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    :cond_2
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 106
    .line 107
    const/4 v4, 0x0

    .line 108
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    check-cast v3, Lv/VDraweeView;

    .line 113
    .line 114
    iget-object v5, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 115
    .line 116
    if-eqz v5, :cond_4

    .line 117
    .line 118
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    if-nez v5, :cond_4

    .line 125
    .line 126
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    iget-object v6, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 131
    .line 132
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 133
    .line 134
    invoke-interface {v5, v6}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v6

    .line 142
    if-eqz v6, :cond_3

    .line 143
    .line 144
    const/4 v6, 0x1

    .line 145
    invoke-static {v3, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    sget-object v6, Ll/uqb0;->G:Ll/fsb0;

    .line 149
    .line 150
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 151
    .line 152
    .line 153
    move-result-object v5

    .line 154
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 155
    .line 156
    .line 157
    move-result-object v5

    .line 158
    invoke-virtual {v6, v3, v5}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 159
    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_3
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 163
    .line 164
    .line 165
    goto :goto_0

    .line 166
    :cond_4
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 167
    .line 168
    .line 169
    :goto_0
    iget-object v3, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->locationName:Ljava/lang/String;

    .line 170
    .line 171
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    if-nez v3, :cond_5

    .line 176
    .line 177
    new-instance v3, Ljava/lang/StringBuilder;

    .line 178
    .line 179
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string v2, "\u00b7"

    .line 186
    .line 187
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->locationName:Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    :cond_5
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 200
    .line 201
    .line 202
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 203
    .line 204
    const/4 v2, 0x2

    .line 205
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 210
    .line 211
    const-string v3, "#ffffff"

    .line 212
    .line 213
    if-eqz v2, :cond_7

    .line 214
    .line 215
    iget-object v2, v2, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 216
    .line 217
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 218
    .line 219
    .line 220
    move-result v2

    .line 221
    if-eqz v2, :cond_6

    .line 222
    .line 223
    goto :goto_1

    .line 224
    :cond_6
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 225
    .line 226
    iget-object v2, v2, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 227
    .line 228
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    check-cast v2, Ljava/lang/String;

    .line 233
    .line 234
    goto :goto_2

    .line 235
    :cond_7
    :goto_1
    move-object v2, v3

    .line 236
    :goto_2
    :try_start_0
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 237
    .line 238
    .line 239
    move-result v2

    .line 240
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->m(I)Landroid/graphics/drawable/GradientDrawable;

    .line 241
    .line 242
    .line 243
    move-result-object v2

    .line 244
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 245
    .line 246
    .line 247
    goto :goto_3

    .line 248
    :catch_0
    move-exception v2

    .line 249
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 250
    .line 251
    .line 252
    move-result v3

    .line 253
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->m(I)Landroid/graphics/drawable/GradientDrawable;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 258
    .line 259
    .line 260
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 261
    .line 262
    .line 263
    :goto_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 264
    .line 265
    const/4 v1, 0x3

    .line 266
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    check-cast p0, Lv/VDraweeView;

    .line 271
    .line 272
    iget-object v1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 273
    .line 274
    if-eqz v1, :cond_9

    .line 275
    .line 276
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 277
    .line 278
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 279
    .line 280
    .line 281
    move-result v1

    .line 282
    if-eqz v1, :cond_8

    .line 283
    .line 284
    goto :goto_4

    .line 285
    :cond_8
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 286
    .line 287
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 288
    .line 289
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 290
    .line 291
    sget v2, Ll/qa00;->k:I

    .line 292
    .line 293
    invoke-virtual {v1, p0, v0, v2, v2}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 294
    .line 295
    .line 296
    return-void

    .line 297
    :cond_9
    :goto_4
    sget v0, Ll/dbc0;->jq:I

    .line 298
    .line 299
    invoke-virtual {p0, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 300
    .line 301
    .line 302
    :cond_a
    :goto_5
    return-void
.end method

.method public s()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->w:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->u:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->o()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->u:Ljava/lang/Runnable;

    .line 20
    .line 21
    const-wide/16 v1, 0xbb8

    .line 22
    .line 23
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public setBubbleInfo(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->q:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->q:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->setCurrentIndex(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setBubbleInfoList(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->q:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->q:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->setCurrentIndex(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setCurrentIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->r:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->q()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->r()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final t()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->u:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->o:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->o:Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->o()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    :goto_0
    return-void

    .line 30
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->n:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    int-to-float v1, v1

    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->n:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->l()Landroid/animation/AnimatorSet;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->o:Landroid/animation/AnimatorSet;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->p:Landroid/animation/Animator$AnimatorListener;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->o:Landroid/animation/AnimatorSet;

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->w:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/state/CoreAutoScrollView;->u:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
