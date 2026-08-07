.class public Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/ImageView;

.field public d:Lv/VText;

.field public e:Landroid/widget/ImageView;

.field public f:Landroid/widget/ImageView;

.field public g:Landroid/widget/ImageView;

.field public h:Landroid/view/View;

.field public i:Lv/VDraweeView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Ll/c7;

.field public m:Z

.field public n:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

.field public o:Landroid/graphics/drawable/Animatable;

.field public p:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->e(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->o:Landroid/graphics/drawable/Animatable;

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/b84;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->d:Lv/VText;

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->d:Lv/VText;

    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, ""

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    add-int/2addr p1, v2

    .line 19
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->j:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->j1:I

    .line 36
    .line 37
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {v1, v3, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->j:Landroid/widget/TextView;

    .line 53
    .line 54
    const/4 v0, 0x4

    .line 55
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->i(Landroid/widget/TextView;I)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->j:Landroid/widget/TextView;

    .line 59
    .line 60
    const/4 v0, -0x1

    .line 61
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->g:Landroid/widget/ImageView;

    .line 65
    .line 66
    sget v0, Ll/obc0;->l1:I

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->g:Landroid/widget/ImageView;

    .line 72
    .line 73
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->e:Landroid/widget/ImageView;

    .line 77
    .line 78
    const/4 v0, 0x0

    .line 79
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->f:Landroid/widget/ImageView;

    .line 83
    .line 84
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->b:Lv/VDraweeView;

    .line 88
    .line 89
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->k:Landroid/widget/TextView;

    .line 93
    .line 94
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->c:Landroid/widget/ImageView;

    .line 98
    .line 99
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->k()V

    .line 103
    .line 104
    .line 105
    const/4 p1, 0x0

    .line 106
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->n:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 107
    .line 108
    return-void
.end method

.method public final synthetic e(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->h:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/graphics/drawable/GradientDrawable;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const-string v0, "#00ff852a"

    .line 20
    .line 21
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x0

    .line 26
    filled-new-array {v1, v0, p1}, [I

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final f()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->i:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->i:Lv/VDraweeView;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->h:Landroid/view/View;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->l:Ll/c7;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView$a;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v2, "res://drawable/"

    .line 33
    .line 34
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    sget v2, Ll/obc0;->X8:I

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {}, Ll/f9j;->g()Ll/lq70;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2, v1}, Ll/lq70;->O(Ljava/lang/String;)Ll/lq70;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1, v0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->B(Ll/v36;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ll/lq70;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->l:Ll/c7;

    .line 65
    .line 66
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->i:Lv/VDraweeView;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->l:Ll/c7;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->g()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final g()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->h:Landroid/view/View;

    .line 2
    .line 3
    sget v1, Ll/obc0;->g7:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->h:Landroid/view/View;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->p:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->p:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    :cond_0
    const-string v0, "#b4ffbb00"

    .line 25
    .line 26
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const-string v1, "#67ffbb00"

    .line 31
    .line 32
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    filled-new-array {v0, v1}, [I

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofArgb([I)Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->p:Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    const-wide/16 v1, 0x2ee

    .line 47
    .line 48
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->p:Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    new-instance v1, Ll/a84;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/a84;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->p:Landroid/animation/ValueAnimator;

    .line 62
    .line 63
    const/4 v1, 0x2

    .line 64
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->p:Landroid/animation/ValueAnimator;

    .line 68
    .line 69
    const/4 v1, -0x1

    .line 70
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->p:Landroid/animation/ValueAnimator;

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/h64;IZ)V
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->n:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->k:Landroid/widget/TextView;

    .line 4
    .line 5
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userRecvRewardPoint:J

    .line 6
    .line 7
    long-to-double v1, v1

    .line 8
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1}, Ll/u54;->h(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, -0x1

    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x1

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->f:Landroid/widget/ImageView;

    .line 25
    .line 26
    sget p2, Ll/obc0;->q1:I

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->j:Landroid/widget/TextView;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    sget p4, Lcom/p1/mobile/putong/live/livingroom/R$string;->j1:I

    .line 38
    .line 39
    add-int/2addr p3, v3

    .line 40
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    invoke-virtual {p2, p4, p3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->j:Landroid/widget/TextView;

    .line 56
    .line 57
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->k:Landroid/widget/TextView;

    .line 61
    .line 62
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->c:Landroid/widget/ImageView;

    .line 66
    .line 67
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->e:Landroid/widget/ImageView;

    .line 71
    .line 72
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->b:Lv/VDraweeView;

    .line 76
    .line 77
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->k()V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->b:Lv/VDraweeView;

    .line 85
    .line 86
    invoke-static {p3, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->b:Lv/VDraweeView;

    .line 90
    .line 91
    iget-object v0, p2, Ll/h64;->c:Ljava/lang/String;

    .line 92
    .line 93
    sget v4, Ll/qa00;->z:I

    .line 94
    .line 95
    const-string v5, "context_single_room"

    .line 96
    .line 97
    invoke-static {v5, p3, v0, v4}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 98
    .line 99
    .line 100
    invoke-static {p1}, Ll/u54;->l(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 101
    .line 102
    .line 103
    move-result p3

    .line 104
    if-eqz p3, :cond_1

    .line 105
    .line 106
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->f:Landroid/widget/ImageView;

    .line 107
    .line 108
    sget p3, Ll/obc0;->F1:I

    .line 109
    .line 110
    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->c:Landroid/widget/ImageView;

    .line 114
    .line 115
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->k()V

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_1
    iget-boolean p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

    .line 123
    .line 124
    if-nez p3, :cond_2

    .line 125
    .line 126
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

    .line 127
    .line 128
    if-nez p1, :cond_2

    .line 129
    .line 130
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->c:Landroid/widget/ImageView;

    .line 131
    .line 132
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->f:Landroid/widget/ImageView;

    .line 136
    .line 137
    const/4 p3, 0x0

    .line 138
    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 139
    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->f:Landroid/widget/ImageView;

    .line 143
    .line 144
    sget p3, Ll/obc0;->r1:I

    .line 145
    .line 146
    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->c:Landroid/widget/ImageView;

    .line 150
    .line 151
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->k()V

    .line 155
    .line 156
    .line 157
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->j:Landroid/widget/TextView;

    .line 158
    .line 159
    iget-object p2, p2, Ll/h64;->b:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->j:Landroid/widget/TextView;

    .line 165
    .line 166
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->k:Landroid/widget/TextView;

    .line 170
    .line 171
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->m:Z

    .line 172
    .line 173
    xor-int/2addr p2, v3

    .line 174
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->e:Landroid/widget/ImageView;

    .line 178
    .line 179
    invoke-static {p1, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 180
    .line 181
    .line 182
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->j:Landroid/widget/TextView;

    .line 183
    .line 184
    const/4 p2, 0x3

    .line 185
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->i(Landroid/widget/TextView;I)V

    .line 186
    .line 187
    .line 188
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->f:Landroid/widget/ImageView;

    .line 189
    .line 190
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 191
    .line 192
    .line 193
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->g:Landroid/widget/ImageView;

    .line 194
    .line 195
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public final i(Landroid/widget/TextView;I)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setEms(I)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j(ZZ)V
    .locals 4

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->m:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->j:Landroid/widget/TextView;

    .line 4
    .line 5
    xor-int/lit8 v1, p1, 0x1

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->n:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->k:Landroid/widget/TextView;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x1

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    if-nez p1, :cond_1

    .line 23
    .line 24
    invoke-static {v0}, Ll/u54;->h(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    move v0, v3

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    move v0, v2

    .line 33
    :goto_0
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->b:Lv/VDraweeView;

    .line 37
    .line 38
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->e:Landroid/widget/ImageView;

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    if-nez p1, :cond_2

    .line 47
    .line 48
    if-eqz p2, :cond_2

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->n:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 51
    .line 52
    invoke-static {p0}, Ll/u54;->h(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_2

    .line 57
    .line 58
    move v2, v3

    .line 59
    :cond_2
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->o:Landroid/graphics/drawable/Animatable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Landroid/graphics/drawable/Animatable;->stop()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->i:Lv/VDraweeView;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->l()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->p:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->h:Landroid/view/View;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->isSpeak:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-static {p1}, Ll/u54;->l(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->f()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->k()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->k()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->o:Landroid/graphics/drawable/Animatable;

    .line 6
    .line 7
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetItemView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
