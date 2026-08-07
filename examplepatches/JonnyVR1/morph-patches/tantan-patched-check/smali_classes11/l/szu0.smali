.class public final Ll/szu0;
.super Ll/flw0;
.source "SourceFile"


# instance fields
.field public final b:Landroid/hardware/SensorManager;

.field public final c:Landroid/hardware/Sensor;

.field public d:F

.field public e:Ljava/lang/Float;

.field public f:J

.field public g:I

.field public h:Z

.field public i:Z

.field public j:Ll/rzu0;

.field public k:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "FlickDetector"

    .line 2
    .line 3
    const-string v1, "ads"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Ll/flw0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ll/szu0;->d:F

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/szu0;->e:Ljava/lang/Float;

    .line 16
    .line 17
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iput-wide v0, p0, Ll/szu0;->f:J

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput v0, p0, Ll/szu0;->g:I

    .line 29
    .line 30
    iput-boolean v0, p0, Ll/szu0;->h:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Ll/szu0;->i:Z

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    iput-object v1, p0, Ll/szu0;->j:Ll/rzu0;

    .line 36
    .line 37
    iput-boolean v0, p0, Ll/szu0;->k:Z

    .line 38
    .line 39
    const-string v0, "sensor"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Landroid/hardware/SensorManager;

    .line 46
    .line 47
    iput-object p1, p0, Ll/szu0;->b:Landroid/hardware/SensorManager;

    .line 48
    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    const/4 v0, 0x4

    .line 52
    invoke-virtual {p1, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Ll/szu0;->c:Landroid/hardware/Sensor;

    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    iput-object v1, p0, Ll/szu0;->c:Landroid/hardware/Sensor;

    .line 60
    .line 61
    return-void
.end method


# virtual methods
.method public final a(Landroid/hardware/SensorEvent;)V
    .locals 7

    .line 1
    sget-object v0, Ll/sgs0;->W8:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto/16 :goto_1

    .line 20
    .line 21
    :cond_0
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    iget-wide v2, p0, Ll/szu0;->f:J

    .line 30
    .line 31
    sget-object v4, Ll/sgs0;->Y8:Ll/dgs0;

    .line 32
    .line 33
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    invoke-virtual {v5, v4}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    check-cast v4, Ljava/lang/Integer;

    .line 42
    .line 43
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    int-to-long v4, v4

    .line 48
    add-long/2addr v2, v4

    .line 49
    cmp-long v2, v2, v0

    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    if-gez v2, :cond_1

    .line 53
    .line 54
    iput v3, p0, Ll/szu0;->g:I

    .line 55
    .line 56
    iput-wide v0, p0, Ll/szu0;->f:J

    .line 57
    .line 58
    iput-boolean v3, p0, Ll/szu0;->h:Z

    .line 59
    .line 60
    iput-boolean v3, p0, Ll/szu0;->i:Z

    .line 61
    .line 62
    iget-object v2, p0, Ll/szu0;->e:Ljava/lang/Float;

    .line 63
    .line 64
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    iput v2, p0, Ll/szu0;->d:F

    .line 69
    .line 70
    :cond_1
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 71
    .line 72
    const/4 v2, 0x1

    .line 73
    aget p1, p1, v2

    .line 74
    .line 75
    const/high16 v4, 0x40800000    # 4.0f

    .line 76
    .line 77
    mul-float/2addr p1, v4

    .line 78
    iget-object v4, p0, Ll/szu0;->e:Ljava/lang/Float;

    .line 79
    .line 80
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    add-float/2addr v4, p1

    .line 85
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iput-object p1, p0, Ll/szu0;->e:Ljava/lang/Float;

    .line 90
    .line 91
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    iget v4, p0, Ll/szu0;->d:F

    .line 96
    .line 97
    sget-object v5, Ll/sgs0;->X8:Ll/dgs0;

    .line 98
    .line 99
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 100
    .line 101
    .line 102
    move-result-object v6

    .line 103
    invoke-virtual {v6, v5}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v6

    .line 107
    check-cast v6, Ljava/lang/Float;

    .line 108
    .line 109
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 110
    .line 111
    .line 112
    move-result v6

    .line 113
    add-float/2addr v4, v6

    .line 114
    cmpl-float p1, p1, v4

    .line 115
    .line 116
    iget-object v4, p0, Ll/szu0;->e:Ljava/lang/Float;

    .line 117
    .line 118
    if-lez p1, :cond_2

    .line 119
    .line 120
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    iput p1, p0, Ll/szu0;->d:F

    .line 125
    .line 126
    iput-boolean v2, p0, Ll/szu0;->i:Z

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_2
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    iget v4, p0, Ll/szu0;->d:F

    .line 134
    .line 135
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 136
    .line 137
    .line 138
    move-result-object v6

    .line 139
    invoke-virtual {v6, v5}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    check-cast v5, Ljava/lang/Float;

    .line 144
    .line 145
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 146
    .line 147
    .line 148
    move-result v5

    .line 149
    sub-float/2addr v4, v5

    .line 150
    cmpg-float p1, p1, v4

    .line 151
    .line 152
    if-gez p1, :cond_3

    .line 153
    .line 154
    iget-object p1, p0, Ll/szu0;->e:Ljava/lang/Float;

    .line 155
    .line 156
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    iput p1, p0, Ll/szu0;->d:F

    .line 161
    .line 162
    iput-boolean v2, p0, Ll/szu0;->h:Z

    .line 163
    .line 164
    :cond_3
    :goto_0
    iget-object p1, p0, Ll/szu0;->e:Ljava/lang/Float;

    .line 165
    .line 166
    invoke-virtual {p1}, Ljava/lang/Float;->isInfinite()Z

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    if-eqz p1, :cond_4

    .line 171
    .line 172
    const/4 p1, 0x0

    .line 173
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    iput-object v4, p0, Ll/szu0;->e:Ljava/lang/Float;

    .line 178
    .line 179
    iput p1, p0, Ll/szu0;->d:F

    .line 180
    .line 181
    :cond_4
    iget-boolean p1, p0, Ll/szu0;->h:Z

    .line 182
    .line 183
    if-eqz p1, :cond_5

    .line 184
    .line 185
    iget-boolean p1, p0, Ll/szu0;->i:Z

    .line 186
    .line 187
    if-eqz p1, :cond_5

    .line 188
    .line 189
    const-string p1, "Flick detected."

    .line 190
    .line 191
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    iput-wide v0, p0, Ll/szu0;->f:J

    .line 195
    .line 196
    iget p1, p0, Ll/szu0;->g:I

    .line 197
    .line 198
    add-int/2addr p1, v2

    .line 199
    iput p1, p0, Ll/szu0;->g:I

    .line 200
    .line 201
    iput-boolean v3, p0, Ll/szu0;->h:Z

    .line 202
    .line 203
    iput-boolean v3, p0, Ll/szu0;->i:Z

    .line 204
    .line 205
    iget-object p0, p0, Ll/szu0;->j:Ll/rzu0;

    .line 206
    .line 207
    if-eqz p0, :cond_5

    .line 208
    .line 209
    sget-object v0, Ll/sgs0;->Z8:Ll/dgs0;

    .line 210
    .line 211
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    check-cast v0, Ljava/lang/Integer;

    .line 220
    .line 221
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-ne p1, v0, :cond_5

    .line 226
    .line 227
    new-instance p1, Ll/i0v0;

    .line 228
    .line 229
    check-cast p0, Ll/j0v0;

    .line 230
    .line 231
    invoke-direct {p1, p0}, Ll/i0v0;-><init>(Ll/j0v0;)V

    .line 232
    .line 233
    .line 234
    sget-object v0, Lcom/google/android/gms/internal/ads/zzdzc;->zzc:Lcom/google/android/gms/internal/ads/zzdzc;

    .line 235
    .line 236
    invoke-virtual {p0, p1, v0}, Ll/j0v0;->h(Ll/k5u0;Lcom/google/android/gms/internal/ads/zzdzc;)V

    .line 237
    .line 238
    .line 239
    :cond_5
    :goto_1
    return-void
.end method

.method public final b()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/szu0;->k:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/szu0;->b:Landroid/hardware/SensorManager;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Ll/szu0;->c:Landroid/hardware/Sensor;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, p0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Ll/szu0;->k:Z

    .line 19
    .line 20
    const-string v0, "Stopped listening for flick gestures."

    .line 21
    .line 22
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit p0

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw v0
.end method

.method public final c()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-object v0, Ll/sgs0;->W8:Ll/dgs0;

    .line 3
    .line 4
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    monitor-exit p0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    iget-boolean v0, p0, Ll/szu0;->k:Z

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Ll/szu0;->b:Landroid/hardware/SensorManager;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v1, p0, Ll/szu0;->c:Landroid/hardware/Sensor;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    const/4 v2, 0x2

    .line 37
    invoke-virtual {v0, p0, v1, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    iput-boolean v0, p0, Ll/szu0;->k:Z

    .line 42
    .line 43
    const-string v0, "Listening for flick gestures."

    .line 44
    .line 45
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    iget-object v0, p0, Ll/szu0;->b:Landroid/hardware/SensorManager;

    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    iget-object p0, p0, Ll/szu0;->c:Landroid/hardware/Sensor;

    .line 54
    .line 55
    if-nez p0, :cond_2

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    return-void

    .line 59
    :cond_3
    :goto_0
    const-string p0, "Flick detection failed to initialize. Failed to obtain gyroscope."

    .line 60
    .line 61
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    throw v0
.end method

.method public final d(Ll/rzu0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/szu0;->j:Ll/rzu0;

    .line 2
    .line 3
    return-void
.end method
