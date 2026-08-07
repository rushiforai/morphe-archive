.class public Ll/pkp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/pkp$e;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/hjp;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/android/app/Act;

.field public B:Ll/hjp;

.field public C:Ll/f1g0;

.field public D:Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;

.field public E:Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

.field public E0:Ljava/lang/Runnable;

.field public F:Ll/s740;

.field public F0:Ll/k3l;

.field public G:I

.field public G0:Ll/pkp$e;

.field public H:Z

.field public H0:Ll/pkp$e;

.field public I:Z

.field public final I0:Ljava/lang/Runnable;

.field public J:Z

.field public J0:Ll/jl80;

.field public K:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public L:Z

.field public M:Z

.field public N:Z

.field public O:Z

.field public P:Landroid/view/View;

.field public Q:J

.field public R:Ljava/lang/String;

.field public S:Ljava/lang/String;

.field public T:Ljava/lang/String;

.field public U:Ljava/lang/String;

.field public V:Ljava/lang/String;

.field public W:Ljava/lang/String;

.field public X:Ljava/lang/String;

.field public Y:Ll/y20;

.field public Z:Ll/fqj0;

.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

.field public d:Landroid/widget/RelativeLayout;

.field public e:Lv/VFrame_Squared;

.field public f:Lcom/p1/mobile/putong/core/ui/RadarRipple;

.field public g:Lv/VDraweeView;

.field public h:Lv/VRelative;

.field public i:Lv/VImage;

.field public j:Lv/VImage;

.field public k:Lv/VLinear;

.field public k0:Ll/bvl;

.field public l:Lv/VDraweeView;

.field public m:Lv/VText;

.field public n:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;

.field public o:Lv/VFrame;

.field public p:Lv/VFrame;

.field public p0:Landroid/animation/Animator;

.field public q:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public r:Landroid/view/View;

.field public s:Lv/VText;

.field public t:Landroid/widget/LinearLayout;

