.class public Ll/aop;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/aop$f;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/gnp;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public b:Lv/AutoVDraweeView;

.field public c:Lv/navigationbar/VNavigationBar;

.field public d:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

.field public f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/bottom/IntlAlphaTransformerViewPager;

.field public g:Landroid/widget/FrameLayout;

.field public h:Landroid/view/View;

.field public i:Lcom/tantan/library/svga/SVGAnimationView;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lcom/p1/mobile/putong/app/PutongFrag;

.field public m:Ll/gnp;

.field public n:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

.field public o:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public p:Ll/d5n;

.field public q:Landroid/view/View;

.field public r:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/ViewGroup;",
            ">;"
        }
    .end annotation
.end field

.field public s:Ljava/lang/String;

.field public t:Z

.field public final u:Ljava/lang/Runnable;

.field public v:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public w:Landroid/view/animation/Interpolator;

.field public x:Ll/kcg0;

.field public y:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/aop;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/aop;->r:Ljava/util/ArrayList;

    .line 13
    .line 14
    const-string v0, ""

    .line 15
    .line 16
    iput-object v0, p0, Ll/aop;->s:Ljava/lang/String;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/aop;->t:Z

    .line 20
    .line 21
    new-instance v0, Ll/aop$a;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/aop$a;-><init>(Ll/aop;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/aop;->u:Ljava/lang/Runnable;

    .line 27
    .line 28
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 29
    .line 30
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/aop;->w:Landroid/view/animation/Interpolator;

    .line 34
    .line 35
    new-instance v0, Ll/aop$d;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/aop$d;-><init>(Ll/aop;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/aop;->y:Ll/y20;

    .line 41
    .line 42
    iput-object p1, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 43
    .line 44
    return-void
.end method

.method public static bridge synthetic A(Ll/aop;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aop;->k:Lv/VText;

    return-object p0
.end method

.method public static bridge synthetic B(Ll/aop;)Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aop;->i:Lcom/tantan/library/svga/SVGAnimationView;

    return-object p0
.end method

.method public static bridge synthetic C(Ll/aop;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aop;->u:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic E(Ll/aop;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aop;->s:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic F(Ll/aop;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/aop;->t:Z

    return p0
.end method

.method public static bridge synthetic G(Ll/aop;)Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aop;->o:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-object p0
.end method

.method public static bridge synthetic H(Ll/aop;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aop;->n:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    return-object p0
.end method

.method public static bridge synthetic I(Ll/aop;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aop;->j:Lv/VText;

    return-void
.end method

.method public static bridge synthetic J(Ll/aop;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aop;->g:Landroid/widget/FrameLayout;

    return-void
.end method

.method public static bridge synthetic K(Ll/aop;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aop;->h:Landroid/view/View;

    return-void
.end method

.method public static bridge synthetic L(Ll/aop;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    return-void
.end method

.method public static bridge synthetic M(Ll/aop;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aop;->k:Lv/VText;

    return-void
.end method

.method public static bridge synthetic N(Ll/aop;Lv/navigationbar/VNavigationBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aop;->c:Lv/navigationbar/VNavigationBar;

    return-void
.end method

.method public static bridge synthetic O(Ll/aop;Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aop;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-void
.end method

.method public static bridge synthetic P(Ll/aop;Lv/AutoVDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aop;->b:Lv/AutoVDraweeView;

    return-void
.end method

.method public static bridge synthetic Q(Ll/aop;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aop;->i:Lcom/tantan/library/svga/SVGAnimationView;

    return-void
.end method

.method public static bridge synthetic R(Ll/aop;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/bottom/IntlAlphaTransformerViewPager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aop;->f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/bottom/IntlAlphaTransformerViewPager;

    return-void
.end method

.method public static bridge synthetic S(Ll/aop;Lcom/p1/mobile/putong/core/data/PurchaseType;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aop;->j0(Lcom/p1/mobile/putong/core/data/PurchaseType;)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic T(Ll/aop;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aop;->k0(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic U(Ll/aop;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aop;->n0(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic V(Ll/aop;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aop;->u0()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic W(Ll/aop;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aop;->a1(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic X(Ll/aop;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/aop;->d1(Ljava/lang/String;I)V

    return-void
.end method

.method public static bridge synthetic Y(Ll/aop;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/aop;->e1(ILjava/lang/String;)V

    return-void
.end method

.method private Y0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/aop;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    new-instance v1, Ll/aop$b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/aop$b;-><init>(Ll/aop;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 12
    .line 13
    iget-object v1, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 14
    .line 15
    new-instance v2, Ll/aop$c;

    .line 16
    .line 17
    invoke-direct {v2, p0}, Ll/aop$c;-><init>(Ll/aop;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->e(Lcom/p1/mobile/putong/app/PutongFrag;Landroidx/viewpager/widget/ViewPager$j;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/aop;->g:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    new-instance v1, Ll/hnp;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/hnp;-><init>(Ll/aop;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static bridge synthetic Z(Ll/aop;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/aop;->f1(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic a(Ll/aop;Lcom/p1/mobile/putong/core/data/RecentContractInfosEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aop;->w0(Lcom/p1/mobile/putong/core/data/RecentContractInfosEnvelope;)V

    return-void
.end method

.method public static bridge synthetic a0(Ll/aop;ZZ)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/aop;->h1(ZZ)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Ll/aop;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aop;->z0()V

    return-void
.end method

.method public static bridge synthetic b0(Ll/aop;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aop;->j1()V

    return-void
.end method

.method public static synthetic c(Ll/aop;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/aop;->J0(ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static bridge synthetic c0(Ll/aop;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aop;->l1()V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ll/aop;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/aop;->H0(ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic f(Ll/aop;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/aop;->L0(ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic i(Ll/aop;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aop;->y0(Landroid/os/Bundle;)V

    return-void
.end method

.method private i0()V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/bpc0;->c()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/pnp;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/pnp;-><init>(Ll/aop;)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Ll/qnp;

    .line 27
    .line 28
    invoke-direct {p0}, Ll/qnp;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static synthetic j()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k(Ll/aop;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aop;->A0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/aop;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/aop;->K0(ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic m(Ll/aop;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aop;->M0()V

    return-void
.end method

.method public static synthetic n(Ll/aop;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aop;->D0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ll/aop;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aop;->x0()V

    return-void
.end method

.method public static synthetic q(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic s(Ll/aop;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aop;->B0(Landroid/view/View;)V

    return-void
.end method

.method private s0()V
    .locals 3

    .line 1
    new-instance v0, Ll/d5n;

    .line 2
    .line 3
    iget-object v1, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    check-cast v1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ll/d5n;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/aop;->p:Ll/d5n;

    .line 11
    .line 12
    iget-object v0, p0, Ll/aop;->f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/bottom/IntlAlphaTransformerViewPager;

    .line 13
    .line 14
    new-instance v1, Ll/a5n;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/a5n;-><init>()V

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-virtual {v0, v2, v1}, Landroidx/viewpager/widget/ViewPager;->X(ZLandroidx/viewpager/widget/ViewPager$k;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/aop;->f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/bottom/IntlAlphaTransformerViewPager;

    .line 24
    .line 25
    const/4 v1, 0x3

    .line 26
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/aop;->f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/bottom/IntlAlphaTransformerViewPager;

    .line 30
    .line 31
    iget-object p0, p0, Ll/aop;->p:Ll/d5n;

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic u(Ll/aop;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/aop;->E0(ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic v(Ll/aop;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aop;->N0(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic w(Ll/aop;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aop;->I0(Z)V

    return-void
.end method

.method public static synthetic x(Ll/aop;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/aop;->G0(ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static bridge synthetic y(Ll/aop;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aop;->j:Lv/VText;

    return-object p0
.end method

.method public static bridge synthetic z(Ll/aop;)Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aop;->g:Landroid/widget/FrameLayout;

    return-object p0
.end method


# virtual methods
.method public final synthetic A0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aop;->g1()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic B0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/rj90;->d()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Landroid/content/Intent;

    .line 19
    .line 20
    iget-object p0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-class v1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/HelperManagerAct;

    .line 27
    .line 28
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic D0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aop;->O0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic E0(ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ll/aop;->Z0(Lcom/p1/mobile/putong/data/User;Z)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const-string p0, "oneMath"

    .line 10
    .line 11
    :goto_0
    sput-object p0, Ll/ubp;->a:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public final synthetic G0(ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ll/aop;->Z0(Lcom/p1/mobile/putong/data/User;Z)V

    .line 2
    .line 3
    .line 4
    const-string p0, "oneMath"

    .line 5
    .line 6
    sput-object p0, Ll/ubp;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public final synthetic H0(ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ll/aop;->Z0(Lcom/p1/mobile/putong/data/User;Z)V

    .line 2
    .line 3
    .line 4
    const-string p0, "seeProfile"

    .line 5
    .line 6
    sput-object p0, Ll/ubp;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public final synthetic I0(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1}, Ll/aop;->Z0(Lcom/p1/mobile/putong/data/User;Z)V

    .line 3
    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    sput-object p0, Ll/ubp;->a:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method public final synthetic J0(ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ll/aop;->Z0(Lcom/p1/mobile/putong/data/User;Z)V

    .line 2
    .line 3
    .line 4
    const-string p0, "superLiked"

    .line 5
    .line 6
    sput-object p0, Ll/ubp;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public final synthetic K0(ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ll/aop;->Z0(Lcom/p1/mobile/putong/data/User;Z)V

    .line 2
    .line 3
    .line 4
    const-string p0, "liked"

    .line 5
    .line 6
    sput-object p0, Ll/ubp;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public final synthetic L0(ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ll/aop;->Z0(Lcom/p1/mobile/putong/data/User;Z)V

    .line 2
    .line 3
    .line 4
    const-string p0, "seeProfile"

    .line 5
    .line 6
    sput-object p0, Ll/ubp;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public final synthetic M0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aop;->k1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic N0(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aop;->i:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public O0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/d79;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    iget-object v0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 8
    .line 9
    if-eqz v0, :cond_a

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :cond_0
    sget-object v0, Ll/aop$e;->a:[I

    .line 20
    .line 21
    iget-object v1, p0, Ll/aop;->o:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    aget v0, v0, v1

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    const-string v2, "p_privileges_view,e_buy_privilege_button,click"

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    if-eq v0, v1, :cond_4

    .line 34
    .line 35
    const/4 v1, 0x2

    .line 36
    if-eq v0, v1, :cond_3

    .line 37
    .line 38
    const/4 v1, 0x3

    .line 39
    if-eq v0, v1, :cond_2

    .line 40
    .line 41
    const/4 v1, 0x4

    .line 42
    if-eq v0, v1, :cond_1

    .line 43
    .line 44
    goto/16 :goto_0

    .line 45
    .line 46
    :cond_1
    iget-object p0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0, v2, v3, v3, v3}, Lcom/p1/mobile/putong/core/ui/purchase/c;->K0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    iget-object p0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {p0, v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/c;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_3
    iget-object p0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->A1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_4
    iget-object p0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-static {p0, v2, v3, v3, v3}, Lcom/p1/mobile/putong/core/ui/purchase/c;->K1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->A4()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_6

    .line 95
    .line 96
    iget-object v0, p0, Ll/aop;->o:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 97
    .line 98
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 99
    .line 100
    if-eq v0, v1, :cond_8

    .line 101
    .line 102
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->B4()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_7

    .line 111
    .line 112
    iget-object v0, p0, Ll/aop;->o:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 113
    .line 114
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 115
    .line 116
    if-eq v0, v1, :cond_8

    .line 117
    .line 118
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 119
    .line 120
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y4()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_9

    .line 127
    .line 128
    iget-object v0, p0, Ll/aop;->o:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 129
    .line 130
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 131
    .line 132
    if-ne v0, v1, :cond_9

    .line 133
    .line 134
    :cond_8
    invoke-virtual {p0}, Ll/aop;->u0()Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-eqz v0, :cond_9

    .line 139
    .line 140
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 141
    .line 142
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FreeTrialData;->skuId:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {p0, v0}, Ll/aop;->Q0(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_9
    iget-object v0, p0, Ll/aop;->n:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 155
    .line 156
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-eqz v0, :cond_a

    .line 161
    .line 162
    iget-object v0, p0, Ll/aop;->n:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 163
    .line 164
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-eqz v0, :cond_a

    .line 173
    .line 174
    iget-object v0, p0, Ll/aop;->n:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 175
    .line 176
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 181
    .line 182
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 183
    .line 184
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->getProductId()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {p0, v0}, Ll/aop;->Q0(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    :cond_a
    :goto_0
    return-void
.end method

.method public P0()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    iget-object v0, p0, Ll/aop;->m:Ll/gnp;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/aop;->m0()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-static {}, Ll/gnp;->q0()Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-ltz v0, :cond_4

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-lt v0, v2, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    move-object v2, v0

    .line 38
    check-cast v2, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 39
    .line 40
    iget-object v0, p0, Ll/aop;->m:Ll/gnp;

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ll/gnp;->p0(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_4

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->getProductId()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-nez v1, :cond_4

    .line 76
    .line 77
    iget-object v1, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 78
    .line 79
    instance-of v3, v1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 80
    .line 81
    if-eqz v3, :cond_3

    .line 82
    .line 83
    check-cast v1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;->getFrom()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    :cond_3
    iget-object v1, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->C()Z

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    invoke-virtual {v5, v2}, Ll/ijj;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    new-instance v6, Ll/fhj$a;

    .line 107
    .line 108
    iget-object v7, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 109
    .line 110
    invoke-virtual {v7}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 111
    .line 112
    .line 113
    move-result-object v7

    .line 114
    invoke-direct {v6, v7, v2, v0, v4}, Ll/fhj$a;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget-object v7, p0, Ll/aop;->y:Ll/y20;

    .line 118
    .line 119
    invoke-static/range {v1 .. v7}, Ll/rk60;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;ZLjava/lang/String;Ljava/lang/String;Ll/bn50;Ll/y20;)V

    .line 120
    .line 121
    .line 122
    :cond_4
    :goto_0
    return-void
.end method

.method public final Q0(Ljava/lang/String;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;->getFrom()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    iget-object v1, p0, Ll/aop;->o:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    const-string v2, "MINE_SUB_ITEM"

    .line 18
    .line 19
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    xor-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/gul0;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/aop;->n:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Ll/aop;->n:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    iget-object v0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iget-object v2, p0, Ll/aop;->o:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 55
    .line 56
    iget-object v0, p0, Ll/aop;->n:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->C()Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v4, p0, Ll/aop;->o:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 67
    .line 68
    invoke-virtual {v0, v4}, Ll/ijj;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    new-instance v6, Ll/fhj$a;

    .line 73
    .line 74
    iget-object v0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v4, p0, Ll/aop;->o:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 81
    .line 82
    iget-object v7, p0, Ll/aop;->n:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 83
    .line 84
    invoke-direct {v6, v0, v4, v7, p1}, Ll/fhj$a;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object v7, p0, Ll/aop;->y:Ll/y20;

    .line 88
    .line 89
    move-object v4, p1

    .line 90
    invoke-static/range {v1 .. v7}, Ll/rk60;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;ZLjava/lang/String;Ljava/lang/String;Ll/bn50;Ll/y20;)V

    .line 91
    .line 92
    .line 93
    :cond_1
    return-void
.end method

.method public R0(I)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gnp;->q0()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-le v0, p1, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/gnp;->q0()Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 20
    .line 21
    invoke-static {}, Ll/d79;->a0()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p0, p1, v0}, Ll/aop;->S0(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object v0, p0, Ll/aop;->m:Ll/gnp;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Ll/gnp;->p0(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {p1}, Ll/gul0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p1}, Ll/gul0;->f(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 42
    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0, p1, v0}, Ll/aop;->S0(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public S0(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/d79;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/aop;->m:Ll/gnp;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2}, Ll/gnp;->G0(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-static {}, Ll/gnp;->q0()Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0}, Ll/aop;->m0()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-le v0, v1, :cond_1

    .line 25
    .line 26
    invoke-static {}, Ll/gnp;->q0()Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0}, Ll/aop;->m0()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-ne v0, p1, :cond_1

    .line 39
    .line 40
    iput-object p2, p0, Ll/aop;->n:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 41
    .line 42
    iput-object p1, p0, Ll/aop;->o:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 43
    .line 44
    iget-object p1, p0, Ll/aop;->g:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    iget-object p2, p0, Ll/aop;->u:Ljava/lang/Runnable;

    .line 47
    .line 48
    invoke-virtual {p1, p2}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/aop;->g:Landroid/widget/FrameLayout;

    .line 52
    .line 53
    iget-object p0, p0, Ll/aop;->u:Ljava/lang/Runnable;

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 56
    .line 57
    .line 58
    :cond_1
    return-void
.end method

.method public T0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->c:Ll/nfp;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlBounceBackViewPager;

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {v0, p0}, Ll/nfp;->s(Landroidx/viewpager/widget/ViewPager;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method public U0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/aop;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/aop;->l0()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :goto_0
    invoke-static {}, Ll/gnp;->E0()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/gnp;->r0()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/gnp;->q0()Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    const/4 v0, -0x1

    .line 36
    :goto_1
    if-gez v0, :cond_2

    .line 37
    .line 38
    invoke-static {}, Ll/d9r;->b()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-eqz v3, :cond_2

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    :cond_2
    const/4 v1, 0x0

    .line 57
    if-gez v0, :cond_3

    .line 58
    .line 59
    move v0, v1

    .line 60
    :cond_3
    const/4 v2, 0x0

    .line 61
    iput-object v2, p0, Ll/aop;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 62
    .line 63
    const/4 v2, 0x1

    .line 64
    iput-boolean v2, p0, Ll/aop;->t:Z

    .line 65
    .line 66
    invoke-virtual {p0, v2}, Ll/aop;->q0(Z)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ll/aop;->v0(I)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 73
    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    new-instance v1, Ll/vnp;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/vnp;-><init>(Ll/aop;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 82
    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_4
    iput-boolean v1, p0, Ll/aop;->t:Z

    .line 86
    .line 87
    :goto_2
    invoke-direct {p0}, Ll/aop;->i0()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final V0()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ResourceAsColor"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/aop;->c:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    const-string v1, "#00ffffff"

    .line 4
    .line 5
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/aop;->c:Lv/navigationbar/VNavigationBar;

    .line 13
    .line 14
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/aop;->c:Lv/navigationbar/VNavigationBar;

    .line 26
    .line 27
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/aop;->c:Lv/navigationbar/VNavigationBar;

    .line 39
    .line 40
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    const-string v1, "#1F1F1F"

    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    if-lez v0, :cond_0

    .line 52
    .line 53
    iget-object v0, p0, Ll/aop;->c:Lv/navigationbar/VNavigationBar;

    .line 54
    .line 55
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    instance-of v0, v0, Lv/VIcon;

    .line 64
    .line 65
    if-eqz v0, :cond_0

    .line 66
    .line 67
    iget-object v0, p0, Ll/aop;->c:Lv/navigationbar/VNavigationBar;

    .line 68
    .line 69
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lv/VIcon;

    .line 78
    .line 79
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 84
    .line 85
    .line 86
    :cond_0
    iget-object v0, p0, Ll/aop;->c:Lv/navigationbar/VNavigationBar;

    .line 87
    .line 88
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-lez v0, :cond_1

    .line 97
    .line 98
    iget-object v0, p0, Ll/aop;->c:Lv/navigationbar/VNavigationBar;

    .line 99
    .line 100
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    instance-of v0, v0, Landroid/widget/TextView;

    .line 109
    .line 110
    if-eqz v0, :cond_1

    .line 111
    .line 112
    iget-object v0, p0, Ll/aop;->c:Lv/navigationbar/VNavigationBar;

    .line 113
    .line 114
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Landroid/widget/TextView;

    .line 123
    .line 124
    const-string v3, "#CC000000"

    .line 125
    .line 126
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 131
    .line 132
    .line 133
    :cond_1
    iget-object v0, p0, Ll/aop;->c:Lv/navigationbar/VNavigationBar;

    .line 134
    .line 135
    new-instance v3, Ll/rnp;

    .line 136
    .line 137
    invoke-direct {v3, p0}, Ll/rnp;-><init>(Ll/aop;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, v3}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 141
    .line 142
    .line 143
    new-instance v0, Lv/VIcon;

    .line 144
    .line 145
    iget-object v3, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 146
    .line 147
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-direct {v0, v3}, Lv/VIcon;-><init>(Landroid/content/Context;)V

    .line 152
    .line 153
    .line 154
    const/4 v3, 0x4

    .line 155
    invoke-virtual {v0, v3}, Lv/VIcon;->setIconStyle(I)V

    .line 156
    .line 157
    .line 158
    sget v3, Ll/dbc0;->Kl:I

    .line 159
    .line 160
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 161
    .line 162
    .line 163
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 168
    .line 169
    .line 170
    new-instance v1, Ll/snp;

    .line 171
    .line 172
    invoke-direct {v1, p0}, Ll/snp;-><init>(Ll/aop;)V

    .line 173
    .line 174
    .line 175
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 176
    .line 177
    .line 178
    iget-object p0, p0, Ll/aop;->c:Lv/navigationbar/VNavigationBar;

    .line 179
    .line 180
    const/4 v1, 0x1

    .line 181
    new-array v1, v1, [Landroid/view/View;

    .line 182
    .line 183
    aput-object v0, v1, v2

    .line 184
    .line 185
    invoke-virtual {p0, v1}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method public W0(Ljava/lang/String;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_4

    .line 6
    .line 7
    iput-object p1, p0, Ll/aop;->s:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->getCurrentItem()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {}, Ll/gnp;->q0()Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-ge v0, v1, :cond_4

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/aop;->u0()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_4

    .line 30
    .line 31
    iget-object v0, p0, Ll/aop;->o:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 32
    .line 33
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->B4()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    :cond_0
    iget-object v0, p0, Ll/aop;->o:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 50
    .line 51
    invoke-static {v0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->A4()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    :cond_1
    iget-object v0, p0, Ll/aop;->o:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 68
    .line 69
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_4

    .line 74
    .line 75
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y4()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_4

    .line 84
    .line 85
    :cond_2
    iget-object v0, p0, Ll/aop;->k:Lv/VText;

    .line 86
    .line 87
    const/4 v1, 0x0

    .line 88
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/aop;->j:Lv/VText;

    .line 92
    .line 93
    const/4 v1, 0x1

    .line 94
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 98
    .line 99
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->z4()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_3

    .line 106
    .line 107
    sget v0, Lcom/p1/mobile/putong/core/R$string;->qc:I

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_3
    sget v0, Lcom/p1/mobile/putong/core/R$string;->C5:I

    .line 111
    .line 112
    :goto_0
    invoke-static {v0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget-object p0, p0, Ll/aop;->j:Lv/VText;

    .line 117
    .line 118
    new-instance v1, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v0, "\n"

    .line 127
    .line 128
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 139
    .line 140
    .line 141
    :cond_4
    return-void
.end method

.method public X0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aop;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    return-void
.end method

.method public final Z0(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aop;->O0()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/ubp;->INSTANCE:Ll/ubp;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/ubp;->A(Lcom/p1/mobile/putong/data/User;)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-virtual {p0, p1}, Ll/ubp;->y(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final a1(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "#66000000"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, p1, v0}, Ll/aop;->d1(Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/aop$f;->a(Ll/aop;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final d1(Ljava/lang/String;I)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/aop;->k:Lv/VText;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/aop;->k:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/aop;->k:Lv/VText;

    .line 24
    .line 25
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 26
    .line 27
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Jc:I

    .line 28
    .line 29
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p2, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public destroy()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/aop;->r:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/aop;->r:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Landroid/view/ViewGroup;

    .line 26
    .line 27
    instance-of v2, v1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSVipContent;

    .line 28
    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    check-cast v1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSVipContent;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSVipContent;->w0()V

    .line 34
    .line 35
    .line 36
    :cond_1
    invoke-virtual {p0}, Ll/aop;->l1()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public e0(Ll/gnp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aop;->m:Ll/gnp;

    .line 2
    .line 3
    return-void
.end method

.method public final e1(ILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aop;->h:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Ll/aop;->j:Lv/VText;

    .line 9
    .line 10
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/aop;->j:Lv/VText;

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-static {p1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public f0(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    invoke-static {}, Ll/gnp;->q0()Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-ltz p1, :cond_7

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-lt p1, v1, :cond_1

    .line 24
    .line 25
    goto/16 :goto_1

    .line 26
    .line 27
    :cond_1
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 32
    .line 33
    iget-object v1, p0, Ll/aop;->v:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 34
    .line 35
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    const-string v3, "#14000000"

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    iget-object v2, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 45
    .line 46
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->b:Lv/VPagerCircleIndicator;

    .line 47
    .line 48
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-virtual {v2, v3}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 56
    .line 57
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->b:Lv/VPagerCircleIndicator;

    .line 58
    .line 59
    const-string v3, "#EEC873"

    .line 60
    .line 61
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    invoke-virtual {v2, v3}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Ll/aop;->b:Lv/AutoVDraweeView;

    .line 69
    .line 70
    sget v3, Ll/dbc0;->wb:I

    .line 71
    .line 72
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Ll/aop;->b:Lv/AutoVDraweeView;

    .line 76
    .line 77
    invoke-virtual {v2, v4}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 78
    .line 79
    .line 80
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 81
    .line 82
    invoke-virtual {p0, v2}, Ll/aop;->g0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 83
    .line 84
    .line 85
    iget-object v2, p0, Ll/aop;->g:Landroid/widget/FrameLayout;

    .line 86
    .line 87
    if-eqz v2, :cond_5

    .line 88
    .line 89
    sget v3, Ll/dbc0;->Da:I

    .line 90
    .line 91
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 92
    .line 93
    .line 94
    goto/16 :goto_0

    .line 95
    .line 96
    :cond_2
    invoke-static {v0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-eqz v2, :cond_3

    .line 101
    .line 102
    iget-object v2, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 103
    .line 104
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->b:Lv/VPagerCircleIndicator;

    .line 105
    .line 106
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    invoke-virtual {v2, v3}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 111
    .line 112
    .line 113
    iget-object v2, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 114
    .line 115
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->b:Lv/VPagerCircleIndicator;

    .line 116
    .line 117
    const-string v3, "#FF8817"

    .line 118
    .line 119
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    invoke-virtual {v2, v3}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 124
    .line 125
    .line 126
    iget-object v2, p0, Ll/aop;->b:Lv/AutoVDraweeView;

    .line 127
    .line 128
    sget v3, Ll/dbc0;->db:I

    .line 129
    .line 130
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 131
    .line 132
    .line 133
    iget-object v2, p0, Ll/aop;->b:Lv/AutoVDraweeView;

    .line 134
    .line 135
    invoke-virtual {v2, v4}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 136
    .line 137
    .line 138
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 139
    .line 140
    invoke-virtual {p0, v2}, Ll/aop;->g0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 141
    .line 142
    .line 143
    iget-object v2, p0, Ll/aop;->g:Landroid/widget/FrameLayout;

    .line 144
    .line 145
    if-eqz v2, :cond_5

    .line 146
    .line 147
    sget v3, Ll/dbc0;->Da:I

    .line 148
    .line 149
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 150
    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_3
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 154
    .line 155
    .line 156
    move-result v2

    .line 157
    if-eqz v2, :cond_4

    .line 158
    .line 159
    iget-object v2, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 160
    .line 161
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->b:Lv/VPagerCircleIndicator;

    .line 162
    .line 163
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 164
    .line 165
    .line 166
    move-result v3

    .line 167
    invoke-virtual {v2, v3}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 168
    .line 169
    .line 170
    iget-object v2, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 171
    .line 172
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->b:Lv/VPagerCircleIndicator;

    .line 173
    .line 174
    const-string v3, "#DD9E2C"

    .line 175
    .line 176
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    move-result v3

    .line 180
    invoke-virtual {v2, v3}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 181
    .line 182
    .line 183
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 184
    .line 185
    invoke-virtual {p0, v2}, Ll/aop;->g0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 186
    .line 187
    .line 188
    iget-object v2, p0, Ll/aop;->b:Lv/AutoVDraweeView;

    .line 189
    .line 190
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 191
    .line 192
    .line 193
    iget-object v2, p0, Ll/aop;->b:Lv/AutoVDraweeView;

    .line 194
    .line 195
    const-string v3, "https://auto.tancdn.com/v1/raw/2a8de5d3-d063-4df3-ae1f-d37c96725580.webp"

    .line 196
    .line 197
    invoke-virtual {v2, v3}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    iget-object v2, p0, Ll/aop;->g:Landroid/widget/FrameLayout;

    .line 201
    .line 202
    if-eqz v2, :cond_5

    .line 203
    .line 204
    sget v3, Ll/dbc0;->Da:I

    .line 205
    .line 206
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 207
    .line 208
    .line 209
    goto :goto_0

    .line 210
    :cond_4
    invoke-static {v0}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 211
    .line 212
    .line 213
    move-result v2

    .line 214
    if-eqz v2, :cond_5

    .line 215
    .line 216
    iget-object v2, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 217
    .line 218
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->b:Lv/VPagerCircleIndicator;

    .line 219
    .line 220
    const-string v3, "#33705E44"

    .line 221
    .line 222
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    invoke-virtual {v2, v3}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 227
    .line 228
    .line 229
    iget-object v2, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 230
    .line 231
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->b:Lv/VPagerCircleIndicator;

    .line 232
    .line 233
    const-string v3, "#9569AC"

    .line 234
    .line 235
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 236
    .line 237
    .line 238
    move-result v3

    .line 239
    invoke-virtual {v2, v3}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 240
    .line 241
    .line 242
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 243
    .line 244
    invoke-virtual {p0, v2}, Ll/aop;->g0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 245
    .line 246
    .line 247
    iget-object v2, p0, Ll/aop;->b:Lv/AutoVDraweeView;

    .line 248
    .line 249
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 250
    .line 251
    .line 252
    iget-object v2, p0, Ll/aop;->b:Lv/AutoVDraweeView;

    .line 253
    .line 254
    const-string v3, "https://auto.tancdn.com/v1/raw/aa62ad72-c2bc-45e5-8f82-6add0b4ca249.webp"

    .line 255
    .line 256
    invoke-virtual {v2, v3}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    iget-object v2, p0, Ll/aop;->g:Landroid/widget/FrameLayout;

    .line 260
    .line 261
    if-eqz v2, :cond_5

    .line 262
    .line 263
    sget v3, Ll/dbc0;->Ca:I

    .line 264
    .line 265
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 266
    .line 267
    .line 268
    :cond_5
    :goto_0
    invoke-virtual {p0, p1}, Ll/aop;->R0(I)V

    .line 269
    .line 270
    .line 271
    iget-object v2, p0, Ll/aop;->f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/bottom/IntlAlphaTransformerViewPager;

    .line 272
    .line 273
    invoke-virtual {v2}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 274
    .line 275
    .line 276
    move-result v2

    .line 277
    if-eq v2, p1, :cond_6

    .line 278
    .line 279
    iget-object v2, p0, Ll/aop;->f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/bottom/IntlAlphaTransformerViewPager;

    .line 280
    .line 281
    const/4 v3, 0x0

    .line 282
    invoke-virtual {v2, p1, v3}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 283
    .line 284
    .line 285
    :cond_6
    iget-object v2, p0, Ll/aop;->r:Ljava/util/ArrayList;

    .line 286
    .line 287
    if-eqz v2, :cond_7

    .line 288
    .line 289
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 290
    .line 291
    .line 292
    move-result v2

    .line 293
    if-ge p1, v2, :cond_7

    .line 294
    .line 295
    iget-object v2, p0, Ll/aop;->r:Ljava/util/ArrayList;

    .line 296
    .line 297
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    move-result-object p1

    .line 301
    check-cast p1, Landroid/view/ViewGroup;

    .line 302
    .line 303
    instance-of v2, p1, Ll/hzo;

    .line 304
    .line 305
    if-eqz v2, :cond_7

    .line 306
    .line 307
    check-cast p1, Ll/hzo;

    .line 308
    .line 309
    invoke-interface {p1, v1, v0}, Ll/hzo;->f(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 310
    .line 311
    .line 312
    iput-object v0, p0, Ll/aop;->v:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 313
    .line 314
    :cond_7
    :goto_1
    return-void
.end method

.method public final f1(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aop;->h:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Ll/aop;->j:Lv/VText;

    .line 9
    .line 10
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/aop;->j:Lv/VText;

    .line 18
    .line 19
    const/4 p2, 0x1

    .line 20
    invoke-static {p2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/aop;->j:Lv/VText;

    .line 28
    .line 29
    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final g0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object v0, Ll/aop$e;->a:[I

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    aget p1, v0, p1

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    if-eq p1, v0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x2

    .line 24
    if-eq p1, v0, :cond_1

    .line 25
    .line 26
    const/4 v0, 0x3

    .line 27
    if-eq p1, v0, :cond_1

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    if-eq p1, v0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object p1, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object v0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget v1, Ll/c9c0;->V1:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const/16 v0, 0x500

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const/high16 v0, -0x80000000

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    const/16 p1, 0x10

    .line 103
    .line 104
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;I)V

    .line 105
    .line 106
    .line 107
    :cond_2
    :goto_0
    return-void
.end method

.method public g1()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/aop;->o:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 9
    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return v2

    .line 14
    :cond_1
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 15
    .line 16
    if-ne v0, v1, :cond_2

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    goto :goto_1

    .line 20
    :cond_2
    move v0, v2

    .line 21
    :goto_1
    invoke-virtual {p0, v2, v0}, Ll/aop;->h1(ZZ)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public final h0(Lcom/p1/mobile/putong/core/data/PurchaseType;)Landroid/view/ViewGroup;
    .locals 1

    .line 1
    sget-object v0, Ll/aop$e;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p1, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p1, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p1, v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p1, v0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0

    .line 23
    :cond_0
    new-instance p1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/aop;->C0()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    return-object p1

    .line 33
    :cond_1
    new-instance p1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSVipContent;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/aop;->C0()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSVipContent;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    return-object p1

    .line 43
    :cond_2
    new-instance p1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSeeContent;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/aop;->C0()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSeeContent;-><init>(Landroid/content/Context;)V

    .line 50
    .line 51
    .line 52
    return-object p1

    .line 53
    :cond_3
    new-instance p1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/aop;->C0()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;-><init>(Landroid/content/Context;)V

    .line 60
    .line 61
    .line 62
    return-object p1
.end method

.method public final h1(ZZ)Z
    .locals 11

    .line 1
    iget-object v0, p0, Ll/aop;->n:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

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
    sget-object v0, Ll/ubp;->INSTANCE:Ll/ubp;

    .line 10
    .line 11
    iget-object v1, p0, Ll/aop;->n:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/ubp;->z(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 17
    .line 18
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->getFrom()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :goto_0
    move-object v7, v0

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    const-string v0, ""

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :goto_1
    if-eqz p2, :cond_2

    .line 34
    .line 35
    sget-object v1, Ll/ubp;->INSTANCE:Ll/ubp;

    .line 36
    .line 37
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    new-instance v3, Ll/xnp;

    .line 42
    .line 43
    invoke-direct {v3, p0, p2}, Ll/xnp;-><init>(Ll/aop;Z)V

    .line 44
    .line 45
    .line 46
    new-instance v4, Ll/ynp;

    .line 47
    .line 48
    invoke-direct {v4, p0, p2}, Ll/ynp;-><init>(Ll/aop;Z)V

    .line 49
    .line 50
    .line 51
    new-instance v5, Ll/znp;

    .line 52
    .line 53
    invoke-direct {v5, p0, p2}, Ll/znp;-><init>(Ll/aop;Z)V

    .line 54
    .line 55
    .line 56
    const/4 v8, 0x0

    .line 57
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object v9

    .line 61
    move v6, p1

    .line 62
    invoke-virtual/range {v1 .. v9}, Ll/ubp;->D(Landroid/content/Context;Ll/y20;Ll/y20;Ll/y20;ZLjava/lang/String;Landroid/content/DialogInterface;Lcom/p1/mobile/android/app/Act;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    return p0

    .line 67
    :cond_2
    move v6, p1

    .line 68
    sget-object v1, Ll/ubp;->INSTANCE:Ll/ubp;

    .line 69
    .line 70
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    new-instance v3, Ll/inp;

    .line 75
    .line 76
    invoke-direct {v3, p0, p2}, Ll/inp;-><init>(Ll/aop;Z)V

    .line 77
    .line 78
    .line 79
    new-instance v4, Ll/jnp;

    .line 80
    .line 81
    invoke-direct {v4, p0, p2}, Ll/jnp;-><init>(Ll/aop;Z)V

    .line 82
    .line 83
    .line 84
    new-instance v5, Ll/knp;

    .line 85
    .line 86
    invoke-direct {v5, p0, p2}, Ll/knp;-><init>(Ll/aop;Z)V

    .line 87
    .line 88
    .line 89
    move-object v8, v7

    .line 90
    move v7, v6

    .line 91
    new-instance v6, Ll/lnp;

    .line 92
    .line 93
    invoke-direct {v6, p0, p2}, Ll/lnp;-><init>(Ll/aop;Z)V

    .line 94
    .line 95
    .line 96
    const/4 v9, 0x0

    .line 97
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 98
    .line 99
    .line 100
    move-result-object v10

    .line 101
    invoke-virtual/range {v1 .. v10}, Ll/ubp;->C(Landroid/content/Context;Ljava/lang/Runnable;Ll/y20;Ll/y20;Ll/y20;ZLjava/lang/String;Landroid/content/DialogInterface;Lcom/p1/mobile/android/app/Act;)Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    return p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gnp;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/aop;->e0(Ll/gnp;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/aop;->d0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/aop;->q:Landroid/view/View;

    .line 6
    .line 7
    return-object p1
.end method

.method public final j0(Lcom/p1/mobile/putong/core/data/PurchaseType;)I
    .locals 0

    .line 1
    sget-object p0, Ll/aop$e;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    if-eq p0, p1, :cond_3

    .line 11
    .line 12
    const/4 p1, 0x2

    .line 13
    if-eq p0, p1, :cond_2

    .line 14
    .line 15
    const/4 p1, 0x3

    .line 16
    if-eq p0, p1, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x4

    .line 19
    if-eq p0, p1, :cond_0

    .line 20
    .line 21
    sget p0, Ll/dbc0;->vb:I

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    sget p0, Ll/dbc0;->kb:I

    .line 25
    .line 26
    return p0

    .line 27
    :cond_1
    sget p0, Ll/dbc0;->La:I

    .line 28
    .line 29
    return p0

    .line 30
    :cond_2
    sget p0, Ll/dbc0;->cb:I

    .line 31
    .line 32
    return p0

    .line 33
    :cond_3
    sget p0, Ll/dbc0;->vb:I

    .line 34
    .line 35
    return p0
.end method

.method public final j1()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/aop;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    new-array v3, v2, [F

    .line 7
    .line 8
    fill-array-data v3, :array_0

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1, v3}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/aop;->g:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    sget-object v3, Ll/gt0;->i:Landroid/util/Property;

    .line 18
    .line 19
    new-array v4, v2, [F

    .line 20
    .line 21
    fill-array-data v4, :array_1

    .line 22
    .line 23
    .line 24
    invoke-static {v1, v3, v4}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v3, p0, Ll/aop;->g:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    sget-object v4, Ll/gt0;->i:Landroid/util/Property;

    .line 31
    .line 32
    new-array v5, v2, [F

    .line 33
    .line 34
    fill-array-data v5, :array_2

    .line 35
    .line 36
    .line 37
    invoke-static {v3, v4, v5}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iget-object v4, p0, Ll/aop;->g:Landroid/widget/FrameLayout;

    .line 42
    .line 43
    sget-object v5, Ll/gt0;->i:Landroid/util/Property;

    .line 44
    .line 45
    new-array v2, v2, [F

    .line 46
    .line 47
    fill-array-data v2, :array_3

    .line 48
    .line 49
    .line 50
    invoke-static {v4, v5, v2}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    const-wide/16 v4, 0x1f4

    .line 55
    .line 56
    invoke-virtual {v0, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 57
    .line 58
    .line 59
    const-wide/16 v4, 0x14d

    .line 60
    .line 61
    invoke-virtual {v1, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    iget-object v4, p0, Ll/aop;->w:Landroid/view/animation/Interpolator;

    .line 71
    .line 72
    invoke-virtual {v0, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 73
    .line 74
    .line 75
    iget-object v4, p0, Ll/aop;->w:Landroid/view/animation/Interpolator;

    .line 76
    .line 77
    invoke-virtual {v1, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 78
    .line 79
    .line 80
    iget-object v4, p0, Ll/aop;->w:Landroid/view/animation/Interpolator;

    .line 81
    .line 82
    invoke-virtual {v3, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 83
    .line 84
    .line 85
    iget-object v4, p0, Ll/aop;->w:Landroid/view/animation/Interpolator;

    .line 86
    .line 87
    invoke-virtual {v2, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 88
    .line 89
    .line 90
    const-wide/16 v4, -0x1

    .line 91
    .line 92
    filled-new-array {v0, v1, v3, v2}, [Landroid/animation/Animator;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    const/4 v1, 0x0

    .line 97
    const/4 v2, 0x0

    .line 98
    invoke-static {v1, v2, v4, v5, v0}, Ll/gt0;->u(ZLandroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v1, Ll/mnp;

    .line 103
    .line 104
    invoke-direct {v1, p0}, Ll/mnp;-><init>(Ll/aop;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f75c28f    # 0.96f
    .end array-data

    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    :array_2
    .array-data 4
        0x3f75c28f    # 0.96f
        0x3f83d70a    # 1.03f
    .end array-data

    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    :array_3
    .array-data 4
        0x3f83d70a    # 1.03f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final k0(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/aop$e;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    if-eq p0, p1, :cond_1

    .line 11
    .line 12
    const/4 p1, 0x4

    .line 13
    if-eq p0, p1, :cond_0

    .line 14
    .line 15
    const-string p0, "#CC000000"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const-string p0, "#F9E7FF"

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    const-string p0, "#FFFFFF"

    .line 22
    .line 23
    return-object p0
.end method

.method public final k1()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/aop;->x:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 7
    .line 8
    const-wide/16 v1, 0x8ca

    .line 9
    .line 10
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    const-wide/16 v4, 0x0

    .line 13
    .line 14
    invoke-static {v4, v5, v1, v2, v3}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/nnp;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/nnp;-><init>(Ll/aop;)V

    .line 37
    .line 38
    .line 39
    new-instance v2, Ll/onp;

    .line 40
    .line 41
    invoke-direct {v2}, Ll/onp;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Ll/aop;->x:Ll/kcg0;

    .line 53
    .line 54
    return-void
.end method

.method public l0()Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/aop;->m0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Ll/gnp;->q0()Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v0, v2, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    iget-object p0, p0, Ll/aop;->o:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method public final l1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aop;->x:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m0()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public final n0(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/aop$e;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p1, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p1, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p1, v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p1, v0, :cond_0

    .line 20
    .line 21
    const-string p0, ""

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ig:I

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Pb:I

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_2
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Eg:I

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    sget p1, Lcom/p1/mobile/putong/core/R$string;->wj:I

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method

.method public o0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/aop;->k:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/wnp;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/wnp;-><init>(Ll/aop;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v2, 0x64

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public p0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/aop;->q0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final q0(Z)V
    .locals 8

    .line 1
    invoke-static {}, Ll/gnp;->q0()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_3

    .line 12
    .line 13
    :cond_0
    iget-object v1, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->d(Ljava/util/ArrayList;)V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-eqz p1, :cond_9

    .line 20
    .line 21
    iget-object p1, p0, Ll/aop;->r:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_9

    .line 28
    .line 29
    new-instance p1, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance v2, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-eqz v4, :cond_6

    .line 48
    .line 49
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    check-cast v4, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 54
    .line 55
    iget-object v5, p0, Ll/aop;->r:Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    :cond_2
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    if-eqz v6, :cond_4

    .line 66
    .line 67
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    check-cast v6, Landroid/view/ViewGroup;

    .line 72
    .line 73
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v7

    .line 77
    if-eqz v7, :cond_3

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    instance-of v7, v6, Ll/hzo;

    .line 81
    .line 82
    if-eqz v7, :cond_2

    .line 83
    .line 84
    move-object v7, v6

    .line 85
    check-cast v7, Ll/hzo;

    .line 86
    .line 87
    invoke-interface {v7}, Ll/hzo;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    invoke-virtual {v4, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v7

    .line 95
    if-eqz v7, :cond_2

    .line 96
    .line 97
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_4
    const/4 v6, 0x0

    .line 102
    :goto_2
    if-eqz v6, :cond_5

    .line 103
    .line 104
    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_5
    invoke-virtual {p0, v4}, Ll/aop;->h0(Lcom/p1/mobile/putong/core/data/PurchaseType;)Landroid/view/ViewGroup;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    if-eqz v5, :cond_1

    .line 117
    .line 118
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_6
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    if-ne v2, v3, :cond_9

    .line 131
    .line 132
    iput-object p1, p0, Ll/aop;->r:Ljava/util/ArrayList;

    .line 133
    .line 134
    iget-object p1, p0, Ll/aop;->p:Ll/d5n;

    .line 135
    .line 136
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    if-eqz p1, :cond_7

    .line 141
    .line 142
    iget-object p1, p0, Ll/aop;->p:Ll/d5n;

    .line 143
    .line 144
    iget-object v2, p0, Ll/aop;->r:Ljava/util/ArrayList;

    .line 145
    .line 146
    invoke-virtual {p1, v2}, Ll/d5n;->r(Ljava/util/ArrayList;)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Ll/aop;->f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/bottom/IntlAlphaTransformerViewPager;

    .line 150
    .line 151
    invoke-virtual {p1, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 152
    .line 153
    .line 154
    :cond_7
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    if-nez p1, :cond_8

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 165
    .line 166
    iput-object p1, p0, Ll/aop;->v:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 167
    .line 168
    :cond_8
    :goto_3
    return-void

    .line 169
    :cond_9
    new-instance p1, Ljava/util/ArrayList;

    .line 170
    .line 171
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 172
    .line 173
    .line 174
    iput-object p1, p0, Ll/aop;->r:Ljava/util/ArrayList;

    .line 175
    .line 176
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    :cond_a
    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    if-eqz v2, :cond_b

    .line 185
    .line 186
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    check-cast v2, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 191
    .line 192
    invoke-virtual {p0, v2}, Ll/aop;->h0(Lcom/p1/mobile/putong/core/data/PurchaseType;)Landroid/view/ViewGroup;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    if-eqz v3, :cond_a

    .line 201
    .line 202
    iget-object v3, p0, Ll/aop;->r:Ljava/util/ArrayList;

    .line 203
    .line 204
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    goto :goto_4

    .line 208
    :cond_b
    iget-object p1, p0, Ll/aop;->r:Ljava/util/ArrayList;

    .line 209
    .line 210
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    if-nez p1, :cond_c

    .line 215
    .line 216
    iget-object p1, p0, Ll/aop;->p:Ll/d5n;

    .line 217
    .line 218
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    if-eqz p1, :cond_c

    .line 223
    .line 224
    iget-object p1, p0, Ll/aop;->p:Ll/d5n;

    .line 225
    .line 226
    iget-object v2, p0, Ll/aop;->r:Ljava/util/ArrayList;

    .line 227
    .line 228
    invoke-virtual {p1, v2}, Ll/d5n;->r(Ljava/util/ArrayList;)V

    .line 229
    .line 230
    .line 231
    iget-object p1, p0, Ll/aop;->f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/bottom/IntlAlphaTransformerViewPager;

    .line 232
    .line 233
    invoke-virtual {p1, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    if-nez p1, :cond_c

    .line 241
    .line 242
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 247
    .line 248
    iput-object p1, p0, Ll/aop;->v:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 249
    .line 250
    :cond_c
    iget-object p1, p0, Ll/aop;->i:Lcom/tantan/library/svga/SVGAnimationView;

    .line 251
    .line 252
    sget v0, Ll/qa00;->i:I

    .line 253
    .line 254
    invoke-static {p1, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 255
    .line 256
    .line 257
    iget-object p1, p0, Ll/aop;->i:Lcom/tantan/library/svga/SVGAnimationView;

    .line 258
    .line 259
    const/16 v0, 0x99

    .line 260
    .line 261
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setAlpha(I)V

    .line 262
    .line 263
    .line 264
    iget-object p1, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 265
    .line 266
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    const-string v0, "https://auto.tancdn.com/v1/raw/051048fc-7b33-41f3-a36c-1004f82d5167.pdf"

    .line 275
    .line 276
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    const/4 v0, 0x1

    .line 285
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    iget-object p0, p0, Ll/aop;->i:Lcom/tantan/library/svga/SVGAnimationView;

    .line 290
    .line 291
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 292
    .line 293
    .line 294
    return-void
.end method

.method public r0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aop;->V0()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/aop;->Y0()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/aop;->s0()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/gnp;->r0()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/aop;->p0()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/aop;->t0()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/aop;->m:Ll/gnp;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/gnp;->s0()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final t0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/aop;->m:Ll/gnp;

    .line 2
    .line 3
    new-instance v1, Ll/tnp;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/tnp;-><init>(Ll/aop;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ll/unp;

    .line 9
    .line 10
    invoke-direct {p0}, Ll/unp;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1, p0}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final u0()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/aop;->n:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

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
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Ll/aop;->n:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Ll/aop;->n:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->z4()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    const/4 v2, 0x1

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    const/16 v0, 0xc

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move v0, v2

    .line 43
    :goto_0
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 44
    .line 45
    if-ne p0, v0, :cond_1

    .line 46
    .line 47
    return v2

    .line 48
    :cond_1
    return v1
.end method

.method public v0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eq v0, p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->setCurrentItem(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic w0(Lcom/p1/mobile/putong/core/data/RecentContractInfosEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aop;->T0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic x0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/aop;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/aop;->g:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    iget-object v1, p0, Ll/aop;->u:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/aop;->g:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    iget-object v1, p0, Ll/aop;->u:Ljava/lang/Runnable;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/aop;->r:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    iget-object p0, p0, Ll/aop;->r:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Landroid/view/ViewGroup;

    .line 46
    .line 47
    instance-of v1, v0, Ll/hzo;

    .line 48
    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    check-cast v0, Ll/hzo;

    .line 52
    .line 53
    const/4 v1, 0x2

    .line 54
    invoke-interface {v0, v1}, Ll/hzo;->b(I)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    return-void
.end method

.method public final synthetic y0(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/aop;->l:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    const-string v0, "vip_selected_purchase_type"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 v0, 0x0

    .line 35
    :goto_0
    const-string v1, "vip_selected_page"

    .line 36
    .line 37
    const/4 v2, -0x1

    .line 38
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-ltz p1, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->setCurrentItem(I)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlBounceBackViewPager;

    .line 52
    .line 53
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-virtual {p0, p1}, Ll/aop;->f0(I)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-static {}, Ll/d79;->a0()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    xor-int/lit8 p1, p1, 0x1

    .line 66
    .line 67
    new-instance v1, Ll/j0p;

    .line 68
    .line 69
    invoke-direct {v1}, Ll/j0p;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, p1, v1}, Ll/ge90;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;ZLl/xib0;)I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    iget-object v0, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 77
    .line 78
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->setCurrentItem(I)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 82
    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlBounceBackViewPager;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    invoke-virtual {p0, p1}, Ll/aop;->f0(I)V

    .line 90
    .line 91
    .line 92
    :cond_2
    return-void
.end method

.method public final synthetic z0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aop;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/IntlTopCardLayout;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, v0}, Ll/aop;->f0(I)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ll/aop;->t:Z

    .line 14
    .line 15
    :cond_0
    return-void
.end method
