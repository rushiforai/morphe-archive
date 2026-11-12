.class public final synthetic Lxa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lxa;->a:B

    iput-object p1, p0, Lxa;->b:Ljava/lang/Object;

    iput-object p2, p0, Lxa;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 10

    iget-byte v0, p0, Lxa;->a:B

    const/16 v1, 0x10

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_394

    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lay1;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lay1;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_16
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Ls9i;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Landroid/media/AudioDeviceInfo;

    iget-object v1, v0, Ls9i;->e:Ljava/lang/Object;

    check-cast v1, Lqh2;

    if-eqz v1, :cond_4b

    iget-object v0, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lu59;

    iget-object v0, v0, Lu59;->b:Ljava/lang/Object;

    check-cast v0, Luh2;

    iget-object v0, v0, Luh2;->h:Lxf2;

    if-eqz v0, :cond_4b

    iget-object v1, v0, Lxf2;->i:Ljava/lang/Object;

    check-cast v1, Landroid/media/AudioDeviceInfo;

    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4b

    iput-object p0, v0, Lxf2;->i:Ljava/lang/Object;

    iget-object v1, v0, Lxf2;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object v2, v0, Lxf2;->j:Ljava/lang/Object;

    check-cast v2, Lpf2;

    invoke-static {v1, v2, p0}, Luf2;->b(Landroid/content/Context;Lpf2;Landroid/media/AudioDeviceInfo;)Luf2;

    move-result-object p0

    invoke-virtual {v0, p0}, Lxf2;->a(Luf2;)V

    :cond_4b
    return-void

    :pswitch_4c
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Ls9i;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Landroid/media/AudioRouting;

    invoke-interface {p0}, Landroid/media/AudioRouting;->getRoutedDevice()Landroid/media/AudioDeviceInfo;

    move-result-object p0

    if-eqz p0, :cond_68

    iget-object v1, v0, Ls9i;->d:Ljava/lang/Object;

    check-cast v1, Landroid/os/Handler;

    new-instance v2, Lxa;

    const/16 v3, 0x1c

    invoke-direct {v2, v0, p0, v3}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_68
    return-void

    :pswitch_69
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lpad;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lh75;

    iget-object v0, v0, Lpad;->c:Ljava/lang/Object;

    check-cast v0, Lmi8;

    sget-object v1, Ltym;->a:Ljava/lang/String;

    iget-object v0, v0, Lmi8;->a:Lqi8;

    iget-object v0, v0, Lqi8;->G:Lz8b;

    invoke-virtual {v0, p0}, Lz8b;->H(Lh75;)V

    return-void

    :pswitch_7f
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lpad;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lnj6;

    monitor-enter p0

    monitor-exit p0

    iget-object p0, v0, Lpad;->c:Ljava/lang/Object;

    check-cast p0, Lmi8;

    sget-object v0, Ltym;->a:Ljava/lang/String;

    iget-object p0, p0, Lmi8;->a:Lqi8;

    iget-object p0, p0, Lqi8;->t:Lel6;

    iget-object v0, p0, Lel6;->d:Ligi;

    iget-object v0, v0, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Ljrd;

    invoke-virtual {p0, v0}, Lel6;->R(Ljrd;)Ld11;

    move-result-object v0

    new-instance v1, Lzk6;

    const/16 v2, 0x17

    invoke-direct {v1, v2}, Lzk6;-><init>(B)V

    const/16 v2, 0x3f5

    invoke-virtual {p0, v0, v2, v1}, Lel6;->V(Ld11;ILfjc;)V

    return-void

    :pswitch_aa
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lrj5;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    sput-object v0, Lscd;->c:Landroid/media/AudioManager;

    invoke-virtual {p0}, Lrj5;->c()Z

    return-void

    :pswitch_c0
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lgg2;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lei7;

    invoke-virtual {v0, p0}, Lhi7;->a(Lei7;)V

    return-void

    :pswitch_cc
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lte2;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lzr9;

    iget-object v1, v0, Lte2;->c:Lmgd;

    invoke-interface {v1}, Lmgd;->i()V

    iget-object v0, v0, Lte2;->b:Lxe2;

    iget-object v1, v0, Lxe2;->a:Ljava/lang/Object;

    monitor-enter v1

    :try_start_de
    invoke-virtual {v0}, Lxe2;->b()V

    invoke-virtual {p0}, Lzr9;->run()V

    monitor-exit v1

    return-void

    :goto_e6
    monitor-exit v1
    :try_end_e7
    .catchall {:try_start_de .. :try_end_e7} :catchall_e8

    throw p0

    :catchall_e8
    move-exception p0

    goto :goto_e6

    :pswitch_ea
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lfe2;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    iget-object v1, v0, Lfe2;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_fc

    invoke-virtual {v0, p0}, Lfe2;->f(Ljava/lang/Object;)V

    goto :goto_ff

    :cond_fc
    invoke-virtual {v0, p0}, Lfe2;->g(Ljava/lang/Object;)V

    :goto_ff
    iput-byte v3, v0, Lfe2;->b:B

    return-void

    :pswitch_102
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Ls62;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lqdc;

    iput-object v2, v0, Ls62;->A:Lr62;

    new-instance v0, Lq02;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lq02;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :pswitch_117
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lf12;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lra;

    invoke-virtual {v0, p0}, Lf12;->c(Lra;)V

    return-void

    :pswitch_123
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lnw1;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lpw1;

    iget-object v1, v0, Lnw1;->c:Lxnh;

    invoke-virtual {v1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwnh;

    const/high16 v3, 0x40000

    invoke-virtual {v1, v3}, Lwnh;->b(I)Z

    move-result v1

    if-eqz v1, :cond_1bd

    :try_start_13b
    iget-object p0, p0, Lpw1;->a:Ljava/util/Map;

    if-eqz p0, :cond_1bd

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v3

    invoke-static {v3}, Lqbd;->a(I)I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_156
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_179

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_174

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_175

    :cond_174
    move-object v3, v2

    :goto_175
    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_156

    :cond_179
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_186
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1ad

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;
    :try_end_19e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_13b .. :try_end_19e} :catch_1b9

    :try_start_19e
    invoke-static {v2}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1a5
    .catch Lorg/json/JSONException; {:try_start_19e .. :try_end_1a5} :catch_1a6
    .catch Ljava/lang/IllegalArgumentException; {:try_start_19e .. :try_end_1a5} :catch_1b9

    goto :goto_186

    :catch_1a6
    move-exception p0

    :try_start_1a7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :cond_1ad
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1bd

    iget-object v0, v0, Lnw1;->b:Lx5f;

    invoke-virtual {v0, p0}, Lx5f;->v0(Ljava/lang/String;)V
    :try_end_1b8
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1a7 .. :try_end_1b8} :catch_1b9

    goto :goto_1bd

    :catch_1b9
    move-exception p0

    invoke-static {p0}, Lks3;->D(Ljava/lang/Throwable;)V

    :cond_1bd
    :goto_1bd
    return-void

    :pswitch_1be
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lop1;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Runnable;

    :try_start_1c6
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V
    :try_end_1c9
    .catchall {:try_start_1c6 .. :try_end_1c9} :catchall_1cd

    invoke-virtual {v0}, Lop1;->a()V

    return-void

    :catchall_1cd
    move-exception p0

    invoke-virtual {v0}, Lop1;->a()V

    throw p0

    :pswitch_1d2
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lygf;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lygf;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_1de
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lrn9;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Ltya;

    invoke-interface {p0, v0}, Ltya;->o(Luya;)V

    return-void

    :pswitch_1ea
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lb2n;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lda1;

    :try_start_1f2
    invoke-virtual {v0, p0}, Lb2n;->onRequestFinished(Lorg/chromium/net/RequestFinishedInfo;)V
    :try_end_1f5
    .catch Ljava/lang/Exception; {:try_start_1f2 .. :try_end_1f5} :catch_1f5

    :catch_1f5
    return-void

    :pswitch_1f6
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Ln61;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lqkh;

    new-instance v2, Lr61;

    invoke-direct {v2, v1}, Luik;-><init>(I)V

    iput-object p0, v2, Lr61;->b:Lqkh;

    :try_start_205
    iget-object p0, v0, Ln61;->b:Lorg/chromium/mojo/system/impl/CoreImpl;

    new-instance v1, Llvd;

    iget-wide v3, v0, Ln61;->d:J

    const/4 v5, 0x1

    const/4 v6, 0x6

    invoke-direct {v1, v5, v6, v3, v4}, Llvd;-><init>(IIJ)V

    invoke-virtual {v2, p0, v1}, Luik;->b(Lorg/chromium/mojo/system/impl/CoreImpl;Llvd;)Lh3j;

    move-result-object p0

    iget-object v0, v0, Ln61;->c:Lmwd;

    invoke-interface {v0, p0}, Lmwd;->S0(Levd;)Z
    :try_end_219
    .catch Le13; {:try_start_205 .. :try_end_219} :catch_21a

    goto :goto_21e

    :catch_21a
    move-exception p0

    invoke-static {p0}, Lh9o;->o(Ljava/lang/Throwable;)V

    :goto_21e
    return-void

    :pswitch_21f
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Ln61;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    new-instance v2, Lm61;

    invoke-direct {v2, v1}, Luik;-><init>(I)V

    iput-object p0, v2, Lm61;->b:Ljava/util/HashMap;

    :try_start_22e
    iget-object p0, v0, Ln61;->b:Lorg/chromium/mojo/system/impl/CoreImpl;

    new-instance v1, Llvd;

    iget-wide v4, v0, Ln61;->d:J

    invoke-direct {v1, v3, v3, v4, v5}, Llvd;-><init>(IIJ)V

    invoke-virtual {v2, p0, v1}, Luik;->b(Lorg/chromium/mojo/system/impl/CoreImpl;Llvd;)Lh3j;

    move-result-object p0

    iget-object v0, v0, Ln61;->c:Lmwd;

    invoke-interface {v0, p0}, Lmwd;->S0(Levd;)Z
    :try_end_240
    .catch Le13; {:try_start_22e .. :try_end_240} :catch_241

    goto :goto_245

    :catch_241
    move-exception p0

    invoke-static {p0}, Lh9o;->o(Ljava/lang/Throwable;)V

    :goto_245
    return-void

    :pswitch_246
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lo41;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Landroid/util/LongSparseArray;

    invoke-static {v0, p0}, Lm41;->e(Lo41;Landroid/util/LongSparseArray;)V

    return-void

    :pswitch_252
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Ljy0;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lgy0;

    invoke-virtual {p0}, Lgy0;->b()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Long;

    move-result-object p0

    invoke-static {p0}, Lj95;->j([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljy0;->L(Ljava/util/List;)V

    return-void

    :pswitch_26e
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Le50;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lh1b;

    invoke-virtual {v0, p0}, Le50;->j(Lh1b;)V

    return-void

    :pswitch_27a
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lv00;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lorb;

    iget-object v0, v0, Lv00;->b:Lru9;

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    const-string v2, "ad.adx.last_cookie"

    invoke-interface {v1, v2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    return-void

    :pswitch_29b
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Le00;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    invoke-virtual {v0}, Le00;->b()Lc00;

    move-result-object v0

    iget-object v0, v0, Lc00;->a:Ljava/lang/String;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_2ad
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Li5o;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lab;

    iget-object v1, v0, Li5o;->k:Ljava/lang/Object;

    check-cast v1, Lnz;

    iget-object v1, v1, Lnz;->l:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2cc

    iget-object v0, v0, Li5o;->g:Ljava/lang/Object;

    check-cast v0, Lvx;

    invoke-virtual {v0}, Lvx;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/lang/String;

    :cond_2cc
    invoke-virtual {p0, v1}, Lab;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_2d0
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Ldr;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lsjm;

    iput-object p0, v0, Ldr;->c:Lsjm;

    return-void

    :pswitch_2db
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lrn;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lln;

    invoke-virtual {v0, p0}, Lk43;->d(Laqi;)V

    return-void

    :pswitch_2e7
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lsl;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    iget-object v1, v0, Lsl;->d:Lwy;

    new-instance v2, Lnl;

    invoke-direct {v2, v0, v4}, Lnl;-><init>(Lsl;B)V

    invoke-virtual {v1, p0, v2}, Lwy;->S(Landroid/content/Context;Lcom/opera/api/Callback;)V

    return-void

    :pswitch_2fa
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Lwk;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/GraphView;

    iget-object v1, v0, Lwk;->y:Lxi5;

    iget-object v1, v1, Lxi5;->e:Lqy4;

    invoke-virtual {v1}, Lqy4;->b()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    const/high16 v5, 0x41c00000    # 24.0f

    invoke-static {v5, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    div-int/2addr v3, v2

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v3

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    :goto_322
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_33f

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lri5;

    iget-wide v5, v5, Lri5;->d:J

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-eqz v5, :cond_33c

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    goto :goto_33f

    :cond_33c
    add-int/lit8 v2, v2, 0x1

    goto :goto_322

    :cond_33f
    :goto_33f
    const/4 v2, 0x3

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    new-instance v3, Lvk;

    invoke-direct {v3, v0, v1}, Lvk;-><init>(Lwk;Ljava/util/ArrayList;)V

    new-instance v0, Lt59;

    invoke-direct {v0, v3, v2}, Lt59;-><init>(Lp3a;I)V

    invoke-virtual {v0, p0}, Lt59;->d(Lcom/opera/android/widget/GraphView;)V

    return-void

    :pswitch_356
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Laj;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lcj;

    iget-boolean v1, p0, Lcj;->b:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-boolean v2, p0, Lcj;->c:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, p0, v1, v2}, Laj;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_36e
    iget-object v0, p0, Lxa;->b:Ljava/lang/Object;

    check-cast v0, Li42;

    iget-object p0, p0, Lxa;->c:Ljava/lang/Object;

    check-cast p0, Lehf;

    iget-byte v1, v0, Li42;->g:B

    packed-switch v1, :pswitch_data_3d2

    iget-object v0, v0, Li42;->h:Ljava/lang/Object;

    check-cast v0, Lza;

    invoke-virtual {v0, p0}, Lza;->run(Ljava/lang/Object;)V

    goto :goto_393

    :pswitch_383
    iget-object v0, v0, Li42;->h:Ljava/lang/Object;

    check-cast v0, Lk42;

    iput-boolean v4, v0, Lk42;->f:Z

    iget-object v0, v0, Lk42;->d:Lh42;

    new-instance v1, Lt0i;

    invoke-direct {v1, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    :goto_393
    return-void

    :pswitch_data_394
    .packed-switch 0x0
        :pswitch_36e
        :pswitch_356
        :pswitch_2fa
        :pswitch_2e7
        :pswitch_2db
        :pswitch_2d0
        :pswitch_2ad
        :pswitch_29b
        :pswitch_27a
        :pswitch_26e
        :pswitch_252
        :pswitch_246
        :pswitch_21f
        :pswitch_1f6
        :pswitch_1ea
        :pswitch_1de
        :pswitch_1d2
        :pswitch_1be
        :pswitch_123
        :pswitch_117
        :pswitch_102
        :pswitch_ea
        :pswitch_cc
        :pswitch_c0
        :pswitch_aa
        :pswitch_7f
        :pswitch_69
        :pswitch_4c
        :pswitch_16
    .end packed-switch

    :pswitch_data_3d2
    .packed-switch 0x0
        :pswitch_383
    .end packed-switch
.end method
