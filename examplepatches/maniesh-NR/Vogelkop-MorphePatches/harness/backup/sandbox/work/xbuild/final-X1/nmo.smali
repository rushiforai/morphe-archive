.class public final Lnmo;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public t:Z

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lmt5;)V
    .registers 3

    iput-object p1, p0, Lnmo;->v:Landroid/content/Context;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    new-instance v0, Lnmo;

    iget-object p0, p0, Lnmo;->v:Landroid/content/Context;

    invoke-direct {v0, p0, p2}, Lnmo;-><init>(Landroid/content/Context;Lmt5;)V

    iput-object p1, v0, Lnmo;->u:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lnmo;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lnmo;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lnmo;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lnmo;->t:Z

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_14

    if-ne v1, v3, :cond_e

    :try_start_a
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_d
    .catchall {:try_start_a .. :try_end_d} :catchall_46

    goto :goto_37

    :cond_e
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v2

    :cond_14
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lnmo;->u:Ljava/lang/Object;

    check-cast p1, Lnx5;

    iget-object p1, p0, Lnmo;->v:Landroid/content/Context;

    :try_start_1d
    sget-object v1, Lt0i;->b:Lp0i;

    sget-object v1, Lpn7;->b:Lon7;

    sget-object v1, Lun7;->e:Lun7;

    const/16 v4, 0xa

    invoke-static {v4, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v4

    new-instance v1, Lfmo;

    invoke-direct {v1, p1, v2}, Lfmo;-><init>(Landroid/content/Context;Lmt5;)V

    iput-boolean v3, p0, Lnmo;->t:Z

    invoke-static {v4, v5, v1, p0}, Luyg;->x(JLkotlin/jvm/functions/Function2;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_37

    return-object v0

    :cond_37
    :goto_37
    check-cast p1, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    if-eqz p1, :cond_3e

    sget-object v0, Lt0i;->b:Lp0i;

    goto :goto_4f

    :cond_3e
    new-instance p1, Ljava/io/IOException;

    const-string v0, "GMS advertising ID connection timed out"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_46
    .catchall {:try_start_1d .. :try_end_46} :catchall_46

    :catchall_46
    move-exception p1

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lq0i;

    invoke-direct {v0, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p1, v0

    :goto_4f
    invoke-static {p1}, Luyg;->h(Ljava/lang/Object;)V

    iget-object p0, p0, Lnmo;->v:Landroid/content/Context;

    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_88

    :try_start_5a
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string p1, "advertising_id"

    invoke-static {p0, p1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_7f

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6d

    move-object v2, p1

    :cond_6d
    if-eqz v2, :cond_7f

    const-string p1, "limit_ad_tracking"

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p0

    if-eq p0, v3, :cond_79

    move v3, v0

    :cond_79
    new-instance p1, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    invoke-direct {p1, v2, v3}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;-><init>(Ljava/lang/String;Z)V

    goto :goto_88

    :cond_7f
    throw v0
    :try_end_80
    .catchall {:try_start_5a .. :try_end_80} :catchall_80

    :catchall_80
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    :cond_88
    :goto_88
    instance-of p0, p1, Lq0i;

    if-nez p0, :cond_91

    move-object p0, p1

    check-cast p0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    sput-object p0, Lepo;->a:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    :cond_91
    new-instance p0, Lt0i;

    invoke-direct {p0, p1}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object p0
.end method
