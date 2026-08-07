.class public Ll/arc0;
.super Ll/oc1;
.source "SourceFile"


# instance fields
.field public b:Landroid/animation/AnimatorSet;

.field public c:Landroid/animation/AnimatorSet;

.field public d:Landroid/animation/ValueAnimator;

.field public e:Landroid/animation/AnimatorSet;

.field public f:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/oc1;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/arc0;->k()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/arc0;->j()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/arc0;->g()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/arc0;->i()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public b()V
    .locals 5

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->y:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/arc0;->f()V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ljava/text/DecimalFormat;

    .line 14
    .line 15
    const-string v1, "0.0"

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Ll/pf60;

    .line 21
    .line 22
    const-string v2, "recording_status"

    .line 23
    .line 24
    const-string v3, "over"

    .line 25
    .line 26
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/pf60;

    .line 30
    .line 31
    iget-object p0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 32
    .line 33
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->u:I

    .line 34
    .line 35
    int-to-long v3, p0

    .line 36
    invoke-virtual {v0, v3, v4}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string v0, "voice_duration"

    .line 41
    .line 42
    invoke-direct {v2, v0, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string v0, "e_voice_button"

    .line 50
    .line 51
    const-string v1, "p_moment_post"

    .line 52
    .line 53
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/arc0;->d:Landroid/animation/ValueAnimator;

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
    iget-object v0, p0, Ll/arc0;->d:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->d:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->setProgress(F)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/arc0;->b:Landroid/animation/AnimatorSet;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/arc0;->b:Landroid/animation/AnimatorSet;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Ll/arc0;->c:Landroid/animation/AnimatorSet;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p0, Ll/arc0;->c:Landroid/animation/AnimatorSet;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 46
    .line 47
    .line 48
    :cond_2
    invoke-virtual {p0}, Ll/arc0;->h()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/AudioRecordState;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->f:Lv/VText;

    .line 4
    .line 5
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->M1:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final e()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/AudioRecordState;->COMPLETING:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/AudioRecordState;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->k(Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/AudioRecordState;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 2
    .line 3
    iget v1, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->u:I

    .line 4
    .line 5
    int-to-float v1, v1

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->C(F)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->G()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/arc0;->e()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/AudioRecordState;->WAITING:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/AudioRecordState;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->k(Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/AudioRecordState;)V

    .line 24
    .line 25
    .line 26
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->I0:I

    .line 27
    .line 28
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->i()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final g()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/arc0;->b:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->c:Landroid/view/View;

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    new-array v2, v1, [F

    .line 11
    .line 12
    fill-array-data v2, :array_0

    .line 13
    .line 14
    .line 15
    const-string v3, "scaleX"

    .line 16
    .line 17
    invoke-static {v0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v2, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->c:Landroid/view/View;

    .line 24
    .line 25
    new-array v3, v1, [F

    .line 26
    .line 27
    fill-array-data v3, :array_1

    .line 28
    .line 29
    .line 30
    const-string v4, "scaleY"

    .line 31
    .line 32
    invoke-static {v2, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const-wide/16 v3, 0x1f4

    .line 37
    .line 38
    invoke-virtual {v0, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 42
    .line 43
    .line 44
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 45
    .line 46
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v3, p0, Ll/arc0;->b:Landroid/animation/AnimatorSet;

    .line 50
    .line 51
    new-array v1, v1, [Landroid/animation/Animator;

    .line 52
    .line 53
    const/4 v4, 0x0

    .line 54
    aput-object v0, v1, v4

    .line 55
    .line 56
    const/4 v0, 0x1

    .line 57
    aput-object v2, v1, v0

    .line 58
    .line 59
    invoke-virtual {v3, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    iget-object p0, p0, Ll/arc0;->b:Landroid/animation/AnimatorSet;

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    nop

    .line 69
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3ecccccd    # 0.4f
    .end array-data

    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3ecccccd    # 0.4f
    .end array-data
.end method

.method public final h()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/arc0;->e:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->a:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getScaleX()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x2

    .line 14
    new-array v3, v2, [F

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    aput v1, v3, v4

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    const/high16 v5, 0x3f800000    # 1.0f

    .line 21
    .line 22
    aput v5, v3, v1

    .line 23
    .line 24
    const-string v6, "scaleX"

    .line 25
    .line 26
    invoke-static {v0, v6, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v3, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 31
    .line 32
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->a:Landroid/view/View;

    .line 33
    .line 34
    invoke-virtual {v3}, Landroid/view/View;->getScaleY()F

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    new-array v7, v2, [F

    .line 39
    .line 40
    aput v6, v7, v4

    .line 41
    .line 42
    aput v5, v7, v1

    .line 43
    .line 44
    const-string v5, "scaleY"

    .line 45
    .line 46
    invoke-static {v3, v5, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    const-wide/16 v5, 0x1f4

    .line 51
    .line 52
    invoke-virtual {v0, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 56
    .line 57
    .line 58
    new-instance v5, Landroid/animation/AnimatorSet;

    .line 59
    .line 60
    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v5, p0, Ll/arc0;->e:Landroid/animation/AnimatorSet;

    .line 64
    .line 65
    new-array v2, v2, [Landroid/animation/Animator;

    .line 66
    .line 67
    aput-object v0, v2, v4

    .line 68
    .line 69
    aput-object v3, v2, v1

    .line 70
    .line 71
    invoke-virtual {v5, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    iget-object p0, p0, Ll/arc0;->e:Landroid/animation/AnimatorSet;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final i()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/arc0;->c:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->a:Landroid/view/View;

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    new-array v2, v1, [F

    .line 11
    .line 12
    fill-array-data v2, :array_0

    .line 13
    .line 14
    .line 15
    const-string v3, "scaleX"

    .line 16
    .line 17
    invoke-static {v0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v2, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->a:Landroid/view/View;

    .line 24
    .line 25
    new-array v1, v1, [F

    .line 26
    .line 27
    fill-array-data v1, :array_1

    .line 28
    .line 29
    .line 30
    const-string v3, "scaleY"

    .line 31
    .line 32
    invoke-static {v2, v3, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-wide/16 v2, 0x3e8

    .line 37
    .line 38
    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 42
    .line 43
    .line 44
    const/16 v2, 0x7d0

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 50
    .line 51
    .line 52
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 53
    .line 54
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object v2, p0, Ll/arc0;->c:Landroid/animation/AnimatorSet;

    .line 58
    .line 59
    const/4 v3, 0x2

    .line 60
    new-array v3, v3, [Landroid/animation/Animator;

    .line 61
    .line 62
    const/4 v4, 0x0

    .line 63
    aput-object v0, v3, v4

    .line 64
    .line 65
    const/4 v0, 0x1

    .line 66
    aput-object v1, v3, v0

    .line 67
    .line 68
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    iget-object p0, p0, Ll/arc0;->c:Landroid/animation/AnimatorSet;

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f8ccccd    # 1.1f
        0x3f800000    # 1.0f
    .end array-data

    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f8ccccd    # 1.1f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final j()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/arc0;->d:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->d:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;

    .line 8
    .line 9
    const-wide/32 v1, 0xea60

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->b(J)Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/arc0;->d:Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Ll/arc0;->d:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final k()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/arc0;->f:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->b:Landroid/view/View;

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    new-array v2, v1, [F

    .line 11
    .line 12
    fill-array-data v2, :array_0

    .line 13
    .line 14
    .line 15
    const-string v3, "scaleX"

    .line 16
    .line 17
    invoke-static {v0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v2, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->b:Landroid/view/View;

    .line 24
    .line 25
    new-array v3, v1, [F

    .line 26
    .line 27
    fill-array-data v3, :array_1

    .line 28
    .line 29
    .line 30
    const-string v4, "scaleY"

    .line 31
    .line 32
    invoke-static {v2, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const-wide/16 v3, 0x12c

    .line 37
    .line 38
    invoke-virtual {v0, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 42
    .line 43
    .line 44
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 45
    .line 46
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v3, p0, Ll/arc0;->f:Landroid/animation/AnimatorSet;

    .line 50
    .line 51
    new-array v1, v1, [Landroid/animation/Animator;

    .line 52
    .line 53
    const/4 v4, 0x0

    .line 54
    aput-object v0, v1, v4

    .line 55
    .line 56
    const/4 v0, 0x1

    .line 57
    aput-object v2, v1, v0

    .line 58
    .line 59
    invoke-virtual {v3, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    iget-object p0, p0, Ll/arc0;->f:Landroid/animation/AnimatorSet;

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    nop

    .line 69
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f8ccccd    # 1.1f
    .end array-data

    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f8ccccd    # 1.1f
    .end array-data
.end method
