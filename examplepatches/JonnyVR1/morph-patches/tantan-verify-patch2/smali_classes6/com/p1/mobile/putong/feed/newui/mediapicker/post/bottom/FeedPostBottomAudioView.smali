.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->X:I

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->a:I

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    sget p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->X:I

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->a:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    sget p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->X:I

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->a:I

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->C(Z)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->B()V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->E()V

    return-void
.end method


# virtual methods
.method public final synthetic B()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic C(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic E()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->j()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->F()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setKeyboardHeight(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->a:I

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    const/high16 p1, 0x43a00000    # 320.0f

    .line 30
    .line 31
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    :goto_0
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public v(Z)V
    .locals 13

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->a:I

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move v1, v0

    .line 8
    :goto_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    move v2, v0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->a:I

    .line 13
    .line 14
    :goto_1
    if-eqz p1, :cond_2

    .line 15
    .line 16
    const-wide/16 v3, 0xc8

    .line 17
    .line 18
    :goto_2
    move-wide v9, v3

    .line 19
    goto :goto_3

    .line 20
    :cond_2
    const-wide/16 v3, 0x12c

    .line 21
    .line 22
    goto :goto_2

    .line 23
    :goto_3
    new-instance v11, Landroid/view/animation/LinearInterpolator;

    .line 24
    .line 25
    invoke-direct {v11}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 26
    .line 27
    .line 28
    int-to-float v1, v1

    .line 29
    int-to-float v2, v2

    .line 30
    const/4 v3, 0x2

    .line 31
    new-array v12, v3, [F

    .line 32
    .line 33
    aput v1, v12, v0

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    aput v2, v12, v0

    .line 37
    .line 38
    const-string v6, "translationY"

    .line 39
    .line 40
    const-wide/16 v7, 0x0

    .line 41
    .line 42
    move-object v5, p0

    .line 43
    invoke-static/range {v5 .. v12}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    new-instance v0, Ll/lth;

    .line 48
    .line 49
    invoke-direct {v0, v5}, Ll/lth;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p0, v0}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    new-instance v0, Ll/mth;

    .line 56
    .line 57
    invoke-direct {v0, v5, p1}, Ll/mth;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;Z)V

    .line 58
    .line 59
    .line 60
    invoke-static {p0, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public w()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->getCurrentRecordState()Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/AudioRecordState;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/AudioRecordState;->RECORDING:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/AudioRecordState;

    .line 16
    .line 17
    if-eq v0, v1, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->getCurrentRecordState()Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/AudioRecordState;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/AudioRecordState;->COMPLETING:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/AudioRecordState;

    .line 26
    .line 27
    if-ne v0, v1, :cond_1

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->F()V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/mxg;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->b:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    invoke-direct {v0, v1}, Ll/mxg;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->P0:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ll/mxg;->j(I)Ll/mxg;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->s3:I

    .line 48
    .line 49
    new-instance v2, Ll/nth;

    .line 50
    .line 51
    invoke-direct {v2, p0}, Ll/nth;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1, v2}, Ll/mxg;->i(ILjava/lang/Runnable;)Ll/mxg;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/mxg;->g(I)Ll/mxg;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ll/mxg;->show()V

    .line 65
    .line 66
    .line 67
    const/4 p0, 0x1

    .line 68
    return p0

    .line 69
    :cond_1
    const/4 p0, 0x0

    .line 70
    return p0
.end method

.method public z(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 13
    .line 14
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 15
    .line 16
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->a:I

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    const/high16 v0, 0x43a00000    # 320.0f

    .line 21
    .line 22
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    :cond_0
    const/4 v1, -0x1

    .line 27
    invoke-direct {p1, v1, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 28
    .line 29
    .line 30
    const/16 v0, 0x50

    .line 31
    .line 32
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 40
    .line 41
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView$a;

    .line 42
    .line 43
    invoke-direct {v0, p0, p2, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;Ll/y20;Ll/y20;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->setAudioRecordStateChangeListener(Ll/nc1;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomAudioView;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method
