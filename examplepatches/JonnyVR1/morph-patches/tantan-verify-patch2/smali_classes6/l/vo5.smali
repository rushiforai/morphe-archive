.class public Ll/vo5;
.super Ll/oc1;
.source "SourceFile"


# static fields
.field public static final g:Ljava/lang/String; = "vo5"


# instance fields
.field public b:Ll/opg;

.field public c:Landroid/graphics/drawable/AnimationDrawable;

.field public d:Landroid/animation/AnimatorSet;

.field public e:Landroid/animation/ObjectAnimator;

.field public final f:Ll/ga1;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/oc1;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/vo5$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/vo5$a;-><init>(Ll/vo5;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/vo5;->f:Ll/ga1;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic e(Ll/vo5;)Landroid/graphics/drawable/AnimationDrawable;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vo5;->i()Landroid/graphics/drawable/AnimationDrawable;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic f(Ll/vo5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vo5;->l()V

    return-void
.end method

.method public static bridge synthetic g(Ll/vo5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vo5;->n()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/vo5;->m()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/vo5;->h()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/vo5;->k()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->i:Lv/VImage;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->j:Lv/VImage;

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ll/pf60;

    .line 26
    .line 27
    const-string v0, "finish"

    .line 28
    .line 29
    const-string v1, "button_operation"

    .line 30
    .line 31
    invoke-direct {p0, v1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    filled-new-array {p0}, [Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string v0, "e_recording_over_button"

    .line 39
    .line 40
    const-string v2, "p_moment_post"

    .line 41
    .line 42
    invoke-static {v0, v2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    new-instance p0, Ll/pf60;

    .line 46
    .line 47
    const-string v3, "delete"

    .line 48
    .line 49
    invoke-direct {p0, v1, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    filled-new-array {p0}, [Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {v0, v2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/lpg;->E()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object v0, Ll/vo5;->g:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/lpg;->j0()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget-object v1, Ll/vo5;->g:Ljava/lang/String;

    .line 33
    .line 34
    sget-object v2, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 35
    .line 36
    iget-object p0, p0, Ll/vo5;->f:Ll/ga1;

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2, p0}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vo5;->e:Landroid/animation/ObjectAnimator;

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
    iget-object p0, p0, Ll/vo5;->e:Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 12
    .line 13
    .line 14
    :cond_0
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
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->D1:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final h()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->e:Lv/VImage;

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    new-array v1, v1, [F

    .line 7
    .line 8
    fill-array-data v1, :array_0

    .line 9
    .line 10
    .line 11
    const-string v2, "alpha"

    .line 12
    .line 13
    invoke-static {v0, v2, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/vo5;->e:Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    const-wide/16 v1, 0xc8

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/vo5;->e:Landroid/animation/ObjectAnimator;

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/vo5;->e:Landroid/animation/ObjectAnimator;

    .line 30
    .line 31
    new-instance v1, Ll/vo5$c;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/vo5$c;-><init>(Ll/vo5;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/vo5;->e:Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final i()Landroid/graphics/drawable/AnimationDrawable;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vo5;->c:Landroid/graphics/drawable/AnimationDrawable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->e:Lv/VImage;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    .line 14
    .line 15
    iput-object v0, p0, Ll/vo5;->c:Landroid/graphics/drawable/AnimationDrawable;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/vo5;->c:Landroid/graphics/drawable/AnimationDrawable;

    .line 18
    .line 19
    return-object p0
.end method

.method public final j()Ll/opg;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vo5;->b:Ll/opg;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/vo5$b;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/vo5$b;-><init>(Ll/vo5;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/vo5;->b:Ll/opg;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/vo5;->b:Ll/opg;

    .line 13
    .line 14
    return-object p0
.end method

.method public final k()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/vo5;->d:Landroid/animation/AnimatorSet;

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
    const v5, 0x3f8ccccd    # 1.1f

    .line 21
    .line 22
    .line 23
    aput v5, v3, v1

    .line 24
    .line 25
    const-string v6, "scaleX"

    .line 26
    .line 27
    invoke-static {v0, v6, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v3, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 32
    .line 33
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->c:Landroid/view/View;

    .line 34
    .line 35
    invoke-virtual {v3}, Landroid/view/View;->getScaleY()F

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    new-array v7, v2, [F

    .line 40
    .line 41
    aput v6, v7, v4

    .line 42
    .line 43
    aput v5, v7, v1

    .line 44
    .line 45
    const-string v5, "scaleY"

    .line 46
    .line 47
    invoke-static {v3, v5, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    const-wide/16 v5, 0x1f4

    .line 52
    .line 53
    invoke-virtual {v0, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    .line 59
    new-instance v5, Landroid/animation/AnimatorSet;

    .line 60
    .line 61
    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    .line 62
    .line 63
    .line 64
    iput-object v5, p0, Ll/vo5;->d:Landroid/animation/AnimatorSet;

    .line 65
    .line 66
    new-array v2, v2, [Landroid/animation/Animator;

    .line 67
    .line 68
    aput-object v0, v2, v4

    .line 69
    .line 70
    aput-object v3, v2, v1

    .line 71
    .line 72
    invoke-virtual {v5, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 73
    .line 74
    .line 75
    :cond_0
    iget-object p0, p0, Ll/vo5;->d:Landroid/animation/AnimatorSet;

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final l()V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->k:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/lpg;->d0(Landroid/app/Activity;)Ll/lpg;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->q:Ll/tnw;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/tnw;->m()Ljava/io/File;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p0}, Ll/vo5;->j()Ll/opg;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, v1, p0}, Ll/lpg;->Z(Ljava/lang/String;Ll/npg;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catch_0
    move-exception p0

    .line 34
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final m()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->i:Lv/VImage;

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    new-array v2, v1, [F

    .line 7
    .line 8
    fill-array-data v2, :array_0

    .line 9
    .line 10
    .line 11
    const-string v3, "alpha"

    .line 12
    .line 13
    invoke-static {v0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->j:Lv/VImage;

    .line 20
    .line 21
    new-array v2, v1, [F

    .line 22
    .line 23
    fill-array-data v2, :array_1

    .line 24
    .line 25
    .line 26
    invoke-static {p0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-wide/16 v2, 0x1f4

    .line 31
    .line 32
    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 36
    .line 37
    .line 38
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 39
    .line 40
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 41
    .line 42
    .line 43
    new-array v1, v1, [Landroid/animation/Animator;

    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    aput-object v0, v1, v3

    .line 47
    .line 48
    const/4 v0, 0x1

    .line 49
    aput-object p0, v1, v0

    .line 50
    .line 51
    invoke-virtual {v2, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    nop

    .line 59
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 60
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final n()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/vo5;->i()Landroid/graphics/drawable/AnimationDrawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/vo5;->i()Landroid/graphics/drawable/AnimationDrawable;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/DrawableContainer;->selectDrawable(I)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method