.field public u:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public v:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public w:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public x:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public y:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public z:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/pkp;->H:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/pkp;->I:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/pkp;->J:Z

    .line 11
    .line 12
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/pkp;->K:Lrx/subjects/a;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Ll/pkp;->P:Landroid/view/View;

    .line 22
    .line 23
    const-wide/16 v0, -0x1

    .line 24
    .line 25
    iput-wide v0, p0, Ll/pkp;->Q:J

    .line 26
    .line 27
    const-string v0, "empty"

    .line 28
    .line 29
    iput-object v0, p0, Ll/pkp;->R:Ljava/lang/String;

    .line 30
    .line 31
    const-string v0, "@@"

    .line 32
    .line 33
    iput-object v0, p0, Ll/pkp;->S:Ljava/lang/String;

    .line 34
    .line 35
    new-instance v0, Ll/pkp$b;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/pkp$b;-><init>(Ll/pkp;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/pkp;->E0:Ljava/lang/Runnable;

    .line 41
    .line 42
    new-instance v0, Ll/pkp$c;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/pkp$c;-><init>(Ll/pkp;)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ll/pkp;->F0:Ll/k3l;

    .line 48
    .line 49
    new-instance v0, Ll/pjp;

    .line 50
    .line 51
    invoke-direct {v0}, Ll/pjp;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Ll/pkp;->I0:Ljava/lang/Runnable;

    .line 55
    .line 56
    iput-object p1, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    iput-object p2, p0, Ll/pkp;->E:Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 59
    .line 60
    return-void
.end method

.method public static synthetic A(Ll/pkp;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pkp;->P0()V

    return-void
.end method

.method private A0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/d79;->I()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget v0, Ll/kec0;->c4:I

    .line 8
    .line 9
    invoke-direct {p0, v0}, Ll/pkp;->w0(I)Ll/bvl;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget v0, Ll/kec0;->Y3:I

    .line 17
    .line 18
    invoke-direct {p0, v0}, Ll/pkp;->w0(I)Ll/bvl;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 23
    .line 24
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 31
    .line 32
    invoke-interface {v0}, Ll/bvl;->getButtonRootLayout()Landroid/view/ViewGroup;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget v1, Ll/adc0;->s5:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/pkp;->p:Lv/VFrame;

    .line 42
    .line 43
    iget-object p0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 44
    .line 45
    invoke-interface {p0}, Ll/bvl;->getRootBtnLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v1, v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public static synthetic B(Ll/pkp;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pkp;->l1(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic C(Ll/pkp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pkp;->T0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/pkp;Ll/f1g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/pkp;->f1(Ll/f1g0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/pkp;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pkp;->m1()V

    return-void
.end method

.method public static synthetic G(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(Ll/pkp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pkp;->a1(Landroid/view/View;)V

    return-void
.end method

.method private H1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/pkp;->I1(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic I(Ll/pkp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pkp;->O0(Landroid/view/View;)V

    return-void
.end method

.method private I1(Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    const-string v1, "0"

    .line 47
    .line 48
    :goto_0
    const-string v2, "moments_user_id"

    .line 49
    .line 50
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {}, Ll/rbb0;->t()Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    const/4 v3, 0x1

    .line 59
    xor-int/2addr v2, v3

    .line 60
    const-string v4, "is_privileged"

    .line 61
    .line 62
    invoke-static {v4, v2}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    const-string v4, "showfrom_superlike"

    .line 67
    .line 68
    const-string v5, "home"

    .line 69
    .line 70
    invoke-static {v4, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    filled-new-array {v1, v2, v4}, [Ll/sfj0$a;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const-string v2, "e_superlikeButton"

    .line 79
    .line 80
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    if-eqz v0, :cond_1

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const-string v1, "superlike"

    .line 94
    .line 95
    invoke-direct {p0, v0, v1}, Ll/pkp;->V(Ll/f1g0;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_1
    invoke-virtual {p0}, Ll/pkp;->Q1()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_2

    .line 103
    .line 104
    return-void

    .line 105
    :cond_2
    iget-object p0, p0, Ll/pkp;->B:Ll/hjp;

    .line 106
    .line 107
    invoke-virtual {p0, v3, p1}, Ll/hjp;->F2(ZZ)Z

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public static synthetic J()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_intl_tribe_exit_wait_click"

    .line 5
    .line 6
    const-string v2, "p_intl_tribe_exit_intercept_pop"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic K(Ll/pkp;Ll/f1g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pkp;->d1(Ll/f1g0;Landroid/view/View;)V

    return-void
.end method

.method private synthetic K0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pkp;->H1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private K1(Ljava/lang/String;)V
    .locals 4

    .line 1
    const-string v0, "like"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p1, "right"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "superlike"

    .line 13
    .line 14
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const-string p1, "up"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const-string v0, "undo"

    .line 24
    .line 25
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    const-string p1, "back"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const-string p1, "left"

    .line 35
    .line 36
    :goto_0
    iget-wide v0, p0, Ll/pkp;->Q:J

    .line 37
    .line 38
    const-wide/16 v2, 0x0

    .line 39
    .line 40
    cmp-long v0, v0, v2

    .line 41
    .line 42
    if-lez v0, :cond_3

    .line 43
    .line 44
    invoke-static {}, Ll/pzi0;->o()J

    .line 45
    .line 46
    .line 47
    move-result-wide v0

    .line 48
    iget-wide v2, p0, Ll/pkp;->Q:J

    .line 49
    .line 50
    sub-long/2addr v0, v2

    .line 51
    goto :goto_1

    .line 52
    :cond_3
    const-wide/16 v0, -0x1

    .line 53
    .line 54
    :goto_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 55
    .line 56
    .line 57
    move-result-wide v2

    .line 58
    iput-wide v2, p0, Ll/pkp;->Q:J

    .line 59
    .line 60
    const-string v2, "current_operation"

    .line 61
    .line 62
    invoke-static {v2, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    const-string v3, "operation_interval"

    .line 67
    .line 68
    invoke-static {v3, v0, v1}, Ll/sfj0$a;->g(Ljava/lang/String;J)Ll/sfj0$a;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v1, "last_operation"

    .line 73
    .line 74
    iget-object v3, p0, Ll/pkp;->R:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    filled-new-array {v2, v0, v1}, [Ll/sfj0$a;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    const-string v1, "e_card_click_interval"

    .line 85
    .line 86
    const-string v2, "p_suggest_users_home_view"

    .line 87
    .line 88
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 89
    .line 90
    .line 91
    iput-object p1, p0, Ll/pkp;->R:Ljava/lang/String;

    .line 92
    .line 93
    return-void
.end method

.method public static bridge synthetic L(Ll/pkp;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method private synthetic L0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pkp;->H1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private L1(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pkp;->E:Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/pkp;->E:Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isHidden()Z

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
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->C(Z)V

    .line 21
    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->u()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->t()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static bridge synthetic M(Ll/pkp;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->I0:Ljava/lang/Runnable;

    return-object p0
.end method

.method private synthetic M0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pkp;->O1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private M1(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pkp;->E:Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/pkp;->E:Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isHidden()Z

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
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->C(Z)V

    .line 21
    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->w()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->v()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static bridge synthetic N(Ll/pkp;)Landroid/animation/Animator;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->p0:Landroid/animation/Animator;

    return-object p0
.end method

.method public static bridge synthetic O(Ll/pkp;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pkp;->T(Z)V

    return-void
.end method

.method public static bridge synthetic P(Ll/pkp;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pkp;->L1(Z)V

    return-void
.end method

.method private P1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pkp;->K:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/pkp;->r0()Ll/avl;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/pkp;->n0()Ll/avl;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-interface {p0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_0
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object v1, p0, Ll/pkp;->G0:Ll/pkp$e;

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-object v1, p0, Ll/pkp;->H0:Ll/pkp$e;

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    const/4 v1, 0x1

    .line 119
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0}, Ll/pkp;->r0()Ll/avl;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Ll/pkp;->n0()Ll/avl;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-interface {p0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public static bridge synthetic Q(Ll/pkp;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pkp;->M1(Z)V

    return-void
.end method

.method private synthetic R0()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->q7()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    const-string v1, "p_intl_tribe_empty_state_view,e_intl_tribe_empty_state_location_click,click"

    .line 18
    .line 19
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ug(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->aj(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ll/pkp;->F1(Landroid/content/Intent;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private T(Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bvl;->getImmediatelyMatch()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Ll/avl;->getRealView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const/high16 v1, 0x3f800000    # 1.0f

    .line 22
    .line 23
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-wide/16 v2, 0x190

    .line 32
    .line 33
    invoke-virtual {p1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-wide/16 v4, 0xc8

    .line 38
    .line 39
    invoke-virtual {p1, v4, v5}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/pkp;->o0()Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1, v4, v5}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Ll/pkp;->r0()Ll/avl;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-interface {p1}, Ll/avl;->getRealView()Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1, v4, v5}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-interface {p0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {p0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {p0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 133
    .line 134
    .line 135
    invoke-static {}, Ll/d79;->G()Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-eqz p0, :cond_0

    .line 140
    .line 141
    if-eqz v0, :cond_0

    .line 142
    .line 143
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {p0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-virtual {p0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 164
    .line 165
    .line 166
    :cond_0
    invoke-static {}, Ll/z5h0;->j()Ll/z5h0;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    iget-object p0, p0, Ll/z5h0;->b:Lrx/subjects/b;

    .line 171
    .line 172
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 173
    .line 174
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_1
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    invoke-interface {p1}, Ll/avl;->getRealView()Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    const/4 v1, 0x0

    .line 191
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    const-wide/16 v2, 0x0

    .line 200
    .line 201
    invoke-virtual {p1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    const-wide/16 v4, 0x12c

    .line 206
    .line 207
    invoke-virtual {p1, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p0}, Ll/pkp;->o0()Landroid/view/View;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    invoke-virtual {p1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    invoke-virtual {p1, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p0}, Ll/pkp;->r0()Ll/avl;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    invoke-interface {p1}, Ll/avl;->getRealView()Landroid/view/View;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    invoke-virtual {p1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    invoke-virtual {p1, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 270
    .line 271
    .line 272
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    invoke-interface {p0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 281
    .line 282
    .line 283
    move-result-object p0

    .line 284
    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 285
    .line 286
    .line 287
    move-result-object p0

    .line 288
    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    invoke-virtual {p0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    invoke-virtual {p0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 301
    .line 302
    .line 303
    invoke-static {}, Ll/d79;->G()Z

    .line 304
    .line 305
    .line 306
    move-result p0

    .line 307
    if-eqz p0, :cond_2

    .line 308
    .line 309
    if-eqz v0, :cond_2

    .line 310
    .line 311
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 312
    .line 313
    .line 314
    move-result-object p0

    .line 315
    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 320
    .line 321
    .line 322
    move-result-object p0

    .line 323
    invoke-virtual {p0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    .line 324
    .line 325
    .line 326
    move-result-object p0

    .line 327
    invoke-virtual {p0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 332
    .line 333
    .line 334
    :cond_2
    return-void
.end method

.method private V(Ll/f1g0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Ll/pkp;->K1(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1, p2}, Ll/r2j0;->h(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Ll/pkp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pkp;->j1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/pkp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pkp;->K0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/pkp;Ll/f1g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/pkp;->h1(Ll/f1g0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/pkp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pkp;->L0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic e1(Ll/f1g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/f1g0;->d()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/pkp;->J1(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic f(Ll/pkp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pkp;->R0()V

    return-void
.end method

.method private synthetic f1(Ll/f1g0;Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p2, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-interface {p1}, Ll/f1g0;->o()Ll/ik4;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ll/f1g0;->o()Ll/ik4;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-interface {p1}, Ll/f1g0;->o()Ll/ik4;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const-string v0, "0"

    .line 43
    .line 44
    :goto_0
    const-string v1, "receiver_user_id"

    .line 45
    .line 46
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "intl_tribe_source_name"

    .line 51
    .line 52
    iget-object v2, p0, Ll/pkp;->U:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const-string v2, "intl_get_see_source"

    .line 59
    .line 60
    const-string v3, "tribe"

    .line 61
    .line 62
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    filled-new-array {v0, v1, v2}, [Ll/sfj0$a;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v1, "e_intl_tribe_card_like_click"

    .line 71
    .line 72
    invoke-static {v1, p2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 73
    .line 74
    .line 75
    const-string p2, "like"

    .line 76
    .line 77
    invoke-direct {p0, p1, p2}, Ll/pkp;->V(Ll/f1g0;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 81
    .line 82
    invoke-interface {p1, p0}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method private synthetic g1(Ll/f1g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p2}, Ll/f1g0;->d()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p2

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
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-interface {p2}, Ll/f1g0;->o()Ll/ik4;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 41
    .line 42
    invoke-interface {p1, p0}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private synthetic h1(Ll/f1g0;Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p2, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-interface {p1}, Ll/f1g0;->o()Ll/ik4;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ll/f1g0;->o()Ll/ik4;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-interface {p1}, Ll/f1g0;->o()Ll/ik4;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const-string v0, "0"

    .line 43
    .line 44
    :goto_0
    const-string v1, "receiver_user_id"

    .line 45
    .line 46
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "intl_tribe_source_name"

    .line 51
    .line 52
    iget-object v2, p0, Ll/pkp;->U:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const-string v2, "intl_get_see_source"

    .line 59
    .line 60
    const-string v3, "tribe"

    .line 61
    .line 62
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    filled-new-array {v0, v1, v2}, [Ll/sfj0$a;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v1, "e_intl_tribe_card_dislike_click"

    .line 71
    .line 72
    invoke-static {v1, p2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 73
    .line 74
    .line 75
    const-string p2, "dislike"

    .line 76
    .line 77
    invoke-direct {p0, p1, p2}, Ll/pkp;->V(Ll/f1g0;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 85
    .line 86
    invoke-interface {p0, p1}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public static synthetic i(Ll/pkp;Ll/f1g0;ZFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/pkp;->X0(Ll/f1g0;ZFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    return-void
.end method

.method public static synthetic j()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "bubble_superlike_bubble"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/z5h0;->u()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic j1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pkp;->O1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ll/pkp;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pkp;->Y0()V

    return-void
.end method

.method public static synthetic l(Ll/pkp;Ll/f1g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pkp;->U0(Ll/f1g0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/pkp;Ll/f1g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/pkp;->e1(Ll/f1g0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/pkp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pkp;->M0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ll/pkp;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pkp;->W0(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic q(Ll/pkp;Ll/f1g0;Ll/xql;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pkp;->V0(Ll/f1g0;Ll/xql;)V

    return-void
.end method

.method public static synthetic s(Ll/pkp;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pkp;->S0()V

    return-void
.end method

.method private t1(Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ll/pkp;->E0:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/pkp;->B:Ll/hjp;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/hjp;->D1()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/pkp;->B:Ll/hjp;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/hjp;->m2()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p0, p0, Ll/pkp;->E0:Ljava/lang/Runnable;

    .line 31
    .line 32
    const-wide/16 v0, 0x7d0

    .line 33
    .line 34
    invoke-virtual {p1, p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object v0, p0, Ll/pkp;->E0:Ljava/lang/Runnable;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/pkp;->c:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

    .line 48
    .line 49
    const/16 v0, 0x8

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/pkp;->c:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->h()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static synthetic u(Ll/pkp;Ll/f1g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/pkp;->g1(Ll/f1g0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Ll/pkp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pkp;->Q0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method private w0(I)Ll/bvl;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/pkp;->p:Lv/VFrame;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, p1, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ll/bvl;

    .line 17
    .line 18
    instance-of p1, p0, Landroid/view/ViewGroup;

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    move-object p1, p0

    .line 23
    check-cast p1, Landroid/view/ViewGroup;

    .line 24
    .line 25
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-object p0
.end method

.method public static synthetic x(Ll/pkp;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pkp;->N0()V

    return-void
.end method

.method private x0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bvl;->getImmediatelyMatch()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/wjp;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/wjp;-><init>(Ll/pkp;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 16
    .line 17
    invoke-interface {v0}, Ll/bvl;->getImmediatelyMatchButton()Ll/avl;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    iget-object v2, p0, Ll/pkp;->k0:Ll/bvl;

    .line 24
    .line 25
    invoke-interface {v2}, Ll/bvl;->getOperationBtnBg()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v0, v1}, Ll/avl;->setNormalStateLayerBackground(Landroid/graphics/drawable/Drawable;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 37
    .line 38
    invoke-interface {v0}, Ll/bvl;->getDislikeBtn()Ll/avl;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v1, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    iget-object v2, p0, Ll/pkp;->k0:Ll/bvl;

    .line 45
    .line 46
    invoke-interface {v2}, Ll/bvl;->getOperationBtnBg()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-interface {v0, v1}, Ll/avl;->setNormalStateLayerBackground(Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 58
    .line 59
    invoke-interface {v0}, Ll/bvl;->getDislikeBtn()Ll/avl;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v1, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    iget-object v2, p0, Ll/pkp;->k0:Ll/bvl;

    .line 66
    .line 67
    invoke-interface {v2}, Ll/bvl;->getDislikePressBg()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-interface {v0, v1}, Ll/avl;->setPressedStateLayerBackground(Landroid/graphics/drawable/Drawable;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 79
    .line 80
    invoke-interface {v0}, Ll/bvl;->getLikeBtn()Ll/avl;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v1, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    iget-object v2, p0, Ll/pkp;->k0:Ll/bvl;

    .line 87
    .line 88
    invoke-interface {v2}, Ll/bvl;->getOperationBtnBg()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-interface {v0, v1}, Ll/avl;->setNormalStateLayerBackground(Landroid/graphics/drawable/Drawable;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 100
    .line 101
    invoke-interface {v0}, Ll/bvl;->getLikeBtn()Ll/avl;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-object v1, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    iget-object p0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 108
    .line 109
    invoke-interface {p0}, Ll/bvl;->getLikePressBg()I

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    invoke-virtual {v1, p0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-interface {v0, p0}, Ll/avl;->setPressedStateLayerBackground(Landroid/graphics/drawable/Drawable;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public static synthetic y(Ll/pkp;Ll/f1g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pkp;->k1(Ll/f1g0;Landroid/view/View;)V

    return-void
.end method

.method private y0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pkp;->u:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/pkp;->u:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 8
    .line 9
    new-instance v2, Ll/vjp;

    .line 10
    .line 11
    invoke-direct {v2, p0}, Ll/vjp;-><init>(Ll/pkp;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/d79;->J()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/pkp;->y:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 24
    .line 25
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static synthetic z(Ll/pkp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pkp;->Z0(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A1()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ll/f1g0;->d()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    instance-of v0, v0, Ll/t7m;

    .line 17
    .line 18
    if-eqz v0, :cond_4

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0}, Ll/f1g0;->d()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ll/t7m;

    .line 29
    .line 30
    invoke-interface {p0}, Ll/q7m;->y()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_4

    .line 35
    .line 36
    invoke-interface {p0}, Ll/t7m;->f()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    return v1

    .line 43
    :cond_0
    invoke-interface {p0}, Ll/t7m;->N()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    return v1

    .line 50
    :cond_1
    invoke-interface {p0}, Ll/q7m;->getCardData()Ll/ik4;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-interface {p0}, Ll/q7m;->getCardData()Ll/ik4;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {p0}, Ll/uih0;->y0(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_2

    .line 79
    .line 80
    return v1

    .line 81
    :cond_2
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Ll/uih0;->z0()Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_3

    .line 90
    .line 91
    return v1

    .line 92
    :cond_3
    const/4 p0, 0x1

    .line 93
    return p0

    .line 94
    :cond_4
    return v1
.end method

.method public B0(ZZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pkp;->K:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/pkp;->B:Ll/hjp;

    .line 11
    .line 12
    iput-boolean p2, v0, Ll/hjp;->s:Z

    .line 13
    .line 14
    iget-object p2, p0, Ll/pkp;->k0:Ll/bvl;

    .line 15
    .line 16
    invoke-interface {p2}, Ll/bvl;->getImmediatelyMatch()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ll/pkp;->o0()Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/pkp;->o0()Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ll/pkp;->r0()Ll/avl;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/pkp;->r0()Ll/avl;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 101
    .line 102
    .line 103
    invoke-static {}, Ll/d79;->G()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_1

    .line 108
    .line 109
    if-eqz p2, :cond_1

    .line 110
    .line 111
    invoke-virtual {p2, v1}, Landroid/view/View;->setScaleX(F)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p2, v1}, Landroid/view/View;->setScaleY(F)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_0
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    const/high16 v1, 0x3f800000    # 1.0f

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0}, Ll/pkp;->o0()Landroid/view/View;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p0}, Ll/pkp;->o0()Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0}, Ll/pkp;->r0()Ll/avl;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0}, Ll/pkp;->r0()Ll/avl;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 198
    .line 199
    .line 200
    invoke-static {}, Ll/d79;->G()Z

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    if-eqz v0, :cond_1

    .line 205
    .line 206
    if-eqz p2, :cond_1

    .line 207
    .line 208
    invoke-virtual {p2, v1}, Landroid/view/View;->setScaleX(F)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {p2, v1}, Landroid/view/View;->setScaleY(F)V

    .line 212
    .line 213
    .line 214
    :cond_1
    :goto_0
    invoke-direct {p0}, Ll/pkp;->P1()V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p0}, Ll/pkp;->i0()Lcom/p1/mobile/putong/core/ui/RadarRipple;

    .line 218
    .line 219
    .line 220
    move-result-object p2

    .line 221
    iget v0, p0, Ll/pkp;->G:I

    .line 222
    .line 223
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/RadarRipple;->setRadarColor(I)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {p0}, Ll/pkp;->i0()Lcom/p1/mobile/putong/core/ui/RadarRipple;

    .line 227
    .line 228
    .line 229
    move-result-object p2

    .line 230
    invoke-virtual {p0}, Ll/pkp;->h0()Lv/VDraweeView;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-static {p2, v0}, Ll/asj0;->b0(Ll/vql;Lv/VDraweeView;)Landroid/animation/Animator;

    .line 235
    .line 236
    .line 237
    move-result-object p2

    .line 238
    iput-object p2, p0, Ll/pkp;->p0:Landroid/animation/Animator;

    .line 239
    .line 240
    invoke-virtual {p0}, Ll/pkp;->g0()Landroid/widget/RelativeLayout;

    .line 241
    .line 242
    .line 243
    move-result-object p2

    .line 244
    invoke-static {p2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p0}, Ll/pkp;->b0()Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object p2

    .line 251
    xor-int/lit8 v0, p1, 0x1

    .line 252
    .line 253
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 254
    .line 255
    .line 256
    invoke-direct {p0, p1}, Ll/pkp;->M1(Z)V

    .line 257
    .line 258
    .line 259
    xor-int/lit8 p2, p1, 0x1

    .line 260
    .line 261
    invoke-direct {p0, p2}, Ll/pkp;->L1(Z)V

    .line 262
    .line 263
    .line 264
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 265
    .line 266
    .line 267
    move-result p2

    .line 268
    if-eqz p2, :cond_2

    .line 269
    .line 270
    invoke-virtual {p0}, Ll/pkp;->q0()Landroid/widget/LinearLayout;

    .line 271
    .line 272
    .line 273
    move-result-object p2

    .line 274
    xor-int/lit8 v0, p1, 0x1

    .line 275
    .line 276
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {p0}, Ll/pkp;->t0()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    xor-int/lit8 p1, p1, 0x1

    .line 284
    .line 285
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 286
    .line 287
    .line 288
    :cond_2
    return-void
.end method

.method public B1()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pkp;->q0()Landroid/widget/LinearLayout;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/pkp;->Z()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public C1(I)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/pkp;->v:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/pkp;->o0()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    if-nez v1, :cond_4

    .line 20
    .line 21
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-eqz p1, :cond_3

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/pkp;->H0()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_3

    .line 34
    .line 35
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    invoke-virtual {p0}, Ll/pkp;->p0()Lv/VFrame_FlipContainer;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Lv/VFrame_FlipContainer;->c()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iget-object v0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 59
    .line 60
    const-string v1, "bubble_superlike_bubble"

    .line 61
    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    invoke-interface {v0}, Ll/bvl;->getSuperLikeRemaining()Lv/VText;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    return-object v1

    .line 88
    :cond_2
    invoke-interface {v0}, Ll/bvl;->getSuperLikeRemaining()Lv/VText;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    invoke-virtual {p0}, Ll/pkp;->p0()Lv/VFrame_FlipContainer;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iget-object p0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 118
    .line 119
    invoke-interface {p0}, Ll/bvl;->getSuperLikeRemaining()Lv/VText;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {p1, v0, p0}, Ll/z5h0;->G(Lcom/p1/mobile/android/app/Act;Lv/VFrame_FlipContainer;Landroid/widget/TextView;)V

    .line 124
    .line 125
    .line 126
    return-object v1

    .line 127
    :cond_3
    :goto_1
    return-object v2

    .line 128
    :cond_4
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-eqz v1, :cond_6

    .line 133
    .line 134
    invoke-virtual {p0}, Ll/pkp;->o0()Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    if-eqz v1, :cond_6

    .line 143
    .line 144
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-eqz v0, :cond_6

    .line 149
    .line 150
    invoke-virtual {p0}, Ll/pkp;->o0()Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {v0}, Landroid/view/View;->getScaleY()F

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    const/high16 v1, 0x3f800000    # 1.0f

    .line 159
    .line 160
    cmpl-float v0, v0, v1

    .line 161
    .line 162
    if-nez v0, :cond_6

    .line 163
    .line 164
    invoke-virtual {p0}, Ll/pkp;->p0()Lv/VFrame_FlipContainer;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-virtual {v0}, Lv/VFrame_FlipContainer;->c()Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-nez v0, :cond_6

    .line 173
    .line 174
    invoke-static {}, Ll/z5h0;->j()Ll/z5h0;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    iget-object v1, p0, Ll/pkp;->E:Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 179
    .line 180
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    if-eqz v2, :cond_5

    .line 185
    .line 186
    iget-object p0, p0, Ll/pkp;->v:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 187
    .line 188
    goto :goto_2

    .line 189
    :cond_5
    invoke-virtual {p0}, Ll/pkp;->o0()Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    :goto_2
    invoke-virtual {v0, v1, p0, p1}, Ll/z5h0;->K(Lcom/p1/mobile/putong/app/PutongFrag;Landroid/view/View;I)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    return-object p0

    .line 198
    :cond_6
    return-object v2
.end method

.method public D0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const-string v0, "groupCategory"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Ll/pkp;->T:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "subType"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/pkp;->U:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "title"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/pkp;->V:Ljava/lang/String;

    .line 24
    .line 25
    const-string v0, "icon"

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Ll/pkp;->W:Ljava/lang/String;

    .line 32
    .line 33
    const-string v0, "bigCoverUrl"

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Ll/pkp;->X:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/pkp;->E0()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public E0()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/pkp;->m:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/pkp;->h:Lv/VRelative;

    .line 12
    .line 13
    new-array v2, v1, [Landroid/view/View;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    aput-object v0, v2, v3

    .line 17
    .line 18
    invoke-static {v2}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/pkp;->l:Lv/VDraweeView;

    .line 22
    .line 23
    new-array v2, v1, [Landroid/view/View;

    .line 24
    .line 25
    aput-object v0, v2, v3

    .line 26
    .line 27
    invoke-static {v2}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/pkp;->i:Lv/VImage;

    .line 31
    .line 32
    new-instance v2, Ll/ijp;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/ijp;-><init>(Ll/pkp;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/pkp;->j:Lv/VImage;

    .line 41
    .line 42
    iget-object v2, p0, Ll/pkp;->U:Ljava/lang/String;

    .line 43
    .line 44
    const-string v4, "night-free"

    .line 45
    .line 46
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/pkp;->j:Lv/VImage;

    .line 54
    .line 55
    new-instance v2, Ll/mkp;

    .line 56
    .line 57
    invoke-direct {v2, p0}, Ll/mkp;-><init>(Ll/pkp;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/pkp;->X:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_0

    .line 70
    .line 71
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 72
    .line 73
    iget-object v2, p0, Ll/pkp;->b:Lv/VDraweeView;

    .line 74
    .line 75
    iget-object v4, p0, Ll/pkp;->X:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v0, v2, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_0
    iget-object v0, p0, Ll/pkp;->W:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_1

    .line 87
    .line 88
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 89
    .line 90
    iget-object v2, p0, Ll/pkp;->l:Lv/VDraweeView;

    .line 91
    .line 92
    iget-object v4, p0, Ll/pkp;->W:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v0, v2, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_1
    iget-object v0, p0, Ll/pkp;->m:Lv/VText;

    .line 98
    .line 99
    iget-object v2, p0, Ll/pkp;->V:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p0}, Ll/pkp;->z0()V

    .line 109
    .line 110
    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-eqz v2, :cond_2

    .line 116
    .line 117
    iget-object v2, p0, Ll/pkp;->r:Landroid/view/View;

    .line 118
    .line 119
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_2

    .line 124
    .line 125
    iget-object v2, p0, Ll/pkp;->r:Landroid/view/View;

    .line 126
    .line 127
    new-instance v4, Ll/nkp;

    .line 128
    .line 129
    invoke-direct {v4, p0, v0}, Ll/nkp;-><init>(Ll/pkp;Ll/f1g0;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 133
    .line 134
    .line 135
    iget-object v2, p0, Ll/pkp;->s:Lv/VText;

    .line 136
    .line 137
    new-instance v4, Ll/okp;

    .line 138
    .line 139
    invoke-direct {v4, p0, v0}, Ll/okp;-><init>(Ll/pkp;Ll/f1g0;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 143
    .line 144
    .line 145
    iget-object v2, p0, Ll/pkp;->t:Landroid/widget/LinearLayout;

    .line 146
    .line 147
    invoke-static {v2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Ll/pkp;->Z()Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-static {v2, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 155
    .line 156
    .line 157
    iget-object v2, p0, Ll/pkp;->q:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 158
    .line 159
    invoke-static {v2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 160
    .line 161
    .line 162
    new-instance v2, Ll/fqj0;

    .line 163
    .line 164
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    iget-object v5, p0, Ll/pkp;->o:Lv/VFrame;

    .line 169
    .line 170
    invoke-direct {v2, v4, v0, v5}, Ll/fqj0;-><init>(Landroid/content/Context;Ll/f1g0;Lv/VFrame;)V

    .line 171
    .line 172
    .line 173
    iput-object v2, p0, Ll/pkp;->Z:Ll/fqj0;

    .line 174
    .line 175
    invoke-interface {v0, v2}, Ll/f1g0;->setUsHomeCardAnimHelper(Ll/fqj0;)V

    .line 176
    .line 177
    .line 178
    iget-object v2, p0, Ll/pkp;->w:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 179
    .line 180
    new-instance v4, Ll/jjp;

    .line 181
    .line 182
    invoke-direct {v4, p0, v0}, Ll/jjp;-><init>(Ll/pkp;Ll/f1g0;)V

    .line 183
    .line 184
    .line 185
    invoke-static {v2, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 186
    .line 187
    .line 188
    iget-object v2, p0, Ll/pkp;->v:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 189
    .line 190
    new-instance v4, Ll/kjp;

    .line 191
    .line 192
    invoke-direct {v4, p0, v0}, Ll/kjp;-><init>(Ll/pkp;Ll/f1g0;)V

    .line 193
    .line 194
    .line 195
    invoke-static {v2, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 196
    .line 197
    .line 198
    iget-object v2, p0, Ll/pkp;->x:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 199
    .line 200
    new-instance v4, Ll/ljp;

    .line 201
    .line 202
    invoke-direct {v4, p0, v0}, Ll/ljp;-><init>(Ll/pkp;Ll/f1g0;)V

    .line 203
    .line 204
    .line 205
    invoke-static {v2, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 206
    .line 207
    .line 208
    iget-object v2, p0, Ll/pkp;->y:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 209
    .line 210
    new-instance v4, Ll/mjp;

    .line 211
    .line 212
    invoke-direct {v4, p0}, Ll/mjp;-><init>(Ll/pkp;)V

    .line 213
    .line 214
    .line 215
    invoke-static {v2, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 216
    .line 217
    .line 218
    iget-object v2, p0, Ll/pkp;->v:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 219
    .line 220
    new-instance v4, Ll/pkp$a;

    .line 221
    .line 222
    invoke-direct {v4, p0}, Ll/pkp$a;-><init>(Ll/pkp;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->setLongPressingListener(Lcom/p1/mobile/putong/core/ui/a$d;)V

    .line 226
    .line 227
    .line 228
    :cond_2
    invoke-static {}, Ll/pgj;->c()Z

    .line 229
    .line 230
    .line 231
    move-result v2

    .line 232
    if-eqz v2, :cond_3

    .line 233
    .line 234
    invoke-virtual {p0}, Ll/pkp;->Y()V

    .line 235
    .line 236
    .line 237
    goto :goto_0

    .line 238
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->o()Z

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    if-eqz v2, :cond_4

    .line 243
    .line 244
    invoke-virtual {p0}, Ll/pkp;->X()V

    .line 245
    .line 246
    .line 247
    invoke-static {}, Ll/nmp;->e()Z

    .line 248
    .line 249
    .line 250
    move-result v2

    .line 251
    if-eqz v2, :cond_5

    .line 252
    .line 253
    invoke-virtual {p0}, Ll/pkp;->Y()V

    .line 254
    .line 255
    .line 256
    goto :goto_0

    .line 257
    :cond_4
    invoke-virtual {p0}, Ll/pkp;->Y()V

    .line 258
    .line 259
    .line 260
    :cond_5
    :goto_0
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 261
    .line 262
    .line 263
    move-result-object v2

    .line 264
    sget v4, Ll/c9c0;->I:I

    .line 265
    .line 266
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 267
    .line 268
    .line 269
    move-result v2

    .line 270
    iput v2, p0, Ll/pkp;->G:I

    .line 271
    .line 272
    new-instance v2, Ll/s740;

    .line 273
    .line 274
    iget-object v4, p0, Ll/pkp;->B:Ll/hjp;

    .line 275
    .line 276
    invoke-direct {v2, v4, p0}, Ll/s740;-><init>(Ll/hjp;Ll/pkp;)V

    .line 277
    .line 278
    .line 279
    iput-object v2, p0, Ll/pkp;->F:Ll/s740;

    .line 280
    .line 281
    invoke-interface {v0, v2}, Ll/f1g0;->setAdapter(Ljava/lang/Object;)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 285
    .line 286
    .line 287
    move-result-object v2

    .line 288
    invoke-interface {v2}, Ll/avl;->getRealView()Landroid/view/View;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    new-instance v4, Ll/njp;

    .line 293
    .line 294
    invoke-direct {v4, p0, v0}, Ll/njp;-><init>(Ll/pkp;Ll/f1g0;)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 301
    .line 302
    .line 303
    move-result-object v2

    .line 304
    invoke-interface {v2}, Ll/avl;->getRealView()Landroid/view/View;

    .line 305
    .line 306
    .line 307
    move-result-object v2

    .line 308
    new-instance v4, Ll/ojp;

    .line 309
    .line 310
    invoke-direct {v4, p0, v0}, Ll/ojp;-><init>(Ll/pkp;Ll/f1g0;)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 314
    .line 315
    .line 316
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 317
    .line 318
    .line 319
    move-result-object v2

    .line 320
    invoke-interface {v2}, Ll/avl;->getRealView()Landroid/view/View;

    .line 321
    .line 322
    .line 323
    move-result-object v2

    .line 324
    new-instance v4, Ll/pkp$e;

    .line 325
    .line 326
    invoke-direct {v4}, Ll/pkp$e;-><init>()V

    .line 327
    .line 328
    .line 329
    iput-object v4, p0, Ll/pkp;->G0:Ll/pkp$e;

    .line 330
    .line 331
    invoke-virtual {v2, v4}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 332
    .line 333
    .line 334
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 335
    .line 336
    .line 337
    move-result-object v2

    .line 338
    invoke-interface {v2}, Ll/avl;->getRealView()Landroid/view/View;

    .line 339
    .line 340
    .line 341
    move-result-object v2

    .line 342
    new-instance v4, Ll/pkp$e;

    .line 343
    .line 344
    invoke-direct {v4}, Ll/pkp$e;-><init>()V

    .line 345
    .line 346
    .line 347
    iput-object v4, p0, Ll/pkp;->H0:Ll/pkp$e;

    .line 348
    .line 349
    invoke-virtual {v2, v4}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 350
    .line 351
    .line 352
    new-instance v2, Ll/tjp;

    .line 353
    .line 354
    invoke-direct {v2, p0, v0}, Ll/tjp;-><init>(Ll/pkp;Ll/f1g0;)V

    .line 355
    .line 356
    .line 357
    const/16 v4, 0x1f4

    .line 358
    .line 359
    invoke-static {v4, v2}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    .line 360
    .line 361
    .line 362
    move-result-object v2

    .line 363
    iput-object v2, p0, Ll/pkp;->Y:Ll/y20;

    .line 364
    .line 365
    new-instance v2, Ll/ekp;

    .line 366
    .line 367
    invoke-direct {v2, p0}, Ll/ekp;-><init>(Ll/pkp;)V

    .line 368
    .line 369
    .line 370
    invoke-interface {v0, v2}, Ll/f1g0;->i(Ll/y20;)V

    .line 371
    .line 372
    .line 373
    new-instance v2, Ll/ikp;

    .line 374
    .line 375
    invoke-direct {v2, p0, v0}, Ll/ikp;-><init>(Ll/pkp;Ll/f1g0;)V

    .line 376
    .line 377
    .line 378
    invoke-interface {v0, v2}, Ll/f1g0;->p(Lcom/p1/mobile/putong/core/card/VSwipeStack$c;)V

    .line 379
    .line 380
    .line 381
    iget-object v2, p0, Ll/pkp;->B:Ll/hjp;

    .line 382
    .line 383
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    new-instance v4, Ll/jkp;

    .line 387
    .line 388
    invoke-direct {v4, v2}, Ll/jkp;-><init>(Ll/hjp;)V

    .line 389
    .line 390
    .line 391
    invoke-interface {v0, v4}, Ll/f1g0;->g(Ll/pl50;)V

    .line 392
    .line 393
    .line 394
    invoke-virtual {p0}, Ll/pkp;->h0()Lv/VDraweeView;

    .line 395
    .line 396
    .line 397
    move-result-object v2

    .line 398
    new-instance v4, Ll/kkp;

    .line 399
    .line 400
    invoke-direct {v4, p0}, Ll/kkp;-><init>(Ll/pkp;)V

    .line 401
    .line 402
    .line 403
    invoke-static {v2, v4}, Ll/asj0;->Z(Landroid/widget/ImageView;Ll/x20;)V

    .line 404
    .line 405
    .line 406
    invoke-interface {v0, v1}, Ll/f1g0;->setAllowUpSwipe(Z)V

    .line 407
    .line 408
    .line 409
    invoke-virtual {p0}, Ll/pkp;->r0()Ll/avl;

    .line 410
    .line 411
    .line 412
    move-result-object v0

    .line 413
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 414
    .line 415
    .line 416
    move-result-object v0

    .line 417
    new-instance v2, Ll/lkp;

    .line 418
    .line 419
    invoke-direct {v2, p0}, Ll/lkp;-><init>(Ll/pkp;)V

    .line 420
    .line 421
    .line 422
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 423
    .line 424
    .line 425
    iget-object v0, p0, Ll/pkp;->n:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;

    .line 426
    .line 427
    iget-object v2, p0, Ll/pkp;->E:Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 428
    .line 429
    const/16 v4, 0x100

    .line 430
    .line 431
    invoke-virtual {v0, v2, v4}, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->d(Lcom/p1/mobile/android/app/Frag;I)V

    .line 432
    .line 433
    .line 434
    iget-object v0, p0, Ll/pkp;->o:Lv/VFrame;

    .line 435
    .line 436
    new-array v1, v1, [Landroid/view/View;

    .line 437
    .line 438
    aput-object v0, v1, v3

    .line 439
    .line 440
    invoke-static {v1}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 441
    .line 442
    .line 443
    invoke-static {}, Ll/gra;->C2()Z

    .line 444
    .line 445
    .line 446
    move-result v0

    .line 447
    if-eqz v0, :cond_7

    .line 448
    .line 449
    iget-object v0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 450
    .line 451
    invoke-interface {v0}, Ll/bvl;->getUndo()Ll/avl;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    if-eqz v0, :cond_6

    .line 456
    .line 457
    iget-object v0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 458
    .line 459
    invoke-interface {v0}, Ll/bvl;->getUndo()Ll/avl;

    .line 460
    .line 461
    .line 462
    move-result-object v0

    .line 463
    iget-object v1, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 464
    .line 465
    iget-object v2, p0, Ll/pkp;->k0:Ll/bvl;

    .line 466
    .line 467
    invoke-interface {v2}, Ll/bvl;->getOperationBtnBg()I

    .line 468
    .line 469
    .line 470
    move-result v2

    .line 471
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 472
    .line 473
    .line 474
    move-result-object v1

    .line 475
    invoke-interface {v0, v1}, Ll/avl;->setNormalStateLayerBackground(Landroid/graphics/drawable/Drawable;)V

    .line 476
    .line 477
    .line 478
    :cond_6
    iget-object v0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 479
    .line 480
    invoke-interface {v0}, Ll/bvl;->getDislikeBtn()Ll/avl;

    .line 481
    .line 482
    .line 483
    move-result-object v0

    .line 484
    iget-object v1, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 485
    .line 486
    iget-object v2, p0, Ll/pkp;->k0:Ll/bvl;

    .line 487
    .line 488
    invoke-interface {v2}, Ll/bvl;->getOperationBtnBg()I

    .line 489
    .line 490
    .line 491
    move-result v2

    .line 492
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 493
    .line 494
    .line 495
    move-result-object v1

    .line 496
    invoke-interface {v0, v1}, Ll/avl;->setNormalStateLayerBackground(Landroid/graphics/drawable/Drawable;)V

    .line 497
    .line 498
    .line 499
    iget-object v0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 500
    .line 501
    invoke-interface {v0}, Ll/bvl;->getLikeBtn()Ll/avl;

    .line 502
    .line 503
    .line 504
    move-result-object v0

    .line 505
    iget-object v1, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 506
    .line 507
    iget-object v2, p0, Ll/pkp;->k0:Ll/bvl;

    .line 508
    .line 509
    invoke-interface {v2}, Ll/bvl;->getOperationBtnBg()I

    .line 510
    .line 511
    .line 512
    move-result v2

    .line 513
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 514
    .line 515
    .line 516
    move-result-object v1

    .line 517
    invoke-interface {v0, v1}, Ll/avl;->setNormalStateLayerBackground(Landroid/graphics/drawable/Drawable;)V

    .line 518
    .line 519
    .line 520
    iget-object v0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 521
    .line 522
    invoke-interface {v0}, Ll/bvl;->getSuperLike()Ll/avl;

    .line 523
    .line 524
    .line 525
    move-result-object v0

    .line 526
    iget-object v1, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 527
    .line 528
    iget-object v2, p0, Ll/pkp;->k0:Ll/bvl;

    .line 529
    .line 530
    invoke-interface {v2}, Ll/bvl;->getOperationBtnBg()I

    .line 531
    .line 532
    .line 533
    move-result v2

    .line 534
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 535
    .line 536
    .line 537
    move-result-object v1

    .line 538
    invoke-interface {v0, v1}, Ll/avl;->setNormalStateLayerBackground(Landroid/graphics/drawable/Drawable;)V

    .line 539
    .line 540
    .line 541
    :cond_7
    invoke-static {}, Ll/d79;->I()Z

    .line 542
    .line 543
    .line 544
    move-result v0

    .line 545
    if-eqz v0, :cond_8

    .line 546
    .line 547
    invoke-direct {p0}, Ll/pkp;->x0()V

    .line 548
    .line 549
    .line 550
    return-void

    .line 551
    :cond_8
    invoke-static {}, Ll/d79;->J()Z

    .line 552
    .line 553
    .line 554
    move-result v0

    .line 555
    if-eqz v0, :cond_9

    .line 556
    .line 557
    invoke-direct {p0}, Ll/pkp;->y0()V

    .line 558
    .line 559
    .line 560
    :cond_9
    return-void
.end method

.method public E1(Lcom/p1/mobile/android/app/Act;)V
    .locals 6
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-class v0, Ll/g6e;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_intl_tribe_exit_intercept_pop"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "intl_tribe_exit_name"

    .line 14
    .line 15
    iget-object v2, p0, Ll/pkp;->U:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    filled-new-array {v1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 29
    .line 30
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ra:I

    .line 31
    .line 32
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-direct {v1, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    .line 40
    .line 41
    const-string v3, "#4D000000"

    .line 42
    .line 43
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    invoke-direct {v2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 48
    .line 49
    .line 50
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Ra:I

    .line 51
    .line 52
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    const/16 v4, 0x11

    .line 61
    .line 62
    const/4 v5, 0x0

    .line 63
    invoke-virtual {v1, v2, v5, v3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 64
    .line 65
    .line 66
    new-instance v2, Ll/jl80$a;

    .line 67
    .line 68
    invoke-direct {v2, p1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 69
    .line 70
    .line 71
    sget v3, Ll/dbc0;->Ec:I

    .line 72
    .line 73
    invoke-virtual {v2, v3}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    const/4 v3, 0x1

    .line 78
    invoke-virtual {v2, v3}, Ll/jl80$a;->p0(Z)Ll/jl80$a;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    sget v4, Ll/dbc0;->R:I

    .line 83
    .line 84
    invoke-virtual {v2, v4}, Ll/jl80$a;->d0(I)Ll/jl80$a;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    sget v4, Ll/dbc0;->Dc:I

    .line 89
    .line 90
    invoke-virtual {v2, v4}, Ll/jl80$a;->i0(I)Ll/jl80$a;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Ua:I

    .line 95
    .line 96
    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    invoke-virtual {v2, v4}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Ta:I

    .line 105
    .line 106
    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    invoke-virtual {v2, v4}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Sa:I

    .line 115
    .line 116
    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    new-instance v4, Ll/akp;

    .line 121
    .line 122
    invoke-direct {v4}, Ll/akp;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v2, p1, v4}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    new-instance v2, Ll/bkp;

    .line 130
    .line 131
    invoke-direct {v2, p0}, Ll/bkp;-><init>(Ll/pkp;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1, v1, v2}, Ll/jl80$a;->h0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p1, v3}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {p1, v3}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    new-instance v1, Ll/ckp;

    .line 147
    .line 148
    invoke-direct {v1, v0}, Ll/ckp;-><init>(Ll/l4g0;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1, v1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-virtual {p1}, Ll/jl80$a;->r0()Ll/jl80;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    iput-object p1, p0, Ll/pkp;->J0:Ll/jl80;

    .line 160
    .line 161
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method public F1(Landroid/content/Intent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->E:Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public G0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pkp;->O:Z

    .line 2
    .line 3
    return p0
.end method

.method public G1(Ljava/lang/String;I)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p2, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-interface {p2}, Ll/f1g0;->d()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    if-eqz p2, :cond_2

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-interface {p2}, Ll/f1g0;->o()Ll/ik4;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    if-eqz p2, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-interface {p2}, Ll/f1g0;->o()Ll/ik4;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p2}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    if-nez p2, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-interface {p2}, Ll/f1g0;->o()Ll/ik4;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p2}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v0}, Ll/sdp;->i(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 64
    .line 65
    const/4 v5, 0x0

    .line 66
    const/4 v6, 0x0

    .line 67
    const/4 v4, 0x1

    .line 68
    move-object v3, p1

    .line 69
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->A2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 74
    .line 75
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->J0:Ll/wyd0;

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Ljava/lang/CharSequence;

    .line 86
    .line 87
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    if-eqz p2, :cond_1

    .line 92
    .line 93
    new-instance p2, Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;

    .line 94
    .line 95
    invoke-direct {p2}, Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;-><init>()V

    .line 96
    .line 97
    .line 98
    const/4 v0, 0x1

    .line 99
    iput-boolean v0, p2, Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;->showCountdownSendMsg:Z

    .line 100
    .line 101
    const-string v0, "profile_create_data"

    .line 102
    .line 103
    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 104
    .line 105
    .line 106
    :cond_1
    iget-object p0, p0, Ll/pkp;->E:Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 107
    .line 108
    const/16 p2, 0x72

    .line 109
    .line 110
    invoke-virtual {p0, p1, p2}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 111
    .line 112
    .line 113
    :cond_2
    :goto_0
    return-void
.end method

.method public H0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pkp;->H:Z

    .line 2
    .line 3
    return p0
.end method

.method public I0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pkp;->I:Z

    .line 2
    .line 3
    return p0
.end method

.method public J0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->K:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public J1(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "intl_tribe_source_name"

    .line 8
    .line 9
    iget-object v2, p0, Ll/pkp;->U:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    filled-new-array {v1}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "e_intl_tribe_card_profile_entranc_click"

    .line 20
    .line 21
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/pkp;->Y:Ll/y20;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final synthetic N0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/f1g0;->o()Ll/ik4;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Ll/f1g0;->o()Ll/ik4;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p0}, Ll/f1g0;->o()Ll/ik4;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->E8(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method public final synthetic O0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v1, p0, Ll/pkp;->E:Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Ll/pkp;->a0(Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/hkp;

    .line 14
    .line 15
    invoke-direct {v2, p0}, Ll/hkp;-><init>(Ll/pkp;)V

    .line 16
    .line 17
    .line 18
    const-string p0, "p_suggest_users_home_view,e_intl_instantmatch_btn,p_intl_instantmatch_no_ultra_view,e_intl_instantmatch_no_ultra_click,click"

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1, p0, v2}, Lcom/p1/mobile/putong/core/ui/match/a;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public O1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "intl_tribe_source_name"

    .line 8
    .line 9
    iget-object v2, p0, Ll/pkp;->U:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/n;->U:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    const-string v2, "NA"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    :goto_0
    const-string v3, "receiver_user_id"

    .line 29
    .line 30
    invoke-static {v3, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    filled-new-array {v1, v2}, [Ll/sfj0$a;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v2, "e_intl_tribe_card_regret_click"

    .line 39
    .line 40
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/pkp;->Q1()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-static {}, Ll/h7d0;->m0()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    const/4 v1, 0x0

    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isNewUserIn24H()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    invoke-static {}, Ll/h7d0;->i0()Ll/h7d0;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Ll/h7d0;->h0()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    invoke-static {}, Ll/h7d0;->i0()Ll/h7d0;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Ll/h7d0;->k0()V

    .line 86
    .line 87
    .line 88
    invoke-static {}, Ll/h7d0;->i0()Ll/h7d0;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0, v1}, Ll/h7d0;->r0(Z)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_2
    iget-object p0, p0, Ll/pkp;->B:Ll/hjp;

    .line 97
    .line 98
    invoke-virtual {p0, v1}, Ll/hjp;->E2(Z)Z

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final synthetic P0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/f1g0;->o()Ll/ik4;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Ll/f1g0;->o()Ll/ik4;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p0}, Ll/f1g0;->o()Ll/ik4;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->E8(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method public final synthetic Q0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v1, p0, Ll/pkp;->E:Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Ll/pkp;->a0(Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/dkp;

    .line 14
    .line 15
    invoke-direct {v2, p0}, Ll/dkp;-><init>(Ll/pkp;)V

    .line 16
    .line 17
    .line 18
    const-string p0, "p_suggest_users_home_view,e_intl_instantmatch_btn,p_intl_instantmatch_no_ultra_view,e_intl_instantmatch_no_ultra_click,click"

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1, p0, v2}, Lcom/p1/mobile/putong/core/ui/match/a;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public Q1()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/f1g0;->d()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public R(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/qkp;->b(Ll/pkp;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public final synthetic S0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pkp;->v0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic T0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public U(Ll/hjp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pkp;->B:Ll/hjp;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic U0(Ll/f1g0;Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p2, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-interface {p1}, Ll/f1g0;->o()Ll/ik4;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ll/f1g0;->o()Ll/ik4;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-interface {p1}, Ll/f1g0;->o()Ll/ik4;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const-string v0, "0"

    .line 43
    .line 44
    :goto_0
    const-string v1, "receiver_user_id"

    .line 45
    .line 46
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "intl_tribe_source_name"

    .line 51
    .line 52
    iget-object v2, p0, Ll/pkp;->U:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const-string v2, "intl_get_see_source"

    .line 59
    .line 60
    const-string v3, "tribe"

    .line 61
    .line 62
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    filled-new-array {v0, v1, v2}, [Ll/sfj0$a;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v1, "e_intl_tribe_card_dislike_click"

    .line 71
    .line 72
    invoke-static {v1, p2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 73
    .line 74
    .line 75
    const-string p2, "dislike"

    .line 76
    .line 77
    invoke-direct {p0, p1, p2}, Ll/pkp;->V(Ll/f1g0;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ll/pkp;->Q1()Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_1

    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 88
    .line 89
    const/4 p2, 0x1

    .line 90
    invoke-interface {p1, p0, p2}, Ll/f1g0;->r(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final synthetic V0(Ll/f1g0;Ll/xql;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Ll/f1g0;->d()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_12

    .line 16
    .line 17
    invoke-static {}, Ll/uih0;->m0()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {v1}, Ll/f1g0;->o()Ll/ik4;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v1}, Ll/f1g0;->o()Ll/ik4;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v1}, Ll/uih0;->y0(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-nez v1, :cond_12

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-interface {v1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    if-nez v1, :cond_0

    .line 84
    .line 85
    goto/16 :goto_9

    .line 86
    .line 87
    :cond_0
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-interface {v1}, Ll/r2j0;->q()Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_1

    .line 96
    .line 97
    goto/16 :goto_9

    .line 98
    .line 99
    :cond_1
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-interface {v1}, Ll/r2j0;->f()Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_2

    .line 108
    .line 109
    goto/16 :goto_9

    .line 110
    .line 111
    :cond_2
    invoke-interface/range {p1 .. p1}, Ll/f1g0;->m()Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-eqz v1, :cond_3

    .line 116
    .line 117
    invoke-interface/range {p1 .. p1}, Ll/f1g0;->n()V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_3
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-interface {v1}, Ll/f1g0;->d()Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    instance-of v1, v1, Ll/t7m;

    .line 130
    .line 131
    if-eqz v1, :cond_4

    .line 132
    .line 133
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-interface {v1}, Ll/f1g0;->d()Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    check-cast v1, Ll/t7m;

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_4
    const/4 v1, 0x0

    .line 145
    :goto_0
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    if-eqz v2, :cond_5

    .line 150
    .line 151
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    invoke-interface {v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->M8()Z

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    if-eqz v2, :cond_5

    .line 160
    .line 161
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->Y1()V

    .line 162
    .line 163
    .line 164
    :cond_5
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    if-eqz v2, :cond_6

    .line 169
    .line 170
    invoke-interface {v1}, Ll/q7m;->C()V

    .line 171
    .line 172
    .line 173
    :cond_6
    const/4 v2, 0x0

    .line 174
    const/4 v3, 0x1

    .line 175
    if-eqz v1, :cond_8

    .line 176
    .line 177
    invoke-interface {v1}, Ll/t7m;->P()Z

    .line 178
    .line 179
    .line 180
    move-result v4

    .line 181
    if-nez v4, :cond_7

    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_7
    move v4, v2

    .line 185
    goto :goto_2

    .line 186
    :cond_8
    :goto_1
    move v4, v3

    .line 187
    :goto_2
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v5

    .line 191
    if-eqz v5, :cond_9

    .line 192
    .line 193
    invoke-interface {v1}, Ll/q7m;->getCardData()Ll/ik4;

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result v5

    .line 201
    if-eqz v5, :cond_9

    .line 202
    .line 203
    invoke-interface {v1}, Ll/q7m;->getCardData()Ll/ik4;

    .line 204
    .line 205
    .line 206
    move-result-object v5

    .line 207
    invoke-virtual {v5}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 208
    .line 209
    .line 210
    move-result-object v5

    .line 211
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v5

    .line 215
    if-eqz v5, :cond_9

    .line 216
    .line 217
    invoke-interface {v1}, Ll/q7m;->getCardData()Ll/ik4;

    .line 218
    .line 219
    .line 220
    move-result-object v5

    .line 221
    invoke-virtual {v5}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 222
    .line 223
    .line 224
    move-result-object v5

    .line 225
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isUserLikeMe()Z

    .line 226
    .line 227
    .line 228
    move-result v5

    .line 229
    goto :goto_3

    .line 230
    :cond_9
    move v5, v2

    .line 231
    :goto_3
    if-eqz v5, :cond_a

    .line 232
    .line 233
    const-string v6, "upper_right"

    .line 234
    .line 235
    goto :goto_4

    .line 236
    :cond_a
    const-string v6, "null"

    .line 237
    .line 238
    :goto_4
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    move-result v7

    .line 242
    if-eqz v7, :cond_b

    .line 243
    .line 244
    const-string v7, "female_like_flag_lower_left"

    .line 245
    .line 246
    invoke-interface {v1, v7}, Ll/q7m;->D(Ljava/lang/String;)Z

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    if-eqz v1, :cond_b

    .line 251
    .line 252
    const-string v6, "lower_left"

    .line 253
    .line 254
    move v5, v3

    .line 255
    :cond_b
    invoke-virtual {v0}, Ll/pkp;->m0()Ll/f1g0;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    invoke-interface {v1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    invoke-interface/range {p2 .. p2}, Ll/xql;->getMomentInfoProxy()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 264
    .line 265
    .line 266
    move-result-object v7

    .line 267
    iget-object v8, v0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 268
    .line 269
    invoke-virtual {v8}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v8

    .line 273
    const-string v9, "IsWhiteBlock"

    .line 274
    .line 275
    invoke-static {v9, v4}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 276
    .line 277
    .line 278
    move-result-object v10

    .line 279
    invoke-interface/range {p2 .. p2}, Ll/xql;->getUserProxy()Lcom/p1/mobile/putong/data/User;

    .line 280
    .line 281
    .line 282
    move-result-object v4

    .line 283
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result v4

    .line 287
    const-string v9, "0"

    .line 288
    .line 289
    if-eqz v4, :cond_c

    .line 290
    .line 291
    invoke-interface/range {p2 .. p2}, Ll/xql;->getUserProxy()Lcom/p1/mobile/putong/data/User;

    .line 292
    .line 293
    .line 294
    move-result-object v4

    .line 295
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 296
    .line 297
    goto :goto_5

    .line 298
    :cond_c
    move-object v4, v9

    .line 299
    :goto_5
    const-string v11, "moments_user_id"

    .line 300
    .line 301
    invoke-static {v11, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 302
    .line 303
    .line 304
    move-result-object v11

    .line 305
    const-string v4, "show_he_liked"

    .line 306
    .line 307
    invoke-static {v4, v5}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 308
    .line 309
    .line 310
    move-result-object v12

    .line 311
    const-string v4, "show_he_liked_position"

    .line 312
    .line 313
    invoke-static {v4, v6}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 314
    .line 315
    .line 316
    move-result-object v13

    .line 317
    iget-object v4, v0, Ll/pkp;->B:Ll/hjp;

    .line 318
    .line 319
    invoke-interface/range {p2 .. p2}, Ll/xql;->getUserProxy()Lcom/p1/mobile/putong/data/User;

    .line 320
    .line 321
    .line 322
    move-result-object v5

    .line 323
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 324
    .line 325
    .line 326
    move-result v5

    .line 327
    if-eqz v5, :cond_d

    .line 328
    .line 329
    invoke-interface/range {p2 .. p2}, Ll/xql;->getUserProxy()Lcom/p1/mobile/putong/data/User;

    .line 330
    .line 331
    .line 332
    move-result-object v5

    .line 333
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 334
    .line 335
    goto :goto_6

    .line 336
    :cond_d
    move-object v5, v9

    .line 337
    :goto_6
    invoke-virtual {v4, v5}, Ll/hjp;->B1(Ljava/lang/String;)Z

    .line 338
    .line 339
    .line 340
    move-result v4

    .line 341
    if-eqz v4, :cond_e

    .line 342
    .line 343
    invoke-interface/range {p2 .. p2}, Ll/xql;->getShowPictureIndexProxy()I

    .line 344
    .line 345
    .line 346
    move-result v4

    .line 347
    if-nez v4, :cond_e

    .line 348
    .line 349
    move v4, v3

    .line 350
    goto :goto_7

    .line 351
    :cond_e
    move v4, v2

    .line 352
    :goto_7
    const-string v5, "is_first_picture"

    .line 353
    .line 354
    invoke-static {v5, v4}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 355
    .line 356
    .line 357
    move-result-object v14

    .line 358
    const-string v4, "swipe_scene"

    .line 359
    .line 360
    const-string v5, "default"

    .line 361
    .line 362
    invoke-static {v4, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 363
    .line 364
    .line 365
    move-result-object v15

    .line 366
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 367
    .line 368
    .line 369
    move-result v4

    .line 370
    if-eqz v4, :cond_f

    .line 371
    .line 372
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isThemeCard:Z

    .line 373
    .line 374
    if-eqz v1, :cond_f

    .line 375
    .line 376
    move v2, v3

    .line 377
    :cond_f
    const-string v1, "theme_card_ornot"

    .line 378
    .line 379
    invoke-static {v1, v2}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 380
    .line 381
    .line 382
    move-result-object v16

    .line 383
    invoke-interface/range {p2 .. p2}, Ll/xql;->z()Z

    .line 384
    .line 385
    .line 386
    move-result v1

    .line 387
    if-eqz v1, :cond_10

    .line 388
    .line 389
    const-string v1, "1"

    .line 390
    .line 391
    goto :goto_8

    .line 392
    :cond_10
    move-object v1, v9

    .line 393
    :goto_8
    const-string v2, "is_moment_card"

    .line 394
    .line 395
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 396
    .line 397
    .line 398
    move-result-object v17

    .line 399
    if-eqz v7, :cond_11

    .line 400
    .line 401
    iget-object v9, v7, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 402
    .line 403
    :cond_11
    const-string v1, "moment_id"

    .line 404
    .line 405
    invoke-static {v1, v9}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 406
    .line 407
    .line 408
    move-result-object v18

    .line 409
    filled-new-array/range {v10 .. v18}, [Ll/sfj0$a;

    .line 410
    .line 411
    .line 412
    move-result-object v1

    .line 413
    const-string v2, "e_card"

    .line 414
    .line 415
    invoke-static {v2, v8, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 416
    .line 417
    .line 418
    iget-object v1, v0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 419
    .line 420
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 421
    .line 422
    .line 423
    move-result-object v1

    .line 424
    const-string v2, "intl_tribe_source_name"

    .line 425
    .line 426
    iget-object v4, v0, Ll/pkp;->U:Ljava/lang/String;

    .line 427
    .line 428
    invoke-static {v2, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 429
    .line 430
    .line 431
    move-result-object v2

    .line 432
    filled-new-array {v2}, [Ll/pf60;

    .line 433
    .line 434
    .line 435
    move-result-object v2

    .line 436
    const-string v4, "e_intl_tribe_card_profile_entranc_click"

    .line 437
    .line 438
    invoke-static {v4, v1, v2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 439
    .line 440
    .line 441
    invoke-static {v3}, Ll/pci;->y(Z)V

    .line 442
    .line 443
    .line 444
    invoke-virtual {v0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 445
    .line 446
    .line 447
    move-result-object v1

    .line 448
    sget v2, Ll/c9c0;->P1:I

    .line 449
    .line 450
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 451
    .line 452
    .line 453
    move-result v1

    .line 454
    const-string v2, "home_moment_theme_card"

    .line 455
    .line 456
    invoke-virtual {v0, v2, v1}, Ll/pkp;->G1(Ljava/lang/String;I)V

    .line 457
    .line 458
    .line 459
    :cond_12
    :goto_9
    return-void
.end method

.method public W(ZZ)Ll/avl;
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pkp;->n0()Ll/avl;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_1
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic W0(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->Y:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public X()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, v1}, Ll/f1g0;->setAllowUpSwipe(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/pkp;->o0()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v1, v0}, Ll/pkp;->z1(ZZ)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    iget-object v2, p0, Ll/pkp;->v:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 27
    .line 28
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Ll/pkp;->y:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 32
    .line 33
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v1, v0}, Ll/pkp;->z1(ZZ)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public final synthetic X0(Ll/f1g0;ZFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ll/f1g0;->d()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    if-eqz p4, :cond_7

    .line 10
    .line 11
    instance-of p4, p1, Ll/t7m;

    .line 12
    .line 13
    if-eqz p4, :cond_0

    .line 14
    .line 15
    check-cast p1, Ll/t7m;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    :goto_0
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-interface {p1}, Ll/q7m;->R()Z

    .line 22
    .line 23
    .line 24
    move-result p4

    .line 25
    if-eqz p4, :cond_1

    .line 26
    .line 27
    goto/16 :goto_1

    .line 28
    .line 29
    :cond_1
    if-eqz p1, :cond_4

    .line 30
    .line 31
    invoke-interface {p1}, Ll/q7m;->F()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_4

    .line 36
    .line 37
    iget-boolean p1, p0, Ll/pkp;->L:Z

    .line 38
    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    neg-float p2, p3

    .line 46
    invoke-interface {p1, p2}, Ll/avl;->j(F)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-boolean p1, p0, Ll/pkp;->M:Z

    .line 50
    .line 51
    if-eqz p1, :cond_3

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-interface {p1, p3}, Ll/avl;->j(F)V

    .line 58
    .line 59
    .line 60
    :cond_3
    iget-boolean p1, p0, Ll/pkp;->N:Z

    .line 61
    .line 62
    if-eqz p1, :cond_7

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/pkp;->n0()Ll/avl;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-interface {p0, p3}, Ll/avl;->j(F)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_4
    const/4 p1, 0x0

    .line 73
    cmpl-float p1, p3, p1

    .line 74
    .line 75
    const/4 p4, 0x1

    .line 76
    const/4 v0, 0x0

    .line 77
    if-lez p1, :cond_6

    .line 78
    .line 79
    if-eqz p2, :cond_5

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/pkp;->n0()Ll/avl;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-interface {p1}, Ll/avl;->reset()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-interface {p1}, Ll/avl;->reset()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-interface {p1, p3}, Ll/avl;->j(F)V

    .line 100
    .line 101
    .line 102
    iput-boolean p4, p0, Ll/pkp;->M:Z

    .line 103
    .line 104
    iput-boolean v0, p0, Ll/pkp;->L:Z

    .line 105
    .line 106
    iput-boolean v0, p0, Ll/pkp;->N:Z

    .line 107
    .line 108
    return-void

    .line 109
    :cond_5
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-interface {p1}, Ll/avl;->reset()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-interface {p1}, Ll/avl;->reset()V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Ll/pkp;->n0()Ll/avl;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-interface {p1, p3}, Ll/avl;->j(F)V

    .line 128
    .line 129
    .line 130
    iput-boolean v0, p0, Ll/pkp;->L:Z

    .line 131
    .line 132
    iput-boolean v0, p0, Ll/pkp;->M:Z

    .line 133
    .line 134
    iput-boolean p4, p0, Ll/pkp;->N:Z

    .line 135
    .line 136
    return-void

    .line 137
    :cond_6
    invoke-virtual {p0}, Ll/pkp;->n0()Ll/avl;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-interface {p1}, Ll/avl;->reset()V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Ll/pkp;->f0()Ll/avl;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-interface {p1}, Ll/avl;->reset()V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0}, Ll/pkp;->c0()Ll/avl;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    neg-float p2, p3

    .line 156
    invoke-interface {p1, p2}, Ll/avl;->j(F)V

    .line 157
    .line 158
    .line 159
    iput-boolean p4, p0, Ll/pkp;->L:Z

    .line 160
    .line 161
    iput-boolean v0, p0, Ll/pkp;->M:Z

    .line 162
    .line 163
    iput-boolean v0, p0, Ll/pkp;->N:Z

    .line 164
    .line 165
    :cond_7
    :goto_1
    return-void
.end method

.method public Y()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-interface {v0, v1}, Ll/f1g0;->setAllowUpSwipe(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/pkp;->v:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/pkp;->y:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v1, v2}, Ll/pkp;->z1(ZZ)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-static {}, Ll/fcp;->y()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iput-boolean v1, p0, Ll/pkp;->H:Z

    .line 36
    .line 37
    :cond_1
    invoke-virtual {p0}, Ll/pkp;->o0()Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v1, v2}, Ll/pkp;->z1(ZZ)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/pkp;->o0()Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/xjp;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/xjp;-><init>(Ll/pkp;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/pkp;->n0()Ll/avl;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/yjp;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/yjp;-><init>(Ll/pkp;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ll/pkp;->n0()Ll/avl;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/pkp$d;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/pkp$d;-><init>(Ll/pkp;)V

    .line 82
    .line 83
    .line 84
    invoke-interface {v0, v1}, Ll/avl;->setOnLongPressListener(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ll/pkp;->r0()Ll/avl;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-interface {v0}, Ll/avl;->getRealView()Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    new-instance v1, Ll/zjp;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Ll/zjp;-><init>(Ll/pkp;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Ll/pkp;->Z()Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-static {p0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public final synthetic Y0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->B:Ll/hjp;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hjp;->r2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Z()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bvl;->getButtonRootLayout()Landroid/view/ViewGroup;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic Z0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pkp;->O1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final a0(Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;->C:Ll/pkp;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->getRenderUser()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public final synthetic a1(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    new-array v0, v0, [Ll/sfj0$a;

    .line 9
    .line 10
    const-string v1, "e_intl_tribe_exit_btn"

    .line 11
    .line 12
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/pkp;->E1(Lcom/p1/mobile/android/app/Act;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b0()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->p:Lv/VFrame;

    .line 2
    .line 3
    return-object p0
.end method

.method public c0()Ll/avl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bvl;->getDislikeBtn()Ll/avl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d0()Lcom/facebook/drawee/view/DraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->c:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->b:Lv/VDraweeView;

    .line 4
    .line 5
    return-object p0
.end method

.method public final synthetic d1(Ll/f1g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/f1g0;->d()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/pkp;->J1(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e0()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->E:Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public f0()Ll/avl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bvl;->getLikeBtn()Ll/avl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public g0()Landroid/widget/RelativeLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->d:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0()Lv/VDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->g:Lv/VDraweeView;

    .line 2
    .line 3
    return-object p0
.end method

.method public i0()Lcom/p1/mobile/putong/core/ui/RadarRipple;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->f:Lcom/p1/mobile/putong/core/ui/RadarRipple;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/hjp;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pkp;->U(Ll/hjp;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pkp;->R(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/qjp;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/qjp;-><init>(Ll/pkp;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p2, v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;-><init>(Landroid/content/Context;Ll/uxl0;Ll/pkp;)V

    .line 17
    .line 18
    .line 19
    iput-object p2, p0, Ll/pkp;->D:Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 23
    .line 24
    .line 25
    iget-object p2, p0, Ll/pkp;->D:Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;

    .line 26
    .line 27
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Ll/pkp;->p:Lv/VFrame;

    .line 31
    .line 32
    iget-object v1, p0, Ll/pkp;->D:Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;

    .line 33
    .line 34
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 35
    .line 36
    const/4 v3, -0x1

    .line 37
    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2, v1, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Ll/pkp;->D:Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;

    .line 44
    .line 45
    iput-object p2, p0, Ll/pkp;->C:Ll/f1g0;

    .line 46
    .line 47
    invoke-direct {p0}, Ll/pkp;->A0()V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 51
    .line 52
    invoke-interface {p0}, Ll/bvl;->getButtonRootLayout()Landroid/view/ViewGroup;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    new-instance p2, Ll/rjp;

    .line 57
    .line 58
    invoke-direct {p2}, Ll/rjp;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    return-object p1
.end method

.method public j0()Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->n:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;

    .line 2
    .line 3
    return-object p0
.end method

.method public k0()Ll/hjp;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->B:Ll/hjp;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic k1(Ll/f1g0;Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p2, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-interface {p1}, Ll/f1g0;->o()Ll/ik4;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ll/f1g0;->o()Ll/ik4;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-interface {p1}, Ll/f1g0;->o()Ll/ik4;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const-string v0, "0"

    .line 43
    .line 44
    :goto_0
    const-string v1, "receiver_user_id"

    .line 45
    .line 46
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "intl_tribe_source_name"

    .line 51
    .line 52
    iget-object v2, p0, Ll/pkp;->U:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const-string v2, "intl_get_see_source"

    .line 59
    .line 60
    const-string v3, "tribe"

    .line 61
    .line 62
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    filled-new-array {v0, v1, v2}, [Ll/sfj0$a;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v1, "e_intl_tribe_card_like_click"

    .line 71
    .line 72
    invoke-static {v1, p2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 73
    .line 74
    .line 75
    const-string p2, "like"

    .line 76
    .line 77
    invoke-direct {p0, p1, p2}, Ll/pkp;->V(Ll/f1g0;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ll/pkp;->Q1()Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_1

    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 88
    .line 89
    const/4 p2, 0x1

    .line 90
    invoke-interface {p1, p0, p2}, Ll/f1g0;->r(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public l0()Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic l1(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m0()Ll/f1g0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->C:Ll/f1g0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic m1()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_intl_tribe_exit_leave_click"

    .line 5
    .line 6
    const-string v2, "p_intl_tribe_exit_intercept_pop"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/pkp;->T:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v1, p0, Ll/pkp;->U:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Ll/pkp;->r1(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public n0()Ll/avl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bvl;->getSuperLike()Ll/avl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n1(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Ll/pkp;->O:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/pkp;->w1()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-static {p1, v0}, Ll/hkl0;->a(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-boolean p1, p0, Ll/pkp;->O:Z

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-interface {p1}, Ll/f1g0;->d()Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-interface {p1}, Ll/f1g0;->d()Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    instance-of p1, p1, Ll/t7m;

    .line 71
    .line 72
    if-eqz p1, :cond_1

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-interface {p0}, Ll/f1g0;->d()Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    check-cast p0, Ll/t7m;

    .line 83
    .line 84
    invoke-interface {p0}, Ll/q7m;->C()V

    .line 85
    .line 86
    .line 87
    :cond_1
    return-void
.end method

.method public o0()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bvl;->getSuperLikeWarpLayout()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public o1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ll/r2j0;->a()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public p0()Lv/VFrame_FlipContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bvl;->getSuperLikeLayout()Lv/VFrame_FlipContainer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public p1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pkp;->K:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/pkp;->p0:Landroid/animation/Animator;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public q0()Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->t:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public q1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ll/pci;->y(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/pkp;->p0:Landroid/animation/Animator;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public r0()Ll/avl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bvl;->getUndo()Ll/avl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public r1(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pkp;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 6
    .line 7
    const-string v2, "quit"

    .line 8
    .line 9
    invoke-virtual {v1, v2, p1, p2}, Lcom/p1/mobile/putong/core/api/m;->H3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance p2, Ll/fkp;

    .line 18
    .line 19
    invoke-direct {p2, p0}, Ll/fkp;-><init>(Ll/pkp;)V

    .line 20
    .line 21
    .line 22
    new-instance p0, Ll/gkp;

    .line 23
    .line 24
    invoke-direct {p0}, Ll/gkp;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public s0()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->k0:Ll/bvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bvl;->getUndoLayout()Lv/VFrame_FlipContainer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public s1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/pkp;->F:Ll/s740;

    .line 3
    .line 4
    iget-object p0, p0, Ll/pkp;->K:Lrx/subjects/a;

    .line 5
    .line 6
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public t0()Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkp;->q:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public u0(Lcom/p1/mobile/putong/core/data/VirtualCardType;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ll/sxl0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public u1(ZZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/pkp;->v1(ZZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public v0()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-class v2, Lcom/p1/mobile/putong/core/newui/container/NewUI1ContainerActivity;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 10
    .line 11
    .line 12
    const-class v1, Lcom/p1/mobile/putong/core/ui/settings/SettingsFragOld;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "fragmentName"

    .line 19
    .line 20
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public v1(ZZZ)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/pkp;->B:Ll/hjp;

    .line 4
    .line 5
    const-string v1, ""

    .line 6
    .line 7
    iput-object v1, v0, Ll/hjp;->e:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    invoke-direct {p0, p2}, Ll/pkp;->t1(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/pkp;->K:Lrx/subjects/a;

    .line 13
    .line 14
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    if-nez p1, :cond_2

    .line 28
    .line 29
    iget-object p3, p0, Ll/pkp;->F0:Ll/k3l;

    .line 30
    .line 31
    invoke-static {p3}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/pkp;->b0()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    const/4 v0, 0x1

    .line 39
    invoke-static {p3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0, v0}, Ll/pkp;->L1(Z)V

    .line 43
    .line 44
    .line 45
    iget-object p3, p0, Ll/pkp;->p0:Landroid/animation/Animator;

    .line 46
    .line 47
    invoke-virtual {p3}, Landroid/animation/Animator;->cancel()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/pkp;->g0()Landroid/widget/RelativeLayout;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p3

    .line 58
    if-eqz p3, :cond_1

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/pkp;->g0()Landroid/widget/RelativeLayout;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    invoke-static {p3, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    invoke-direct {p0, v1}, Ll/pkp;->M1(Z)V

    .line 68
    .line 69
    .line 70
    :cond_1
    invoke-direct {p0, v0}, Ll/pkp;->T(Z)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 74
    .line 75
    .line 76
    move-result p3

    .line 77
    if-eqz p3, :cond_5

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/pkp;->q0()Landroid/widget/LinearLayout;

    .line 80
    .line 81
    .line 82
    move-result-object p3

    .line 83
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/pkp;->t0()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 87
    .line 88
    .line 89
    move-result-object p3

    .line 90
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Ll/pkp;->Z()Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object p3

    .line 97
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_2
    iget-object v0, p0, Ll/pkp;->K:Lrx/subjects/a;

    .line 102
    .line 103
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Ljava/lang/Boolean;

    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_4

    .line 114
    .line 115
    if-eqz p1, :cond_4

    .line 116
    .line 117
    iget-object v0, p0, Ll/pkp;->F0:Ll/k3l;

    .line 118
    .line 119
    invoke-virtual {v0, p2, v1, v1}, Ll/k3l;->a(ZZZ)V

    .line 120
    .line 121
    .line 122
    if-eqz p3, :cond_3

    .line 123
    .line 124
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 125
    .line 126
    .line 127
    move-result-object p3

    .line 128
    iget-object v0, p0, Ll/pkp;->F0:Ll/k3l;

    .line 129
    .line 130
    sget-wide v1, Ll/vo0;->f:J

    .line 131
    .line 132
    invoke-static {p3, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_3
    iget-object p3, p0, Ll/pkp;->F0:Ll/k3l;

    .line 137
    .line 138
    invoke-virtual {p3}, Ll/k3l;->run()V

    .line 139
    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_4
    iget-object p3, p0, Ll/pkp;->K:Lrx/subjects/a;

    .line 143
    .line 144
    invoke-virtual {p3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object p3

    .line 148
    check-cast p3, Ljava/lang/Boolean;

    .line 149
    .line 150
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 151
    .line 152
    .line 153
    :cond_5
    :goto_0
    iget-object p3, p0, Ll/pkp;->K:Lrx/subjects/a;

    .line 154
    .line 155
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-virtual {p3, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 160
    .line 161
    .line 162
    iget-object p1, p0, Ll/pkp;->B:Ll/hjp;

    .line 163
    .line 164
    iput-boolean p2, p1, Ll/hjp;->s:Z

    .line 165
    .line 166
    invoke-direct {p0}, Ll/pkp;->P1()V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method public w1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/f1g0;->d()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Ll/f1g0;->d()Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    instance-of v0, v0, Ll/t7m;

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {p0}, Ll/f1g0;->d()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Ll/t7m;

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    const/4 v1, 0x0

    .line 49
    invoke-interface {p0, v0, v1}, Ll/t7m;->p(ZZ)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public y1(Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pkp;->Z:Ll/fqj0;

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
    iget-object p0, p0, Ll/pkp;->Z:Ll/fqj0;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ll/fqj0;->i(Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public z0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pkp;->c:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

    .line 2
    .line 3
    new-instance v1, Ll/sjp;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/sjp;-><init>(Ll/pkp;)V

    .line 6
    .line 7
    .line 8
    new-instance v2, Ll/ujp;

    .line 9
    .line 10
    invoke-direct {v2, p0}, Ll/ujp;-><init>(Ll/pkp;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/pkp;->B:Ll/hjp;

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->k(Ll/x20;Ll/x20;Ll/ner;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public z1(ZZ)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Ll/pkp;->I:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pkp;->I0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/pkp;->r0()Ll/avl;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-interface {p2}, Ll/avl;->getRealView()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/pkp;->s0()Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p0}, Ll/pkp;->r0()Ll/avl;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-interface {p2}, Ll/avl;->getRealView()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-static {p2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/pkp;->s0()Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    if-eqz p2, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/pkp;->r0()Ll/avl;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-interface {p2}, Ll/avl;->getRealView()Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/pkp;->s0()Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    invoke-virtual {p0}, Ll/pkp;->r0()Ll/avl;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-interface {p2}, Ll/avl;->getRealView()Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-static {p2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/pkp;->s0()Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    return-void
.end method
