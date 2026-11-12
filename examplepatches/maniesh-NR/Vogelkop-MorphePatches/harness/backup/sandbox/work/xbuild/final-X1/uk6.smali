.class public final synthetic Luk6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;
.implements Lfjc;
.implements Ldic;
.implements Lgx6;
.implements Lekj;
.implements Ldkj;
.implements Lav4;
.implements Lvwh;
.implements Lcom/google/android/gms/tasks/OnSuccessListener;
.implements Lcom/google/android/gms/tasks/OnFailureListener;
.implements Lxjj;
.implements Lpjk;
.implements Ljr9;
.implements Lm94;
.implements Lbqb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ld11;Lbsc;Ltjd;Ljava/io/IOException;Z)V
    .registers 6

    .line 9
    const/4 p1, 0x2

    iput-byte p1, p0, Luk6;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Luk6;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ld11;Lnj6;)V
    .registers 3

    const/4 p1, 0x1

    iput-byte p1, p0, Luk6;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Luk6;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 10
    iput-byte p2, p0, Luk6;->a:B

    iput-object p1, p0, Luk6;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final E(Lcom/opera/android/custom_views/CheckBox;)V
    .registers 3

    iget-byte v0, p0, Luk6;->a:B

    iget-object p0, p0, Luk6;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1a

    check-cast p0, Ls12;

    iget-boolean p1, p1, Lcom/opera/android/custom_views/CheckBox;->n:Z

    iput-boolean p1, p0, Ls12;->b:Z

    return-void

    :pswitch_e
    check-cast p0, Lx77;

    iget-object p0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-boolean p1, p1, Lcom/opera/android/custom_views/CheckBox;->n:Z

    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void

    :pswitch_data_1a
    .packed-switch 0xa
        :pswitch_e
    .end packed-switch
.end method

