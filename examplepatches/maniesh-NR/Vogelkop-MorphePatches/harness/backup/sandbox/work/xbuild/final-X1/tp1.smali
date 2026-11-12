.class public final Ltp1;
.super Lk8;
.source "SourceFile"


# instance fields
.field public final synthetic o:B

.field public final synthetic p:Lxp1;

.field public final q:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lxp1;Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Ltp1;->o:B

    iput-object p1, p0, Ltp1;->p:Lxp1;

    invoke-direct {p0, p1}, Lk8;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "power"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    iput-object p1, p0, Ltp1;->q:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lxp1;Lshf;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Ltp1;->o:B

    .line 23
    iput-object p1, p0, Ltp1;->p:Lxp1;

    invoke-direct {p0, p1}, Lk8;-><init>(Ljava/lang/Object;)V

    .line 24
    iput-object p2, p0, Ltp1;->q:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final M()Landroid/content/IntentFilter;
    .registers 2

    iget-byte p0, p0, Ltp1;->o:B

    packed-switch p0, :pswitch_data_26

    new-instance p0, Landroid/content/IntentFilter;

    invoke-direct {p0}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "android.intent.action.TIME_SET"

    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "android.intent.action.TIMEZONE_CHANGED"

    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "android.intent.action.TIME_TICK"

    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    return-object p0

    :pswitch_1a
    new-instance p0, Landroid/content/IntentFilter;

    invoke-direct {p0}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "android.os.action.POWER_SAVE_MODE_CHANGED"

    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    return-object p0

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1a
    .end packed-switch
.end method

.method public final S()I
    .registers 23

    move-object/from16 v0, p0

    iget-byte v1, v0, Ltp1;->o:B

    const/4 v2, 0x2

    const/4 v3, 0x1

    iget-object v0, v0, Ltp1;->q:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_ee

    check-cast v0, Lshf;

    iget-object v1, v0, Lshf;->c:Ljava/lang/Object;

    check-cast v1, Lunk;

    iget-object v4, v0, Lshf;->b:Ljava/lang/Object;

    check-cast v4, Landroid/location/LocationManager;

    iget-wide v5, v1, Lunk;->b:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-lez v5, :cond_23

    iget-boolean v0, v1, Lunk;->a:Z

    goto/16 :goto_e0

    :cond_23
    iget-object v0, v0, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v5, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {v0, v5}, Lna2;->o(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x0

    if-nez v5, :cond_3d

    const-string v5, "network"

    :try_start_32
    invoke-virtual {v4, v5}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3d

    invoke-virtual {v4, v5}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v5
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_3c} :catch_3d

    goto :goto_3e

    :catch_3d
    :cond_3d
    move-object v5, v6

    :goto_3e
    const-string v7, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v0, v7}, Lna2;->o(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_52

    const-string v0, "gps"

    :try_start_48
    invoke-virtual {v4, v0}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_52

    invoke-virtual {v4, v0}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v6
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_52} :catch_52

    :catch_52
    :cond_52
    if-eqz v6, :cond_63

    if-eqz v5, :cond_62

    invoke-virtual {v6}, Landroid/location/Location;->getTime()J

    move-result-wide v7

    invoke-virtual {v5}, Landroid/location/Location;->getTime()J

    move-result-wide v9

    cmp-long v0, v7, v9

    if-lez v0, :cond_63

    :cond_62
    move-object v5, v6

    :cond_63
    const/4 v0, 0x0

    if-eqz v5, :cond_ce

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    sget-object v4, Lvg7;->d:Lvg7;

    if-nez v4, :cond_75

    new-instance v4, Lvg7;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    sput-object v4, Lvg7;->d:Lvg7;

    :cond_75
    move-object v13, v4

    const-wide/32 v20, 0x5265c00

    sub-long v18, v11, v20

    invoke-virtual {v5}, Landroid/location/Location;->getLatitude()D

    move-result-wide v14

    invoke-virtual {v5}, Landroid/location/Location;->getLongitude()D

    move-result-wide v16

    invoke-virtual/range {v13 .. v19}, Lvg7;->a(DDJ)V

    invoke-virtual {v5}, Landroid/location/Location;->getLatitude()D

    move-result-wide v7

    invoke-virtual {v5}, Landroid/location/Location;->getLongitude()D

    move-result-wide v9

    move-object v6, v13

    invoke-virtual/range {v6 .. v12}, Lvg7;->a(DDJ)V

    iget-boolean v4, v13, Lvg7;->c:Z

    if-ne v4, v3, :cond_97

    move v0, v3

    :cond_97
    iget-wide v6, v13, Lvg7;->b:J

    iget-wide v8, v13, Lvg7;->a:J

    add-long v18, v11, v20

    invoke-virtual {v5}, Landroid/location/Location;->getLatitude()D

    move-result-wide v14

    invoke-virtual {v5}, Landroid/location/Location;->getLongitude()D

    move-result-wide v16

    invoke-virtual/range {v13 .. v19}, Lvg7;->a(DDJ)V

    iget-wide v4, v13, Lvg7;->b:J

    const-wide/16 v13, -0x1

    cmp-long v10, v6, v13

    if-eqz v10, :cond_c4

    cmp-long v10, v8, v13

    if-eqz v10, :cond_c4

    cmp-long v10, v11, v8

    if-lez v10, :cond_ba

    move-wide v6, v4

    goto :goto_bf

    :cond_ba
    cmp-long v4, v11, v6

    if-lez v4, :cond_bf

    move-wide v6, v8

    :cond_bf
    :goto_bf
    const-wide/32 v4, 0xea60

    add-long/2addr v6, v4

    goto :goto_c9

    :cond_c4
    const-wide/32 v4, 0x2932e00

    add-long v6, v11, v4

    :goto_c9
    iput-boolean v0, v1, Lunk;->a:Z

    iput-wide v6, v1, Lunk;->b:J

    goto :goto_e0

    :cond_ce
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    const/16 v4, 0xb

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v1

    const/4 v4, 0x6

    if-lt v1, v4, :cond_df

    const/16 v4, 0x16

    if-lt v1, v4, :cond_e0

    :cond_df
    move v0, v3

    :cond_e0
    :goto_e0
    if-nez v0, :cond_e3

    move v2, v3

    :cond_e3
    return v2

    :pswitch_e4
    check-cast v0, Landroid/os/PowerManager;

    invoke-virtual {v0}, Landroid/os/PowerManager;->isPowerSaveMode()Z

    move-result v0

    if-nez v0, :cond_ed

    move v2, v3

    :cond_ed
    return v2

    :pswitch_data_ee
    .packed-switch 0x0
        :pswitch_e4
    .end packed-switch
.end method

.method public final e0()V
    .registers 3

    iget-byte v0, p0, Ltp1;->o:B

    const/4 v1, 0x1

    iget-object p0, p0, Ltp1;->p:Lxp1;

    packed-switch v0, :pswitch_data_10

    invoke-virtual {p0, v1, v1}, Lxp1;->m(ZZ)Z

    return-void

    :pswitch_c
    invoke-virtual {p0, v1, v1}, Lxp1;->m(ZZ)Z

    return-void

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
