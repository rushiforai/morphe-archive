.class public Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Lv/bottombar/VBottomBar$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$IconDotType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/core/newui/main/a;",
        ">;",
        "Lv/bottombar/VBottomBar$a;"
    }
.end annotation


# static fields
.field public static final J:I


# instance fields
.field public A:Ll/x20;

.field public B:I

.field public C:Ljava/lang/String;

.field public D:Ljava/lang/String;

.field public E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

.field public F:Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;

.field public final G:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public H:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/p1/mobile/putong/newui/main/base/TabName;",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field public I:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$IconDotType;

.field public a:Landroidx/drawerlayout/widget/DrawerLayout;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/AutoVDraweeView;

.field public d:Lv/VFrame;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lv/VLinear;

.field public g:Lv/bottombar/VBottomBar;

.field public h:Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;

.field public i:Lv/VImage;

.field public j:Lv/VLinear;

.field public k:Lv/VDraweeView;

.field public l:Landroid/widget/ImageView;

.field public m:Lv/VText;

.field public n:Landroid/view/View;

.field public o:Landroid/widget/LinearLayout;

.field public p:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public q:Lv/VImage;

.field public r:Lv/VText;

.field public s:Lv/VImage;

.field public t:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public u:Lv/VImage;

.field public v:Lv/VText;

.field public w:Lv/VImage;

.field public x:Lcom/p1/mobile/android/app/Act;

.field public y:Lcom/p1/mobile/putong/core/newui/main/a;

.field public z:Landroid/animation/Animator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x42400000    # 48.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->J:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x43480000    # 200.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->B:I

    .line 11
    .line 12
    const-string v0, "number"

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->D:Ljava/lang/String;

    .line 15
    .line 16
    new-instance v0, Ll/ki30;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/ki30;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->G:Ll/qcj;

    .line 22
    .line 23
    new-instance v0, Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->H:Ljava/util/Map;

    .line 29
    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->x:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)Lcom/p1/mobile/putong/core/newui/main/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->y:Lcom/p1/mobile/putong/core/newui/main/a;

    return-object p0
.end method

