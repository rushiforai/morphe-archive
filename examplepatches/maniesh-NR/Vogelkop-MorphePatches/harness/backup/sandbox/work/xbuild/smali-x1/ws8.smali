.class public final Lws8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lws8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayDeque;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object v0, p0, Lws8;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 16
    iput-byte p2, p0, Lws8;->a:B

    iput-object p1, p0, Lws8;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method private final b(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method private final c(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method private final d(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method private final e(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method private final f(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method private final g(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method private final h(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method private final i(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method private final j(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method private final k(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method private final l(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method private final m(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method private final n(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method private final o(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method private final p(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method private final q(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method private final r(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method private final s(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method private final t(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method private final u(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method private final v(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 6

    iget-byte p2, p0, Lws8;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lws8;->b:Ljava/lang/Object;

    packed-switch p2, :pswitch_data_aa

    return-void

    :pswitch_9
    check-cast p0, Lbko;

    invoke-virtual {p0, p1, v0}, Lbko;->i(Landroid/app/Activity;Z)V

    :pswitch_e
    return-void

    :pswitch_f
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_a8

    check-cast p0, Ljava/util/ArrayDeque;

    const/4 p2, 0x0

    :try_start_18
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_41

    const-string v1, "google.message_id"

    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2c

    const-string v1, "message_id"

    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_2c
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3b

    invoke-virtual {p0, v1}, Ljava/util/ArrayDeque;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a8

    invoke-virtual {p0, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    :cond_3b
    const-string p0, "gcm.n.analytics_data"

    invoke-virtual {p1, p0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p2
    :try_end_41
    .catch Ljava/lang/RuntimeException; {:try_start_18 .. :try_end_41} :catch_41

    :catch_41
    :cond_41
    const-string p0, "1"

    if-eqz p2, :cond_4f

    const-string p1, "google.c.a.e"

    invoke-virtual {p2, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :cond_4f
    if-eqz v0, :cond_a8

    if-eqz p2, :cond_a3

    const-string p1, "google.c.a.tc"

    invoke-virtual {p2, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_a3

    invoke-static {}, Lr49;->e()Lr49;

    move-result-object p0

    const-class p1, Ly01;

    invoke-virtual {p0, p1}, Lr49;->b(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ly01;

    if-eqz p0, :cond_a3

    const-string p1, "google.c.a.c_id"

    invoke-virtual {p2, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    check-cast p0, Lz01;

    sget-object v0, Lcrp;->b:Lcsh;

    const-string v1, "fcm"

    invoke-virtual {v0, v1}, Lh1b;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_86

    iget-object v0, p0, Lz01;->a:Lcom/google/android/gms/measurement/api/AppMeasurementSdk;

    const-string v2, "_ln"

    invoke-virtual {v0, v1, v2, p1}, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->setUserProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_86
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "source"

    const-string v2, "Firebase"

    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "medium"

    const-string v2, "notification"

    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "campaign"

    invoke-virtual {v0, v1, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "_cmp"

    invoke-virtual {p0, v0, p1}, Lz01;->a(Landroid/os/Bundle;Ljava/lang/String;)V

    :cond_a3
    const-string p0, "_no"

    invoke-static {p2, p0}, Lphj;->f0(Landroid/os/Bundle;Ljava/lang/String;)V

    :cond_a8
    return-void

    nop

    :pswitch_data_aa
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
        :pswitch_e
        :pswitch_9
    .end packed-switch
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .registers 11

    iget-byte v0, p0, Lws8;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lws8;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_8c

    check-cast p0, Lbqp;

    iget-object v0, p0, Lbqp;->e:Landroid/app/Activity;

    if-ne v0, p1, :cond_13

    iput-object v1, p0, Lbqp;->e:Landroid/app/Activity;

    invoke-virtual {p0}, Lbqp;->b()V

    :cond_13
    return-void

    :pswitch_14
    check-cast p0, Lbko;

    iget-object p0, p0, Lbko;->c:Ljava/util/WeakHashMap;

    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1c
    check-cast p0, Lcom/usercentrics/sdk/UsercentricsDialog;

    invoke-virtual {p0}, Lcom/usercentrics/sdk/UsercentricsDialog;->f()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_28

    invoke-static {v0}, Lcs5;->D(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v1

    :cond_28
    if-ne p1, v1, :cond_8b

    :try_start_2a
    invoke-static {p0}, Lcom/usercentrics/sdk/UsercentricsDialog;->a(Lcom/usercentrics/sdk/UsercentricsDialog;)Lbz0;

    move-result-object v0

    if-eqz v0, :cond_33

    invoke-virtual {v0}, Lzp1;->dismiss()V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_33} :catch_33

    :catch_33
    :cond_33
    invoke-virtual {p1}, Landroid/app/Activity;->isChangingConfigurations()Z

    move-result p1

    if-eqz p1, :cond_88

    iget-object p1, p0, Lcom/usercentrics/sdk/UsercentricsDialog;->l:Lkfm;

    if-eqz p1, :cond_88

    iget-boolean v0, p1, Lkfm;->q:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget v1, p1, Lkfm;->r:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object p1, p1, Lkfm;->b:Lghf;

    invoke-virtual {p1}, Lghf;->A()Ljava/util/ArrayList;

    move-result-object p1

    iget-object v2, p0, Lcom/usercentrics/sdk/UsercentricsDialog;->c:Lcom/usercentrics/sdk/c;

    iget-object v2, v2, Lcom/usercentrics/sdk/c;->a:Lcom/usercentrics/sdk/UsercentricsBanner;

    invoke-static {v2}, Lcom/usercentrics/sdk/UsercentricsBanner;->access$getOnSecondLayerStateSnapshotCallback$p(Lcom/usercentrics/sdk/UsercentricsBanner;)Lkotlin/jvm/functions/Function1;

    move-result-object v2

    if-eqz v2, :cond_88

    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {p1, v4}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :goto_69
    if-ge v5, v4, :cond_80

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lbqg;

    new-instance v7, Lcxm;

    iget-object v8, v6, Lbqg;->a:Ljava/lang/String;

    iget-object v6, v6, Lbqg;->b:Ljava/util/Map;

    invoke-direct {v7, v8, v6}, Lcxm;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_69

    :cond_80
    new-instance p1, Lbxm;

    invoke-direct {p1, v3, v0, v1}, Lbxm;-><init>(Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/Integer;)V

    invoke-interface {v2, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_88
    invoke-virtual {p0}, Lcom/usercentrics/sdk/UsercentricsDialog;->c()V

    :cond_8b
    :pswitch_8b
    return-void

    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_8b
        :pswitch_8b
        :pswitch_1c
        :pswitch_14
    .end packed-switch
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .registers 6

    iget-byte v0, p0, Lws8;->a:B

    iget-object p0, p0, Lws8;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_42

    check-cast p0, Lbqp;

    iget-object v0, p0, Lbqp;->e:Landroid/app/Activity;

    if-eqz v0, :cond_f

    if-ne v0, p1, :cond_29

    :cond_f
    iput-object p1, p0, Lbqp;->e:Landroid/app/Activity;

    const-string p1, "inactive"

    const-string v0, ""

    invoke-virtual {p0, v0, v0, p1}, Lbqp;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/ads/interactivemedia/v3/impl/data/zzb;

    move-result-object p1

    iget-object v0, p0, Lbqp;->a:Lwpp;

    new-instance v1, Lwmb;

    sget-object v2, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;->activityMonitor:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;

    sget-object v3, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;->appStateChanged:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    iget-object p0, p0, Lbqp;->b:Ljava/lang/String;

    invoke-direct {v1, v2, v3, p0, p1}, Lwmb;-><init>(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lwpp;->a(Lwmb;)V

    :cond_29
    return-void

    :pswitch_2a
    check-cast p0, Lbko;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lbko;->i(Landroid/app/Activity;Z)V

    :pswitch_30
    return-void

    :pswitch_31
    check-cast p0, Lcom/opera/android/widget/LottieAnimationView;

    sget p1, Lcom/opera/android/widget/LottieAnimationView;->s:I

    iget-boolean p1, p0, Lcom/opera/android/widget/LottieAnimationView;->p:Z

    if-eqz p1, :cond_41

    const/4 p1, 0x0

    iput-boolean p1, p0, Ln2d;->h:Z

    iget-object p0, p0, Ln2d;->d:Lf3d;

    invoke-virtual {p0}, Lf3d;->j()V

    :cond_41
    :pswitch_41
    return-void

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_41
        :pswitch_31
        :pswitch_30
        :pswitch_2a
    .end packed-switch
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .registers 6

    iget-byte v0, p0, Lws8;->a:B

    iget-object p0, p0, Lws8;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_42

    check-cast p0, Lbqp;

    iget-object v0, p0, Lbqp;->e:Landroid/app/Activity;

    if-ne v0, p1, :cond_25

    const-string p1, "active"

    const-string v0, ""

    invoke-virtual {p0, v0, v0, p1}, Lbqp;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/ads/interactivemedia/v3/impl/data/zzb;

    move-result-object p1

    iget-object v0, p0, Lbqp;->a:Lwpp;

    new-instance v1, Lwmb;

    sget-object v2, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;->activityMonitor:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;

    sget-object v3, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;->appStateChanged:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    iget-object p0, p0, Lbqp;->b:Ljava/lang/String;

    invoke-direct {v1, v2, v3, p0, p1}, Lwmb;-><init>(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lwpp;->a(Lwmb;)V

    :cond_25
    return-void

    :pswitch_26
    check-cast p0, Lbko;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lbko;->i(Landroid/app/Activity;Z)V

    :pswitch_2c
    return-void

    :pswitch_2d
    check-cast p0, Lcom/opera/android/widget/LottieAnimationView;

    sget p1, Lcom/opera/android/widget/LottieAnimationView;->s:I

    iget-boolean p1, p0, Lcom/opera/android/widget/LottieAnimationView;->p:Z

    if-eqz p1, :cond_41

    iget-object p1, p0, Ln2d;->j:Ljava/util/HashSet;

    sget-object v0, Ll2d;->f:Ll2d;

    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Ln2d;->d:Lf3d;

    invoke-virtual {p0}, Lf3d;->k()V

    :cond_41
    :pswitch_41
    return-void

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_41
        :pswitch_2d
        :pswitch_2c
        :pswitch_26
    .end packed-switch
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    iget-byte p0, p0, Lws8;->a:B

    return-void
.end method

.method public final onActivityStarted(Landroid/app/Activity;)V
    .registers 3

    iget-byte v0, p0, Lws8;->a:B

    packed-switch v0, :pswitch_data_10

    return-void

    :pswitch_6
    iget-object p0, p0, Lws8;->b:Ljava/lang/Object;

    check-cast p0, Lbko;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lbko;->i(Landroid/app/Activity;Z)V

    :pswitch_e
    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_6
    .end packed-switch
.end method

.method public final onActivityStopped(Landroid/app/Activity;)V
    .registers 3

    iget-byte v0, p0, Lws8;->a:B

    packed-switch v0, :pswitch_data_10

    return-void

    :pswitch_6
    iget-object p0, p0, Lws8;->b:Ljava/lang/Object;

    check-cast p0, Lbko;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lbko;->i(Landroid/app/Activity;Z)V

    :pswitch_e
    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_6
    .end packed-switch
.end method
