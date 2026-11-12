.class public final synthetic Lh4m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 15
    iput-byte p4, p0, Lh4m;->a:B

    iput-object p1, p0, Lh4m;->b:Ljava/lang/Object;

    iput-object p2, p0, Lh4m;->c:Ljava/lang/Object;

    iput-object p3, p0, Lh4m;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ls14;Lilm;Ljava/util/ArrayList;)V
    .registers 5

    .line 14
    const/4 v0, 0x7

    iput-byte v0, p0, Lh4m;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh4m;->b:Ljava/lang/Object;

    iput-object p2, p0, Lh4m;->d:Ljava/lang/Object;

    iput-object p3, p0, Lh4m;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lyoo;Landroid/content/Context;Li06;Lvm;)V
    .registers 5

    const/16 p3, 0xc

    iput-byte p3, p0, Lh4m;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh4m;->b:Ljava/lang/Object;

    iput-object p2, p0, Lh4m;->c:Ljava/lang/Object;

    iput-object p4, p0, Lh4m;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 11

    iget-byte v0, p0, Lh4m;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_46c

    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lypi;

    iget-object v0, p0, Lh4m;->c:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ljava/util/ArrayList;

    iget-object p0, p0, Lh4m;->d:Ljava/lang/Object;

    move-object v4, p0

    check-cast v4, Lr2p;

    :try_start_18
    sget-object p0, Lt0i;->b:Lp0i;

    sget-object p0, Lw2p;->a:La64;

    iget-object p0, p0, La64;->b:Lkotlin/coroutines/CoroutineContext;

    sget-object v0, Lulp;->h:Lulp;

    invoke-interface {p0, v0}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/g;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object p0
    :try_end_24
    .catchall {:try_start_18 .. :try_end_24} :catchall_41

    const-string v1, "Required value was null."

    if-eqz p0, :cond_3b

    :try_start_28
    sget-object p0, Lw2p;->b:La64;

    iget-object p0, p0, La64;->b:Lkotlin/coroutines/CoroutineContext;

    invoke-interface {p0, v0}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/g;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object p0

    if-eqz p0, :cond_35

    check-cast p0, Lunb;

    goto :goto_43

    :cond_35
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3b
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_41
    .catchall {:try_start_28 .. :try_end_41} :catchall_41

    :catchall_41
    sget-object p0, Lt0i;->b:Lp0i;

    :goto_43
    sget-object p0, Lw2p;->a:La64;

    new-instance v1, Lk54;

    const/16 v6, 0xd

    const/4 v7, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v1 .. v7}, Lk54;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;BZ)V

    const/4 v0, 0x3

    invoke-static {p0, v5, v5, v1, v0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void

    :pswitch_53
    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    check-cast v0, Lads_mobile_sdk/k43;

    iget-object v1, p0, Lh4m;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    iget-object p0, p0, Lh4m;->d:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    iget-object v2, v0, Lads_mobile_sdk/k43;->f:Lads_mobile_sdk/ia3;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iget-object v2, v2, Lads_mobile_sdk/ia3;->a:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_6f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lopo;

    invoke-interface {v4, v3}, Lopo;->a(Ljava/util/HashMap;)V

    goto :goto_6f

    :cond_7f
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    invoke-virtual {v0, v1}, Lads_mobile_sdk/k43;->a(Ljava/util/HashMap;)V

    const-string v0, "f"

    const-string v2, "q"

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "ctx"

    invoke-virtual {v1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_92
    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    check-cast v0, Lqio;

    iget-object v1, p0, Lh4m;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, Lh4m;->d:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v2, v0, Llio;

    if-nez v2, :cond_d9

    move-object v3, v0

    check-cast v3, Lmio;

    iget-object v3, v3, Lmio;->a:Ljava/lang/Object;

    check-cast v3, Lvho;

    if-eqz v3, :cond_d9

    iget-object v3, v3, Lvho;->e:Lpqo;

    iget-object v3, v3, Lpqo;->a:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d9

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    invoke-static {}, Lsjo;->n()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {v1}, Lvtp;->r(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {}, Lsjo;->n()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {v1}, Lvtp;->k(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_d9
    if-eqz v2, :cond_e5

    check-cast v0, Llio;

    iget-object p0, v0, Llio;->a:Ljava/lang/Exception;

    check-cast p0, Lzno;

    iget-object p0, p0, Lzno;->a:Lbm;

    iget-object p0, p0, Lbm;->c:Ljava/lang/String;

    :cond_e5
    return-void

    :pswitch_e6
    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lh4m;->c:Ljava/lang/Object;

    check-cast v1, Lh9o;

    iget-object p0, p0, Lh4m;->d:Ljava/lang/Object;

    check-cast p0, Lg94;

    :try_start_f2
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/net/HttpURLConnection;
    :try_end_fe
    .catch Ljava/lang/Exception; {:try_start_f2 .. :try_end_fe} :catch_137
    .catchall {:try_start_f2 .. :try_end_fe} :catchall_142

    :try_start_fe
    const-string v0, "HEAD"

    invoke-virtual {v2, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    iget-byte v0, v1, Lh9o;->a:B

    packed-switch v0, :pswitch_data_490

    move-object v0, v2

    check-cast v0, Ljava/net/URLConnection;

    invoke-virtual {v0}, Ljava/net/URLConnection;->getLastModified()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_11f

    :pswitch_114
    move-object v0, v2

    check-cast v0, Ljava/net/URLConnection;

    invoke-virtual {v0}, Ljava/net/URLConnection;->getContentLengthLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    :goto_11f
    new-instance v1, Lfmn;

    const/16 v3, 0x11

    invoke-direct {v1, p0, v0, v3}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1}, Lgxo;->c(Ljava/lang/Runnable;)V
    :try_end_129
    .catch Ljava/lang/Exception; {:try_start_fe .. :try_end_129} :catch_134
    .catchall {:try_start_fe .. :try_end_129} :catchall_131

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_141

    :goto_12d
    move-object v3, v2

    goto :goto_144

    :goto_12f
    move-object v3, v2

    goto :goto_139

    :catchall_131
    move-exception v0

    move-object p0, v0

    goto :goto_12d

    :catch_134
    move-exception v0

    move-object p0, v0

    goto :goto_12f

    :catch_137
    move-exception v0

    move-object p0, v0

    :goto_139
    :try_start_139
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
    :try_end_13c
    .catchall {:try_start_139 .. :try_end_13c} :catchall_142

    if-eqz v3, :cond_141

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_141
    :goto_141
    return-void

    :catchall_142
    move-exception v0

    move-object p0, v0

    :goto_144
    if-eqz v3, :cond_149

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_149
    throw p0

    :pswitch_14a
    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    check-cast v0, Lyoo;

    iget-object v1, p0, Lh4m;->c:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object p0, p0, Lh4m;->d:Ljava/lang/Object;

    check-cast p0, Lvm;

    instance-of v5, p0, Lidf;

    if-eqz v5, :cond_163

    new-instance v5, Ltro;

    move-object v6, p0

    check-cast v6, Lidf;

    invoke-direct {v5, p0, v6}, Ltro;-><init>(Lvm;Lidf;)V

    goto :goto_168

    :cond_163
    new-instance v5, Lwoo;

    invoke-direct {v5, p0}, Lwoo;-><init>(Lvm;)V

    :goto_168
    iget-object p0, v0, Lpxo;->b:Lr22;

    iget-object p0, p0, Lr22;->a:Ljava/lang/Object;

    check-cast p0, Lpro;

    iget-object p0, p0, Lpro;->b:Lsm;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, v0, Lpxo;->d:Lvoo;

    iget-object v6, v0, Lpxo;->i:Lp7p;

    if-eqz p0, :cond_181

    if-eqz v6, :cond_181

    new-instance v7, Lkotlin/Pair;

    invoke-direct {v7, p0, v6}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_182

    :cond_181
    move-object v7, v3

    :goto_182
    if-eqz v7, :cond_21f

    iget-object p0, v7, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast p0, Lylp;

    iget-object v6, v7, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v6, Lp7p;

    sget-boolean v7, Lfko;->c:Z

    if-nez v7, :cond_1a5

    sget-object p0, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/16 p0, 0x3f0

    invoke-virtual {v6, p0, v3}, Lp7p;->g(ILjava/lang/String;)V

    new-instance p0, Lcm;

    const/16 v0, 0x66

    const-string v1, "App Not foreground."

    invoke-direct {p0, v0, v1, v4}, Lcm;-><init>(ILjava/lang/String;B)V

    :goto_1a0
    invoke-virtual {v5, p0}, Lwoo;->C(Lcm;)V

    goto/16 :goto_237

    :cond_1a5
    invoke-static {p0}, Locp;->d(Lvoo;)Luro;

    move-result-object v7

    new-instance v8, Lmmo;

    invoke-direct {v8, v0, v2}, Lmmo;-><init>(Lyoo;B)V

    iput-object p0, v7, Luro;->a:Lylp;

    iput-object v6, v7, Luro;->b:Lp7p;

    iput-object v5, v7, Luro;->c:Lwoo;

    iput-object v8, v7, Luro;->d:Lmmo;

    new-instance v7, Landroid/content/Intent;

    invoke-direct {v7}, Landroid/content/Intent;-><init>()V

    const-string v8, "android.intent.action.VIEW"

    invoke-virtual {v7, v8}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    instance-of v8, v1, Landroid/app/Activity;

    if-nez v8, :cond_1c9

    const/high16 v8, 0x10000000

    invoke-virtual {v7, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :cond_1c9
    iget-object v8, p0, Lvoo;->b:Lpro;

    iget-object v8, v8, Lpro;->b:Lsm;

    const-string v9, "extra_ad_format"

    invoke-virtual {v7, v9, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    iget-object v8, p0, Lylp;->E:Leio;

    if-eqz v8, :cond_1e2

    iget v8, v8, Leio;->a:I

    if-eqz v8, :cond_1dd

    if-ne v8, v2, :cond_1dd

    move v2, v4

    :cond_1dd
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_1e3

    :cond_1e2
    move-object v2, v3

    :goto_1e3
    const-string v8, "extra_orientation"

    invoke-virtual {v7, v8, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-class v2, Lcom/opera/ads/internal/fullscreenad/AdActivity;

    invoke-virtual {v7, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    :try_start_1ed
    invoke-virtual {v1, v7}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1f0
    .catch Ljava/lang/Exception; {:try_start_1ed .. :try_end_1f0} :catch_1f6

    invoke-virtual {v6}, Lp7p;->f()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_220

    :catch_1f6
    move-exception v0

    invoke-static {p0}, Locp;->d(Lvoo;)Luro;

    move-result-object p0

    iput-object v3, p0, Luro;->a:Lylp;

    iput-object v3, p0, Luro;->b:Lp7p;

    iput-object v3, p0, Luro;->c:Lwoo;

    iput-object v3, p0, Luro;->d:Lmmo;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0x3f1

    invoke-virtual {v6, v1, p0}, Lp7p;->g(ILjava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lcm;

    if-nez p0, :cond_216

    const-string p0, "Failed to start activity."

    :cond_216
    const/16 v1, 0x68

    invoke-direct {v0, v1, p0, v4}, Lcm;-><init>(ILjava/lang/String;B)V

    invoke-virtual {v5, v0}, Lwoo;->C(Lcm;)V

    goto :goto_237

    :cond_21f
    move-object p0, v3

    :goto_220
    if-nez p0, :cond_237

    iget-object p0, v0, Lpxo;->i:Lp7p;

    if-eqz p0, :cond_22d

    sget-object v0, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/16 v0, 0x2394

    invoke-virtual {p0, v0, v3}, Lp7p;->g(ILjava/lang/String;)V

    :cond_22d
    new-instance p0, Lcm;

    const/4 v0, -0x1

    const-string v1, "Unknown error!"

    invoke-direct {p0, v0, v1, v4}, Lcm;-><init>(ILjava/lang/String;B)V

    goto/16 :goto_1a0

    :cond_237
    :goto_237
    return-void

    :pswitch_238
    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v1, p0, Lh4m;->c:Ljava/lang/Object;

    check-cast v1, Ll94;

    iget-object p0, p0, Lh4m;->d:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_257

    :try_start_24a
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v1, p0}, Ll94;->b(Ljava/lang/Object;)Z
    :try_end_251
    .catchall {:try_start_24a .. :try_end_251} :catchall_252

    goto :goto_257

    :catchall_252
    move-exception v0

    move-object p0, v0

    invoke-virtual {v1, p0}, Ll94;->d(Ljava/lang/Throwable;)Z

    :cond_257
    :goto_257
    return-void

    :pswitch_258
    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    check-cast v0, Lwzg;

    iget-object v1, p0, Lh4m;->c:Ljava/lang/Object;

    check-cast v1, Lw8k;

    iget-object p0, p0, Lh4m;->d:Ljava/lang/Object;

    check-cast p0, Ld7h;

    iget-object v0, v0, Lwzg;->b:Ljava/lang/Object;

    check-cast v0, Lt1h;

    invoke-virtual {v0, v1, p0}, Lt1h;->f(Lw8k;Ld7h;)Z

    return-void

    :pswitch_26c
    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/webkit/WebViewStartUpConfig;

    iget-object v2, p0, Lh4m;->c:Ljava/lang/Object;

    check-cast v2, Landroidx/webkit/WebViewCompat$WebViewStartUpCallback;

    iget-object p0, p0, Lh4m;->d:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    sget-object v3, Landroidx/webkit/WebViewCompat;->a:Landroid/net/Uri;

    invoke-static {}, Landroid/webkit/WebView;->getWebViewClassLoader()Ljava/lang/ClassLoader;

    sget-object v3, Laxn;->t:Lli1;

    invoke-virtual {v3}, Lli1;->a()Z

    move-result v3

    if-eqz v3, :cond_292

    sget-object p0, Ldxn;->a:Ldyn;

    new-instance v1, Lr2n;

    const/16 v3, 0x13

    invoke-direct {v1, v2, v3}, Lr2n;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p0, v0, v1}, Ldyn;->a(Landroidx/webkit/WebViewStartUpConfig;Lr2n;)V

    goto :goto_2b0

    :cond_292
    invoke-virtual {v0}, Landroidx/webkit/WebViewStartUpConfig;->shouldRunUiThreadStartUpTasks()Z

    move-result v0

    if-eqz v0, :cond_29f

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/webkit/WebSettings;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    :cond_29f
    new-instance p0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v0, Lttn;

    invoke-direct {v0, v2, v1}, Lttn;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_2b0
    return-void

    :pswitch_2b1
    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    check-cast v0, Lqln;

    iget-object v1, p0, Lh4m;->c:Ljava/lang/Object;

    check-cast v1, Lorm;

    iget-object p0, p0, Lh4m;->d:Ljava/lang/Object;

    check-cast p0, Leej;

    iget-object v2, v0, Lqln;->f:Lami;

    iget-object v3, v2, Lami;->e:Ljava/lang/Object;

    check-cast v3, Lvq8;

    invoke-virtual {v3}, Lvq8;->i()Z

    move-result v3

    if-eqz v3, :cond_302

    sget-object v3, Lzg;->e:Log5;

    if-nez v3, :cond_302

    iget-object v3, v2, Lami;->e:Ljava/lang/Object;

    check-cast v3, Lvq8;

    invoke-virtual {v3}, Lvq8;->i()Z

    move-result v3

    if-nez v3, :cond_2e2

    new-instance v3, Lh4m;

    const/16 v4, 0x8

    invoke-direct {v3, v0, v1, p0, v4}, Lh4m;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Lami;->r(Ljava/lang/Runnable;)V

    goto :goto_302

    :cond_2e2
    new-instance v1, Lurj;

    const/16 v2, 0x9

    invoke-direct {v1, v2}, Lurj;-><init>(B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lzg;

    invoke-direct {v2, v0}, Lzg;-><init>(Lqln;)V

    new-instance v0, Log5;

    invoke-direct {v0, v2, v1}, Log5;-><init>(Lzg;Lurj;)V

    iget-object p0, p0, Leej;->a:Lnej;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, v1}, Lr22;->b(Ljjm;Lijm;)V

    sput-object v0, Lzg;->e:Log5;

    :cond_302
    :goto_302
    return-void

    :pswitch_303
    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    check-cast v0, Ls14;

    iget-object v1, p0, Lh4m;->d:Ljava/lang/Object;

    check-cast v1, Lilm;

    iget-object p0, p0, Lh4m;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    iget-object v2, v0, Ls14;->d:Ljava/lang/Object;

    check-cast v2, Lumi;

    new-instance v4, Lvdi;

    invoke-direct {v4, v0, v1, p0}, Lvdi;-><init>(Ls14;Lilm;Ljava/util/ArrayList;)V

    invoke-virtual {v2, v4}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v3}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :pswitch_320
    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    check-cast v0, Lvq8;

    iget-object v1, p0, Lh4m;->c:Ljava/lang/Object;

    check-cast v1, Llt2;

    iget-object p0, p0, Lh4m;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    iget-boolean v2, v0, Lvq8;->a:Z

    if-eqz v2, :cond_334

    invoke-virtual {v1, v3}, Llt2;->run(Ljava/lang/Object;)V

    goto :goto_337

    :cond_334
    invoke-virtual {v0, p0, v1}, Lvq8;->k(Ljava/lang/String;Llt2;)V

    :goto_337
    return-void

    :pswitch_338
    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v1, p0, Lh4m;->c:Ljava/lang/Object;

    check-cast v1, Lq3j;

    iget-object p0, p0, Lh4m;->d:Ljava/lang/Object;

    check-cast p0, Lt2n;

    invoke-static {}, Lxug;->n()Z

    move-result v3

    const-string v4, "Surface update cancellation should only occur on main thread."

    invoke-static {v4, v3}, Ljpo;->n(Ljava/lang/String;Z)V

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, v1, Lp3j;->b:Lpyl;

    iget-object v0, v0, Lpyl;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, v1, Lp3j;->e:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void

    :pswitch_35f
    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lc5j;

    iget-object v0, p0, Lh4m;->c:Ljava/lang/Object;

    check-cast v0, Lzr9;

    iget-object p0, p0, Lh4m;->d:Ljava/lang/Object;

    check-cast p0, Le4j;

    :try_start_36c
    invoke-virtual {v1}, Lm4;->isCancelled()Z

    move-result v2

    if-nez v2, :cond_37e

    invoke-virtual {v0}, Lzr9;->run()V

    invoke-virtual {v1, p0}, Lm4;->set(Ljava/lang/Object;)Z
    :try_end_378
    .catchall {:try_start_36c .. :try_end_378} :catchall_379

    goto :goto_37e

    :catchall_379
    move-exception v0

    move-object p0, v0

    invoke-virtual {v1, p0}, Lm4;->setException(Ljava/lang/Throwable;)Z

    :cond_37e
    :goto_37e
    return-void

    :pswitch_37f
    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    check-cast v0, Lcom/google/common/util/concurrent/ListenableFuture;

    iget-object v1, p0, Lh4m;->c:Ljava/lang/Object;

    check-cast v1, Lc5j;

    iget-object p0, p0, Lh4m;->d:Ljava/lang/Object;

    check-cast p0, Ldd2;

    :try_start_38b
    invoke-static {v0}, Lyr9;->a(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object v0
    :try_end_38f
    .catch Ljava/util/concurrent/CancellationException; {:try_start_38b .. :try_end_38f} :catch_3b0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_38b .. :try_end_38f} :catch_3a3
    .catch Ljava/lang/RuntimeException; {:try_start_38b .. :try_end_38f} :catch_39d
    .catch Ljava/lang/Error; {:try_start_38b .. :try_end_38f} :catch_39d

    :try_start_38f
    invoke-interface {p0, v0}, Ldd2;->apply(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p0

    invoke-virtual {v1, p0}, Lm4;->setFuture(Lcom/google/common/util/concurrent/ListenableFuture;)Z
    :try_end_396
    .catchall {:try_start_38f .. :try_end_396} :catchall_397

    goto :goto_3b3

    :catchall_397
    move-exception v0

    move-object p0, v0

    invoke-virtual {v1, p0}, Lm4;->setException(Ljava/lang/Throwable;)Z

    goto :goto_3b3

    :catch_39d
    move-exception v0

    move-object p0, v0

    invoke-virtual {v1, p0}, Lm4;->setException(Ljava/lang/Throwable;)Z

    goto :goto_3b3

    :catch_3a3
    move-exception v0

    move-object p0, v0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_3ac

    move-object p0, v0

    :cond_3ac
    invoke-virtual {v1, p0}, Lm4;->setException(Ljava/lang/Throwable;)Z

    goto :goto_3b3

    :catch_3b0
    invoke-virtual {v1, v4}, Lm4;->cancel(Z)Z

    :goto_3b3
    return-void

    :pswitch_3b4
    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    check-cast v0, Lpmm;

    iget-object v1, p0, Lh4m;->c:Ljava/lang/Object;

    check-cast v1, Lodf;

    iget-object p0, p0, Lh4m;->d:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p0, Llyg;

    iget-object v0, p0, Llyg;->a:Lorg/chromium/ui/base/WindowAndroid;

    iget-object v0, v0, Lorg/chromium/ui/base/WindowAndroid;->t:Lh7f;

    invoke-virtual {v0, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Llyg;->e()V

    return-void

    :pswitch_3d1
    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    check-cast v0, Lr4m;

    iget-object v5, p0, Lh4m;->c:Ljava/lang/Object;

    check-cast v5, Lyqa;

    iget-object p0, p0, Lh4m;->d:Ljava/lang/Object;

    check-cast p0, Lb2l;

    iget-object v6, v0, Lr4m;->c:Lb0c;

    if-eqz v5, :cond_3e5

    iget-object v3, v5, Lyqa;->c:Ljava/lang/Object;

    check-cast v3, Lszb;

    :cond_3e5
    invoke-virtual {v6, v3, v2}, Lb0c;->H0(Lszb;Z)V

    iget-byte v3, v0, Lr4m;->k:B

    if-ne v3, v2, :cond_419

    iget-object v2, v0, Lr4m;->g:Lv3m;

    iget-object v3, v2, Lv3m;->a:Landroid/content/Context;

    invoke-static {v3}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_40a

    iget-byte v3, v6, Lb0c;->d:B

    if-ne v3, v1, :cond_419

    invoke-virtual {v2}, Lv3m;->g()Z

    move-result v1

    if-eqz v1, :cond_419

    iget-object v1, v2, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "translate_web_pages_backup_translation_method_enabled"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_419

    :cond_40a
    new-instance p0, Lo4m;

    const/4 v1, 0x5

    invoke-direct {p0, v0, v1}, Lo4m;-><init>(Lr4m;B)V

    invoke-virtual {v0, p0}, Lr4m;->c0(Ljava/lang/Runnable;)V

    iput-byte v4, v0, Lr4m;->k:B

    invoke-virtual {v0}, Lr4m;->a0()V

    goto :goto_440

    :cond_419
    iget-object v1, v0, Lr4m;->d:Lh5m;

    iget-object v1, v1, Lh5m;->h:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ld5m;

    invoke-virtual {v1}, Ld5m;->b()Z

    move-result v1

    if-nez v1, :cond_436

    iget-byte v1, v0, Lr4m;->k:B

    invoke-virtual {v0, p0, v1}, Lr4m;->X(Lb2l;I)Z

    move-result v1

    if-nez v1, :cond_436

    iget-object v1, v0, Lr4m;->e:Ltjm;

    invoke-virtual {v1, v4}, Ltjm;->J0(Z)V

    :cond_436
    iget-byte v1, v0, Lr4m;->k:B

    invoke-virtual {v0, p0, v1}, Lr4m;->Z(Lb2l;I)V

    iput-byte v4, v0, Lr4m;->k:B

    invoke-virtual {v0}, Lr4m;->a0()V

    :goto_440
    return-void

    :pswitch_441
    iget-object v0, p0, Lh4m;->b:Ljava/lang/Object;

    check-cast v0, Lxl;

    iget-object v1, p0, Lh4m;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object p0, p0, Lh4m;->d:Ljava/lang/Object;

    check-cast p0, Ld4m;

    new-instance v2, Lg4m;

    iget-object v3, v0, Lxl;->k:Ljava/lang/Object;

    check-cast v3, Lg4m;

    iget-object v3, v3, Lg4m;->b:Ljava/util/List;

    invoke-direct {v2, v1, v3}, Lg4m;-><init>(Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {v0, v2}, Lldk;->g(Ljava/lang/Object;)V

    new-instance v2, Lg4m;

    iget-object v3, v0, Lxl;->k:Ljava/lang/Object;

    check-cast v3, Lg4m;

    iget-object v3, v3, Lg4m;->b:Ljava/util/List;

    invoke-direct {v2, v1, v3}, Lg4m;-><init>(Ljava/util/List;Ljava/util/List;)V

    iput-object v2, v0, Lxl;->k:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Ld4m;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_data_46c
    .packed-switch 0x0
        :pswitch_441
        :pswitch_3d1
        :pswitch_3b4
        :pswitch_37f
        :pswitch_35f
        :pswitch_338
        :pswitch_320
        :pswitch_303
        :pswitch_2b1
        :pswitch_26c
        :pswitch_258
        :pswitch_238
        :pswitch_14a
        :pswitch_e6
        :pswitch_92
        :pswitch_53
    .end packed-switch

    :pswitch_data_490
    .packed-switch 0x16
        :pswitch_114
    .end packed-switch
.end method
