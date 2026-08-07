.class public Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDelegateLayout;

.field public b:Lv/VPager;

.field public c:Lv/VPagerWormIndicator;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lv/VButton_FakeShadow;

.field public f:Lv/VText;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lv/VFrame_FixRatio;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

.field public l:Ljava/lang/Runnable;

.field public m:Landroid/text/SpannableStringBuilder;

.field public n:Ll/jor;

.field public o:Landroid/text/style/RelativeSizeSpan;

.field public p:Landroid/text/style/StyleSpan;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->l:Ljava/lang/Runnable;

    .line 6
    .line 7
    new-instance p1, Landroid/text/SpannableStringBuilder;

    .line 8
    .line 9
    invoke-direct {p1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->m:Landroid/text/SpannableStringBuilder;

    .line 13
    .line 14
    new-instance p1, Ll/jor;

    .line 15
    .line 16
    const v0, -0xbcb7

    .line 17
    .line 18
    .line 19
    const v1, -0x17ac1

    .line 20
    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-direct {p1, v0, v1, v2}, Ll/jor;-><init>(IIZ)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->n:Ll/jor;

    .line 27
    .line 28
    new-instance p1, Landroid/text/style/RelativeSizeSpan;

    .line 29
    .line 30
    const v0, 0x3f99999a    # 1.2f

    .line 31
    .line 32
    .line 33
    invoke-direct {p1, v0}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->o:Landroid/text/style/RelativeSizeSpan;

    .line 37
    .line 38
    new-instance p1, Landroid/text/style/StyleSpan;

    .line 39
    .line 40
    invoke-direct {p1, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->p:Landroid/text/style/StyleSpan;

    .line 44
    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 46
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->l:Ljava/lang/Runnable;

    .line 48
    new-instance p1, Landroid/text/SpannableStringBuilder;

    invoke-direct {p1}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->m:Landroid/text/SpannableStringBuilder;

    .line 49
    new-instance p1, Ll/jor;

    const p2, -0xbcb7

    const v0, -0x17ac1

    const/4 v1, 0x1

    invoke-direct {p1, p2, v0, v1}, Ll/jor;-><init>(IIZ)V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->n:Ll/jor;

    .line 50
    new-instance p1, Landroid/text/style/RelativeSizeSpan;

    const p2, 0x3f99999a    # 1.2f

    invoke-direct {p1, p2}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->o:Landroid/text/style/RelativeSizeSpan;

    .line 51
    new-instance p1, Landroid/text/style/StyleSpan;

    invoke-direct {p1, v1}, Landroid/text/style/StyleSpan;-><init>(I)V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->p:Landroid/text/style/StyleSpan;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 52
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->l:Ljava/lang/Runnable;

    .line 54
    new-instance p1, Landroid/text/SpannableStringBuilder;

    invoke-direct {p1}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->m:Landroid/text/SpannableStringBuilder;

    .line 55
    new-instance p1, Ll/jor;

    const p2, -0xbcb7

    const p3, -0x17ac1

    const/4 v0, 0x1

    invoke-direct {p1, p2, p3, v0}, Ll/jor;-><init>(IIZ)V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->n:Ll/jor;

    .line 56
    new-instance p1, Landroid/text/style/RelativeSizeSpan;

    const p2, 0x3f99999a    # 1.2f

    invoke-direct {p1, p2}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->o:Landroid/text/style/RelativeSizeSpan;

    .line 57
    new-instance p1, Landroid/text/style/StyleSpan;

    invoke-direct {p1, v0}, Landroid/text/style/StyleSpan;-><init>(I)V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->p:Landroid/text/style/StyleSpan;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->x()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;Landroid/app/Activity;[Lcom/p1/mobile/android/app/Dialog;Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->w(Landroid/app/Activity;[Lcom/p1/mobile/android/app/Dialog;Ll/l4g0;)V

    return-void
.end method

.method public static synthetic c([Lcom/p1/mobile/android/app/Dialog;Ll/l4g0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object p0, p0, v0

    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(IIII)[I
    .locals 2

    .line 1
    const/4 p3, 0x2

    .line 2
    new-array p3, p3, [I

    .line 3
    .line 4
    const/high16 v0, 0x42200000    # 40.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    sub-int/2addr p2, v0

    .line 11
    int-to-float p2, p2

    .line 12
    const v0, 0x3f533333    # 0.825f

    .line 13
    .line 14
    .line 15
    mul-float/2addr p2, v0

    .line 16
    invoke-static {}, Ll/ive0;->e()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    sget v0, Ll/qa00;->x:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/high16 v0, 0x41b80000    # 23.0f

    .line 26
    .line 27
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    :goto_0
    int-to-float v0, v0

    .line 32
    add-float/2addr p2, v0

    .line 33
    float-to-int p2, p2

    .line 34
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/4 v1, 0x0

    .line 39
    aput p0, p3, v1

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    if-gt p2, v0, :cond_1

    .line 43
    .line 44
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    aput p1, p3, p0

    .line 49
    .line 50
    return-object p3

    .line 51
    :cond_1
    aput p1, p3, p0

    .line 52
    .line 53
    return-object p3
.end method

.method public static synthetic f(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const-string v0, "e_second_privacy_policy_popup_read_button"

    .line 2
    .line 3
    const-string v1, "p_second_privacy_policy_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/x20;)V
    .locals 2

    .line 1
    const-string v0, "e_first_privacy_policy_popup_refuse_button"

    .line 2
    .line 3
    const-string v1, "p_first_privacy_policy_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic j(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const-string v0, "e_second_privacy_policy_popup_leave_button"

    .line 2
    .line 3
    const-string v1, "p_second_privacy_policy_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;I)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->r(I)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->s(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final A(Landroid/app/Activity;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 6

    .line 1
    const-class p0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "p_second_privacy_policy_popup"

    .line 8
    .line 9
    invoke-static {v0, p0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v4, "logon_page"

    .line 14
    .line 15
    const-string v5, "privacy_permission_make_sure"

    .line 16
    .line 17
    const-string v0, "passive"

    .line 18
    .line 19
    const-string v1, "alert"

    .line 20
    .line 21
    const-string v2, "alert_self_definition_basic"

    .line 22
    .line 23
    const-string v3, "null"

    .line 24
    .line 25
    invoke-static/range {v0 .. v5}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$e;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    sget p1, Lcom/p1/mobile/putong/common/R$string;->F1:I

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    sget v0, Lcom/p1/mobile/putong/common/R$string;->D1:I

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const/4 v0, 0x0

    .line 54
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    sget v1, Lcom/p1/mobile/putong/common/R$string;->C1:I

    .line 59
    .line 60
    new-instance v2, Ll/f4g;

    .line 61
    .line 62
    invoke-direct {v2, p2}, Ll/f4g;-><init>(Ljava/lang/Runnable;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    sget p2, Lcom/p1/mobile/putong/common/R$string;->E1:I

    .line 70
    .line 71
    new-instance v1, Ll/v3g;

    .line 72
    .line 73
    invoke-direct {v1, p3}, Ll/v3g;-><init>(Ljava/lang/Runnable;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, p2, v1}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    new-instance p2, Ll/w3g;

    .line 81
    .line 82
    invoke-direct {p2, p0}, Ll/w3g;-><init>(Ll/l4g0;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    filled-new-array {p1}, [Lcom/p1/mobile/android/app/Dialog;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    aget-object p1, p1, v0

    .line 98
    .line 99
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 100
    .line 101
    .line 102
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public B(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final o(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/h4g;->a(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 7

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->o(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->a:Lv/VDelegateLayout;

    .line 8
    .line 9
    new-instance v1, Ll/u3g;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/u3g;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lv/VDelegateLayout;->setOnMeasureDelegate(Lv/VDelegateLayout$a;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->d:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->t()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->t()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->e:Lv/VButton_FakeShadow;

    .line 37
    .line 38
    sget v2, Ll/cbc0;->f:I

    .line 39
    .line 40
    invoke-static {v0, v1, v2}, Ll/bnl0;->A0(Landroid/content/Context;Landroid/view/View;I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->e:Lv/VButton_FakeShadow;

    .line 44
    .line 45
    const v1, -0x666667

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->e:Lv/VButton_FakeShadow;

    .line 57
    .line 58
    sget v2, Ll/cbc0;->g:I

    .line 59
    .line 60
    invoke-static {v0, v1, v2}, Ll/bnl0;->A0(Landroid/content/Context;Landroid/view/View;I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->e:Lv/VButton_FakeShadow;

    .line 64
    .line 65
    const/4 v1, -0x1

    .line 66
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 67
    .line 68
    .line 69
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->e:Lv/VButton_FakeShadow;

    .line 70
    .line 71
    sget v1, Lcom/p1/mobile/putong/common/R$string;->F0:I

    .line 72
    .line 73
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->y()V

    .line 81
    .line 82
    .line 83
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    const-string v1, "zh"

    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    check-cast v1, Landroid/app/Activity;

    .line 102
    .line 103
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->f:Lv/VText;

    .line 104
    .line 105
    if-eqz v0, :cond_1

    .line 106
    .line 107
    sget v0, Lcom/p1/mobile/putong/common/R$string;->t2:I

    .line 108
    .line 109
    sget v3, Lcom/p1/mobile/putong/common/R$string;->a0:I

    .line 110
    .line 111
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    const-string v4, " %s "

    .line 120
    .line 121
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    sget v4, Lcom/p1/mobile/putong/common/R$string;->w1:I

    .line 126
    .line 127
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    const-string v5, " %s"

    .line 136
    .line 137
    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    invoke-virtual {v1, v0, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    goto :goto_1

    .line 150
    :cond_1
    sget v0, Lcom/p1/mobile/putong/common/R$string;->t2:I

    .line 151
    .line 152
    sget v3, Lcom/p1/mobile/putong/common/R$string;->a0:I

    .line 153
    .line 154
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    sget v4, Lcom/p1/mobile/putong/common/R$string;->w1:I

    .line 159
    .line 160
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v3

    .line 168
    invoke-virtual {v1, v0, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    :goto_1
    sget v3, Lcom/p1/mobile/putong/common/R$string;->a0:I

    .line 173
    .line 174
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v4

    .line 182
    sget v5, Lcom/p1/mobile/putong/common/R$string;->w1:I

    .line 183
    .line 184
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v5

    .line 188
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v6

    .line 192
    filled-new-array {v3, v4, v5, v6}, [Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    invoke-static {v1, v0, v3}, Ll/q8g0;->B(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 201
    .line 202
    .line 203
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->f:Lv/VText;

    .line 204
    .line 205
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    check-cast v0, Landroid/app/Activity;

    .line 217
    .line 218
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->z(Landroid/app/Activity;)V

    .line 219
    .line 220
    .line 221
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->e:Lv/VButton_FakeShadow;

    .line 222
    .line 223
    new-instance v1, Ll/x3g;

    .line 224
    .line 225
    invoke-direct {v1, p0}, Ll/x3g;-><init>(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;)V

    .line 226
    .line 227
    .line 228
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 229
    .line 230
    .line 231
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->d:Landroid/widget/FrameLayout;

    .line 232
    .line 233
    new-instance v1, Ll/y3g;

    .line 234
    .line 235
    invoke-direct {v1, p0}, Ll/y3g;-><init>(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;)V

    .line 236
    .line 237
    .line 238
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 239
    .line 240
    .line 241
    return-void
.end method

.method public p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/i4g;->b(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->k:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Lcom/tencent/mm/opensdk/openapi/WXAPIFactory;->createWXAPI(Landroid/content/Context;Ljava/lang/String;)Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->k:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final r(I)I
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    if-eq p1, p0, :cond_0

    .line 5
    .line 6
    sget p0, Ll/cbc0;->e:I

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    sget p0, Ll/cbc0;->d:I

    .line 10
    .line 11
    return p0

    .line 12
    :cond_1
    sget p0, Ll/cbc0;->c:I

    .line 13
    .line 14
    return p0
.end method

.method public final s(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->m:Landroid/text/SpannableStringBuilder;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->m:Landroid/text/SpannableStringBuilder;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clearSpans()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->m:Landroid/text/SpannableStringBuilder;

    .line 29
    .line 30
    invoke-virtual {v0, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 38
    .line 39
    .line 40
    move-result p3

    .line 41
    add-int/2addr p3, v0

    .line 42
    if-ltz v0, :cond_3

    .line 43
    .line 44
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-le p3, p2, :cond_2

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->m:Landroid/text/SpannableStringBuilder;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->o:Landroid/text/style/RelativeSizeSpan;

    .line 54
    .line 55
    const/16 v2, 0x21

    .line 56
    .line 57
    invoke-virtual {p2, v1, v0, p3, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 58
    .line 59
    .line 60
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->m:Landroid/text/SpannableStringBuilder;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->p:Landroid/text/style/StyleSpan;

    .line 63
    .line 64
    invoke-virtual {p2, v1, v0, p3, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 65
    .line 66
    .line 67
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->m:Landroid/text/SpannableStringBuilder;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->n:Ll/jor;

    .line 70
    .line 71
    invoke-virtual {p2, v1, v0, p3, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 72
    .line 73
    .line 74
    :cond_3
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->m:Landroid/text/SpannableStringBuilder;

    .line 75
    .line 76
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public t()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->q()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->k:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 5
    .line 6
    invoke-interface {p0}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->isWXAppInstalled()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Landroid/app/Activity;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->z(Landroid/app/Activity;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Landroid/app/Activity;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->z(Landroid/app/Activity;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic w(Landroid/app/Activity;[Lcom/p1/mobile/android/app/Dialog;Ll/l4g0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/d4g;

    .line 2
    .line 3
    invoke-direct {v0, p2, p3}, Ll/d4g;-><init>([Lcom/p1/mobile/android/app/Dialog;Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Ll/e4g;

    .line 7
    .line 8
    invoke-direct {p2}, Ll/e4g;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->A(Landroid/app/Activity;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic x()V
    .locals 2

    .line 1
    const-string v0, "e_first_privacy_policy_popup_confirm_button"

    .line 2
    .line 3
    const-string v1, "p_first_privacy_policy_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/uqb0;->B:Ll/jxd0;

    .line 9
    .line 10
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->l:Ljava/lang/Runnable;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->l:Ljava/lang/Runnable;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final y()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;-><init>(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->b:Lv/VPager;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->c:Lv/VPagerWormIndicator;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->b:Lv/VPager;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lv/VPagerWormIndicator;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final z(Landroid/app/Activity;)V
    .locals 8

    .line 1
    sget-object v0, Ll/uqb0;->B:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

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
    return-void

    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    new-array v0, v0, [Lcom/p1/mobile/android/app/Dialog;

    .line 18
    .line 19
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "p_first_privacy_policy_popup"

    .line 26
    .line 27
    invoke-static {v2, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v6, "logon_page"

    .line 32
    .line 33
    const-string v7, "privacy_permission_make_sure"

    .line 34
    .line 35
    const-string v2, "passive"

    .line 36
    .line 37
    const-string v3, "alert"

    .line 38
    .line 39
    const-string v4, "alert_self_definition_basic"

    .line 40
    .line 41
    const-string v5, "null"

    .line 42
    .line 43
    invoke-static/range {v2 .. v7}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v1, v2}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    sget v3, Ll/jec0;->N:I

    .line 55
    .line 56
    const/4 v4, 0x0

    .line 57
    const/4 v5, 0x0

    .line 58
    invoke-virtual {v2, v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    sget v3, Ll/ycc0;->s0:I

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    check-cast v3, Lv/VText;

    .line 69
    .line 70
    const/4 v4, 0x2

    .line 71
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 76
    .line 77
    .line 78
    sget v3, Ll/ycc0;->y0:I

    .line 79
    .line 80
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    check-cast v3, Lv/VText;

    .line 85
    .line 86
    new-instance v4, Ll/z3g;

    .line 87
    .line 88
    invoke-direct {v4, p0, p1, v0, v1}, Ll/z3g;-><init>(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;Landroid/app/Activity;[Lcom/p1/mobile/android/app/Dialog;Ll/l4g0;)V

    .line 89
    .line 90
    .line 91
    new-instance v6, Lcom/p1/mobile/android/app/Dialog$e;

    .line 92
    .line 93
    invoke-direct {v6, p1}, Lcom/p1/mobile/android/app/Dialog$e;-><init>(Landroid/content/Context;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v6, v2}, Lcom/p1/mobile/android/app/Dialog$e;->O(Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    const/high16 v6, 0x41800000    # 16.0f

    .line 101
    .line 102
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 103
    .line 104
    .line 105
    move-result v6

    .line 106
    const/4 v7, -0x1

    .line 107
    invoke-virtual {v2, v7, v7, v7, v6}, Lcom/p1/mobile/android/app/Dialog$e;->C(IIII)Lcom/p1/mobile/android/app/Dialog$e;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v2, v5}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    sget v6, Lcom/p1/mobile/putong/common/R$string;->x1:I

    .line 120
    .line 121
    new-instance v7, Ll/a4g;

    .line 122
    .line 123
    invoke-direct {v7, p0}, Ll/a4g;-><init>(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2, v6, v7}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    sget v2, Lcom/p1/mobile/putong/common/R$string;->z1:I

    .line 131
    .line 132
    new-instance v6, Ll/b4g;

    .line 133
    .line 134
    invoke-direct {v6, v4}, Ll/b4g;-><init>(Ll/x20;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v2, v6}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    new-instance v2, Ll/c4g;

    .line 142
    .line 143
    invoke-direct {v2, v1}, Ll/c4g;-><init>(Ll/l4g0;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    aput-object p0, v0, v5

    .line 155
    .line 156
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 157
    .line 158
    .line 159
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 160
    .line 161
    .line 162
    sget p0, Lcom/p1/mobile/putong/common/R$string;->G1:I

    .line 163
    .line 164
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    sget v0, Lcom/p1/mobile/putong/common/R$string;->B1:I

    .line 169
    .line 170
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    const-string v1, "#027abb"

    .line 175
    .line 176
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    sget v2, Lcom/p1/mobile/putong/common/R$string;->y1:I

    .line 181
    .line 182
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v4

    .line 198
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v5

    .line 202
    filled-new-array {p0, v4, v0, v5}, [Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-static {p1, v1, v2, p0}, Ll/q8g0;->D(Landroid/app/Activity;ILjava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 211
    .line 212
    .line 213
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 218
    .line 219
    .line 220
    return-void
.end method
