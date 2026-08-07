.class public final Ll/cft0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/lang/String;

.field public final c:Lcom/google/android/gms/internal/ads/zzcei;

.field public final d:Ll/hhs0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final e:Ll/khs0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final f:Ll/qhs0;

.field public final g:[J

.field public final h:[Ljava/lang/String;

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:Lcom/google/android/gms/internal/ads/zzcfr;

.field public o:Z

.field public p:Z

.field public q:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ljava/lang/String;Ll/khs0;Ll/hhs0;)V
    .locals 6
    .param p4    # Ll/khs0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ll/hhs0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ifs0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ifs0;-><init>()V

    .line 7
    .line 8
    .line 9
    const-wide/16 v2, 0x1

    .line 10
    .line 11
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 12
    .line 13
    const-string v1, "min_1"

    .line 14
    .line 15
    invoke-virtual/range {v0 .. v5}, Ll/ifs0;->a(Ljava/lang/String;DD)Ll/ifs0;

    .line 16
    .line 17
    .line 18
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 19
    .line 20
    const-wide/high16 v4, 0x4014000000000000L    # 5.0

    .line 21
    .line 22
    const-string v1, "1_5"

    .line 23
    .line 24
    invoke-virtual/range {v0 .. v5}, Ll/ifs0;->a(Ljava/lang/String;DD)Ll/ifs0;

    .line 25
    .line 26
    .line 27
    const-wide/high16 v2, 0x4014000000000000L    # 5.0

    .line 28
    .line 29
    const-wide/high16 v4, 0x4024000000000000L    # 10.0

    .line 30
    .line 31
    const-string v1, "5_10"

    .line 32
    .line 33
    invoke-virtual/range {v0 .. v5}, Ll/ifs0;->a(Ljava/lang/String;DD)Ll/ifs0;

    .line 34
    .line 35
    .line 36
    const-wide/high16 v2, 0x4024000000000000L    # 10.0

    .line 37
    .line 38
    const-wide/high16 v4, 0x4034000000000000L    # 20.0

    .line 39
    .line 40
    const-string v1, "10_20"

    .line 41
    .line 42
    invoke-virtual/range {v0 .. v5}, Ll/ifs0;->a(Ljava/lang/String;DD)Ll/ifs0;

    .line 43
    .line 44
    .line 45
    const-wide/high16 v2, 0x4034000000000000L    # 20.0

    .line 46
    .line 47
    const-wide/high16 v4, 0x403e000000000000L    # 30.0

    .line 48
    .line 49
    const-string v1, "20_30"

    .line 50
    .line 51
    invoke-virtual/range {v0 .. v5}, Ll/ifs0;->a(Ljava/lang/String;DD)Ll/ifs0;

    .line 52
    .line 53
    .line 54
    const-wide/high16 v2, 0x403e000000000000L    # 30.0

    .line 55
    .line 56
    const-wide v4, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    const-string v1, "30_max"

    .line 62
    .line 63
    invoke-virtual/range {v0 .. v5}, Ll/ifs0;->a(Ljava/lang/String;DD)Ll/ifs0;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ll/ifs0;->b()Ll/qhs0;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, p0, Ll/cft0;->f:Ll/qhs0;

    .line 71
    .line 72
    const/4 v0, 0x0

    .line 73
    iput-boolean v0, p0, Ll/cft0;->i:Z

    .line 74
    .line 75
    iput-boolean v0, p0, Ll/cft0;->j:Z

    .line 76
    .line 77
    iput-boolean v0, p0, Ll/cft0;->k:Z

    .line 78
    .line 79
    iput-boolean v0, p0, Ll/cft0;->l:Z

    .line 80
    .line 81
    const-wide/16 v1, -0x1

    .line 82
    .line 83
    iput-wide v1, p0, Ll/cft0;->q:J

    .line 84
    .line 85
    iput-object p1, p0, Ll/cft0;->a:Landroid/content/Context;

    .line 86
    .line 87
    iput-object p2, p0, Ll/cft0;->c:Lcom/google/android/gms/internal/ads/zzcei;

    .line 88
    .line 89
    iput-object p3, p0, Ll/cft0;->b:Ljava/lang/String;

    .line 90
    .line 91
    iput-object p4, p0, Ll/cft0;->e:Ll/khs0;

    .line 92
    .line 93
    iput-object p5, p0, Ll/cft0;->d:Ll/hhs0;

    .line 94
    .line 95
    sget-object p1, Ll/sgs0;->A:Ll/dgs0;

    .line 96
    .line 97
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    check-cast p1, Ljava/lang/String;

    .line 106
    .line 107
    if-nez p1, :cond_0

    .line 108
    .line 109
    new-array p1, v0, [Ljava/lang/String;

    .line 110
    .line 111
    iput-object p1, p0, Ll/cft0;->h:[Ljava/lang/String;

    .line 112
    .line 113
    new-array p1, v0, [J

    .line 114
    .line 115
    iput-object p1, p0, Ll/cft0;->g:[J

    .line 116
    .line 117
    return-void

    .line 118
    :cond_0
    const-string p2, ","

    .line 119
    .line 120
    invoke-static {p1, p2}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    array-length p2, p1

    .line 125
    new-array p3, p2, [Ljava/lang/String;

    .line 126
    .line 127
    iput-object p3, p0, Ll/cft0;->h:[Ljava/lang/String;

    .line 128
    .line 129
    new-array p2, p2, [J

    .line 130
    .line 131
    iput-object p2, p0, Ll/cft0;->g:[J

    .line 132
    .line 133
    move p2, v0

    .line 134
    :goto_0
    array-length p3, p1

    .line 135
    if-ge p2, p3, :cond_1

    .line 136
    .line 137
    :try_start_0
    iget-object p3, p0, Ll/cft0;->g:[J

    .line 138
    .line 139
    aget-object p4, p1, p2

    .line 140
    .line 141
    invoke-static {p4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 142
    .line 143
    .line 144
    move-result-wide p4

    .line 145
    aput-wide p4, p3, p2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    .line 147
    goto :goto_1

    .line 148
    :catch_0
    move-exception v0

    .line 149
    move-object p3, v0

    .line 150
    const-string p4, "Unable to parse frame hash target time number."

    .line 151
    .line 152
    invoke-static {p4, p3}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 153
    .line 154
    .line 155
    iget-object p3, p0, Ll/cft0;->g:[J

    .line 156
    .line 157
    aput-wide v1, p3, p2

    .line 158
    .line 159
    :goto_1
    add-int/lit8 p2, p2, 0x1

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_1
    return-void
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/internal/ads/zzcfr;)V
    .locals 3

    .line 1
    const-string v0, "vpc2"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/cft0;->e:Ll/khs0;

    .line 8
    .line 9
    iget-object v2, p0, Ll/cft0;->d:Ll/hhs0;

    .line 10
    .line 11
    invoke-static {v1, v2, v0}, Ll/chs0;->a(Ll/khs0;Ll/hhs0;[Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Ll/cft0;->i:Z

    .line 16
    .line 17
    iget-object v0, p0, Ll/cft0;->e:Ll/khs0;

    .line 18
    .line 19
    const-string v1, "vpn"

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/zzcfr;->q()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v0, v1, v2}, Ll/khs0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Ll/cft0;->n:Lcom/google/android/gms/internal/ads/zzcfr;

    .line 29
    .line 30
    return-void
.end method

.method public final b()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/cft0;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/cft0;->j:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/cft0;->e:Ll/khs0;

    .line 11
    .line 12
    iget-object v1, p0, Ll/cft0;->d:Ll/hhs0;

    .line 13
    .line 14
    const-string v2, "vfr2"

    .line 15
    .line 16
    filled-new-array {v2}, [Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-static {v0, v1, v2}, Ll/chs0;->a(Ll/khs0;Ll/hhs0;[Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Ll/cft0;->j:Z

    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method public final c()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/cft0;->m:Z

    .line 3
    .line 4
    iget-boolean v1, p0, Ll/cft0;->j:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-boolean v1, p0, Ll/cft0;->k:Z

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/cft0;->e:Ll/khs0;

    .line 13
    .line 14
    iget-object v2, p0, Ll/cft0;->d:Ll/hhs0;

    .line 15
    .line 16
    const-string v3, "vfp2"

    .line 17
    .line 18
    filled-new-array {v3}, [Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-static {v1, v2, v3}, Ll/chs0;->a(Ll/khs0;Ll/hhs0;[Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    iput-boolean v0, p0, Ll/cft0;->k:Z

    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final d()V
    .locals 7

    .line 1
    sget-object v0, Ll/wjs0;->a:Ll/kis0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/kis0;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    iget-boolean v0, p0, Ll/cft0;->o:Z

    .line 16
    .line 17
    if-nez v0, :cond_3

    .line 18
    .line 19
    new-instance v5, Landroid/os/Bundle;

    .line 20
    .line 21
    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v0, "type"

    .line 25
    .line 26
    const-string v1, "native-player-metrics"

    .line 27
    .line 28
    invoke-virtual {v5, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/cft0;->b:Ljava/lang/String;

    .line 32
    .line 33
    const-string v1, "request"

    .line 34
    .line 35
    invoke-virtual {v5, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/cft0;->n:Lcom/google/android/gms/internal/ads/zzcfr;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/zzcfr;->q()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "player"

    .line 45
    .line 46
    invoke-virtual {v5, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/cft0;->f:Ll/qhs0;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/qhs0;->a()Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_0

    .line 64
    .line 65
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Ll/nes0;

    .line 70
    .line 71
    iget-object v2, v1, Ll/nes0;->a:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    iget v3, v1, Ll/nes0;->e:I

    .line 78
    .line 79
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    const-string v4, "fps_c_"

    .line 84
    .line 85
    invoke-virtual {v4, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v5, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-object v2, v1, Ll/nes0;->a:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    iget-wide v3, v1, Ll/nes0;->d:D

    .line 99
    .line 100
    invoke-static {v3, v4}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    const-string v3, "fps_p_"

    .line 105
    .line 106
    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v5, v2, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_0
    const/4 v0, 0x0

    .line 115
    :goto_1
    iget-object v1, p0, Ll/cft0;->g:[J

    .line 116
    .line 117
    array-length v2, v1

    .line 118
    if-ge v0, v2, :cond_2

    .line 119
    .line 120
    iget-object v2, p0, Ll/cft0;->h:[Ljava/lang/String;

    .line 121
    .line 122
    aget-object v2, v2, v0

    .line 123
    .line 124
    if-eqz v2, :cond_1

    .line 125
    .line 126
    aget-wide v3, v1, v0

    .line 127
    .line 128
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    const-string v3, "fh_"

    .line 133
    .line 134
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-virtual {v5, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_2
    iget-object v2, p0, Ll/cft0;->a:Landroid/content/Context;

    .line 149
    .line 150
    iget-object v0, p0, Ll/cft0;->c:Lcom/google/android/gms/internal/ads/zzcei;

    .line 151
    .line 152
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    iget-object v3, v0, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 157
    .line 158
    const-string v4, "gmob-apps"

    .line 159
    .line 160
    const/4 v6, 0x1

    .line 161
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/gms/ads/internal/util/b;->J(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Z)V

    .line 162
    .line 163
    .line 164
    const/4 v0, 0x1

    .line 165
    iput-boolean v0, p0, Ll/cft0;->o:Z

    .line 166
    .line 167
    :cond_3
    return-void
.end method

.method public final e()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/cft0;->m:Z

    .line 3
    .line 4
    return-void
.end method

.method public final f(Lcom/google/android/gms/internal/ads/zzcfr;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/cft0;->k:Z

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    iget-boolean v1, v0, Ll/cft0;->l:Z

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/d2v0;->m()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-boolean v1, v0, Ll/cft0;->l:Z

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    const-string v1, "VideoMetricsMixin first frame"

    .line 22
    .line 23
    invoke-static {v1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v1, v0, Ll/cft0;->e:Ll/khs0;

    .line 27
    .line 28
    iget-object v2, v0, Ll/cft0;->d:Ll/hhs0;

    .line 29
    .line 30
    const-string v3, "vff2"

    .line 31
    .line 32
    filled-new-array {v3}, [Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-static {v1, v2, v3}, Ll/chs0;->a(Ll/khs0;Ll/hhs0;[Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    iput-boolean v1, v0, Ll/cft0;->l:Z

    .line 41
    .line 42
    :cond_1
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->nanoTime()J

    .line 47
    .line 48
    .line 49
    move-result-wide v1

    .line 50
    iget-boolean v3, v0, Ll/cft0;->m:Z

    .line 51
    .line 52
    const-wide/16 v4, -0x1

    .line 53
    .line 54
    if-eqz v3, :cond_2

    .line 55
    .line 56
    iget-boolean v3, v0, Ll/cft0;->p:Z

    .line 57
    .line 58
    if-eqz v3, :cond_2

    .line 59
    .line 60
    iget-wide v6, v0, Ll/cft0;->q:J

    .line 61
    .line 62
    cmp-long v3, v6, v4

    .line 63
    .line 64
    if-eqz v3, :cond_2

    .line 65
    .line 66
    sub-long v6, v1, v6

    .line 67
    .line 68
    iget-object v3, v0, Ll/cft0;->f:Ll/qhs0;

    .line 69
    .line 70
    long-to-double v6, v6

    .line 71
    const-wide v8, 0x41cdcd6500000000L    # 1.0E9

    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    div-double/2addr v8, v6

    .line 77
    invoke-virtual {v3, v8, v9}, Ll/qhs0;->b(D)V

    .line 78
    .line 79
    .line 80
    :cond_2
    iget-boolean v3, v0, Ll/cft0;->m:Z

    .line 81
    .line 82
    iput-boolean v3, v0, Ll/cft0;->p:Z

    .line 83
    .line 84
    iput-wide v1, v0, Ll/cft0;->q:J

    .line 85
    .line 86
    sget-object v1, Ll/sgs0;->B:Ll/dgs0;

    .line 87
    .line 88
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Ljava/lang/Long;

    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 99
    .line 100
    .line 101
    move-result-wide v1

    .line 102
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/internal/ads/zzcfr;->i()I

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    int-to-long v6, v3

    .line 107
    const/4 v3, 0x0

    .line 108
    move v8, v3

    .line 109
    :goto_0
    iget-object v9, v0, Ll/cft0;->h:[Ljava/lang/String;

    .line 110
    .line 111
    array-length v10, v9

    .line 112
    if-ge v8, v10, :cond_8

    .line 113
    .line 114
    aget-object v9, v9, v8

    .line 115
    .line 116
    if-eqz v9, :cond_4

    .line 117
    .line 118
    :cond_3
    move-object/from16 v9, p1

    .line 119
    .line 120
    goto :goto_4

    .line 121
    :cond_4
    iget-object v9, v0, Ll/cft0;->g:[J

    .line 122
    .line 123
    aget-wide v10, v9, v8

    .line 124
    .line 125
    sub-long v9, v6, v10

    .line 126
    .line 127
    invoke-static {v9, v10}, Ljava/lang/Math;->abs(J)J

    .line 128
    .line 129
    .line 130
    move-result-wide v9

    .line 131
    cmp-long v9, v1, v9

    .line 132
    .line 133
    if-lez v9, :cond_3

    .line 134
    .line 135
    iget-object v0, v0, Ll/cft0;->h:[Ljava/lang/String;

    .line 136
    .line 137
    const/16 v1, 0x8

    .line 138
    .line 139
    move-object/from16 v9, p1

    .line 140
    .line 141
    invoke-virtual {v9, v1, v1}, Landroid/view/TextureView;->getBitmap(II)Landroid/graphics/Bitmap;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    const-wide/16 v6, 0x0

    .line 146
    .line 147
    const-wide/16 v9, 0x3f

    .line 148
    .line 149
    move v11, v3

    .line 150
    move-wide v12, v6

    .line 151
    :goto_1
    if-ge v11, v1, :cond_7

    .line 152
    .line 153
    move v14, v3

    .line 154
    :goto_2
    if-ge v14, v1, :cond_6

    .line 155
    .line 156
    invoke-virtual {v2, v14, v11}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 157
    .line 158
    .line 159
    move-result v15

    .line 160
    invoke-static {v15}, Landroid/graphics/Color;->blue(I)I

    .line 161
    .line 162
    .line 163
    move-result v16

    .line 164
    invoke-static {v15}, Landroid/graphics/Color;->red(I)I

    .line 165
    .line 166
    .line 167
    move-result v17

    .line 168
    add-int v16, v16, v17

    .line 169
    .line 170
    invoke-static {v15}, Landroid/graphics/Color;->green(I)I

    .line 171
    .line 172
    .line 173
    move-result v15

    .line 174
    add-int v15, v16, v15

    .line 175
    .line 176
    const/16 v1, 0x80

    .line 177
    .line 178
    if-le v15, v1, :cond_5

    .line 179
    .line 180
    const-wide/16 v15, 0x1

    .line 181
    .line 182
    goto :goto_3

    .line 183
    :cond_5
    move-wide v15, v6

    .line 184
    :goto_3
    long-to-int v1, v9

    .line 185
    shl-long/2addr v15, v1

    .line 186
    or-long/2addr v12, v15

    .line 187
    add-long/2addr v9, v4

    .line 188
    add-int/lit8 v14, v14, 0x1

    .line 189
    .line 190
    const/16 v1, 0x8

    .line 191
    .line 192
    goto :goto_2

    .line 193
    :cond_6
    add-int/lit8 v11, v11, 0x1

    .line 194
    .line 195
    const/16 v1, 0x8

    .line 196
    .line 197
    goto :goto_1

    .line 198
    :cond_7
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    const-string v2, "%016X"

    .line 207
    .line 208
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    aput-object v1, v0, v8

    .line 213
    .line 214
    return-void

    .line 215
    :goto_4
    add-int/lit8 v8, v8, 0x1

    .line 216
    .line 217
    goto :goto_0

    .line 218
    :cond_8
    return-void
.end method
