.class public Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/LiveStrokeTextView;

.field public d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;

.field public e:Landroid/widget/FrameLayout;

.field public f:Landroid/widget/ImageView;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/FrameLayout;

.field public i:Lv/VDraweeView;

.field public j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public k:Ll/x20;

.field public l:Ll/jjs;

.field public m:Landroid/animation/Animator;

.field public n:Landroid/animation/ObjectAnimator;

.field public o:Landroid/animation/ObjectAnimator;

.field public p:Landroid/animation/AnimatorSet;

.field public q:Landroid/animation/ObjectAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->p()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;)Landroid/animation/ObjectAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->o:Landroid/animation/ObjectAnimator;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->k:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;)Landroid/animation/ObjectAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->n:Landroid/animation/ObjectAnimator;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;)Landroid/animation/Animator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->m:Landroid/animation/Animator;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->x(Z)V

    return-void
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xvn;->a(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->k:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->B()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final j(Ll/jjs;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/jjs;->g()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 6
    .line 7
    const/16 v1, 0x63

    .line 8
    .line 9
    if-le v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/LiveStrokeTextView;

    .line 12
    .line 13
    const/high16 v0, 0x41900000    # 18.0f

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p1}, Ll/jjs;->g()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/LiveStrokeTextView;

    .line 26
    .line 27
    const/16 v1, 0x3e7

    .line 28
    .line 29
    if-le v0, v1, :cond_1

    .line 30
    .line 31
    const/high16 v0, 0x41600000    # 14.0f

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/high16 v0, 0x41c00000    # 24.0f

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 40
    .line 41
    .line 42
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v0, "x"

    .line 45
    .line 46
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Ll/jjs;->g()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public final k(Z)Landroid/animation/ObjectAnimator;
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getRotation()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/high16 v1, 0x43b40000    # 360.0f

    .line 8
    .line 9
    add-float/2addr v1, v0

    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->a:Lv/VDraweeView;

    .line 11
    .line 12
    const/4 v3, 0x2

    .line 13
    new-array v3, v3, [F

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    aput v0, v3, v4

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    aput v1, v3, v0

    .line 20
    .line 21
    sget-object v0, Landroid/view/View;->ROTATION:Landroid/util/Property;

    .line 22
    .line 23
    invoke-static {v2, v0, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->n:Landroid/animation/ObjectAnimator;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->n:Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    const/4 v1, -0x1

    .line 36
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->n:Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->n:Landroid/animation/ObjectAnimator;

    .line 45
    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    const-wide/16 v1, 0xfa0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    const-wide/16 v1, 0x2ee0

    .line 52
    .line 53
    :goto_0
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->n:Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    return-object p0
.end method

.method public final l()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->m()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->n()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/LiveStrokeTextView;

    .line 8
    .line 9
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/n0k;->e(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final m()V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    new-array v3, v2, [F

    .line 7
    .line 8
    fill-array-data v3, :array_0

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1, v3}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->m:Landroid/animation/Animator;

    .line 16
    .line 17
    const-wide/16 v3, 0x258

    .line 18
    .line 19
    invoke-virtual {v0, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->m:Landroid/animation/Animator;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->a:Lv/VDraweeView;

    .line 29
    .line 30
    new-array v2, v2, [F

    .line 31
    .line 32
    fill-array-data v2, :array_1

    .line 33
    .line 34
    .line 35
    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 36
    .line 37
    invoke-static {v0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->o:Landroid/animation/ObjectAnimator;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->o:Landroid/animation/ObjectAnimator;

    .line 47
    .line 48
    const-wide/16 v1, 0x7d0

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->o:Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    const/4 v1, -0x1

    .line 56
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->o:Landroid/animation/ObjectAnimator;

    .line 60
    .line 61
    invoke-virtual {p0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :array_0
    .array-data 4
        0x0
        0x3f8ccccd    # 1.1f
        0x3f800000    # 1.0f
    .end array-data

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final n()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->p:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/LiveStrokeTextView;

    .line 9
    .line 10
    new-array v3, v1, [F

    .line 11
    .line 12
    fill-array-data v3, :array_0

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-wide/16 v3, 0x12c

    .line 20
    .line 21
    invoke-virtual {v0, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    new-instance v3, Ll/wvn;

    .line 25
    .line 26
    invoke-direct {v3, p0}, Ll/wvn;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v3}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/LiveStrokeTextView;

    .line 33
    .line 34
    sget-object v4, Ll/gt0;->i:Landroid/util/Property;

    .line 35
    .line 36
    new-array v5, v1, [F

    .line 37
    .line 38
    fill-array-data v5, :array_1

    .line 39
    .line 40
    .line 41
    invoke-static {v3, v4, v5}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    const-wide/16 v4, 0x8c

    .line 46
    .line 47
    invoke-virtual {v3, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 48
    .line 49
    .line 50
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/LiveStrokeTextView;

    .line 51
    .line 52
    sget-object v5, Ll/gt0;->i:Landroid/util/Property;

    .line 53
    .line 54
    new-array v6, v1, [F

    .line 55
    .line 56
    fill-array-data v6, :array_2

    .line 57
    .line 58
    .line 59
    invoke-static {v4, v5, v6}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    const-wide/16 v5, 0xa0

    .line 64
    .line 65
    invoke-virtual {v4, v5, v6}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    new-instance v5, Landroid/animation/AnimatorSet;

    .line 69
    .line 70
    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    .line 71
    .line 72
    .line 73
    filled-new-array {v3, v4}, [Landroid/animation/Animator;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v5, v3}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 78
    .line 79
    .line 80
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 81
    .line 82
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->p:Landroid/animation/AnimatorSet;

    .line 86
    .line 87
    new-array v4, v1, [Landroid/animation/Animator;

    .line 88
    .line 89
    const/4 v6, 0x0

    .line 90
    aput-object v0, v4, v6

    .line 91
    .line 92
    const/4 v0, 0x1

    .line 93
    aput-object v5, v4, v0

    .line 94
    .line 95
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 96
    .line 97
    .line 98
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->q:Landroid/animation/ObjectAnimator;

    .line 99
    .line 100
    if-nez v0, :cond_1

    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/LiveStrokeTextView;

    .line 103
    .line 104
    new-array v1, v1, [F

    .line 105
    .line 106
    fill-array-data v1, :array_3

    .line 107
    .line 108
    .line 109
    invoke-static {v0, v2, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->q:Landroid/animation/ObjectAnimator;

    .line 114
    .line 115
    const-wide/16 v1, 0xb4

    .line 116
    .line 117
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 118
    .line 119
    .line 120
    :cond_1
    return-void

    .line 121
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    :array_1
    .array-data 4
        0x40400000    # 3.0f
        0x3f333333    # 0.7f
    .end array-data

    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    :array_2
    .array-data 4
        0x3f333333    # 0.7f
        0x3f800000    # 1.0f
    .end array-data

    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final o()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->setOnCountDownListener(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->o()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->l()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->a:Lv/VDraweeView;

    .line 14
    .line 15
    sget-object v0, Ll/zft;->e:Ljava/lang/String;

    .line 16
    .line 17
    const/high16 v1, 0x43520000    # 210.0f

    .line 18
    .line 19
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const-string v3, "context_livingAct"

    .line 28
    .line 29
    invoke-static {v3, p0, v0, v2, v1}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/LiveStrokeTextView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->l:Ll/jjs;

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->j(Ll/jjs;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final q(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p1, "https://auto.tancdn.com/v1/raw/9a39e64d-1028-40f3-9088-791bbac78e7611.pdf"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p1, "https://auto.tancdn.com/v1/raw/976325c8-b40a-4a25-a316-629c4b348db810.pdf"

    .line 7
    .line 8
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->l:Ll/jjs;

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;

    .line 5
    .line 6
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->D()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/View;->clearAnimation()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->B()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->a:Lv/VDraweeView;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public s()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->M()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->D()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->a:Lv/VDraweeView;

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

.method public t(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->l:Ll/jjs;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Ll/jjs;->q(Ll/jjs;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->D()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->l:Ll/jjs;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;

    .line 19
    .line 20
    invoke-virtual {p2}, Ll/jjs;->f()J

    .line 21
    .line 22
    .line 23
    move-result-wide v1

    .line 24
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->setCountdownTime(J)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->i:Lv/VDraweeView;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->l:Ll/jjs;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 36
    .line 37
    const-string v2, "context_single_room"

    .line 38
    .line 39
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x1

    .line 43
    if-eqz p3, :cond_1

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->E0()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->K()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2}, Ll/jjs;->r()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->w(Z)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->J()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p2}, Ll/jjs;->c()Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->q(Z)V

    .line 76
    .line 77
    .line 78
    :cond_2
    :goto_0
    invoke-virtual {p2}, Ll/jjs;->c()Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_3

    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/LiveStrokeTextView;

    .line 85
    .line 86
    const/4 p1, 0x0

    .line 87
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->a:Lv/VDraweeView;

    .line 92
    .line 93
    sget-object p2, Ll/zft;->e:Ljava/lang/String;

    .line 94
    .line 95
    const/high16 p3, 0x43520000    # 210.0f

    .line 96
    .line 97
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 102
    .line 103
    .line 104
    move-result p3

    .line 105
    const-string v2, "context_livingAct"

    .line 106
    .line 107
    invoke-static {v2, p1, p2, v1, p3}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/LiveStrokeTextView;

    .line 111
    .line 112
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->p:Landroid/animation/AnimatorSet;

    .line 116
    .line 117
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->cancel()V

    .line 118
    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->p:Landroid/animation/AnimatorSet;

    .line 121
    .line 122
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->v()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->q:Landroid/animation/ObjectAnimator;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->q:Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final v()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->a:Lv/VDraweeView;

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    new-array v1, v1, [F

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    aput v0, v1, v2

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    const/4 v2, 0x1

    .line 17
    aput v0, v1, v2

    .line 18
    .line 19
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 20
    .line 21
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-wide/16 v0, 0xb4

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final w(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView$b;

    .line 6
    .line 7
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "https://auto.tancdn.com/v1/raw/7b02d224-8e47-4182-8d6c-486c6d86f7c810.pdf"

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, p0, v1, p1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final x(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->n:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->n:Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->k(Z)Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->n:Landroid/animation/ObjectAnimator;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    .line 23
    .line 24
    .line 25
    return-void
.end method
