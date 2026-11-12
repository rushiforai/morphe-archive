.class public final synthetic Lttn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 10
    iput-byte p2, p0, Lttn;->a:B

    iput-object p1, p0, Lttn;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ltyo;Ljava/lang/Object;)V
    .registers 3

    const/16 p1, 0x14

    iput-byte p1, p0, Lttn;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lttn;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Lttn;->a:B

    const/16 v2, 0xa

    const/16 v3, 0xb

    const/4 v4, 0x4

    const-wide/16 v5, 0x7d0

    const/4 v7, 0x2

    const/high16 v8, 0x42c80000    # 100.0f

    const/16 v9, 0x13

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x1

    packed-switch v1, :pswitch_data_608

    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lads_mobile_sdk/yn3;

    invoke-virtual {v0}, Lads_mobile_sdk/yn3;->d()V

    return-void

    :pswitch_1e
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lads_mobile_sdk/wl3;

    invoke-virtual {v0}, Lads_mobile_sdk/wl3;->a()Lef9;

    return-void

    :pswitch_26
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Ljkp;

    invoke-virtual {v0}, Ljkp;->c()V

    return-void

    :pswitch_2e
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-void

    :pswitch_36
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lads_mobile_sdk/mk2;

    iget-object v1, v0, Lads_mobile_sdk/mk2;->a:Lkap;

    invoke-interface {v1}, Lkap;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lads_mobile_sdk/wl3;

    iget-wide v2, v0, Lads_mobile_sdk/mk2;->e:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_57

    iget-object v0, v1, Lads_mobile_sdk/wl3;->e:Lanp;

    new-instance v4, Lttn;

    const/16 v5, 0x1c

    invoke-direct {v4, v1, v5}, Lttn;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v4, v2, v3}, Lanp;->a(Ljava/lang/Runnable;J)V

    goto :goto_5a

    :cond_57
    invoke-virtual {v1}, Lads_mobile_sdk/wl3;->a()Lef9;

    :goto_5a
    return-void

    :pswitch_5b
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lt8p;

    iget-object v1, v0, Lt8p;->w:Landroid/widget/ImageButton;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget-object v2, v0, Laoo;->a:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    invoke-static {v12, v8, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v3

    const/high16 v4, 0x3f000000    # 0.5f

    add-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget-object v1, v0, Lt8p;->w:Landroid/widget/ImageButton;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    const/high16 v3, 0x42960000    # 75.0f

    invoke-static {v12, v3, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    add-float/2addr v2, v4

    float-to-int v2, v2

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object v0, v0, Lt8p;->w:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    return-void

    :pswitch_97
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lqio;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v1, v0, Llio;

    if-eqz v1, :cond_ac

    check-cast v0, Llio;

    iget-object v0, v0, Llio;->a:Ljava/lang/Exception;

    check-cast v0, Lzno;

    iget-object v0, v0, Lzno;->a:Lbm;

    iget-object v0, v0, Lbm;->c:Ljava/lang/String;

    :cond_ac
    return-void

    :pswitch_ad
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lvho;

    :try_start_b1
    iget-object v1, v0, Lvho;->e:Lpqo;

    iget-object v1, v1, Lpqo;->a:Ljava/lang/String;

    invoke-static {v1}, Lvtp;->t(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_113

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_c4

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    :cond_c4
    invoke-static {v1, v0}, Lvtp;->l(Ljava/lang/String;Lvho;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    invoke-static {v3, v11}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lvtp;->l:Ljava/lang/Object;

    monitor-enter v4
    :try_end_dc
    .catch Lorg/json/JSONException; {:try_start_b1 .. :try_end_dc} :catch_113

    :try_start_dc
    invoke-static {v2, v3}, Lmzg;->c(Ljava/io/File;Ljava/lang/String;)Z

    monitor-exit v4
    :try_end_e0
    .catchall {:try_start_dc .. :try_end_e0} :catchall_111

    :try_start_e0
    invoke-virtual {v0}, Lvho;->b()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_105

    invoke-static {v1}, Lvtp;->r(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sget-object v4, Lphf;->a:Lx79;

    iget-object v4, v4, Lx79;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/Context;

    const-string v5, "ad_config"

    invoke-virtual {v4, v5, v11}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4, v3, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_105
    invoke-static {v1}, Lvtp;->k(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-wide v2, v0, Lvho;->d:J

    invoke-static {v1, v2, v3}, Lsjo;->h(Ljava/lang/String;J)V
    :try_end_10e
    .catch Lorg/json/JSONException; {:try_start_e0 .. :try_end_10e} :catch_113

    goto :goto_113

    :goto_10f
    :try_start_10f
    monitor-exit v4
    :try_end_110
    .catchall {:try_start_10f .. :try_end_110} :catchall_111

    :try_start_110
    throw v0
    :try_end_111
    .catch Lorg/json/JSONException; {:try_start_110 .. :try_end_111} :catch_113

    :catchall_111
    move-exception v0

    goto :goto_10f

    :catch_113
    :cond_113
    :goto_113
    return-void

    :pswitch_114
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lf2p;

    invoke-static {v0}, Lf2p;->b(Lf2p;)V

    return-void

    :pswitch_11c
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lmxo;

    invoke-static {}, Lezo;->a()V

    const-string v1, "omsdk_v2.js"

    sget-object v2, Lgxo;->c:Lgxo;

    invoke-static {v7, v1}, Lsjo;->c(ILjava/lang/String;)Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_154

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_136

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_136
    iget-object v2, v0, Lmxo;->a:Ljava/lang/String;

    invoke-static {v1, v2}, Lmzg;->c(Ljava/io/File;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_154

    iget-wide v0, v0, Lmxo;->b:J

    const-string v2, "OmIdJsLibLastModified"

    invoke-static {v2, v0, v1}, Lsjo;->h(Ljava/lang/String;J)V

    sget-object v1, Lezo;->b:Lygo;

    monitor-enter v1

    :try_start_148
    invoke-virtual {v1}, Lygo;->c()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, v1, Li7c;->a:Ljava/lang/Object;

    monitor-exit v1

    goto :goto_154

    :goto_150
    monitor-exit v1
    :try_end_151
    .catchall {:try_start_148 .. :try_end_151} :catchall_152

    throw v0

    :catchall_152
    move-exception v0

    goto :goto_150

    :cond_154
    :goto_154
    return-void

    :pswitch_155
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Ldzo;

    iget-object v1, v0, Ldzo;->c:Lnyo;

    iget-boolean v2, v0, Ldzo;->e:Z

    if-nez v2, :cond_1c4

    iget-boolean v2, v0, Ldzo;->f:Z

    if-nez v2, :cond_1c4

    iget v2, v0, Ldzo;->i:I

    const/4 v3, 0x3

    if-ge v2, v3, :cond_1a7

    sget v2, Lnyo;->f:I

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v7, v1, Lnyo;->d:J

    sub-long/2addr v2, v7

    cmp-long v4, v2, v5

    if-ltz v4, :cond_19b

    invoke-virtual {v1}, Lnyo;->onResume()V

    new-instance v1, Lttn;

    invoke-direct {v1, v0, v9}, Lttn;-><init>(Ljava/lang/Object;B)V

    iget v2, v0, Ldzo;->i:I

    int-to-double v2, v2

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    const-wide v4, 0x409f400000000000L    # 2000.0

    mul-double/2addr v2, v4

    double-to-long v2, v2

    sget-object v4, Lgxo;->d:Landroid/os/Handler;

    invoke-virtual {v4, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    iget v1, v0, Ldzo;->i:I

    add-int/2addr v1, v12

    iput v1, v0, Ldzo;->i:I

    goto :goto_1c4

    :cond_19b
    new-instance v1, Lttn;

    invoke-direct {v1, v0, v9}, Lttn;-><init>(Ljava/lang/Object;B)V

    sub-long/2addr v5, v2

    sget-object v0, Lgxo;->d:Landroid/os/Handler;

    invoke-virtual {v0, v1, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1c4

    :cond_1a7
    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v2

    invoke-virtual {v2, v11}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {v1}, Landroid/webkit/WebView;->stopLoading()V

    iget-object v0, v0, Ldzo;->h:Lz4k;

    if-eqz v0, :cond_1c4

    iget-object v0, v0, Lz4k;->b:Ljava/lang/Object;

    check-cast v0, Llxo;

    sget-object v1, Lbm;->n:Lbm;

    iget-object v0, v0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Ldn;

    if-eqz v0, :cond_1c4

    invoke-interface {v0, v1}, Ldn;->p(Lbm;)V

    :cond_1c4
    :goto_1c4
    return-void

    :pswitch_1c5
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lads_mobile_sdk/ew1;

    monitor-enter v1

    :try_start_1cb
    iget-object v0, v1, Lads_mobile_sdk/ew1;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0
    :try_end_1d1
    .catchall {:try_start_1cb .. :try_end_1d1} :catchall_20a

    if-eqz v0, :cond_1d5

    monitor-exit v1

    goto :goto_209

    :cond_1d5
    :try_start_1d5
    iget-object v0, v1, Lads_mobile_sdk/ew1;->b:Lf43;

    if-eqz v0, :cond_208

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_208

    iget-object v2, v1, Lads_mobile_sdk/ew1;->e:Landroid/view/View;

    if-nez v2, :cond_1f3

    new-instance v2, Landroid/view/View;

    invoke-direct {v2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v0, v3, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iput-object v2, v1, Lads_mobile_sdk/ew1;->e:Landroid/view/View;

    :cond_1f3
    iget-object v0, v1, Lads_mobile_sdk/ew1;->b:Lf43;

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_208

    iget-object v0, v1, Lads_mobile_sdk/ew1;->b:Lf43;

    if-eqz v0, :cond_208

    iget-object v2, v1, Lads_mobile_sdk/ew1;->e:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V
    :try_end_208
    .catchall {:try_start_1d5 .. :try_end_208} :catchall_20a

    :cond_208
    monitor-exit v1

    :goto_209
    return-void

    :catchall_20a
    move-exception v0

    monitor-exit v1

    throw v0

    :pswitch_20d
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lads_mobile_sdk/e32;

    new-instance v1, Leg7;

    invoke-direct {v1, v0, v4}, Leg7;-><init>(Ljava/lang/Object;B)V

    :try_start_216
    iget-object v0, v0, Lads_mobile_sdk/e32;->a:Landroid/content/Context;

    const-string v2, "connectivity"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->registerDefaultNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_226
    .catchall {:try_start_216 .. :try_end_226} :catchall_226

    :catchall_226
    return-void

    :pswitch_227
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lpxo;

    iget-object v1, v0, Lpxo;->h:Lne5;

    if-eqz v1, :cond_232

    invoke-virtual {v1}, Lne5;->o()V

    :cond_232
    iput-object v10, v0, Lpxo;->h:Lne5;

    return-void

    :pswitch_235
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Llxo;

    iget-object v1, v0, Llxo;->s:Ltmo;

    invoke-virtual {v1}, Li7c;->a()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Lnjo;->a:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-nez v1, :cond_287

    iget-object v1, v0, Llxo;->p:Ldcl;

    iget-object v2, v0, Llxo;->s:Ltmo;

    invoke-virtual {v2}, Li7c;->a()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v0, v0, Llxo;->q:Lw6j;

    iget-object v3, v0, Lw6j;->b:Ljava/lang/Object;

    check-cast v3, Lltm;

    iget-object v0, v0, Lw6j;->c:Ljava/lang/Object;

    check-cast v0, Loam;

    iget-object v1, v1, Ldcl;->a:Ljava/lang/Object;

    check-cast v1, Ldzo;

    sget-object v4, Lsjo;->b:Lygo;

    invoke-virtual {v4}, Li7c;->a()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_279

    const-string v4, "function onExportPageLoaded() {    window.location = \'operaadx://FINISHED\';}window.addEventListener(\'load\', function() {    onExportPageLoaded();}, false);"

    invoke-static {v4, v2}, Lvqo;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_279
    invoke-virtual {v1, v2, v3, v0}, Ldzo;->a(Ljava/lang/String;Lltm;Loam;)V

    new-instance v0, Lttn;

    invoke-direct {v0, v1, v9}, Lttn;-><init>(Ljava/lang/Object;B)V

    sget-object v1, Lgxo;->d:Landroid/os/Handler;

    invoke-virtual {v1, v0, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_290

    :cond_287
    iget-object v0, v0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Ldn;

    if-eqz v0, :cond_290

    invoke-interface {v0}, Ldn;->i()V

    :cond_290
    :goto_290
    return-void

    :pswitch_291
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lu71;

    iget-object v0, v0, Lu71;->b:Ljava/lang/Object;

    check-cast v0, Leuo;

    iget-object v1, v0, Leuo;->e:Lqoo;

    if-eqz v1, :cond_325

    :try_start_29d
    iget-object v1, v1, Lqoo;->f:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v1
    :try_end_2a3
    .catch Ljava/lang/IllegalStateException; {:try_start_29d .. :try_end_2a3} :catch_2a4

    goto :goto_2a5

    :catch_2a4
    move v1, v11

    :goto_2a5
    int-to-long v4, v1

    const-wide/16 v6, 0x3e8

    div-long v6, v4, v6

    const-wide/16 v9, 0xf

    cmp-long v1, v6, v9

    if-ltz v1, :cond_2be

    iget-boolean v1, v0, Leuo;->z:Z

    if-nez v1, :cond_2be

    iget-object v1, v0, Leuo;->l:Lwtm;

    const/16 v6, 0xe

    invoke-virtual {v1, v6}, Lwtm;->a(I)V

    iput-boolean v12, v0, Leuo;->z:Z

    goto :goto_2d1

    :cond_2be
    const-wide/16 v9, 0x2

    cmp-long v1, v6, v9

    if-ltz v1, :cond_2d1

    iget-boolean v1, v0, Leuo;->y:Z

    if-nez v1, :cond_2d1

    iget-object v1, v0, Leuo;->l:Lwtm;

    const/16 v6, 0xd

    invoke-virtual {v1, v6}, Lwtm;->a(I)V

    iput-boolean v12, v0, Leuo;->y:Z

    :cond_2d1
    :goto_2d1
    iget-object v1, v0, Leuo;->e:Lqoo;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_2d6
    iget-object v1, v1, Lqoo;->f:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v11
    :try_end_2dc
    .catch Ljava/lang/IllegalStateException; {:try_start_2d6 .. :try_end_2dc} :catch_2dc

    :catch_2dc
    int-to-long v6, v11

    long-to-float v1, v4

    mul-float/2addr v1, v8

    long-to-float v4, v6

    div-float/2addr v1, v4

    float-to-int v1, v1

    const/16 v4, 0x61

    if-lt v1, v4, :cond_2f4

    iget-boolean v4, v0, Leuo;->x:Z

    if-nez v4, :cond_2f4

    iget-object v1, v0, Leuo;->l:Lwtm;

    const/16 v2, 0xf

    invoke-virtual {v1, v2}, Lwtm;->a(I)V

    iput-boolean v12, v0, Leuo;->x:Z

    goto :goto_325

    :cond_2f4
    const/16 v4, 0x4b

    if-lt v1, v4, :cond_304

    iget-boolean v4, v0, Leuo;->w:Z

    if-nez v4, :cond_304

    iget-object v1, v0, Leuo;->l:Lwtm;

    invoke-virtual {v1, v3}, Lwtm;->a(I)V

    iput-boolean v12, v0, Leuo;->w:Z

    goto :goto_325

    :cond_304
    const/16 v3, 0x32

    if-lt v1, v3, :cond_314

    iget-boolean v3, v0, Leuo;->v:Z

    if-nez v3, :cond_314

    iget-object v1, v0, Leuo;->l:Lwtm;

    invoke-virtual {v1, v2}, Lwtm;->a(I)V

    iput-boolean v12, v0, Leuo;->v:Z

    goto :goto_325

    :cond_314
    const/16 v2, 0x19

    if-lt v1, v2, :cond_325

    iget-boolean v1, v0, Leuo;->u:Z

    if-nez v1, :cond_325

    iget-object v1, v0, Leuo;->l:Lwtm;

    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Lwtm;->a(I)V

    iput-boolean v12, v0, Leuo;->u:Z

    :cond_325
    :goto_325
    return-void

    :pswitch_326
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Liro;

    sget-object v1, Loji;->c:Loji;

    if-nez v1, :cond_340

    new-instance v1, Loji;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v2, v1, Loji;->a:Ljava/lang/Object;

    sput-object v1, Loji;->c:Loji;

    :cond_340
    iget-object v2, v0, Liro;->a:Ljava/lang/String;

    invoke-static {v2}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_363

    :try_start_348
    iget-object v3, v0, Liro;->b:Lrii;

    iget-object v3, v3, Lrii;->b:Ljava/lang/Object;

    check-cast v3, Lyhp;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iput-wide v4, v3, Lyhp;->b:J

    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Loji;->m(Ljava/net/URLConnection;Liro;)V
    :try_end_363
    .catchall {:try_start_348 .. :try_end_363} :catchall_363

    :catchall_363
    :cond_363
    return-void

    :pswitch_364
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Ljro;

    new-instance v2, Lhoo;

    iget-object v5, v1, Ljro;->d:Lmjo;

    invoke-direct {v2, v5}, Lhoo;-><init>(Lmjo;)V

    iget-object v6, v2, Lhoo;->c:Landroid/os/Handler;

    iget-object v0, v2, Lhoo;->b:Lssi;

    invoke-virtual {v6, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const-wide/32 v8, 0x493e0

    invoke-virtual {v6, v0, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_37d
    invoke-interface {v5}, Lmjo;->a()Lkro;

    move-result-object v0

    const/16 v8, 0x12d

    const/16 v9, 0x12e

    :try_start_385
    new-instance v13, Ljava/net/URL;

    iget-object v14, v1, Ljro;->b:Ljava/lang/String;

    invoke-direct {v13, v14}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v13
    :try_end_390
    .catch Ljava/lang/Exception; {:try_start_385 .. :try_end_390} :catch_41f
    .catchall {:try_start_385 .. :try_end_390} :catchall_41b

    :try_start_390
    invoke-static {v13, v1}, Lljo;->a(Ljava/net/URLConnection;Ljro;)V

    move-object v14, v13

    check-cast v14, Ljava/net/HttpURLConnection;

    invoke-virtual {v14}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v14

    invoke-interface {v0, v14}, Lkro;->a(I)Z

    move-result v15

    if-eqz v15, :cond_3c5

    invoke-interface {v0}, Lkro;->a()Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_3ad

    invoke-virtual {v13, v14}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v0, v14}, Lkro;->a(Ljava/lang/String;)V

    :cond_3ad
    invoke-virtual {v13}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v14
    :try_end_3b1
    .catch Ljava/lang/Exception; {:try_start_390 .. :try_end_3b1} :catch_419
    .catchall {:try_start_390 .. :try_end_3b1} :catchall_417

    :try_start_3b1
    invoke-interface {v0, v14}, Lkro;->b(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    new-instance v15, Lmio;

    invoke-direct {v15, v0}, Lmio;-><init>(Ljava/lang/Object;)V
    :try_end_3ba
    .catch Ljava/lang/Exception; {:try_start_3b1 .. :try_end_3ba} :catch_3c2
    .catchall {:try_start_3b1 .. :try_end_3ba} :catchall_53b

    :goto_3ba
    invoke-static {v13}, Lhn9;->f(Ljava/net/URLConnection;)V

    :cond_3bd
    invoke-static {v14}, Lr9h;->l(Ljava/io/Closeable;)V

    goto/16 :goto_437

    :catch_3c2
    move-exception v0

    goto/16 :goto_422

    :cond_3c5
    if-eq v14, v9, :cond_3cb

    if-eq v14, v8, :cond_3cb

    move v0, v11

    goto :goto_3cc

    :cond_3cb
    move v0, v12

    :goto_3cc
    if-eqz v0, :cond_3e4

    :try_start_3ce
    const-string v0, "Location"

    invoke-virtual {v13, v0}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v15, Lfoo;

    invoke-direct {v15, v14, v0}, Lfoo;-><init>(ILjava/lang/String;)V

    new-instance v0, Llio;

    invoke-direct {v0, v15}, Llio;-><init>(Ljava/lang/Exception;)V
    :try_end_3de
    .catch Ljava/lang/Exception; {:try_start_3ce .. :try_end_3de} :catch_419
    .catchall {:try_start_3ce .. :try_end_3de} :catchall_417

    invoke-static {v13}, Lhn9;->f(Ljava/net/URLConnection;)V

    :goto_3e1
    move-object v15, v0

    goto/16 :goto_437

    :cond_3e4
    :try_start_3e4
    move-object v0, v13

    check-cast v0, Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v15
    :try_end_3eb
    .catch Ljava/lang/Exception; {:try_start_3e4 .. :try_end_3eb} :catch_419
    .catchall {:try_start_3e4 .. :try_end_3eb} :catchall_417

    if-nez v15, :cond_3f0

    :try_start_3ed
    const-string v0, "Unknown error."

    goto :goto_3f4

    :cond_3f0
    invoke-static {v15}, Ldyg;->c(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    :goto_3f4
    new-instance v11, Lfoo;

    invoke-direct {v11, v14, v0}, Lfoo;-><init>(ILjava/lang/String;)V

    new-instance v0, Llio;

    invoke-direct {v0, v11}, Llio;-><init>(Ljava/lang/Exception;)V
    :try_end_3fe
    .catch Ljava/lang/Exception; {:try_start_3ed .. :try_end_3fe} :catch_40f
    .catchall {:try_start_3ed .. :try_end_3fe} :catchall_40d

    if-eqz v13, :cond_403

    invoke-static {v13}, Lhn9;->f(Ljava/net/URLConnection;)V

    :cond_403
    invoke-static {v15}, Lr9h;->l(Ljava/io/Closeable;)V

    goto :goto_3e1

    :goto_407
    move-object v10, v13

    move-object v14, v15

    goto/16 :goto_53e

    :goto_40b
    move-object v14, v15

    goto :goto_422

    :catchall_40d
    move-exception v0

    goto :goto_407

    :catch_40f
    move-exception v0

    goto :goto_40b

    :goto_411
    move-object v14, v10

    :goto_412
    move-object v10, v13

    goto/16 :goto_53e

    :goto_415
    move-object v14, v10

    goto :goto_422

    :catchall_417
    move-exception v0

    goto :goto_411

    :catch_419
    move-exception v0

    goto :goto_415

    :catchall_41b
    move-exception v0

    move-object v14, v10

    goto/16 :goto_53e

    :catch_41f
    move-exception v0

    move-object v13, v10

    move-object v14, v13

    :goto_422
    :try_start_422
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    new-instance v11, Lumo;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    const/4 v15, -0x2

    invoke-direct {v11, v15, v0}, Lfoo;-><init>(ILjava/lang/String;)V

    new-instance v15, Llio;

    invoke-direct {v15, v11}, Llio;-><init>(Ljava/lang/Exception;)V
    :try_end_434
    .catchall {:try_start_422 .. :try_end_434} :catchall_53b

    if-eqz v13, :cond_3bd

    goto :goto_3ba

    :goto_437
    iget-object v0, v2, Lhoo;->e:Lfr;

    instance-of v11, v15, Llio;

    iget v13, v1, Ljro;->h:I

    if-nez v11, :cond_47a

    if-ne v13, v7, :cond_51c

    sget v0, Lg1p;->a:I

    iget-boolean v0, v1, Ljro;->j:Z

    if-eqz v0, :cond_51c

    invoke-static {}, Lc0p;->values()[Lc0p;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_453
    :goto_453
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_51c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lc0p;

    iget-object v5, v1, Ljro;->b:Ljava/lang/String;

    iget-object v7, v4, Lc0p;->b:Ljava/lang/String;

    invoke-static {v7}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-static {v5, v7}, Lw8h;->d(Ljava/lang/String;Ljava/util/List;)Z

    move-result v5

    if-eqz v5, :cond_453

    iget-object v4, v4, Lc0p;->a:Ljava/lang/String;

    sget-object v5, Lg1p;->l:Ljava/lang/String;

    invoke-static {v5, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_453

    sput-object v4, Lg1p;->l:Ljava/lang/String;

    goto :goto_453

    :cond_47a
    iget-object v14, v1, Ljro;->g:Lfr;

    if-ne v13, v7, :cond_4e9

    sget v13, Lg1p;->a:I

    iget v13, v1, Ljro;->i:I

    add-int/2addr v13, v12

    iput v13, v1, Ljro;->i:I

    if-lt v13, v7, :cond_4e9

    invoke-static {}, Lc0p;->values()[Lc0p;

    move-result-object v13

    invoke-static {v13}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_493
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_4d6

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v7, v16

    check-cast v7, Lc0p;

    move/from16 v16, v12

    iget-object v12, v1, Ljro;->b:Ljava/lang/String;

    iget-object v10, v7, Lc0p;->b:Ljava/lang/String;

    invoke-static {v10}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    invoke-static {v12, v10}, Lw8h;->d(Ljava/lang/String;Ljava/util/List;)Z

    move-result v10

    if-eqz v10, :cond_4d3

    sget-object v10, Lg1p;->n:Ljava/util/HashMap;

    invoke-virtual {v10}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_4bb
    :goto_4bb
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_4d3

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/Map$Entry;

    invoke-interface {v12}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    if-ne v7, v3, :cond_4bb

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v12, v3}, Ljava/util/Map$Entry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4bb

    :cond_4d3
    move/from16 v12, v16

    goto :goto_493

    :cond_4d6
    move/from16 v16, v12

    invoke-static {}, Lc0p;->values()[Lc0p;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    new-instance v7, Ldgo;

    invoke-direct {v7, v1, v4}, Ldgo;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3, v7}, Lm5h;->c(Ljava/util/Collection;Lv2p;)V

    goto :goto_4eb

    :cond_4e9
    move/from16 v16, v12

    :goto_4eb
    if-eqz v11, :cond_4f3

    move-object v3, v15

    check-cast v3, Llio;

    iget-object v3, v3, Llio;->a:Ljava/lang/Exception;

    goto :goto_4f4

    :cond_4f3
    const/4 v3, 0x0

    :goto_4f4
    check-cast v3, Lfoo;

    if-eqz v3, :cond_518

    iget v7, v3, Lfoo;->a:I

    if-eq v7, v9, :cond_4fe

    if-ne v7, v8, :cond_518

    :cond_4fe
    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_518

    iget v7, v0, Lfr;->c:I

    if-lez v7, :cond_518

    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    iget v7, v0, Lfr;->c:I

    add-int/lit8 v7, v7, -0x1

    iput v7, v0, Lfr;->c:I

    iput-object v3, v1, Ljro;->b:Ljava/lang/String;

    goto :goto_534

    :cond_518
    iget v3, v14, Lfr;->c:I

    if-gtz v3, :cond_527

    :cond_51c
    new-instance v0, Lfmn;

    const/16 v3, 0xb

    invoke-direct {v0, v2, v15, v3}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v6, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_527
    invoke-static {v14}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    iget v7, v14, Lfr;->c:I

    add-int/lit8 v7, v7, -0x1

    iput v7, v14, Lfr;->c:I

    iget v7, v0, Lfr;->b:I

    iput v7, v0, Lfr;->c:I

    :goto_534
    move/from16 v12, v16

    const/4 v7, 0x2

    const/4 v10, 0x0

    const/4 v11, 0x0

    goto/16 :goto_37d

    :catchall_53b
    move-exception v0

    goto/16 :goto_412

    :goto_53e
    if-eqz v10, :cond_543

    invoke-static {v10}, Lhn9;->f(Ljava/net/URLConnection;)V

    :cond_543
    invoke-static {v14}, Lr9h;->l(Ljava/io/Closeable;)V

    throw v0

    :pswitch_547
    move/from16 v16, v12

    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lbx7;

    iget-object v1, v0, Lbx7;->c:Ljava/lang/Object;

    check-cast v1, Lfr;

    iget v2, v1, Lfr;->c:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v1, Lfr;->c:I

    invoke-virtual {v0}, Lbx7;->c()V

    return-void

    :pswitch_55b
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lu71;

    iget-object v0, v0, Lu71;->b:Ljava/lang/Object;

    check-cast v0, Ld7h;

    iget-object v0, v0, Ld7h;->c:Ljava/lang/Object;

    check-cast v0, Ldgo;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ldgo;->l(Ljava/lang/Object;)V

    return-void

    :pswitch_56c
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Livo;

    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v1, Lvjo;

    const/16 v2, 0x67

    const-string v3, "Can\'t load ad due to unsuccessful initialization."

    invoke-direct {v1, v2, v3}, Lvjo;-><init>(ILjava/lang/String;)V

    new-instance v2, Lq0i;

    invoke-direct {v2, v1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance v1, Lt0i;

    invoke-direct {v1, v2}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Livo;->invoke(Ljava/lang/Object;)V

    return-void

    :pswitch_589
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lwci;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_591
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Laco;

    invoke-virtual {v0}, Laco;->n()V

    return-void

    :pswitch_599
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lt9l;

    iget-object v1, v0, Lt9l;->d:Ljava/lang/Object;

    check-cast v1, Lydi;

    new-instance v2, Lr2n;

    const/16 v3, 0x18

    invoke-direct {v2, v0, v3}, Lr2n;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lydi;->o(Lyyk;)Ljava/lang/Object;

    return-void

    :pswitch_5ac
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lo4o;

    iget-object v1, v0, Lo4o;->a:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    iget-object v0, v0, Lo4o;->b:Lcom/google/android/gms/tasks/TaskCompletionSource;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->trySetResult(Ljava/lang/Object;)Z

    return-void

    :pswitch_5bc
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Ljvg;

    monitor-enter v1

    :try_start_5c2
    iget-object v0, v1, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Landroid/net/wifi/WifiManager$WifiLock;

    if-eqz v0, :cond_5cb

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->release()V
    :try_end_5cb
    .catchall {:try_start_5c2 .. :try_end_5cb} :catchall_5cf

    :cond_5cb
    monitor-exit v1

    return-void

    :goto_5cd
    :try_start_5cd
    monitor-exit v1
    :try_end_5ce
    .catchall {:try_start_5cd .. :try_end_5ce} :catchall_5cf

    throw v0

    :catchall_5cf
    move-exception v0

    goto :goto_5cd

    :pswitch_5d1
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/startup/WelcomeActivity;

    sget v1, Lcom/opera/android/startup/WelcomeActivity;->w:I

    invoke-virtual {v0}, Lcom/opera/android/startup/WelcomeActivity;->W()V

    return-void

    :pswitch_5db
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/webkit/WebViewCompat$WebViewStartUpCallback;

    sget-object v1, Landroidx/webkit/WebViewCompat;->a:Landroid/net/Uri;

    new-instance v1, Lcpj;

    invoke-direct {v1, v2}, Lcpj;-><init>(B)V

    invoke-interface {v0, v1}, Landroidx/webkit/WebViewCompat$WebViewStartUpCallback;->onSuccess(Landroidx/webkit/WebViewStartUpResult;)V

    return-void

    :pswitch_5ea
    move/from16 v16, v12

    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/b;

    iget-boolean v1, v0, Lcom/opera/android/browser/b;->d:Z

    if-nez v1, :cond_5ff

    if-nez v1, :cond_5ff

    move/from16 v1, v16

    iput-boolean v1, v0, Lcom/opera/android/browser/b;->d:Z

    iget-object v0, v0, Lcom/opera/android/browser/b;->b:Lzun;

    invoke-interface {v0, v1}, Lzun;->f(Z)V

    :cond_5ff
    return-void

    :pswitch_600
    iget-object v0, v0, Lttn;->b:Ljava/lang/Object;

    check-cast v0, Lztn;

    invoke-virtual {v0}, Lztn;->M()V

    return-void

    :pswitch_data_608
    .packed-switch 0x0
        :pswitch_600
        :pswitch_5ea
        :pswitch_5db
        :pswitch_5d1
        :pswitch_5bc
        :pswitch_5ac
        :pswitch_599
        :pswitch_591
        :pswitch_589
        :pswitch_56c
        :pswitch_55b
        :pswitch_547
        :pswitch_364
        :pswitch_326
        :pswitch_291
        :pswitch_235
        :pswitch_227
        :pswitch_20d
        :pswitch_1c5
        :pswitch_155
        :pswitch_11c
        :pswitch_114
        :pswitch_ad
        :pswitch_97
        :pswitch_5b
        :pswitch_36
        :pswitch_2e
        :pswitch_26
        :pswitch_1e
    .end packed-switch
.end method
