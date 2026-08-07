.class public Ll/d3z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/dyy;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/u1z;",
        ">;",
        "Ll/dyy;"
    }
.end annotation


# static fields
.field public static w:Z

.field public static x:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Ll/u1z;

.field public b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public c:Ljava/lang/String;

.field public d:Landroid/view/View;

.field public e:Landroid/view/View;

.field public f:Z

.field public g:Ll/qxy;

.field public h:Z

.field public i:Ll/kcg0;

.field public j:I

.field public k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

.field public l:Ll/azy;

.field public final m:Ljava/lang/String;

.field public n:Landroid/view/View$OnClickListener;

.field public o:Z

.field public p:Ljava/lang/Runnable;

.field public q:Landroid/view/View;

.field public r:Ljava/lang/Runnable;

.field public s:Landroid/view/View;

.field public t:Z

.field public u:Landroid/animation/Animator;

.field public v:Landroid/animation/ValueAnimator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/d3z;->x:Lrx/subjects/a;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/d3z;->h:Z

    .line 6
    .line 7
    const-string v1, "giftStyleTipKey"

    .line 8
    .line 9
    iput-object v1, p0, Ll/d3z;->m:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v1, Ll/g2z;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/g2z;-><init>(Ll/d3z;)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/d3z;->n:Landroid/view/View$OnClickListener;

    .line 17
    .line 18
    iput-boolean v0, p0, Ll/d3z;->o:Z

    .line 19
    .line 20
    new-instance v1, Ll/d3z$d;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/d3z$d;-><init>(Ll/d3z;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Ll/d3z;->p:Ljava/lang/Runnable;

    .line 26
    .line 27
    new-instance v1, Ll/d3z$f;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/d3z$f;-><init>(Ll/d3z;)V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Ll/d3z;->r:Ljava/lang/Runnable;

    .line 33
    .line 34
    iput-boolean v0, p0, Ll/d3z;->t:Z

    .line 35
    .line 36
    iput-object p1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 37
    .line 38
    sget-object p1, Ll/d3z;->x:Lrx/subjects/a;

    .line 39
    .line 40
    new-instance v0, Ll/r2z;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/r2z;-><init>(Ll/d3z;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Ll/d3z;->i:Ll/kcg0;

    .line 54
    .line 55
    return-void
.end method

.method public static synthetic A(Ll/d3z;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->S0(Landroid/net/Uri;)V

    return-void
.end method

.method public static synthetic B(Ll/d3z;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->r1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Ll/d3z;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->a1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/d3z;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->M0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic F(Ll/d3z;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->L0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/d3z;Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;IILandroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/d3z;->Z0(Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;IILandroid/widget/PopupWindow;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/d3z;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->n1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic I(Ll/d3z;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d3z;->k1()V

    return-void
.end method

.method public static synthetic J(Ll/d3z;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->e1(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static synthetic K(Ll/d3z;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->X0(Landroid/net/Uri;)V

    return-void
.end method

.method public static synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Fg()V

    .line 10
    .line 11
    .line 12
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->w3:I

    .line 13
    .line 14
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic M(Ll/d3z;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3z;->g1()V

    return-void
.end method

.method public static synthetic N(Ll/d3z;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->j1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O(Ll/d3z;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d3z;->V0(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic P(Ll/d3z;Landroid/view/View;Landroid/view/MotionEvent;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d3z;->U0(Landroid/view/View;Landroid/view/MotionEvent;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Q(Ll/d3z;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->s1(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic R(Ll/d3z;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3z;->q:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic S(Ll/d3z;)Ll/azy;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3z;->l:Ll/azy;

    return-object p0
.end method

.method public static bridge synthetic T(Ll/d3z;)Lcom/p1/mobile/putong/core/ui/messages/MessageBar;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    return-object p0
.end method

.method public static bridge synthetic U(Ll/d3z;)Ll/u1z;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    return-object p0
.end method

.method public static bridge synthetic V(Ll/d3z;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d3z;->c:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic W(Ll/d3z;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d3z;->B1()V

    return-void
.end method

.method public static synthetic d(Ll/d3z;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->h1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic e(Ll/d3z;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->W0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/d3z;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d3z;->f1()V

    return-void
.end method

.method private synthetic g1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/n2;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/n2;->f()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic i(Ll/d3z;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->N0(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    return-void
.end method

.method public static synthetic j(Ll/d3z;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->o1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/d3z;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->R0(Landroid/net/Uri;)V

    return-void
.end method

.method public static synthetic l(Ll/d3z;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->m1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Landroid/view/View;F)V
    .locals 2

    .line 1
    neg-float p1, p1

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    int-to-float v0, v0

    .line 7
    sub-float v0, p1, v0

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v1, v1

    .line 21
    sub-float/2addr p1, v1

    .line 22
    const/4 v1, 0x2

    .line 23
    new-array v1, v1, [F

    .line 24
    .line 25
    aput p1, v1, v0

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    const/4 v0, 0x1

    .line 29
    aput p1, v1, v0

    .line 30
    .line 31
    const-string p1, "translationX"

    .line 32
    .line 33
    invoke-static {p0, p1, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance p1, Landroid/view/animation/OvershootInterpolator;

    .line 38
    .line 39
    const v0, 0x3f4ccccd    # 0.8f

    .line 40
    .line 41
    .line 42
    invoke-direct {p1, v0}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 46
    .line 47
    .line 48
    const-wide/16 v0, 0x12c

    .line 49
    .line 50
    invoke-virtual {p0, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic n(Ll/d3z;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/d3z;->T0(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic p(Ll/d3z;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->Y0(Landroid/net/Uri;)V

    return-void
.end method

.method public static synthetic q(Ll/d3z;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->P0(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic s(Landroid/view/View;F)V
    .locals 2

    .line 1
    neg-float p1, p1

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    int-to-float v0, v0

    .line 7
    sub-float v0, p1, v0

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v1, v1

    .line 21
    sub-float/2addr p1, v1

    .line 22
    const/4 v1, 0x2

    .line 23
    new-array v1, v1, [F

    .line 24
    .line 25
    aput p1, v1, v0

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    const/4 v0, 0x1

    .line 29
    aput p1, v1, v0

    .line 30
    .line 31
    const-string p1, "translationX"

    .line 32
    .line 33
    invoke-static {p0, p1, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance p1, Landroid/view/animation/OvershootInterpolator;

    .line 38
    .line 39
    const v0, 0x3f4ccccd    # 0.8f

    .line 40
    .line 41
    .line 42
    invoke-direct {p1, v0}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 46
    .line 47
    .line 48
    const-wide/16 v0, 0x12c

    .line 49
    .line 50
    invoke-virtual {p0, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic u(Ll/d3z;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->d1(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    return-void
.end method

.method public static synthetic v(Ll/d3z;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->l1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Ll/d3z;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d3z;->O0()V

    return-void
.end method

.method public static synthetic x(Ll/d3z;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->q1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/d3z;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d3z;->Q0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/d3z;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d3z;->p1(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public A0()V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_1

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    goto/16 :goto_1

    .line 26
    .line 27
    :cond_1
    invoke-static {}, Ll/joa;->f4()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->x3()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    goto/16 :goto_1

    .line 48
    .line 49
    :cond_2
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-interface {v1, v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Zm(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-nez v1, :cond_3

    .line 76
    .line 77
    goto/16 :goto_1

    .line 78
    .line 79
    :cond_3
    iget-object v1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 80
    .line 81
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getMessageBarRoot()Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iget-object v2, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 86
    .line 87
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getRecoverMatchView()Lv/VButton;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    if-eqz v3, :cond_9

    .line 96
    .line 97
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-nez v3, :cond_4

    .line 102
    .line 103
    goto/16 :goto_1

    .line 104
    .line 105
    :cond_4
    iget-object v3, p0, Ll/d3z;->a:Ll/u1z;

    .line 106
    .line 107
    invoke-virtual {v3}, Ll/j3z;->e0()Ll/mzl;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-interface {v3}, Ll/mzl;->l()Ll/clz;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {v3}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v4

    .line 123
    const/4 v5, 0x1

    .line 124
    const/4 v6, 0x0

    .line 125
    if-eqz v4, :cond_8

    .line 126
    .line 127
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 128
    .line 129
    .line 130
    move-result v4

    .line 131
    if-eqz v4, :cond_5

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    invoke-virtual {v4}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    invoke-interface {v4, v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->fq(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    if-eqz v4, :cond_7

    .line 147
    .line 148
    invoke-static {v2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    const/high16 v4, 0x3f800000    # 1.0f

    .line 153
    .line 154
    if-eqz v0, :cond_6

    .line 155
    .line 156
    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    cmpl-float v0, v0, v4

    .line 161
    .line 162
    if-nez v0, :cond_6

    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_6
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 166
    .line 167
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    check-cast v0, Ll/n2;

    .line 180
    .line 181
    invoke-virtual {v0}, Ll/n2;->d()Z

    .line 182
    .line 183
    .line 184
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->I7()V

    .line 193
    .line 194
    .line 195
    sget v0, Ll/ibc0;->g1:I

    .line 196
    .line 197
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v2, v4}, Landroid/view/View;->setAlpha(F)V

    .line 201
    .line 202
    .line 203
    sget v0, Ll/qa00;->v:I

    .line 204
    .line 205
    invoke-static {v2, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 206
    .line 207
    .line 208
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->r3:I

    .line 209
    .line 210
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 211
    .line 212
    .line 213
    new-instance v0, Ll/z2z;

    .line 214
    .line 215
    invoke-direct {v0, p0, v3}, Ll/z2z;-><init>(Ll/d3z;Lcom/p1/mobile/putong/data/User;)V

    .line 216
    .line 217
    .line 218
    invoke-static {v2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 219
    .line 220
    .line 221
    invoke-static {v1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 222
    .line 223
    .line 224
    invoke-static {v2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :cond_7
    invoke-virtual {p0, v0}, Ll/d3z;->e0(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 229
    .line 230
    .line 231
    return-void

    .line 232
    :cond_8
    :goto_0
    invoke-static {v1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 233
    .line 234
    .line 235
    invoke-static {v2, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 236
    .line 237
    .line 238
    :cond_9
    :goto_1
    return-void
.end method

.method public A1()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->u0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public B0()V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sget-object v1, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/vxd0;->defaultValue()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 40
    .line 41
    iget-object v1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 42
    .line 43
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 48
    .line 49
    neg-int v0, v0

    .line 50
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 51
    .line 52
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/w1z;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/w1z;-><init>(Ll/d3z;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-interface {v1}, Ll/r97;->t1()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    const/4 v2, 0x1

    .line 85
    xor-int/2addr v1, v2

    .line 86
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-interface {v0}, Ll/r97;->t1()Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    iget-object v1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 102
    .line 103
    if-eqz v0, :cond_0

    .line 104
    .line 105
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    const/4 v1, 0x4

    .line 110
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-object v1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v1}, Landroid/widget/TextView;->getInputType()I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    const/high16 v3, 0x20000

    .line 129
    .line 130
    or-int/2addr v1, v3

    .line 131
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setInputType(I)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 135
    .line 136
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 141
    .line 142
    .line 143
    :goto_0
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 144
    .line 145
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/VEditTextSougouGif;

    .line 150
    .line 151
    iget-object v1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 152
    .line 153
    if-eqz v0, :cond_1

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/VEditTextSougouGif;

    .line 160
    .line 161
    new-instance v1, Ll/x1z;

    .line 162
    .line 163
    invoke-direct {v1, p0}, Ll/x1z;-><init>(Ll/d3z;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/VEditTextSougouGif;->setOnSogouGifListener(Lcom/p1/mobile/putong/core/ui/messages/VEditTextSougouGif$a;)V

    .line 167
    .line 168
    .line 169
    goto :goto_1

    .line 170
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 175
    .line 176
    if-eqz v0, :cond_2

    .line 177
    .line 178
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 179
    .line 180
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 185
    .line 186
    new-instance v1, Ll/y1z;

    .line 187
    .line 188
    invoke-direct {v1, p0}, Ll/y1z;-><init>(Ll/d3z;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;->setOnSogouGifListener(Lcom/p1/mobile/putong/core/ui/messages/VEditTextSougouGif$a;)V

    .line 192
    .line 193
    .line 194
    :cond_2
    :goto_1
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 195
    .line 196
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    new-instance v1, Ll/z1z;

    .line 201
    .line 202
    invoke-direct {v1, p0}, Ll/z1z;-><init>(Ll/d3z;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 206
    .line 207
    .line 208
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 209
    .line 210
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->getInputExtras(Z)Landroid/os/Bundle;

    .line 215
    .line 216
    .line 217
    new-instance v0, Ll/a2z;

    .line 218
    .line 219
    invoke-direct {v0, p0}, Ll/a2z;-><init>(Ll/d3z;)V

    .line 220
    .line 221
    .line 222
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 223
    .line 224
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    new-instance v1, Ll/d3z$a;

    .line 229
    .line 230
    invoke-direct {v1, p0}, Ll/d3z$a;-><init>(Ll/d3z;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 234
    .line 235
    .line 236
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 237
    .line 238
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    new-instance v1, Ll/d3z$b;

    .line 243
    .line 244
    invoke-direct {v1, p0}, Ll/d3z$b;-><init>(Ll/d3z;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 248
    .line 249
    .line 250
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 251
    .line 252
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    if-eqz v1, :cond_5

    .line 261
    .line 262
    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    invoke-virtual {v0}, Landroid/content/Intent;->getType()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v3

    .line 270
    const-string v4, "android.intent.action.SEND"

    .line 271
    .line 272
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 273
    .line 274
    .line 275
    move-result v4

    .line 276
    const-string v5, "android.intent.extra.STREAM"

    .line 277
    .line 278
    const-string v6, "image/"

    .line 279
    .line 280
    if-eqz v4, :cond_4

    .line 281
    .line 282
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    move-result v4

    .line 286
    if-eqz v4, :cond_4

    .line 287
    .line 288
    const-string v1, "text/plain"

    .line 289
    .line 290
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    if-eqz v1, :cond_3

    .line 295
    .line 296
    invoke-virtual {p0, v0}, Ll/d3z;->w0(Landroid/content/Intent;)V

    .line 297
    .line 298
    .line 299
    goto :goto_2

    .line 300
    :cond_3
    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 301
    .line 302
    .line 303
    move-result v1

    .line 304
    if-eqz v1, :cond_5

    .line 305
    .line 306
    invoke-virtual {v0, v5}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 307
    .line 308
    .line 309
    move-result-object v1

    .line 310
    check-cast v1, Landroid/net/Uri;

    .line 311
    .line 312
    iget-object v3, p0, Ll/d3z;->a:Ll/u1z;

    .line 313
    .line 314
    filled-new-array {v1}, [Landroid/net/Uri;

    .line 315
    .line 316
    .line 317
    move-result-object v1

    .line 318
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 319
    .line 320
    .line 321
    move-result-object v1

    .line 322
    invoke-virtual {v3, v1}, Ll/u1z;->p1(Ljava/util/ArrayList;)V

    .line 323
    .line 324
    .line 325
    goto :goto_2

    .line 326
    :cond_4
    const-string v4, "android.intent.action.SEND_MULTIPLE"

    .line 327
    .line 328
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result v1

    .line 332
    if-eqz v1, :cond_5

    .line 333
    .line 334
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 335
    .line 336
    .line 337
    move-result v1

    .line 338
    if-eqz v1, :cond_5

    .line 339
    .line 340
    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 341
    .line 342
    .line 343
    move-result v1

    .line 344
    if-eqz v1, :cond_5

    .line 345
    .line 346
    invoke-virtual {v0, v5}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    iget-object v3, p0, Ll/d3z;->a:Ll/u1z;

    .line 351
    .line 352
    invoke-virtual {v3, v1}, Ll/u1z;->p1(Ljava/util/ArrayList;)V

    .line 353
    .line 354
    .line 355
    :cond_5
    :goto_2
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 356
    .line 357
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 358
    .line 359
    .line 360
    move-result-object v1

    .line 361
    invoke-interface {v1}, Ll/r97;->h1()Z

    .line 362
    .line 363
    .line 364
    move-result v1

    .line 365
    const/4 v3, 0x0

    .line 366
    if-eqz v1, :cond_7

    .line 367
    .line 368
    iget v1, p0, Ll/d3z;->j:I

    .line 369
    .line 370
    if-lez v1, :cond_7

    .line 371
    .line 372
    if-ne v1, v2, :cond_6

    .line 373
    .line 374
    const-string v1, "\u6253\u4e2a\u62db\u547c\u5427"

    .line 375
    .line 376
    invoke-virtual {p0, v1}, Ll/d3z;->L1(Ljava/lang/String;)V

    .line 377
    .line 378
    .line 379
    iget-object v2, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 380
    .line 381
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 382
    .line 383
    .line 384
    move-result-object v2

    .line 385
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSpaceHint(Ljava/lang/CharSequence;)V

    .line 386
    .line 387
    .line 388
    invoke-virtual {p0}, Ll/d3z;->Z1()V

    .line 389
    .line 390
    .line 391
    iput v3, p0, Ll/d3z;->j:I

    .line 392
    .line 393
    goto :goto_3

    .line 394
    :cond_6
    const/4 v4, 0x2

    .line 395
    if-ne v1, v4, :cond_7

    .line 396
    .line 397
    iget-object v1, p0, Ll/d3z;->a:Ll/u1z;

    .line 398
    .line 399
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 400
    .line 401
    .line 402
    move-result-object v1

    .line 403
    invoke-interface {v1}, Ll/mzl;->l()Ll/clz;

    .line 404
    .line 405
    .line 406
    move-result-object v1

    .line 407
    iget-object v1, v1, Ll/clz;->c:Ljava/lang/String;

    .line 408
    .line 409
    iget-object v4, p0, Ll/d3z;->a:Ll/u1z;

    .line 410
    .line 411
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 412
    .line 413
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 414
    .line 415
    invoke-virtual {v5, v1}, Lcom/p1/mobile/putong/core/api/g;->Ig(Ljava/lang/String;)Lrx/c;

    .line 416
    .line 417
    .line 418
    move-result-object v5

    .line 419
    invoke-virtual {v4, v5}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 420
    .line 421
    .line 422
    move-result-object v4

    .line 423
    invoke-virtual {v4, v2}, Lrx/c;->take(I)Lrx/c;

    .line 424
    .line 425
    .line 426
    move-result-object v2

    .line 427
    new-instance v4, Ll/b2z;

    .line 428
    .line 429
    invoke-direct {v4, p0, v1}, Ll/b2z;-><init>(Ll/d3z;Ljava/lang/String;)V

    .line 430
    .line 431
    .line 432
    invoke-static {v4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 433
    .line 434
    .line 435
    move-result-object v1

    .line 436
    invoke-virtual {v2, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 437
    .line 438
    .line 439
    :cond_7
    :goto_3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 440
    .line 441
    .line 442
    move-result v1

    .line 443
    if-eqz v1, :cond_9

    .line 444
    .line 445
    iget-object v1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 446
    .line 447
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 448
    .line 449
    .line 450
    move-result-object v1

    .line 451
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 452
    .line 453
    .line 454
    move-result v1

    .line 455
    if-eqz v1, :cond_9

    .line 456
    .line 457
    const-string v1, "appendMsg"

    .line 458
    .line 459
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 460
    .line 461
    .line 462
    move-result-object v1

    .line 463
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 464
    .line 465
    .line 466
    move-result v2

    .line 467
    if-nez v2, :cond_8

    .line 468
    .line 469
    iget-object v2, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 470
    .line 471
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 472
    .line 473
    .line 474
    move-result-object v2

    .line 475
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 476
    .line 477
    .line 478
    :cond_8
    const-string v1, "keyboardUp"

    .line 479
    .line 480
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 481
    .line 482
    .line 483
    move-result v0

    .line 484
    if-eqz v0, :cond_9

    .line 485
    .line 486
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 487
    .line 488
    new-instance v1, Ll/d3z$c;

    .line 489
    .line 490
    invoke-direct {v1, p0}, Ll/d3z$c;-><init>(Ll/d3z;)V

    .line 491
    .line 492
    .line 493
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 494
    .line 495
    .line 496
    :cond_9
    return-void
.end method

.method public final B1()V
    .locals 4

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pb1;->c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->PHONE:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 16
    .line 17
    if-ne v0, p0, :cond_0

    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->E3:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->CHAT_ROOM_WINDOW:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 26
    .line 27
    if-ne v0, p0, :cond_1

    .line 28
    .line 29
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->F3:I

    .line 30
    .line 31
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->getBusinessMsg()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v1, p0, Ll/d3z;->a:Ll/u1z;

    .line 50
    .line 51
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-interface {v1}, Ll/mzl;->l()Ll/clz;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Ll/clz;->r3()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-string v2, "voice"

    .line 64
    .line 65
    invoke-static {v0, v1, v2}, Ll/m600;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    const-string v0, "android.permission.RECORD_AUDIO"

    .line 69
    .line 70
    filled-new-array {v0}, [Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-static {v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    const/4 v2, 0x1

    .line 79
    if-eqz v1, :cond_3

    .line 80
    .line 81
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getRecordLayout()Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 97
    .line 98
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getMessageBarRoot()Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iget-object v3, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 103
    .line 104
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getInputRoot()Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-static {v1, v3, v2}, Ll/kqc0;->a(Landroid/view/View;Landroid/view/View;Z)Landroid/graphics/RectF;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->setInputRect(Landroid/graphics/RectF;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->h()V

    .line 116
    .line 117
    .line 118
    invoke-static {v0}, Ll/vqc0;->b(Ll/j4m;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->p()V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 128
    .line 129
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-interface {v0}, Ll/mzl;->u0()Ll/g500;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Ll/i500;

    .line 142
    .line 143
    iget-object v1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 144
    .line 145
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getRecordLayout()Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->setRecordActionCallback(Ll/i4m;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0}, Ll/i500;->v()V

    .line 153
    .line 154
    .line 155
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 156
    .line 157
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {p0}, Ll/clz;->X2()V

    .line 166
    .line 167
    .line 168
    return-void

    .line 169
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    filled-new-array {v0}, [Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    const/4 v1, 0x0

    .line 182
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iget-object p0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 191
    .line 192
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final C1(ILandroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final D0(Ljava/util/List;I)Landroid/widget/PopupWindow;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;",
            ">;I)",
            "Landroid/widget/PopupWindow;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v2, Ll/qec0;->d4:I

    .line 10
    .line 11
    const/4 v6, 0x0

    .line 12
    invoke-virtual {v0, v2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v7

    .line 16
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    .line 17
    .line 18
    const/4 v0, -0x1

    .line 19
    const/high16 v2, 0x3f800000    # 1.0f

    .line 20
    .line 21
    invoke-direct {v8, v0, v0, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v7, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    sget v0, Ll/edc0;->L2:I

    .line 28
    .line 29
    invoke-virtual {v7, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    move-object v9, v0

    .line 34
    check-cast v9, Landroid/widget/LinearLayout;

    .line 35
    .line 36
    invoke-virtual {v9}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 37
    .line 38
    .line 39
    new-instance v5, Landroid/widget/PopupWindow;

    .line 40
    .line 41
    const/4 v0, -0x2

    .line 42
    invoke-direct {v5, v7, v0, v0}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 43
    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    :goto_0
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-ge v0, v2, :cond_1

    .line 51
    .line 52
    move-object/from16 v10, p1

    .line 53
    .line 54
    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;

    .line 59
    .line 60
    iget-object v3, v1, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 61
    .line 62
    invoke-static {v3}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    sget v4, Ll/qec0;->e4:I

    .line 67
    .line 68
    invoke-virtual {v3, v4, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    move-object v11, v3

    .line 73
    check-cast v11, Landroid/widget/LinearLayout;

    .line 74
    .line 75
    invoke-virtual {v7, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 76
    .line 77
    .line 78
    const/4 v3, 0x1

    .line 79
    invoke-virtual {v11, v3}, Landroid/view/View;->setFocusable(Z)V

    .line 80
    .line 81
    .line 82
    sget v3, Ll/edc0;->o3:I

    .line 83
    .line 84
    invoke-virtual {v11, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    move-object v12, v3

    .line 89
    check-cast v12, Landroid/widget/TextView;

    .line 90
    .line 91
    sget v3, Ll/edc0;->n3:I

    .line 92
    .line 93
    invoke-virtual {v11, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    add-int/lit8 v13, v0, 0x1

    .line 98
    .line 99
    invoke-interface {v10}, Ljava/util/List;->size()I

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    if-ne v13, v4, :cond_0

    .line 104
    .line 105
    const/16 v4, 0x8

    .line 106
    .line 107
    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 108
    .line 109
    .line 110
    const/high16 v3, 0x41200000    # 10.0f

    .line 111
    .line 112
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 113
    .line 114
    .line 115
    move-result v4

    .line 116
    const/high16 v14, 0x41400000    # 12.0f

    .line 117
    .line 118
    invoke-static {v14}, Ll/qa00;->d(F)I

    .line 119
    .line 120
    .line 121
    move-result v14

    .line 122
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    const/high16 v15, 0x41880000    # 17.0f

    .line 127
    .line 128
    invoke-static {v15}, Ll/qa00;->d(F)I

    .line 129
    .line 130
    .line 131
    move-result v15

    .line 132
    invoke-virtual {v12, v4, v14, v3, v15}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 133
    .line 134
    .line 135
    :cond_0
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;->text:Ljava/lang/String;

    .line 136
    .line 137
    invoke-virtual {v12, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    invoke-interface {v10}, Ljava/util/List;->size()I

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    sub-int v4, v3, v0

    .line 145
    .line 146
    new-instance v0, Ll/t2z;

    .line 147
    .line 148
    move/from16 v3, p2

    .line 149
    .line 150
    invoke-direct/range {v0 .. v5}, Ll/t2z;-><init>(Ll/d3z;Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;IILandroid/widget/PopupWindow;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v12, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v9, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v1, v2, v3, v4}, Ll/d3z;->I1(Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;II)V

    .line 160
    .line 161
    .line 162
    move v0, v13

    .line 163
    goto :goto_0

    .line 164
    :cond_1
    return-object v5
.end method

.method public E0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getMessageBarRoot()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getRecoverMatchView()Lv/VButton;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0, v0, v1}, Ll/d3z;->G0(Landroid/view/View;Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/h39;->K()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 39
    .line 40
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {p0, v0, v1}, Ll/d3z;->F1(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public E1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBlockText()Lv/VText;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getInputRoot()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Ll/d3z;->g:Ll/qxy;

    .line 34
    .line 35
    return-void
.end method

.method public F1(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 4
    .line 5
    const-string v1, "dismissed"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeQuickChatConv()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeHeartbeatConv()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_4

    .line 25
    .line 26
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$MessageBarState;->DEFAULT:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$MessageBarState;

    .line 27
    .line 28
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isRiskAuditAvatar()Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-eqz p2, :cond_2

    .line 33
    .line 34
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$MessageBarState;->AVATAR_AUDIT:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$MessageBarState;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-interface {p2}, Ll/r97;->S0()Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-eqz p2, :cond_3

    .line 50
    .line 51
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$MessageBarState;->FAKE_LOCK:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$MessageBarState;

    .line 52
    .line 53
    :cond_3
    :goto_0
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->g(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$MessageBarState;)V

    .line 58
    .line 59
    .line 60
    :cond_4
    :goto_1
    return-void
.end method

.method public G0(Landroid/view/View;Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->x()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_5

    .line 14
    .line 15
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Ll/d3z;->a:Ll/u1z;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v1}, Ll/mzl;->l()Ll/clz;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    const/4 v3, 0x1

    .line 48
    const/4 v4, 0x0

    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 52
    .line 53
    const-string v5, "dismissed"

    .line 54
    .line 55
    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_1

    .line 60
    .line 61
    iget-object v2, p0, Ll/d3z;->a:Ll/u1z;

    .line 62
    .line 63
    invoke-virtual {v2}, Ll/u1z;->F1()Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-nez v2, :cond_1

    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-interface {v0}, Ll/r97;->G1()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_0

    .line 82
    .line 83
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    :cond_0
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    iput-boolean v3, p0, Ll/d3z;->f:Z

    .line 90
    .line 91
    new-instance p1, Ll/a3z;

    .line 92
    .line 93
    invoke-direct {p1, p0}, Ll/a3z;-><init>(Ll/d3z;)V

    .line 94
    .line 95
    .line 96
    invoke-static {p2, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    if-eqz v2, :cond_2

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 107
    .line 108
    const-string v2, "deleted"

    .line 109
    .line 110
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_2

    .line 115
    .line 116
    iget-object p0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->finish()V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_2
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_3

    .line 127
    .line 128
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-nez v0, :cond_4

    .line 133
    .line 134
    :cond_3
    invoke-virtual {p0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->supportInvalidateOptionsMenu()V

    .line 139
    .line 140
    .line 141
    :cond_4
    const/4 v0, 0x0

    .line 142
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 143
    .line 144
    .line 145
    invoke-static {p2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    iput-boolean v4, p0, Ll/d3z;->f:Z

    .line 149
    .line 150
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-interface {p0}, Ll/r97;->G1()Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-eqz p0, :cond_5

    .line 163
    .line 164
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    :cond_5
    return-void
.end method

.method public final G1(Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;I)V
    .locals 3

    .line 1
    const-string v0, "bottom_menu_id"

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v1, "official_account_id"

    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v1, "bottom_menu_x_axis"

    .line 30
    .line 31
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, "bottom_menu_y_axis"

    .line 45
    .line 46
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const-string v2, "bottom_menu_name"

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->text:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    filled-new-array {v0, p0, p2, v1, p1}, [Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p1, "e_official_account_bottom_menu"

    .line 63
    .line 64
    const-string p2, "p_chat_view"

    .line 65
    .line 66
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public H0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->V(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final H1(Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;II)V
    .locals 2

    .line 1
    const-string v0, "bottom_menu_id"

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v1, "official_account_id"

    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v1, "bottom_menu_x_axis"

    .line 30
    .line 31
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    const-string v1, "bottom_menu_y_axis"

    .line 40
    .line 41
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    invoke-static {v1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    const-string v1, "bottom_menu_name"

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;->text:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    filled-new-array {v0, p0, p2, p3, p1}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "e_official_account_bottom_menu"

    .line 62
    .line 63
    const-string p2, "p_chat_view"

    .line 64
    .line 65
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final I0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Ll/clz;->J:Ll/jxd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public final I1(Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;II)V
    .locals 2

    .line 1
    const-string v0, "bottom_menu_id"

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v1, "official_account_id"

    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v1, "bottom_menu_x_axis"

    .line 30
    .line 31
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    const-string v1, "bottom_menu_y_axis"

    .line 40
    .line 41
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    invoke-static {v1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    const-string v1, "bottom_menu_name"

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;->text:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    filled-new-array {v0, p0, p2, p3, p1}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "e_official_account_bottom_menu"

    .line 62
    .line 63
    const-string p2, "p_chat_view"

    .line 64
    .line 65
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public J0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public J1(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Ll/clz;->J:Ll/jxd0;

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public K0(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;I)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const/4 v0, 0x1

    .line 5
    const-wide/16 v1, 0xc8

    .line 6
    .line 7
    if-ne p2, v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/d3z;->a()V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 13
    .line 14
    new-instance v0, Ll/u2z;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1}, Ll/u2z;-><init>(Ll/d3z;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p2, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const/4 v0, 0x2

    .line 24
    if-ne p2, v0, :cond_2

    .line 25
    .line 26
    iget-object p1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 27
    .line 28
    iget-object p2, p0, Ll/d3z;->a:Ll/u1z;

    .line 29
    .line 30
    invoke-virtual {p2}, Ll/j3z;->e0()Ll/mzl;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    iget-object p2, p2, Ll/clz;->b:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->h2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object p0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    const/4 v0, 0x3

    .line 51
    if-ne p2, v0, :cond_3

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/d3z;->a()V

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 57
    .line 58
    new-instance v0, Ll/v2z;

    .line 59
    .line 60
    invoke-direct {v0, p0, p1}, Ll/v2z;-><init>(Ll/d3z;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 61
    .line 62
    .line 63
    invoke-static {p2, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_3
    const/4 p1, 0x4

    .line 68
    if-ne p2, p1, :cond_4

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/d3z;->v1()V

    .line 71
    .line 72
    .line 73
    :cond_4
    :goto_0
    return-void
.end method

.method public K1(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic L0(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/d3z;->h:Z

    .line 3
    .line 4
    return-void
.end method

.method public L1(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/16 v0, 0xf

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->y(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic M0(Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/d3z;->h:Z

    .line 3
    .line 4
    return-void
.end method

.method public final M1(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageMomentGuide;)Landroid/view/View;
    .locals 16
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    iget-object v2, v0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Ll/clz;->t7()Ll/qzz;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Ll/qzz;->p0()Landroid/widget/LinearLayout;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, 0x1

    .line 20
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v2, v0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Ll/clz;->t7()Ll/qzz;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2, v3}, Ll/qzz;->L1(Z)V

    .line 34
    .line 35
    .line 36
    iget-object v2, v0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Ll/clz;->t7()Ll/qzz;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2, v3}, Ll/qzz;->O1(Z)V

    .line 47
    .line 48
    .line 49
    iget-object v2, v0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 50
    .line 51
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2}, Ll/clz;->t7()Ll/qzz;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v2}, Ll/qzz;->d0()V

    .line 60
    .line 61
    .line 62
    iget-object v2, v0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 63
    .line 64
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    sget v4, Ll/qec0;->f1:I

    .line 69
    .line 70
    const/4 v5, 0x0

    .line 71
    const/4 v6, 0x0

    .line 72
    invoke-virtual {v2, v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    const/4 v4, 0x4

    .line 77
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    sget v5, Ll/eac0;->b:I

    .line 85
    .line 86
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimension(I)F

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    iget-object v5, v0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 91
    .line 92
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    invoke-virtual {v5}, Ll/clz;->t7()Ll/qzz;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    invoke-virtual {v5}, Ll/qzz;->p0()Landroid/widget/LinearLayout;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    if-nez v5, :cond_0

    .line 109
    .line 110
    new-instance v5, Ll/w2z;

    .line 111
    .line 112
    invoke-direct {v5, v2, v4}, Ll/w2z;-><init>(Landroid/view/View;F)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v2, v5}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_0
    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 120
    .line 121
    .line 122
    :goto_0
    iget-object v4, v0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 123
    .line 124
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 125
    .line 126
    .line 127
    move-result-object v4

    .line 128
    invoke-virtual {v4}, Ll/clz;->t7()Ll/qzz;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    invoke-virtual {v4}, Ll/qzz;->V1()V

    .line 133
    .line 134
    .line 135
    iget-object v4, v0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 136
    .line 137
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    invoke-virtual {v4}, Ll/clz;->t7()Ll/qzz;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    invoke-virtual {v4}, Ll/qzz;->p0()Landroid/widget/LinearLayout;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 150
    .line 151
    .line 152
    sget v4, Ll/edc0;->E2:I

    .line 153
    .line 154
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    check-cast v4, Lv/VText;

    .line 159
    .line 160
    sget v5, Ll/edc0;->Z:I

    .line 161
    .line 162
    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    check-cast v5, Lv/VText;

    .line 167
    .line 168
    sget v7, Ll/edc0;->r2:I

    .line 169
    .line 170
    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object v7

    .line 174
    move-object v9, v7

    .line 175
    check-cast v9, Lv/VDraweeView;

    .line 176
    .line 177
    sget v7, Ll/edc0;->m3:I

    .line 178
    .line 179
    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 180
    .line 181
    .line 182
    move-result-object v7

    .line 183
    check-cast v7, Lv/VImage;

    .line 184
    .line 185
    sget v8, Ll/edc0;->O:I

    .line 186
    .line 187
    invoke-virtual {v2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 188
    .line 189
    .line 190
    move-result-object v8

    .line 191
    move-object v15, v8

    .line 192
    check-cast v15, Landroid/widget/ImageView;

    .line 193
    .line 194
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 195
    .line 196
    .line 197
    move-result-object v8

    .line 198
    invoke-virtual {v8}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 199
    .line 200
    .line 201
    move-result-object v8

    .line 202
    invoke-interface {v8}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 203
    .line 204
    .line 205
    move-result v8

    .line 206
    if-eqz v8, :cond_1

    .line 207
    .line 208
    iget-object v8, v0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 209
    .line 210
    invoke-virtual {v8}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 211
    .line 212
    .line 213
    move-result-object v8

    .line 214
    sget v10, Ll/g9c0;->g:I

    .line 215
    .line 216
    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getColor(I)I

    .line 217
    .line 218
    .line 219
    move-result v8

    .line 220
    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 221
    .line 222
    .line 223
    iget-object v8, v0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 224
    .line 225
    invoke-virtual {v8}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 226
    .line 227
    .line 228
    move-result-object v8

    .line 229
    sget v10, Ll/g9c0;->i:I

    .line 230
    .line 231
    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getColor(I)I

    .line 232
    .line 233
    .line 234
    move-result v8

    .line 235
    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 236
    .line 237
    .line 238
    sget v8, Ll/ibc0;->I1:I

    .line 239
    .line 240
    invoke-virtual {v15, v8}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 241
    .line 242
    .line 243
    :cond_1
    move-object/from16 v8, p1

    .line 244
    .line 245
    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 246
    .line 247
    .line 248
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->desc:Ljava/lang/String;

    .line 249
    .line 250
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 251
    .line 252
    .line 253
    move-result v4

    .line 254
    if-eqz v4, :cond_2

    .line 255
    .line 256
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->getDefaultContent()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v4

    .line 260
    goto :goto_1

    .line 261
    :cond_2
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->desc:Ljava/lang/String;

    .line 262
    .line 263
    :goto_1
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 264
    .line 265
    .line 266
    invoke-static {v7, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 267
    .line 268
    .line 269
    new-instance v13, Ll/q3d0;

    .line 270
    .line 271
    const/high16 v4, 0x42200000    # 40.0f

    .line 272
    .line 273
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 274
    .line 275
    .line 276
    move-result v5

    .line 277
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 278
    .line 279
    .line 280
    move-result v4

    .line 281
    invoke-direct {v13, v5, v4}, Ll/q3d0;-><init>(II)V

    .line 282
    .line 283
    .line 284
    iget v4, v1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->type:I

    .line 285
    .line 286
    if-ne v4, v3, :cond_3

    .line 287
    .line 288
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 289
    .line 290
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 291
    .line 292
    .line 293
    move-result v4

    .line 294
    if-nez v4, :cond_3

    .line 295
    .line 296
    sget-object v8, Ll/uqb0;->G:Ll/fsb0;

    .line 297
    .line 298
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 299
    .line 300
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 301
    .line 302
    .line 303
    move-result-object v1

    .line 304
    move-object v10, v1

    .line 305
    check-cast v10, Ljava/lang/String;

    .line 306
    .line 307
    const/4 v12, 0x0

    .line 308
    const/4 v14, 0x0

    .line 309
    const/4 v11, 0x1

    .line 310
    invoke-virtual/range {v8 .. v14}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 311
    .line 312
    .line 313
    goto :goto_2

    .line 314
    :cond_3
    iget v4, v1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->type:I

    .line 315
    .line 316
    const/4 v5, 0x2

    .line 317
    if-ne v4, v5, :cond_4

    .line 318
    .line 319
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 320
    .line 321
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 322
    .line 323
    .line 324
    move-result v4

    .line 325
    if-nez v4, :cond_4

    .line 326
    .line 327
    invoke-static {v7, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 328
    .line 329
    .line 330
    sget-object v8, Ll/uqb0;->G:Ll/fsb0;

    .line 331
    .line 332
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 333
    .line 334
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 335
    .line 336
    .line 337
    move-result-object v1

    .line 338
    move-object v10, v1

    .line 339
    check-cast v10, Ljava/lang/String;

    .line 340
    .line 341
    const/4 v12, 0x0

    .line 342
    const/4 v14, 0x0

    .line 343
    const/4 v11, 0x1

    .line 344
    invoke-virtual/range {v8 .. v14}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 345
    .line 346
    .line 347
    :cond_4
    :goto_2
    new-instance v1, Ll/x2z;

    .line 348
    .line 349
    invoke-direct {v1, v0}, Ll/x2z;-><init>(Ll/d3z;)V

    .line 350
    .line 351
    .line 352
    invoke-static {v15, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 353
    .line 354
    .line 355
    return-object v2
.end method

.method public final synthetic N0(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/clz;->O6(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic O0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public O1(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/d3z;->j:I

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic P0(Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 8
    .line 9
    check-cast p1, Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/u1z;->n2(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final P1(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/view/View;
    .locals 11
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/qzz;->p0()Landroid/widget/LinearLayout;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0, v1}, Ll/qzz;->L1(Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0, v1}, Ll/qzz;->O1(Z)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/qzz;->d0()V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget v1, Ll/qec0;->h1:I

    .line 65
    .line 66
    const/4 v2, 0x0

    .line 67
    const/4 v3, 0x0

    .line 68
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const/4 v1, 0x4

    .line 73
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    sget v2, Ll/eac0;->b:I

    .line 81
    .line 82
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    iget-object v2, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 87
    .line 88
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v2}, Ll/clz;->t7()Ll/qzz;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v2}, Ll/qzz;->p0()Landroid/widget/LinearLayout;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    if-nez v2, :cond_0

    .line 105
    .line 106
    new-instance v2, Ll/h2z;

    .line 107
    .line 108
    invoke-direct {v2, v0, v1}, Ll/h2z;-><init>(Landroid/view/View;F)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_0
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 116
    .line 117
    .line 118
    :goto_0
    iget-object v1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v1}, Ll/clz;->t7()Ll/qzz;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {v1}, Ll/qzz;->V1()V

    .line 129
    .line 130
    .line 131
    iget-object v1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 132
    .line 133
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {v1}, Ll/clz;->t7()Ll/qzz;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-virtual {v1}, Ll/qzz;->p0()Landroid/widget/LinearLayout;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    sget v6, Ll/qa00;->i:I

    .line 146
    .line 147
    invoke-virtual {v1, v6, v3, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 148
    .line 149
    .line 150
    iget-object v1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 151
    .line 152
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-virtual {v1}, Ll/clz;->t7()Ll/qzz;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-virtual {v1}, Ll/qzz;->p0()Landroid/widget/LinearLayout;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 165
    .line 166
    .line 167
    sget v1, Ll/edc0;->E2:I

    .line 168
    .line 169
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    check-cast v1, Lv/VText;

    .line 174
    .line 175
    sget v2, Ll/edc0;->Z:I

    .line 176
    .line 177
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    check-cast v2, Lv/VText;

    .line 182
    .line 183
    sget v3, Ll/edc0;->x:I

    .line 184
    .line 185
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    sget v3, Ll/edc0;->g0:I

    .line 190
    .line 191
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    sget v5, Ll/edc0;->O:I

    .line 196
    .line 197
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 198
    .line 199
    .line 200
    move-result-object v5

    .line 201
    check-cast v5, Landroid/widget/ImageView;

    .line 202
    .line 203
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 204
    .line 205
    .line 206
    move-result-object v7

    .line 207
    invoke-virtual {v7}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 208
    .line 209
    .line 210
    move-result-object v7

    .line 211
    invoke-interface {v7}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 212
    .line 213
    .line 214
    move-result v7

    .line 215
    if-eqz v7, :cond_1

    .line 216
    .line 217
    iget-object v7, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 218
    .line 219
    invoke-virtual {v7}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 220
    .line 221
    .line 222
    move-result-object v7

    .line 223
    sget v8, Ll/g9c0;->i:I

    .line 224
    .line 225
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    .line 226
    .line 227
    .line 228
    move-result v7

    .line 229
    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 230
    .line 231
    .line 232
    iget-object v7, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 233
    .line 234
    invoke-virtual {v7}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 235
    .line 236
    .line 237
    move-result-object v7

    .line 238
    sget v8, Ll/g9c0;->g:I

    .line 239
    .line 240
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    .line 241
    .line 242
    .line 243
    move-result v7

    .line 244
    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 245
    .line 246
    .line 247
    sget v7, Ll/ibc0;->N1:I

    .line 248
    .line 249
    invoke-virtual {v3, v7}, Landroid/view/View;->setBackgroundResource(I)V

    .line 250
    .line 251
    .line 252
    sget v3, Ll/ibc0;->I1:I

    .line 253
    .line 254
    invoke-virtual {v5, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 255
    .line 256
    .line 257
    :cond_1
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 261
    .line 262
    .line 263
    new-instance p1, Ll/i2z;

    .line 264
    .line 265
    invoke-direct {p1, p0}, Ll/i2z;-><init>(Ll/d3z;)V

    .line 266
    .line 267
    .line 268
    invoke-static {v5, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 269
    .line 270
    .line 271
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 272
    .line 273
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    invoke-virtual {p0}, Ll/clz;->l3()Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->not:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 286
    .line 287
    if-eq p0, p1, :cond_2

    .line 288
    .line 289
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->i(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 290
    .line 291
    .line 292
    move-result v5

    .line 293
    const/4 v9, 0x0

    .line 294
    const/4 v10, 0x0

    .line 295
    const/4 v7, -0x1

    .line 296
    const/4 v8, 0x0

    .line 297
    invoke-static/range {v4 .. v10}, Ll/zfm;->b(Landroid/view/View;IIIIII)V

    .line 298
    .line 299
    .line 300
    :cond_2
    return-object v0
.end method

.method public final synthetic Q0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object p0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {p2, p0, p1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->l9(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public Q1(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/d3z;->q:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v2, Ll/qec0;->e1:I

    .line 13
    .line 14
    iget-object v3, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 15
    .line 16
    invoke-virtual {v0, v2, v3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/d3z;->q:Landroid/view/View;

    .line 21
    .line 22
    iget-object v2, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 23
    .line 24
    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Ll/r97;->G1()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget-object v2, p0, Ll/d3z;->q:Landroid/view/View;

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    const v0, -0x80809

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 51
    .line 52
    sget v3, Ll/g9c0;->a0:I

    .line 53
    .line 54
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 59
    .line 60
    .line 61
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-interface {v0}, Ll/r97;->t1()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_4

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-interface {v0}, Ll/r97;->G1()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    iget-object v2, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 88
    .line 89
    if-eqz v0, :cond_2

    .line 90
    .line 91
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 108
    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_2
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_3

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_3
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 135
    .line 136
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {p0, v0}, Ll/d3z;->b0(Landroid/view/View;)V

    .line 141
    .line 142
    .line 143
    :cond_4
    :goto_1
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 144
    .line 145
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {p0, v0}, Ll/d3z;->Z(Landroid/view/View;)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 153
    .line 154
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    check-cast v0, Ll/n2;

    .line 167
    .line 168
    invoke-virtual {v0}, Ll/n2;->f()V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 172
    .line 173
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-static {v0}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 178
    .line 179
    .line 180
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-interface {v0}, Ll/r97;->G1()Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    const/4 v2, 0x1

    .line 193
    if-eqz v0, :cond_5

    .line 194
    .line 195
    invoke-virtual {p0, v2}, Ll/d3z;->z1(Z)V

    .line 196
    .line 197
    .line 198
    :cond_5
    iget-object v0, p0, Ll/d3z;->q:Landroid/view/View;

    .line 199
    .line 200
    sget v3, Ll/edc0;->n2:I

    .line 201
    .line 202
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    check-cast v0, Lv/VText;

    .line 207
    .line 208
    iget-object v3, p0, Ll/d3z;->q:Landroid/view/View;

    .line 209
    .line 210
    sget v4, Ll/edc0;->M:I

    .line 211
    .line 212
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v3

    .line 216
    check-cast v3, Lv/VImage;

    .line 217
    .line 218
    const-string v4, "\u201c%s\u201d"

    .line 219
    .line 220
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-static {v4, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 229
    .line 230
    .line 231
    iget-object p1, p0, Ll/d3z;->r:Ljava/lang/Runnable;

    .line 232
    .line 233
    invoke-virtual {v0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 234
    .line 235
    .line 236
    new-instance p1, Ll/d3z$e;

    .line 237
    .line 238
    invoke-direct {p1, p0}, Ll/d3z$e;-><init>(Ll/d3z;)V

    .line 239
    .line 240
    .line 241
    invoke-static {v3, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 242
    .line 243
    .line 244
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 245
    .line 246
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 251
    .line 252
    invoke-static {p1, p0}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    iget p1, p0, Ll/bnl0$g;->a:I

    .line 257
    .line 258
    invoke-static {v0, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 259
    .line 260
    .line 261
    iget p0, p0, Ll/bnl0$g;->c:I

    .line 262
    .line 263
    new-array p1, v2, [Landroid/view/View;

    .line 264
    .line 265
    aput-object v0, p1, v1

    .line 266
    .line 267
    invoke-static {p0, p1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 268
    .line 269
    .line 270
    return-void
.end method

.method public final synthetic R0(Landroid/net/Uri;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u1z;->t2(Landroid/net/Uri;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final R1(Landroid/view/View;)V
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    iput-boolean v1, p0, Ll/d3z;->o:Z

    .line 10
    .line 11
    const/high16 v2, 0x40000000    # 2.0f

    .line 12
    .line 13
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->B(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {p0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->z5:I

    .line 26
    .line 27
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const/high16 v3, 0x40e00000    # 7.0f

    .line 36
    .line 37
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    const/16 v3, 0x4b

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    const v3, -0x181e3

    .line 52
    .line 53
    .line 54
    filled-new-array {v3}, [I

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2, v1}, Lcom/p1/mobile/android/ui/bubble/a;->y(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    const/high16 v3, 0x41500000    # 13.0f

    .line 67
    .line 68
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v2, v1}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const-wide/16 v2, 0x1388

    .line 77
    .line 78
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    new-instance v2, Ll/d2z;

    .line 83
    .line 84
    invoke-direct {v2, p0}, Ll/d2z;-><init>(Ll/d3z;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->j(Lcom/p1/mobile/android/ui/bubble/a$c;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 92
    .line 93
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 94
    .line 95
    or-int/2addr v2, v3

    .line 96
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    new-instance v2, Ll/e2z;

    .line 101
    .line 102
    invoke-direct {v2, p0}, Ll/e2z;-><init>(Ll/d3z;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->N(Lcom/p1/mobile/android/ui/bubble/a$d;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 106
    .line 107
    .line 108
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public final synthetic S0(Landroid/net/Uri;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    .line 6
    .line 7
    filled-new-array {v1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/q2z;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Ll/q2z;-><init>(Ll/d3z;Landroid/net/Uri;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public S1(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    new-instance v0, Ll/cyy;

    .line 22
    .line 23
    new-instance v1, Ll/y2z;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Ll/y2z;-><init>(Ll/d3z;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {v0, v1}, Ll/cyy;-><init>(Ll/x20;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/d3z;->g:Ll/qxy;

    .line 32
    .line 33
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBlockText()Lv/VText;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getInputRoot()Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const/16 v0, 0x8

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    check-cast p0, Ll/n2;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/n2;->d()Z

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void
.end method

.method public final synthetic T0(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Ll/r97;->t1()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p1, :cond_3

    .line 15
    .line 16
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    const/4 v1, 0x1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    return v1

    .line 42
    :cond_0
    const/4 p1, 0x4

    .line 43
    if-eq p2, p1, :cond_1

    .line 44
    .line 45
    const/4 p1, 0x6

    .line 46
    if-eq p2, p1, :cond_1

    .line 47
    .line 48
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    const/16 p1, 0x42

    .line 55
    .line 56
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-ne p1, p2, :cond_2

    .line 61
    .line 62
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_2

    .line 67
    .line 68
    :cond_1
    invoke-virtual {p0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    new-array p2, v0, [Ll/sfj0$a;

    .line 77
    .line 78
    const-string p3, "e_chat_message_send"

    .line 79
    .line 80
    invoke-static {p3, p1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/d3z;->n:Landroid/view/View$OnClickListener;

    .line 84
    .line 85
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-interface {p1, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 92
    .line 93
    .line 94
    :cond_2
    return v1

    .line 95
    :cond_3
    return v0
.end method

.method public T1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/d3z;->z1(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/d3z;->Z(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ll/n2;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/n2;->f()V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic U0(Landroid/view/View;Landroid/view/MotionEvent;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    invoke-static {p1, p2}, Ll/bnl0;->O(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x3

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0}, Ll/mzl;->u0()Ll/g500;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/g500;->d1()V

    .line 23
    .line 24
    .line 25
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    const/4 v0, 0x1

    .line 33
    if-ne p2, v0, :cond_5

    .line 34
    .line 35
    iget-object p2, p0, Ll/d3z;->a:Ll/u1z;

    .line 36
    .line 37
    invoke-virtual {p2}, Ll/j3z;->e0()Ll/mzl;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-interface {p2}, Ll/mzl;->u0()Ll/g500;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p2}, Ll/g500;->b1()Ll/tnw;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 50
    .line 51
    if-eqz p1, :cond_4

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-interface {p1}, Ll/mzl;->u0()Ll/g500;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Ll/j3z;->g0()Ll/iam;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Ll/i500;

    .line 66
    .line 67
    invoke-virtual {p1}, Ll/i500;->q()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_1

    .line 72
    .line 73
    iget-object p1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/android/app/Act;->res:Landroid/content/res/Resources;

    .line 76
    .line 77
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_2

    .line 82
    .line 83
    iget-object p1, p0, Ll/d3z;->a:Ll/u1z;

    .line 84
    .line 85
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p2}, Ll/tnw;->m()Ljava/io/File;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {p2}, Ll/tnw;->s()J

    .line 98
    .line 99
    .line 100
    move-result-wide v1

    .line 101
    long-to-float p2, v1

    .line 102
    const/high16 v1, 0x3f800000    # 1.0f

    .line 103
    .line 104
    mul-float/2addr p2, v1

    .line 105
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 106
    .line 107
    div-float/2addr p2, v1

    .line 108
    const-string v1, "audio/mp3"

    .line 109
    .line 110
    invoke-virtual {p1, v0, v1, p2}, Ll/clz;->M6(Ljava/io/File;Ljava/lang/String;F)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_1
    invoke-virtual {p2}, Ll/tnw;->t()Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-eqz p1, :cond_2

    .line 119
    .line 120
    invoke-virtual {p2}, Ll/tnw;->D()V

    .line 121
    .line 122
    .line 123
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 124
    .line 125
    iget-object p1, p1, Lcom/p1/mobile/android/app/Act;->res:Landroid/content/res/Resources;

    .line 126
    .line 127
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    if-eqz p1, :cond_3

    .line 132
    .line 133
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 134
    .line 135
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-interface {p0}, Ll/mzl;->u0()Ll/g500;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    check-cast p0, Ll/i500;

    .line 148
    .line 149
    invoke-virtual {p0}, Ll/i500;->p()V

    .line 150
    .line 151
    .line 152
    :cond_3
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 153
    .line 154
    return-object p0

    .line 155
    :cond_4
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-interface {p0}, Ll/mzl;->u0()Ll/g500;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {p0}, Ll/g500;->d1()V

    .line 164
    .line 165
    .line 166
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 167
    .line 168
    return-object p0

    .line 169
    :cond_5
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 170
    .line 171
    return-object p0
.end method

.method public U1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/d3z;->Z(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic V0(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {p2, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 16
    .line 17
    const-string p2, "female"

    .line 18
    .line 19
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    const-string p1, "\u5979"

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string p1, "\u4ed6"

    .line 29
    .line 30
    :goto_0
    const-string p2, "\u5728\u7b49\u4f60\u56de\u6d88\u606f"

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0}, Ll/d3z;->T1()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/d3z;->L1(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object p2, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 43
    .line 44
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSpaceHint(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    const/4 p1, 0x0

    .line 52
    iput p1, p0, Ll/d3z;->j:I

    .line 53
    .line 54
    return-void
.end method

.method public V1(Ll/x20;)V
    .locals 1

    .line 1
    new-instance v0, Ll/cyy;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/cyy;-><init>(Ll/x20;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/d3z;->g:Ll/qxy;

    .line 7
    .line 8
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBlockText()Lv/VText;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBlockText()Lv/VText;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string v0, ""

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBlockText()Lv/VText;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Ll/n2;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/n2;->d()Z

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic W0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    new-array v0, v0, [Ll/sfj0$a;

    .line 11
    .line 12
    const-string v1, "e_chat_message_send"

    .line 13
    .line 14
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/d3z;->n:Landroid/view/View$OnClickListener;

    .line 18
    .line 19
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {p1, v0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-interface {p1}, Ll/r97;->h1()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    iget-object p1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->N0:I

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Ll/d3z;->L1(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic X0(Landroid/net/Uri;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u1z;->t2(Landroid/net/Uri;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public X1(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageMomentGuide;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d3z;->M1(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageMomentGuide;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/d3z;->w1(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Y()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/d3z;->h0()Z

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
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->e0:Lrx/subjects/b;

    .line 13
    .line 14
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 20
    .line 21
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->a()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 27
    .line 28
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->f()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/vez;->y0()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 48
    .line 49
    const/4 v1, 0x4

    .line 50
    if-eq v0, v1, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, Ll/n2;

    .line 65
    .line 66
    const/4 v0, -0x1

    .line 67
    invoke-virtual {p0, v1, v0}, Ll/n2;->k(II)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    check-cast p0, Ll/n2;

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/n2;->e()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final synthetic Y0(Landroid/net/Uri;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    .line 6
    .line 7
    filled-new-array {v1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/c2z;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Ll/c2z;-><init>(Ll/d3z;Landroid/net/Uri;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final Y1(Landroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 8

    .line 1
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    new-array v1, v0, [I

    .line 11
    .line 12
    invoke-virtual {p2, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {v2, v3, v3}, Landroid/view/View;->measure(II)V

    .line 21
    .line 22
    .line 23
    new-array v4, v0, [I

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    invoke-virtual {v5, v4}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 30
    .line 31
    .line 32
    aget v1, v1, v3

    .line 33
    .line 34
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    div-int/2addr v3, v0

    .line 39
    add-int/2addr v1, v3

    .line 40
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    div-int/2addr v3, v0

    .line 45
    sub-int/2addr v1, v3

    .line 46
    const/4 v0, 0x1

    .line 47
    aget v3, v4, v0

    .line 48
    .line 49
    const/high16 v4, 0x40a00000    # 5.0f

    .line 50
    .line 51
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    sub-int/2addr v3, v4

    .line 56
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    sub-int/2addr v3, v4

    .line 61
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    add-int/2addr v4, v1

    .line 66
    invoke-static {}, Ll/bnl0;->y0()I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    const/high16 v6, 0x40c00000    # 6.0f

    .line 71
    .line 72
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result v7

    .line 76
    sub-int/2addr v5, v7

    .line 77
    if-le v4, v5, :cond_0

    .line 78
    .line 79
    invoke-static {}, Ll/bnl0;->y0()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    sub-int/2addr v1, v4

    .line 88
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    sub-int/2addr v1, v2

    .line 93
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    iget-object p0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    sget v4, Ll/ibc0;->A5:I

    .line 104
    .line 105
    invoke-virtual {p0, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {v2, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 110
    .line 111
    .line 112
    :cond_0
    const/16 p0, 0x33

    .line 113
    .line 114
    invoke-virtual {p1, p2, p0, v1, v3}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->update()V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public Z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->e()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic Z0(Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;IILandroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/d3z;->H1(Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p4}, Landroid/widget/PopupWindow;->dismiss()V

    .line 5
    .line 6
    .line 7
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;->action:Lcom/p1/mobile/putong/data/OfficialAccountAction;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;->action:Lcom/p1/mobile/putong/data/OfficialAccountAction;

    .line 16
    .line 17
    iget-object p3, p2, Lcom/p1/mobile/putong/data/OfficialAccountAction;->type:Lcom/p1/mobile/putong/data/OfficialAccountActionType;

    .line 18
    .line 19
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OfficialAccountAction;->data:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, p3, p2, p1}, Ll/d3z;->c0(Lcom/p1/mobile/putong/data/OfficialAccountActionType;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public Z1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/qzz;->o0()Landroid/widget/LinearLayout;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/qzz;->o0()Landroid/widget/LinearLayout;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/16 v1, 0x8

    .line 40
    .line 41
    if-ne v0, v1, :cond_0

    .line 42
    .line 43
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/qzz;->o0()Landroid/widget/LinearLayout;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/4 v1, 0x1

    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    const-string v0, "e_picture_1_send"

    .line 62
    .line 63
    const-string v1, "p_chat_view"

    .line 64
    .line 65
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    const-string v0, "e_picture_2_send"

    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    const-string v0, "e_picture_3_send"

    .line 74
    .line 75
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Ll/qzz;->o0()Landroid/widget/LinearLayout;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    sget v1, Ll/edc0;->l5:I

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Landroid/widget/TextView;

    .line 99
    .line 100
    iget-object v1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 101
    .line 102
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v1}, Ll/clz;->t7()Ll/qzz;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v1}, Ll/qzz;->o0()Landroid/widget/LinearLayout;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    sget v2, Ll/edc0;->k5:I

    .line 115
    .line 116
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    check-cast v1, Landroid/widget/TextView;

    .line 121
    .line 122
    iget-object v2, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 123
    .line 124
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {v2}, Ll/clz;->t7()Ll/qzz;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-virtual {v2}, Ll/qzz;->o0()Landroid/widget/LinearLayout;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    sget v3, Ll/edc0;->j5:I

    .line 137
    .line 138
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    check-cast v2, Landroid/widget/TextView;

    .line 143
    .line 144
    new-instance v3, Ll/m2z;

    .line 145
    .line 146
    invoke-direct {v3, p0}, Ll/m2z;-><init>(Ll/d3z;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v0, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 150
    .line 151
    .line 152
    new-instance v0, Ll/n2z;

    .line 153
    .line 154
    invoke-direct {v0, p0}, Ll/n2z;-><init>(Ll/d3z;)V

    .line 155
    .line 156
    .line 157
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 158
    .line 159
    .line 160
    new-instance v0, Ll/o2z;

    .line 161
    .line 162
    invoke-direct {v0, p0}, Ll/o2z;-><init>(Ll/d3z;)V

    .line 163
    .line 164
    .line 165
    invoke-static {v2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 166
    .line 167
    .line 168
    :cond_0
    return-void
.end method

.method public a()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/d3z;->h0()Z

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
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 11
    .line 12
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->V:Z

    .line 13
    .line 14
    const-string v1, "emoji"

    .line 15
    .line 16
    const-string v2, "keyboard"

    .line 17
    .line 18
    const-string v3, "chat_emoji_entrance"

    .line 19
    .line 20
    const-string v4, "p_chat_view"

    .line 21
    .line 22
    const-string v5, "e_chat_emoji_entrance"

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    invoke-static {v3, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v5, v4, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v5, v4, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 46
    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->e0:Lrx/subjects/b;

    .line 53
    .line 54
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    invoke-static {v3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v5, v4, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v3, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v5, v4, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 80
    .line 81
    .line 82
    :goto_0
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 83
    .line 84
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 85
    .line 86
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->a()V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 90
    .line 91
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->f()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ll/d3z;->q0()V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public a0(ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d3z;->C1(ILandroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic a1(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/mzl;->F()Ll/ruy;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/ruy;->r0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public a2()V
    .locals 3

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pb1;->c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->PHONE:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 16
    .line 17
    if-ne v0, p0, :cond_0

    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->s:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->getBusinessMsg()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/qzz;->X1()V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 51
    .line 52
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->a()V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/d3z;->l:Ll/azy;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/azy;->d0()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iget-object v1, p0, Ll/d3z;->l:Ll/azy;

    .line 64
    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    const/4 v0, 0x1

    .line 68
    const/4 v2, 0x0

    .line 69
    invoke-virtual {v1, v0, v2}, Ll/azy;->J(ZZ)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/d3z;->l:Ll/azy;

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/azy;->F0()V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_2
    invoke-virtual {v1}, Ll/azy;->C0()V

    .line 79
    .line 80
    .line 81
    const-string p0, "e_live_camera"

    .line 82
    .line 83
    const-string v0, "p_chat_view"

    .line 84
    .line 85
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/rxy;Landroid/view/View;Z)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/d3z;->h0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_1

    .line 8
    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->d0:Lrx/subjects/b;

    .line 14
    .line 15
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Ll/d3z$g;->a:[I

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/rxy;->d()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    aget v0, v0, v1

    .line 31
    .line 32
    const-string v1, "p_chat_view"

    .line 33
    .line 34
    const/4 v2, 0x2

    .line 35
    const/4 v3, 0x0

    .line 36
    const/4 v4, 0x1

    .line 37
    packed-switch v0, :pswitch_data_0

    .line 38
    .line 39
    .line 40
    goto/16 :goto_1

    .line 41
    .line 42
    :pswitch_0
    invoke-virtual {p0, p1, p2}, Ll/d3z;->u1(Ll/rxy;Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :pswitch_1
    invoke-virtual {p1}, Ll/rxy;->g()Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    iget-object p3, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 51
    .line 52
    check-cast p3, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 53
    .line 54
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->a()V

    .line 55
    .line 56
    .line 57
    xor-int/lit8 p3, p2, 0x1

    .line 58
    .line 59
    invoke-virtual {p1, p3}, Ll/rxy;->i(Z)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 63
    .line 64
    if-eqz p2, :cond_1

    .line 65
    .line 66
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->O()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 73
    .line 74
    iget-object p2, p0, Ll/d3z;->a:Ll/u1z;

    .line 75
    .line 76
    invoke-virtual {p2}, Ll/j3z;->e0()Ll/mzl;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-virtual {p2}, Ll/clz;->r3()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->s0(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    check-cast p0, Ll/n2;

    .line 106
    .line 107
    const/4 p1, -0x1

    .line 108
    invoke-virtual {p0, v3, p1}, Ll/n2;->k(II)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :pswitch_2
    invoke-virtual {p1, v2}, Ll/rxy;->e(I)Z

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    if-eqz p2, :cond_2

    .line 117
    .line 118
    iget-object p2, p0, Ll/d3z;->l:Ll/azy;

    .line 119
    .line 120
    invoke-virtual {p2}, Ll/azy;->D0()V

    .line 121
    .line 122
    .line 123
    :cond_2
    invoke-static {}, Ll/h39;->S()Z

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    if-eqz p2, :cond_3

    .line 128
    .line 129
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    const-string p3, "switchPicBubbleKey"

    .line 134
    .line 135
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/ui/bubble/d;->x(Ljava/lang/String;)Z

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    if-eqz p2, :cond_3

    .line 140
    .line 141
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    :cond_3
    invoke-virtual {p1}, Ll/rxy;->g()Z

    .line 149
    .line 150
    .line 151
    move-result p2

    .line 152
    iget-object p3, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 153
    .line 154
    check-cast p3, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 155
    .line 156
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->a()V

    .line 157
    .line 158
    .line 159
    xor-int/lit8 p3, p2, 0x1

    .line 160
    .line 161
    invoke-virtual {p1, p3}, Ll/rxy;->i(Z)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 165
    .line 166
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 167
    .line 168
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->f()V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p0}, Ll/d3z;->v1()V

    .line 172
    .line 173
    .line 174
    if-eqz p2, :cond_4

    .line 175
    .line 176
    const-string p1, "on"

    .line 177
    .line 178
    goto :goto_0

    .line 179
    :cond_4
    const-string p1, "off"

    .line 180
    .line 181
    :goto_0
    const-string p3, "chat_more_status"

    .line 182
    .line 183
    invoke-static {p3, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    const-string p3, "e_chat_more_button"

    .line 192
    .line 193
    invoke-static {p3, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 194
    .line 195
    .line 196
    if-nez p2, :cond_7

    .line 197
    .line 198
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 199
    .line 200
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    check-cast p0, Ll/n2;

    .line 213
    .line 214
    invoke-virtual {p0}, Ll/n2;->b()Ll/etx;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    if-eqz p1, :cond_7

    .line 223
    .line 224
    invoke-virtual {p0}, Ll/etx;->g()V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :pswitch_3
    invoke-virtual {p1, v2}, Ll/rxy;->e(I)Z

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    if-eqz p1, :cond_5

    .line 233
    .line 234
    iget-object p1, p0, Ll/d3z;->l:Ll/azy;

    .line 235
    .line 236
    invoke-virtual {p1}, Ll/azy;->G0()V

    .line 237
    .line 238
    .line 239
    :cond_5
    invoke-virtual {p0}, Ll/d3z;->v0()V

    .line 240
    .line 241
    .line 242
    return-void

    .line 243
    :pswitch_4
    const-string p1, "e_chat_more_picture"

    .line 244
    .line 245
    new-array p2, v3, [Ll/sfj0$a;

    .line 246
    .line 247
    invoke-static {p1, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 248
    .line 249
    .line 250
    iget-object p1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 251
    .line 252
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 253
    .line 254
    .line 255
    move-result-object p2

    .line 256
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 257
    .line 258
    .line 259
    move-result-object p3

    .line 260
    const/4 v0, 0x6

    .line 261
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 262
    .line 263
    .line 264
    move-result-object p3

    .line 265
    invoke-virtual {p3, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->showPreviewEditBtn(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 266
    .line 267
    .line 268
    move-result-object p3

    .line 269
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 270
    .line 271
    .line 272
    move-result-object p3

    .line 273
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 274
    .line 275
    .line 276
    move-result-object p2

    .line 277
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 278
    .line 279
    .line 280
    move-result-object p3

    .line 281
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->canClickSubmitInPreviewWhenNoSelectedMedia()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 282
    .line 283
    .line 284
    move-result-object p3

    .line 285
    invoke-virtual {p3, v4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 286
    .line 287
    .line 288
    move-result-object p3

    .line 289
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 290
    .line 291
    .line 292
    move-result-object p3

    .line 293
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withVideoPickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 294
    .line 295
    .line 296
    move-result-object p2

    .line 297
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->needAllSelectedMediaPreview()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 298
    .line 299
    .line 300
    move-result-object p2

    .line 301
    iget-object p3, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 302
    .line 303
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->h:I

    .line 304
    .line 305
    invoke-virtual {p3, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object p3

    .line 309
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withSubmitButtonTitle(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 310
    .line 311
    .line 312
    move-result-object p2

    .line 313
    const/4 p3, 0x4

    .line 314
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 315
    .line 316
    .line 317
    move-result-object p2

    .line 318
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 319
    .line 320
    .line 321
    move-result-object p2

    .line 322
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 323
    .line 324
    .line 325
    move-result-object p2

    .line 326
    const/16 p3, 0x312

    .line 327
    .line 328
    invoke-virtual {p1, p2, p3}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 329
    .line 330
    .line 331
    iget-object p1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 332
    .line 333
    sget p2, Ll/y7c0;->e:I

    .line 334
    .line 335
    sget p3, Ll/y7c0;->a:I

    .line 336
    .line 337
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 338
    .line 339
    .line 340
    iget-object p1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 341
    .line 342
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    iget-object p0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 347
    .line 348
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 349
    .line 350
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object p0

    .line 354
    const-string p2, "photo"

    .line 355
    .line 356
    invoke-static {p1, p0, p2}, Ll/m600;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 357
    .line 358
    .line 359
    return-void

    .line 360
    :pswitch_5
    invoke-virtual {p1}, Ll/rxy;->g()Z

    .line 361
    .line 362
    .line 363
    move-result p2

    .line 364
    iget-object p3, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 365
    .line 366
    check-cast p3, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 367
    .line 368
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->a()V

    .line 369
    .line 370
    .line 371
    xor-int/2addr p2, v4

    .line 372
    invoke-virtual {p1, p2}, Ll/rxy;->i(Z)V

    .line 373
    .line 374
    .line 375
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 376
    .line 377
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 378
    .line 379
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->f()V

    .line 380
    .line 381
    .line 382
    invoke-virtual {p0}, Ll/d3z;->q0()V

    .line 383
    .line 384
    .line 385
    const-string p0, "e_chat_emoji_button"

    .line 386
    .line 387
    new-array p1, v3, [Ll/sfj0$a;

    .line 388
    .line 389
    invoke-static {p0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 390
    .line 391
    .line 392
    return-void

    .line 393
    :pswitch_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 394
    .line 395
    .line 396
    move-result-object p1

    .line 397
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 398
    .line 399
    .line 400
    move-result-object p1

    .line 401
    invoke-interface {p1}, Ll/r97;->v1()Z

    .line 402
    .line 403
    .line 404
    move-result p1

    .line 405
    if-eqz p1, :cond_6

    .line 406
    .line 407
    invoke-virtual {p0, p2}, Ll/d3z;->R1(Landroid/view/View;)V

    .line 408
    .line 409
    .line 410
    :cond_6
    invoke-virtual {p0}, Ll/d3z;->a2()V

    .line 411
    .line 412
    .line 413
    return-void

    .line 414
    :pswitch_7
    invoke-virtual {p1, v2}, Ll/rxy;->e(I)Z

    .line 415
    .line 416
    .line 417
    move-result p1

    .line 418
    if-eqz p1, :cond_8

    .line 419
    .line 420
    if-nez p3, :cond_7

    .line 421
    .line 422
    iget-object p0, p0, Ll/d3z;->l:Ll/azy;

    .line 423
    .line 424
    invoke-virtual {p0, v4}, Ll/azy;->I(Z)V

    .line 425
    .line 426
    .line 427
    :cond_7
    :goto_1
    return-void

    .line 428
    :cond_8
    if-eqz p3, :cond_9

    .line 429
    .line 430
    invoke-virtual {p0}, Ll/d3z;->B1()V

    .line 431
    .line 432
    .line 433
    return-void

    .line 434
    :cond_9
    invoke-virtual {p0, p2}, Ll/d3z;->g0(Landroid/view/View;)V

    .line 435
    .line 436
    .line 437
    return-void

    .line 438
    nop

    .line 439
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public b0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b2(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d3z;->P1(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/d3z;->w1(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d3z;->h0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object p0, Ll/d3z$g;->a:[I

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    aget p0, p0, p1

    .line 15
    .line 16
    return-void
.end method

.method public final c0(Lcom/p1/mobile/putong/data/OfficialAccountActionType;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, -0x1

    .line 13
    sparse-switch v0, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :sswitch_0
    const-string v0, "click"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v1, 0x2

    .line 27
    goto :goto_0

    .line 28
    :sswitch_1
    const-string v0, "text"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v1, 0x1

    .line 38
    goto :goto_0

    .line 39
    :sswitch_2
    const-string v0, "schema"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/4 v1, 0x0

    .line 49
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :pswitch_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 56
    .line 57
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p1, p0, p3}, Lcom/p1/mobile/putong/core/api/g;->Ko(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :pswitch_1
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0, p2}, Ll/clz;->S6(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :pswitch_2
    const-string p1, "tel:"

    .line 90
    .line 91
    invoke-virtual {p2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_3

    .line 96
    .line 97
    new-instance p1, Landroid/content/Intent;

    .line 98
    .line 99
    const-string p3, "android.intent.action.DIAL"

    .line 100
    .line 101
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    invoke-direct {p1, p3, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 109
    .line 110
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    invoke-interface {p1, p0, p2}, Ll/r97;->Y(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    nop

    .line 135
    :sswitch_data_0
    .sparse-switch
        -0x361eca5f -> :sswitch_2
        0x36452d -> :sswitch_1
        0x5a5c588 -> :sswitch_0
    .end sparse-switch

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public c2(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->MENU_ENTER:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v2, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->d(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v2, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 18
    .line 19
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->a()V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 23
    .line 24
    invoke-virtual {v2, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->h(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;Z)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->a()V

    .line 29
    .line 30
    .line 31
    :goto_0
    if-eqz p1, :cond_3

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    if-eq p1, v0, :cond_2

    .line 35
    .line 36
    const/4 v1, 0x2

    .line 37
    if-eq p1, v1, :cond_3

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    if-eq p1, v1, :cond_1

    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 44
    .line 45
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->MORE:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 46
    .line 47
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->h(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;Z)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 52
    .line 53
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->EMOJI:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 54
    .line 55
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->h(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;Z)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_3
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->f()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public d0(Ll/u1z;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic d1(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/n2;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/n2;->a()Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget p1, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->four:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 24
    .line 25
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    if-lt p1, v0, :cond_0

    .line 29
    .line 30
    const/4 p1, 0x2

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->second:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 33
    .line 34
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 35
    .line 36
    if-lt p1, v0, :cond_1

    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move p1, v1

    .line 41
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 54
    .line 55
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-lt v0, p1, :cond_2

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->j:Lv/VList_Horizontal;

    .line 66
    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 68
    .line 69
    invoke-virtual {v2}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v2}, Ll/cf60;->getCount()I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    sub-int/2addr v2, p1

    .line 78
    invoke-virtual {v0, v2}, Lv/VList_Horizontal;->setSelection(I)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 82
    .line 83
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    sub-int/2addr v0, p1

    .line 92
    invoke-virtual {p0, v0, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 93
    .line 94
    .line 95
    :cond_2
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d3z;->u:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/d3z;->u:Landroid/animation/Animator;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Ll/d3z;->u:Landroid/animation/Animator;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/d3z;->v:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/d3z;->v:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Ll/d3z;->u:Landroid/animation/Animator;

    .line 31
    .line 32
    :cond_1
    iget-object p0, p0, Ll/d3z;->i:Ll/kcg0;

    .line 33
    .line 34
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public e0(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getMessageBarRoot()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getRecoverMatchView()Lv/VButton;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_7

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_1

    .line 34
    .line 35
    goto/16 :goto_1

    .line 36
    .line 37
    :cond_1
    iget v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    const/4 v4, 0x1

    .line 41
    if-lez v2, :cond_2

    .line 42
    .line 43
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-interface {v2, p1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->nl(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_6

    .line 63
    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v2}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-interface {v2, p1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->X7(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-nez v2, :cond_3

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 80
    .line 81
    const/4 v2, 0x3

    .line 82
    if-ge p1, v2, :cond_4

    .line 83
    .line 84
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_4
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_5

    .line 96
    .line 97
    invoke-virtual {v1}, Landroid/view/View;->getAlpha()F

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    const/high16 v2, 0x3f800000    # 1.0f

    .line 102
    .line 103
    cmpl-float p1, p1, v2

    .line 104
    .line 105
    if-eqz p1, :cond_5

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_5
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 109
    .line 110
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    check-cast p0, Ll/n2;

    .line 123
    .line 124
    invoke-virtual {p0}, Ll/n2;->d()Z

    .line 125
    .line 126
    .line 127
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {p0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->wo()V

    .line 136
    .line 137
    .line 138
    sget p0, Ll/ibc0;->T0:I

    .line 139
    .line 140
    invoke-virtual {v1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 141
    .line 142
    .line 143
    const p0, 0x3f19999a    # 0.6f

    .line 144
    .line 145
    .line 146
    invoke-virtual {v1, p0}, Landroid/view/View;->setAlpha(F)V

    .line 147
    .line 148
    .line 149
    sget p0, Ll/qa00;->v:I

    .line 150
    .line 151
    invoke-static {v1, p0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 152
    .line 153
    .line 154
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->s3:I

    .line 155
    .line 156
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 157
    .line 158
    .line 159
    new-instance p0, Ll/f2z;

    .line 160
    .line 161
    invoke-direct {p0}, Ll/f2z;-><init>()V

    .line 162
    .line 163
    .line 164
    invoke-static {v1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 165
    .line 166
    .line 167
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 168
    .line 169
    .line 170
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_6
    :goto_0
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 175
    .line 176
    .line 177
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 178
    .line 179
    .line 180
    :cond_7
    :goto_1
    return-void
.end method

.method public final synthetic e1(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/n2;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/n2;->a()Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget p1, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->four:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 24
    .line 25
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    if-lt p1, v0, :cond_0

    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move p1, v1

    .line 33
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-lt v0, p1, :cond_1

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->j:Lv/VList_Horizontal;

    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 60
    .line 61
    invoke-virtual {v2}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2}, Ll/cf60;->getCount()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    sub-int/2addr v2, p1

    .line 70
    invoke-virtual {v0, v2}, Lv/VList_Horizontal;->setSelection(I)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 74
    .line 75
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    sub-int/2addr v0, p1

    .line 84
    invoke-virtual {p0, v0, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 85
    .line 86
    .line 87
    :cond_1
    return-void
.end method

.method public f0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->SHI_PAI:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->b(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/d3z;->I0()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    iget-boolean v1, p0, Ll/d3z;->o:Z

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/d3z;->R1(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final synthetic f1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1, v0}, Ll/o3z;->o(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const-string v1, "chat_page_enter_text"

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, ""

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    invoke-virtual {p0, v1, v0, v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->T2(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-interface {v0, p0, v1}, Ll/r97;->showProofAgeDlg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final g0(Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pb1;->c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->PHONE:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 16
    .line 17
    if-ne v0, p0, :cond_0

    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->E3:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->getBusinessMsg()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :goto_0
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 35
    .line 36
    iget-object v1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 37
    .line 38
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "audio_tips_key"

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const/high16 v1, 0x40000000    # 2.0f

    .line 51
    .line 52
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->B(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object v3, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 61
    .line 62
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->g1:I

    .line 63
    .line 64
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const/high16 v3, 0x40e00000    # 7.0f

    .line 73
    .line 74
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    const/high16 v3, 0x41200000    # 10.0f

    .line 83
    .line 84
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    const/16 v3, 0x4b

    .line 93
    .line 94
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    const-wide/16 v3, 0xbb8

    .line 99
    .line 100
    invoke-virtual {v1, v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    const/4 v3, 0x1

    .line 105
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->M(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    new-instance v3, Ll/j2z;

    .line 110
    .line 111
    invoke-direct {v3, p0}, Ll/j2z;-><init>(Ll/d3z;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->N(Lcom/p1/mobile/android/ui/bubble/a$d;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    new-instance v3, Ll/k2z;

    .line 119
    .line 120
    invoke-direct {v3, p0}, Ll/k2z;-><init>(Ll/d3z;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->j(Lcom/p1/mobile/android/ui/bubble/a$c;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 128
    .line 129
    sget v4, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 130
    .line 131
    or-int/2addr v3, v4

    .line 132
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 133
    .line 134
    .line 135
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-eqz v1, :cond_2

    .line 148
    .line 149
    iget-object p0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 150
    .line 151
    sget v1, Ll/g9c0;->j:I

    .line 152
    .line 153
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 154
    .line 155
    .line 156
    move-result p0

    .line 157
    filled-new-array {p0}, [I

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 162
    .line 163
    .line 164
    :cond_2
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-virtual {p0, v0, p1, v2}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method public final h0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d3z;->g:Ll/qxy;

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
    iget-object p0, p0, Ll/d3z;->g:Ll/qxy;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/qxy;->a()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final synthetic h1(Ll/uxj0;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/d3z;->l:Ll/azy;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/d3z;->l:Ll/azy;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/azy;->d0()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/d3z;->l:Ll/azy;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/azy;->G()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p1, p0, Ll/d3z;->a:Ll/u1z;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ll/c3z;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/c3z;-><init>(Ll/d3z;)V

    .line 40
    .line 41
    .line 42
    const-wide/16 v1, 0x96

    .line 43
    .line 44
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public i0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Ll/d3z;->q:Landroid/view/View;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    iput-object v2, p0, Ll/d3z;->q:Landroid/view/View;

    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, v2}, Ll/clz;->K6(Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d3z;->d0(Ll/u1z;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/qec0;->g1:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 9
    .line 10
    iput-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Ll/r97;->E()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Ll/d3z;->a:Ll/u1z;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Ll/clz;->e4()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->w()V

    .line 49
    .line 50
    .line 51
    :cond_0
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 52
    .line 53
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 54
    .line 55
    if-eqz p1, :cond_2

    .line 56
    .line 57
    iget-object p1, p0, Ll/d3z;->a:Ll/u1z;

    .line 58
    .line 59
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isBusinessAI1V1(Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_1

    .line 76
    .line 77
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 78
    .line 79
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 80
    .line 81
    const/4 p2, 0x1

    .line 82
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->Q(Z)V

    .line 83
    .line 84
    .line 85
    :cond_1
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 86
    .line 87
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 88
    .line 89
    iget-object p2, p0, Ll/d3z;->a:Ll/u1z;

    .line 90
    .line 91
    invoke-virtual {p2}, Ll/j3z;->e0()Ll/mzl;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-virtual {p2}, Ll/clz;->r3()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 104
    .line 105
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v0}, Ll/clz;->e4()Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    invoke-static {p2, v0}, Ll/uxy;->b(Ljava/lang/String;Z)Ljava/util/List;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->S(Ljava/util/List;Ll/dyy;)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 125
    .line 126
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getRecordLayout()Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    iget-object p2, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 131
    .line 132
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getInputContent()Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->setInputRootLayout(Landroid/view/View;)V

    .line 137
    .line 138
    .line 139
    new-instance p1, Ll/azy;

    .line 140
    .line 141
    iget-object p2, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 142
    .line 143
    check-cast p2, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 144
    .line 145
    invoke-direct {p1, p2, p0}, Ll/azy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Ll/d3z;)V

    .line 146
    .line 147
    .line 148
    iput-object p1, p0, Ll/d3z;->l:Ll/azy;

    .line 149
    .line 150
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 151
    .line 152
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 153
    .line 154
    new-instance p2, Ll/v1z;

    .line 155
    .line 156
    invoke-direct {p2, p0}, Ll/v1z;-><init>(Ll/d3z;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->t0(Ll/y20;)V

    .line 160
    .line 161
    .line 162
    :cond_2
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 163
    .line 164
    return-object p0
.end method

.method public j0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/mzl;->x0()Ll/hi40;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/ki40;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBarWrapper()Landroid/widget/FrameLayout;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v0, v0, Ll/ki40;->a:Lv/VLinear;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setFocusable(Z)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic j1(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->getAtIdList()Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v2, p0, Ll/d3z;->a:Ll/u1z;

    .line 32
    .line 33
    invoke-virtual {v2, v0, v1}, Ll/u1z;->q2(Landroid/text/Editable;Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ll/clz;->Y2()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/clz;->F6()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Ll/d3z;->S1(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const/4 p1, 0x0

    .line 59
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method public k0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/qzz;->V1()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/qzz;->p0()Landroid/widget/LinearLayout;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0, v1}, Ll/qzz;->L1(Z)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0, v1}, Ll/qzz;->O1(Z)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const/4 v1, 0x0

    .line 69
    invoke-virtual {v0, v1}, Ll/clz;->c7(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0, v1}, Ll/clz;->d7(Lcom/p1/mobile/putong/core/data/MessageMomentGuide;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final synthetic k1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/n2;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/n2;->f()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public l0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/vez;->y0()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Ll/d3z;->a:Ll/u1z;

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    if-eq v0, v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ll/n2;

    .line 33
    .line 34
    const/4 v1, -0x1

    .line 35
    invoke-virtual {v0, v2, v1}, Ll/n2;->k(II)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v1, p0, Ll/d3z;->a:Ll/u1z;

    .line 45
    .line 46
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-interface {v1}, Ll/mzl;->l()Ll/clz;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1}, Ll/clz;->r3()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const-string v2, "emoji"

    .line 59
    .line 60
    invoke-static {v0, v1, v2}, Ll/m600;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Ll/n2;

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/n2;->f()V

    .line 79
    .line 80
    .line 81
    :goto_0
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const/4 v0, 0x0

    .line 96
    invoke-virtual {p0, v0}, Ll/qzz;->y0(Z)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final synthetic l1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d3z;->k0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/d3z;->d:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic m1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d3z;->k0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d3z;->B1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n1(Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/d3z;->o:Z

    .line 3
    .line 4
    return-void
.end method

.method public o0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getRecordLayout()Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->e()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic o1(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/d3z;->J1(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public p0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/d3z;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/d3z;->h:Z

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string v0, "audio_tips_key"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic p1(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/d3z;->X()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, ""

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->S2(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final q0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/h39;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "switchPicBubbleKey"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->x(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-virtual {p0}, Ll/d3z;->l0()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ll/n2;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/n2;->a()Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v1, p0, Ll/d3z;->l:Ll/azy;

    .line 50
    .line 51
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    iget-object v1, p0, Ll/d3z;->l:Ll/azy;

    .line 58
    .line 59
    invoke-virtual {v1}, Ll/azy;->d0()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_1

    .line 64
    .line 65
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 66
    .line 67
    const/4 v2, 0x0

    .line 68
    invoke-virtual {v1, v2}, Lv/VPager;->setScrollble(Z)V

    .line 69
    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Ll/d3z;->l:Ll/azy;

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/azy;->D0()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_1
    iget-object p0, v0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 83
    .line 84
    const/4 v0, 0x1

    .line 85
    invoke-virtual {p0, v0}, Lv/VPager;->setScrollble(Z)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final synthetic q1(Landroid/view/View;)V
    .locals 4

    .line 1
    const-string p1, "e_picture_1_send"

    .line 2
    .line 3
    const-string v0, "p_chat_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/d3z;->a:Ll/u1z;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->getAtIdList()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Ll/d3z;->a:Ll/u1z;

    .line 29
    .line 30
    new-instance v2, Landroid/text/SpannableStringBuilder;

    .line 31
    .line 32
    const-string v3, "[\u6697\u4e2d\u89c2\u5bdf]"

    .line 33
    .line 34
    invoke-direct {v2, v3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v2, v0}, Ll/u1z;->q2(Landroid/text/Editable;Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ll/clz;->Y2()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const/4 v1, 0x0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/clz;->F6()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Ll/d3z;->S1(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 64
    .line 65
    .line 66
    :cond_0
    iget-object p1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->N0:I

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p0, p1}, Ll/d3z;->L1(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Ll/qzz;->o0()Landroid/widget/LinearLayout;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public r0()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3z;->s:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic r1(Landroid/view/View;)V
    .locals 4

    .line 1
    const-string p1, "e_picture_2_send"

    .line 2
    .line 3
    const-string v0, "p_chat_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/d3z;->a:Ll/u1z;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->getAtIdList()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Ll/d3z;->a:Ll/u1z;

    .line 29
    .line 30
    new-instance v2, Landroid/text/SpannableStringBuilder;

    .line 31
    .line 32
    const-string v3, "[\u6446\u624b]"

    .line 33
    .line 34
    invoke-direct {v2, v3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v2, v0}, Ll/u1z;->q2(Landroid/text/Editable;Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ll/clz;->Y2()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const/4 v1, 0x0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/clz;->F6()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Ll/d3z;->S1(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 64
    .line 65
    .line 66
    :cond_0
    iget-object p1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->N0:I

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p0, p1}, Ll/d3z;->L1(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Ll/qzz;->o0()Landroid/widget/LinearLayout;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public s0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic s1(Landroid/view/View;)V
    .locals 4

    .line 1
    const-string p1, "e_picture_3_send"

    .line 2
    .line 3
    const-string v0, "p_chat_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/d3z;->a:Ll/u1z;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->getAtIdList()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Ll/d3z;->a:Ll/u1z;

    .line 29
    .line 30
    new-instance v2, Landroid/text/SpannableStringBuilder;

    .line 31
    .line 32
    const-string v3, "[\u563f\u54c8]"

    .line 33
    .line 34
    invoke-direct {v2, v3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v2, v0}, Ll/u1z;->q2(Landroid/text/Editable;Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ll/clz;->Y2()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const/4 v1, 0x0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/clz;->F6()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Ll/d3z;->S1(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 64
    .line 65
    .line 66
    :cond_0
    iget-object p1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->N0:I

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p0, p1}, Ll/d3z;->L1(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Ll/qzz;->o0()Landroid/widget/LinearLayout;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    return-object p0
.end method

.method public t1(Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Ll/cyy;

    .line 6
    .line 7
    new-instance v2, Ll/p2z;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/p2z;-><init>(Ll/d3z;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p1, v2}, Ll/cyy;-><init>(Ll/x20;)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/d3z;->g:Ll/qxy;

    .line 16
    .line 17
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBlockText()Lv/VText;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBlockText()Lv/VText;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v2, ""

    .line 33
    .line 34
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBlockText()Lv/VText;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getInputRoot()Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {p1, v1}, Ll/bnl0;->B(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 65
    .line 66
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    check-cast p0, Ll/n2;

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/n2;->d()Z

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_0
    iget-object p1, p0, Ll/d3z;->a:Ll/u1z;

    .line 96
    .line 97
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p1}, Ll/clz;->Y2()Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_1

    .line 110
    .line 111
    iget-object p1, p0, Ll/d3z;->a:Ll/u1z;

    .line 112
    .line 113
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p1}, Ll/clz;->F6()V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Ll/d3z;->a:Ll/u1z;

    .line 125
    .line 126
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p0, p1}, Ll/d3z;->S1(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_1
    iput-object v0, p0, Ll/d3z;->g:Ll/qxy;

    .line 143
    .line 144
    iget-object p1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 145
    .line 146
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBlockText()Lv/VText;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    const/16 v0, 0x8

    .line 151
    .line 152
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 153
    .line 154
    .line 155
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 156
    .line 157
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getInputRoot()Landroid/view/View;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method public u0()Ll/azy;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3z;->l:Ll/azy;

    .line 2
    .line 3
    return-object p0
.end method

.method public final u1(Ll/rxy;Landroid/view/View;)V
    .locals 2

    .line 1
    instance-of v0, p1, Ll/xxy;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    check-cast p1, Ll/xxy;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/xxy;->l()Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->localMenus:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/xxy;->m()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p0, v0, v1}, Ll/d3z;->G1(Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->localMenus:Ljava/util/List;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/xxy;->m()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-virtual {p0, v0, p1}, Ll/d3z;->D0(Ljava/util/List;I)Landroid/widget/PopupWindow;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1, p2}, Ll/d3z;->Y1(Landroid/widget/PopupWindow;Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object p2, v0, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->action:Lcom/p1/mobile/putong/data/OfficialAccountAction;

    .line 41
    .line 42
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-eqz p2, :cond_1

    .line 47
    .line 48
    invoke-virtual {p1}, Ll/xxy;->m()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    invoke-virtual {p0, v0, p1}, Ll/d3z;->G1(Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;I)V

    .line 53
    .line 54
    .line 55
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->action:Lcom/p1/mobile/putong/data/OfficialAccountAction;

    .line 56
    .line 57
    iget-object p2, p1, Lcom/p1/mobile/putong/data/OfficialAccountAction;->type:Lcom/p1/mobile/putong/data/OfficialAccountActionType;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OfficialAccountAction;->data:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->id:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p0, p2, p1, v0}, Ll/d3z;->c0(Lcom/p1/mobile/putong/data/OfficialAccountActionType;Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    invoke-virtual {p1}, Ll/xxy;->m()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    invoke-virtual {p0, v0, p1}, Ll/d3z;->G1(Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;I)V

    .line 72
    .line 73
    .line 74
    :cond_2
    return-void
.end method

.method public final v0()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/d3z;->r0()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/d3z;->r0()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/d3z;->r0()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-interface {v0}, Ll/r97;->k0()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v1, p0, Ll/d3z;->a:Ll/u1z;

    .line 59
    .line 60
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-interface {v1}, Ll/mzl;->d0()Ll/vez;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v1}, Ll/vez;->y0()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    const/4 v2, 0x2

    .line 73
    if-ne v1, v2, :cond_2

    .line 74
    .line 75
    const-string v1, "show"

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    const-string v1, "hide"

    .line 79
    .line 80
    :goto_0
    const-string v2, "chat_keyboard_status"

    .line 81
    .line 82
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    filled-new-array {v1}, [Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    const-string v2, "e_chat_gift_icon"

    .line 91
    .line 92
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 93
    .line 94
    .line 95
    :cond_3
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 96
    .line 97
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Ll/n2;

    .line 110
    .line 111
    invoke-virtual {v0}, Ll/n2;->d()Z

    .line 112
    .line 113
    .line 114
    iget-object v1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 115
    .line 116
    const-string v0, "chat"

    .line 117
    .line 118
    invoke-static {v0}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    new-instance v3, Ll/l2z;

    .line 123
    .line 124
    invoke-direct {v3, p0}, Ll/l2z;-><init>(Ll/d3z;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 128
    .line 129
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    iget-object p0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    const/4 v6, 0x0

    .line 148
    invoke-static/range {v1 .. v6}, Ll/vvj;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/CoreGiftPanelName;Ll/y20;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public final v1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/vez;->y0()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x3

    .line 16
    if-eq v0, v1, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v2, p0, Ll/d3z;->a:Ll/u1z;

    .line 25
    .line 26
    invoke-virtual {v2}, Ll/j3z;->e0()Ll/mzl;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-interface {v2}, Ll/mzl;->l()Ll/clz;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ll/clz;->r3()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    const-string v3, "more"

    .line 39
    .line 40
    invoke-static {v0, v2, v3}, Ll/m600;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Ll/n2;

    .line 58
    .line 59
    const/4 v2, -0x1

    .line 60
    invoke-virtual {v0, v1, v2}, Ll/n2;->k(II)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    iget-object v0, p0, Ll/d3z;->a:Ll/u1z;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Ll/n2;

    .line 79
    .line 80
    invoke-virtual {v0}, Ll/n2;->f()V

    .line 81
    .line 82
    .line 83
    :goto_0
    iget-object p0, p0, Ll/d3z;->a:Ll/u1z;

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    const/4 v0, 0x0

    .line 98
    invoke-virtual {p0, v0}, Ll/qzz;->y0(Z)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final w0(Landroid/content/Intent;)V
    .locals 1

    .line 1
    const-string v0, "android.intent.extra.TEXT"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/d3z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 17
    .line 18
    new-instance v0, Ll/s2z;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/s2z;-><init>(Ll/d3z;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final w1(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->t1()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_3

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Ll/r97;->G1()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v1, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Ll/d3z;->y1(Landroid/view/View;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_2

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p0, v0}, Ll/d3z;->b0(Landroid/view/View;)V

    .line 94
    .line 95
    .line 96
    :cond_3
    :goto_0
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p0, v0}, Ll/d3z;->Z(Landroid/view/View;)V

    .line 103
    .line 104
    .line 105
    new-instance v0, Ll/b3z;

    .line 106
    .line 107
    invoke-direct {v0, p0}, Ll/b3z;-><init>(Ll/d3z;)V

    .line 108
    .line 109
    .line 110
    const-wide/16 v1, 0x32

    .line 111
    .line 112
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public x0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d3z;->e:Landroid/view/View;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/d3z;->e:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/d3z;->d:Landroid/view/View;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/d3z;->d:Landroid/view/View;

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public y0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->R()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public y1(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/d3z;->l:Ll/azy;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/d3z;->l:Ll/azy;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/azy;->d0()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-void

    .line 21
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/d3z;->m0()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public z0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    and-int/2addr p1, v0

    .line 20
    iget-object p0, p0, Ll/d3z;->k:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->z(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public z1(Z)V
    .locals 0

    .line 1
    return-void
.end method
