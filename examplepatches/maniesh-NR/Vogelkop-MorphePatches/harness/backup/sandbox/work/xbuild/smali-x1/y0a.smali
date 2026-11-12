.class public final synthetic Ly0a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ly0a;->a:B

    iput-object p1, p0, Ly0a;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 11

    iget-byte v0, p0, Ly0a;->a:B

    const/16 v1, 0x3e7

    const/4 v2, 0x3

    const/4 v3, 0x0

    const/4 v4, 0x5

    const/4 v5, 0x0

    const/4 v6, 0x1

    iget-object p0, p0, Ly0a;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_462

    check-cast p0, Lu1f;

    check-cast p1, Landroid/content/SharedPreferences;

    iget-object p1, p0, Lp1f;->b:Lnrl;

    invoke-virtual {p1}, Lnrl;->K()V

    iget-object p1, p0, Lu1f;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p1

    new-instance v0, Lob;

    const/16 v1, 0xc

    invoke-direct {v0, p0, v1}, Lob;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Ltcc;->a(Lmdc;)V

    return-void

    :pswitch_2a
    check-cast p0, Lwpe;

    check-cast p1, Ljava/lang/Boolean;

    iget-object p0, p0, Lwpe;->c:Ljava/lang/Object;

    check-cast p0, Lkxe;

    iput-boolean v5, p0, Lkxe;->L:Z

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_41

    iget-object p0, p0, Lkxe;->y:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "night_mode_overlay_keyboard"

    invoke-virtual {p0, v6, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_41
    return-void

    :pswitch_42
    check-cast p0, Lhd;

    check-cast p1, Ljava/lang/String;

    iget-boolean v0, p0, Lhd;->b:Z

    if-nez v0, :cond_5b

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5b

    iput-boolean v6, p0, Lhd;->b:Z

    new-instance v0, Lkse;

    iget-object v1, p0, Lhd;->f:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-direct {v0, p0, v1, p1}, Lkse;-><init>(Lhd;Landroid/content/Context;Ljava/lang/String;)V

    :cond_5b
    return-void

    :pswitch_5c
    check-cast p0, Lfqe;

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lfqe;->f:Lode;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_66
    check-cast p0, Lzne;

    check-cast p1, Lpne;

    iget-object v0, p0, Lzne;->b:Ljava/util/HashMap;

    iget-object v1, p1, Lpne;->c:Ljava/util/List;

    iget-object v2, p1, Lpne;->a:Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_9f

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpne;

    if-eqz v1, :cond_88

    iget-object v3, p1, Lpne;->c:Ljava/util/List;

    iget-object v1, v1, Lpne;->c:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9f

    :cond_88
    invoke-virtual {v0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lzne;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_91
    if-ge v5, v0, :cond_9f

    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v5, v5, 0x1

    check-cast v1, Lcom/opera/api/Callback;

    invoke-interface {v1, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_91

    :cond_9f
    return-void

    :pswitch_a0
    check-cast p0, Lho7;

    check-cast p1, Lpne;

    iget-object v0, p1, Lpne;->c:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_f1

    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lho7;->a:Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iget-object v1, p1, Lpne;->a:Ljava/lang/String;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v4, p1, Lpne;->c:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_c0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_e3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iget-object v7, p1, Lpne;->a:Ljava/lang/String;

    const-string v8, "sha256/"

    invoke-static {v8, v6}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v5

    new-instance v8, Lmq4;

    invoke-direct {v8, v7, v6}, Lmq4;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_c0

    :cond_e3
    new-instance p1, Lnq4;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v2

    invoke-direct {p1, v2, v3}, Lnq4;-><init>(Ljava/util/Set;Lokhttp3/internal/tls/CertificateChainCleaner;)V

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object v0, p0, Lho7;->a:Ljava/util/HashMap;

    :cond_f1
    return-void

    :pswitch_f2
    check-cast p0, Lsyd;

    check-cast p1, Landroid/content/SharedPreferences;

    iget-boolean v0, p0, Lsyd;->f:Z

    if-nez v0, :cond_109

    iput-boolean v6, p0, Lsyd;->f:Z

    iget-object v0, p0, Lsyd;->b:Lcom/opera/android/settings/SettingsManager;

    new-instance v1, Lt00;

    invoke-direct {v1, p0, p1, v6}, Lt00;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p0, p1, v5}, Lsyd;->a(Landroid/content/SharedPreferences;Z)V

    :cond_109
    return-void

    :pswitch_10a
    check-cast p0, Ligi;

    check-cast p1, Lb2l;

    invoke-virtual {p0, p1}, Ligi;->B0(Lb2l;)V

    return-void

    :pswitch_112
    check-cast p0, Lzqd;

    check-cast p1, Landroid/graphics/Bitmap;

    iget-object p0, p0, Lzqd;->c:Lard;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_150

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    const/16 v1, 0x72

    if-lt v0, v1, :cond_150

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    if-lt v0, v1, :cond_150

    iget-object v0, p0, Lard;->f:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_147

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iget-object v1, p0, Lard;->f:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    if-lt v0, v1, :cond_150

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iget-object v1, p0, Lard;->f:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    if-lt v0, v1, :cond_150

    :cond_147
    invoke-static {p1}, Lipe;->r(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lard;->f:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Lard;->h()V

    :cond_150
    return-void

    :pswitch_151
    check-cast p0, Lard;

    check-cast p1, Ljkd;

    iget-object v0, p0, Lard;->j:Lzqd;

    iget-object v0, v0, Lzqd;->a:Lorg/chromium/content_public/browser/MediaSession;

    if-eqz v0, :cond_163

    iget-object p0, p0, Lard;->c:Lepd;

    iget-boolean p1, p1, Ljkd;->c:Z

    xor-int/2addr p1, v6

    invoke-virtual {p0, v0, p1, v6}, Lepd;->a(Lorg/chromium/content_public/browser/MediaSession;ZZ)V

    :cond_163
    return-void

    :pswitch_164
    check-cast p0, Lh7d;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lh7d;->c:Landroid/content/res/Resources;

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-static {v0}, Li7d;->s0(Landroid/content/res/Configuration;)Z

    move-result v0

    iget-object v1, p0, Lh7d;->a:Lvl6;

    if-eqz v0, :cond_182

    iget-object p0, v1, Lvl6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    invoke-virtual {p0, v2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->I(I)V

    goto :goto_19a

    :cond_182
    iget-byte p0, p0, Lh7d;->f:B

    iget-object v0, v1, Lvl6;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    invoke-virtual {v0, p1}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->H(I)V

    invoke-virtual {v0, p0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->I(I)V

    const/4 p1, 0x4

    if-eq p0, p1, :cond_193

    if-ne p0, v4, :cond_19a

    :cond_193
    iget-object p0, v1, Lvl6;->e:Ljava/lang/Object;

    check-cast p0, Landroidx/core/widget/NestedScrollView;

    invoke-virtual {p0, v5, v5}, Landroidx/core/widget/NestedScrollView;->scrollTo(II)V

    :cond_19a
    :goto_19a
    return-void

    :pswitch_19b
    check-cast p0, Li7d;

    check-cast p1, Ljava/lang/Boolean;

    iget-object v0, p0, Li7d;->l:Lpt1;

    if-eqz v0, :cond_1cf

    iget-object v0, v0, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/FrameLayout$LayoutParams;

    if-eqz v1, :cond_1cf

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    iget v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const v3, -0x800008

    and-int/2addr v1, v3

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1bf

    or-int/2addr v1, v2

    goto :goto_1c0

    :cond_1bf
    or-int/2addr v1, v4

    :goto_1c0
    iget p1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-eq v1, p1, :cond_1cf

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object p0, p0, Li7d;->l:Lpt1;

    iget-object p0, p0, Lpt1;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1cf
    return-void

    :pswitch_1d0
    check-cast p0, Liu2;

    check-cast p1, Lipf;

    invoke-virtual {p0, p1}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_1d8
    check-cast p0, Lurc;

    check-cast p1, Lepc;

    iget-object p0, p0, Lurc;->g:Lode;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_1e2
    check-cast p0, Ls9i;

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/webcore/WebcoreRpcBridge;

    iget-wide v0, p0, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_1f5

    invoke-static {v0, v1, p1}, LJ/N;->MM1UajSt(JLjava/lang/Object;)V

    :cond_1f5
    return-void

    :pswitch_1f6
    check-cast p0, Ldka;

    check-cast p1, Lvyn;

    new-instance v0, Lsha;

    iget-object v1, p1, Lvyn;->a:Ljava/lang/String;

    iget-object v3, p1, Lvyn;->b:Ljava/lang/String;

    iget-object v4, p1, Lvyn;->c:Ljava/lang/String;

    new-instance v5, Lvha;

    iget-object v2, p1, Lvyn;->d:Ljava/lang/String;

    iget-object p1, p1, Lvyn;->e:Ljava/lang/String;

    invoke-direct {v5, v2, p1}, Lvha;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v2, v1

    invoke-direct/range {v0 .. v5}, Lsha;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lvha;)V

    new-instance p1, Lsw7;

    invoke-direct {p1, v0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Ldka;->n(Ltw7;)V

    return-void

    :pswitch_218
    check-cast p0, Ldka;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_22d

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v0, Lsw7;

    invoke-direct {v0, p1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Ldka;->n(Ltw7;)V

    goto :goto_23c

    :cond_22d
    const-string p1, "Failed to unsubscribe"

    new-instance v0, Lcqb;

    invoke-direct {v0, v1, p1}, Lcqb;-><init>(ILjava/lang/String;)V

    new-instance p1, Lrw7;

    invoke-direct {p1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Ldka;->n(Ltw7;)V

    :goto_23c
    return-void

    :pswitch_23d
    check-cast p0, Ldka;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_252

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v0, Lsw7;

    invoke-direct {v0, p1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Ldka;->n(Ltw7;)V

    goto :goto_261

    :cond_252
    const-string p1, "Failed to subscribe"

    new-instance v0, Lcqb;

    invoke-direct {v0, v1, p1}, Lcqb;-><init>(ILjava/lang/String;)V

    new-instance p1, Lrw7;

    invoke-direct {p1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Ldka;->n(Ltw7;)V

    :goto_261
    return-void

    :pswitch_262
    check-cast p0, Ligi;

    check-cast p1, Lmoc;

    iget-object v0, p1, Lmoc;->a:Ltpc;

    iget-object v1, p1, Lmoc;->b:Ljava/lang/String;

    if-eqz v0, :cond_286

    iget-object v0, v0, Ltpc;->b:Ljava/lang/String;

    if-eqz v0, :cond_286

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_286

    iget-boolean v0, p1, Lmoc;->c:Z

    if-eqz v0, :cond_286

    iget-boolean v0, p1, Lmoc;->d:Z

    if-eqz v0, :cond_286

    iget-boolean v0, p1, Lmoc;->e:Z

    if-eqz v0, :cond_286

    iget-boolean v0, p1, Lmoc;->f:Z

    if-nez v0, :cond_288

    :cond_286
    move-object v2, v3

    goto :goto_293

    :cond_288
    iget-object p1, p1, Lmoc;->a:Ltpc;

    iget-object v0, p1, Ltpc;->b:Ljava/lang/String;

    iget-object p1, p1, Ltpc;->c:Ljava/lang/String;

    new-instance v2, Lls6;

    invoke-direct {v2, v0, p1, v1}, Lls6;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_293
    iget-object p1, p0, Ligi;->g:Ljava/lang/Object;

    check-cast p1, Lls6;

    invoke-static {p1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_342

    sget-object v1, Ligi;->j:Ljava/lang/Object;

    monitor-enter v1

    :try_start_2a0
    iput-object v2, p0, Ligi;->g:Ljava/lang/Object;

    monitor-exit v1
    :try_end_2a3
    .catchall {:try_start_2a0 .. :try_end_2a3} :catchall_345

    if-eqz v2, :cond_2a7

    move p1, v6

    goto :goto_2a8

    :cond_2a7
    move p1, v5

    :goto_2a8
    iget-object v0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eq p1, v0, :cond_2c3

    iget-object v0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_2c3
    if-eqz p1, :cond_342

    iget-object p1, p0, Ligi;->f:Ljava/lang/Object;

    check-cast p1, Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "prefs_params_country"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_306

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v4, "prefs_params_language"

    invoke-interface {v1, v4, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_306

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/SharedPreferences;

    const-string v7, "prefs_params_user_id"

    invoke-interface {v4, v7, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_306

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    const-string v7, "prefs_params_version"

    invoke-interface {p1, v7, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    if-ne p1, v6, :cond_306

    new-instance v3, Lls6;

    invoke-direct {v3, v0, v1, v4}, Lls6;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_306
    invoke-virtual {v2, v3}, Lls6;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_342

    iget-object p1, p0, Ligi;->f:Ljava/lang/Object;

    check-cast p1, Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "prefs_params_country"

    iget-object v1, v2, Lls6;->a:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "prefs_params_language"

    iget-object v1, v2, Lls6;->b:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "prefs_params_user_id"

    iget-object v1, v2, Lls6;->c:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "prefs_params_version"

    invoke-interface {p1, v0, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p0, p0, Ligi;->d:Ljava/lang/Object;

    check-cast p0, Liv;

    invoke-virtual {p0}, Liv;->run()V

    :cond_342
    return-void

    :goto_343
    :try_start_343
    monitor-exit v1
    :try_end_344
    .catchall {:try_start_343 .. :try_end_344} :catchall_345

    throw p0

    :catchall_345
    move-exception v0

    move-object p0, v0

    goto :goto_343

    :pswitch_348
    check-cast p0, Lsu;

    check-cast p1, Lr3g;

    if-eqz p1, :cond_34f

    move v5, v6

    :cond_34f
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lsu;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_357
    check-cast p0, Lu9c;

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    iget-object p0, p0, Lu9c;->a:Landroid/content/Context;

    new-instance v0, Lwgf;

    sget-object v1, Llqm;->K:Llqm;

    invoke-direct {v0, p1, v1}, Lwgf;-><init>(Landroid/net/Uri;Llqm;)V

    const-string p1, "com.opera.android.action.OPEN_URL"

    invoke-virtual {v0, p0, p1}, Ls0f;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    :pswitch_372
    check-cast p0, Lcom/google/android/material/textfield/TextInputEditText;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_37a
    check-cast p0, Landroid/view/View;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :pswitch_386
    check-cast p0, Landroid/widget/Button;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    return-void

    :pswitch_392
    check-cast p0, Lcka;

    check-cast p1, Lvyn;

    new-instance v0, Lvka;

    iget-object v1, p1, Lvyn;->a:Ljava/lang/String;

    iget-object v3, p1, Lvyn;->b:Ljava/lang/String;

    iget-object v4, p1, Lvyn;->c:Ljava/lang/String;

    new-instance v5, Lwka;

    iget-object v2, p1, Lvyn;->d:Ljava/lang/String;

    iget-object p1, p1, Lvyn;->e:Ljava/lang/String;

    invoke-direct {v5, v2, p1}, Lwka;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v2, v1

    invoke-direct/range {v0 .. v5}, Lvka;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lwka;)V

    new-instance p1, Lsw7;

    invoke-direct {p1, v0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Lcka;->n(Ltw7;)V

    return-void

    :pswitch_3b4
    check-cast p0, Leka;

    check-cast p1, Lvyn;

    new-instance v0, Ltha;

    iget-object v1, p1, Lvyn;->a:Ljava/lang/String;

    iget-object v3, p1, Lvyn;->b:Ljava/lang/String;

    iget-object v4, p1, Lvyn;->c:Ljava/lang/String;

    new-instance v5, Lwha;

    iget-object v2, p1, Lvyn;->d:Ljava/lang/String;

    iget-object p1, p1, Lvyn;->e:Ljava/lang/String;

    invoke-direct {v5, v2, p1}, Lwha;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v2, v1

    invoke-direct/range {v0 .. v5}, Ltha;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lwha;)V

    new-instance p1, Lsw7;

    invoke-direct {p1, v0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Leka;->n(Ltw7;)V

    return-void

    :pswitch_3d6
    check-cast p0, Lcom/opera/android/history/e;

    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Lcom/opera/android/history/e;->g:Lqde;

    iget-object v0, p0, Lqde;->l:Ljava/util/ArrayList;

    check-cast p1, Ljava/util/Collection;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_3eb
    check-cast p0, Lju2;

    check-cast p1, Ljava/lang/Boolean;

    iget-object v0, p0, Lju2;->c:Ljava/lang/Object;

    check-cast v0, Lx5f;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-boolean v2, v0, Lx5f;->h:Z

    if-eqz v2, :cond_416

    iget-object v2, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    new-instance v5, Lck0;

    invoke-direct {v5, v2, v3}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v2, v5, Lck0;->e:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lun0;

    iget-object v2, v2, Lun0;->b:Lsn0;

    invoke-virtual {v2, v4, v6, v1}, Ljf0;->r(IIZ)V

    invoke-virtual {v0, v3}, Lx5f;->U0(Lx56;)V

    :cond_416
    iget-object p0, p0, Lju2;->b:Ljava/lang/Object;

    check-cast p0, Lx5f;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Lck0;

    invoke-direct {v2, v0, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v2}, Lck0;->h()Lat0;

    move-result-object v0

    iget-object v0, v0, Lat0;->a:Lzs0;

    const/16 v2, 0xe

    invoke-virtual {v0, v2, v6, p1}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void

    :pswitch_438
    check-cast p0, Lb1a;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_445

    invoke-virtual {p0, v6}, Lb1a;->X(Z)V

    :cond_445
    return-void

    :pswitch_446
    check-cast p0, Lc1a;

    check-cast p1, Lei7;

    iget-object p0, p0, Lc1a;->h:Ljava/lang/Object;

    check-cast p0, Lb1a;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lei7;->b:Lei7;

    if-ne p1, v0, :cond_460

    iget-object p1, p0, Lb1a;->c:Lx5f;

    sget-object v0, Lwe0;->d:Lwe0;

    invoke-virtual {p0}, Lb1a;->W()Lci0;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Lx5f;->V(Lwe0;Lci0;)V

    :cond_460
    return-void

    nop

    :pswitch_data_462
    .packed-switch 0x0
        :pswitch_446
        :pswitch_438
        :pswitch_3eb
        :pswitch_3d6
        :pswitch_3b4
        :pswitch_392
        :pswitch_386
        :pswitch_37a
        :pswitch_372
        :pswitch_357
        :pswitch_348
        :pswitch_262
        :pswitch_23d
        :pswitch_218
        :pswitch_1f6
        :pswitch_1e2
        :pswitch_1d8
        :pswitch_1d0
        :pswitch_19b
        :pswitch_164
        :pswitch_151
        :pswitch_112
        :pswitch_10a
        :pswitch_f2
        :pswitch_a0
        :pswitch_66
        :pswitch_5c
        :pswitch_42
        :pswitch_2a
    .end packed-switch
.end method
