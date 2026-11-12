.class public final Lswo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lazo;

.field public final b:Lwyo;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Lt5p;

.field public final f:Z


# direct methods
.method public constructor <init>(Landroid/location/Location;Ljava/lang/String;ZLandroid/content/Context;ILjava/lang/String;Ljava/lang/String;Lt5p;Z)V
    .registers 32

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lazo;

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-eqz p1, :cond_24

    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v3

    double-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    double-to-float v4, v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    goto :goto_27

    :cond_24
    move-object v3, v9

    move-object v4, v3

    move-object v5, v4

    :goto_27
    sget-object v6, Lfap;->a:Lzyk;

    sget-object v6, Lpn7;->b:Lon7;

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v6

    sget-object v7, Lun7;->d:Lun7;

    invoke-static {v6, v7}, Lcs5;->x0(ILun7;)J

    move-result-wide v6

    sget-object v10, Lun7;->f:Lun7;

    invoke-static {v6, v7, v10}, Lpn7;->p(JLun7;)J

    move-result-wide v6

    long-to-int v6, v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v6, p2

    invoke-direct/range {v2 .. v7}, Lazo;-><init>(Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;)V

    iput-object v2, v0, Lswo;->a:Lazo;

    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v9, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v2

    const/4 v4, -0x1

    if-eqz v2, :cond_70

    const-string v5, "level"

    invoke-virtual {v2, v5, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    const-string v6, "scale"

    invoke-virtual {v2, v6, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    if-ltz v5, :cond_70

    if-lez v2, :cond_70

    mul-int/lit8 v5, v5, 0x64

    div-int/2addr v5, v2

    move v13, v5

    goto :goto_71

    :cond_70
    move v13, v4

    :goto_71
    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v9, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v2

    if-eqz v2, :cond_87

    const-string v3, "status"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_88

    :cond_87
    move-object v3, v9

    :goto_88
    const/4 v5, 0x0

    const/4 v6, 0x3

    const/4 v7, 0x4

    if-eqz v3, :cond_a6

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const/4 v12, 0x2

    if-ne v10, v12, :cond_a6

    const-string v3, "plugged"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    if-eq v2, v8, :cond_a4

    if-eq v2, v12, :cond_a2

    if-ne v2, v7, :cond_af

    move v14, v6

    goto :goto_b2

    :cond_a2
    move v14, v8

    goto :goto_b2

    :cond_a4
    move v14, v12

    goto :goto_b2

    :cond_a6
    if-eqz v3, :cond_b1

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x5

    if-ne v2, v3, :cond_b1

    :cond_af
    move v14, v7

    goto :goto_b2

    :cond_b1
    move v14, v5

    :goto_b2
    sget-object v2, Lr8p;->a:Ljava/util/List;

    const-string v2, "audio"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    instance-of v7, v3, Landroid/media/AudioManager;

    if-eqz v7, :cond_c1

    check-cast v3, Landroid/media/AudioManager;

    goto :goto_c2

    :cond_c1
    move-object v3, v9

    :goto_c2
    if-eqz v3, :cond_d2

    invoke-virtual {v3, v6}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v7

    invoke-virtual {v3, v6}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v3

    if-lez v3, :cond_d2

    mul-int/lit8 v7, v7, 0x64

    div-int v4, v7, v3

    :cond_d2
    move v15, v4

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Landroid/media/AudioManager;

    if-eqz v2, :cond_de

    check-cast v1, Landroid/media/AudioManager;

    goto :goto_df

    :cond_de
    move-object v1, v9

    :goto_df
    if-eqz v1, :cond_e9

    invoke-virtual {v1}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    :cond_e9
    if-eqz v9, :cond_f7

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eqz v1, :cond_fa

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v1, v8, :cond_fa

    :cond_f7
    move/from16 v16, v5

    goto :goto_fc

    :cond_fa
    move/from16 v16, v8

    :goto_fc
    sget-object v1, Lfap;->a:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v18

    sget-wide v20, Lfap;->b:J

    sget-object v1, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    new-instance v10, Lwyo;

    move/from16 v12, p3

    move/from16 v17, p5

    invoke-direct/range {v10 .. v21}, Lwyo;-><init>(IIIIIIIJJ)V

    iput-object v10, v0, Lswo;->b:Lwyo;

    move-object/from16 v1, p6

    iput-object v1, v0, Lswo;->c:Ljava/lang/String;

    move-object/from16 v1, p7

    iput-object v1, v0, Lswo;->d:Ljava/lang/String;

    move-object/from16 v1, p8

    iput-object v1, v0, Lswo;->e:Lt5p;

    move/from16 v1, p9

    iput-boolean v1, v0, Lswo;->f:Z

    return-void
.end method
