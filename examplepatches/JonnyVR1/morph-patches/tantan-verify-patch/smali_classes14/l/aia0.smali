.class public Ll/aia0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ljava/lang/String; = "aia0"

.field public static e:Ll/aia0;


# instance fields
.field public a:Z

.field public b:Ljava/lang/String;

.field public c:Ll/md20;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/aia0;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/aia0;Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/aia0;->w(Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;Ll/gcg0;)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "ca-app-pub-6567608331519569/1891609663"

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    new-instance v0, Ll/f70$a;

    .line 17
    .line 18
    invoke-direct {v0, p0, v1}, Ll/f70$a;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance p0, Landroid/util/Pair;

    .line 22
    .line 23
    invoke-direct {p0, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    :goto_0
    new-instance p0, Landroid/util/Pair;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-direct {p0, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic c(Ll/gcg0;Ll/md20;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    const-string v1, "ca-app-pub-6567608331519569/1891609663"

    .line 4
    .line 5
    invoke-direct {v0, p1, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic d(Ll/aia0;Lcom/p1/mobile/android/app/Act;ZLandroid/util/Pair;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/aia0;->s(Lcom/p1/mobile/android/app/Act;ZLandroid/util/Pair;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ll/aia0;Ljava/lang/Throwable;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aia0;->u(Ljava/lang/Throwable;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(Ll/md20;Landroid/widget/FrameLayout;Lcom/google/android/gms/ads/nativead/NativeAdView;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/md20;->f()Ll/dsx;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/dsx;->c()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p2}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getMediaView()Lcom/google/android/gms/ads/nativead/MediaView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p2}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getMediaView()Lcom/google/android/gms/ads/nativead/MediaView;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    int-to-float p2, p2

    .line 22
    div-float/2addr p2, p0

    .line 23
    float-to-int p2, p2

    .line 24
    invoke-static {v0, p2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 25
    .line 26
    .line 27
    const p2, 0x3fd9999a    # 1.7f

    .line 28
    .line 29
    .line 30
    cmpl-float p0, p0, p2

    .line 31
    .line 32
    if-ltz p0, :cond_0

    .line 33
    .line 34
    sget p0, Ll/adc0;->n:I

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const/high16 p1, 0x42100000    # 36.0f

    .line 41
    .line 42
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    sget p0, Ll/adc0;->n:I

    .line 51
    .line 52
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 61
    .line 62
    const/16 p2, 0x51

    .line 63
    .line 64
    iput p2, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 65
    .line 66
    sget p2, Ll/adc0;->n:I

    .line 67
    .line 68
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public static synthetic h(Ll/aia0;Lcom/p1/mobile/android/app/Act;Landroid/util/Pair;ZLl/gcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/aia0;->r(Lcom/p1/mobile/android/app/Act;Landroid/util/Pair;ZLl/gcg0;)V

    return-void
.end method

.method public static synthetic i(Ll/aia0;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/aia0;->v(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Ll/aia0;Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aia0;->t(Landroid/util/Pair;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic k()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/aia0;->d:Ljava/lang/String;

    return-object v0
.end method

.method public static m()Ll/aia0;
    .locals 2

    .line 1
    sget-object v0, Ll/aia0;->e:Ll/aia0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/aia0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/aia0;->e:Ll/aia0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/aia0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/aia0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/aia0;->e:Ll/aia0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/aia0;->e:Ll/aia0;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public A(Landroid/view/ViewGroup;Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aia0;->c:Ll/md20;

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
    iget-object v0, p0, Ll/aia0;->c:Ll/md20;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/aia0;->z(Landroid/view/ViewGroup;Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/md20;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-interface {p3}, Ll/x20;->call()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public B(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aia0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final C(Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;)V
    .locals 6

    .line 1
    new-instance v0, Ll/xha0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v3, p1

    .line 5
    move-object v5, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v2, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/xha0;-><init>(Ll/aia0;Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v3, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public D(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/aia0;->l()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iput-boolean p1, p0, Ll/aia0;->a:Z

    .line 7
    .line 8
    return-void
.end method

.method public E(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const-string p0, "e_profile_photo_no_ad_button"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "e_profile_info_no_ad_button"

    .line 7
    .line 8
    :goto_0
    const/4 v0, 0x0

    .line 9
    new-array v0, v0, [Ll/sfj0$a;

    .line 10
    .line 11
    const-string v1, "p_suggest_user_profile_info_view"

    .line 12
    .line 13
    invoke-static {p0, v1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->B4()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FreeTrialData;->titleText:Ljava/lang/String;

    .line 35
    .line 36
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 39
    .line 40
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/FreeTrialData;->promotionUrl:Ljava/lang/String;

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    invoke-static {p1, p0, p2, v0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string p2, "hideNavigationBar"

    .line 52
    .line 53
    invoke-virtual {p0, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    if-eqz p2, :cond_2

    .line 61
    .line 62
    const-string p0, "p_suggest_user_profile_info_view,e_profile_photo_no_ad_button,click"

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    const-string p0, "p_suggest_user_profile_info_view,e_profile_info_no_ad_button,click"

    .line 66
    .line 67
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->intl_no_ad:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 76
    .line 77
    invoke-interface {p2, p1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->i6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final l()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->V1:Ll/vxd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-lez p0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v0, v0, Ll/dkb;->V1:Ll/vxd0;

    .line 24
    .line 25
    add-int/lit8 p0, p0, -0x1

    .line 26
    .line 27
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final n()I
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->V1:Ll/vxd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/aia0;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/aia0;->q()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 16
    .line 17
    const-string p1, "female"

    .line 18
    .line 19
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    return v1
.end method

.method public q()Z
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    if-eqz v2, :cond_2

    .line 16
    .line 17
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 33
    .line 34
    invoke-static {}, Ll/pzi0;->o()J

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    iget-wide v5, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 39
    .line 40
    double-to-long v5, v5

    .line 41
    sget v7, Ll/d79;->h:I

    .line 42
    .line 43
    invoke-static {v3, v4, v5, v6, v7}, Ll/tzi0;->h(JJI)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_2

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 50
    .line 51
    const-string v3, "male"

    .line 52
    .line 53
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_2

    .line 64
    .line 65
    invoke-static {}, Ll/pgj;->e()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_2

    .line 70
    .line 71
    invoke-static {}, Ll/d79;->n()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/aia0;->n()I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-lez p0, :cond_2

    .line 82
    .line 83
    const/4 p0, 0x1

    .line 84
    return p0

    .line 85
    :cond_2
    :goto_0
    return v1
.end method

.method public final synthetic r(Lcom/p1/mobile/android/app/Act;Landroid/util/Pair;ZLl/gcg0;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_2

    .line 12
    .line 13
    iget-object p1, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    iget-object p1, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p1, Ll/f70$a;

    .line 25
    .line 26
    new-instance v0, Ll/zha0;

    .line 27
    .line 28
    invoke-direct {v0, p4}, Ll/zha0;-><init>(Ll/gcg0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ll/f70$a;->b(Ll/md20$c;)Ll/f70$a;

    .line 32
    .line 33
    .line 34
    new-instance p1, Ll/kfl0$a;

    .line 35
    .line 36
    invoke-direct {p1}, Ll/kfl0$a;-><init>()V

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    invoke-virtual {p1, v0}, Ll/kfl0$a;->b(Z)Ll/kfl0$a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Ll/kfl0$a;->a()Ll/kfl0;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance v0, Ll/qd20$a;

    .line 49
    .line 50
    invoke-direct {v0}, Ll/qd20$a;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ll/qd20$a;->h(Ll/kfl0;)Ll/qd20$a;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Ll/qd20$a;->a()Ll/qd20;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object v0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast v0, Ll/f70$a;

    .line 64
    .line 65
    invoke-virtual {v0, p1}, Ll/f70$a;->d(Ll/qd20;)Ll/f70$a;

    .line 66
    .line 67
    .line 68
    iget-object p1, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast p1, Ll/f70$a;

    .line 71
    .line 72
    new-instance p2, Ll/aia0$a;

    .line 73
    .line 74
    invoke-direct {p2, p0, p4, p3}, Ll/aia0$a;-><init>(Ll/aia0;Ll/gcg0;Z)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, p2}, Ll/f70$a;->c(Ll/d70;)Ll/f70$a;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Ll/f70$a;->a()Ll/f70;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    new-instance p2, Ll/s70$a;

    .line 86
    .line 87
    invoke-direct {p2}, Ll/s70$a;-><init>()V

    .line 88
    .line 89
    .line 90
    iget-object p3, p0, Ll/aia0;->b:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result p3

    .line 96
    if-nez p3, :cond_1

    .line 97
    .line 98
    iget-object p0, p0, Ll/aia0;->b:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p2, p0}, Ll/r6;->d(Ljava/lang/String;)Ll/r6;

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_1
    const/4 p0, 0x0

    .line 105
    invoke-static {p0}, Ll/u2n;->g(Z)Ljava/util/List;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p2, p0}, Ll/r6;->e(Ljava/util/List;)Ll/r6;

    .line 110
    .line 111
    .line 112
    :goto_0
    invoke-virtual {p2}, Ll/s70$a;->i()Ll/s70;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p1, p0}, Ll/f70;->a(Ll/s70;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_2
    :goto_1
    new-instance p0, Landroid/util/Pair;

    .line 121
    .line 122
    const/4 p1, 0x0

    .line 123
    const-string p2, "ca-app-pub-6567608331519569/1891609663"

    .line 124
    .line 125
    invoke-direct {p0, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    invoke-interface {p4, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public final synthetic s(Lcom/p1/mobile/android/app/Act;ZLandroid/util/Pair;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/yha0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p3, p2}, Ll/yha0;-><init>(Ll/aia0;Lcom/p1/mobile/android/app/Act;Landroid/util/Pair;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final synthetic t(Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ll/md20;

    .line 4
    .line 5
    iput-object p1, p0, Ll/aia0;->c:Ll/md20;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final synthetic u(Ljava/lang/Throwable;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ll/aia0;->c:Ll/md20;

    .line 3
    .line 4
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 5
    .line 6
    return-object p0
.end method

.method public final synthetic v(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-virtual {p0, p1, p2}, Ll/aia0;->E(Lcom/p1/mobile/android/app/Act;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic w(Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/widget/TextView;->getTextSize()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {v0}, Ll/vnb;->u1(F)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/16 v1, 0x12

    .line 22
    .line 23
    if-le v0, v1, :cond_0

    .line 24
    .line 25
    const/16 v0, 0x8

    .line 26
    .line 27
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/high16 v1, 0x42c00000    # 96.0f

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {p4}, Landroid/view/View;->getWidth()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    add-int/2addr v0, v2

    .line 51
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    add-int/2addr v0, v2

    .line 56
    invoke-static {}, Ll/bnl0;->y0()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-le v0, v2, :cond_1

    .line 61
    .line 62
    invoke-virtual {p2}, Landroid/widget/TextView;->getTextSize()F

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-static {v0}, Ll/vnb;->u1(F)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    add-int/lit8 v0, v0, -0x1

    .line 71
    .line 72
    int-to-float v0, v0

    .line 73
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p2, p4, p3, p1}, Ll/aia0;->C(Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    invoke-static {p3}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_2

    .line 85
    .line 86
    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-virtual {p4}, Landroid/view/View;->getWidth()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    add-int/2addr v0, v2

    .line 95
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    add-int/2addr v0, v1

    .line 100
    invoke-static {}, Ll/bnl0;->y0()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-le v0, v1, :cond_2

    .line 105
    .line 106
    invoke-virtual {p3}, Landroid/widget/TextView;->getTextSize()F

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    invoke-static {v0}, Ll/vnb;->u1(F)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    add-int/lit8 v0, v0, -0x1

    .line 115
    .line 116
    int-to-float v0, v0

    .line 117
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0, p2, p4, p3, p1}, Ll/aia0;->C(Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;)V

    .line 121
    .line 122
    .line 123
    :cond_2
    return-void
.end method

.method public final x(Lcom/p1/mobile/android/app/Act;Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Z)",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ll/md20;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/vha0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/vha0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/wha0;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1, p2}, Ll/wha0;-><init>(Ll/aia0;Lcom/p1/mobile/android/app/Act;Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public y(Lcom/p1/mobile/android/app/Act;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Z)",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/n70;->g()Ll/n70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/n70;->f()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/aia0;->q()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_1
    invoke-virtual {p0, p1, p2}, Ll/aia0;->x(Lcom/p1/mobile/android/app/Act;Z)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance p2, Ll/qha0;

    .line 36
    .line 37
    invoke-direct {p2, p0}, Ll/qha0;-><init>(Ll/aia0;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance p2, Ll/rha0;

    .line 45
    .line 46
    invoke-direct {p2, p0}, Ll/rha0;-><init>(Ll/aia0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, p2}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method

.method public final z(Landroid/view/ViewGroup;Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/md20;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Ll/kec0;->C3:I

    const/4 v2, 0x0

    .line 2
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 3
    sget v1, Ll/adc0;->M8:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/ads/nativead/NativeAdView;

    .line 4
    sget v2, Ll/adc0;->j:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 5
    sget v3, Ll/adc0;->n:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/ads/nativead/MediaView;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setMediaView(Lcom/google/android/gms/ads/nativead/MediaView;)V

    .line 6
    sget v3, Ll/adc0;->e5:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setHeadlineView(Landroid/view/View;)V

    .line 7
    sget v3, Ll/adc0;->g:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setBodyView(Landroid/view/View;)V

    .line 8
    sget v3, Ll/adc0;->h:I

    .line 9
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 10
    invoke-virtual {v1, v3}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setCallToActionView(Landroid/view/View;)V

    .line 11
    sget v3, Ll/adc0;->O:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setIconView(Landroid/view/View;)V

    .line 12
    invoke-virtual {v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getHeadlineView()Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {p4}, Ll/md20;->d()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    sget v3, Ll/adc0;->f5:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 14
    invoke-virtual {p4}, Ll/md20;->d()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    sget v4, Ll/adc0;->e5:I

    .line 16
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    sget v5, Ll/adc0;->h:I

    .line 17
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 18
    invoke-virtual {p0, v4, v5, v3, p2}, Ll/aia0;->C(Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;)V

    .line 19
    invoke-virtual {p4}, Ll/md20;->f()Ll/dsx;

    move-result-object v3

    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_1

    .line 20
    invoke-virtual {v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getMediaView()Lcom/google/android/gms/ads/nativead/MediaView;

    move-result-object v3

    invoke-virtual {p4}, Ll/md20;->f()Ll/dsx;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/google/android/gms/ads/nativead/MediaView;->setMediaContent(Ll/dsx;)V

    .line 21
    invoke-virtual {v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getMediaView()Lcom/google/android/gms/ads/nativead/MediaView;

    move-result-object v3

    new-instance v5, Ll/sha0;

    invoke-direct {v5, p4, v0, v1}, Ll/sha0;-><init>(Ll/md20;Landroid/widget/FrameLayout;Lcom/google/android/gms/ads/nativead/NativeAdView;)V

    .line 22
    invoke-virtual {v3, v5}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 23
    invoke-virtual {p4}, Ll/md20;->f()Ll/dsx;

    move-result-object v3

    invoke-interface {v3}, Ll/dsx;->b()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 24
    sget v5, Ll/adc0;->A6:I

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    if-eqz v3, :cond_0

    const/16 v6, 0x19

    .line 25
    invoke-static {v3, v6, v4}, Ll/u2n;->s(Landroid/graphics/drawable/Drawable;IZ)Lrx/c;

    move-result-object v3

    invoke-virtual {p2, v3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v3

    .line 26
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v6, Ll/u60;

    invoke-direct {v6, v5}, Ll/u60;-><init>(Landroid/widget/ImageView;)V

    new-instance v5, Ll/v60;

    invoke-direct {v5}, Ll/v60;-><init>()V

    invoke-static {v6, v5}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object v5

    .line 27
    invoke-virtual {v3, v5}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    goto :goto_0

    .line 28
    :cond_0
    const-string v3, "#FFEDE5"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v5, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 29
    :cond_1
    :goto_0
    invoke-virtual {p4}, Ll/md20;->b()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    if-nez v3, :cond_2

    .line 30
    invoke-virtual {v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getBodyView()Landroid/view/View;

    move-result-object v3

    invoke-static {v3, v5}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    goto :goto_1

    .line 31
    :cond_2
    invoke-virtual {v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getBodyView()Landroid/view/View;

    move-result-object v3

    invoke-static {v3, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 32
    invoke-virtual {v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getBodyView()Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {p4}, Ll/md20;->b()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    :goto_1
    invoke-virtual {p4}, Ll/md20;->c()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_3

    .line 34
    invoke-virtual {v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getCallToActionView()Landroid/view/View;

    move-result-object v3

    invoke-static {v3, v5}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    goto :goto_2

    .line 35
    :cond_3
    invoke-virtual {v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getCallToActionView()Landroid/view/View;

    move-result-object v3

    invoke-static {v3, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 36
    invoke-virtual {v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getCallToActionView()Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {p4}, Ll/md20;->c()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    :goto_2
    invoke-virtual {p4}, Ll/md20;->e()Ll/md20$b;

    move-result-object v3

    if-nez v3, :cond_4

    .line 38
    invoke-virtual {v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getIconView()Landroid/view/View;

    move-result-object v3

    invoke-static {v3, v5}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    goto :goto_3

    .line 39
    :cond_4
    invoke-virtual {v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getIconView()Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 40
    invoke-virtual {p4}, Ll/md20;->e()Ll/md20$b;

    move-result-object v6

    invoke-virtual {v6}, Ll/md20$b;->a()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 41
    invoke-virtual {v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getIconView()Landroid/view/View;

    move-result-object v3

    invoke-static {v3, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 42
    :goto_3
    invoke-virtual {v1, p4}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setNativeAd(Ll/md20;)V

    .line 43
    const-string p4, "p_suggest_user_profile_info_view"

    new-array v1, v5, [Ll/sfj0$a;

    const-string v3, "e_profile_photo_no_ad_button"

    invoke-static {v3, p4, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 44
    sget p4, Ll/adc0;->y7:I

    .line 45
    invoke-virtual {v0, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p4

    new-instance v1, Ll/tha0;

    invoke-direct {v1, p0, p2}, Ll/tha0;-><init>(Ll/aia0;Lcom/p1/mobile/android/app/Act;)V

    .line 46
    invoke-virtual {p4, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    new-instance p0, Ll/uha0;

    invoke-direct {p0, p3}, Ll/uha0;-><init>(Ll/x20;)V

    invoke-static {v2, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 48
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 49
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void
.end method
