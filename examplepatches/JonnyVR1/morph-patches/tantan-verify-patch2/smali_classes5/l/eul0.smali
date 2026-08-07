.class public Ll/eul0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/eul0$f;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ktl0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

.field public d:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/bottom/IntlAlphaTransformerViewPager;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lcom/tantan/library/svga/SVGAnimationView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lcom/p1/mobile/putong/app/PutongFrag;

.field public j:Ll/ktl0;

.field public k:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

.field public l:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public m:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public n:Ll/c5n;

.field public o:Landroid/view/View;

.field public p:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/ViewGroup;",
            ">;"
        }
    .end annotation
.end field

.field public q:Ljava/lang/String;

.field public r:Z

.field public final s:Ljava/lang/Runnable;

.field public t:Landroid/view/animation/Interpolator;

.field public u:Ll/kcg0;

.field public v:Ll/y20;
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
    iput-object v0, p0, Ll/eul0;->m:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/eul0;->p:Ljava/util/ArrayList;

    .line 13
    .line 14
    const-string v0, ""

    .line 15
    .line 16
    iput-object v0, p0, Ll/eul0;->q:Ljava/lang/String;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/eul0;->r:Z

    .line 20
    .line 21
    new-instance v0, Ll/eul0$a;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/eul0$a;-><init>(Ll/eul0;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/eul0;->s:Ljava/lang/Runnable;

    .line 27
    .line 28
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 29
    .line 30
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/eul0;->t:Landroid/view/animation/Interpolator;

    .line 34
    .line 35
    new-instance v0, Ll/eul0$d;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/eul0$d;-><init>(Ll/eul0;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/eul0;->v:Ll/y20;

    .line 41
    .line 42
    iput-object p1, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 43
    .line 44
    return-void
.end method

.method public static bridge synthetic A(Ll/eul0;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eul0;->h:Lv/VText;

    return-object p0
.end method

.method private synthetic A0()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eul0;->T0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic B(Ll/eul0;)Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eul0;->f:Lcom/tantan/library/svga/SVGAnimationView;

    return-object p0
.end method

.method private synthetic B0(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eul0;->f:Lcom/tantan/library/svga/SVGAnimationView;

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

.method public static bridge synthetic C(Ll/eul0;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eul0;->s:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic E(Ll/eul0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eul0;->q:Ljava/lang/String;

    return-object p0
.end method

.method private E0(Ljava/lang/String;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->getFrom()Ljava/lang/String;

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
    iget-object v1, p0, Ll/eul0;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

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
    iget-object v0, p0, Ll/eul0;->k:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

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
    iget-object v0, p0, Ll/eul0;->k:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

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
    iget-object v0, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iget-object v2, p0, Ll/eul0;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 55
    .line 56
    iget-object v0, p0, Ll/eul0;->k:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

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
    iget-object v4, p0, Ll/eul0;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

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
    iget-object v0, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v4, p0, Ll/eul0;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 81
    .line 82
    iget-object v7, p0, Ll/eul0;->k:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 83
    .line 84
    invoke-direct {v6, v0, v4, v7, p1}, Ll/fhj$a;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object v7, p0, Ll/eul0;->v:Ll/y20;

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

.method public static bridge synthetic F(Ll/eul0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/eul0;->r:Z

    return p0
.end method

.method public static bridge synthetic G(Ll/eul0;)Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eul0;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-object p0
.end method

.method public static bridge synthetic H(Ll/eul0;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eul0;->k:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    return-object p0
.end method

.method public static bridge synthetic I(Ll/eul0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eul0;->g:Lv/VText;

    return-void
.end method

.method public static bridge synthetic J(Ll/eul0;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eul0;->e:Landroid/widget/FrameLayout;

    return-void
.end method

.method public static bridge synthetic K(Ll/eul0;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    return-void
.end method

.method private K0()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ResourceAsColor"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

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
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

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
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

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
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 39
    .line 40
    new-instance v1, Ll/mtl0;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/mtl0;-><init>(Ll/eul0;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Lv/VIcon;

    .line 49
    .line 50
    iget-object v1, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-direct {v0, v1}, Lv/VIcon;-><init>(Landroid/content/Context;)V

    .line 57
    .line 58
    .line 59
    const/4 v1, 0x4

    .line 60
    invoke-virtual {v0, v1}, Lv/VIcon;->setIconStyle(I)V

    .line 61
    .line 62
    .line 63
    sget v1, Ll/dbc0;->Kl:I

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 66
    .line 67
    .line 68
    const-string v1, "#1F1F1F"

    .line 69
    .line 70
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 75
    .line 76
    .line 77
    new-instance v1, Ll/ntl0;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/ntl0;-><init>(Ll/eul0;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 86
    .line 87
    const/4 v1, 0x1

    .line 88
    new-array v1, v1, [Landroid/view/View;

    .line 89
    .line 90
    const/4 v2, 0x0

    .line 91
    aput-object v0, v1, v2

    .line 92
    .line 93
    invoke-virtual {p0, v1}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public static bridge synthetic L(Ll/eul0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eul0;->h:Lv/VText;

    return-void
.end method

.method public static bridge synthetic M(Ll/eul0;Lv/navigationbar/VNavigationBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    return-void
.end method

.method public static bridge synthetic N(Ll/eul0;Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eul0;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-void
.end method

.method private N0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eul0;->e:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    new-instance v1, Ll/eul0$b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/eul0$b;-><init>(Ll/eul0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 12
    .line 13
    iget-object v1, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 14
    .line 15
    new-instance v2, Ll/eul0$c;

    .line 16
    .line 17
    invoke-direct {v2, p0}, Ll/eul0$c;-><init>(Ll/eul0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->e(Lcom/p1/mobile/putong/app/PutongFrag;Landroidx/viewpager/widget/ViewPager$j;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/eul0;->e:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    new-instance v1, Ll/dul0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/dul0;-><init>(Ll/eul0;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static bridge synthetic O(Ll/eul0;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eul0;->f:Lcom/tantan/library/svga/SVGAnimationView;

    return-void
.end method

.method private O0(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/eul0;->D0()V

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

.method public static bridge synthetic P(Ll/eul0;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/bottom/IntlAlphaTransformerViewPager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eul0;->d:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/bottom/IntlAlphaTransformerViewPager;

    return-void
.end method

.method private P0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eul0;->h:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    xor-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/eul0;->h:Lv/VText;

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 15
    .line 16
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Jc:I

    .line 17
    .line 18
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {v0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static bridge synthetic Q(Ll/eul0;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eul0;->Y(I)V

    return-void
.end method

.method public static bridge synthetic R(Ll/eul0;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eul0;->k0()Z

    move-result p0

    return p0
.end method

.method private R0(ZZ)Z
    .locals 11

    .line 1
    iget-object v0, p0, Ll/eul0;->k:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

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
    iget-object v1, p0, Ll/eul0;->k:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/ubp;->z(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

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
    new-instance v3, Ll/wtl0;

    .line 42
    .line 43
    invoke-direct {v3, p0, p2}, Ll/wtl0;-><init>(Ll/eul0;Z)V

    .line 44
    .line 45
    .line 46
    new-instance v4, Ll/xtl0;

    .line 47
    .line 48
    invoke-direct {v4, p0, p2}, Ll/xtl0;-><init>(Ll/eul0;Z)V

    .line 49
    .line 50
    .line 51
    new-instance v5, Ll/ytl0;

    .line 52
    .line 53
    invoke-direct {v5, p0, p2}, Ll/ytl0;-><init>(Ll/eul0;Z)V

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
    new-instance v3, Ll/ztl0;

    .line 75
    .line 76
    invoke-direct {v3, p0, p2}, Ll/ztl0;-><init>(Ll/eul0;Z)V

    .line 77
    .line 78
    .line 79
    new-instance v4, Ll/aul0;

    .line 80
    .line 81
    invoke-direct {v4, p0, p2}, Ll/aul0;-><init>(Ll/eul0;Z)V

    .line 82
    .line 83
    .line 84
    new-instance v5, Ll/bul0;

    .line 85
    .line 86
    invoke-direct {v5, p0, p2}, Ll/bul0;-><init>(Ll/eul0;Z)V

    .line 87
    .line 88
    .line 89
    move-object v8, v7

    .line 90
    move v7, v6

    .line 91
    new-instance v6, Ll/cul0;

    .line 92
    .line 93
    invoke-direct {v6, p0, p2}, Ll/cul0;-><init>(Ll/eul0;Z)V

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

.method public static bridge synthetic S(Ll/eul0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eul0;->P0(Ljava/lang/String;)V

    return-void
.end method

.method private S0()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/eul0;->e:Landroid/widget/FrameLayout;

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
    iget-object v1, p0, Ll/eul0;->e:Landroid/widget/FrameLayout;

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
    iget-object v3, p0, Ll/eul0;->e:Landroid/widget/FrameLayout;

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
    iget-object v4, p0, Ll/eul0;->e:Landroid/widget/FrameLayout;

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
    iget-object v4, p0, Ll/eul0;->t:Landroid/view/animation/Interpolator;

    .line 71
    .line 72
    invoke-virtual {v0, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 73
    .line 74
    .line 75
    iget-object v4, p0, Ll/eul0;->t:Landroid/view/animation/Interpolator;

    .line 76
    .line 77
    invoke-virtual {v1, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 78
    .line 79
    .line 80
    iget-object v4, p0, Ll/eul0;->t:Landroid/view/animation/Interpolator;

    .line 81
    .line 82
    invoke-virtual {v3, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 83
    .line 84
    .line 85
    iget-object v4, p0, Ll/eul0;->t:Landroid/view/animation/Interpolator;

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
    new-instance v1, Ll/qtl0;

    .line 103
    .line 104
    invoke-direct {v1, p0}, Ll/qtl0;-><init>(Ll/eul0;)V

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

.method public static bridge synthetic T(Ll/eul0;ZZ)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/eul0;->R0(ZZ)Z

    move-result p0

    return p0
.end method

.method private T0()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/eul0;->u:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

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
    new-instance v1, Ll/ttl0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/ttl0;-><init>(Ll/eul0;)V

    .line 37
    .line 38
    .line 39
    new-instance v2, Ll/utl0;

    .line 40
    .line 41
    invoke-direct {v2}, Ll/utl0;-><init>()V

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
    iput-object v0, p0, Ll/eul0;->u:Ll/kcg0;

    .line 53
    .line 54
    return-void
.end method

.method public static bridge synthetic U(Ll/eul0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eul0;->S0()V

    return-void
.end method

.method private U0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eul0;->u:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic V(Ll/eul0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eul0;->U0()V

    return-void
.end method

.method private Y(I)V
    .locals 6

    .line 1
    invoke-static {}, Ll/ktl0;->t0()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const-string v2, "#26ffcf48"

    .line 16
    .line 17
    const-string v3, "#b8000000"

    .line 18
    .line 19
    const-string v4, "#80000000"

    .line 20
    .line 21
    const/4 v5, 0x0

    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 25
    .line 26
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-lez v0, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 37
    .line 38
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    instance-of v0, v0, Lv/VIcon;

    .line 47
    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 51
    .line 52
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lv/VIcon;

    .line 61
    .line 62
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 67
    .line 68
    .line 69
    :cond_0
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 70
    .line 71
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-lez v0, :cond_1

    .line 80
    .line 81
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 82
    .line 83
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    instance-of v0, v0, Landroid/widget/TextView;

    .line 92
    .line 93
    if-eqz v0, :cond_1

    .line 94
    .line 95
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 96
    .line 97
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Landroid/widget/TextView;

    .line 106
    .line 107
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 112
    .line 113
    .line 114
    :cond_1
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 115
    .line 116
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 124
    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->b:Lv/VPagerCircleIndicator;

    .line 126
    .line 127
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 135
    .line 136
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->b:Lv/VPagerCircleIndicator;

    .line 137
    .line 138
    const-string v1, "#ffcf48"

    .line 139
    .line 140
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/eul0;->o:Landroid/view/View;

    .line 148
    .line 149
    iget-object v1, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 150
    .line 151
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    sget v2, Ll/dbc0;->ub:I

    .line 156
    .line 157
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 162
    .line 163
    .line 164
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 165
    .line 166
    invoke-direct {p0, v0}, Ll/eul0;->Z(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 167
    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :cond_2
    invoke-static {v0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-eqz v1, :cond_5

    .line 176
    .line 177
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 178
    .line 179
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    if-lez v0, :cond_3

    .line 188
    .line 189
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 190
    .line 191
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    instance-of v0, v0, Lv/VIcon;

    .line 200
    .line 201
    if-eqz v0, :cond_3

    .line 202
    .line 203
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 204
    .line 205
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    check-cast v0, Lv/VIcon;

    .line 214
    .line 215
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 220
    .line 221
    .line 222
    :cond_3
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 223
    .line 224
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    if-lez v0, :cond_4

    .line 233
    .line 234
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 235
    .line 236
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    instance-of v0, v0, Landroid/widget/TextView;

    .line 245
    .line 246
    if-eqz v0, :cond_4

    .line 247
    .line 248
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 249
    .line 250
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    check-cast v0, Landroid/widget/TextView;

    .line 259
    .line 260
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 261
    .line 262
    .line 263
    move-result v1

    .line 264
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 265
    .line 266
    .line 267
    :cond_4
    iget-object v0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 268
    .line 269
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->b:Lv/VPagerCircleIndicator;

    .line 270
    .line 271
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 272
    .line 273
    .line 274
    move-result v1

    .line 275
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 276
    .line 277
    .line 278
    iget-object v0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 279
    .line 280
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->b:Lv/VPagerCircleIndicator;

    .line 281
    .line 282
    const-string v1, "#ff932b"

    .line 283
    .line 284
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 289
    .line 290
    .line 291
    iget-object v0, p0, Ll/eul0;->o:Landroid/view/View;

    .line 292
    .line 293
    iget-object v1, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 294
    .line 295
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    sget v2, Ll/dbc0;->ab:I

    .line 300
    .line 301
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 306
    .line 307
    .line 308
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 309
    .line 310
    invoke-direct {p0, v0}, Ll/eul0;->Z(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 311
    .line 312
    .line 313
    goto/16 :goto_0

    .line 314
    .line 315
    :cond_5
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    if-eqz v1, :cond_8

    .line 320
    .line 321
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 322
    .line 323
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 328
    .line 329
    .line 330
    move-result v0

    .line 331
    const-string v1, "#cce8ca8a"

    .line 332
    .line 333
    if-lez v0, :cond_6

    .line 334
    .line 335
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 336
    .line 337
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    instance-of v0, v0, Lv/VIcon;

    .line 346
    .line 347
    if-eqz v0, :cond_6

    .line 348
    .line 349
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 350
    .line 351
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 352
    .line 353
    .line 354
    move-result-object v0

    .line 355
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    check-cast v0, Lv/VIcon;

    .line 360
    .line 361
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 362
    .line 363
    .line 364
    move-result v2

    .line 365
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 366
    .line 367
    .line 368
    :cond_6
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 369
    .line 370
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 375
    .line 376
    .line 377
    move-result v0

    .line 378
    if-lez v0, :cond_7

    .line 379
    .line 380
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 381
    .line 382
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 383
    .line 384
    .line 385
    move-result-object v0

    .line 386
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    instance-of v0, v0, Landroid/widget/TextView;

    .line 391
    .line 392
    if-eqz v0, :cond_7

    .line 393
    .line 394
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 395
    .line 396
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 397
    .line 398
    .line 399
    move-result-object v0

    .line 400
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 401
    .line 402
    .line 403
    move-result-object v0

    .line 404
    check-cast v0, Landroid/widget/TextView;

    .line 405
    .line 406
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 407
    .line 408
    .line 409
    move-result v1

    .line 410
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 411
    .line 412
    .line 413
    :cond_7
    iget-object v0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 414
    .line 415
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->b:Lv/VPagerCircleIndicator;

    .line 416
    .line 417
    const-string v1, "#26ffdea2"

    .line 418
    .line 419
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 420
    .line 421
    .line 422
    move-result v1

    .line 423
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 424
    .line 425
    .line 426
    iget-object v0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 427
    .line 428
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->b:Lv/VPagerCircleIndicator;

    .line 429
    .line 430
    const-string v1, "#ffdea2"

    .line 431
    .line 432
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 433
    .line 434
    .line 435
    move-result v1

    .line 436
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 437
    .line 438
    .line 439
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 440
    .line 441
    invoke-direct {p0, v0}, Ll/eul0;->Z(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 442
    .line 443
    .line 444
    iget-object v0, p0, Ll/eul0;->o:Landroid/view/View;

    .line 445
    .line 446
    iget-object v1, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 447
    .line 448
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 449
    .line 450
    .line 451
    move-result-object v1

    .line 452
    sget v2, Ll/dbc0;->Ka:I

    .line 453
    .line 454
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 455
    .line 456
    .line 457
    move-result-object v1

    .line 458
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 459
    .line 460
    .line 461
    goto/16 :goto_0

    .line 462
    .line 463
    :cond_8
    invoke-static {v0}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 464
    .line 465
    .line 466
    move-result v0

    .line 467
    if-eqz v0, :cond_b

    .line 468
    .line 469
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 470
    .line 471
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 476
    .line 477
    .line 478
    move-result v0

    .line 479
    const-string v1, "#3D2747"

    .line 480
    .line 481
    if-lez v0, :cond_9

    .line 482
    .line 483
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 484
    .line 485
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 486
    .line 487
    .line 488
    move-result-object v0

    .line 489
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 490
    .line 491
    .line 492
    move-result-object v0

    .line 493
    instance-of v0, v0, Lv/VIcon;

    .line 494
    .line 495
    if-eqz v0, :cond_9

    .line 496
    .line 497
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 498
    .line 499
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 500
    .line 501
    .line 502
    move-result-object v0

    .line 503
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 504
    .line 505
    .line 506
    move-result-object v0

    .line 507
    check-cast v0, Lv/VIcon;

    .line 508
    .line 509
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 510
    .line 511
    .line 512
    move-result v2

    .line 513
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 514
    .line 515
    .line 516
    :cond_9
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 517
    .line 518
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 519
    .line 520
    .line 521
    move-result-object v0

    .line 522
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 523
    .line 524
    .line 525
    move-result v0

    .line 526
    if-lez v0, :cond_a

    .line 527
    .line 528
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 529
    .line 530
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 531
    .line 532
    .line 533
    move-result-object v0

    .line 534
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 535
    .line 536
    .line 537
    move-result-object v0

    .line 538
    instance-of v0, v0, Landroid/widget/TextView;

    .line 539
    .line 540
    if-eqz v0, :cond_a

    .line 541
    .line 542
    iget-object v0, p0, Ll/eul0;->a:Lv/navigationbar/VNavigationBar;

    .line 543
    .line 544
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 545
    .line 546
    .line 547
    move-result-object v0

    .line 548
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 549
    .line 550
    .line 551
    move-result-object v0

    .line 552
    check-cast v0, Landroid/widget/TextView;

    .line 553
    .line 554
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 555
    .line 556
    .line 557
    move-result v1

    .line 558
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 559
    .line 560
    .line 561
    :cond_a
    iget-object v0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 562
    .line 563
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->b:Lv/VPagerCircleIndicator;

    .line 564
    .line 565
    const-string v1, "#33705E44"

    .line 566
    .line 567
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 568
    .line 569
    .line 570
    move-result v1

    .line 571
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 572
    .line 573
    .line 574
    iget-object v0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 575
    .line 576
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->b:Lv/VPagerCircleIndicator;

    .line 577
    .line 578
    const-string v1, "#705E44"

    .line 579
    .line 580
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 581
    .line 582
    .line 583
    move-result v1

    .line 584
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 585
    .line 586
    .line 587
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 588
    .line 589
    invoke-direct {p0, v0}, Ll/eul0;->Z(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 590
    .line 591
    .line 592
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 593
    .line 594
    iget-object v1, p0, Ll/eul0;->o:Landroid/view/View;

    .line 595
    .line 596
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IkQ1QUNBVEJDNE5PTVY3TjdRUUtIVFRRM0Y3TFNBNzE0IiwidyI6NzUwLCJoIjoxNjI0LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MjE5OTAyMzI1NTU1Mn0.png"

    .line 597
    .line 598
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->D(Landroid/view/View;Ljava/lang/String;)V

    .line 599
    .line 600
    .line 601
    :cond_b
    :goto_0
    invoke-virtual {p0, p1}, Ll/eul0;->G0(I)V

    .line 602
    .line 603
    .line 604
    iget-object v0, p0, Ll/eul0;->d:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/bottom/IntlAlphaTransformerViewPager;

    .line 605
    .line 606
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 607
    .line 608
    .line 609
    iget-object v0, p0, Ll/eul0;->p:Ljava/util/ArrayList;

    .line 610
    .line 611
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 612
    .line 613
    .line 614
    move-result-object v0

    .line 615
    instance-of v0, v0, Ll/gzo;

    .line 616
    .line 617
    if-eqz v0, :cond_c

    .line 618
    .line 619
    iget-object p0, p0, Ll/eul0;->p:Ljava/util/ArrayList;

    .line 620
    .line 621
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 622
    .line 623
    .line 624
    move-result-object p0

    .line 625
    check-cast p0, Ll/gzo;

    .line 626
    .line 627
    invoke-interface {p0}, Ll/gzo;->i()V

    .line 628
    .line 629
    .line 630
    :cond_c
    return-void
.end method

.method private Z(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 3

    .line 1
    sget-object v0, Ll/eul0$e;->a:[I

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
    if-eq p1, v0, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p1, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p1, v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p1, v0, :cond_2

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p1, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object v0, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget v1, Ll/c9c0;->V1:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Landroid/view/View;->getSystemUiVisibility()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    and-int/lit16 v0, p1, -0x2001

    .line 66
    .line 67
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 68
    .line 69
    const/16 v2, 0x1a

    .line 70
    .line 71
    if-lt v1, v2, :cond_1

    .line 72
    .line 73
    and-int/lit16 v0, p1, -0x2011

    .line 74
    .line 75
    :cond_1
    iget-object p0, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_2
    iget-object p1, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget-object v0, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    sget v1, Ll/c9c0;->V1:I

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 116
    .line 117
    .line 118
    iget-object p0, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 119
    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    const/16 p1, 0x10

    .line 129
    .line 130
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;I)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public static synthetic a(Ll/eul0;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/eul0;->z0(ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method private a0(Lcom/p1/mobile/putong/core/data/PurchaseType;)Landroid/view/ViewGroup;
    .locals 1

    .line 1
    sget-object v0, Ll/eul0$e;->a:[I

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
    new-instance p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeUltraPremiumContent;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/eul0;->C0()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeUltraPremiumContent;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    return-object p1

    .line 33
    :cond_1
    new-instance p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/eul0;->C0()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    return-object p1

    .line 43
    :cond_2
    new-instance p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSeeContent;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/eul0;->C0()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSeeContent;-><init>(Landroid/content/Context;)V

    .line 50
    .line 51
    .line 52
    return-object p1

    .line 53
    :cond_3
    new-instance p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/eul0;->C0()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;-><init>(Landroid/content/Context;)V

    .line 60
    .line 61
    .line 62
    return-object p1
.end method

.method public static synthetic b(Ll/eul0;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/eul0;->x0(ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic c()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Ll/eul0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eul0;->o0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic e(Ll/eul0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eul0;->q0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/eul0;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/eul0;->y0(ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method private f0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/eul0;->g0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private g0(Z)V
    .locals 8

    .line 1
    invoke-static {}, Ll/ktl0;->t0()Ljava/util/ArrayList;

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
    iget-object v1, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->d(Ljava/util/ArrayList;)V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-eqz p1, :cond_8

    .line 20
    .line 21
    iget-object p1, p0, Ll/eul0;->p:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_8

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
    iget-object v5, p0, Ll/eul0;->p:Ljava/util/ArrayList;

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
    instance-of v7, v6, Ll/gzo;

    .line 81
    .line 82
    if-eqz v7, :cond_2

    .line 83
    .line 84
    move-object v7, v6

    .line 85
    check-cast v7, Ll/gzo;

    .line 86
    .line 87
    invoke-interface {v7}, Ll/gzo;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

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
    invoke-direct {p0, v4}, Ll/eul0;->a0(Lcom/p1/mobile/putong/core/data/PurchaseType;)Landroid/view/ViewGroup;

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
    if-ne v2, v3, :cond_8

    .line 131
    .line 132
    iput-object p1, p0, Ll/eul0;->p:Ljava/util/ArrayList;

    .line 133
    .line 134
    iget-object p1, p0, Ll/eul0;->n:Ll/c5n;

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
    iget-object p1, p0, Ll/eul0;->n:Ll/c5n;

    .line 143
    .line 144
    iget-object v0, p0, Ll/eul0;->p:Ljava/util/ArrayList;

    .line 145
    .line 146
    invoke-virtual {p1, v0}, Ll/c5n;->s(Ljava/util/ArrayList;)V

    .line 147
    .line 148
    .line 149
    iget-object p0, p0, Ll/eul0;->d:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/bottom/IntlAlphaTransformerViewPager;

    .line 150
    .line 151
    invoke-virtual {p0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 152
    .line 153
    .line 154
    :cond_7
    :goto_3
    return-void

    .line 155
    :cond_8
    new-instance p1, Ljava/util/ArrayList;

    .line 156
    .line 157
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 158
    .line 159
    .line 160
    iput-object p1, p0, Ll/eul0;->p:Ljava/util/ArrayList;

    .line 161
    .line 162
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    :cond_9
    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-eqz v0, :cond_a

    .line 171
    .line 172
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    check-cast v0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 177
    .line 178
    invoke-direct {p0, v0}, Ll/eul0;->a0(Lcom/p1/mobile/putong/core/data/PurchaseType;)Landroid/view/ViewGroup;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    if-eqz v2, :cond_9

    .line 187
    .line 188
    iget-object v2, p0, Ll/eul0;->p:Ljava/util/ArrayList;

    .line 189
    .line 190
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    goto :goto_4

    .line 194
    :cond_a
    iget-object p1, p0, Ll/eul0;->p:Ljava/util/ArrayList;

    .line 195
    .line 196
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    if-nez p1, :cond_b

    .line 201
    .line 202
    iget-object p1, p0, Ll/eul0;->n:Ll/c5n;

    .line 203
    .line 204
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result p1

    .line 208
    if-eqz p1, :cond_b

    .line 209
    .line 210
    iget-object p1, p0, Ll/eul0;->n:Ll/c5n;

    .line 211
    .line 212
    iget-object v0, p0, Ll/eul0;->p:Ljava/util/ArrayList;

    .line 213
    .line 214
    invoke-virtual {p1, v0}, Ll/c5n;->s(Ljava/util/ArrayList;)V

    .line 215
    .line 216
    .line 217
    iget-object p1, p0, Ll/eul0;->d:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/bottom/IntlAlphaTransformerViewPager;

    .line 218
    .line 219
    invoke-virtual {p1, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 220
    .line 221
    .line 222
    :cond_b
    iget-object p1, p0, Ll/eul0;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 223
    .line 224
    sget v0, Ll/qa00;->i:I

    .line 225
    .line 226
    invoke-static {p1, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 227
    .line 228
    .line 229
    iget-object p1, p0, Ll/eul0;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 230
    .line 231
    const/16 v0, 0x99

    .line 232
    .line 233
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setAlpha(I)V

    .line 234
    .line 235
    .line 236
    iget-object p1, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 237
    .line 238
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    const-string v0, "https://auto.tancdn.com/v1/raw/051048fc-7b33-41f3-a36c-1004f82d5167.pdf"

    .line 247
    .line 248
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    const/4 v0, 0x1

    .line 257
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    iget-object p0, p0, Ll/eul0;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 262
    .line 263
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 264
    .line 265
    .line 266
    return-void
.end method

.method public static synthetic i(Ll/eul0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eul0;->A0()V

    return-void
.end method

.method private i0()V
    .locals 3

    .line 1
    new-instance v0, Ll/c5n;

    .line 2
    .line 3
    iget-object v1, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    check-cast v1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ll/c5n;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/eul0;->n:Ll/c5n;

    .line 11
    .line 12
    iget-object v0, p0, Ll/eul0;->d:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/bottom/IntlAlphaTransformerViewPager;

    .line 13
    .line 14
    new-instance v1, Ll/z4n;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/z4n;-><init>()V

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-virtual {v0, v2, v1}, Lv/VPagerWithTransformer;->X(ZLandroidx/viewpager/widget/ViewPager$k;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/eul0;->d:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/bottom/IntlAlphaTransformerViewPager;

    .line 24
    .line 25
    const/4 v1, 0x3

    .line 26
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/eul0;->d:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/bottom/IntlAlphaTransformerViewPager;

    .line 30
    .line 31
    iget-object p0, p0, Ll/eul0;->n:Ll/c5n;

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic j(Ll/eul0;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/eul0;->u0(ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method private j0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eul0;->j:Ll/ktl0;

    .line 2
    .line 3
    new-instance v1, Ll/ltl0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ltl0;-><init>(Ll/eul0;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ll/vtl0;

    .line 9
    .line 10
    invoke-direct {p0}, Ll/vtl0;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1, p0}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic k(Ll/eul0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eul0;->B0(Ljava/lang/Long;)V

    return-void
.end method

.method private k0()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eul0;->k:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

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
    iget-object v0, p0, Ll/eul0;->k:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

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
    iget-object p0, p0, Ll/eul0;->k:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

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

.method public static synthetic l(Ll/eul0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eul0;->w0(Z)V

    return-void
.end method

.method public static synthetic m(Ll/eul0;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/eul0;->v0(ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method private synthetic m0(Lcom/p1/mobile/putong/core/data/RecentContractInfosEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/eul0;->I0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic n0()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/eul0;->k0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/eul0;->e:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    iget-object v1, p0, Ll/eul0;->s:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/eul0;->e:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    iget-object v1, p0, Ll/eul0;->s:Ljava/lang/Runnable;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/eul0;->p:Ljava/util/ArrayList;

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
    iget-object p0, p0, Ll/eul0;->p:Ljava/util/ArrayList;

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
    instance-of v1, v0, Ll/gzo;

    .line 48
    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    check-cast v0, Ll/gzo;

    .line 52
    .line 53
    const/4 v1, 0x2

    .line 54
    invoke-interface {v0, v1}, Ll/gzo;->b(I)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    return-void
.end method

.method private synthetic o0(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

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
    const-string v0, "vip_selected_purchase_type"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 31
    :goto_0
    const-string v1, "vip_selected_page"

    .line 32
    .line 33
    const/4 v2, -0x1

    .line 34
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-ltz p1, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-direct {p0, p1}, Ll/eul0;->Y(I)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    new-instance p1, Ll/ful0;

    .line 60
    .line 61
    invoke-direct {p1}, Ll/ful0;-><init>()V

    .line 62
    .line 63
    .line 64
    const/4 v1, 0x1

    .line 65
    invoke-static {v0, v1, p1}, Ll/ge90;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;ZLl/xib0;)I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iget-object v0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;

    .line 72
    .line 73
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;

    .line 79
    .line 80
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    invoke-direct {p0, p1}, Ll/eul0;->Y(I)V

    .line 85
    .line 86
    .line 87
    :cond_2
    return-void
.end method

.method public static synthetic p(Ll/eul0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eul0;->r0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic p0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-direct {p0, v0}, Ll/eul0;->Y(I)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Ll/eul0;->r:Z

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic q(Ll/eul0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eul0;->n0()V

    return-void
.end method

.method private synthetic q0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/eul0;->Q0()Z

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

.method private synthetic r0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/rj90;->d()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

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
    iget-object p1, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

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
    iget-object p0, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

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

.method public static synthetic s(Ll/eul0;Lcom/p1/mobile/putong/core/data/RecentContractInfosEnvelope;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eul0;->m0(Lcom/p1/mobile/putong/core/data/RecentContractInfosEnvelope;)V

    return-void
.end method

.method private synthetic s0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/eul0;->D0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic t0(ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p1}, Ll/eul0;->O0(Lcom/p1/mobile/putong/data/User;Z)V

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

.method public static synthetic u(Ll/eul0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eul0;->p0()V

    return-void
.end method

.method private synthetic u0(ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p1}, Ll/eul0;->O0(Lcom/p1/mobile/putong/data/User;Z)V

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

.method public static synthetic v(Ll/eul0;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/eul0;->t0(ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method private synthetic v0(ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p1}, Ll/eul0;->O0(Lcom/p1/mobile/putong/data/User;Z)V

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

.method public static synthetic w(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic w0(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0, p1}, Ll/eul0;->O0(Lcom/p1/mobile/putong/data/User;Z)V

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

.method public static synthetic x(Ll/eul0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eul0;->s0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic x0(ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p1}, Ll/eul0;->O0(Lcom/p1/mobile/putong/data/User;Z)V

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

.method public static bridge synthetic y(Ll/eul0;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eul0;->g:Lv/VText;

    return-object p0
.end method

.method private synthetic y0(ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p1}, Ll/eul0;->O0(Lcom/p1/mobile/putong/data/User;Z)V

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

.method public static bridge synthetic z(Ll/eul0;)Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eul0;->e:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method private synthetic z0(ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p1}, Ll/eul0;->O0(Lcom/p1/mobile/putong/data/User;Z)V

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


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/eul0;->i:Lcom/p1/mobile/putong/app/PutongFrag;

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

.method public D0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->A4()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/eul0;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 14
    .line 15
    if-eq v0, v1, :cond_2

    .line 16
    .line 17
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->B4()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Ll/eul0;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 28
    .line 29
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 30
    .line 31
    if-eq v0, v1, :cond_2

    .line 32
    .line 33
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y4()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    iget-object v0, p0, Ll/eul0;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 44
    .line 45
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 46
    .line 47
    if-ne v0, v1, :cond_3

    .line 48
    .line 49
    :cond_2
    invoke-direct {p0}, Ll/eul0;->k0()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FreeTrialData;->skuId:Ljava/lang/String;

    .line 64
    .line 65
    invoke-direct {p0, v0}, Ll/eul0;->E0(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_3
    iget-object v0, p0, Ll/eul0;->k:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 70
    .line 71
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_4

    .line 76
    .line 77
    iget-object v0, p0, Ll/eul0;->k:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_4

    .line 88
    .line 89
    iget-object v0, p0, Ll/eul0;->k:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 96
    .line 97
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->getProductId()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-direct {p0, v0}, Ll/eul0;->E0(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :cond_4
    return-void
.end method

.method public G0(I)V
    .locals 1

    .line 1
    invoke-static {}, Ll/ktl0;->t0()Ljava/util/ArrayList;

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
    if-le v0, p1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/ktl0;->t0()Ljava/util/ArrayList;

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
    iget-object v0, p0, Ll/eul0;->j:Ll/ktl0;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ll/ktl0;->r0(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p1}, Ll/gul0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1}, Ll/gul0;->f(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1, v0}, Ll/eul0;->H0(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public H0(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eul0;->j:Ll/ktl0;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/ktl0;->L0(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/ktl0;->t0()Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0}, Ll/eul0;->d0()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-le v0, v1, :cond_0

    .line 19
    .line 20
    invoke-static {}, Ll/ktl0;->t0()Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0}, Ll/eul0;->d0()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-ne v0, p1, :cond_0

    .line 33
    .line 34
    iput-object p2, p0, Ll/eul0;->k:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 35
    .line 36
    iput-object p1, p0, Ll/eul0;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 37
    .line 38
    iget-object p1, p0, Ll/eul0;->e:Landroid/widget/FrameLayout;

    .line 39
    .line 40
    iget-object p2, p0, Ll/eul0;->s:Ljava/lang/Runnable;

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/eul0;->e:Landroid/widget/FrameLayout;

    .line 46
    .line 47
    iget-object p0, p0, Ll/eul0;->s:Ljava/lang/Runnable;

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public I0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->c:Ll/ofp;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {v0, p0}, Ll/ofp;->s(Landroidx/viewpager/widget/ViewPager;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method public J0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/eul0;->m:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/eul0;->c0()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :goto_0
    invoke-static {}, Ll/ktl0;->I0()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/ktl0;->u0()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/ktl0;->t0()Ljava/util/ArrayList;

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
    iput-object v2, p0, Ll/eul0;->m:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 62
    .line 63
    const/4 v2, 0x1

    .line 64
    iput-boolean v2, p0, Ll/eul0;->r:Z

    .line 65
    .line 66
    invoke-direct {p0, v2}, Ll/eul0;->g0(Z)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ll/eul0;->l0(I)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 73
    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;

    .line 77
    .line 78
    if-eqz v0, :cond_4

    .line 79
    .line 80
    new-instance v1, Ll/stl0;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/stl0;-><init>(Ll/eul0;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 86
    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_4
    iput-boolean v1, p0, Ll/eul0;->r:Z

    .line 90
    .line 91
    :goto_2
    invoke-virtual {p0}, Ll/eul0;->b0()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public L0(Ljava/lang/String;)V
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
    iput-object p1, p0, Ll/eul0;->q:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {}, Ll/ktl0;->t0()Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-ge v0, v1, :cond_4

    .line 26
    .line 27
    invoke-direct {p0}, Ll/eul0;->k0()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_4

    .line 32
    .line 33
    iget-object v0, p0, Ll/eul0;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 34
    .line 35
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->B4()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    :cond_0
    iget-object v0, p0, Ll/eul0;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 52
    .line 53
    invoke-static {v0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->A4()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    :cond_1
    iget-object v0, p0, Ll/eul0;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 70
    .line 71
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_4

    .line 76
    .line 77
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 80
    .line 81
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y4()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_4

    .line 86
    .line 87
    :cond_2
    iget-object v0, p0, Ll/eul0;->h:Lv/VText;

    .line 88
    .line 89
    const/4 v1, 0x0

    .line 90
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/eul0;->g:Lv/VText;

    .line 94
    .line 95
    const/4 v1, 0x1

    .line 96
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 100
    .line 101
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->z4()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_3

    .line 108
    .line 109
    sget v0, Lcom/p1/mobile/putong/core/R$string;->qc:I

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    sget v0, Lcom/p1/mobile/putong/core/R$string;->C5:I

    .line 113
    .line 114
    :goto_0
    invoke-static {v0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-object p0, p0, Ll/eul0;->g:Lv/VText;

    .line 119
    .line 120
    new-instance v1, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string v0, "\n"

    .line 129
    .line 130
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    :cond_4
    return-void
.end method

.method public M0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eul0;->m:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    return-void
.end method

.method public Q0()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eul0;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

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
    invoke-direct {p0, v2, v0}, Ll/eul0;->R0(ZZ)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public W(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/eul0$f;->a(Ll/eul0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public X(Ll/ktl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eul0;->j:Ll/ktl0;

    .line 2
    .line 3
    return-void
.end method

.method public b0()V
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
    new-instance v1, Ll/otl0;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/otl0;-><init>(Ll/eul0;)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Ll/ptl0;

    .line 27
    .line 28
    invoke-direct {p0}, Ll/ptl0;-><init>()V

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

.method public c0()Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/eul0;->d0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Ll/ktl0;->t0()Ljava/util/ArrayList;

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
    iget-object p0, p0, Ll/eul0;->l:Lcom/p1/mobile/putong/core/data/PurchaseType;

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

.method public d0()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public destroy()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eul0;->p:Ljava/util/ArrayList;

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
    iget-object v0, p0, Ll/eul0;->p:Ljava/util/ArrayList;

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
    instance-of v2, v1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;

    .line 28
    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    check-cast v1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->v0()V

    .line 34
    .line 35
    .line 36
    :cond_1
    invoke-direct {p0}, Ll/eul0;->U0()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public e0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/eul0;->h:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/rtl0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/rtl0;-><init>(Ll/eul0;)V

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

.method public h0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eul0;->K0()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/eul0;->N0()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/eul0;->i0()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/ktl0;->u0()V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Ll/eul0;->f0()V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ll/eul0;->j0()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/eul0;->j:Ll/ktl0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ktl0;->x0()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ktl0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/eul0;->X(Ll/ktl0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/eul0;->W(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/eul0;->o:Landroid/view/View;

    .line 6
    .line 7
    return-object p1
.end method

.method public l0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eq v0, p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/eul0;->c:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
