.class public final synthetic Lqt3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;B)V
    .registers 3

    iput-byte p2, p0, Lqt3;->a:B

    iput-object p1, p0, Lqt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 19

    move-object/from16 v0, p0

    iget-byte v1, v0, Lqt3;->a:B

    const v2, 0x7f140ebc

    sget-object v3, Lijm;->b:Lijm;

    const/4 v4, 0x2

    const/4 v5, 0x3

    const/16 v6, 0x1388

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x0

    iget-object v0, v0, Lqt3;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v1, :pswitch_data_3ec

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->L0()Lipk;

    move-result-object v0

    iget-object v1, v0, Lipk;->m:Lvk;

    iget-object v1, v1, Lvk;->a:Ljava/util/ArrayList;

    new-instance v2, Ljn7;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "dummy "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "https://en.wikipedia.org/wiki/"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/util/Random;

    invoke-direct {v5}, Ljava/util/Random;-><init>()V

    invoke-virtual {v5}, Ljava/util/Random;->nextLong()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    invoke-direct {v2, v3, v4, v5, v6}, Ljn7;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, v0, Lipk;->b:Ljs6;

    invoke-virtual {v0}, Ljs6;->a()V

    return-void

    :pswitch_5d
    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->y1()V

    return-void

    :pswitch_61
    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->c1:Lku3;

    iget-object v1, v0, Lku3;->a:Lhu3;

    iput-boolean v8, v1, Lhu3;->b:Z

    iget-object v0, v0, Lku3;->d:Landroid/os/Handler;

    invoke-virtual {v0, v8}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    :pswitch_6d
    invoke-virtual {v0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v1

    check-cast v1, Lqdc;

    iget-object v1, v1, Lqdc;->i:Lqcc;

    sget-object v2, Lqcc;->e:Lqcc;

    invoke-virtual {v1, v2}, Lqcc;->d(Lqcc;)Z

    move-result v1

    if-eqz v1, :cond_82

    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->b1()V

    :cond_82
    return-void

    :pswitch_83
    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->recreate()V

    return-void

    :pswitch_87
    new-array v1, v7, [Ln6h;

    new-instance v11, Lwzg;

    const/4 v2, 0x4

    const-class v3, Li8d;

    invoke-direct {v11, v9, v3, v2}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v10, Lzhj;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v17

    const/4 v12, 0x0

    const/4 v13, 0x2

    const/16 v14, 0x1003

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-direct/range {v10 .. v17}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v10, v0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_a5
    iget-object v1, v0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v1, :cond_aa

    move-object v9, v1

    :cond_aa
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    iget-object v2, v9, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_bb
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb2l;

    check-cast v3, Ld7l;

    iget-object v3, v3, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v3

    iget v3, v3, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_bb

    :cond_d9
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v1

    iget-object v2, v0, Lcom/opera/android/BrowserActivity;->C:Lfnh;

    if-eqz v2, :cond_10e

    iget-object v2, v2, Lfnh;->f:Lcom/opera/android/browser/SessionStore;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iget-wide v6, v2, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v6, v7, v3}, LJ/N;->MqkthI77(JLjava/lang/Object;)V

    invoke-interface {v3}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v2

    new-instance v3, Lmn;

    const/16 v4, 0x12

    invoke-direct {v3, v4}, Lmn;-><init>(B)V

    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object v2

    invoke-static {}, Ljava/util/stream/Collectors;->toSet()Ljava/util/stream/Collector;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    :cond_10e
    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->a:Lhx3;

    iget-object v0, v0, Lhx3;->s:Lfx3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lu4l;

    new-instance v2, Lmr3;

    invoke-direct {v2, v5}, Lmr3;-><init>(B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Llt;

    invoke-direct {v3, v1, v8}, Llt;-><init>(Ljava/util/Set;B)V

    iget-object v1, v0, Lu4l;->d:Lt4l;

    new-instance v4, Ljbd;

    const/16 v5, 0x18

    invoke-direct {v4, v0, v3, v2, v5}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v4}, Lldk;->f(Ljava/lang/Runnable;)V

    return-void

    :pswitch_134
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->x1()V

    return-void

    :pswitch_13a
    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->a:Lhx3;

    invoke-virtual {v0}, Lhx3;->B()Lcom/opera/android/Lazy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lonn;

    iget-object v1, v0, Lonn;->d:Lx5f;

    iget-object v2, v1, Lx5f;->d:Lzpa;

    iget-object v3, v0, Lonn;->b:Lb59;

    iget-object v0, v0, Lonn;->c:Lmgh;

    iget-object v5, v0, Lmgh;->b:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lmgh;->c:Ljava/lang/Object;

    check-cast v0, Lj4c;

    invoke-static {v5}, Lr9n;->H(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_1c4

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/WallpaperManager;

    invoke-virtual {v5, v8}, Landroid/app/WallpaperManager;->getWallpaperId(I)I

    move-result v5

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/WallpaperManager;

    invoke-virtual {v0, v4}, Landroid/app/WallpaperManager;->getWallpaperId(I)I

    move-result v0

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/SharedPreferences;

    const-string v6, "home_screen_wallpaper_id"

    const/4 v7, -0x1

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    const-string v6, "system_wallpaper"

    if-eq v5, v4, :cond_19c

    iget-boolean v4, v1, Lx5f;->h:Z

    if-eqz v4, :cond_19c

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v2}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v5

    invoke-virtual {v5}, Lb66;->z()Lqu0;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v5, v8, v8, v6}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v4}, Lx5f;->U0(Lx56;)V

    :cond_19c
    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    const-string v4, "lock_screen_wallpaper_id"

    const/4 v5, -0x2

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    if-eq v0, v3, :cond_1c4

    iget-boolean v0, v1, Lx5f;->h:Z

    if-eqz v0, :cond_1c4

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    invoke-virtual {v0, v2}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v2

    invoke-virtual {v2}, Lb66;->A()Lqu0;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v8, v8, v6}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v0}, Lx5f;->U0(Lx56;)V

    :cond_1c4
    return-void

    :pswitch_1c5
    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->i0:Lzv3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Li12;

    iget-object v1, v0, Li12;->a:Lumi;

    new-instance v2, Lrml;

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v2, v3, v1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Lg12;

    invoke-direct {v1, v0, v7}, Lg12;-><init>(Li12;B)V

    invoke-virtual {v2, v1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v1

    new-instance v2, Lk51;

    const/16 v3, 0x1c

    invoke-direct {v2, v3}, Lk51;-><init>(B)V

    invoke-virtual {v1, v2}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v1

    iget-object v0, v0, Li12;->d:Lqie;

    invoke-virtual {v1, v0}, Lplk;->m(Lqie;)Lp1j;

    return-void

    :pswitch_1f2
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0}, Landroid/app/Activity;->finishAndRemoveTask()V

    return-void

    :pswitch_1f8
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0}, Ldx3;->W()Lk6l;

    move-result-object v0

    if-eqz v0, :cond_203

    invoke-virtual {v0}, Lk6l;->z()V

    :cond_203
    return-void

    :pswitch_204
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v1

    if-eqz v1, :cond_240

    move-object v2, v1

    check-cast v2, Ld7l;

    iget-object v3, v2, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-static {v3, v5}, Lf03;->J(Landroid/net/Uri;I)Z

    move-result v3

    if-eqz v3, :cond_22d

    invoke-virtual {v2}, Ld7l;->f()Z

    move-result v2

    if-nez v2, :cond_22d

    iget-object v2, v0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v2, :cond_22a

    move-object v2, v9

    :cond_22a
    invoke-virtual {v2, v1}, Lk6l;->k(Lb2l;)V

    :cond_22d
    invoke-virtual {v0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v1

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v0

    invoke-static {v1, v0, v9, v9}, Lxih;->v(Landroidx/fragment/app/w;Ldb;Ljava/lang/String;Lmni;)V

    :cond_240
    return-void

    :pswitch_241
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v1

    check-cast v1, Lqdc;

    iget-object v1, v1, Lqdc;->i:Lqcc;

    sget-object v2, Lqcc;->e:Lqcc;

    invoke-virtual {v1, v2}, Lqcc;->d(Lqcc;)Z

    move-result v1

    if-eqz v1, :cond_311

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->X0()Z

    move-result v1

    if-eqz v1, :cond_311

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->k0()Z

    move-result v1

    if-eqz v1, :cond_311

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v1

    iget-object v1, v1, Lru9;->a:Landroid/content/SharedPreferences;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    const-string v5, "main.menu.button.hint.closed"

    invoke-interface {v1, v5, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_29f

    const-string v5, "main.menu.button.clicked"

    invoke-interface {v1, v5, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_29f

    iget-boolean v1, v2, Lcom/opera/android/settings/SettingsManager;->h:Z

    if-eqz v1, :cond_287

    move v1, v8

    goto :goto_28b

    :cond_287
    invoke-virtual {v2}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result v1

    :goto_28b
    if-nez v1, :cond_29f

    iget-object v1, v0, Ldx3;->o:Lqim;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v1, Lqim;->g:Loz3;

    new-instance v2, Lkt3;

    invoke-direct {v2, v0, v8}, Lkt3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Lr22;->b(Ljjm;Lijm;)V

    :cond_29f
    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v1

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    iget-object v5, v0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v5, :cond_2ac

    move-object v5, v9

    :cond_2ac
    sget-object v6, Lp6l;->a:Lp6l;

    invoke-virtual {v5, v6}, Lk6l;->s(Lp6l;)I

    move-result v6

    if-le v6, v8, :cond_311

    iget-object v5, v5, Lk6l;->o:Lb2l;

    if-eqz v5, :cond_311

    check-cast v5, Ld7l;

    invoke-virtual {v5}, Ld7l;->n0()Z

    move-result v5

    if-ne v5, v8, :cond_311

    iget-object v1, v1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v5, "tab_gallery.gallery_button_hint_bubble_shown"

    invoke-interface {v1, v5, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_311

    const-string v5, "feature_tips_notification"

    invoke-virtual {v2, v5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_311

    const-string v2, "tab_gallery.shown"

    invoke-interface {v1, v2, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_311

    const-string v2, "tab_gallery.tabui2_bubble_tour_shown"

    invoke-interface {v1, v2, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_311

    iget-object v1, v0, Ldx3;->o:Lqim;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v1, Lqim;->g:Loz3;

    new-instance v2, Lioc;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v5

    iget-object v6, v0, Lcom/opera/android/BrowserActivity;->z:Lz43;

    if-eqz v6, :cond_2f4

    move-object v9, v6

    :cond_2f4
    invoke-virtual {v9}, Lz43;->l()Landroid/view/View;

    move-result-object v6

    if-nez v6, :cond_308

    const v6, 0x7f0a018f

    invoke-virtual {v0, v6}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v6

    if-nez v6, :cond_308

    new-instance v6, Landroid/widget/ImageView;

    invoke-direct {v6, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    :cond_308
    invoke-direct {v2, v4, v6, v5}, Lioc;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Lr22;->b(Ljjm;Lijm;)V

    :cond_311
    return-void

    :pswitch_312
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0, v9, v7}, Lcom/opera/android/BrowserActivity;->u1(Lre7;I)V

    return-void

    :pswitch_318
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->B1()V

    return-void

    :pswitch_31e
    const-class v1, Ld8j;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v0

    check-cast v0, Ld8j;

    check-cast v0, Lg8j;

    const-class v1, Lts1;

    invoke-virtual {v0, v1, v9}, Lg8j;->l(Ljava/lang/Class;Landroid/os/Bundle;)V

    return-void

    :pswitch_330
    iget-object v1, v0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-eqz v1, :cond_335

    move-object v9, v1

    :cond_335
    iget-object v1, v9, Lgbf;->j:Lvbf;

    invoke-virtual {v1}, Lvbf;->p()Z

    move-result v1

    if-eqz v1, :cond_346

    new-instance v1, Lqt3;

    const/4 v2, 0x6

    invoke-direct {v1, v0, v2}, Lqt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_346
    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->k:Lzv3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcg2;

    if-eqz v0, :cond_362

    iget-object v0, v0, Lcg2;->j:Lgg2;

    if-eqz v0, :cond_362

    sget-object v1, Lgg2;->G:Landroid/graphics/Point;

    new-instance v1, Lvk1;

    const/16 v2, 0x14

    invoke-direct {v1, v2}, Lvk1;-><init>(B)V

    invoke-virtual {v0, v1}, Lgg2;->h(Lkotlin/jvm/functions/Function0;)V

    :cond_362
    return-void

    :pswitch_363
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->v0()V

    iget-object v1, v0, Ldx3;->o:Lqim;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v1, Lqim;->e:Lysj;

    new-instance v3, Lrxh;

    const v4, 0x7f140745

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    new-instance v4, Lrxh;

    invoke-direct {v4, v2}, Lrxh;-><init>(I)V

    new-instance v2, Lmt3;

    const/16 v5, 0xd

    invoke-direct {v2, v0, v5}, Lmt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-static {v1, v3, v6, v4, v2}, Ljoh;->g(Lysj;Lrxh;ILrxh;Lkotlin/jvm/functions/Function0;)V

    return-void

    :pswitch_387
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->v0()V

    iget-object v1, v0, Ldx3;->o:Lqim;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v1, Lqim;->e:Lysj;

    new-instance v3, Lrxh;

    const v4, 0x7f140744

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    new-instance v4, Lrxh;

    invoke-direct {v4, v2}, Lrxh;-><init>(I)V

    new-instance v2, Lmt3;

    const/16 v5, 0xf

    invoke-direct {v2, v0, v5}, Lmt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-static {v1, v3, v6, v4, v2}, Ljoh;->g(Lysj;Lrxh;ILrxh;Lkotlin/jvm/functions/Function0;)V

    return-void

    :pswitch_3ab
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->v0()V

    new-instance v1, Ltg7;

    invoke-direct {v1}, Ltg7;-><init>()V

    iput-object v1, v0, Lcom/opera/android/BrowserActivity;->N0:Ltg7;

    iget-object v0, v0, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lqim;->e:Lysj;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_3c5
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->v0()V

    iget-object v1, v0, Ldx3;->o:Lqim;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v1, Lqim;->e:Lysj;

    new-instance v2, Lrxh;

    const v3, 0x7f14132a

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    new-instance v3, Lrxh;

    const v4, 0x7f14132b

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    new-instance v4, Lmt3;

    const/16 v5, 0xc

    invoke-direct {v4, v0, v5}, Lmt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-static {v1, v2, v6, v3, v4}, Ljoh;->g(Lysj;Lrxh;ILrxh;Lkotlin/jvm/functions/Function0;)V

    return-void

    :pswitch_data_3ec
    .packed-switch 0x0
        :pswitch_3c5
        :pswitch_3ab
        :pswitch_387
        :pswitch_363
        :pswitch_330
        :pswitch_31e
        :pswitch_318
        :pswitch_312
        :pswitch_241
        :pswitch_204
        :pswitch_1f8
        :pswitch_1f2
        :pswitch_1c5
        :pswitch_13a
        :pswitch_134
        :pswitch_a5
        :pswitch_87
        :pswitch_83
        :pswitch_6d
        :pswitch_61
        :pswitch_5d
    .end packed-switch
.end method
