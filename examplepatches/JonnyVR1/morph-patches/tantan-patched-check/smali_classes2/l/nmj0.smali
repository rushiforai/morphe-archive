.class public Ll/nmj0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/nmj0$a;
    }
.end annotation


# static fields
.field public static d:Ll/nmj0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Landroid/location/LocationManager;

.field public final c:Ll/nmj0$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/location/LocationManager;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/location/LocationManager;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/nmj0$a;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/nmj0$a;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/nmj0;->c:Ll/nmj0$a;

    .line 10
    .line 11
    iput-object p1, p0, Ll/nmj0;->a:Landroid/content/Context;

    .line 12
    .line 13
    iput-object p2, p0, Ll/nmj0;->b:Landroid/location/LocationManager;

    .line 14
    .line 15
    return-void
.end method

.method public static a(Landroid/content/Context;)Ll/nmj0;
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/nmj0;->d:Ll/nmj0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/nmj0;

    .line 10
    .line 11
    const-string v1, "location"

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/location/LocationManager;

    .line 18
    .line 19
    invoke-direct {v0, p0, v1}, Ll/nmj0;-><init>(Landroid/content/Context;Landroid/location/LocationManager;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Ll/nmj0;->d:Ll/nmj0;

    .line 23
    .line 24
    :cond_0
    sget-object p0, Ll/nmj0;->d:Ll/nmj0;

    .line 25
    .line 26
    return-object p0
.end method


# virtual methods
.method public final b()Landroid/location/Location;
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nmj0;->a:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/sr60;->b(Landroid/content/Context;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const-string v0, "network"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/nmj0;->c(Ljava/lang/String;)Landroid/location/Location;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move-object v0, v1

    .line 20
    :goto_0
    iget-object v2, p0, Ll/nmj0;->a:Landroid/content/Context;

    .line 21
    .line 22
    const-string v3, "android.permission.ACCESS_FINE_LOCATION"

    .line 23
    .line 24
    invoke-static {v2, v3}, Ll/sr60;->b(Landroid/content/Context;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-nez v2, :cond_1

    .line 29
    .line 30
    const-string v1, "gps"

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ll/nmj0;->c(Ljava/lang/String;)Landroid/location/Location;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :cond_1
    if-eqz v1, :cond_3

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/location/Location;->getTime()J

    .line 41
    .line 42
    .line 43
    move-result-wide v2

    .line 44
    invoke-virtual {v0}, Landroid/location/Location;->getTime()J

    .line 45
    .line 46
    .line 47
    move-result-wide v4

    .line 48
    cmp-long p0, v2, v4

    .line 49
    .line 50
    if-lez p0, :cond_2

    .line 51
    .line 52
    return-object v1

    .line 53
    :cond_2
    return-object v0

    .line 54
    :cond_3
    if-eqz v1, :cond_4

    .line 55
    .line 56
    return-object v1

    .line 57
    :cond_4
    return-object v0
.end method

.method public final c(Ljava/lang/String;)Landroid/location/Location;
    .locals 1
    .annotation build Landroidx/annotation/RequiresPermission;
        anyOf = {
            "android.permission.ACCESS_COARSE_LOCATION",
            "android.permission.ACCESS_FINE_LOCATION"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/nmj0;->b:Landroid/location/LocationManager;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/nmj0;->b:Landroid/location/LocationManager;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    .line 12
    .line 13
    .line 14
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    return-object p0

    .line 16
    :catch_0
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public d()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nmj0;->c:Ll/nmj0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nmj0;->e()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, v0, Ll/nmj0$a;->a:Z

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/nmj0;->b()Landroid/location/Location;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ll/nmj0;->f(Landroid/location/Location;)V

    .line 19
    .line 20
    .line 21
    iget-boolean p0, v0, Ll/nmj0$a;->a:Z

    .line 22
    .line 23
    return p0

    .line 24
    :cond_1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/16 v0, 0xb

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    const/4 v0, 0x6

    .line 35
    if-lt p0, v0, :cond_3

    .line 36
    .line 37
    const/16 v0, 0x16

    .line 38
    .line 39
    if-lt p0, v0, :cond_2

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :cond_3
    :goto_0
    const/4 p0, 0x1

    .line 45
    return p0
.end method

.method public final e()Z
    .locals 4

    .line 1
    iget-object p0, p0, Ll/nmj0;->c:Ll/nmj0$a;

    .line 2
    .line 3
    iget-wide v0, p0, Ll/nmj0$a;->f:J

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    cmp-long p0, v0, v2

    .line 10
    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final f(Landroid/location/Location;)V
    .locals 19
    .param p1    # Landroid/location/Location;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v0, v0, Ll/nmj0;->c:Ll/nmj0$a;

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    invoke-static {}, Ll/mmj0;->b()Ll/mmj0;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    const-wide/32 v11, 0x5265c00

    .line 14
    .line 15
    .line 16
    sub-long v5, v2, v11

    .line 17
    .line 18
    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLatitude()D

    .line 19
    .line 20
    .line 21
    move-result-wide v7

    .line 22
    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLongitude()D

    .line 23
    .line 24
    .line 25
    move-result-wide v9

    .line 26
    invoke-virtual/range {v4 .. v10}, Ll/mmj0;->a(JDD)V

    .line 27
    .line 28
    .line 29
    iget-wide v13, v4, Ll/mmj0;->a:J

    .line 30
    .line 31
    move-object v1, v4

    .line 32
    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLatitude()D

    .line 33
    .line 34
    .line 35
    move-result-wide v4

    .line 36
    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLongitude()D

    .line 37
    .line 38
    .line 39
    move-result-wide v6

    .line 40
    invoke-virtual/range {v1 .. v7}, Ll/mmj0;->a(JDD)V

    .line 41
    .line 42
    .line 43
    move-object v4, v1

    .line 44
    iget v1, v4, Ll/mmj0;->c:I

    .line 45
    .line 46
    const/4 v5, 0x1

    .line 47
    if-ne v1, v5, :cond_0

    .line 48
    .line 49
    :goto_0
    move v1, v5

    .line 50
    goto :goto_1

    .line 51
    :cond_0
    const/4 v5, 0x0

    .line 52
    goto :goto_0

    .line 53
    :goto_1
    iget-wide v5, v4, Ll/mmj0;->b:J

    .line 54
    .line 55
    iget-wide v7, v4, Ll/mmj0;->a:J

    .line 56
    .line 57
    add-long v9, v2, v11

    .line 58
    .line 59
    move-wide v11, v7

    .line 60
    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLatitude()D

    .line 61
    .line 62
    .line 63
    move-result-wide v7

    .line 64
    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLongitude()D

    .line 65
    .line 66
    .line 67
    move-result-wide v15

    .line 68
    move-wide/from16 v17, v15

    .line 69
    .line 70
    move-wide v15, v2

    .line 71
    move-wide v2, v11

    .line 72
    move-wide v11, v5

    .line 73
    move-wide v5, v9

    .line 74
    move-wide/from16 v9, v17

    .line 75
    .line 76
    invoke-virtual/range {v4 .. v10}, Ll/mmj0;->a(JDD)V

    .line 77
    .line 78
    .line 79
    iget-wide v5, v4, Ll/mmj0;->b:J

    .line 80
    .line 81
    const-wide/16 v7, -0x1

    .line 82
    .line 83
    cmp-long v4, v11, v7

    .line 84
    .line 85
    if-eqz v4, :cond_4

    .line 86
    .line 87
    cmp-long v4, v2, v7

    .line 88
    .line 89
    if-nez v4, :cond_1

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_1
    cmp-long v4, v15, v2

    .line 93
    .line 94
    if-lez v4, :cond_2

    .line 95
    .line 96
    move-wide v7, v5

    .line 97
    goto :goto_2

    .line 98
    :cond_2
    cmp-long v4, v15, v11

    .line 99
    .line 100
    if-lez v4, :cond_3

    .line 101
    .line 102
    move-wide v7, v2

    .line 103
    goto :goto_2

    .line 104
    :cond_3
    move-wide v7, v11

    .line 105
    :goto_2
    const-wide/32 v9, 0xea60

    .line 106
    .line 107
    .line 108
    add-long/2addr v7, v9

    .line 109
    goto :goto_4

    .line 110
    :cond_4
    :goto_3
    const-wide/32 v7, 0x2932e00

    .line 111
    .line 112
    .line 113
    add-long/2addr v7, v15

    .line 114
    :goto_4
    iput-boolean v1, v0, Ll/nmj0$a;->a:Z

    .line 115
    .line 116
    iput-wide v13, v0, Ll/nmj0$a;->b:J

    .line 117
    .line 118
    iput-wide v11, v0, Ll/nmj0$a;->c:J

    .line 119
    .line 120
    iput-wide v2, v0, Ll/nmj0$a;->d:J

    .line 121
    .line 122
    iput-wide v5, v0, Ll/nmj0$a;->e:J

    .line 123
    .line 124
    iput-wide v7, v0, Ll/nmj0$a;->f:J

    .line 125
    .line 126
    return-void
.end method
