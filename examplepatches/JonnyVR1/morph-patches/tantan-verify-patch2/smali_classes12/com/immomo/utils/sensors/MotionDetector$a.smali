.class Lcom/immomo/utils/sensors/MotionDetector$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/utils/sensors/MotionDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/utils/sensors/MotionDetector;


# direct methods
.method public constructor <init>(Lcom/immomo/utils/sensors/MotionDetector;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 8

    .line 1
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 2
    .line 3
    if-eqz p1, :cond_7

    .line 4
    .line 5
    array-length v0, p1

    .line 6
    const/4 v1, 0x3

    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    aget v1, p1, v0

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    aget v2, p1, v2

    .line 16
    .line 17
    const/4 v3, 0x2

    .line 18
    aget p1, p1, v3

    .line 19
    .line 20
    iget-object v3, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 21
    .line 22
    invoke-static {v3}, Lcom/immomo/utils/sensors/MotionDetector;->a(Lcom/immomo/utils/sensors/MotionDetector;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    monitor-enter v3

    .line 27
    :try_start_0
    iget-object v4, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 28
    .line 29
    invoke-static {v4}, Lcom/immomo/utils/sensors/MotionDetector;->b(Lcom/immomo/utils/sensors/MotionDetector;)Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    sget-object v5, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->MOVING:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 34
    .line 35
    if-ne v4, v5, :cond_1

    .line 36
    .line 37
    monitor-exit v3

    .line 38
    return-void

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto/16 :goto_1

    .line 41
    .line 42
    :cond_1
    iget-object v4, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 43
    .line 44
    invoke-static {v4}, Lcom/immomo/utils/sensors/MotionDetector;->d(Lcom/immomo/utils/sensors/MotionDetector;)Z

    .line 45
    .line 46
    .line 47
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    iget-object v6, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 49
    .line 50
    if-eqz v4, :cond_2

    .line 51
    .line 52
    :try_start_1
    invoke-static {v6, v1}, Lcom/immomo/utils/sensors/MotionDetector;->g(Lcom/immomo/utils/sensors/MotionDetector;F)F

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 56
    .line 57
    invoke-static {v1, v2}, Lcom/immomo/utils/sensors/MotionDetector;->i(Lcom/immomo/utils/sensors/MotionDetector;F)F

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 61
    .line 62
    invoke-static {v1, p1}, Lcom/immomo/utils/sensors/MotionDetector;->k(Lcom/immomo/utils/sensors/MotionDetector;F)F

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 66
    .line 67
    invoke-static {p0, v0}, Lcom/immomo/utils/sensors/MotionDetector;->e(Lcom/immomo/utils/sensors/MotionDetector;Z)Z

    .line 68
    .line 69
    .line 70
    monitor-exit v3

    .line 71
    return-void

    .line 72
    :cond_2
    invoke-static {v6}, Lcom/immomo/utils/sensors/MotionDetector;->f(Lcom/immomo/utils/sensors/MotionDetector;)F

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    sub-float/2addr v4, v1

    .line 77
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    iget-object v6, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 82
    .line 83
    invoke-static {v6}, Lcom/immomo/utils/sensors/MotionDetector;->h(Lcom/immomo/utils/sensors/MotionDetector;)F

    .line 84
    .line 85
    .line 86
    move-result v6

    .line 87
    sub-float/2addr v6, v2

    .line 88
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    iget-object v7, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 93
    .line 94
    invoke-static {v7}, Lcom/immomo/utils/sensors/MotionDetector;->j(Lcom/immomo/utils/sensors/MotionDetector;)F

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    sub-float/2addr v7, p1

    .line 99
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    .line 100
    .line 101
    .line 102
    move-result v7

    .line 103
    add-float/2addr v4, v6

    .line 104
    add-float/2addr v4, v7

    .line 105
    const/high16 v6, 0x3f000000    # 0.5f

    .line 106
    .line 107
    cmpl-float v6, v4, v6

    .line 108
    .line 109
    if-lez v6, :cond_3

    .line 110
    .line 111
    iget-object v4, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 112
    .line 113
    invoke-static {v4, v5}, Lcom/immomo/utils/sensors/MotionDetector;->c(Lcom/immomo/utils/sensors/MotionDetector;Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;)Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 114
    .line 115
    .line 116
    iget-object v4, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 117
    .line 118
    invoke-static {v4, v0}, Lcom/immomo/utils/sensors/MotionDetector;->m(Lcom/immomo/utils/sensors/MotionDetector;I)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_3
    const v5, 0x3e4ccccd    # 0.2f

    .line 123
    .line 124
    .line 125
    cmpl-float v4, v4, v5

    .line 126
    .line 127
    iget-object v5, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 128
    .line 129
    if-lez v4, :cond_5

    .line 130
    .line 131
    :try_start_2
    invoke-static {v5}, Lcom/immomo/utils/sensors/MotionDetector;->b(Lcom/immomo/utils/sensors/MotionDetector;)Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    sget-object v5, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->STILL:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 136
    .line 137
    if-eq v4, v5, :cond_4

    .line 138
    .line 139
    iget-object v4, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 140
    .line 141
    invoke-static {v4}, Lcom/immomo/utils/sensors/MotionDetector;->b(Lcom/immomo/utils/sensors/MotionDetector;)Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    sget-object v5, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->UNKNOWN:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 146
    .line 147
    if-ne v4, v5, :cond_6

    .line 148
    .line 149
    :cond_4
    iget-object v4, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 150
    .line 151
    sget-object v5, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->VIBRATING:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 152
    .line 153
    invoke-static {v4, v5}, Lcom/immomo/utils/sensors/MotionDetector;->c(Lcom/immomo/utils/sensors/MotionDetector;Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;)Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 154
    .line 155
    .line 156
    iget-object v4, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 157
    .line 158
    invoke-static {v4, v0}, Lcom/immomo/utils/sensors/MotionDetector;->m(Lcom/immomo/utils/sensors/MotionDetector;I)I

    .line 159
    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_5
    invoke-static {v5}, Lcom/immomo/utils/sensors/MotionDetector;->n(Lcom/immomo/utils/sensors/MotionDetector;)I

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 166
    .line 167
    invoke-static {v0}, Lcom/immomo/utils/sensors/MotionDetector;->l(Lcom/immomo/utils/sensors/MotionDetector;)I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    const/16 v4, 0xa

    .line 172
    .line 173
    if-lt v0, v4, :cond_6

    .line 174
    .line 175
    iget-object v0, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 176
    .line 177
    invoke-static {v0}, Lcom/immomo/utils/sensors/MotionDetector;->b(Lcom/immomo/utils/sensors/MotionDetector;)Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    sget-object v4, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->UNKNOWN:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 182
    .line 183
    if-ne v0, v4, :cond_6

    .line 184
    .line 185
    iget-object v0, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 186
    .line 187
    sget-object v4, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->STILL:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 188
    .line 189
    invoke-static {v0, v4}, Lcom/immomo/utils/sensors/MotionDetector;->c(Lcom/immomo/utils/sensors/MotionDetector;Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;)Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 190
    .line 191
    .line 192
    :cond_6
    :goto_0
    iget-object v0, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 193
    .line 194
    invoke-static {v0, v1}, Lcom/immomo/utils/sensors/MotionDetector;->g(Lcom/immomo/utils/sensors/MotionDetector;F)F

    .line 195
    .line 196
    .line 197
    iget-object v0, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 198
    .line 199
    invoke-static {v0, v2}, Lcom/immomo/utils/sensors/MotionDetector;->i(Lcom/immomo/utils/sensors/MotionDetector;F)F

    .line 200
    .line 201
    .line 202
    iget-object p0, p0, Lcom/immomo/utils/sensors/MotionDetector$a;->a:Lcom/immomo/utils/sensors/MotionDetector;

    .line 203
    .line 204
    invoke-static {p0, p1}, Lcom/immomo/utils/sensors/MotionDetector;->k(Lcom/immomo/utils/sensors/MotionDetector;F)F

    .line 205
    .line 206
    .line 207
    monitor-exit v3

    .line 208
    return-void

    .line 209
    :goto_1
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 210
    throw p0

    .line 211
    :cond_7
    :goto_2
    return-void
.end method
