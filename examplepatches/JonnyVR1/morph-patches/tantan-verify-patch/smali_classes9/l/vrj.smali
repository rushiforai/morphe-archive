.class public Ll/vrj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/vrj$c;
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

.field public b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public c:Landroid/animation/AnimatorSet;

.field public d:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vrj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic a(Ll/vrj;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vrj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/vrj;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vrj;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    return-object p0
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vrj;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    return-void
.end method

.method public final d()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vrj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Ll/vrj;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public e()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vrj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/vrj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/vrj;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/vrj;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public f(Ll/vrj$c;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/vrj;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/vrj;->d:Landroid/animation/AnimatorSet;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/vrj;->d:Landroid/animation/AnimatorSet;

    .line 18
    .line 19
    iget-object v0, p0, Ll/vrj;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 20
    .line 21
    sget-object v1, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 22
    .line 23
    invoke-static {}, Ll/bnl0;->y0()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    int-to-float v2, v2

    .line 28
    const/4 v3, 0x2

    .line 29
    new-array v4, v3, [F

    .line 30
    .line 31
    const/4 v5, 0x0

    .line 32
    const/4 v6, 0x0

    .line 33
    aput v6, v4, v5

    .line 34
    .line 35
    const/4 v7, 0x1

    .line 36
    aput v2, v4, v7

    .line 37
    .line 38
    invoke-static {v0, v1, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v2, p0, Ll/vrj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 43
    .line 44
    invoke-static {}, Ll/bnl0;->y0()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    neg-int v4, v4

    .line 49
    int-to-float v4, v4

    .line 50
    new-array v8, v3, [F

    .line 51
    .line 52
    aput v4, v8, v5

    .line 53
    .line 54
    aput v6, v8, v7

    .line 55
    .line 56
    invoke-static {v2, v1, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object v2, p0, Ll/vrj;->d:Landroid/animation/AnimatorSet;

    .line 61
    .line 62
    new-array v3, v3, [Landroid/animation/Animator;

    .line 63
    .line 64
    aput-object v0, v3, v5

    .line 65
    .line 66
    aput-object v1, v3, v7

    .line 67
    .line 68
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/vrj;->d:Landroid/animation/AnimatorSet;

    .line 72
    .line 73
    const-wide/16 v1, 0x12c

    .line 74
    .line 75
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/vrj;->d:Landroid/animation/AnimatorSet;

    .line 79
    .line 80
    new-instance v1, Ll/vrj$b;

    .line 81
    .line 82
    invoke-direct {v1, p0, p1}, Ll/vrj$b;-><init>(Ll/vrj;Ll/vrj$c;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 86
    .line 87
    .line 88
    :cond_1
    iget-object p0, p0, Ll/vrj;->d:Landroid/animation/AnimatorSet;

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public g(Ll/vrj$c;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/vrj;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/vrj;->c:Landroid/animation/AnimatorSet;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/vrj;->c:Landroid/animation/AnimatorSet;

    .line 18
    .line 19
    iget-object v0, p0, Ll/vrj;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 20
    .line 21
    sget-object v1, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 22
    .line 23
    invoke-static {}, Ll/bnl0;->y0()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    int-to-float v2, v2

    .line 28
    const/4 v3, 0x2

    .line 29
    new-array v4, v3, [F

    .line 30
    .line 31
    const/4 v5, 0x0

    .line 32
    aput v2, v4, v5

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    const/4 v6, 0x0

    .line 36
    aput v6, v4, v2

    .line 37
    .line 38
    invoke-static {v0, v1, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v4, p0, Ll/vrj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 43
    .line 44
    invoke-static {}, Ll/bnl0;->y0()I

    .line 45
    .line 46
    .line 47
    move-result v7

    .line 48
    neg-int v7, v7

    .line 49
    int-to-float v7, v7

    .line 50
    new-array v8, v3, [F

    .line 51
    .line 52
    aput v6, v8, v5

    .line 53
    .line 54
    aput v7, v8, v2

    .line 55
    .line 56
    invoke-static {v4, v1, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object v4, p0, Ll/vrj;->c:Landroid/animation/AnimatorSet;

    .line 61
    .line 62
    new-array v3, v3, [Landroid/animation/Animator;

    .line 63
    .line 64
    aput-object v0, v3, v5

    .line 65
    .line 66
    aput-object v1, v3, v2

    .line 67
    .line 68
    invoke-virtual {v4, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/vrj;->c:Landroid/animation/AnimatorSet;

    .line 72
    .line 73
    const-wide/16 v1, 0x12c

    .line 74
    .line 75
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/vrj;->c:Landroid/animation/AnimatorSet;

    .line 79
    .line 80
    new-instance v1, Ll/vrj$a;

    .line 81
    .line 82
    invoke-direct {v1, p0, p1}, Ll/vrj$a;-><init>(Ll/vrj;Ll/vrj$c;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 86
    .line 87
    .line 88
    :cond_1
    iget-object p0, p0, Ll/vrj;->c:Landroid/animation/AnimatorSet;

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 91
    .line 92
    .line 93
    return-void
.end method