.method public final a()V
    .registers 3

    iget-byte v0, p0, Luk6;->a:B

    iget-object p0, p0, Luk6;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_24

    check-cast p0, Lre7;

    invoke-virtual {p0}, Lre7;->u()V

    return-void

    :pswitch_d
    check-cast p0, Lgd6;

    iget-object p0, p0, Lgd6;->a:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const/4 v0, 0x0

    const-string v1, "enable_suggested_speed_dials_on_start_page"

    invoke-virtual {p0, v0, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_data_24
    .packed-switch 0x9
        :pswitch_d
    .end packed-switch
.end method

.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-object p0, p0, Luk6;->b:Ljava/lang/Object;

    check-cast p0, Lf28;

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lf28;->j(J)J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public final attachCompleter(Ll94;)Ljava/lang/Object;
    .registers 5

    iget-object p0, p0, Luk6;->b:Ljava/lang/Object;

    check-cast p0, Lb28;

    iget-object v0, p0, Lb28;->d:Lf28;

    iget-object v0, v0, Lf28;->g:Lb2j;

    new-instance v1, Lcn7;

    const/16 v2, 0xb

    invoke-direct {v1, p0, p1, v2}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lb2j;->execute(Ljava/lang/Runnable;)V

    const-string p0, "fetchData"

    return-object p0
.end method

.method public final b(Lhjm;)V
    .registers 4

    iget-object p0, p0, Luk6;->b:Ljava/lang/Object;

    check-cast p0, Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v0, "startpage.disable_suggested_sites_dialog_shown"

    const/4 v1, 0x1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void
.end method

.method public final c(Z)V
    .registers 2

    iget-object p0, p0, Luk6;->b:Ljava/lang/Object;

    check-cast p0, Lrv7;

    iget-object p0, p0, Lrv7;->m:Lhd;

    iput-boolean p1, p0, Lhd;->b:Z

    return-void
.end method

.method public final d(Lorg/chromium/ui/modelutil/PropertyModel;Landroid/view/View;)V
    .registers 21

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iget-object v1, v1, Luk6;->b:Ljava/lang/Object;

    check-cast v1, Lmgf;

    iget-object v2, v1, Lmgf;->b:Ljava/lang/Object;

    check-cast v2, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    iget-object v1, v1, Lmgf;->c:Ljava/lang/Object;

    check-cast v1, Ld06;

    sget-boolean v3, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->R:Z

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lc09;->g:Lx5h;

    const-string v3, ""

    invoke-static {v0, v1, v3}, Lorg/chromium/ui/modelutil/PropertyModel;->f(Lorg/chromium/ui/modelutil/PropertyModel;Lu5h;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Ljava/lang/CharSequence;

    sget-object v1, Lc09;->t:Lv5h;

    iget-object v3, v0, Lorg/chromium/ui/modelutil/PropertyModel;->b:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_31

    invoke-virtual {v0, v1}, Lorg/chromium/ui/modelutil/PropertyModel;->b(Lu5h;)I

    move-result v1

    move v4, v1

    goto :goto_32

    :cond_31
    move v4, v5

    :goto_32
    sget-object v1, Lc09;->s:Lv5h;

    invoke-interface {v3, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3e

    invoke-virtual {v0, v1}, Lorg/chromium/ui/modelutil/PropertyModel;->b(Lu5h;)I

    move-result v5

    :cond_3e
    sget-object v1, Lc09;->L:Lv5h;

    invoke-interface {v3, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4c

    invoke-virtual {v0, v1}, Lorg/chromium/ui/modelutil/PropertyModel;->b(Lu5h;)I

    move-result v1

    :goto_4a
    move v11, v1

    goto :goto_4f

    :cond_4c
    const/high16 v1, 0x40000

    goto :goto_4a

    :goto_4f
    if-ltz v11, :cond_e6

    sget-object v1, Lc09;->y:Lx5h;

    const/4 v6, 0x0

    invoke-static {v0, v1, v6}, Lorg/chromium/ui/modelutil/PropertyModel;->f(Lorg/chromium/ui/modelutil/PropertyModel;Lu5h;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Landroid/content/Intent;

    move-object v1, v3

    new-instance v3, Lnzi;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v15, 0x1

    move v8, v6

    move-object v10, v7

    move v12, v6

    move-object v13, v7

    move/from16 v16, v6

    invoke-direct/range {v3 .. v16}, Lnzi;-><init>(IIILandroid/graphics/drawable/Drawable;ILjava/lang/CharSequence;Ljava/lang/Character;IILjava/lang/CharSequence;Landroid/content/Intent;ZZ)V

    iget-boolean v4, v2, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->D:Z

    if-eqz v4, :cond_b8

    iget-object v4, v2, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->J:Lshf;

    if-eqz v4, :cond_b8

    iget-object v5, v2, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->z:Ljava/lang/String;

    iget v6, v2, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->A:I

    iget v7, v3, Lnzi;->f:I

    const v8, 0x1020041

    if-eq v7, v8, :cond_b1

    iget v7, v3, Lnzi;->e:I

    if-eq v7, v8, :cond_b1

    const v8, 0x7f0a0966

    if-ne v7, v8, :cond_89

    const/16 v7, 0xc8

    goto :goto_b3

    :cond_89
    const v8, 0x7f0a0961

    if-ne v7, v8, :cond_91

    const/16 v7, 0x67

    goto :goto_b3

    :cond_91
    const v8, 0x7f0a0960

    if-ne v7, v8, :cond_99

    const/16 v7, 0x65

    goto :goto_b3

    :cond_99
    const v8, 0x1020022

    if-eq v7, v8, :cond_ae

    const v8, 0x1020031

    if-eq v7, v8, :cond_ae

    const v8, 0x7f0a0967

    if-ne v7, v8, :cond_ab

    const/16 v7, 0x68

    goto :goto_b3

    :cond_ab
    const/16 v7, 0x6c

    goto :goto_b3

    :cond_ae
    const/16 v7, 0x66

    goto :goto_b3

    :cond_b1
    const/16 v7, 0x69

    :goto_b3
    iget-object v8, v2, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->L:Lvyi;

    invoke-virtual {v4, v5, v6, v7, v8}, Lshf;->D(Ljava/lang/String;IILvyi;)V

    :cond_b8
    sget-object v4, Lkic;->a:Lx5h;

    invoke-interface {v1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    sget-object v4, Lc09;->u:Lx5h;

    const/4 v13, 0x0

    invoke-static {v0, v4, v13}, Lorg/chromium/ui/modelutil/PropertyModel;->f(Lorg/chromium/ui/modelutil/PropertyModel;Lu5h;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_de

    invoke-interface {v0, v13}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    if-nez v1, :cond_dd

    iget-object v0, v2, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->H:Ld06;

    if-eqz v0, :cond_dd

    iget-object v1, v0, Ld06;->a:Ljava/lang/Object;

    check-cast v1, Landroid/widget/PopupWindow;

    if-eqz v1, :cond_dd

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->dismiss()V

    iput-object v13, v0, Ld06;->a:Ljava/lang/Object;

    :cond_dd
    return-void

    :cond_de
    iget-object v0, v2, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->f:Lve;

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v3, v1}, Lve;->a(Lnzi;Z)Z

    return-void

    :cond_e6
    const-string v0, "Invalid order. Must be >= 0"

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-void
.end method

.method public final f(Lo93;)V
    .registers 2

    iget-object p0, p0, Luk6;->b:Ljava/lang/Object;

    check-cast p0, Lif7;

    invoke-virtual {p0, p1}, Liji;->R(Lo93;)V

    return-void
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    iget-byte v0, p0, Luk6;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object p0, p0, Luk6;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_1a2

    check-cast p0, Ls28;

    check-cast p1, Ljava/io/File;

    iget-object v0, p0, Ls28;->h:Ljava/lang/Object;

    check-cast v0, Lt28;

    iget-object v0, v0, Lt28;->c:Lck3;

    new-instance v1, Lhu5;

    const/16 v2, 0x8

    invoke-direct {v1, p0, p1, v2}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lcn7;

    const/16 v4, 0x10

    invoke-direct {v2, p0, p1, v4}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v0, Lck3;->a:Landroid/content/Context;

    invoke-static {p0}, Lcom/google/android/gms/auth/blockstore/Blockstore;->getClient(Landroid/content/Context;)Lcom/google/android/gms/auth/blockstore/BlockstoreClient;

    move-result-object p0

    new-instance p1, Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;

    invoke-direct {p1}, Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;-><init>()V

    const-string v0, "com.google.android.gms.auth.blockstore.DEFAULT_BYTES_DATA_KEY"

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;->setKeys(Ljava/util/List;)Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest$Builder;->build()Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/google/android/gms/auth/blockstore/BlockstoreClient;->retrieveBytes(Lcom/google/android/gms/auth/blockstore/RetrieveBytesRequest;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    new-instance p1, Lva2;

    invoke-direct {p1, v1, v4}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    new-instance p1, Lva2;

    const/16 v0, 0x11

    invoke-direct {p1, v2, v0}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-object v3

    :sswitch_53
    check-cast p0, La21;

    check-cast p1, Landroid/util/Pair;

    if-eqz p1, :cond_a2

    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object v9, p1

    check-cast v9, [B

    iget-object p1, p0, La21;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->n()Lag7;

    move-result-object v4

    iget-object p1, p0, La21;->f:Ljava/lang/Object;

    move-object v5, p1

    check-cast v5, Landroid/net/Uri;

    iget-object p1, p0, La21;->h:Ljava/lang/Object;

    move-object v6, p1

    check-cast v6, Landroid/net/Uri;

    iget-object p1, p0, La21;->g:Ljava/lang/Object;

    move-object v7, p1

    check-cast v7, Ljava/lang/String;

    iget-object p1, p0, La21;->i:Ljava/lang/Object;

    move-object v8, p1

    check-cast v8, Ljava/lang/String;

    new-instance v12, Liu2;

    const/16 p1, 0x1c

    invoke-direct {v12, p0, p1}, Liu2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual/range {v4 .. v12}, Lag7;->b(Landroid/net/Uri;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;[BJLcom/opera/api/Callback;)V

    iget-object p1, p0, La21;->m:Ljava/lang/Object;

    check-cast p1, Lhu5;

    if-eqz p1, :cond_a5

    iput-object v3, p0, La21;->m:Ljava/lang/Object;

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, p0}, Lhu5;->run(Ljava/lang/Object;)V

    goto :goto_a5

    :cond_a2
    invoke-virtual {p0}, La21;->f()V

    :cond_a5
    :goto_a5
    return-object v3

    :sswitch_a6
    check-cast p0, Lua7;

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move v0, v2

    :cond_af
    :goto_af
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_ce

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    iget-object v5, p0, Lua7;->d:Ljava/lang/Object;

    check-cast v5, Lrf7;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lrf7;->d(J)Lre7;

    move-result-object v4

    if-eqz v4, :cond_af

    invoke-virtual {v4, v2}, Lre7;->z(Z)V

    move v0, v1

    goto :goto_af

    :cond_ce
    invoke-virtual {p0, v0}, Lua7;->q(Z)V

    return-object v3

    :sswitch_d2
    check-cast p0, Ltn;

    check-cast p1, Ljava/lang/Void;

    iget-object p0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast p0, Lt1;

    invoke-virtual {p0}, Lt1;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf3j;

    return-object p0

    :sswitch_e1
    check-cast p0, Lyl6;

    check-cast p1, Ljava/lang/Void;

    iget-object p1, p0, Lyl6;->c:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v4, "has_been_default_browser_previously"

    invoke-interface {v0, v4, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iget-object v4, p0, Lyl6;->a:Landroid/content/Context;

    invoke-static {}, Lsl6;->a()Landroid/content/Intent;

    move-result-object v5

    const/high16 v6, 0x10000

    :try_start_fb
    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    invoke-virtual {v7, v5, v6}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v5
    :try_end_103
    .catch Ljava/lang/NullPointerException; {:try_start_fb .. :try_end_103} :catch_104

    goto :goto_105

    :catch_104
    move-object v5, v3

    :goto_105
    const-string v7, "com.opera.browser.beta"

    if-eqz v5, :cond_119

    iget v8, v5, Landroid/content/pm/ResolveInfo;->match:I

    if-lez v8, :cond_119

    iget-object v5, v5, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v5, v5, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_119

    move v5, v2

    goto :goto_11a

    :cond_119
    move v5, v1

    :goto_11a
    new-instance v8, Landroid/content/Intent;

    const-string v9, "https://www.opera.com/mobile/operabrowser"

    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    const-string v10, "android.intent.action.VIEW"

    invoke-direct {v8, v10, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    :try_start_127
    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v4, v8, v6}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v3
    :try_end_12f
    .catch Ljava/lang/NullPointerException; {:try_start_127 .. :try_end_12f} :catch_12f

    :catch_12f
    if-eqz v3, :cond_140

    iget v4, v3, Landroid/content/pm/ResolveInfo;->match:I

    if-lez v4, :cond_140

    iget-object v3, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_140

    move v1, v2

    :cond_140
    invoke-virtual {p0}, Lyl6;->a()Z

    move-result v2

    const-wide/16 v3, 0x0

    if-nez v2, :cond_14b

    sget-object p0, Lkg0;->f:Lkg0;

    goto :goto_190

    :cond_14b
    if-eqz v5, :cond_15b

    if-eqz v1, :cond_155

    invoke-virtual {p0}, Lyl6;->j()V

    sget-object p0, Lkg0;->e:Lkg0;

    goto :goto_190

    :cond_155
    invoke-virtual {p0}, Lyl6;->j()V

    sget-object p0, Lkg0;->c:Lkg0;

    goto :goto_190

    :cond_15b
    if-eqz v1, :cond_163

    invoke-virtual {p0}, Lyl6;->j()V

    sget-object p0, Lkg0;->d:Lkg0;

    goto :goto_190

    :cond_163
    if-eqz v0, :cond_18e

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    const-string v0, "default_browser_removal_time"

    invoke-interface {p1, v0, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    cmp-long p1, v1, v3

    if-nez p1, :cond_18a

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_18a
    move-wide v3, v1

    sget-object p0, Lkg0;->g:Lkg0;

    goto :goto_190

    :cond_18e
    sget-object p0, Lkg0;->b:Lkg0;

    :goto_190
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object p0

    return-object p0

    :sswitch_199
    check-cast p0, Lf9;

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lf9;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-object v3

    nop

    :sswitch_data_1a2
    .sparse-switch
        0x0 -> :sswitch_199
        0x3 -> :sswitch_e1
        0x4 -> :sswitch_d2
        0xb -> :sswitch_a6
        0xd -> :sswitch_53
    .end sparse-switch
.end method

.method public final h(ILeyl;[I)Lcsh;
    .registers 10

    iget-object p0, p0, Luk6;->b:Ljava/lang/Object;

    move-object v4, p0

    check-cast v4, Lbx6;

    invoke-static {}, Lh1b;->p()Lz0b;

    move-result-object p0

    const/4 v0, 0x0

    move v3, v0

    :goto_b
    iget v0, p2, Leyl;->a:I

    if-ge v3, v0, :cond_1e

    new-instance v0, Lyw6;

    aget v5, p3, v3

    move v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lyw6;-><init>(ILeyl;ILbx6;I)V

    invoke-virtual {p0, v0}, Lv0b;->c(Ljava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    :cond_1e
    invoke-virtual {p0}, Lz0b;->g()Lcsh;

    move-result-object p0

    return-object p0
.end method

.method public final i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V
    .registers 5

    iget-object p0, p0, Luk6;->b:Ljava/lang/Object;

    check-cast p0, Lua7;

    check-cast p1, Lmu7;

    check-cast p2, Lpu7;

    iget-object p2, p2, Lpu7;->b:Lkf;

    iget-object p2, p2, Lkf;->c:Ljava/lang/Object;

    check-cast p2, Lb98;

    iget-object p2, p2, Lb98;->b:Landroid/widget/FrameLayout;

    new-instance v0, Ljf7;

    const/4 v1, 0x5

    invoke-direct {v0, p0, p1, v1}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final invoke(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Luk6;->a:B

    iget-object p0, p0, Luk6;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_46

    check-cast p0, Llxd;

    check-cast p1, Leig;

    invoke-interface {p1, p0}, Leig;->y(Llxd;)V

    return-void

    :sswitch_f
    check-cast p0, Lmi8;

    check-cast p1, Leig;

    iget-object p0, p0, Lmi8;->a:Lqi8;

    iget-object p0, p0, Lqi8;->S:Lvjd;

    invoke-interface {p1, p0}, Leig;->I(Lvjd;)V

    return-void

    :sswitch_1b
    check-cast p0, Ly36;

    check-cast p1, Leig;

    invoke-interface {p1, p0}, Leig;->E(Ly36;)V

    return-void

    :sswitch_23
    check-cast p0, Ltjd;

    check-cast p1, Le11;

    check-cast p1, Ldkd;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-byte p0, p0, Ltjd;->a:B

    iput-byte p0, p1, Ldkd;->w:B

    return-void

    :sswitch_31
    check-cast p0, Lnj6;

    check-cast p1, Le11;

    check-cast p1, Ldkd;

    iget v0, p1, Ldkd;->y:I

    iget v1, p0, Lnj6;->g:I

    add-int/2addr v0, v1

    iput v0, p1, Ldkd;->y:I

    iget v0, p1, Ldkd;->z:I

    iget p0, p0, Lnj6;->e:I

    add-int/2addr v0, p0

    iput v0, p1, Ldkd;->z:I

    return-void

    :sswitch_data_46
    .sparse-switch
        0x1 -> :sswitch_31
        0x2 -> :sswitch_23
        0x1a -> :sswitch_1b
        0x1b -> :sswitch_f
    .end sparse-switch
.end method

.method public final n(Ltw7;)V
    .registers 3

    iget-object p0, p0, Luk6;->b:Ljava/lang/Object;

    check-cast p0, Ls98;

    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_11

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    iget-object p0, p0, Ls98;->a:Lqq8;

    return-void

    :cond_11
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_16

    return-void

    :cond_16
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final onFailure(Ljava/lang/Exception;)V
    .registers 2

    iget-object p0, p0, Luk6;->b:Ljava/lang/Object;

    check-cast p0, Lua7;

    sget-object p1, Lap7;->a:Lap7;

    iput-object p1, p0, Lua7;->c:Ljava/lang/Object;

    iget-object p0, p0, Lua7;->d:Ljava/lang/Object;

    check-cast p0, Lzo7;

    iget-object p0, p0, Lzo7;->a:Lode;

    sget-object p1, Lbp7;->b:Lbp7;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 2

    iget-object p0, p0, Luk6;->b:Ljava/lang/Object;

    check-cast p0, Lyo7;

    invoke-virtual {p0, p1}, Lyo7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
