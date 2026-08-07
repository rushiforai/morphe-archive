.class public Ll/xn90;
.super Ll/o2n;
.source "SourceFile"


# instance fields
.field public h:Ljava/lang/String;

.field public i:Ll/y20;

.field public j:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/o2n;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/xn90;->h:Ljava/lang/String;

    .line 7
    .line 8
    iput p1, p0, Ll/xn90;->j:I

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic k(Ll/xn90;Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Lcom/google/android/gms/ads/AdView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/xn90;->r(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Lcom/google/android/gms/ads/AdView;)V

    return-void
.end method

.method public static synthetic l(Ll/xn90;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Boolean;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/xn90;->q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Boolean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic n(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Lcom/google/android/gms/ads/AdView;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method private p()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
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
    iget-object v0, p0, Ll/xn90;->h:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object p0, p0, Ll/xn90;->h:Ljava/lang/String;

    .line 38
    .line 39
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->ao(Ljava/lang/String;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-instance v0, Ll/wn90;

    .line 44
    .line 45
    invoke-direct {v0}, Ll/wn90;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method private s(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/xn90;->p()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/sn90;

    .line 6
    .line 7
    const-string v2, "ca-app-pub-6567608331519569/7959567831"

    .line 8
    .line 9
    invoke-direct {v1, p0, p1, v2}, Ll/sn90;-><init>(Ll/xn90;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/tn90;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/tn90;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {}, Ll/psd0;->R()Lrx/c$d;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/un90;

    .line 39
    .line 40
    invoke-direct {v1, p0, p1, p2}, Ll/un90;-><init>(Ll/xn90;Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V

    .line 41
    .line 42
    .line 43
    new-instance p0, Ll/vn90;

    .line 44
    .line 45
    invoke-direct {p0}, Ll/vn90;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method private t(Lcom/google/android/gms/ads/AdView;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o2n;->b:Lcom/google/android/gms/ads/AdView;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Ll/o2n;->b:Lcom/google/android/gms/ads/AdView;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/o2n;->b:Lcom/google/android/gms/ads/AdView;

    .line 21
    .line 22
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/xn90;->i:Ll/y20;

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget p1, p0, Ll/xn90;->j:I

    .line 35
    .line 36
    const/16 p2, 0xa

    .line 37
    .line 38
    if-ne p1, p2, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Ll/o2n;->b:Lcom/google/android/gms/ads/AdView;

    .line 41
    .line 42
    new-instance p2, Ll/xn90$a;

    .line 43
    .line 44
    invoke-direct {p2, p0}, Ll/xn90$a;-><init>(Ll/xn90;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p2}, Lcom/google/android/gms/ads/BaseAdView;->setAdListener(Ll/d70;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public h(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/o2n;->h(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/o2n;->g:Ljava/util/Map;

    .line 5
    .line 6
    const-string v1, "profileUserId"

    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    instance-of v0, v0, Ljava/lang/String;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/o2n;->g:Ljava/util/Map;

    .line 17
    .line 18
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Ll/xn90;->h:Ljava/lang/String;

    .line 25
    .line 26
    :cond_0
    invoke-direct {p0, p1, p2}, Ll/xn90;->s(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Boolean;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    sget-object p3, Ll/sd2;->INSTANCE:Ll/sd2;

    .line 8
    .line 9
    iget p0, p0, Ll/xn90;->j:I

    .line 10
    .line 11
    filled-new-array {p2}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p3, p1, p0, p2}, Ll/sd2;->f(Lcom/p1/mobile/android/app/Act;I[Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final synthetic r(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Lcom/google/android/gms/ads/AdView;)V
    .locals 1

    .line 1
    invoke-static {p3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    if-eqz p3, :cond_1

    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-direct {p0, p3, p2}, Ll/xn90;->t(Lcom/google/android/gms/ads/AdView;Landroid/view/ViewGroup;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public u(Ll/y20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xn90;->i:Ll/y20;

    .line 2
    .line 3
    return-void
.end method
