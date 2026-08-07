.class public Ll/pdi;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile F:Ll/pdi;


# instance fields
.field public A:I

.field public B:I

.field public final C:Ljava/lang/Runnable;

.field public final D:Landroid/view/animation/Interpolator;

.field public E:F

.field public a:Lv/VRelative;

.field public b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

.field public c:Landroid/view/View;

.field public d:Lcom/tantan/library/svga/SVGAnimationView;

.field public e:Lv/VText;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public h:Lv/VText;

.field public i:Lv/VDraweeView;

.field public j:Lv/VDraweeView;

.field public k:Lv/VDraweeView;

.field public l:Lcom/tantan/library/svga/SVGAnimationView;

.field public m:Lcom/p1/mobile/android/app/Act;

.field public n:Lcom/p1/mobile/putong/data/User;

.field public o:Landroid/widget/PopupWindow;

.field public final p:I

.field public final q:I

.field public r:F

.field public s:F

.field public final t:F

.field public u:F

.field public v:F

.field public w:Z

.field public x:Ll/l4g0;

.field public y:Z

.field public z:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/qa00;->d:I

    .line 5
    .line 6
    mul-int/lit8 v0, v0, 0x2

    .line 7
    .line 8
    iput v0, p0, Ll/pdi;->p:I

    .line 9
    .line 10
    sget v0, Ll/qa00;->c:I

    .line 11
    .line 12
    mul-int/lit8 v0, v0, 0x2

    .line 13
    .line 14
    iput v0, p0, Ll/pdi;->q:I

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput v0, p0, Ll/pdi;->r:F

    .line 18
    .line 19
    iput v0, p0, Ll/pdi;->s:F

    .line 20
    .line 21
    const/high16 v1, 0x43480000    # 200.0f

    .line 22
    .line 23
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    int-to-float v1, v1

    .line 28
    iput v1, p0, Ll/pdi;->t:F

    .line 29
    .line 30
    iput v0, p0, Ll/pdi;->u:F

    .line 31
    .line 32
    iput v0, p0, Ll/pdi;->v:F

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    iput-boolean v1, p0, Ll/pdi;->w:Z

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    iput-boolean v1, p0, Ll/pdi;->y:Z

    .line 39
    .line 40
    const-string v2, ""

    .line 41
    .line 42
    iput-object v2, p0, Ll/pdi;->z:Ljava/lang/String;

    .line 43
    .line 44
    iput v1, p0, Ll/pdi;->A:I

    .line 45
    .line 46
    iput v1, p0, Ll/pdi;->B:I

    .line 47
    .line 48
    new-instance v1, Ll/mdi;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/mdi;-><init>(Ll/pdi;)V

    .line 51
    .line 52
    .line 53
    iput-object v1, p0, Ll/pdi;->C:Ljava/lang/Runnable;

    .line 54
    .line 55
    new-instance v1, Landroid/view/animation/PathInterpolator;

    .line 56
    .line 57
    const v2, 0x3f333333    # 0.7f

    .line 58
    .line 59
    .line 60
    const/high16 v3, 0x3f800000    # 1.0f

    .line 61
    .line 62
    const v4, 0x3e2e147b    # 0.17f

    .line 63
    .line 64
    .line 65
    invoke-direct {v1, v4, v4, v2, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 66
    .line 67
    .line 68
    iput-object v1, p0, Ll/pdi;->D:Landroid/view/animation/Interpolator;

    .line 69
    .line 70
    iput v0, p0, Ll/pdi;->E:F

    .line 71
    .line 72
    return-void
.end method

.method public static G()Lcom/p1/mobile/android/app/Act;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-object v1, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    instance-of v1, v1, Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    return-object v0

    .line 50
    :cond_0
    const/4 v0, 0x0

    .line 51
    return-object v0
.end method

.method public static synthetic a(Ll/pdi;ILcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/pdi;->X(ILcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Ll/pdi;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pdi;->J(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static b0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, p3, v0}, Ll/pdi;->c0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static c0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Z)V
    .locals 6

    .line 1
    new-instance v0, Ll/rci;

    .line 2
    .line 3
    move-object v5, p0

    .line 4
    move-object v1, p1

    .line 5
    move v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move v2, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/rci;-><init>(Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v5, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic d(Ll/pdi;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pdi;->R(Ljava/lang/Float;)V

    return-void
.end method

.method public static d0(Ljava/lang/String;Z)V
    .locals 3

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/pdi;->G()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 22
    .line 23
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    new-instance v2, Ll/cdi;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Ll/cdi;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance v1, Ll/hdi;

    .line 41
    .line 42
    invoke-direct {v1, v0, p1}, Ll/hdi;-><init>(Lcom/p1/mobile/android/app/Act;Z)V

    .line 43
    .line 44
    .line 45
    new-instance p1, Ll/idi;

    .line 46
    .line 47
    invoke-direct {p1}, Ll/idi;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static synthetic e(Ll/pdi;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pdi;->W()V

    return-void
.end method

.method public static synthetic f(Ll/pdi;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pdi;->T(Ljava/lang/Float;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    sget-object v0, Ll/pdi;->F:Ll/pdi;

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    new-instance v0, Ll/pdi;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/pdi;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/pdi;->F:Ll/pdi;

    .line 14
    .line 15
    :cond_1
    sget-object v0, Ll/pdi;->F:Ll/pdi;

    .line 16
    .line 17
    iput-boolean p1, v0, Ll/pdi;->w:Z

    .line 18
    .line 19
    sget-object p1, Ll/pdi;->F:Ll/pdi;

    .line 20
    .line 21
    iput-boolean p2, p1, Ll/pdi;->y:Z

    .line 22
    .line 23
    sget-object p1, Ll/pdi;->F:Ll/pdi;

    .line 24
    .line 25
    iput-object p3, p1, Ll/pdi;->z:Ljava/lang/String;

    .line 26
    .line 27
    sget-object p1, Ll/pdi;->F:Ll/pdi;

    .line 28
    .line 29
    iget-object p1, p1, Ll/pdi;->o:Landroid/widget/PopupWindow;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_3

    .line 36
    .line 37
    sget-object p1, Ll/pdi;->F:Ll/pdi;

    .line 38
    .line 39
    iget-object p1, p1, Ll/pdi;->o:Landroid/widget/PopupWindow;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_3

    .line 46
    .line 47
    sget-object p1, Ll/pdi;->F:Ll/pdi;

    .line 48
    .line 49
    iget-object p1, p1, Ll/pdi;->n:Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_2

    .line 56
    .line 57
    iget-object p1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 58
    .line 59
    sget-object p2, Ll/pdi;->F:Ll/pdi;

    .line 60
    .line 61
    iget-object p2, p2, Ll/pdi;->n:Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_2

    .line 70
    .line 71
    :goto_0
    return-void

    .line 72
    :cond_2
    sget-object p1, Ll/pdi;->F:Ll/pdi;

    .line 73
    .line 74
    invoke-virtual {p1, p4, p0}, Ll/pdi;->z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_3
    sget-object p1, Ll/pdi;->F:Ll/pdi;

    .line 79
    .line 80
    invoke-virtual {p1, p4, p0}, Ll/pdi;->a0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public static synthetic h(Ll/pdi;FLandroid/view/animation/Interpolator;FLjava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/pdi;->K(FLandroid/view/animation/Interpolator;FLjava/lang/Float;)V

    return-void
.end method

.method public static synthetic i(Ll/pdi;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pdi;->S(Ljava/lang/Float;)V

    return-void
.end method

.method public static synthetic j(Ll/pdi;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pdi;->y()V

    return-void
.end method

.method public static synthetic k(Ljava/lang/String;Ll/uxj0;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic l(Ll/pdi;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pdi;->Q(Ljava/lang/Float;)V

    return-void
.end method

.method public static synthetic m(Ll/pdi;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pdi;->U(Ljava/lang/Float;)V

    return-void
.end method

.method public static synthetic n(Ll/pdi;ILandroid/view/animation/Interpolator;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/pdi;->N(ILandroid/view/animation/Interpolator;Ljava/lang/Float;)V

    return-void
.end method

.method public static synthetic o()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p(Ll/pdi;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pdi;->Y()V

    return-void
.end method

.method public static synthetic q(Ll/pdi;ILandroid/view/animation/Interpolator;ILjava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/pdi;->P(ILandroid/view/animation/Interpolator;ILjava/lang/Float;)V

    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 13
    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    instance-of v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    move-object v0, p0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->k6()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const-string v0, ""

    .line 31
    .line 32
    invoke-static {p0, p2, p1, v0}, Ll/pdi;->b0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    :goto_0
    return-void
.end method

.method public static synthetic s(Ll/pdi;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pdi;->L(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic t(Ll/pdi;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pdi;->M()V

    return-void
.end method

.method public static synthetic u(Ll/pdi;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pdi;->O()V

    return-void
.end method

.method public static synthetic v()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic w(Ll/pdi;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/pdi;->V(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pdi;->m:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v1, Ll/tci;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/tci;-><init>(Ll/pdi;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final B()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/pdi;->m:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wgx;->B(Lcom/p1/mobile/android/app/Act;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sget v1, Ll/qa00;->O:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    sget v1, Ll/qa00;->j:I

    .line 11
    .line 12
    add-int/2addr v0, v1

    .line 13
    new-instance v1, Landroid/view/animation/PathInterpolator;

    .line 14
    .line 15
    const v2, 0x3f19999a    # 0.6f

    .line 16
    .line 17
    .line 18
    const v3, 0x3f11eb85    # 0.57f

    .line 19
    .line 20
    .line 21
    const v4, 0x3e851eb8    # 0.26f

    .line 22
    .line 23
    .line 24
    const/4 v5, 0x0

    .line 25
    invoke-direct {v1, v4, v5, v2, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/dj30;->l()Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget v2, v2, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->female_exit_time:I

    .line 33
    .line 34
    div-int/lit8 v2, v2, 0x2

    .line 35
    .line 36
    new-instance v3, Ll/uci;

    .line 37
    .line 38
    invoke-direct {v3, p0, v0, v1}, Ll/uci;-><init>(Ll/pdi;ILandroid/view/animation/Interpolator;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/vci;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/vci;-><init>(Ll/pdi;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v2, v3, v0}, Ll/dj30;->k(ILl/y20;Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final C()V
    .locals 6

    .line 1
    invoke-static {}, Ll/dj30;->l()Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->female_enter_time:I

    .line 6
    .line 7
    iget-object v1, p0, Ll/pdi;->m:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {}, Ll/gra;->z()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    const-string v2, "https://auto.tancdn.com/v1/raw/24c3c444-03a1-4520-acd3-043962688f0714.svga"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string v2, "core_female_match_success_heart_bg.svga"

    .line 23
    .line 24
    :goto_0
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x1

    .line 29
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->isCacheable(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const/4 v2, -0x1

    .line 38
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-object v2, p0, Ll/pdi;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/pdi;->m:Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    new-instance v2, Ll/yci;

    .line 50
    .line 51
    invoke-direct {v2, p0}, Ll/yci;-><init>(Ll/pdi;)V

    .line 52
    .line 53
    .line 54
    add-int/lit16 v3, v0, -0xc8

    .line 55
    .line 56
    int-to-long v3, v3

    .line 57
    invoke-static {v1, v2, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 58
    .line 59
    .line 60
    new-instance v1, Landroid/view/animation/PathInterpolator;

    .line 61
    .line 62
    const v2, 0x3f1c28f6    # 0.61f

    .line 63
    .line 64
    .line 65
    const v3, 0x3f75c28f    # 0.96f

    .line 66
    .line 67
    .line 68
    const v4, 0x3eae147b    # 0.34f

    .line 69
    .line 70
    .line 71
    const v5, 0x3fcccccd    # 1.6f

    .line 72
    .line 73
    .line 74
    invoke-direct {v1, v4, v5, v2, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 75
    .line 76
    .line 77
    sget v2, Ll/qa00;->v:I

    .line 78
    .line 79
    iget-object v3, p0, Ll/pdi;->m:Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    invoke-static {v3}, Ll/wgx;->B(Lcom/p1/mobile/android/app/Act;)I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    sget v4, Ll/qa00;->O:I

    .line 86
    .line 87
    add-int/2addr v3, v4

    .line 88
    sget v4, Ll/qa00;->j:I

    .line 89
    .line 90
    add-int/2addr v3, v4

    .line 91
    new-instance v4, Ll/zci;

    .line 92
    .line 93
    invoke-direct {v4, p0, v3, v1, v2}, Ll/zci;-><init>(Ll/pdi;ILandroid/view/animation/Interpolator;I)V

    .line 94
    .line 95
    .line 96
    new-instance v1, Ll/adi;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/adi;-><init>(Ll/pdi;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v0, v4, v1}, Ll/dj30;->k(ILl/y20;Ljava/lang/Runnable;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final D()V
    .locals 5

    .line 1
    const/high16 v0, 0x43480000    # 200.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    iget-object v1, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 15
    .line 16
    iget v2, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 17
    .line 18
    int-to-float v2, v2

    .line 19
    iget v3, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 20
    .line 21
    int-to-float v3, v3

    .line 22
    const/high16 v4, 0x40000000    # 2.0f

    .line 23
    .line 24
    div-float/2addr v3, v4

    .line 25
    add-float/2addr v2, v3

    .line 26
    iget-object v3, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 27
    .line 28
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    int-to-float v3, v3

    .line 33
    div-float/2addr v3, v4

    .line 34
    sub-float/2addr v2, v3

    .line 35
    sub-float/2addr v0, v2

    .line 36
    iput v0, p0, Ll/pdi;->r:F

    .line 37
    .line 38
    iget-object v0, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    int-to-float v0, v0

    .line 45
    div-float/2addr v0, v4

    .line 46
    iget v2, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 47
    .line 48
    int-to-float v2, v2

    .line 49
    div-float/2addr v2, v4

    .line 50
    iget v3, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 51
    .line 52
    int-to-float v3, v3

    .line 53
    add-float/2addr v2, v3

    .line 54
    sub-float/2addr v0, v2

    .line 55
    iput v0, p0, Ll/pdi;->s:F

    .line 56
    .line 57
    iget v0, p0, Ll/pdi;->B:I

    .line 58
    .line 59
    iget v2, p0, Ll/pdi;->A:I

    .line 60
    .line 61
    sub-int/2addr v0, v2

    .line 62
    int-to-float v0, v0

    .line 63
    iget v2, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 64
    .line 65
    int-to-float v2, v2

    .line 66
    div-float/2addr v2, v4

    .line 67
    sub-float/2addr v0, v2

    .line 68
    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 69
    .line 70
    int-to-float v1, v1

    .line 71
    sub-float/2addr v0, v1

    .line 72
    iget v1, p0, Ll/pdi;->r:F

    .line 73
    .line 74
    sub-float/2addr v0, v1

    .line 75
    iget-object v1, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 76
    .line 77
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    int-to-float v1, v1

    .line 82
    div-float/2addr v1, v4

    .line 83
    add-float/2addr v0, v1

    .line 84
    iput v0, p0, Ll/pdi;->u:F

    .line 85
    .line 86
    invoke-static {}, Ll/dj30;->l()Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget v0, v0, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->female_exit_time:I

    .line 91
    .line 92
    new-instance v1, Ll/bdi;

    .line 93
    .line 94
    invoke-direct {v1, p0}, Ll/bdi;-><init>(Ll/pdi;)V

    .line 95
    .line 96
    .line 97
    new-instance v2, Ll/vci;

    .line 98
    .line 99
    invoke-direct {v2, p0}, Ll/vci;-><init>(Ll/pdi;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v0, v1, v2}, Ll/dj30;->k(ILl/y20;Ljava/lang/Runnable;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final E(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    iget-object v1, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iget v2, p0, Ll/pdi;->p:I

    .line 15
    .line 16
    add-int/2addr v1, v2

    .line 17
    int-to-float v1, v1

    .line 18
    new-instance v2, Ll/ddi;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/ddi;-><init>(Ll/pdi;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1, p1, v2}, Ll/dj30;->c(FFFLl/y20;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    int-to-float v0, v0

    .line 33
    iget-object v1, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 34
    .line 35
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iget v2, p0, Ll/pdi;->p:I

    .line 40
    .line 41
    add-int/2addr v1, v2

    .line 42
    int-to-float v1, v1

    .line 43
    new-instance v2, Ll/edi;

    .line 44
    .line 45
    invoke-direct {v2, p0}, Ll/edi;-><init>(Ll/pdi;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1, p1, v2}, Ll/dj30;->c(FFFLl/y20;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 52
    .line 53
    const/high16 v1, 0x41200000    # 10.0f

    .line 54
    .line 55
    const/4 v2, 0x0

    .line 56
    invoke-static {v0, v2, v1, p1}, Ll/dj30;->f(Landroid/view/View;FFF)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 60
    .line 61
    iget v1, p0, Ll/pdi;->t:F

    .line 62
    .line 63
    invoke-static {v0, v2, v1, p1}, Ll/dj30;->j(Landroid/view/View;FFF)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/pdi;->i:Lv/VDraweeView;

    .line 67
    .line 68
    iget v1, p0, Ll/pdi;->s:F

    .line 69
    .line 70
    invoke-static {v0, v2, v1, p1}, Ll/dj30;->i(Landroid/view/View;FFF)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/pdi;->i:Lv/VDraweeView;

    .line 74
    .line 75
    iget v1, p0, Ll/pdi;->r:F

    .line 76
    .line 77
    invoke-static {v0, v2, v1, p1}, Ll/dj30;->j(Landroid/view/View;FFF)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/pdi;->i:Lv/VDraweeView;

    .line 81
    .line 82
    const/high16 v1, 0x3f800000    # 1.0f

    .line 83
    .line 84
    invoke-static {v0, v1, v2, p1}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 88
    .line 89
    iget v3, p0, Ll/pdi;->s:F

    .line 90
    .line 91
    invoke-static {v0, v2, v3, p1}, Ll/dj30;->i(Landroid/view/View;FFF)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 95
    .line 96
    iget v3, p0, Ll/pdi;->r:F

    .line 97
    .line 98
    invoke-static {v0, v2, v3, p1}, Ll/dj30;->j(Landroid/view/View;FFF)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/pdi;->e:Lv/VText;

    .line 102
    .line 103
    invoke-static {v0, v1, v2, p1}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Ll/pdi;->f:Landroid/widget/TextView;

    .line 107
    .line 108
    invoke-static {p0, v1, v2, p1}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final F(F)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Ll/pdi;->p:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    int-to-float v0, v0

    .line 11
    iget-object v1, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    int-to-float v1, v1

    .line 18
    const/high16 v2, 0x40000000    # 2.0f

    .line 19
    .line 20
    div-float/2addr v1, v2

    .line 21
    iget v3, p0, Ll/pdi;->q:I

    .line 22
    .line 23
    int-to-float v3, v3

    .line 24
    add-float/2addr v1, v3

    .line 25
    new-instance v3, Ll/fdi;

    .line 26
    .line 27
    invoke-direct {v3, p0}, Ll/fdi;-><init>(Ll/pdi;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1, p1, v3}, Ll/dj30;->c(FFFLl/y20;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget v1, p0, Ll/pdi;->p:I

    .line 40
    .line 41
    add-int/2addr v0, v1

    .line 42
    int-to-float v0, v0

    .line 43
    iget-object v1, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    int-to-float v1, v1

    .line 50
    div-float/2addr v1, v2

    .line 51
    iget v2, p0, Ll/pdi;->q:I

    .line 52
    .line 53
    int-to-float v2, v2

    .line 54
    add-float/2addr v1, v2

    .line 55
    new-instance v2, Ll/gdi;

    .line 56
    .line 57
    invoke-direct {v2, p0}, Ll/gdi;-><init>(Ll/pdi;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, v1, p1, v2}, Ll/dj30;->c(FFFLl/y20;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 64
    .line 65
    const/high16 v1, 0x3f800000    # 1.0f

    .line 66
    .line 67
    const/high16 v2, 0x3f000000    # 0.5f

    .line 68
    .line 69
    invoke-static {v0, v1, v2, p1}, Ll/dj30;->g(Landroid/view/View;FFF)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 73
    .line 74
    invoke-static {v0, v1, v2, p1}, Ll/dj30;->h(Landroid/view/View;FFF)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/pdi;->D:Landroid/view/animation/Interpolator;

    .line 78
    .line 79
    invoke-interface {v0, p1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iget-object v2, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 84
    .line 85
    iget v3, p0, Ll/pdi;->r:F

    .line 86
    .line 87
    iget v4, p0, Ll/pdi;->u:F

    .line 88
    .line 89
    add-float/2addr v4, v3

    .line 90
    invoke-static {v2, v3, v4, v0}, Ll/dj30;->j(Landroid/view/View;FFF)V

    .line 91
    .line 92
    .line 93
    iget-object v2, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 94
    .line 95
    iget v3, p0, Ll/pdi;->t:F

    .line 96
    .line 97
    iget v4, p0, Ll/pdi;->u:F

    .line 98
    .line 99
    add-float/2addr v4, v3

    .line 100
    invoke-static {v2, v3, v4, v0}, Ll/dj30;->j(Landroid/view/View;FFF)V

    .line 101
    .line 102
    .line 103
    const v0, 0x3f666666    # 0.9f

    .line 104
    .line 105
    .line 106
    cmpg-float v0, p1, v0

    .line 107
    .line 108
    iget-object v2, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 109
    .line 110
    if-gez v0, :cond_0

    .line 111
    .line 112
    invoke-virtual {v2, v1}, Landroid/view/View;->setAlpha(F)V

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 116
    .line 117
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_0
    const/high16 v0, 0x41200000    # 10.0f

    .line 122
    .line 123
    mul-float/2addr p1, v0

    .line 124
    const/high16 v0, 0x41100000    # 9.0f

    .line 125
    .line 126
    sub-float/2addr p1, v0

    .line 127
    const/4 v0, 0x0

    .line 128
    invoke-static {v2, v1, v0, p1}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 129
    .line 130
    .line 131
    iget-object p0, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 132
    .line 133
    invoke-static {p0, v1, v0, p1}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public final H(Lcom/p1/mobile/android/app/Act;)V
    .locals 10

    .line 1
    iget-boolean v0, p0, Ll/pdi;->y:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "fisrt_liked"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v0, "female"

    .line 9
    .line 10
    :goto_0
    iget-object v1, p0, Ll/pdi;->z:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ll/pdi;->z:Ljava/lang/String;

    .line 19
    .line 20
    :cond_1
    const-string v1, "matched_received_page_type"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    filled-new-array {v0}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "e_matched_push_other_area"

    .line 31
    .line 32
    const-string v2, "p_successful_match_view"

    .line 33
    .line 34
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/pdi;->C:Ljava/lang/Runnable;

    .line 38
    .line 39
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/pdi;->n:Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 45
    .line 46
    const/4 v8, 0x2

    .line 47
    const-string v9, ""

    .line 48
    .line 49
    const/4 v3, 0x0

    .line 50
    const/4 v4, 0x0

    .line 51
    const/4 v5, 0x0

    .line 52
    const/4 v6, 0x0

    .line 53
    const/4 v7, 0x0

    .line 54
    move-object v1, p1

    .line 55
    invoke-static/range {v1 .. v9}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->q2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {v1, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/pdi;->A()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final I()V
    .locals 4

    .line 1
    invoke-static {}, Ll/gra;->m3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "["

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 19
    .line 20
    sget v2, Lcom/p1/mobile/putong/core/R$string;->i4:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "]"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    :cond_0
    iget-object v1, p0, Ll/pdi;->h:Lv/VText;

    .line 39
    .line 40
    new-instance v2, Ll/sci;

    .line 41
    .line 42
    const-string v3, "EMOJI_63"

    .line 43
    .line 44
    invoke-direct {v2, p0, v3, v0}, Ll/sci;-><init>(Ll/pdi;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ll/pdi;->f:Landroid/widget/TextView;

    .line 51
    .line 52
    iget-object v2, p0, Ll/pdi;->n:Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    invoke-virtual {p0, v1, v2}, Ll/pdi;->Z(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/User;)V

    .line 55
    .line 56
    .line 57
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 58
    .line 59
    iget-object v2, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 60
    .line 61
    iget-object v3, p0, Ll/pdi;->n:Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 79
    .line 80
    iget-object v2, p0, Ll/pdi;->i:Lv/VDraweeView;

    .line 81
    .line 82
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 83
    .line 84
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 85
    .line 86
    invoke-virtual {v3}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iget-object v1, p0, Ll/pdi;->h:Lv/VText;

    .line 106
    .line 107
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Ll/pdi;->e:Lv/VText;

    .line 111
    .line 112
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const/4 v1, 0x1

    .line 117
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 121
    .line 122
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 127
    .line 128
    iget-object v1, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 129
    .line 130
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 135
    .line 136
    iget v3, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 137
    .line 138
    sub-int/2addr v2, v3

    .line 139
    iget v3, v0, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    .line 140
    .line 141
    sub-int/2addr v2, v3

    .line 142
    int-to-float v2, v2

    .line 143
    const/high16 v3, 0x40000000    # 2.0f

    .line 144
    .line 145
    div-float/2addr v2, v3

    .line 146
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotX(F)V

    .line 147
    .line 148
    .line 149
    iget-object v1, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 150
    .line 151
    iget v0, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 152
    .line 153
    int-to-float v0, v0

    .line 154
    div-float/2addr v0, v3

    .line 155
    invoke-virtual {v1, v0}, Landroid/view/View;->setPivotY(F)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 159
    .line 160
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 165
    .line 166
    iget-object v1, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 167
    .line 168
    iget v2, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 169
    .line 170
    int-to-float v2, v2

    .line 171
    div-float/2addr v2, v3

    .line 172
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotX(F)V

    .line 173
    .line 174
    .line 175
    iget-object v1, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 176
    .line 177
    iget v2, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 178
    .line 179
    int-to-float v2, v2

    .line 180
    div-float/2addr v2, v3

    .line 181
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotY(F)V

    .line 182
    .line 183
    .line 184
    iget-object v1, p0, Ll/pdi;->i:Lv/VDraweeView;

    .line 185
    .line 186
    iget v2, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 187
    .line 188
    int-to-float v2, v2

    .line 189
    div-float/2addr v2, v3

    .line 190
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotX(F)V

    .line 191
    .line 192
    .line 193
    iget-object v1, p0, Ll/pdi;->i:Lv/VDraweeView;

    .line 194
    .line 195
    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 196
    .line 197
    int-to-float v0, v0

    .line 198
    div-float/2addr v0, v3

    .line 199
    invoke-virtual {v1, v0}, Landroid/view/View;->setPivotY(F)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p0}, Ll/pdi;->C()V

    .line 203
    .line 204
    .line 205
    return-void
.end method

.method public final synthetic J(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "core_female_match_success_flow_bg.svga"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->isCacheable(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object v0, p0, Ll/pdi;->l:Lcom/tantan/library/svga/SVGAnimationView;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/pdi;->y()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic K(FLandroid/view/animation/Interpolator;FLjava/lang/Float;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pdi;->k:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const v2, 0x3f19999a    # 0.6f

    .line 8
    .line 9
    .line 10
    div-float/2addr v1, v2

    .line 11
    const/high16 v2, 0x3f800000    # 1.0f

    .line 12
    .line 13
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-static {v0, v2, v3, v1}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 22
    .line 23
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-interface {p2, v1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    invoke-static {v0, p1, v3, p2}, Ll/dj30;->i(Landroid/view/View;FFF)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 35
    .line 36
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    invoke-static {p1, v3, v2, p2}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/pdi;->f:Landroid/widget/TextView;

    .line 44
    .line 45
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    invoke-static {p1, v2, v3, p2}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/pdi;->f:Landroid/widget/TextView;

    .line 53
    .line 54
    neg-float p2, p3

    .line 55
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-static {p1, v3, p2, v0}, Ll/dj30;->j(Landroid/view/View;FFF)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/pdi;->g:Landroid/widget/TextView;

    .line 63
    .line 64
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    invoke-static {p1, v3, v2, p2}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/pdi;->g:Landroid/widget/TextView;

    .line 72
    .line 73
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    invoke-static {p0, p3, v3, p1}, Ll/dj30;->j(Landroid/view/View;FFF)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pdi;->k:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/pdi;->g:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/pdi;->f:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-virtual {p0, v0, p1}, Ll/pdi;->Z(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/User;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/pdi;->f:Landroid/widget/TextView;

    .line 18
    .line 19
    const/high16 v1, 0x3f800000    # 1.0f

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/pdi;->f:Landroid/widget/TextView;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/pdi;->n:Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    return-void
.end method

.method public final synthetic M()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pdi;->o:Landroid/widget/PopupWindow;

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
    iget-object v0, p0, Ll/pdi;->o:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/pdi;->o:Landroid/widget/PopupWindow;

    .line 16
    .line 17
    sput-object v0, Ll/pdi;->F:Ll/pdi;

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final synthetic N(ILandroid/view/animation/Interpolator;Ljava/lang/Float;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pdi;->a:Lv/VRelative;

    .line 2
    .line 3
    neg-int p1, p1

    .line 4
    int-to-float p1, p1

    .line 5
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    invoke-interface {p2, p3}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const/4 p3, 0x0

    .line 14
    invoke-static {p0, p3, p1, p2}, Ll/dj30;->j(Landroid/view/View;FFF)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic O()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pdi;->m:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const-string v1, "https://auto.tancdn.com/v1/raw/21a07bab-d71a-48a2-8f84-c161a936051714.svga"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v1, "core_female_match_success_flow_bg.svga"

    .line 17
    .line 18
    :goto_0
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->isCacheable(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {}, Ll/gra;->z()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    sget-object v1, Lcom/tantan/library/svga/SVGAnimationView$FrameMode;->AFTER:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->frameMode(Lcom/tantan/library/svga/SVGAnimationView$FrameMode;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 44
    .line 45
    .line 46
    :cond_1
    iget-object p0, p0, Ll/pdi;->l:Lcom/tantan/library/svga/SVGAnimationView;

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic P(ILandroid/view/animation/Interpolator;ILjava/lang/Float;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/pdi;->a:Lv/VRelative;

    .line 2
    .line 3
    neg-int p1, p1

    .line 4
    int-to-float p1, p1

    .line 5
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const v2, 0x3f19999a    # 0.6f

    .line 10
    .line 11
    .line 12
    div-float/2addr v1, v2

    .line 13
    const/high16 v3, 0x3f800000    # 1.0f

    .line 14
    .line 15
    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v4, 0x0

    .line 20
    invoke-static {v0, p1, v4, v1}, Ll/dj30;->j(Landroid/view/View;FFF)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/pdi;->a:Lv/VRelative;

    .line 24
    .line 25
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    div-float/2addr v0, v2

    .line 30
    invoke-static {v3, v0}, Ljava/lang/Math;->min(FF)F

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-static {p1, v4, v3, v0}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const v0, 0x3e99999a    # 0.3f

    .line 42
    .line 43
    .line 44
    cmpl-float p1, p1, v0

    .line 45
    .line 46
    if-ltz p1, :cond_0

    .line 47
    .line 48
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    sub-float/2addr p1, v0

    .line 53
    const p4, 0x3f333333    # 0.7f

    .line 54
    .line 55
    .line 56
    div-float/2addr p1, p4

    .line 57
    iget-object p4, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 58
    .line 59
    div-float v0, p1, v0

    .line 60
    .line 61
    invoke-static {v3, v0}, Ljava/lang/Math;->min(FF)F

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {p4, v1}, Landroid/view/View;->setAlpha(F)V

    .line 66
    .line 67
    .line 68
    iget-object p4, p0, Ll/pdi;->i:Lv/VDraweeView;

    .line 69
    .line 70
    invoke-static {v3, v0}, Ljava/lang/Math;->min(FF)F

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    invoke-virtual {p4, v0}, Landroid/view/View;->setAlpha(F)V

    .line 75
    .line 76
    .line 77
    invoke-interface {p2, p1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    iget-object p4, p0, Ll/pdi;->i:Lv/VDraweeView;

    .line 82
    .line 83
    neg-int v0, p3

    .line 84
    int-to-float v0, v0

    .line 85
    invoke-static {p4, v0, v4, p2}, Ll/dj30;->i(Landroid/view/View;FFF)V

    .line 86
    .line 87
    .line 88
    iget-object p4, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 89
    .line 90
    int-to-float p3, p3

    .line 91
    invoke-static {p4, p3, v4, p2}, Ll/dj30;->i(Landroid/view/View;FFF)V

    .line 92
    .line 93
    .line 94
    const/high16 p2, 0x40000000    # 2.0f

    .line 95
    .line 96
    mul-float/2addr p1, p2

    .line 97
    invoke-static {v3, p1}, Ljava/lang/Math;->min(FF)F

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    iget-object p2, p0, Ll/pdi;->i:Lv/VDraweeView;

    .line 102
    .line 103
    const/high16 p3, -0x3ee00000    # -10.0f

    .line 104
    .line 105
    invoke-static {p2, v4, p3, p1}, Ll/dj30;->f(Landroid/view/View;FFF)V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 109
    .line 110
    const/high16 p2, 0x41200000    # 10.0f

    .line 111
    .line 112
    invoke-static {p0, v4, p2, p1}, Ll/dj30;->f(Landroid/view/View;FFF)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_0
    iget-object p1, p0, Ll/pdi;->i:Lv/VDraweeView;

    .line 117
    .line 118
    invoke-virtual {p1, v4}, Landroid/view/View;->setAlpha(F)V

    .line 119
    .line 120
    .line 121
    iget-object p0, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 122
    .line 123
    invoke-virtual {p0, v4}, Landroid/view/View;->setAlpha(F)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public final synthetic Q(Ljava/lang/Float;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0x3e99999a    # 0.3f

    .line 6
    .line 7
    .line 8
    cmpg-float v0, v0, v1

    .line 9
    .line 10
    if-gtz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    div-float/2addr v0, v1

    .line 17
    invoke-virtual {p0, v0}, Ll/pdi;->E(F)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget v0, p0, Ll/pdi;->v:F

    .line 22
    .line 23
    cmpg-float v0, v0, v1

    .line 24
    .line 25
    if-gtz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    cmpl-float v0, v0, v1

    .line 32
    .line 33
    if-lez v0, :cond_1

    .line 34
    .line 35
    const/high16 v0, 0x3f800000    # 1.0f

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/pdi;->E(F)V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const v1, 0x3f333333    # 0.7f

    .line 45
    .line 46
    .line 47
    div-float/2addr v0, v1

    .line 48
    const v1, 0x3edb6db8

    .line 49
    .line 50
    .line 51
    sub-float/2addr v0, v1

    .line 52
    invoke-virtual {p0, v0}, Ll/pdi;->F(F)V

    .line 53
    .line 54
    .line 55
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    const v1, 0x3f19999a    # 0.6f

    .line 60
    .line 61
    .line 62
    cmpl-float v0, v0, v1

    .line 63
    .line 64
    if-lez v0, :cond_2

    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/dkb;->z7()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_2

    .line 75
    .line 76
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 79
    .line 80
    const/4 v1, 0x1

    .line 81
    invoke-virtual {v0, v1}, Ll/dkb;->r9(Z)V

    .line 82
    .line 83
    .line 84
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    iput p1, p0, Ll/pdi;->v:F

    .line 89
    .line 90
    return-void
.end method

.method public final synthetic R(Ljava/lang/Float;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/high16 v0, 0x40000000    # 2.0f

    .line 8
    .line 9
    div-float/2addr p1, v0

    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->setMoveX(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic S(Ljava/lang/Float;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/high16 v0, 0x40000000    # 2.0f

    .line 8
    .line 9
    div-float/2addr p1, v0

    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->setMoveY(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic T(Ljava/lang/Float;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/high16 v0, 0x40000000    # 2.0f

    .line 8
    .line 9
    div-float/2addr p1, v0

    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->setMoveX(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic U(Ljava/lang/Float;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/high16 v0, 0x40000000    # 2.0f

    .line 8
    .line 9
    div-float/2addr p1, v0

    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;->setMoveY(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic V(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object p3, p0, Ll/pdi;->C:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p3}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/tye;->c()Ll/tye;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    invoke-virtual {p3, p1}, Ll/tye;->l(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/pdi;->m:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    iget-object v1, p0, Ll/pdi;->n:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    new-instance v4, Ll/wci;

    .line 18
    .line 19
    invoke-direct {v4}, Ll/wci;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance v5, Ll/xci;

    .line 23
    .line 24
    invoke-direct {v5}, Ll/xci;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v6, ""

    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    move-object v2, p2

    .line 31
    invoke-static/range {v0 .. v6}, Ll/d810;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZLjava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-boolean p1, p0, Ll/pdi;->w:Z

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Ll/pdi;->m:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    instance-of p2, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 41
    .line 42
    if-eqz p2, :cond_0

    .line 43
    .line 44
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->d6()Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->U()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_0

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/pdi;->D()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    invoke-virtual {p0}, Ll/pdi;->B()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-virtual {p0}, Ll/pdi;->B()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final synthetic W()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pdi;->o:Landroid/widget/PopupWindow;

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
    iget-object v0, p0, Ll/pdi;->o:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/pdi;->B()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic X(ILcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p4}, Landroid/view/MotionEvent;->getY()F

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    float-to-int p3, p3

    .line 6
    if-ge p3, p1, :cond_3

    .line 7
    .line 8
    invoke-virtual {p4}, Landroid/view/MotionEvent;->getAction()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p4}, Landroid/view/MotionEvent;->getY()F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Ll/pdi;->E:F

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p4}, Landroid/view/MotionEvent;->getAction()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/4 p3, 0x1

    .line 26
    if-ne p1, p3, :cond_2

    .line 27
    .line 28
    invoke-virtual {p4}, Landroid/view/MotionEvent;->getX()F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    iget p3, p3, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 37
    .line 38
    const/high16 v0, 0x42900000    # 72.0f

    .line 39
    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    sub-int/2addr p3, v0

    .line 45
    int-to-float p3, p3

    .line 46
    cmpg-float p1, p1, p3

    .line 47
    .line 48
    if-gez p1, :cond_2

    .line 49
    .line 50
    invoke-virtual {p4}, Landroid/view/MotionEvent;->getY()F

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iget p3, p0, Ll/pdi;->E:F

    .line 55
    .line 56
    sub-float/2addr p1, p3

    .line 57
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 58
    .line 59
    .line 60
    move-result p3

    .line 61
    const/high16 p4, 0x41200000    # 10.0f

    .line 62
    .line 63
    cmpg-float p3, p3, p4

    .line 64
    .line 65
    if-gez p3, :cond_1

    .line 66
    .line 67
    invoke-virtual {p0, p2}, Ll/pdi;->H(Lcom/p1/mobile/android/app/Act;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    const/4 p2, 0x0

    .line 72
    cmpg-float p1, p1, p2

    .line 73
    .line 74
    if-gez p1, :cond_2

    .line 75
    .line 76
    iget-object p1, p0, Ll/pdi;->C:Ljava/lang/Runnable;

    .line 77
    .line 78
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ll/pdi;->B()V

    .line 82
    .line 83
    .line 84
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 85
    return p0

    .line 86
    :cond_3
    invoke-virtual {p2, p4}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    return p0
.end method

.method public final synthetic Y()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pdi;->x:Ll/l4g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/pdi;->x:Ll/l4g0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final Z(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/User;)V
    .locals 9
    .param p1    # Landroid/widget/TextView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x6

    .line 8
    if-le v0, v1, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "..."

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_0
    invoke-static {}, Ll/gra;->O()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const-string v1, " \u804a\u5929"

    .line 26
    .line 27
    const-string v2, "\u8f7b\u89e6\u548c "

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    new-instance p2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 51
    .line 52
    .line 53
    move-result-wide v3

    .line 54
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->getLastActiveTimeMillis()J

    .line 55
    .line 56
    .line 57
    move-result-wide v5

    .line 58
    sub-long/2addr v3, v5

    .line 59
    const-wide/32 v5, 0x493e0

    .line 60
    .line 61
    .line 62
    cmp-long p2, v3, v5

    .line 63
    .line 64
    const/4 v0, 0x0

    .line 65
    if-gez p2, :cond_2

    .line 66
    .line 67
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    sget p2, Ll/dbc0;->Yd:I

    .line 74
    .line 75
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p1, p0, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 80
    .line 81
    .line 82
    const/high16 p0, 0x3f800000    # 1.0f

    .line 83
    .line 84
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 89
    .line 90
    .line 91
    const-string p0, "\u5f53\u524d\u5728\u7ebf"

    .line 92
    .line 93
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_2
    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 98
    .line 99
    .line 100
    const/4 p2, 0x0

    .line 101
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 106
    .line 107
    .line 108
    const-wide/32 v5, 0x36ee80

    .line 109
    .line 110
    .line 111
    cmp-long p2, v3, v5

    .line 112
    .line 113
    if-gez p2, :cond_3

    .line 114
    .line 115
    const-wide/32 v0, 0xea60

    .line 116
    .line 117
    .line 118
    div-long/2addr v3, v0

    .line 119
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    const-string p2, "%s\u5206\u949f\u524d\u6d3b\u8dc3"

    .line 128
    .line 129
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_3
    const-wide/32 v7, 0x5265c00

    .line 138
    .line 139
    .line 140
    cmp-long p2, v3, v7

    .line 141
    .line 142
    if-gez p2, :cond_4

    .line 143
    .line 144
    div-long/2addr v3, v5

    .line 145
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    const-string p2, "%s\u5c0f\u65f6\u524d\u6d3b\u8dc3"

    .line 154
    .line 155
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_4
    const-wide/32 v5, 0xa4cb800

    .line 164
    .line 165
    .line 166
    cmp-long p2, v3, v5

    .line 167
    .line 168
    if-gez p2, :cond_5

    .line 169
    .line 170
    const-string p0, "\u6628\u5929\u6d3b\u8dc3"

    .line 171
    .line 172
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :cond_5
    new-instance p2, Ljava/lang/StringBuilder;

    .line 177
    .line 178
    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 192
    .line 193
    .line 194
    return-void
.end method

.method public final a0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    iput-object p1, p0, Ll/pdi;->m:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Ll/pdi;->n:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Ll/dkb;->r9(Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {p0, v0, v2}, Ll/pdi;->x(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {p1}, Ll/wgx;->B(Lcom/p1/mobile/android/app/Act;)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    sget v3, Ll/qa00;->j:I

    .line 27
    .line 28
    add-int/2addr v2, v3

    .line 29
    iput v2, p0, Ll/pdi;->A:I

    .line 30
    .line 31
    invoke-static {p1}, Ll/wgx;->B(Lcom/p1/mobile/android/app/Act;)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 40
    .line 41
    add-int/2addr v2, v3

    .line 42
    const/high16 v3, 0x42600000    # 56.0f

    .line 43
    .line 44
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    sub-int/2addr v2, v3

    .line 49
    iput v2, p0, Ll/pdi;->B:I

    .line 50
    .line 51
    iget v2, p0, Ll/pdi;->A:I

    .line 52
    .line 53
    invoke-static {v0, v2}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 54
    .line 55
    .line 56
    new-instance v2, Landroid/widget/PopupWindow;

    .line 57
    .line 58
    iget v3, p0, Ll/pdi;->B:I

    .line 59
    .line 60
    const/4 v4, 0x1

    .line 61
    const/4 v5, -0x1

    .line 62
    invoke-direct {v2, v0, v5, v3, v4}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 63
    .line 64
    .line 65
    iput-object v2, p0, Ll/pdi;->o:Landroid/widget/PopupWindow;

    .line 66
    .line 67
    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setClippingEnabled(Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/pdi;->b:Lcom/p1/mobile/putong/core/ui/match/view/FemaleMatchSuccessLayout;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 77
    .line 78
    iget v0, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 79
    .line 80
    iget v2, p0, Ll/pdi;->A:I

    .line 81
    .line 82
    add-int/2addr v0, v2

    .line 83
    iget-object v2, p0, Ll/pdi;->o:Landroid/widget/PopupWindow;

    .line 84
    .line 85
    new-instance v3, Ll/ndi;

    .line 86
    .line 87
    invoke-direct {v3, p0, v0, p1}, Ll/ndi;-><init>(Ll/pdi;ILcom/p1/mobile/android/app/Act;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v2, v3}, Landroid/widget/PopupWindow;->setTouchInterceptor(Landroid/view/View$OnTouchListener;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/pdi;->o:Landroid/widget/PopupWindow;

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    const/16 v2, 0x31

    .line 104
    .line 105
    invoke-virtual {v0, p1, v2, v1, v1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Ll/pdi;->o:Landroid/widget/PopupWindow;

    .line 109
    .line 110
    new-instance v0, Ll/odi;

    .line 111
    .line 112
    invoke-direct {v0, p0}, Ll/odi;-><init>(Ll/pdi;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 116
    .line 117
    .line 118
    iget-boolean p1, p0, Ll/pdi;->y:Z

    .line 119
    .line 120
    const-string v0, "female"

    .line 121
    .line 122
    if-eqz p1, :cond_0

    .line 123
    .line 124
    const-string p1, "fisrt_liked"

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_0
    move-object p1, v0

    .line 128
    :goto_0
    iget-object v1, p0, Ll/pdi;->z:Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    const-string v2, "long_time_no_see"

    .line 135
    .line 136
    if-nez v1, :cond_1

    .line 137
    .line 138
    iget-object p1, p0, Ll/pdi;->z:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-eqz v1, :cond_1

    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_1
    move-object v0, p1

    .line 148
    :goto_1
    new-instance p1, Ll/l4g0;

    .line 149
    .line 150
    const-class v1, Ll/wgx;

    .line 151
    .line 152
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    const-string v3, "p_successful_match_view"

    .line 157
    .line 158
    invoke-direct {p1, v3, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    iput-object p1, p0, Ll/pdi;->x:Ll/l4g0;

    .line 162
    .line 163
    new-instance p1, Lorg/json/JSONObject;

    .line 164
    .line 165
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 166
    .line 167
    .line 168
    :try_start_0
    const-string v1, "match_source"

    .line 169
    .line 170
    iget-boolean v3, p0, Ll/pdi;->y:Z

    .line 171
    .line 172
    if-eqz v3, :cond_2

    .line 173
    .line 174
    const-string v3, "negative"

    .line 175
    .line 176
    goto :goto_2

    .line 177
    :catch_0
    move-exception p1

    .line 178
    goto :goto_3

    .line 179
    :cond_2
    const-string v3, "positive"

    .line 180
    .line 181
    :goto_2
    invoke-virtual {p1, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 182
    .line 183
    .line 184
    const-string v1, "moments_user_id"

    .line 185
    .line 186
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {p1, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 189
    .line 190
    .line 191
    const-string p2, "matched_received_page_type"

    .line 192
    .line 193
    invoke-virtual {p1, p2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 194
    .line 195
    .line 196
    invoke-static {}, Ll/gra;->r1()Z

    .line 197
    .line 198
    .line 199
    move-result p2

    .line 200
    if-eqz p2, :cond_3

    .line 201
    .line 202
    const-string p2, "is_matched_longtimenosee"

    .line 203
    .line 204
    iget-object v0, p0, Ll/pdi;->z:Ljava/lang/String;

    .line 205
    .line 206
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    invoke-virtual {p1, p2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 211
    .line 212
    .line 213
    :cond_3
    iget-object p2, p0, Ll/pdi;->x:Ll/l4g0;

    .line 214
    .line 215
    invoke-virtual {p2, p1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 216
    .line 217
    .line 218
    goto :goto_4

    .line 219
    :goto_3
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 220
    .line 221
    .line 222
    :goto_4
    iget-object p1, p0, Ll/pdi;->x:Ll/l4g0;

    .line 223
    .line 224
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 225
    .line 226
    .line 227
    iget-object p1, p0, Ll/pdi;->x:Ll/l4g0;

    .line 228
    .line 229
    invoke-virtual {p1}, Ll/l4g0;->l()V

    .line 230
    .line 231
    .line 232
    invoke-virtual {p0}, Ll/pdi;->I()V

    .line 233
    .line 234
    .line 235
    return-void
.end method

.method public x(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/qdi;->b(Ll/pdi;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final y()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pdi;->m:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pdi;->C:Ljava/lang/Runnable;

    .line 4
    .line 5
    const-wide/16 v1, 0x1388

    .line 6
    .line 7
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/pdi;->C:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/dj30;->l()Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget v0, v0, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->female_enter_time:I

    .line 11
    .line 12
    sget v1, Ll/qa00;->y:I

    .line 13
    .line 14
    int-to-float v1, v1

    .line 15
    sget v2, Ll/qa00;->o:I

    .line 16
    .line 17
    int-to-float v2, v2

    .line 18
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 19
    .line 20
    iget-object v4, p0, Ll/pdi;->k:Lv/VDraweeView;

    .line 21
    .line 22
    iget-object v5, p0, Ll/pdi;->n:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-virtual {v3, v4, v5}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v3, p0, Ll/pdi;->k:Lv/VDraweeView;

    .line 40
    .line 41
    const/4 v4, 0x1

    .line 42
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 46
    .line 47
    iget-object v5, p0, Ll/pdi;->j:Lv/VDraweeView;

    .line 48
    .line 49
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    invoke-virtual {v3, v5, v6}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object v3, p0, Ll/pdi;->g:Landroid/widget/TextView;

    .line 65
    .line 66
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    iget-object v3, p0, Ll/pdi;->g:Landroid/widget/TextView;

    .line 70
    .line 71
    invoke-virtual {p0, v3, p2}, Ll/pdi;->Z(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/User;)V

    .line 72
    .line 73
    .line 74
    new-instance v3, Ll/jdi;

    .line 75
    .line 76
    invoke-direct {v3, p0, p1}, Ll/jdi;-><init>(Ll/pdi;Lcom/p1/mobile/android/app/Act;)V

    .line 77
    .line 78
    .line 79
    add-int/lit16 v4, v0, -0xc8

    .line 80
    .line 81
    int-to-long v4, v4

    .line 82
    invoke-static {p1, v3, v4, v5}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 83
    .line 84
    .line 85
    new-instance p1, Landroid/view/animation/OvershootInterpolator;

    .line 86
    .line 87
    invoke-direct {p1}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 88
    .line 89
    .line 90
    new-instance v3, Ll/kdi;

    .line 91
    .line 92
    invoke-direct {v3, p0, v1, p1, v2}, Ll/kdi;-><init>(Ll/pdi;FLandroid/view/animation/Interpolator;F)V

    .line 93
    .line 94
    .line 95
    new-instance p1, Ll/ldi;

    .line 96
    .line 97
    invoke-direct {p1, p0, p2}, Ll/ldi;-><init>(Ll/pdi;Lcom/p1/mobile/putong/data/User;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v0, v3, p1}, Ll/dj30;->k(ILl/y20;Ljava/lang/Runnable;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method
