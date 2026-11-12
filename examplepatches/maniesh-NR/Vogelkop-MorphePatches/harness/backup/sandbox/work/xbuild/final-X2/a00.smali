.class public final synthetic La00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbg1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, La00;->a:B

    iput-object p1, p0, La00;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 10

    iget-byte v0, p0, La00;->a:B

    const/16 v1, 0xa

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object p0, p0, La00;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_144

    check-cast p0, Lonn;

    check-cast p1, Landroid/content/SharedPreferences;

    iget-object p1, p0, Lonn;->e:Lx5f;

    iget-object p0, p0, Lonn;->a:Lni6;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lni6;->a(J)I

    move-result p0

    int-to-long v0, p0

    iget-object p0, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-virtual {v2, p0}, Lx56;->N(Lzpa;)Lzs0;

    move-result-object p0

    const/4 v4, 0x3

    invoke-virtual {p0, v4, v3, v0, v1}, Ljf0;->p(IIJ)V

    invoke-virtual {p1, v2}, Lx5f;->U0(Lx56;)V

    return-void

    :pswitch_2e
    check-cast p0, Liu2;

    invoke-static {}, Lvml;->b()Z

    move-result v0

    if-eqz v0, :cond_3a

    invoke-virtual {p0, p1}, Liu2;->run(Ljava/lang/Object;)V

    goto :goto_44

    :cond_3a
    new-instance v0, Ljri;

    const/16 v1, 0x1a

    invoke-direct {v0, p0, p1, v1}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    :goto_44
    return-void

    :pswitch_45
    check-cast p0, Lta7;

    check-cast p1, Landroid/content/SharedPreferences;

    iget-object p0, p0, Lta7;->l:Ljava/lang/Object;

    check-cast p0, Lnrl;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lmni;

    invoke-direct {p1, p0, v1}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :pswitch_59
    check-cast p0, Ljlf;

    check-cast p1, Landroid/content/SharedPreferences;

    iget-object v0, p0, Ljlf;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_60
    invoke-interface {p1}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6c
    :goto_6c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_92

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "failure_"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6c

    invoke-interface {p1, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    if-eqz v3, :cond_6c

    new-instance v3, Lvdf;

    const/4 v4, 0x7

    invoke-direct {v3, p0, v4}, Lvdf;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v4, 0x7530

    invoke-static {v3, v4, v5}, Lvml;->d(Ljava/lang/Runnable;J)V

    goto :goto_6c

    :cond_92
    monitor-exit v0

    return-void

    :goto_94
    monitor-exit v0
    :try_end_95
    .catchall {:try_start_60 .. :try_end_95} :catchall_96

    throw p0

    :catchall_96
    move-exception p0

    goto :goto_94

    :pswitch_98
    check-cast p0, Lbpd;

    check-cast p1, Landroid/content/SharedPreferences;

    iget-object p0, p0, Lbpd;->c:Ljava/lang/Object;

    check-cast p0, Lnrl;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lmni;

    invoke-direct {p1, p0, v1}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :pswitch_ac
    check-cast p0, Liyc;

    check-cast p1, Landroid/content/SharedPreferences;

    const-string v0, "ignored"

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    new-instance p1, Lhyc;

    invoke-direct {p1, p0, v2}, Lhyc;-><init>(Liyc;B)V

    invoke-static {p1}, Lvml;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_be
    check-cast p0, Lh0a;

    check-cast p1, Lize;

    iget-object p1, p0, Lh0a;->b:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lize;

    new-instance v0, Lg0a;

    invoke-direct {v0, p0, v3}, Lg0a;-><init>(Lh0a;B)V

    new-instance p0, Lug;

    const/16 v1, 0x17

    invoke-direct {p0, v0, v1}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void

    :pswitch_da
    check-cast p0, Lzv9;

    check-cast p1, Landroid/content/SharedPreferences;

    iget-object v0, p0, Lzv9;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_e1
    iget-object v1, p0, Lzv9;->d:Lyv9;

    iget-wide v4, v1, Lyv9;->c:J

    const-wide/16 v6, 0x0

    cmp-long v1, v4, v6

    if-lez v1, :cond_ec

    move v2, v3

    :cond_ec
    if-nez v2, :cond_10b

    const-string v1, "sysutil.location"

    const-string v2, ""

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object v1, Lyv9;->d:Lyv9;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2
    :try_end_fc
    .catchall {:try_start_e1 .. :try_end_fc} :catchall_10f

    if-nez v2, :cond_109

    :try_start_fe
    new-instance v2, Lyv9;

    new-instance v3, Lorb;

    invoke-direct {v3, p1}, Lorb;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Lyv9;-><init>(Lorb;)V
    :try_end_108
    .catch Lorg/json/JSONException; {:try_start_fe .. :try_end_108} :catch_109
    .catchall {:try_start_fe .. :try_end_108} :catchall_10f

    move-object v1, v2

    :catch_109
    :cond_109
    :try_start_109
    iput-object v1, p0, Lzv9;->d:Lyv9;

    :cond_10b
    monitor-exit v0

    return-void

    :goto_10d
    monitor-exit v0
    :try_end_10e
    .catchall {:try_start_109 .. :try_end_10e} :catchall_10f

    throw p0

    :catchall_10f
    move-exception p0

    goto :goto_10d

    :pswitch_111
    check-cast p0, Lorg/chromium/base/CommandLine;

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_11c

    const-string v0, "force-device-scale-factor"

    invoke-virtual {p0, v0, p1}, Lorg/chromium/base/CommandLine;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_11c
    return-void

    :pswitch_11d
    check-cast p0, Lev4;

    check-cast p1, Lag7;

    iget-object v0, p0, Lev4;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v1, "ctrl_onInit"

    invoke-static {v0, v1}, Lcom/opera/android/downloads/DownloadService;->e(Landroid/content/Context;Ljava/lang/String;)V

    new-instance v0, Lbl6;

    const/16 v1, 0x19

    invoke-direct {v0, p0, v1}, Lbl6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lag7;->a(Ljava/lang/Runnable;)V

    return-void

    :pswitch_135
    check-cast p0, Le00;

    check-cast p1, Landroid/content/SharedPreferences;

    iget-object p0, p0, Le00;->d:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Lc00;

    invoke-direct {v0, p1}, Lc00;-><init>(Landroid/content/SharedPreferences;)V

    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-void

    :pswitch_data_144
    .packed-switch 0x0
        :pswitch_135
        :pswitch_11d
        :pswitch_111
        :pswitch_da
        :pswitch_be
        :pswitch_ac
        :pswitch_98
        :pswitch_59
        :pswitch_45
        :pswitch_2e
    .end packed-switch
.end method
