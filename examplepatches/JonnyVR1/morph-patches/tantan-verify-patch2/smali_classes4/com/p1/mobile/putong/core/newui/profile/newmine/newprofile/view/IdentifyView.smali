.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;
.super Lv/VLinear;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;
    }
.end annotation


# instance fields
.field public c:Landroid/widget/RelativeLayout;

.field public d:Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;

.field public e:Lv/VLinear;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VImage;

.field public i:Lv/VOnlineIndicator;

.field public j:Lcom/p1/mobile/android/app/Act;

.field public k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/data/MyTabTask;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "verification"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->f0(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->d0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Ll/pf60;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->e0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic W(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->a0()V

    return-void
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->g0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic Y(Lcom/p1/mobile/putong/core/data/VerificationCenter;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->A7()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private c0(Ljava/util/List;Landroid/view/ViewGroup;IIII)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/view/ViewGroup;",
            "IIII)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/String;

    .line 16
    .line 17
    new-instance v1, Lv/VDraweeView;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->j:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-direct {v1, v2}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 25
    .line 26
    invoke-direct {v2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 27
    .line 28
    .line 29
    const/4 v3, 0x1

    .line 30
    invoke-virtual {v2, v3}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Ll/wlj;

    .line 38
    .line 39
    invoke-virtual {v3, v2}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 40
    .line 41
    .line 42
    if-eqz p6, :cond_0

    .line 43
    .line 44
    new-instance v2, Landroid/graphics/drawable/ShapeDrawable;

    .line 45
    .line 46
    new-instance v3, Landroid/graphics/drawable/shapes/OvalShape;

    .line 47
    .line 48
    invoke-direct {v3}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-direct {v2, v3}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v3, p6}, Landroid/graphics/Paint;->setColor(I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, p5, p5, p5, p5}, Landroid/view/View;->setPadding(IIII)V

    .line 65
    .line 66
    .line 67
    :cond_0
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 68
    .line 69
    invoke-direct {v2, p3, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    if-lez v3, :cond_1

    .line 77
    .line 78
    neg-int v3, p4

    .line 79
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 80
    .line 81
    :cond_1
    invoke-virtual {p2, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 82
    .line 83
    .line 84
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 85
    .line 86
    invoke-virtual {v2, v1, v0, p3, p3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    return-void
.end method

.method private synthetic d0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->i0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getTrackGuidanceStatus()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;->INVITE:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const-string p0, "invite_verify"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;->ONLY_CERT:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 11
    .line 12
    if-ne p0, v0, :cond_1

    .line 13
    .line 14
    const-string p0, "trial_like"

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;->SWIPE_LIMIT:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 18
    .line 19
    if-ne p0, v0, :cond_2

    .line 20
    .line 21
    const-string p0, "like_limit"

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_3

    .line 37
    .line 38
    const-string p0, "verified"

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_3
    const-string p0, "unverified_default"

    .line 42
    .line 43
    return-object p0
.end method


# virtual methods
.method public final Z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zem;->a(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final a0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->i:Lv/VOnlineIndicator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "red_dot"

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "verification_guidance_status"

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->getTrackGuidanceStatus()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "e_verification_entrance"

    .line 32
    .line 33
    const-string v1, "p_navigation_view"

    .line 34
    .line 35
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final b0(Ljava/util/List;Landroid/view/ViewGroup;I)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/view/ViewGroup;",
            "I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ljava/lang/String;

    .line 17
    .line 18
    const-string v2, "res"

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    move v8, v0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v8, p3

    .line 29
    :goto_0
    sget v5, Ll/qa00;->p:I

    .line 30
    .line 31
    const/high16 p3, 0x40e00000    # 7.0f

    .line 32
    .line 33
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    sget v7, Ll/qa00;->c:I

    .line 38
    .line 39
    move-object v2, p0

    .line 40
    move-object v3, p1

    .line 41
    move-object v4, p2

    .line 42
    invoke-direct/range {v2 .. v8}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->c0(Ljava/util/List;Landroid/view/ViewGroup;IIII)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic e0(Ll/pf60;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->p2()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ll/yem;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/yem;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;)V

    .line 14
    .line 15
    .line 16
    const-wide/16 v1, 0xc8

    .line 17
    .line 18
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->j0()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic f0(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->j0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic g0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->j0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final h0()V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    :goto_0
    invoke-static {}, Ll/gra;->B3()I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-ge p0, v0, :cond_0

    .line 7
    .line 8
    add-int/lit8 p0, p0, 0x1

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    return-void
.end method

.method public final i0()V
    .locals 4

    .line 1
    const-string v0, "e_avatarVerification_main_entrance_click"

    .line 2
    .line 3
    const-string v1, "p_navigation_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->j:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    const-string v2, "button"

    .line 11
    .line 12
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 13
    .line 14
    invoke-static {v0, v2, v3}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->X1(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/gra;->p2()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/dkb;->ua()V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->i:Lv/VOnlineIndicator;

    .line 39
    .line 40
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;->INVITE:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 47
    .line 48
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->i:Lv/VOnlineIndicator;

    .line 49
    .line 50
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v2, "red_dot"

    .line 59
    .line 60
    invoke-static {v2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v2, "verification_guidance_status"

    .line 65
    .line 66
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->getTrackGuidanceStatus()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    filled-new-array {v0, v2}, [Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const-string v2, "e_verification_entrance"

    .line 79
    .line 80
    invoke-static {v2, v1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 81
    .line 82
    .line 83
    const/4 v0, 0x0

    .line 84
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->l0(Z)V

    .line 85
    .line 86
    .line 87
    :cond_1
    return-void
.end method

.method public j0()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 3
    .line 4
    invoke-static {}, Ll/gra;->o2()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/gra;->p2()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->g:Lv/VText;

    .line 33
    .line 34
    const-string v3, "\u8ba4\u8bc1\u6743\u76ca\u751f\u6548\u4e2d"

    .line 35
    .line 36
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->e:Lv/VLinear;

    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->f:Lv/VImage;

    .line 45
    .line 46
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-static {}, Ll/gra;->p2()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_6

    .line 55
    .line 56
    invoke-static {}, Ll/gra;->Z2()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_3

    .line 75
    .line 76
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 79
    .line 80
    iget-object v0, v0, Ll/dkb;->i7:Lrx/subjects/a;

    .line 81
    .line 82
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Ljava/util/Collection;

    .line 87
    .line 88
    new-instance v3, Ll/xem;

    .line 89
    .line 90
    invoke-direct {v3}, Ll/xem;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-static {v0, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Lcom/p1/mobile/putong/core/data/MyTabTask;

    .line 98
    .line 99
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    if-eqz v3, :cond_3

    .line 104
    .line 105
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/MyTabTask;->extraInfos:Lcom/p1/mobile/putong/core/data/ExtraInfos;

    .line 106
    .line 107
    iget v4, v3, Lcom/p1/mobile/putong/core/data/ExtraInfos;->trialLikedCount:I

    .line 108
    .line 109
    if-lez v4, :cond_3

    .line 110
    .line 111
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ExtraInfos;->trialLikedAvatars:Ljava/util/List;

    .line 112
    .line 113
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    if-nez v3, :cond_3

    .line 118
    .line 119
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MyTabTask;->extraInfos:Lcom/p1/mobile/putong/core/data/ExtraInfos;

    .line 120
    .line 121
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ExtraInfos;->trialLikedAvatars:Ljava/util/List;

    .line 122
    .line 123
    const/4 v3, 0x2

    .line 124
    invoke-static {v0, v3}, Ll/jyb;->k0(Ljava/util/List;I)Ljava/util/List;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->e:Lv/VLinear;

    .line 129
    .line 130
    const-string v4, "#f7f7f7"

    .line 131
    .line 132
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    move-result v4

    .line 136
    invoke-virtual {p0, v0, v3, v4}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->b0(Ljava/util/List;Landroid/view/ViewGroup;I)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->g:Lv/VText;

    .line 140
    .line 141
    const-string v3, "\"\u53ea\u770b\u8ba4\u8bc1\"\u5f85\u89e3\u9501"

    .line 142
    .line 143
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->e:Lv/VLinear;

    .line 147
    .line 148
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->f:Lv/VImage;

    .line 152
    .line 153
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 154
    .line 155
    .line 156
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;->ONLY_CERT:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 157
    .line 158
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 159
    .line 160
    sget-object v0, Ll/esc0;->f:Ljava/lang/String;

    .line 161
    .line 162
    invoke-static {v0}, Ll/esc0;->c(Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-ge v0, v2, :cond_2

    .line 167
    .line 168
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->l0(Z)V

    .line 169
    .line 170
    .line 171
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->h0()V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :cond_3
    invoke-static {}, Ll/j1a;->C()Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-eqz v0, :cond_5

    .line 180
    .line 181
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 182
    .line 183
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 184
    .line 185
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-nez v0, :cond_5

    .line 194
    .line 195
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->g:Lv/VText;

    .line 196
    .line 197
    const-string v3, "\u8ba4\u8bc1\u540e\u63d0\u5347\u6bcf\u65e5\u53f3\u6ed1\u4e0a\u9650"

    .line 198
    .line 199
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->e:Lv/VLinear;

    .line 203
    .line 204
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->f:Lv/VImage;

    .line 208
    .line 209
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 210
    .line 211
    .line 212
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;->SWIPE_LIMIT:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 213
    .line 214
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 215
    .line 216
    sget-object v0, Ll/esc0;->g:Ljava/lang/String;

    .line 217
    .line 218
    invoke-static {v0}, Ll/esc0;->c(Ljava/lang/String;)I

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-ge v0, v2, :cond_4

    .line 223
    .line 224
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->l0(Z)V

    .line 225
    .line 226
    .line 227
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->h0()V

    .line 228
    .line 229
    .line 230
    return-void

    .line 231
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->g:Lv/VText;

    .line 232
    .line 233
    const-string v3, "\u5b8c\u6210\u8ba4\u8bc1\uff0c\u89e3\u9501\u591a\u9879\u6743\u76ca"

    .line 234
    .line 235
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 236
    .line 237
    .line 238
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->e:Lv/VLinear;

    .line 239
    .line 240
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 241
    .line 242
    .line 243
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->f:Lv/VImage;

    .line 244
    .line 245
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 246
    .line 247
    .line 248
    return-void

    .line 249
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->g:Lv/VText;

    .line 250
    .line 251
    const-string v3, "\u8ba4\u8bc1\u4e2d\u5fc3"

    .line 252
    .line 253
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 254
    .line 255
    .line 256
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->e:Lv/VLinear;

    .line 257
    .line 258
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 259
    .line 260
    .line 261
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->f:Lv/VImage;

    .line 262
    .line 263
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 264
    .line 265
    .line 266
    return-void
.end method

.method public k0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->d:Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->d:Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;

    .line 8
    .line 9
    const/high16 v1, 0x42080000    # 34.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->g:Lv/VText;

    .line 19
    .line 20
    sget v1, Ll/qa00;->e:I

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->g:Lv/VText;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->d:Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->g:Lv/VText;

    .line 37
    .line 38
    const/high16 v2, 0x41400000    # 12.0f

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->g:Lv/VText;

    .line 44
    .line 45
    const/high16 v2, -0x1000000

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->g:Lv/VText;

    .line 51
    .line 52
    const/4 v2, 0x3

    .line 53
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->f:Lv/VImage;

    .line 61
    .line 62
    sget v1, Ll/dbc0;->or:I

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->f:Lv/VImage;

    .line 68
    .line 69
    sget v1, Ll/qa00;->h:I

    .line 70
    .line 71
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->h:Lv/VImage;

    .line 75
    .line 76
    sget v1, Ll/qa00;->i:I

    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->h:Lv/VImage;

    .line 82
    .line 83
    sget v1, Ll/dbc0;->nr:I

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->d:Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;

    .line 89
    .line 90
    sget v1, Ll/dbc0;->f7:I

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->f(I)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->d:Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;

    .line 96
    .line 97
    const/high16 v0, 0x41200000    # 10.0f

    .line 98
    .line 99
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    const/4 v1, 0x1

    .line 104
    const v2, -0x7e1d01

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, v1, v2, v0}, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->e(ZII)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public l0(Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->p2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/esc0;->e:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Ll/esc0;->c(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {}, Ll/gra;->I()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-ge v0, v1, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->i:Lv/VOnlineIndicator;

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/d0;->i0:Ll/jxd0;

    .line 38
    .line 39
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->j:Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->t7()V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 54
    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->i:Lv/VOnlineIndicator;

    .line 58
    .line 59
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    :cond_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->Z(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->j:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->d:Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;

    .line 16
    .line 17
    new-instance v1, Ll/qem;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/qem;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/gra;->L3()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->c:Landroid/widget/RelativeLayout;

    .line 32
    .line 33
    const/high16 v1, 0x42300000    # 44.0f

    .line 34
    .line 35
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ll/gra;->p2()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->d:Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;

    .line 49
    .line 50
    const/high16 v1, 0x42100000    # 36.0f

    .line 51
    .line 52
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->j:Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    move-object v1, v0

    .line 62
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o7()Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->j:Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    new-instance v3, Ll/p040;

    .line 83
    .line 84
    invoke-direct {v3}, Ll/p040;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-static {v1, v2, v3}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    new-instance v2, Ll/rem;

    .line 92
    .line 93
    invoke-direct {v2}, Ll/rem;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    new-instance v1, Ll/sem;

    .line 105
    .line 106
    invoke-direct {v1, p0}, Ll/sem;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;)V

    .line 107
    .line 108
    .line 109
    new-instance v2, Ll/tem;

    .line 110
    .line 111
    invoke-direct {v2}, Ll/tem;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 119
    .line 120
    .line 121
    invoke-static {}, Ll/gra;->p2()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->j:Lcom/p1/mobile/android/app/Act;

    .line 126
    .line 127
    const/4 v2, 0x0

    .line 128
    if-eqz v0, :cond_1

    .line 129
    .line 130
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 131
    .line 132
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 133
    .line 134
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    new-instance v1, Ll/uem;

    .line 147
    .line 148
    invoke-direct {v1}, Ll/uem;-><init>()V

    .line 149
    .line 150
    .line 151
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->j:Lcom/p1/mobile/android/app/Act;

    .line 159
    .line 160
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 161
    .line 162
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 163
    .line 164
    iget-object v1, v1, Ll/dkb;->i7:Lrx/subjects/a;

    .line 165
    .line 166
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 171
    .line 172
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 173
    .line 174
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->m3()Lrx/c;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    invoke-virtual {v3}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 183
    .line 184
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->U0:Lrx/subjects/a;

    .line 185
    .line 186
    invoke-virtual {v4}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    invoke-static {v1, v3, v4}, Lrx/c;->merge(Lrx/c;Lrx/c;Lrx/c;)Lrx/c;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    new-instance v1, Ll/vem;

    .line 199
    .line 200
    invoke-direct {v1, p0}, Ll/vem;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;)V

    .line 201
    .line 202
    .line 203
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 208
    .line 209
    .line 210
    goto :goto_0

    .line 211
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 212
    .line 213
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 214
    .line 215
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    new-instance v1, Ll/wem;

    .line 228
    .line 229
    invoke-direct {v1, p0}, Ll/wem;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;)V

    .line 230
    .line 231
    .line 232
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 237
    .line 238
    .line 239
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView;->j0()V

    .line 240
    .line 241
    .line 242
    return-void
.end method
