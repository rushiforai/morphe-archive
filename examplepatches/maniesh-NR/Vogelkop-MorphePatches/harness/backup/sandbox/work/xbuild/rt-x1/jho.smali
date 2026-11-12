.class public final Ljho;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Landroid/content/Context;

.field public w:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lmt5;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Ljho;->t:B

    .line 12
    iput-object p1, p0, Ljho;->v:Landroid/content/Context;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ZLmt5;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Ljho;->t:B

    iput-object p1, p0, Ljho;->v:Landroid/content/Context;

    iput-boolean p2, p0, Ljho;->w:Z

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte v0, p0, Ljho;->t:B

    packed-switch v0, :pswitch_data_1c

    new-instance v0, Ljho;

    iget-object v1, p0, Ljho;->v:Landroid/content/Context;

    iget-boolean p0, p0, Ljho;->w:Z

    invoke-direct {v0, v1, p0, p2}, Ljho;-><init>(Landroid/content/Context;ZLmt5;)V

    iput-object p1, v0, Ljho;->u:Ljava/lang/Object;

    return-object v0

    :pswitch_11
    new-instance v0, Ljho;

    iget-object p0, p0, Ljho;->v:Landroid/content/Context;

    invoke-direct {v0, p0, p2}, Ljho;-><init>(Landroid/content/Context;Lmt5;)V

    iput-object p1, v0, Ljho;->u:Ljava/lang/Object;

    return-object v0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ljho;->t:B

    packed-switch v0, :pswitch_data_28

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Ljho;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Ljho;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Ljho;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Ljho;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Ljho;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Ljho;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Ljho;->t:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_17c

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Ljho;->u:Ljava/lang/Object;

    check-cast p1, Lnx5;

    iget-object p1, p0, Ljho;->v:Landroid/content/Context;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :try_start_1d
    sget-object v4, Lt0i;->b:Lp0i;

    invoke-static {p1}, Landroidx/webkit/WebViewCompat;->getCurrentWebViewPackage(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object p1
    :try_end_23
    .catchall {:try_start_1d .. :try_end_23} :catchall_24

    goto :goto_2d

    :catchall_24
    move-exception p1

    sget-object v4, Lt0i;->b:Lp0i;

    new-instance v4, Lq0i;

    invoke-direct {v4, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p1, v4

    :goto_2d
    instance-of v4, p1, Lq0i;

    if-eqz v4, :cond_32

    move-object p1, v3

    :cond_32
    check-cast p1, Landroid/content/pm/PackageInfo;

    if-eqz p1, :cond_53

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "|"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x3a

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p1, p1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-boolean v0, p0, Ljho;->w:Z

    const-string v4, "opera.ads.sdk.default_user_agent"

    const-string v5, "opera.ads.sdk.sys_fp4_default_user_agent"

    if-nez v0, :cond_95

    iget-object v0, p0, Ljho;->v:Landroid/content/Context;

    sget-object v6, Lr8p;->a:Ljava/util/List;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Llah;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_95

    iget-object v0, p0, Ljho;->v:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, v5, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_95

    iget-object p0, p0, Ljho;->v:Landroid/content/Context;

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0, v4, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Llah;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v2}, Llah;->f(Ljava/lang/String;Z)V

    :cond_92
    :goto_92
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_cf

    :cond_95
    iget-object v0, p0, Ljho;->v:Landroid/content/Context;

    :try_start_97
    invoke-static {v0}, Landroid/webkit/WebSettings;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0
    :try_end_9b
    .catchall {:try_start_97 .. :try_end_9b} :catchall_9c

    goto :goto_a5

    :catchall_9c
    move-exception v0

    sget-object v2, Lt0i;->b:Lp0i;

    new-instance v2, Lq0i;

    invoke-direct {v2, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v2

    :goto_a5
    instance-of v2, v0, Lq0i;

    if-nez v2, :cond_aa

    move-object v3, v0

    :cond_aa
    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_92

    invoke-static {v3}, Llah;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_92

    iget-object p0, p0, Ljho;->v:Landroid/content/Context;

    sput-object v0, Llah;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Llah;->f(Ljava/lang/String;Z)V

    sget-object v1, Lr8p;->a:Ljava/util/List;

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v4, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0, v5, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_92

    :goto_cf
    return-object p0

    :pswitch_d0
    iget-object v0, p0, Ljho;->v:Landroid/content/Context;

    sget-object v4, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Ljho;->w:Z

    if-eqz v5, :cond_e6

    if-ne v5, v1, :cond_df

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_178

    :cond_df
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    goto/16 :goto_17a

    :cond_e6
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Ljho;->u:Ljava/lang/Object;

    check-cast p1, Lnx5;

    sget-object p1, Ljko;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p1

    if-eqz p1, :cond_178

    :try_start_f5
    sget-object p1, Lt0i;->b:Lp0i;

    sget-object p1, Lr8p;->a:Ljava/util/List;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v5, "opera.ads.sdk.blocked_ads"

    invoke-interface {p1, v5, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_11e

    invoke-static {}, Lfcp;->d()Lrpb;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lk72;

    sget-object v7, Ltxo;->Companion:Lawo;

    invoke-virtual {v7}, Lawo;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v7

    invoke-direct {v6, v7, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    invoke-virtual {v5, p1, v6}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;
    :try_end_11d
    .catchall {:try_start_f5 .. :try_end_11d} :catchall_120

    goto :goto_129

    :cond_11e
    move-object p1, v3

    goto :goto_129

    :catchall_120
    move-exception p1

    sget-object v2, Lt0i;->b:Lp0i;

    new-instance v2, Lq0i;

    invoke-direct {v2, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p1, v2

    :goto_129
    instance-of v2, p1, Lq0i;

    if-nez v2, :cond_15a

    move-object v2, p1

    check-cast v2, Ljava/util/List;

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_159

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-static {}, Laap;->f()Lz8p;

    move-result-object p1

    iget-wide v7, p1, Lz8p;->F:J

    sub-long v7, v5, v7

    new-instance p1, Lcho;

    invoke-direct {p1, v7, v8, v5, v6}, Lcho;-><init>(JJ)V

    invoke-static {v2, p1}, Lo95;->v(Ljava/util/List;Lkotlin/jvm/functions/Function1;)V

    sget-object p1, Ltxo;->Companion:Lawo;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Ltxo;->c:Lomj;

    invoke-static {p1, v2}, Ln95;->r(Ljava/util/Comparator;Ljava/util/List;)V

    move-object p1, v2

    goto :goto_15a

    :cond_159
    move-object p1, v3

    :cond_15a
    :goto_15a
    instance-of v2, p1, Lq0i;

    if-eqz v2, :cond_15f

    move-object p1, v3

    :cond_15f
    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_178

    sget-object v2, Lbb7;->a:Lcv6;

    sget-object v2, Ls6d;->a:Ld7a;

    new-instance v5, Ludj;

    const/16 v6, 0xd

    invoke-direct {v5, p1, v0, v3, v6}, Ludj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput-boolean v1, p0, Ljho;->w:Z

    invoke-static {v2, v5, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v4, :cond_178

    move-object v3, v4

    goto :goto_17a

    :cond_178
    :goto_178
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_17a
    return-object v3

    nop

    :pswitch_data_17c
    .packed-switch 0x0
        :pswitch_d0
    .end packed-switch
.end method
