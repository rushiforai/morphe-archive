.class public Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;
.super Landroid/widget/ImageView;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "AppCompatCustomView"
    }
.end annotation


# instance fields
.field public a:[I

.field public b:F

.field public c:F

.field public d:F

.field public e:F

.field public f:I

.field public g:Landroid/animation/ObjectAnimator;

.field public h:Landroid/animation/ObjectAnimator;

.field public i:Landroid/animation/AnimatorSet;

.field public j:Landroid/animation/AnimatorSet;

.field public k:Landroid/animation/AnimatorSet;

.field public l:Landroid/animation/AnimatorSet;

.field public m:Landroid/animation/AnimatorSet;

.field public n:Z

.field public o:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    filled-new-array {p1, p1}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->a:[I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->c:F

    .line 13
    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->e:F

    .line 15
    .line 16
    const/4 v0, -0x1

    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->f:I

    .line 18
    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->o:Z

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->b()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 26
    filled-new-array {p1, p1}, [I

    move-result-object p2

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->a:[I

    const/4 p2, 0x0

    .line 27
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->c:F

    .line 28
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->e:F

    const/4 p2, -0x1

    .line 29
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->f:I

    .line 30
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->o:Z

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->b()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 33
    filled-new-array {p1, p1}, [I

    move-result-object p2

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->a:[I

    const/4 p2, 0x0

    .line 34
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->c:F

    .line 35
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->e:F

    const/4 p2, -0x1

    .line 36
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->f:I

    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->o:Z

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->b()V

    return-void
.end method


# virtual methods
.method public final a(I)Landroid/animation/AnimatorSet;
    .locals 7

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    new-array v2, v1, [F

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    const/high16 v4, 0x3f800000    # 1.0f

    .line 11
    .line 12
    aput v4, v2, v3

    .line 13
    .line 14
    const-string v5, "scaleX"

    .line 15
    .line 16
    invoke-static {p0, v5, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    int-to-long v5, p1

    .line 21
    invoke-virtual {v2, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    new-array p1, v1, [F

    .line 25
    .line 26
    aput v4, p1, v3

    .line 27
    .line 28
    const-string v1, "scaleY"

    .line 29
    .line 30
    invoke-static {p0, v1, p1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 42
    .line 43
    .line 44
    return-object v0
.end method

.method public b()V
    .locals 5

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->a:[I

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->j:Landroid/animation/AnimatorSet;

    .line 17
    .line 18
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->i:Landroid/animation/AnimatorSet;

    .line 24
    .line 25
    const/4 v0, 0x2

    .line 26
    new-array v1, v0, [F

    .line 27
    .line 28
    fill-array-data v1, :array_0

    .line 29
    .line 30
    .line 31
    const-string v2, "Alpha"

    .line 32
    .line 33
    invoke-static {p0, v2, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->g:Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    const-wide/16 v3, 0x3e8

    .line 40
    .line 41
    invoke-virtual {v1, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->g:Landroid/animation/ObjectAnimator;

    .line 45
    .line 46
    invoke-virtual {v1, v3, v4}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->g:Landroid/animation/ObjectAnimator;

    .line 50
    .line 51
    invoke-virtual {v1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 52
    .line 53
    .line 54
    new-array v0, v0, [F

    .line 55
    .line 56
    fill-array-data v0, :array_1

    .line 57
    .line 58
    .line 59
    invoke-static {p0, v2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->h:Landroid/animation/ObjectAnimator;

    .line 64
    .line 65
    const-wide/16 v1, 0x0

    .line 66
    .line 67
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->c()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->d()V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->j:Landroid/animation/AnimatorSet;

    .line 77
    .line 78
    const/16 v1, 0xc8

    .line 79
    .line 80
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->a(I)Landroid/animation/AnimatorSet;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->m:Landroid/animation/AnimatorSet;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 91
    .line 92
    .line 93
    const/16 v0, 0x64

    .line 94
    .line 95
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->a(I)Landroid/animation/AnimatorSet;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->k:Landroid/animation/AnimatorSet;

    .line 100
    .line 101
    return-void

    .line 102
    nop

    .line 103
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final c()V
    .locals 6

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->l:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    new-array v1, v0, [F

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    const v3, 0x3f666666    # 0.9f

    .line 13
    .line 14
    .line 15
    aput v3, v1, v2

    .line 16
    .line 17
    const-string v4, "scaleX"

    .line 18
    .line 19
    invoke-static {p0, v4, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-wide/16 v4, 0x64

    .line 24
    .line 25
    invoke-virtual {v1, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    .line 28
    new-array v0, v0, [F

    .line 29
    .line 30
    aput v3, v0, v2

    .line 31
    .line 32
    const-string v2, "scaleY"

    .line 33
    .line 34
    invoke-static {p0, v2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->l:Landroid/animation/AnimatorSet;

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, v0}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final d()V
    .locals 6

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->m:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    new-array v1, v0, [F

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    const v3, 0x3f8ccccd    # 1.1f

    .line 13
    .line 14
    .line 15
    aput v3, v1, v2

    .line 16
    .line 17
    const-string v4, "scaleX"

    .line 18
    .line 19
    invoke-static {p0, v4, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-wide/16 v4, 0xc8

    .line 24
    .line 25
    invoke-virtual {v1, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    .line 28
    new-array v0, v0, [F

    .line 29
    .line 30
    aput v3, v0, v2

    .line 31
    .line 32
    const-string v2, "scaleY"

    .line 33
    .line 34
    invoke-static {p0, v2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->m:Landroid/animation/AnimatorSet;

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, v0}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final e()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->n:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->g:Landroid/animation/ObjectAnimator;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->n:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->h:Landroid/animation/ObjectAnimator;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->n:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->c:F

    .line 7
    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->b:F

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->a:[I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    aget p1, p1, v0

    .line 14
    .line 15
    int-to-float p1, p1

    .line 16
    invoke-virtual {p0, p1}, Landroid/view/View;->setX(F)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->a:[I

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    aget p1, p1, v0

    .line 23
    .line 24
    int-to-float p1, p1

    .line 25
    invoke-virtual {p0, p1}, Landroid/view/View;->setY(F)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->h:Landroid/animation/ObjectAnimator;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->j:Landroid/animation/AnimatorSet;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/lit16 v1, v0, 0xff

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-eqz v1, :cond_5

    .line 10
    .line 11
    const v4, 0xff00

    .line 12
    .line 13
    .line 14
    const/4 v5, -0x1

    .line 15
    if-eq v1, v2, :cond_3

    .line 16
    .line 17
    const/4 v6, 0x2

    .line 18
    if-eq v1, v6, :cond_2

    .line 19
    .line 20
    const/4 v6, 0x3

    .line 21
    if-eq v1, v6, :cond_1

    .line 22
    .line 23
    const/4 v6, 0x6

    .line 24
    if-eq v1, v6, :cond_0

    .line 25
    .line 26
    return v3

    .line 27
    :cond_0
    and-int/2addr v0, v4

    .line 28
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-ge v0, v1, :cond_8

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->f:I

    .line 39
    .line 40
    if-ne p1, v0, :cond_8

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->k:Landroid/animation/AnimatorSet;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->e()V

    .line 48
    .line 49
    .line 50
    iput v5, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->f:I

    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_1
    iput v5, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->f:I

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :cond_2
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->f:I

    .line 59
    .line 60
    if-eq v0, v5, :cond_8

    .line 61
    .line 62
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getX(I)F

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->d:F

    .line 71
    .line 72
    sub-float/2addr v0, v1

    .line 73
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->e:F

    .line 74
    .line 75
    sub-float/2addr p1, v1

    .line 76
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->b:F

    .line 77
    .line 78
    add-float/2addr v1, v0

    .line 79
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->b:F

    .line 80
    .line 81
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->c:F

    .line 82
    .line 83
    add-float/2addr v0, p1

    .line 84
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->c:F

    .line 85
    .line 86
    invoke-virtual {p0, v1}, Landroid/view/View;->setX(F)V

    .line 87
    .line 88
    .line 89
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->c:F

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Landroid/view/View;->setY(F)V

    .line 92
    .line 93
    .line 94
    goto/16 :goto_0

    .line 95
    .line 96
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->k:Landroid/animation/AnimatorSet;

    .line 97
    .line 98
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 99
    .line 100
    .line 101
    and-int/2addr v0, v4

    .line 102
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-ge v0, v1, :cond_8

    .line 107
    .line 108
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->f:I

    .line 113
    .line 114
    if-ne p1, v0, :cond_8

    .line 115
    .line 116
    invoke-virtual {p0}, Landroid/view/View;->getX()F

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->a:[I

    .line 121
    .line 122
    aget v0, v0, v3

    .line 123
    .line 124
    int-to-float v0, v0

    .line 125
    cmpl-float p1, p1, v0

    .line 126
    .line 127
    if-eqz p1, :cond_4

    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/view/View;->getY()F

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->a:[I

    .line 134
    .line 135
    aget v0, v0, v2

    .line 136
    .line 137
    int-to-float v0, v0

    .line 138
    cmpl-float p1, p1, v0

    .line 139
    .line 140
    if-eqz p1, :cond_4

    .line 141
    .line 142
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->e()V

    .line 143
    .line 144
    .line 145
    :cond_4
    iput v5, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->f:I

    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->i:Landroid/animation/AnimatorSet;

    .line 149
    .line 150
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 151
    .line 152
    .line 153
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->o:Z

    .line 154
    .line 155
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->l:Landroid/animation/AnimatorSet;

    .line 156
    .line 157
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->f:I

    .line 165
    .line 166
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->a:[I

    .line 167
    .line 168
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    aput v1, v0, v3

    .line 173
    .line 174
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->a:[I

    .line 175
    .line 176
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    aput v1, v0, v2

    .line 181
    .line 182
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getX(I)F

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->d:F

    .line 191
    .line 192
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->e:F

    .line 193
    .line 194
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->b:F

    .line 195
    .line 196
    const/4 v0, 0x0

    .line 197
    cmpl-float p1, p1, v0

    .line 198
    .line 199
    if-nez p1, :cond_6

    .line 200
    .line 201
    invoke-virtual {p0}, Landroid/view/View;->getX()F

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->b:F

    .line 206
    .line 207
    :cond_6
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->c:F

    .line 208
    .line 209
    cmpl-float p1, p1, v0

    .line 210
    .line 211
    if-nez p1, :cond_7

    .line 212
    .line 213
    invoke-virtual {p0}, Landroid/view/View;->getY()F

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->c:F

    .line 218
    .line 219
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->g:Landroid/animation/ObjectAnimator;

    .line 220
    .line 221
    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    .line 222
    .line 223
    .line 224
    :cond_8
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 225
    .line 226
    .line 227
    return v2
.end method

.method public onVisibilityChanged(Landroid/view/View;I)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/ProfileThinPopup_MovableImage;->j:Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 7
    .line 8
    .line 9
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
