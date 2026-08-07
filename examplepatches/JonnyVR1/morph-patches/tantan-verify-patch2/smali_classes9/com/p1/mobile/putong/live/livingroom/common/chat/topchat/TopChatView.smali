.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/n3j0;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

.field public e:Landroidx/cardview/widget/CardView;

.field public f:Landroid/view/View;

.field public g:Lv/VDraweeView;

.field public h:Lv/VDraweeView;

.field public i:Lv/VText;

.field public j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public k:Ll/n3j0;

.field public l:Landroid/animation/ObjectAnimator;

.field public m:Landroid/animation/AnimatorSet;

.field public n:Landroid/animation/ValueAnimator;

.field public o:I

.field public p:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->o:I

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->p:Z

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->o:I

    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->p:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->o:I

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->p:Z

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->s0()V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->u0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;JF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->y0(JF)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->z0(Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->v0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->t0(Ll/x20;)V

    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->w0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->B0(Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic B0(Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->k:Ll/n3j0;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/n3j0;->R3(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public D0(Ll/x20;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->m:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->m:Landroid/animation/AnimatorSet;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    new-array v2, v1, [F

    .line 16
    .line 17
    fill-array-data v2, :array_0

    .line 18
    .line 19
    .line 20
    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 21
    .line 22
    invoke-static {v0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

    .line 27
    .line 28
    const/high16 v3, 0x41f80000    # 31.0f

    .line 29
    .line 30
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    int-to-float v3, v3

    .line 35
    new-array v4, v1, [F

    .line 36
    .line 37
    const/4 v5, 0x0

    .line 38
    const/4 v6, 0x0

    .line 39
    aput v5, v4, v6

    .line 40
    .line 41
    const/4 v5, 0x1

    .line 42
    aput v3, v4, v5

    .line 43
    .line 44
    sget-object v3, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 45
    .line 46
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->m:Landroid/animation/AnimatorSet;

    .line 51
    .line 52
    new-array v1, v1, [Landroid/animation/Animator;

    .line 53
    .line 54
    aput-object v0, v1, v6

    .line 55
    .line 56
    aput-object v2, v1, v5

    .line 57
    .line 58
    invoke-virtual {v3, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->m:Landroid/animation/AnimatorSet;

    .line 62
    .line 63
    const-wide/16 v1, 0xfa

    .line 64
    .line 65
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 66
    .line 67
    .line 68
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->m:Landroid/animation/AnimatorSet;

    .line 69
    .line 70
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->m:Landroid/animation/AnimatorSet;

    .line 74
    .line 75
    new-instance v1, Ll/q3j0;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/q3j0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;)V

    .line 78
    .line 79
    .line 80
    new-instance v2, Ll/r3j0;

    .line 81
    .line 82
    invoke-direct {v2, p0, p1}, Ll/r3j0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;Ll/x20;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v0, v1, v2}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->m:Landroid/animation/AnimatorSet;

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    nop

    .line 95
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final E0(JF)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->n:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    new-array v0, v0, [F

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    aput p3, v0, v1

    .line 11
    .line 12
    const/4 p3, 0x0

    .line 13
    const/4 v1, 0x1

    .line 14
    aput p3, v0, v1

    .line 15
    .line 16
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->n:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    invoke-virtual {p3, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->n:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    new-instance p2, Landroid/view/animation/LinearInterpolator;

    .line 28
    .line 29
    invoke-direct {p2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->n:Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    new-instance p2, Ll/u3j0;

    .line 38
    .line 39
    invoke-direct {p2, p0}, Ll/u3j0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->n:Landroid/animation/ValueAnimator;

    .line 46
    .line 47
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView$a;

    .line 48
    .line 49
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->n:Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final G0(Ljava/lang/String;JF)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->l:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/animation/ObjectAnimator;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/animation/ObjectAnimator;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->l:Landroid/animation/ObjectAnimator;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

    .line 13
    .line 14
    const/high16 v1, 0x43960000    # 300.0f

    .line 15
    .line 16
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    neg-int v1, v1

    .line 21
    int-to-float v1, v1

    .line 22
    const/4 v2, 0x2

    .line 23
    new-array v2, v2, [F

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    aput v1, v2, v3

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    const/4 v3, 0x1

    .line 30
    aput v1, v2, v3

    .line 31
    .line 32
    sget-object v1, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 33
    .line 34
    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->l:Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    const-wide/16 v1, 0xfa

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->l:Landroid/animation/ObjectAnimator;

    .line 46
    .line 47
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 48
    .line 49
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->l:Landroid/animation/ObjectAnimator;

    .line 56
    .line 57
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->l:Landroid/animation/ObjectAnimator;

    .line 61
    .line 62
    new-instance v1, Ll/s3j0;

    .line 63
    .line 64
    invoke-direct {v1, p0, p1}, Ll/s3j0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    new-instance p1, Ll/t3j0;

    .line 68
    .line 69
    invoke-direct {p1, p0, p2, p3, p4}, Ll/t3j0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;JF)V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v1, p1}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->l:Landroid/animation/ObjectAnimator;

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public H0(Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;)V
    .locals 6

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->seqId:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->o:I

    .line 4
    .line 5
    if-le v0, v1, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->isInValidMessage()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->endTime:J

    .line 15
    .line 16
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->startTime:J

    .line 17
    .line 18
    sub-long v2, v0, v2

    .line 19
    .line 20
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->currentTime:J

    .line 21
    .line 22
    sub-long/2addr v0, v4

    .line 23
    long-to-float v4, v0

    .line 24
    long-to-float v2, v2

    .line 25
    div-float/2addr v4, v2

    .line 26
    iget-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->p:Z

    .line 27
    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    new-instance v0, Ll/o3j0;

    .line 31
    .line 32
    invoke-direct {v0, p0, p1}, Ll/o3j0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->D0(Ll/x20;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->seqId:I

    .line 40
    .line 41
    iput v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->o:I

    .line 42
    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->i:Lv/VText;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->content:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

    .line 51
    .line 52
    invoke-virtual {v2}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->h:Lv/VDraweeView;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->userImage:Ljava/lang/String;

    .line 58
    .line 59
    const-string v5, "context_livingAct"

    .line 60
    .line 61
    invoke-static {v5, v2, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->e:Landroidx/cardview/widget/CardView;

    .line 65
    .line 66
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->backgroundColor:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v3}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    invoke-virtual {v2, v3}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->f:Landroid/view/View;

    .line 76
    .line 77
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->maskColor:Ljava/lang/String;

    .line 78
    .line 79
    const/16 v5, 0xa

    .line 80
    .line 81
    invoke-static {v3, v5}, Ll/n3d0;->c(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 86
    .line 87
    .line 88
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

    .line 89
    .line 90
    new-instance v3, Ll/p3j0;

    .line 91
    .line 92
    invoke-direct {v3, p0, p1}, Ll/p3j0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;)V

    .line 93
    .line 94
    .line 95
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->cornerUrl:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p0, p1, v0, v1, v4}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->G0(Ljava/lang/String;JF)V

    .line 101
    .line 102
    .line 103
    :cond_2
    :goto_0
    return-void
.end method

.method public I0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->r0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/n3j0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->q0(Ll/n3j0;)V

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

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->p0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/w3j0;->a(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q0(Ll/n3j0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->k:Ll/n3j0;

    .line 2
    .line 3
    return-void
.end method

.method public final r0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->l:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->n:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->m:Landroid/animation/AnimatorSet;

    .line 12
    .line 13
    invoke-static {p0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic s0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->n:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-static {p0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic t0(Ll/x20;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->p:Z

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/bri0;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/bri0;-><init>(Ll/x20;)V

    .line 14
    .line 15
    .line 16
    const-wide/16 v1, 0x64

    .line 17
    .line 18
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

    .line 23
    .line 24
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic u0(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v0, 0x0

    .line 12
    cmpl-float v0, p1, v0

    .line 13
    .line 14
    if-ltz v0, :cond_0

    .line 15
    .line 16
    const/high16 v0, 0x3f800000    # 1.0f

    .line 17
    .line 18
    cmpg-float v0, p1, v0

    .line 19
    .line 20
    if-gtz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->e:Landroidx/cardview/widget/CardView;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    int-to-float v0, v0

    .line 29
    mul-float/2addr p1, v0

    .line 30
    float-to-int p1, p1

    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->f:Landroid/view/View;

    .line 32
    .line 33
    filled-new-array {p0}, [Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p1, p0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public final synthetic v0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p0, p1, v0, v1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->g(Ljava/lang/String;ILl/wo0;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic w0(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

    .line 8
    .line 9
    const/high16 v2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->p:Z

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->C0()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/v3j0;

    .line 26
    .line 27
    invoke-direct {v1, p0, p1}, Ll/v3j0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-wide/16 p0, 0x64

    .line 31
    .line 32
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic y0(JF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->E0(JF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z0(Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->H0(Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
