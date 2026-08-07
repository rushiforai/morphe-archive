.class public Ll/pzb0;
.super Ll/fqe0;
.source "SourceFile"


# instance fields
.field public i:Lcom/p1/mobile/android/app/Act;

.field public j:Landroid/widget/PopupWindow;

.field public k:Z

.field public l:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

.field public m:Ljava/lang/Runnable;

.field public n:Ljava/lang/String;

.field public o:Landroid/view/GestureDetector;

.field public p:Ll/kcg0;

.field public q:Ll/kcg0;

.field public r:Z

.field public s:Ll/x20;

.field public t:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ll/x20;)V
    .locals 1
    .param p3    # Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/fqe0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/pzb0;->m:Ljava/lang/Runnable;

    .line 6
    .line 7
    new-instance v0, Ll/yyb0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/yyb0;-><init>(Ll/pzb0;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/pzb0;->t:Ljava/lang/Runnable;

    .line 13
    .line 14
    iput-object p1, p0, Ll/pzb0;->i:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    iput-boolean p2, p0, Ll/pzb0;->k:Z

    .line 17
    .line 18
    iput-object p3, p0, Ll/pzb0;->l:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 19
    .line 20
    iput-object p4, p0, Ll/pzb0;->s:Ll/x20;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic B(Ll/pzb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzb0;->o0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Ll/pzb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pzb0;->h0()V

    return-void
.end method

.method public static synthetic F(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u5bf9\u65b9\u7528\u6237\u6b63\u5728\u901a\u8bdd\u4e2d\uff0c\u53ef\u4ee5\u53bb\u53d1\u8d77\u8bed\u97f3\u95ea\u804a\u54e6"

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->b(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic H(Ll/pzb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pzb0;->f0()V

    return-void
.end method

.method public static synthetic I(Landroid/view/View;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p1, 0x0

    .line 8
    :goto_0
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic J(Ll/pzb0;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pzb0;->g0(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic K(Ll/pzb0;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzb0;->m0(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    return-void
.end method

.method public static synthetic L(Landroid/view/View;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    sget v1, Ll/adc0;->a0:I

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 10
    .line 11
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 35
    .line 36
    sget v1, Ll/adc0;->c0:I

    .line 37
    .line 38
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 43
    .line 44
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    sget v1, Ll/dbc0;->s8:I

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    sget v1, Ll/dbc0;->r8:I

    .line 62
    .line 63
    :goto_0
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic N(Ll/pzb0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzb0;->l0(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic O(Ll/pzb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pzb0;->j0()V

    return-void
.end method

.method public static synthetic P(Ll/pzb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzb0;->q0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Ll/pzb0;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pzb0;->n0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Ll/pzb0;Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pzb0;->i0(Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic S(Ll/pzb0;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzb0;->k0(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T(Landroid/view/View;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget v0, Ll/adc0;->O:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->w(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic U(Ll/pzb0;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pzb0;->p0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic V(Ll/pzb0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pzb0;->r:Z

    return p0
.end method

.method public static bridge synthetic W(Ll/pzb0;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/pzb0;->r:Z

    return-void
.end method

.method public static bridge synthetic X(Ll/pzb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pzb0;->a0()V

    return-void
.end method


# virtual methods
.method public A()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pzb0;->b0()V

    .line 2
    .line 3
    .line 4
    const p0, 0x7fffffff

    .line 5
    .line 6
    .line 7
    return p0
.end method

.method public Y()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pzb0;->t:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/pzb0;->t:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final Z()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/wyb0;->i0()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, "remainingtimes"

    .line 15
    .line 16
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    const-string v1, "quickchat_action"

    .line 20
    .line 21
    const-string v2, "reject"

    .line 22
    .line 23
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    iget-boolean v1, p0, Ll/pzb0;->k:Z

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    iget-object v1, p0, Ll/pzb0;->l:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 33
    .line 34
    const-string v2, "other_user_id"

    .line 35
    .line 36
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-boolean v1, p0, Ll/pzb0;->k:Z

    .line 40
    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    const-string v1, "e_match_pop_quickchat_voice"

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const-string v1, "e_suggest_pop_quickchat_voice"

    .line 47
    .line 48
    :goto_0
    iget-object p0, p0, Ll/pzb0;->n:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v1, p0, v0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final a0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/pzb0;->j:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/high16 v1, 0x437a0000    # 250.0f

    .line 8
    .line 9
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    neg-int v1, v1

    .line 14
    int-to-float v1, v1

    .line 15
    const/4 v2, 0x2

    .line 16
    new-array v2, v2, [F

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    const/4 v4, 0x0

    .line 20
    aput v3, v2, v4

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    aput v1, v2, v3

    .line 24
    .line 25
    const-string v1, "translationY"

    .line 26
    .line 27
    invoke-static {v0, v1, v2}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-wide/16 v1, 0xc8

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    .line 37
    .line 38
    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 42
    .line 43
    .line 44
    new-instance v1, Ll/pzb0$b;

    .line 45
    .line 46
    invoke-direct {v1, p0, v0}, Ll/pzb0$b;-><init>(Ll/pzb0;Landroid/animation/Animator;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final b0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/pzb0;->o:Landroid/view/GestureDetector;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/pzb0;->i:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/pzb0;->d0(Lcom/p1/mobile/android/app/Act;)Landroid/view/GestureDetector;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/pzb0;->o:Landroid/view/GestureDetector;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/pzb0;->j:Landroid/widget/PopupWindow;

    .line 14
    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    iget-boolean v0, p0, Ll/pzb0;->k:Z

    .line 18
    .line 19
    iget-object v1, p0, Ll/pzb0;->i:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget v1, Ll/kec0;->nb:I

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p0, Ll/pzb0;->i:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    iget-object v2, p0, Ll/pzb0;->l:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 37
    .line 38
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    invoke-virtual {p0, v1, v2, v0}, Ll/pzb0;->r0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget v1, Ll/kec0;->ob:I

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Ll/pzb0;->i:Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    invoke-virtual {p0, v1, v0}, Ll/pzb0;->s0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    :goto_0
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 60
    .line 61
    sget v2, Ll/adc0;->o0:I

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 68
    .line 69
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFZMlVFTU02WE1PVFpYM0RLVkhLTldOVjZISkRCNzEyIiwidyI6NzE4LCJoIjo0MzgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NTg3ODQ2NzM1MjE4MTE0NjI5fQ.png"

    .line 70
    .line 71
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Ll/dox;->e()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    invoke-static {}, Ll/dox;->e()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->measure(II)V

    .line 83
    .line 84
    .line 85
    new-instance v1, Landroid/widget/PopupWindow;

    .line 86
    .line 87
    invoke-static {}, Ll/bnl0;->y0()I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    invoke-static {}, Ll/bnl0;->F0()I

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    add-int/2addr v3, v4

    .line 100
    const/4 v4, 0x0

    .line 101
    invoke-direct {v1, v0, v2, v3, v4}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 102
    .line 103
    .line 104
    iput-object v1, p0, Ll/pzb0;->j:Landroid/widget/PopupWindow;

    .line 105
    .line 106
    invoke-virtual {v1, v4}, Landroid/widget/PopupWindow;->setClippingEnabled(Z)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Ll/pzb0;->j:Landroid/widget/PopupWindow;

    .line 110
    .line 111
    new-instance v1, Ll/gzb0;

    .line 112
    .line 113
    invoke-direct {v1, p0}, Ll/gzb0;-><init>(Ll/pzb0;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 117
    .line 118
    .line 119
    :cond_2
    new-instance v0, Ll/hzb0;

    .line 120
    .line 121
    invoke-direct {v0, p0}, Ll/hzb0;-><init>(Ll/pzb0;)V

    .line 122
    .line 123
    .line 124
    iput-object v0, p0, Ll/pzb0;->m:Ljava/lang/Runnable;

    .line 125
    .line 126
    iget-object v0, p0, Ll/pzb0;->i:Lcom/p1/mobile/android/app/Act;

    .line 127
    .line 128
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iget-object p0, p0, Ll/pzb0;->m:Ljava/lang/Runnable;

    .line 137
    .line 138
    invoke-virtual {v0, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public final c0(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/pzb0;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->p1:Lcom/p1/mobile/putong/core/api/CoreAudioMatch;

    .line 8
    .line 9
    iget-object v1, p0, Ll/pzb0;->l:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->tracker:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {}, Ll/wyb0;->i0()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-gtz v2, :cond_0

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v2, 0x0

    .line 22
    :goto_0
    invoke-static {v2}, Lcom/p1/mobile/putong/core/api/CoreAudioMatch;->o3(Z)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/CoreAudioMatch;->p3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/ezb0;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1}, Ll/ezb0;-><init>(Ll/pzb0;Lcom/p1/mobile/android/app/Act;)V

    .line 37
    .line 38
    .line 39
    new-instance p1, Ll/fzb0;

    .line 40
    .line 41
    invoke-direct {p1}, Ll/fzb0;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    const-string v0, "voice_quick_chat"

    .line 53
    .line 54
    const-string v1, "audio_quick_chat_guide"

    .line 55
    .line 56
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 61
    .line 62
    .line 63
    :goto_1
    new-instance p1, Ljava/util/HashMap;

    .line 64
    .line 65
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/wyb0;->i0()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const-string v1, "remainingtimes"

    .line 77
    .line 78
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    const-string v0, "quickchat_action"

    .line 82
    .line 83
    const-string v1, "accept"

    .line 84
    .line 85
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    iget-boolean v0, p0, Ll/pzb0;->k:Z

    .line 89
    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    iget-object v0, p0, Ll/pzb0;->l:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 95
    .line 96
    const-string v1, "other_user_id"

    .line 97
    .line 98
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    :cond_2
    iget-boolean v0, p0, Ll/pzb0;->k:Z

    .line 102
    .line 103
    if-eqz v0, :cond_3

    .line 104
    .line 105
    const-string v0, "e_match_pop_quickchat_voice"

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_3
    const-string v0, "e_suggest_pop_quickchat_voice"

    .line 109
    .line 110
    :goto_2
    iget-object v1, p0, Ll/pzb0;->n:Ljava/lang/String;

    .line 111
    .line 112
    invoke-static {v0, v1, p1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Ll/pzb0;->Y()V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public final d0(Lcom/p1/mobile/android/app/Act;)Landroid/view/GestureDetector;
    .locals 2

    .line 1
    new-instance v0, Landroid/view/GestureDetector;

    .line 2
    .line 3
    new-instance v1, Ll/pzb0$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/pzb0$a;-><init>(Ll/pzb0;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public e0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pzb0;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public f(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic f0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jlb0;->b:Ll/x20;

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
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic g0(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pzb0;->o:Landroid/view/GestureDetector;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic h0()V
    .locals 5

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/pzb0;->j:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/pzb0;->j:Landroid/widget/PopupWindow;

    .line 15
    .line 16
    iget-object v2, p0, Ll/pzb0;->i:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const/16 v3, 0x31

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    invoke-virtual {v0, v2, v3, v4, v4}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/pzb0;->j:Landroid/widget/PopupWindow;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/pzb0;->t0(Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ljava/util/HashMap;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v2, "remainingtimes"

    .line 47
    .line 48
    invoke-static {}, Ll/wyb0;->i0()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    iget-boolean v2, p0, Ll/pzb0;->k:Z

    .line 60
    .line 61
    if-eqz v2, :cond_1

    .line 62
    .line 63
    const-string v2, "other_user_id"

    .line 64
    .line 65
    iget-object v3, p0, Ll/pzb0;->l:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 66
    .line 67
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 68
    .line 69
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    :cond_1
    sget-object v2, Ll/pzb0$c;->a:[I

    .line 73
    .line 74
    iget-object v3, p0, Ll/pzb0;->i:Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    check-cast v3, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 77
    .line 78
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->p7()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    aget v2, v2, v3

    .line 87
    .line 88
    if-eq v2, v1, :cond_4

    .line 89
    .line 90
    const/4 v3, 0x2

    .line 91
    if-eq v2, v3, :cond_3

    .line 92
    .line 93
    const/4 v3, 0x3

    .line 94
    if-eq v2, v3, :cond_2

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_2
    const-string v2, "p_navigation_view"

    .line 98
    .line 99
    iput-object v2, p0, Ll/pzb0;->n:Ljava/lang/String;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_3
    const-string v2, "p_explore_view"

    .line 103
    .line 104
    iput-object v2, p0, Ll/pzb0;->n:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_4
    const-string v2, "p_messages_view"

    .line 108
    .line 109
    iput-object v2, p0, Ll/pzb0;->n:Ljava/lang/String;

    .line 110
    .line 111
    :goto_0
    iget-boolean v2, p0, Ll/pzb0;->k:Z

    .line 112
    .line 113
    if-eqz v2, :cond_5

    .line 114
    .line 115
    const-string v2, "e_match_pop_quickchat_voice"

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_5
    const-string v2, "e_suggest_pop_quickchat_voice"

    .line 119
    .line 120
    :goto_1
    iget-object v3, p0, Ll/pzb0;->n:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v2, v3, v0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/pzb0;->j:Landroid/widget/PopupWindow;

    .line 126
    .line 127
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    sget v2, Ll/adc0;->z4:I

    .line 132
    .line 133
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Landroid/widget/FrameLayout;

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 140
    .line 141
    .line 142
    new-instance v1, Ll/dzb0;

    .line 143
    .line 144
    invoke-direct {v1, p0}, Ll/dzb0;-><init>(Ll/pzb0;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 148
    .line 149
    .line 150
    invoke-static {}, Ll/bnl0;->F0()I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 155
    .line 156
    .line 157
    sget v1, Ll/adc0;->xf:I

    .line 158
    .line 159
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 164
    .line 165
    iget-object p0, p0, Ll/pzb0;->i:Lcom/p1/mobile/android/app/Act;

    .line 166
    .line 167
    invoke-static {p0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    const-string v1, "https://auto.tancdn.com/v1/raw/bd3b6c84-2d79-4eb5-928f-4dc06d19cdf513.pdf"

    .line 172
    .line 173
    invoke-virtual {p0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    const/4 v1, -0x1

    .line 178
    invoke-virtual {p0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 186
    .line 187
    .line 188
    return-void

    .line 189
    :catchall_0
    move-exception p0

    .line 190
    const/16 v0, 0x14

    .line 191
    .line 192
    invoke-static {p0, v0}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method public final synthetic i0(Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/wyb0;->O()Ll/wyb0;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p0, p0, Ll/pzb0;->l:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p2, p1, p0}, Ll/wyb0;->M(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public j()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pzb0;->i:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic j0()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/pzb0;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->p1:Lcom/p1/mobile/putong/core/api/CoreAudioMatch;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAudioMatch;->u3()Lrx/c;

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/pzb0;->j:Landroid/widget/PopupWindow;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v3, p0, Ll/pzb0;->m:Ljava/lang/Runnable;

    .line 23
    .line 24
    invoke-virtual {v0, v3}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/pzb0;->j:Landroid/widget/PopupWindow;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget v3, Ll/adc0;->xf:I

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_1

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object v0, p0, Ll/pzb0;->j:Landroid/widget/PopupWindow;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 53
    .line 54
    .line 55
    iput-object v2, p0, Ll/pzb0;->j:Landroid/widget/PopupWindow;

    .line 56
    .line 57
    :cond_2
    iput-object v2, p0, Ll/pzb0;->m:Ljava/lang/Runnable;

    .line 58
    .line 59
    iget-object v0, p0, Ll/pzb0;->p:Ll/kcg0;

    .line 60
    .line 61
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/pzb0;->q:Ll/kcg0;

    .line 65
    .line 66
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 67
    .line 68
    .line 69
    iput-boolean v1, p0, Ll/pzb0;->r:Z

    .line 70
    .line 71
    iput-object v2, p0, Ll/pzb0;->o:Landroid/view/GestureDetector;

    .line 72
    .line 73
    iget-object v0, p0, Ll/pzb0;->s:Ll/x20;

    .line 74
    .line 75
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    iget-object p0, p0, Ll/pzb0;->s:Ll/x20;

    .line 82
    .line 83
    invoke-interface {p0}, Ll/x20;->call()V

    .line 84
    .line 85
    .line 86
    :cond_3
    return-void
.end method

.method public final synthetic k0(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pzb0;->j:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic l0(Ljava/lang/Long;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/pzb0;->j:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/adc0;->d1:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    const-wide/16 v3, 0x5

    .line 20
    .line 21
    sub-long v1, v3, v1

    .line 22
    .line 23
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "\u7acb\u5373\u63a5\u542c %ss"

    .line 32
    .line 33
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    cmp-long p1, v0, v3

    .line 45
    .line 46
    if-ltz p1, :cond_0

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/pzb0;->Y()V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public m()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pzb0;->i:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic m0(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pzb0;->Y()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/pzb0;->j:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/pzb0;->Y()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Ll/fqe0;->f:Ll/z2m;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-interface {p1, p0}, Ll/z2m;->a(Ll/d3m;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public final synthetic n0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzb0;->c0(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->AUDIO_QUICK_CHAT_BUBBLE:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->getGroup()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic o0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pzb0;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pzb0;->Y()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->AUDIO_QUICK_CHAT_BUBBLE:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->getId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic p0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzb0;->c0(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic q0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pzb0;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pzb0;->Y()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/wyb0;->O()Ll/wyb0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/wyb0;->K()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final r0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 6

    .line 1
    new-instance v0, Ll/mzb0;

    .line 2
    .line 3
    invoke-direct {v0, p3, p2}, Ll/mzb0;-><init>(Landroid/view/View;Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p3, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    sget v0, Ll/adc0;->Ie:I

    .line 10
    .line 11
    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lv/VText;

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const/4 v3, 0x1

    .line 23
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 24
    .line 25
    .line 26
    sget v0, Ll/adc0;->K8:I

    .line 27
    .line 28
    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Landroid/widget/TextView;

    .line 33
    .line 34
    iget-object v2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    sget v2, Ll/adc0;->X:I

    .line 40
    .line 41
    invoke-virtual {p3, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Lv/VImage;

    .line 46
    .line 47
    invoke-static {}, Ll/nrb0;->b()Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    const/4 v5, 0x0

    .line 52
    if-eqz v4, :cond_0

    .line 53
    .line 54
    invoke-virtual {v0, v5, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 55
    .line 56
    .line 57
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 64
    .line 65
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 66
    .line 67
    invoke-interface {v0, p1, p2, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-eqz v2, :cond_1

    .line 76
    .line 77
    sget v2, Ll/dbc0;->Iq:I

    .line 78
    .line 79
    invoke-virtual {v0, v5, v5, v2, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-eqz v2, :cond_2

    .line 88
    .line 89
    sget v2, Ll/dbc0;->Du:I

    .line 90
    .line 91
    invoke-virtual {v0, v5, v5, v2, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    invoke-virtual {v0, v5, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 96
    .line 97
    .line 98
    :cond_3
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .line 102
    .line 103
    iget-object v2, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 104
    .line 105
    iget v4, v2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 106
    .line 107
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 108
    .line 109
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v4, v2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->C(ILjava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    if-nez v4, :cond_4

    .line 120
    .line 121
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string v2, " \u00b7 "

    .line 125
    .line 126
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    :cond_4
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->H(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    iget-object v4, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 134
    .line 135
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 136
    .line 137
    invoke-static {v4}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    filled-new-array {v2, v4}, [Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    const-string v4, "%1$s \u00b7 %2$s"

    .line 146
    .line 147
    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    sget v2, Ll/adc0;->P1:I

    .line 155
    .line 156
    invoke-virtual {p3, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    check-cast v2, Lv/VText;

    .line 161
    .line 162
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    invoke-virtual {v2, v4, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 177
    .line 178
    .line 179
    move-result p2

    .line 180
    if-eqz p2, :cond_5

    .line 181
    .line 182
    const-string p2, "\u5979"

    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_5
    const-string p2, "\u4ed6"

    .line 186
    .line 187
    :goto_1
    sget v0, Ll/adc0;->Kd:I

    .line 188
    .line 189
    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    check-cast v0, Landroid/widget/TextView;

    .line 194
    .line 195
    const-string v2, "%s\u548c\u4f60\u8fd8\u86ee\u5408\u9002\u7684\uff0c\u53bb\u548c%s\u804a\u804a\u5427\uff01"

    .line 196
    .line 197
    filled-new-array {p2, p2}, [Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object p2

    .line 201
    invoke-static {v2, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p2

    .line 205
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 206
    .line 207
    .line 208
    sget p2, Ll/adc0;->d1:I

    .line 209
    .line 210
    invoke-virtual {p3, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 211
    .line 212
    .line 213
    move-result-object p2

    .line 214
    check-cast p2, Lv/VText;

    .line 215
    .line 216
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-virtual {p2, v0, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 221
    .line 222
    .line 223
    const-string v0, "\u7acb\u5373\u63a5\u542c 5s"

    .line 224
    .line 225
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 226
    .line 227
    .line 228
    new-instance v0, Ll/nzb0;

    .line 229
    .line 230
    invoke-direct {v0, p0, p1}, Ll/nzb0;-><init>(Ll/pzb0;Lcom/p1/mobile/android/app/Act;)V

    .line 231
    .line 232
    .line 233
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 234
    .line 235
    .line 236
    sget p2, Ll/adc0;->A1:I

    .line 237
    .line 238
    invoke-virtual {p3, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 239
    .line 240
    .line 241
    move-result-object p2

    .line 242
    new-instance p3, Ll/ozb0;

    .line 243
    .line 244
    invoke-direct {p3, p0}, Ll/ozb0;-><init>(Ll/pzb0;)V

    .line 245
    .line 246
    .line 247
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 248
    .line 249
    .line 250
    const-wide/16 p2, 0x1

    .line 251
    .line 252
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 253
    .line 254
    invoke-static {p2, p3, v0}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 255
    .line 256
    .line 257
    move-result-object p2

    .line 258
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 259
    .line 260
    .line 261
    move-result-object p2

    .line 262
    new-instance p3, Ll/zyb0;

    .line 263
    .line 264
    invoke-direct {p3, p0}, Ll/zyb0;-><init>(Ll/pzb0;)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {p2, p3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 268
    .line 269
    .line 270
    move-result-object p2

    .line 271
    const/4 p3, 0x6

    .line 272
    invoke-virtual {p2, p3}, Lrx/c;->take(I)Lrx/c;

    .line 273
    .line 274
    .line 275
    move-result-object p2

    .line 276
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 277
    .line 278
    .line 279
    move-result-object p3

    .line 280
    invoke-virtual {p2, p3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 281
    .line 282
    .line 283
    move-result-object p2

    .line 284
    new-instance p3, Ll/azb0;

    .line 285
    .line 286
    invoke-direct {p3, p0}, Ll/azb0;-><init>(Ll/pzb0;)V

    .line 287
    .line 288
    .line 289
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 290
    .line 291
    .line 292
    move-result-object p3

    .line 293
    invoke-virtual {p2, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 294
    .line 295
    .line 296
    move-result-object p2

    .line 297
    iput-object p2, p0, Ll/pzb0;->p:Ll/kcg0;

    .line 298
    .line 299
    move-object p2, p1

    .line 300
    check-cast p2, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 301
    .line 302
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o7()Lrx/c;

    .line 303
    .line 304
    .line 305
    move-result-object p2

    .line 306
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    new-instance p2, Ll/bzb0;

    .line 311
    .line 312
    invoke-direct {p2}, Ll/bzb0;-><init>()V

    .line 313
    .line 314
    .line 315
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 316
    .line 317
    .line 318
    move-result-object p1

    .line 319
    new-instance p2, Ll/czb0;

    .line 320
    .line 321
    invoke-direct {p2, p0}, Ll/czb0;-><init>(Ll/pzb0;)V

    .line 322
    .line 323
    .line 324
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 325
    .line 326
    .line 327
    move-result-object p2

    .line 328
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 329
    .line 330
    .line 331
    move-result-object p1

    .line 332
    iput-object p1, p0, Ll/pzb0;->q:Ll/kcg0;

    .line 333
    .line 334
    return-void
.end method

.method public final s0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 4

    .line 1
    new-instance v0, Ll/izb0;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ll/izb0;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    sget v0, Ll/adc0;->K8:I

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lv/VText;

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const/4 v3, 0x1

    .line 23
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 24
    .line 25
    .line 26
    sget v0, Ll/adc0;->d1:I

    .line 27
    .line 28
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lv/VText;

    .line 33
    .line 34
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 39
    .line 40
    .line 41
    new-instance v1, Ll/jzb0;

    .line 42
    .line 43
    invoke-direct {v1, p0, p1}, Ll/jzb0;-><init>(Ll/pzb0;Lcom/p1/mobile/android/app/Act;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    sget v0, Ll/adc0;->A1:I

    .line 50
    .line 51
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/kzb0;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/kzb0;-><init>(Ll/pzb0;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    move-object v0, p1

    .line 64
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o7()Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/lzb0;

    .line 75
    .line 76
    invoke-direct {v1, p2}, Ll/lzb0;-><init>(Landroid/view/View;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-virtual {v0, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    iput-object p2, p0, Ll/pzb0;->q:Ll/kcg0;

    .line 88
    .line 89
    iget-object p0, p0, Ll/pzb0;->t:Ljava/lang/Runnable;

    .line 90
    .line 91
    const-wide/16 v0, 0x7530

    .line 92
    .line 93
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final t0(Landroid/view/View;)V
    .locals 6

    .line 1
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0xc8

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 9
    .line 10
    .line 11
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    new-array v1, v0, [F

    .line 21
    .line 22
    fill-array-data v1, :array_0

    .line 23
    .line 24
    .line 25
    const-string v2, "alpha"

    .line 26
    .line 27
    invoke-static {p1, v2, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    neg-int v2, v2

    .line 36
    int-to-float v2, v2

    .line 37
    new-array v3, v0, [F

    .line 38
    .line 39
    const/4 v4, 0x0

    .line 40
    aput v2, v3, v4

    .line 41
    .line 42
    const/4 v2, 0x1

    .line 43
    const/4 v5, 0x0

    .line 44
    aput v5, v3, v2

    .line 45
    .line 46
    const-string v5, "translationY"

    .line 47
    .line 48
    invoke-static {p1, v5, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-array v0, v0, [Landroid/animation/Animator;

    .line 53
    .line 54
    aput-object v1, v0, v4

    .line 55
    .line 56
    aput-object p1, v0, v2

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