.method private Q()V
    .locals 1

    .line 1
    invoke-static {}, Ll/s7a;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->d:Lv/VFrame;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->e:Landroid/widget/FrameLayout;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic Y(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->F()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    const-string p1, "alertType"

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->C:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "alertTextType"

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->D:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "e_see_floating_bubble"

    .line 31
    .line 32
    const-string v1, "p_suggest_users_home_view"

    .line 33
    .line 34
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ll/rbb0;->q()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->x:Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    const-string v0, "NA,NA,seeFloat"

    .line 54
    .line 55
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->l1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->x:Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    new-instance v0, Landroid/content/Intent;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->x:Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    const-class v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;

    .line 66
    .line 67
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method private synthetic Z()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->X5()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {v0, p0}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$d;->b:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_0

    .line 14
    .line 15
    const-string p0, "other"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const-string p0, "red_dot"

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    const-string p0, "bubble"

    .line 22
    .line 23
    return-object p0
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->h0()V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;ZILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->k0(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;ZILjava/lang/String;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->d0()V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->Z()V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->b0()V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->a0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i0()V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j0()V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->f0()V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->c0([I)V

    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;IZLl/bkj0;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$d;->b:[I

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    aget v0, v0, v1

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-eq v0, v1, :cond_3

    .line 16
    .line 17
    const/4 p1, 0x2

    .line 18
    if-eq v0, p1, :cond_1

    .line 19
    .line 20
    const/4 p1, 0x3

    .line 21
    if-eq v0, p1, :cond_1

    .line 22
    .line 23
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_1
    iget-object p1, p3, Ll/bkj0;->a:Ljava/lang/Object;

    .line 27
    .line 28
    if-ne p1, p0, :cond_2

    .line 29
    .line 30
    iget-object p0, p3, Ll/bkj0;->b:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p0, Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-ne p0, p2, :cond_2

    .line 39
    .line 40
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_2
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_3
    iget-object p2, p3, Ll/bkj0;->a:Ljava/lang/Object;

    .line 47
    .line 48
    if-ne p2, p0, :cond_4

    .line 49
    .line 50
    iget-object p0, p3, Ll/bkj0;->c:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast p0, Ljava/lang/Integer;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-ne p0, p1, :cond_4

    .line 59
    .line 60
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_4
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 64
    .line 65
    return-object p0
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->e0([I)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->g0()V

    return-void
.end method


# virtual methods
.method public A0(ILcom/p1/mobile/android/ui/bubble/a$c;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    if-lez p1, :cond_0

    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 13
    .line 14
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Va:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 34
    .line 35
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Qa:I

    .line 36
    .line 37
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    :goto_0
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string v1, "#FF3865"

    .line 46
    .line 47
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    filled-new-array {v1}, [I

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const/high16 v1, 0x40e00000    # 7.0f

    .line 60
    .line 61
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const/high16 v1, 0x41500000    # 13.0f

    .line 70
    .line 71
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    const/16 v1, 0x4b

    .line 76
    .line 77
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    sget v1, Ll/qa00;->e:I

    .line 82
    .line 83
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const/4 v1, 0x0

    .line 88
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->y(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/ui/bubble/a;->j(Lcom/p1/mobile/android/ui/bubble/a$c;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    const-wide/16 v1, 0xfa0

    .line 97
    .line 98
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    sget p2, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 103
    .line 104
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 108
    .line 109
    sget-object p1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Meet:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 110
    .line 111
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    if-eqz p1, :cond_1

    .line 120
    .line 121
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-static {v0}, Ll/al80;->a(Ll/f3m;)Ll/al80;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 130
    .line 131
    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p2, v0}, Ll/al80;->r(Ljava/lang/ref/WeakReference;)Ll/al80;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    const-string p2, "key_intl_tribe_pop"

    .line 139
    .line 140
    invoke-virtual {p0, p2}, Ll/al80;->n(Ljava/lang/String;)Ll/al80;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    const/4 p2, 0x3

    .line 145
    invoke-virtual {p0, p2}, Ll/al80;->p(I)Ll/al80;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p1, p0}, Ll/cl80;->q(Ll/al80;)V

    .line 150
    .line 151
    .line 152
    const-string p0, "tribe_bubble_type"

    .line 153
    .line 154
    const-string p1, "guide"

    .line 155
    .line 156
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    filled-new-array {p0}, [Ll/pf60;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    const-string p1, "e_intl_tribe_guided_bubble"

    .line 165
    .line 166
    const-string p2, "p_suggest_users_home_view"

    .line 167
    .line 168
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 169
    .line 170
    .line 171
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 172
    .line 173
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 174
    .line 175
    iget-object p0, p0, Ll/dkb;->M6:Ll/jxd0;

    .line 176
    .line 177
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 178
    .line 179
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 183
    .line 184
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 185
    .line 186
    iget-object p0, p0, Ll/dkb;->N6:Ll/byd0;

    .line 187
    .line 188
    invoke-static {}, Ll/pzi0;->o()J

    .line 189
    .line 190
    .line 191
    move-result-wide p1

    .line 192
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    :cond_1
    return-void
.end method

.method public B(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/aj30;->b(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public B0()V
    .locals 7

    .line 1
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "\u60ca\u559c\u793c\u76d2\u53ef\u5728\u4fa7\u8fb9\u680f\u67e5\u770b"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "#ffffff"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->r(Ljava/lang/String;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/high16 v1, 0x41500000    # 13.0f

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {}, Ll/gra;->z()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    sget v2, Ll/c9c0;->A:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    sget v2, Ll/c9c0;->I:I

    .line 46
    .line 47
    :goto_0
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    filled-new-array {v1}, [I

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const/4 v1, 0x1

    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->t(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-wide/16 v2, 0x1388

    .line 69
    .line 70
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const/high16 v2, 0x41200000    # 10.0f

    .line 75
    .line 76
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    invoke-virtual {v0, v3, v4, v5, v6}, Lcom/p1/mobile/android/ui/bubble/a;->H(IIII)Lcom/p1/mobile/android/ui/bubble/a;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    const/16 v3, 0x8

    .line 97
    .line 98
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->y(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->z(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    sget v1, Ll/zvk;->D:I

    .line 115
    .line 116
    sget v2, Ll/zvk;->E:I

    .line 117
    .line 118
    or-int/2addr v1, v2

    .line 119
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 128
    .line 129
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 130
    .line 131
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    const-string v2, "surprise_box_bubble"

    .line 136
    .line 137
    invoke-virtual {v1, v0, p0, v2}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public C(Z)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->w(Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->n0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->x:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public D0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->J:I

    .line 11
    .line 12
    add-int/2addr v1, p1

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public E(Lcom/p1/mobile/putong/core/newui/main/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->y:Lcom/p1/mobile/putong/core/newui/main/a;

    .line 2
    .line 3
    return-void
.end method

.method public E0(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->A(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    const-string v0, "View Page"

    .line 26
    .line 27
    const-string v1, "Page Name"

    .line 28
    .line 29
    if-eqz p2, :cond_0

    .line 30
    .line 31
    const-string p1, "Message"

    .line 32
    .line 33
    invoke-virtual {p0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 37
    .line 38
    invoke-virtual {p1, v0, p0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 47
    .line 48
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-static {p2, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    if-eqz p2, :cond_1

    .line 57
    .line 58
    const-string p1, "Swipe Page"

    .line 59
    .line 60
    invoke-virtual {p0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 64
    .line 65
    invoke-virtual {p1, v0, p0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 74
    .line 75
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-static {p2, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    if-eqz p2, :cond_2

    .line 84
    .line 85
    const-string p1, "Me"

    .line 86
    .line 87
    invoke-virtual {p0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 91
    .line 92
    invoke-virtual {p1, v0, p0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Meet:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 101
    .line 102
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-static {p2, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result p2

    .line 110
    if-eqz p2, :cond_3

    .line 111
    .line 112
    const-string p1, "Discover"

    .line 113
    .line 114
    invoke-virtual {p0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 118
    .line 119
    invoke-virtual {p1, v0, p0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    sget-object p2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 128
    .line 129
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    if-eqz p1, :cond_4

    .line 138
    .line 139
    const-string p1, "Livestream"

    .line 140
    .line 141
    invoke-virtual {p0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 145
    .line 146
    invoke-virtual {p1, v0, p0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 147
    .line 148
    .line 149
    :cond_4
    return-void
.end method

.method public F()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->z:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->A:Ll/x20;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->z:Landroid/animation/Animator;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/animation/Animator;->isRunning()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->z:Landroid/animation/Animator;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 23
    .line 24
    .line 25
    :cond_0
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->z:Landroid/animation/Animator;

    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public G(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->g:Lv/bottombar/VBottomBar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final G0(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/ve60;->d()Ll/ue60;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0}, Ll/ue60;->c()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->H:Ljava/util/Map;

    .line 15
    .line 16
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/bkj0;

    .line 21
    .line 22
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 23
    .line 24
    if-ne p1, v2, :cond_2

    .line 25
    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    iget-object p1, v1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p1, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    iget-object p1, v1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast p1, Ljava/lang/Integer;

    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    const-string v2, "numbers_on_bubble"

    .line 48
    .line 49
    invoke-static {v2, p1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->G:Ll/qcj;

    .line 54
    .line 55
    iget-object v1, v1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;

    .line 58
    .line 59
    invoke-interface {p0, v1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    check-cast p0, Ljava/lang/String;

    .line 64
    .line 65
    const-string v1, "red_dot_type"

    .line 66
    .line 67
    invoke-static {v1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    filled-new-array {p1, p0}, [Ll/sfj0$a;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string p1, "e_red_dot_messages"

    .line 76
    .line 77
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 78
    .line 79
    .line 80
    :cond_2
    :goto_1
    return-void
.end method

.method public H(F)V
    .locals 0

    .line 1
    return-void
.end method

.method public final H0(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;ZI)V
    .locals 3

    .line 1
    new-instance v0, Ll/ri30;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p3, p4}, Ll/ri30;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;ZI)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/si30;

    .line 7
    .line 8
    invoke-direct {v1, p2, p4, p3}, Ll/si30;-><init>(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;IZ)V

    .line 9
    .line 10
    .line 11
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 12
    .line 13
    if-ne p1, v2, :cond_0

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->H:Ljava/util/Map;

    .line 16
    .line 17
    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Ll/bkj0;

    .line 22
    .line 23
    invoke-interface {v1, v2}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->H:Ljava/util/Map;

    .line 36
    .line 37
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object p4

    .line 45
    invoke-static {p2, p3, p4}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    const-string p0, "e_red_dot_messages_change"

    .line 53
    .line 54
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public I()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->F:Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->F:Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public I0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->h:Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->L(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public J(Z)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->g:Lv/bottombar/VBottomBar;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x1

    .line 6
    const/4 v4, 0x0

    .line 7
    const-string v5, "alpha"

    .line 8
    .line 9
    const-string v6, "translationY"

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sget p1, Ll/ji30;->f:I

    .line 14
    .line 15
    int-to-float p1, p1

    .line 16
    new-array v7, v3, [F

    .line 17
    .line 18
    aput p1, v7, v2

    .line 19
    .line 20
    invoke-static {v0, v6, v7}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget-wide v6, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->h:J

    .line 25
    .line 26
    invoke-virtual {p1, v6, v7}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->g:Lv/bottombar/VBottomBar;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    new-array v1, v1, [F

    .line 37
    .line 38
    aput v0, v1, v2

    .line 39
    .line 40
    aput v4, v1, v3

    .line 41
    .line 42
    invoke-static {p0, v5, v1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget-wide v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->h:J

    .line 47
    .line 48
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    filled-new-array {p1, p0}, [Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    new-array v7, v1, [F

    .line 69
    .line 70
    aput p1, v7, v2

    .line 71
    .line 72
    aput v4, v7, v3

    .line 73
    .line 74
    invoke-static {v0, v6, v7}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    sget-wide v6, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->h:J

    .line 79
    .line 80
    invoke-virtual {p1, v6, v7}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->g:Lv/bottombar/VBottomBar;

    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    new-array v1, v1, [F

    .line 91
    .line 92
    aput v0, v1, v2

    .line 93
    .line 94
    const/high16 v0, 0x3f800000    # 1.0f

    .line 95
    .line 96
    aput v0, v1, v3

    .line 97
    .line 98
    invoke-static {p0, v5, v1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    sget-wide v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->h:J

    .line 103
    .line 104
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    filled-new-array {p1, p0}, [Landroid/animation/Animator;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public J0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->K(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public K()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->y()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public K0(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->e:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->n:Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/newui/main/base/TabName;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public L0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->M0(Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public M(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$IconDotType;Z)V
    .locals 0

    .line 1
    if-nez p3, :cond_1

    .line 2
    .line 3
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->I:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$IconDotType;

    .line 4
    .line 5
    if-eqz p3, :cond_1

    .line 6
    .line 7
    if-ne p2, p3, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 12
    .line 13
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->o(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->I:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$IconDotType;

    .line 18
    .line 19
    return-void
.end method

.method public M0(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->L(Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public N()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->x:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->alwaysHideInput()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public N0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->N(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public O()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public O0()V
    .locals 4

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget v2, Ll/c9c0;->V1:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    and-int/lit16 v1, v0, -0x2001

    .line 39
    .line 40
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 41
    .line 42
    const/16 v3, 0x1a

    .line 43
    .line 44
    if-lt v2, v3, :cond_0

    .line 45
    .line 46
    and-int/lit16 v1, v0, -0x2011

    .line 47
    .line 48
    :cond_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 61
    .line 62
    .line 63
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    instance-of v0, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 78
    .line 79
    if-eqz v0, :cond_1

    .line 80
    .line 81
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->d6()Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    sget v2, Ll/c9c0;->N:I

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->G(I)V

    .line 106
    .line 107
    .line 108
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->d6()Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    const/high16 v1, 0x3f800000    # 1.0f

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->H(F)V

    .line 121
    .line 122
    .line 123
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    sget v1, Ll/c9c0;->c2:I

    .line 132
    .line 133
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->setNavigationBarColor(I)V

    .line 138
    .line 139
    .line 140
    :cond_1
    return-void
.end method

.method public P()V
    .locals 1

    .line 1
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "SURPRISE_BOX_BUBBLE"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public P0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->r:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    const/4 v3, 0x1

    .line 9
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->v:Lv/VText;

    .line 13
    .line 14
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 19
    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    iget-object v0, v0, Ll/dkb;->Z3:Ll/wyd0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ljava/lang/CharSequence;

    .line 32
    .line 33
    const-string v1, "marryMode"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->s:Lv/VImage;

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    sget v0, Ll/dbc0;->dr:I

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->w:Lv/VImage;

    .line 49
    .line 50
    sget v0, Ll/dbc0;->cr:I

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    sget v0, Ll/dbc0;->cr:I

    .line 57
    .line 58
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->w:Lv/VImage;

    .line 62
    .line 63
    sget v0, Ll/dbc0;->dr:I

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final R()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->F:Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;

    .line 11
    .line 12
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Landroid/view/ViewGroup;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->F:Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;

    .line 27
    .line 28
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 29
    .line 30
    const/4 v2, -0x1

    .line 31
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public S()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->p:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$a;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->t:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 12
    .line 13
    new-instance v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$b;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$b;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->a:Landroidx/drawerlayout/widget/DrawerLayout;

    .line 22
    .line 23
    new-instance v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$c;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$c;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroidx/drawerlayout/widget/DrawerLayout$d;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public T(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->x:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->g:Lv/bottombar/VBottomBar;

    .line 10
    .line 11
    invoke-direct {p2, v0, v1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;-><init>(Landroid/content/Context;Lv/bottombar/VBottomBar;)V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 15
    .line 16
    sget p2, Ll/c9c0;->A1:I

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->g:Lv/bottombar/VBottomBar;

    .line 22
    .line 23
    sget v0, Ll/c9c0;->N:I

    .line 24
    .line 25
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 26
    .line 27
    .line 28
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->g:Lv/bottombar/VBottomBar;

    .line 29
    .line 30
    invoke-virtual {p2, p0}, Lv/bottombar/VBottomBar;->setTabClickListener(Lv/bottombar/VBottomBar$a;)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->r()Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_0

    .line 40
    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 42
    .line 43
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget v1, Ll/dbc0;->pj:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->g:Lv/bottombar/VBottomBar;

    .line 57
    .line 58
    sget v0, Ll/ji30;->f:I

    .line 59
    .line 60
    invoke-static {p2, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Ll/gra;->N3()Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->e:Landroid/widget/FrameLayout;

    .line 68
    .line 69
    if-eqz p2, :cond_1

    .line 70
    .line 71
    sget-object p2, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 72
    .line 73
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->k()I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    invoke-static {v0, p2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    sget p2, Ll/ji30;->f:I

    .line 82
    .line 83
    sget-object v1, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->k()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    add-int/2addr p2, v1

    .line 90
    invoke-static {v0, p2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 91
    .line 92
    .line 93
    :goto_0
    sget-object p2, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 94
    .line 95
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->k()I

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->D0(I)V

    .line 100
    .line 101
    .line 102
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 103
    .line 104
    new-instance v0, Ll/ti30;

    .line 105
    .line 106
    invoke-direct {v0, p0}, Ll/ti30;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p2, v0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    invoke-static {}, Ll/ive0;->j()Z

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    if-eqz p2, :cond_3

    .line 117
    .line 118
    new-instance p2, Landroid/view/View;

    .line 119
    .line 120
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-direct {p2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 125
    .line 126
    .line 127
    new-instance v0, Landroidx/appcompat/app/a$a;

    .line 128
    .line 129
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-direct {v0, v1}, Landroidx/appcompat/app/a$a;-><init>(Landroid/content/Context;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, p2}, Landroidx/appcompat/app/a$a;->setView(Landroid/view/View;)Landroidx/appcompat/app/a$a;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    const/4 v0, 0x1

    .line 141
    invoke-virtual {p2, v0}, Landroidx/appcompat/app/a$a;->setCancelable(Z)Landroidx/appcompat/app/a$a;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    invoke-virtual {p2}, Landroidx/appcompat/app/a$a;->create()Landroidx/appcompat/app/a;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    invoke-virtual {p2, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    if-eqz v2, :cond_2

    .line 161
    .line 162
    invoke-virtual {v1, v0, v0}, Landroid/view/Window;->setLayout(II)V

    .line 163
    .line 164
    .line 165
    :cond_2
    invoke-virtual {p2}, Landroid/app/Dialog;->show()V

    .line 166
    .line 167
    .line 168
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    new-instance v1, Ll/ui30;

    .line 173
    .line 174
    invoke-direct {v1, p2}, Ll/ui30;-><init>(Landroidx/appcompat/app/a;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 178
    .line 179
    .line 180
    :cond_3
    invoke-static {}, Ll/gra;->e2()Z

    .line 181
    .line 182
    .line 183
    move-result p2

    .line 184
    if-eqz p2, :cond_4

    .line 185
    .line 186
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->S()V

    .line 187
    .line 188
    .line 189
    :cond_4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->Q()V

    .line 190
    .line 191
    .line 192
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 193
    .line 194
    .line 195
    move-result-object p2

    .line 196
    check-cast p2, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 197
    .line 198
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->k4()Z

    .line 199
    .line 200
    .line 201
    move-result p2

    .line 202
    if-eqz p2, :cond_5

    .line 203
    .line 204
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->R()V

    .line 205
    .line 206
    .line 207
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 208
    .line 209
    .line 210
    move-result-object p2

    .line 211
    new-instance v0, Ll/vi30;

    .line 212
    .line 213
    invoke-direct {v0, p0}, Ll/vi30;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V

    .line 214
    .line 215
    .line 216
    invoke-static {p2, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 217
    .line 218
    .line 219
    :cond_5
    return-object p1
.end method

.method public U()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->g:Lv/bottombar/VBottomBar;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->g:Lv/bottombar/VBottomBar;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->g:Lv/bottombar/VBottomBar;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    const/high16 v0, 0x3f800000    # 1.0f

    .line 28
    .line 29
    cmpg-float p0, p0, v0

    .line 30
    .line 31
    if-gez p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public V()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->z:Landroid/animation/Animator;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->z:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/animation/Animator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public W(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->s(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public X(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->t(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public a(Lv/bottombar/VBottomBar$b;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Lv/bottombar/VBottomBar$b;->getTabName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->transform(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->G0(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->y:Lcom/p1/mobile/putong/core/newui/main/a;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->j9()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic a0(Ljava/lang/String;)V
    .locals 9

    .line 1
    const-string v0, "alertType"

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string p1, "alertTextType"

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->D:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string p0, "tooltips_trigger_mode"

    .line 16
    .line 17
    const-string p1, "passive"

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    const-string p0, "tooltips_type"

    .line 24
    .line 25
    const-string p1, "bubble"

    .line 26
    .line 27
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    const-string p0, "tooltips_type_ui"

    .line 32
    .line 33
    const-string p1, "bubble_basic_with_icon"

    .line 34
    .line 35
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    const-string p0, "tooltips_trigger_module"

    .line 40
    .line 41
    const-string p1, "message_tab"

    .line 42
    .line 43
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    const-string p0, "tooltips_trigger_page"

    .line 48
    .line 49
    const-string p1, "swipe_page"

    .line 50
    .line 51
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    const-string p0, "tooltips_trigger_reason"

    .line 56
    .line 57
    const-string p1, "guide"

    .line 58
    .line 59
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object v8

    .line 63
    filled-new-array/range {v1 .. v8}, [Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p1, "e_see_floating_bubble"

    .line 68
    .line 69
    const-string v0, "p_suggest_users_home_view"

    .line 70
    .line 71
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public b(Lv/bottombar/VBottomBar$b;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p1}, Lv/bottombar/VBottomBar$b;->getTabName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final synthetic b0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->A:Ll/x20;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->A:Ll/x20;

    .line 21
    .line 22
    invoke-interface {p0}, Ll/x20;->call()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public c(Lv/bottombar/VBottomBar$b;)V
    .locals 6

    .line 1
    invoke-interface {p1}, Lv/bottombar/VBottomBar$b;->getTabName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->transform(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->G0(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->y:Lcom/p1/mobile/putong/core/newui/main/a;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/k930;->b1()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->x:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->hideDeepLinkFloatButton(Z)V

    .line 33
    .line 34
    .line 35
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Post:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isPostingMoment()Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_2

    .line 52
    .line 53
    :goto_0
    return-void

    .line 54
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->x:Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->pickMediasWithInstaPicker()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->n:Landroid/view/View;

    .line 69
    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    const/16 v0, 0x8

    .line 73
    .line 74
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_4
    const/4 v0, 0x0

    .line 79
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 80
    .line 81
    .line 82
    :goto_1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 83
    .line 84
    if-ne v0, p1, :cond_5

    .line 85
    .line 86
    invoke-static {}, Ll/wtd0;->e()Ll/wtd0;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Ll/wtd0;->s()V

    .line 91
    .line 92
    .line 93
    invoke-static {}, Ll/wtd0;->e()Ll/wtd0;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0}, Ll/wtd0;->o()V

    .line 98
    .line 99
    .line 100
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 101
    .line 102
    if-ne p1, v0, :cond_6

    .line 103
    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Sf()V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->y:Lcom/p1/mobile/putong/core/newui/main/a;

    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/a;->J7()Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-eqz v0, :cond_6

    .line 118
    .line 119
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Ys()Ll/lc3;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    if-eqz v0, :cond_6

    .line 128
    .line 129
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->x:Lcom/p1/mobile/android/app/Act;

    .line 130
    .line 131
    check-cast v2, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 132
    .line 133
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->c6()Ll/pf60;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    iget-object v2, v2, Ll/pf60;->a:Ljava/lang/Object;

    .line 138
    .line 139
    check-cast v2, Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v0}, Ll/lc3;->a()I

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    iget v4, v0, Ll/lc3;->b:I

    .line 146
    .line 147
    iget v5, v0, Ll/lc3;->c:I

    .line 148
    .line 149
    iget v0, v0, Ll/lc3;->d:I

    .line 150
    .line 151
    invoke-static {v2, v3, v4, v5, v0}, Ll/tft;->b(Ljava/lang/String;IIII)V

    .line 152
    .line 153
    .line 154
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->y:Lcom/p1/mobile/putong/core/newui/main/a;

    .line 155
    .line 156
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/core/newui/main/a;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public final synthetic c0([I)V
    .locals 6

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lv/bottombar/VBottomBarDefaultItem;->getIconView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->b:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->b:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/high16 v1, 0x42200000    # 40.0f

    .line 28
    .line 29
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->r()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    const/high16 v3, 0x40c00000    # 6.0f

    .line 40
    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    iget v1, v0, Ll/bnl0$g;->c:I

    .line 44
    .line 45
    div-int/lit8 v1, v1, 0x2

    .line 46
    .line 47
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    sub-int/2addr v1, v2

    .line 52
    :cond_0
    iget v2, p1, Ll/bnl0$g;->a:I

    .line 53
    .line 54
    iget v4, p1, Ll/bnl0$g;->c:I

    .line 55
    .line 56
    div-int/lit8 v4, v4, 0x2

    .line 57
    .line 58
    add-int/2addr v2, v4

    .line 59
    iget v4, v0, Ll/bnl0$g;->a:I

    .line 60
    .line 61
    sub-int/2addr v2, v4

    .line 62
    sub-int/2addr v2, v1

    .line 63
    iget v1, v0, Ll/bnl0$g;->c:I

    .line 64
    .line 65
    add-int/2addr v1, v2

    .line 66
    invoke-static {}, Ll/bnl0;->y0()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    const/4 v5, 0x0

    .line 71
    if-le v1, v4, :cond_1

    .line 72
    .line 73
    invoke-static {}, Ll/bnl0;->y0()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    sub-int/2addr v1, v2

    .line 78
    div-int/lit8 v2, v1, 0x2

    .line 79
    .line 80
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    sub-int/2addr v2, v3

    .line 85
    iget v3, p1, Ll/bnl0$g;->a:I

    .line 86
    .line 87
    iget p1, p1, Ll/bnl0$g;->c:I

    .line 88
    .line 89
    div-int/lit8 p1, p1, 0x2

    .line 90
    .line 91
    add-int/2addr v3, p1

    .line 92
    iget p1, v0, Ll/bnl0$g;->a:I

    .line 93
    .line 94
    sub-int/2addr v3, p1

    .line 95
    sub-int v2, v3, v2

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_1
    move v1, v5

    .line 99
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 106
    .line 107
    iget v0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 108
    .line 109
    add-int/2addr v0, v2

    .line 110
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 113
    .line 114
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 118
    .line 119
    invoke-static {p1, v2, v5}, Ll/bnl0;->m0(Landroid/view/View;II)V

    .line 120
    .line 121
    .line 122
    if-eqz v1, :cond_2

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->m:Lv/VText;

    .line 125
    .line 126
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setWidth(I)V

    .line 127
    .line 128
    .line 129
    :cond_2
    return-void
.end method

.method public d(Lv/bottombar/VBottomBar$b;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Lv/bottombar/VBottomBar$b;->getTabName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->transform(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->G0(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->y:Lcom/p1/mobile/putong/core/newui/main/a;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->o9()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic d0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 2
    .line 3
    new-instance v1, Ll/qi30;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/qi30;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e(Lv/bottombar/VBottomBar$b;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->N3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final synthetic e0([I)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lv/bottombar/VBottomBarDefaultItem;->getIconView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->b:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->b:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget v1, p1, Ll/bnl0$g;->a:I

    .line 28
    .line 29
    iget v2, v0, Ll/bnl0$g;->a:I

    .line 30
    .line 31
    sub-int/2addr v1, v2

    .line 32
    iget p1, p1, Ll/bnl0$g;->c:I

    .line 33
    .line 34
    iget v0, v0, Ll/bnl0$g;->c:I

    .line 35
    .line 36
    sub-int/2addr p1, v0

    .line 37
    div-int/lit8 p1, p1, 0x2

    .line 38
    .line 39
    add-int/2addr v1, p1

    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 47
    .line 48
    iget v0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 49
    .line 50
    add-int/2addr v0, v1

    .line 51
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 54
    .line 55
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 59
    .line 60
    const/4 p1, 0x0

    .line 61
    invoke-static {p0, v1, p1}, Ll/bnl0;->m0(Landroid/view/View;II)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public f(Lv/bottombar/VBottomBar$b;)Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M7()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p1}, Lv/bottombar/VBottomBar$b;->getTabName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public final synthetic f0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/pi30;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/pi30;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic g0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic h0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic i0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->B(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic j0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;ZILjava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/ve60;->d()Ll/ue60;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0}, Ll/ue60;->c()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->G:Ll/qcj;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ljava/lang/String;

    .line 21
    .line 22
    const-string p1, "red_dot_type"

    .line 23
    .line 24
    invoke-static {p1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "red_dot_status"

    .line 29
    .line 30
    invoke-static {p1, p2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string p2, "numbers_on_bubble"

    .line 35
    .line 36
    invoke-static {p2, p3}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    filled-new-array {p0, p1, p2}, [Ll/sfj0$a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p4, v0, p0}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public l0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->y:Lcom/p1/mobile/putong/core/newui/main/a;

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
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->n0()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->y:Lcom/p1/mobile/putong/core/newui/main/a;

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/a;->t6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lcom/p1/mobile/android/app/Frag;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    instance-of v0, p0, Ll/cvl;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    check-cast p0, Ll/cvl;

    .line 26
    .line 27
    invoke-interface {p0}, Ll/cvl;->Y()Lcom/p1/mobile/android/app/Frag;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    :cond_1
    instance-of v0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->w5()V

    .line 40
    .line 41
    .line 42
    :cond_2
    :goto_0
    return-void
.end method

.method public m0(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->z()Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->b:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->c:Lv/AutoVDraweeView;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 21
    .line 22
    if-ne p1, v0, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->c:Lv/AutoVDraweeView;

    .line 25
    .line 26
    sget p1, Ll/dbc0;->G:I

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->FEATURED:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 33
    .line 34
    if-ne p1, v0, :cond_2

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->c:Lv/AutoVDraweeView;

    .line 37
    .line 38
    sget p1, Ll/dbc0;->H:I

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 45
    .line 46
    if-ne p1, v0, :cond_3

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->c:Lv/AutoVDraweeView;

    .line 49
    .line 50
    sget p1, Ll/dbc0;->L:I

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 57
    .line 58
    if-ne p1, v0, :cond_4

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->c:Lv/AutoVDraweeView;

    .line 61
    .line 62
    sget p1, Ll/dbc0;->K:I

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 69
    .line 70
    if-ne p1, v0, :cond_5

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->c:Lv/AutoVDraweeView;

    .line 73
    .line 74
    sget p1, Ll/dbc0;->J:I

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 81
    .line 82
    if-ne p1, v0, :cond_6

    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->c:Lv/AutoVDraweeView;

    .line 85
    .line 86
    sget p1, Ll/dbc0;->I:I

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 89
    .line 90
    .line 91
    :cond_6
    :goto_0
    return-void
.end method

.method public n0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->h:Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->x()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->h:Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->E()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->G()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public o0(Ll/pf60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/newui/main/base/TabName;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->B(Ll/pf60;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p0(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;->Dot:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, p1, v0, p2, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->H0(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;ZI)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->C(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public q0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->D(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r0(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$IconDotType;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lv/bottombar/VBottomBarDefaultItem;->e:Lv/VImage;

    .line 8
    .line 9
    const/high16 v1, 0x41880000    # 17.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    sget-object v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$d;->a:[I

    .line 19
    .line 20
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    aget v1, v1, v2

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    const/4 v3, 0x1

    .line 28
    if-eq v1, v3, :cond_2

    .line 29
    .line 30
    const/4 v4, 0x2

    .line 31
    if-eq v1, v4, :cond_1

    .line 32
    .line 33
    const/4 v4, 0x3

    .line 34
    if-eq v1, v4, :cond_0

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    sget v1, Ll/dbc0;->r:I

    .line 38
    .line 39
    const/high16 v4, 0x41a00000    # 20.0f

    .line 40
    .line 41
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    new-array v3, v3, [Landroid/view/View;

    .line 46
    .line 47
    aput-object v0, v3, v2

    .line 48
    .line 49
    invoke-static {v4, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    :goto_0
    move v2, v1

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    sget v1, Ll/dbc0;->N6:I

    .line 55
    .line 56
    const/high16 v4, 0x42280000    # 42.0f

    .line 57
    .line 58
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    new-array v3, v3, [Landroid/view/View;

    .line 63
    .line 64
    aput-object v0, v3, v2

    .line 65
    .line 66
    invoke-static {v4, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 67
    .line 68
    .line 69
    const/high16 v2, 0x41400000    # 12.0f

    .line 70
    .line 71
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-static {v0, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    sget v1, Ll/dbc0;->Ci:I

    .line 80
    .line 81
    const/high16 v4, 0x41e80000    # 29.0f

    .line 82
    .line 83
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    new-array v3, v3, [Landroid/view/View;

    .line 88
    .line 89
    aput-object v0, v3, v2

    .line 90
    .line 91
    invoke-static {v4, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :goto_1
    if-lez v2, :cond_3

    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 98
    .line 99
    invoke-virtual {v0, p1, v2}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->E(Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 100
    .line 101
    .line 102
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->I:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$IconDotType;

    .line 103
    .line 104
    :cond_3
    return-void
.end method

.method public s0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->g:Lv/bottombar/VBottomBar;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->h:Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->G()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->E()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public t0(ZLjava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->s0(Z)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->H0:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_2

    .line 11
    .line 12
    invoke-static {}, Ll/gra;->N3()Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    const/4 v0, 0x0

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    sget-object p2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->y:Lcom/p1/mobile/putong/core/newui/main/a;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/k930;->b1()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    move p1, v0

    .line 34
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->n:Landroid/view/View;

    .line 35
    .line 36
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->n:Landroid/view/View;

    .line 40
    .line 41
    sget v1, Ll/ji30;->f:I

    .line 42
    .line 43
    sget-object v2, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->k()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    add-int/2addr v1, v3

    .line 50
    invoke-static {p2, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->e:Landroid/widget/FrameLayout;

    .line 54
    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    sget v0, Ll/ji30;->f:I

    .line 58
    .line 59
    :cond_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->k()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    add-int/2addr v0, p1

    .line 64
    invoke-static {p0, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 65
    .line 66
    .line 67
    :cond_2
    return-void
.end method

.method public u0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->x:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public v0(Lcom/p1/mobile/putong/newui/main/base/TabName;I)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->w0(Lcom/p1/mobile/putong/newui/main/base/TabName;II)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public w0(Lcom/p1/mobile/putong/newui/main/base/TabName;II)V
    .locals 2
    .param p3    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;->Num:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;

    .line 2
    .line 3
    if-lez p2, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v1, 0x0

    .line 8
    :goto_0
    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->H0(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;ZI)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->H(Lcom/p1/mobile/putong/newui/main/base/TabName;II)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public x0(Lcom/p1/mobile/putong/newui/main/base/TabName;I)V
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->I(Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public y0(Ljava/lang/CharSequence;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Figure;Ljava/lang/String;DLl/x20;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    move-object/from16 v4, p4

    .line 10
    .line 11
    iput-object v4, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->C:Ljava/lang/String;

    .line 12
    .line 13
    move-object/from16 v5, p7

    .line 14
    .line 15
    iput-object v5, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->A:Ll/x20;

    .line 16
    .line 17
    sget-object v5, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 18
    .line 19
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->k()I

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->D0(I)V

    .line 24
    .line 25
    .line 26
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 29
    .line 30
    invoke-virtual {v5}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    invoke-static {v5}, Ll/ige0;->a(Lcom/p1/mobile/putong/data/User;)Z

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    const-string v6, "number"

    .line 39
    .line 40
    if-eqz v5, :cond_2

    .line 41
    .line 42
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    if-eqz v7, :cond_0

    .line 47
    .line 48
    iget-object v7, v3, Lcom/p1/mobile/putong/core/data/Figure;->type:Lcom/p1/mobile/putong/core/data/FigureMessageType;

    .line 49
    .line 50
    const-string v8, "distance"

    .line 51
    .line 52
    invoke-static {v7, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v7

    .line 56
    if-eqz v7, :cond_0

    .line 57
    .line 58
    iget v7, v3, Lcom/p1/mobile/putong/core/data/Figure;->total:I

    .line 59
    .line 60
    if-lez v7, :cond_0

    .line 61
    .line 62
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->m:Lv/VText;

    .line 63
    .line 64
    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    iget-object v1, v3, Lcom/p1/mobile/putong/core/data/Figure;->type:Lcom/p1/mobile/putong/core/data/FigureMessageType;

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iput-object v1, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->D:Ljava/lang/String;

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v7

    .line 80
    if-eqz v7, :cond_1

    .line 81
    .line 82
    iget-object v7, v3, Lcom/p1/mobile/putong/core/data/Figure;->type:Lcom/p1/mobile/putong/core/data/FigureMessageType;

    .line 83
    .line 84
    invoke-static {v7, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result v7

    .line 88
    if-nez v7, :cond_1

    .line 89
    .line 90
    iget-object v7, v3, Lcom/p1/mobile/putong/core/data/Figure;->message:Lcom/p1/mobile/putong/core/data/FigureMessage;

    .line 91
    .line 92
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v7

    .line 96
    if-eqz v7, :cond_1

    .line 97
    .line 98
    iget-object v7, v3, Lcom/p1/mobile/putong/core/data/Figure;->message:Lcom/p1/mobile/putong/core/data/FigureMessage;

    .line 99
    .line 100
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/FigureMessage;->template:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    if-nez v7, :cond_1

    .line 107
    .line 108
    invoke-static {v3}, Ll/e1b;->C0(Lcom/p1/mobile/putong/core/data/Figure;)Ljava/lang/CharSequence;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->m:Lv/VText;

    .line 113
    .line 114
    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    iget-object v1, v3, Lcom/p1/mobile/putong/core/data/Figure;->type:Lcom/p1/mobile/putong/core/data/FigureMessageType;

    .line 118
    .line 119
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    iput-object v1, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->D:Ljava/lang/String;

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_1
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    const-string v3, "#ff3200"

    .line 131
    .line 132
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    const-string v7, "sans-serif"

    .line 137
    .line 138
    const/4 v8, 0x3

    .line 139
    invoke-static {v7, v8}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 140
    .line 141
    .line 142
    move-result-object v7

    .line 143
    invoke-static {v1, v3, v7}, Ll/e1b;->O0(Ljava/lang/String;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->m:Lv/VText;

    .line 148
    .line 149
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    .line 151
    .line 152
    iput-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->D:Ljava/lang/String;

    .line 153
    .line 154
    :goto_0
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->l:Landroid/widget/ImageView;

    .line 155
    .line 156
    invoke-static/range {p5 .. p6}, Ll/pzi0;->K(D)Z

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 161
    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_2
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->m:Lv/VText;

    .line 165
    .line 166
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 167
    .line 168
    .line 169
    iput-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->D:Ljava/lang/String;

    .line 170
    .line 171
    :goto_1
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    const/4 v3, 0x2

    .line 176
    if-nez v1, :cond_4

    .line 177
    .line 178
    if-eqz v5, :cond_3

    .line 179
    .line 180
    invoke-static {}, Ll/rbb0;->q()Z

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    if-eqz v1, :cond_3

    .line 185
    .line 186
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 187
    .line 188
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->k:Lv/VDraweeView;

    .line 189
    .line 190
    const/16 v7, 0x64

    .line 191
    .line 192
    invoke-virtual {v1, v6, v2, v3, v7}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 193
    .line 194
    .line 195
    goto :goto_2

    .line 196
    :cond_3
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 197
    .line 198
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->k:Lv/VDraweeView;

    .line 199
    .line 200
    invoke-virtual {v1, v6, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    :cond_4
    :goto_2
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->z:Landroid/animation/Animator;

    .line 204
    .line 205
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    const/4 v2, 0x0

    .line 210
    if-eqz v1, :cond_6

    .line 211
    .line 212
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->z:Landroid/animation/Animator;

    .line 213
    .line 214
    invoke-virtual {v1}, Landroid/animation/Animator;->isRunning()Z

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    if-eqz v1, :cond_5

    .line 219
    .line 220
    return-void

    .line 221
    :cond_5
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 222
    .line 223
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 224
    .line 225
    .line 226
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 227
    .line 228
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 229
    .line 230
    .line 231
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->z:Landroid/animation/Animator;

    .line 232
    .line 233
    const-wide/16 v2, 0x0

    .line 234
    .line 235
    invoke-virtual {v1, v2, v3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 236
    .line 237
    .line 238
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->z:Landroid/animation/Animator;

    .line 239
    .line 240
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 241
    .line 242
    .line 243
    return-void

    .line 244
    :cond_6
    new-instance v1, Ll/wi30;

    .line 245
    .line 246
    invoke-direct {v1, v0}, Ll/wi30;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V

    .line 247
    .line 248
    .line 249
    invoke-static {v1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 250
    .line 251
    .line 252
    new-instance v1, Ll/xi30;

    .line 253
    .line 254
    invoke-direct {v1, v0}, Ll/xi30;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V

    .line 255
    .line 256
    .line 257
    invoke-static {v1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 258
    .line 259
    .line 260
    new-instance v12, Landroid/view/animation/LinearInterpolator;

    .line 261
    .line 262
    invoke-direct {v12}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 263
    .line 264
    .line 265
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 266
    .line 267
    new-array v13, v3, [F

    .line 268
    .line 269
    fill-array-data v13, :array_0

    .line 270
    .line 271
    .line 272
    const-string v7, "alpha"

    .line 273
    .line 274
    const-wide/16 v8, 0x0

    .line 275
    .line 276
    const-wide/16 v10, 0xc8

    .line 277
    .line 278
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 279
    .line 280
    .line 281
    move-result-object v1

    .line 282
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 283
    .line 284
    new-array v13, v3, [F

    .line 285
    .line 286
    fill-array-data v13, :array_1

    .line 287
    .line 288
    .line 289
    const-string v7, "alpha"

    .line 290
    .line 291
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 292
    .line 293
    .line 294
    move-result-object v6

    .line 295
    const/16 v7, 0x44c

    .line 296
    .line 297
    invoke-static {v7}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 298
    .line 299
    .line 300
    move-result-object v7

    .line 301
    filled-new-array {v1, v7, v6}, [Landroid/animation/Animator;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    invoke-static {v1}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 306
    .line 307
    .line 308
    move-result-object v1

    .line 309
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 310
    .line 311
    iget v7, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->B:I

    .line 312
    .line 313
    neg-int v7, v7

    .line 314
    int-to-float v7, v7

    .line 315
    new-array v13, v3, [F

    .line 316
    .line 317
    const/4 v14, 0x0

    .line 318
    aput v14, v13, v2

    .line 319
    .line 320
    const/4 v15, 0x1

    .line 321
    aput v7, v13, v15

    .line 322
    .line 323
    const-string v7, "translationY"

    .line 324
    .line 325
    const-wide/16 v10, 0x1f4

    .line 326
    .line 327
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 328
    .line 329
    .line 330
    move-result-object v6

    .line 331
    move-object v7, v6

    .line 332
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 333
    .line 334
    iget v8, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->B:I

    .line 335
    .line 336
    neg-int v8, v8

    .line 337
    int-to-float v8, v8

    .line 338
    new-array v13, v3, [F

    .line 339
    .line 340
    aput v8, v13, v2

    .line 341
    .line 342
    aput v14, v13, v15

    .line 343
    .line 344
    move-object v8, v7

    .line 345
    const-string v7, "translationY"

    .line 346
    .line 347
    move-object v10, v8

    .line 348
    const-wide/16 v8, 0x0

    .line 349
    .line 350
    move-object/from16 v16, v10

    .line 351
    .line 352
    const-wide/16 v10, 0x320

    .line 353
    .line 354
    move/from16 p1, v2

    .line 355
    .line 356
    move-object/from16 v2, v16

    .line 357
    .line 358
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 359
    .line 360
    .line 361
    move-result-object v6

    .line 362
    const/16 v16, 0xc8

    .line 363
    .line 364
    invoke-static/range {v16 .. v16}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 365
    .line 366
    .line 367
    move-result-object v7

    .line 368
    filled-new-array {v2, v7, v6}, [Landroid/animation/Animator;

    .line 369
    .line 370
    .line 371
    move-result-object v2

    .line 372
    invoke-static {v2}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 373
    .line 374
    .line 375
    move-result-object v2

    .line 376
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 377
    .line 378
    sget-object v7, Ll/gt0;->i:Landroid/util/Property;

    .line 379
    .line 380
    new-array v13, v3, [F

    .line 381
    .line 382
    fill-array-data v13, :array_2

    .line 383
    .line 384
    .line 385
    const-wide/16 v10, 0x1f4

    .line 386
    .line 387
    invoke-static/range {v6 .. v13}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 388
    .line 389
    .line 390
    move-result-object v6

    .line 391
    move-object v7, v6

    .line 392
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 393
    .line 394
    move-object v8, v7

    .line 395
    sget-object v7, Ll/gt0;->i:Landroid/util/Property;

    .line 396
    .line 397
    new-array v13, v3, [F

    .line 398
    .line 399
    fill-array-data v13, :array_3

    .line 400
    .line 401
    .line 402
    move-object v10, v8

    .line 403
    const-wide/16 v8, 0x0

    .line 404
    .line 405
    move-object/from16 v17, v10

    .line 406
    .line 407
    const-wide/16 v10, 0x320

    .line 408
    .line 409
    move/from16 p2, v14

    .line 410
    .line 411
    move-object/from16 v14, v17

    .line 412
    .line 413
    invoke-static/range {v6 .. v13}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 414
    .line 415
    .line 416
    move-result-object v6

    .line 417
    invoke-static/range {v16 .. v16}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 418
    .line 419
    .line 420
    move-result-object v7

    .line 421
    filled-new-array {v14, v7, v6}, [Landroid/animation/Animator;

    .line 422
    .line 423
    .line 424
    move-result-object v6

    .line 425
    invoke-static {v6}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 426
    .line 427
    .line 428
    move-result-object v14

    .line 429
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->i:Lv/VImage;

    .line 430
    .line 431
    new-array v13, v3, [F

    .line 432
    .line 433
    fill-array-data v13, :array_4

    .line 434
    .line 435
    .line 436
    const-string v7, "rotation"

    .line 437
    .line 438
    const-wide/16 v10, 0x5dc

    .line 439
    .line 440
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 441
    .line 442
    .line 443
    move-result-object v6

    .line 444
    if-nez v5, :cond_7

    .line 445
    .line 446
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 447
    .line 448
    const/high16 v8, 0x41a00000    # 20.0f

    .line 449
    .line 450
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 451
    .line 452
    .line 453
    move-result v8

    .line 454
    int-to-float v8, v8

    .line 455
    invoke-virtual {v7, v8}, Landroid/view/View;->setPivotX(F)V

    .line 456
    .line 457
    .line 458
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 459
    .line 460
    const/high16 v8, 0x42200000    # 40.0f

    .line 461
    .line 462
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 463
    .line 464
    .line 465
    move-result v8

    .line 466
    int-to-float v8, v8

    .line 467
    invoke-virtual {v7, v8}, Landroid/view/View;->setPivotY(F)V

    .line 468
    .line 469
    .line 470
    :cond_7
    move-object v7, v6

    .line 471
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 472
    .line 473
    new-array v13, v3, [F

    .line 474
    .line 475
    fill-array-data v13, :array_5

    .line 476
    .line 477
    .line 478
    move-object v8, v7

    .line 479
    const-string v7, "alpha"

    .line 480
    .line 481
    move-object v10, v8

    .line 482
    const-wide/16 v8, 0x5dc

    .line 483
    .line 484
    move-object/from16 v16, v10

    .line 485
    .line 486
    const-wide/16 v10, 0x190

    .line 487
    .line 488
    move/from16 p3, v15

    .line 489
    .line 490
    move-object/from16 v15, v16

    .line 491
    .line 492
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 493
    .line 494
    .line 495
    move-result-object v6

    .line 496
    move-object v7, v6

    .line 497
    move-wide/from16 v16, v8

    .line 498
    .line 499
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 500
    .line 501
    if-eqz v5, :cond_8

    .line 502
    .line 503
    const/16 v5, 0x15

    .line 504
    .line 505
    new-array v13, v5, [F

    .line 506
    .line 507
    fill-array-data v13, :array_6

    .line 508
    .line 509
    .line 510
    move-object v5, v7

    .line 511
    const-string v7, "translationY"

    .line 512
    .line 513
    const-wide/16 v8, 0x0

    .line 514
    .line 515
    const-wide/16 v10, 0x11f8

    .line 516
    .line 517
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 518
    .line 519
    .line 520
    move-result-object v6

    .line 521
    goto :goto_3

    .line 522
    :cond_8
    move-object v5, v7

    .line 523
    const/16 v7, 0x9

    .line 524
    .line 525
    new-array v13, v7, [F

    .line 526
    .line 527
    fill-array-data v13, :array_7

    .line 528
    .line 529
    .line 530
    const-string v7, "translationY"

    .line 531
    .line 532
    const-wide/16 v8, 0x0

    .line 533
    .line 534
    const-wide/16 v10, 0x7d0

    .line 535
    .line 536
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 537
    .line 538
    .line 539
    move-result-object v6

    .line 540
    :goto_3
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 541
    .line 542
    new-array v13, v3, [F

    .line 543
    .line 544
    fill-array-data v13, :array_8

    .line 545
    .line 546
    .line 547
    move-object v8, v6

    .line 548
    move-object v6, v7

    .line 549
    const-string v7, "alpha"

    .line 550
    .line 551
    move-object v10, v8

    .line 552
    const-wide/16 v8, 0x0

    .line 553
    .line 554
    move-object/from16 v18, v10

    .line 555
    .line 556
    const-wide/16 v10, 0x1f4

    .line 557
    .line 558
    move-object/from16 v19, v18

    .line 559
    .line 560
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 561
    .line 562
    .line 563
    move-result-object v6

    .line 564
    move-object v7, v6

    .line 565
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 566
    .line 567
    move-object v8, v7

    .line 568
    sget-object v7, Ll/gt0;->i:Landroid/util/Property;

    .line 569
    .line 570
    new-array v13, v3, [F

    .line 571
    .line 572
    fill-array-data v13, :array_9

    .line 573
    .line 574
    .line 575
    const-wide/16 v10, 0x190

    .line 576
    .line 577
    move-object/from16 v20, v8

    .line 578
    .line 579
    move-wide/from16 v8, v16

    .line 580
    .line 581
    invoke-static/range {v6 .. v13}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 582
    .line 583
    .line 584
    move-result-object v6

    .line 585
    move-object v7, v6

    .line 586
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->j:Lv/VLinear;

    .line 587
    .line 588
    const/high16 v10, 0x41c00000    # 24.0f

    .line 589
    .line 590
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 591
    .line 592
    .line 593
    move-result v10

    .line 594
    int-to-float v10, v10

    .line 595
    new-array v13, v3, [F

    .line 596
    .line 597
    aput v10, v13, p1

    .line 598
    .line 599
    aput p2, v13, p3

    .line 600
    .line 601
    move-object v3, v7

    .line 602
    const-string v7, "translationY"

    .line 603
    .line 604
    const-wide/16 v10, 0x190

    .line 605
    .line 606
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 607
    .line 608
    .line 609
    move-result-object v6

    .line 610
    move-object/from16 v8, v19

    .line 611
    .line 612
    move-object/from16 v7, v20

    .line 613
    .line 614
    filled-new-array {v5, v8, v7}, [Landroid/animation/Animator;

    .line 615
    .line 616
    .line 617
    move-result-object v5

    .line 618
    invoke-static {v5}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 619
    .line 620
    .line 621
    move-result-object v5

    .line 622
    filled-new-array {v5, v3, v6}, [Landroid/animation/Animator;

    .line 623
    .line 624
    .line 625
    move-result-object v3

    .line 626
    invoke-static {v3}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 627
    .line 628
    .line 629
    move-result-object v3

    .line 630
    filled-new-array {v1, v2, v14, v15, v3}, [Landroid/animation/Animator;

    .line 631
    .line 632
    .line 633
    move-result-object v1

    .line 634
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 635
    .line 636
    .line 637
    move-result-object v1

    .line 638
    iput-object v1, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->z:Landroid/animation/Animator;

    .line 639
    .line 640
    new-instance v1, Ll/yi30;

    .line 641
    .line 642
    invoke-direct {v1, v0}, Ll/yi30;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V

    .line 643
    .line 644
    .line 645
    invoke-static {v6, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 646
    .line 647
    .line 648
    new-instance v1, Ll/zi30;

    .line 649
    .line 650
    invoke-direct {v1, v0}, Ll/zi30;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V

    .line 651
    .line 652
    .line 653
    invoke-static {v5, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 654
    .line 655
    .line 656
    new-instance v1, Ll/li30;

    .line 657
    .line 658
    invoke-direct {v1, v0}, Ll/li30;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V

    .line 659
    .line 660
    .line 661
    invoke-static {v15, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 662
    .line 663
    .line 664
    new-instance v1, Ll/mi30;

    .line 665
    .line 666
    invoke-direct {v1, v0}, Ll/mi30;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V

    .line 667
    .line 668
    .line 669
    invoke-static {v15, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 670
    .line 671
    .line 672
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->z:Landroid/animation/Animator;

    .line 673
    .line 674
    new-instance v2, Ll/ni30;

    .line 675
    .line 676
    invoke-direct {v2, v0, v4}, Ll/ni30;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;Ljava/lang/String;)V

    .line 677
    .line 678
    .line 679
    new-instance v3, Ll/oi30;

    .line 680
    .line 681
    invoke-direct {v3, v0}, Ll/oi30;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V

    .line 682
    .line 683
    .line 684
    invoke-static {v1, v2, v3}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 685
    .line 686
    .line 687
    const-string v1, "old"

    .line 688
    .line 689
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 690
    .line 691
    .line 692
    move-result v1

    .line 693
    if-eqz v1, :cond_9

    .line 694
    .line 695
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->z:Landroid/animation/Animator;

    .line 696
    .line 697
    const-wide/16 v2, 0x3e8

    .line 698
    .line 699
    invoke-virtual {v1, v2, v3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 700
    .line 701
    .line 702
    :cond_9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->z:Landroid/animation/Animator;

    .line 703
    .line 704
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 705
    .line 706
    .line 707
    return-void

    .line 708
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x4019999a    # 2.4f
    .end array-data

    :array_3
    .array-data 4
        0x4019999a    # 2.4f
        0x3f800000    # 1.0f
    .end array-data

    :array_4
    .array-data 4
        0x0
        0x44340000    # 720.0f
    .end array-data

    :array_5
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_6
    .array-data 4
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x0
    .end array-data

    :array_7
    .array-data 4
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x0
    .end array-data

    :array_8
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_9
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public z0(Lcom/p1/mobile/putong/core/data/PopGuide;)V
    .locals 3

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->b:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 8
    .line 9
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 10
    .line 11
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lv/bottombar/VBottomBarDefaultItem;->getIconView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {v0, v1, p0, p1}, Ll/m6i;->f(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Landroid/view/View;Lcom/p1/mobile/putong/core/data/PopGuide;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
