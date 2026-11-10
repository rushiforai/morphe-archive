.class public final Le/w;
.super Le/y;
.source "SourceFile"


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Le/B;

.field public final e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Le/B;LC/h;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Le/w;->c:I

    iput-object p1, p0, Le/w;->d:Le/B;

    invoke-direct {p0, p1}, Le/y;-><init>(Le/B;)V

    iput-object p2, p0, Le/w;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Le/B;Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Le/w;->c:I

    iput-object p1, p0, Le/w;->d:Le/B;

    invoke-direct {p0, p1}, Le/y;-><init>(Le/B;)V

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "power"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    iput-object p1, p0, Le/w;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final d()Landroid/content/IntentFilter;
    .locals 2

    iget v0, p0, Le/w;->c:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.TIME_SET"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.TIMEZONE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.TIME_TICK"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    return-object v0

    :pswitch_0
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.os.action.POWER_SAVE_MODE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final e()I
    .locals 22

    move-object/from16 v1, p0

    iget v0, v1, Le/w;->c:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, v1, Le/w;->e:Ljava/lang/Object;

    check-cast v0, LC/h;

    iget-object v2, v0, LC/h;->c:Ljava/lang/Object;

    check-cast v2, Le/H;

    iget-wide v3, v2, Le/H;->b:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    cmp-long v3, v3, v5

    const/4 v4, 0x1

    if-lez v3, :cond_0

    iget-boolean v0, v2, Le/H;->a:Z

    goto/16 :goto_8

    :cond_0
    iget-object v3, v0, LC/h;->a:Ljava/lang/Object;

    check-cast v3, Landroid/content/Context;

    const-string v5, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {v3, v5}, LD/g;->e(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    const-string v6, "Failed to get last known location"

    const-string v7, "TwilightManager"

    const/4 v8, 0x0

    iget-object v0, v0, LC/h;->b:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Landroid/location/LocationManager;

    if-nez v5, :cond_2

    const-string v0, "network"

    :try_start_0
    invoke-virtual {v9, v0}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v9, v0}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v7, v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    move-object v0, v8

    :goto_0
    move-object v5, v0

    goto :goto_1

    :cond_2
    move-object v5, v8

    :goto_1
    const-string v0, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v3, v0}, LD/g;->e(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "gps"

    :try_start_1
    invoke-virtual {v9, v0}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {v9, v0}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v8
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception v0

    invoke-static {v7, v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_3
    :goto_2
    if-eqz v8, :cond_4

    if-eqz v5, :cond_4

    invoke-virtual {v8}, Landroid/location/Location;->getTime()J

    move-result-wide v9

    invoke-virtual {v5}, Landroid/location/Location;->getTime()J

    move-result-wide v11

    cmp-long v0, v9, v11

    if-lez v0, :cond_5

    :goto_3
    move-object v5, v8

    goto :goto_4

    :cond_4
    if-eqz v8, :cond_5

    goto :goto_3

    :cond_5
    :goto_4
    const/4 v0, 0x0

    if-eqz v5, :cond_c

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sget-object v3, Le/G;->d:Le/G;

    if-nez v3, :cond_6

    new-instance v3, Le/G;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    sput-object v3, Le/G;->d:Le/G;

    :cond_6
    sget-object v11, Le/G;->d:Le/G;

    const-wide/32 v6, 0x5265c00

    sub-long v12, v9, v6

    invoke-virtual {v5}, Landroid/location/Location;->getLatitude()D

    move-result-wide v14

    invoke-virtual {v5}, Landroid/location/Location;->getLongitude()D

    move-result-wide v16

    invoke-virtual/range {v11 .. v17}, Le/G;->a(JDD)V

    invoke-virtual {v5}, Landroid/location/Location;->getLatitude()D

    move-result-wide v12

    move-object v8, v11

    move-wide v11, v12

    invoke-virtual {v5}, Landroid/location/Location;->getLongitude()D

    move-result-wide v13

    invoke-virtual/range {v8 .. v14}, Le/G;->a(JDD)V

    move-object v11, v8

    iget v3, v11, Le/G;->c:I

    if-ne v3, v4, :cond_7

    move v0, v4

    :cond_7
    iget-wide v12, v11, Le/G;->b:J

    iget-wide v14, v11, Le/G;->a:J

    add-long/2addr v6, v9

    move-wide/from16 v16, v14

    invoke-virtual {v5}, Landroid/location/Location;->getLatitude()D

    move-result-wide v14

    invoke-virtual {v5}, Landroid/location/Location;->getLongitude()D

    move-result-wide v18

    move-wide/from16 v20, v12

    move-wide v12, v6

    move-wide/from16 v5, v20

    move-wide/from16 v7, v16

    move-wide/from16 v16, v18

    invoke-virtual/range {v11 .. v17}, Le/G;->a(JDD)V

    iget-wide v12, v11, Le/G;->b:J

    const-wide/16 v14, -0x1

    cmp-long v3, v5, v14

    if-eqz v3, :cond_b

    cmp-long v3, v7, v14

    if-nez v3, :cond_8

    goto :goto_6

    :cond_8
    cmp-long v3, v9, v7

    if-lez v3, :cond_9

    goto :goto_5

    :cond_9
    cmp-long v3, v9, v5

    if-lez v3, :cond_a

    move-wide v12, v7

    goto :goto_5

    :cond_a
    move-wide v12, v5

    :goto_5
    const-wide/32 v5, 0xea60

    add-long/2addr v12, v5

    goto :goto_7

    :cond_b
    :goto_6
    const-wide/32 v5, 0x2932e00

    add-long v12, v9, v5

    :goto_7
    iput-boolean v0, v2, Le/H;->a:Z

    iput-wide v12, v2, Le/H;->b:J

    goto :goto_8

    :cond_c
    const-string v2, "Could not get last known location. This is probably because the app does not have any location permissions. Falling back to hardcoded sunrise/sunset values."

    invoke-static {v7, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    const/16 v3, 0xb

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result v2

    const/4 v3, 0x6

    if-lt v2, v3, :cond_d

    const/16 v3, 0x16

    if-lt v2, v3, :cond_e

    :cond_d
    move v0, v4

    :cond_e
    :goto_8
    if-eqz v0, :cond_f

    const/4 v4, 0x2

    :cond_f
    return v4

    :pswitch_0
    iget-object v0, v1, Le/w;->e:Ljava/lang/Object;

    check-cast v0, Landroid/os/PowerManager;

    invoke-static {v0}, Le/s;->a(Landroid/os/PowerManager;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x2

    goto :goto_9

    :cond_10
    const/4 v0, 0x1

    :goto_9
    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final g()V
    .locals 2

    iget v0, p0, Le/w;->c:I

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x1

    iget-object v1, p0, Le/w;->d:Le/B;

    invoke-virtual {v1, v0, v0}, Le/B;->m(ZZ)Z

    return-void

    :pswitch_0
    const/4 v0, 0x1

    iget-object v1, p0, Le/w;->d:Le/B;

    invoke-virtual {v1, v0, v0}, Le/B;->m(ZZ)Z

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
