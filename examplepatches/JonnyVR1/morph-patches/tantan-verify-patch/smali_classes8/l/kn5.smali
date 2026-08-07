.class public Ll/kn5;
.super Lcom/p1/mobile/android/app/Act$w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/android/app/Act$w<",
        "Lcom/p1/mobile/putong/app/PutongAct;",
        "Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;",
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
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/kn5;->i(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;)Landroid/animation/Animator;

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
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/kn5;->j(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public i(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;)Landroid/animation/Animator;
    .locals 4

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->f:Ll/jl5;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jl5;->b:Lv/VPager;

    .line 4
    .line 5
    iget-object v1, p2, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->g:Ll/il5;

    .line 6
    .line 7
    iget v1, v1, Ll/il5;->c:I

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    return-object v1

    .line 21
    :cond_0
    sget v2, Ll/adc0;->z9:I

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lv/a$b;

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    return-object v1

    .line 32
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Landroid/view/ViewGroup;

    .line 49
    .line 50
    invoke-interface {v0, p1}, Lv/a$b;->l(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    sget-object v0, Ll/gt0;->k:Landroid/util/Property;

    .line 61
    .line 62
    const/16 v1, 0xff

    .line 63
    .line 64
    const/4 v3, 0x0

    .line 65
    filled-new-array {v3, v1}, [I

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {v2, v0, v1}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const-wide/16 v1, 0x90

    .line 74
    .line 75
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const/4 v1, 0x2

    .line 80
    new-array v1, v1, [Landroid/animation/Animator;

    .line 81
    .line 82
    aput-object p1, v1, v3

    .line 83
    .line 84
    const/4 p1, 0x1

    .line 85
    aput-object v0, v1, p1

    .line 86
    .line 87
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    new-instance v0, Ll/kn5$a;

    .line 92
    .line 93
    invoke-direct {v0, p0, p2}, Ll/kn5$a;-><init>(Ll/kn5;Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 97
    .line 98
    .line 99
    return-object p1

    .line 100
    :cond_2
    return-object v1
.end method

.method public j(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;)Landroid/animation/Animator;
    .locals 9

    .line 1
    iget-object p0, p2, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->f:Ll/jl5;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jl5;->b:Lv/VPager;

    .line 4
    .line 5
    iget-object v0, p2, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->g:Ll/il5;

    .line 6
    .line 7
    iget v0, v0, Ll/il5;->c:I

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v0, 0x0

    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_0
    sget v1, Ll/adc0;->z9:I

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lv/a$b;

    .line 28
    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    return-object v0

    .line 32
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Landroid/view/ViewGroup;

    .line 49
    .line 50
    invoke-interface {p0, p1}, Lv/a$b;->n(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-eqz p2, :cond_2

    .line 63
    .line 64
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    if-eqz p2, :cond_2

    .line 69
    .line 70
    sget-object v2, Ll/gt0;->k:Landroid/util/Property;

    .line 71
    .line 72
    invoke-static {p1}, Ll/oce;->d(Landroid/graphics/drawable/Drawable;)I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    const/4 p2, 0x0

    .line 77
    filled-new-array {p1, p2}, [I

    .line 78
    .line 79
    .line 80
    move-result-object v8

    .line 81
    const-wide/16 v3, 0x24

    .line 82
    .line 83
    const-wide/16 v5, 0x90

    .line 84
    .line 85
    const/4 v7, 0x0

    .line 86
    invoke-static/range {v1 .. v8}, Ll/gt0;->m(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[I)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    const/4 v0, 0x2

    .line 91
    new-array v0, v0, [Landroid/animation/Animator;

    .line 92
    .line 93
    aput-object p0, v0, p2

    .line 94
    .line 95
    const/4 p0, 0x1

    .line 96
    aput-object p1, v0, p0

    .line 97
    .line 98
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0

    .line 103
    :cond_2
    return-object v0
.end method
