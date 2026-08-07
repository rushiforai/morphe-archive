.class public Ll/s9g0;
.super Lcom/p1/mobile/android/app/Act$w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/android/app/Act$w<",
        "Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;",
        "Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;",
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
    check-cast p1, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/s9g0;->i(Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;)Landroid/animation/Animator;

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
    check-cast p1, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/s9g0;->j(Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public i(Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;)Landroid/animation/Animator;
    .locals 4

    .line 1
    iget-object p0, p2, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->c:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object v0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 8
    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Landroid/view/ViewGroup;

    .line 29
    .line 30
    invoke-interface {p0, p1}, Lv/a$b;->l(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    sget-object p1, Ll/gt0;->k:Landroid/util/Property;

    .line 41
    .line 42
    const/16 v0, 0xff

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    filled-new-array {v1, v0}, [I

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {p2, p1, v0}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-wide/16 v2, 0x90

    .line 54
    .line 55
    invoke-virtual {p1, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const/4 p2, 0x2

    .line 60
    new-array p2, p2, [Landroid/animation/Animator;

    .line 61
    .line 62
    aput-object p0, p2, v1

    .line 63
    .line 64
    const/4 p0, 0x1

    .line 65
    aput-object p1, p2, p0

    .line 66
    .line 67
    invoke-static {p2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0

    .line 72
    :cond_2
    return-object v0
.end method

.method public j(Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;)Landroid/animation/Animator;
    .locals 9

    .line 1
    iget-object p0, p2, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->c:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object v0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 8
    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Landroid/view/ViewGroup;

    .line 29
    .line 30
    invoke-interface {p0, p1}, Lv/a$b;->n(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    sget-object v2, Ll/gt0;->k:Landroid/util/Property;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Ll/oce;->d(Landroid/graphics/drawable/Drawable;)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    const/4 p2, 0x0

    .line 51
    filled-new-array {p1, p2}, [I

    .line 52
    .line 53
    .line 54
    move-result-object v8

    .line 55
    const-wide/16 v3, 0x24

    .line 56
    .line 57
    const-wide/16 v5, 0x90

    .line 58
    .line 59
    const/4 v7, 0x0

    .line 60
    invoke-static/range {v1 .. v8}, Ll/gt0;->m(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[I)Landroid/animation/Animator;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const/4 v0, 0x2

    .line 65
    new-array v0, v0, [Landroid/animation/Animator;

    .line 66
    .line 67
    aput-object p0, v0, p2

    .line 68
    .line 69
    const/4 p0, 0x1

    .line 70
    aput-object p1, v0, p0

    .line 71
    .line 72
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0

    .line 77
    :cond_2
    return-object v0
.end method
