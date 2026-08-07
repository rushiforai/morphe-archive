.class public Ll/n900;
.super Lcom/p1/mobile/android/app/Act$w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/android/app/Act$w<",
        "Lcom/p1/mobile/android/app/Act;",
        "Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act$w;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic c(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/n900;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic d(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/n900;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)Landroid/animation/Animator;
    .locals 4

    .line 1
    iget-object p0, p2, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->d:Lv/VPager;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    sget v1, Ll/adc0;->z9:I

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lv/a$b;

    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Landroid/view/ViewGroup;

    .line 38
    .line 39
    invoke-interface {p0, p1}, Lv/a$b;->l(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    sget-object p1, Ll/gt0;->k:Landroid/util/Property;

    .line 50
    .line 51
    const/16 v0, 0xff

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    filled-new-array {v1, v0}, [I

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {p2, p1, v0}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-wide/16 v2, 0x90

    .line 63
    .line 64
    invoke-virtual {p1, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const/4 p2, 0x2

    .line 69
    new-array p2, p2, [Landroid/animation/Animator;

    .line 70
    .line 71
    aput-object p0, p2, v1

    .line 72
    .line 73
    const/4 p0, 0x1

    .line 74
    aput-object p1, p2, p0

    .line 75
    .line 76
    invoke-static {p2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0

    .line 81
    :cond_1
    return-object v0
.end method

.method public j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)Landroid/animation/Animator;
    .locals 9

    .line 1
    iget-object p0, p2, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->d:Lv/VPager;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p0, :cond_2

    .line 11
    .line 12
    instance-of v1, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget v1, Ll/adc0;->z9:I

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lv/a$b;

    .line 24
    .line 25
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Landroid/view/ViewGroup;

    .line 42
    .line 43
    invoke-interface {p0, p1}, Lv/a$b;->n(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_2

    .line 52
    .line 53
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    if-nez p1, :cond_1

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_1
    sget-object v2, Ll/gt0;->k:Landroid/util/Property;

    .line 61
    .line 62
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {p1}, Ll/oce;->d(Landroid/graphics/drawable/Drawable;)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    const/4 p2, 0x0

    .line 71
    filled-new-array {p1, p2}, [I

    .line 72
    .line 73
    .line 74
    move-result-object v8

    .line 75
    const-wide/16 v3, 0x24

    .line 76
    .line 77
    const-wide/16 v5, 0x90

    .line 78
    .line 79
    const/4 v7, 0x0

    .line 80
    invoke-static/range {v1 .. v8}, Ll/gt0;->m(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[I)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    const/4 v0, 0x2

    .line 85
    new-array v0, v0, [Landroid/animation/Animator;

    .line 86
    .line 87
    aput-object p0, v0, p2

    .line 88
    .line 89
    const/4 p0, 0x1

    .line 90
    aput-object p1, v0, p0

    .line 91
    .line 92
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0

    .line 97
    :cond_2
    :goto_0
    return-object v0
.end method
