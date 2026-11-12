.class public final Lzv9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lb59;

.field public final c:Ljava/lang/Object;

.field public volatile d:Lyv9;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lzv9;->c:Ljava/lang/Object;

    sget-object v0, Lyv9;->d:Lyv9;

    iput-object v0, p0, Lzv9;->d:Lyv9;

    iput-object p1, p0, Lzv9;->a:Landroid/content/Context;

    new-instance v0, La00;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, La00;-><init>(Ljava/lang/Object;B)V

    const/4 v1, 0x1

    new-array v1, v1, [Lbg1;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v0, "sys_geo"

    invoke-static {p1, p2, v0, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lzv9;->b:Lb59;

    return-void
.end method


# virtual methods
.method public final a()Lyv9;
    .registers 8

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_35

    iget-object v1, p0, Lzv9;->c:Ljava/lang/Object;

    monitor-enter v1

    :try_start_9
    iget-object v0, p0, Lzv9;->d:Lyv9;

    iget-wide v2, v0, Lyv9;->c:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_15

    const/4 v0, 0x1

    goto :goto_16

    :cond_15
    const/4 v0, 0x0

    :goto_16
    if-nez v0, :cond_1a

    monitor-exit v1

    goto :goto_35

    :cond_1a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v0, p0, Lzv9;->d:Lyv9;

    iget-wide v4, v0, Lyv9;->c:J

    sub-long/2addr v2, v4

    const-wide/32 v4, 0x5265c00

    cmp-long v0, v2, v4

    if-ltz v0, :cond_2c

    monitor-exit v1

    goto :goto_35

    :cond_2c
    monitor-exit v1
    :try_end_2d
    .catchall {:try_start_9 .. :try_end_2d} :catchall_32

    iget-object p0, p0, Lzv9;->d:Lyv9;

    return-object p0

    :goto_30
    :try_start_30
    monitor-exit v1
    :try_end_31
    .catchall {:try_start_30 .. :try_end_31} :catchall_32

    throw p0

    :catchall_32
    move-exception v0

    move-object p0, v0

    goto :goto_30

    :cond_35
    :goto_35
    iget-object v0, p0, Lzv9;->a:Landroid/content/Context;

    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v0, v1}, Lfr3;->Q(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_49

    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {v0, v1}, Lfr3;->Q(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_49

    const/4 v0, 0x0

    goto :goto_57

    :cond_49
    const-string v1, "location"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    const-string v1, "network"

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    :goto_57
    if-nez v0, :cond_5c

    iget-object p0, p0, Lzv9;->d:Lyv9;

    return-object p0

    :cond_5c
    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v1

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    new-instance v0, Lyv9;

    invoke-direct/range {v0 .. v6}, Lyv9;-><init>(DDJ)V

    iget-object v1, p0, Lzv9;->c:Ljava/lang/Object;

    monitor-enter v1

    :try_start_70
    iput-object v0, p0, Lzv9;->d:Lyv9;

    iget-object v2, p0, Lzv9;->d:Lyv9;

    invoke-virtual {p0, v2}, Lzv9;->b(Lyv9;)V

    monitor-exit v1

    return-object v0

    :goto_79
    monitor-exit v1
    :try_end_7a
    .catchall {:try_start_70 .. :try_end_7a} :catchall_7b

    throw p0

    :catchall_7b
    move-exception v0

    move-object p0, v0

    goto :goto_79
.end method

.method public final b(Lyv9;)V
    .registers 6

    iget-object p0, p0, Lzv9;->b:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    sget-object v0, Lyv9;->d:Lyv9;

    if-ne p1, v0, :cond_12

    const/4 p1, 0x0

    goto :goto_30

    :cond_12
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "la"

    iget-wide v2, p1, Lyv9;->a:D

    :try_start_1b
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_1e
    .catch Lorg/json/JSONException; {:try_start_1b .. :try_end_1e} :catch_44

    const-string v1, "lo"

    iget-wide v2, p1, Lyv9;->b:D

    :try_start_22
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_25
    .catch Lorg/json/JSONException; {:try_start_22 .. :try_end_25} :catch_3f

    const-string v1, "ts"

    iget-wide v2, p1, Lyv9;->c:J

    :try_start_29
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_2c
    .catch Lorg/json/JSONException; {:try_start_29 .. :try_end_2c} :catch_3a

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_30
    const-string v0, "sysutil.location"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    :catch_3a
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :catch_3f
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :catch_44
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void
.end method
