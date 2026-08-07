.class Ll/lwk$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/lwk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/lwk;


# direct methods
.method public constructor <init>(Ll/lwk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lwk$a;->a:Ll/lwk;

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

    .line 1
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/lwk$a;->a:Ll/lwk;

    .line 2
    .line 3
    invoke-static {v0}, Ll/lwk;->a(Ll/lwk;)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-wide v0, p1, Landroid/hardware/SensorEvent;->timestamp:J

    .line 13
    .line 14
    long-to-float v0, v0

    .line 15
    iget-object v1, p0, Ll/lwk$a;->a:Ll/lwk;

    .line 16
    .line 17
    invoke-static {v1}, Ll/lwk;->a(Ll/lwk;)F

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    sub-float/2addr v0, v1

    .line 22
    const v1, 0x3089705f    # 1.0E-9f

    .line 23
    .line 24
    .line 25
    mul-float/2addr v0, v1

    .line 26
    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    aget v3, v1, v2

    .line 30
    .line 31
    const/4 v4, 0x1

    .line 32
    aget v5, v1, v4

    .line 33
    .line 34
    const/4 v6, 0x2

    .line 35
    aget v1, v1, v6

    .line 36
    .line 37
    mul-float/2addr v3, v3

    .line 38
    mul-float/2addr v5, v5

    .line 39
    add-float/2addr v3, v5

    .line 40
    mul-float/2addr v1, v1

    .line 41
    add-float/2addr v3, v1

    .line 42
    float-to-double v7, v3

    .line 43
    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    .line 44
    .line 45
    .line 46
    move-result-wide v7

    .line 47
    double-to-float v1, v7

    .line 48
    iget-object v3, p0, Ll/lwk$a;->a:Ll/lwk;

    .line 49
    .line 50
    invoke-static {v3}, Ll/lwk;->c(Ll/lwk;)[F

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    aget v5, v3, v2

    .line 55
    .line 56
    iget-object v7, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 57
    .line 58
    aget v7, v7, v2

    .line 59
    .line 60
    mul-float/2addr v7, v0

    .line 61
    add-float/2addr v5, v7

    .line 62
    aput v5, v3, v2

    .line 63
    .line 64
    iget-object v3, p0, Ll/lwk$a;->a:Ll/lwk;

    .line 65
    .line 66
    invoke-static {v3}, Ll/lwk;->c(Ll/lwk;)[F

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    aget v5, v3, v4

    .line 71
    .line 72
    iget-object v7, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 73
    .line 74
    aget v7, v7, v4

    .line 75
    .line 76
    mul-float/2addr v7, v0

    .line 77
    add-float/2addr v5, v7

    .line 78
    aput v5, v3, v4

    .line 79
    .line 80
    iget-object v3, p0, Ll/lwk$a;->a:Ll/lwk;

    .line 81
    .line 82
    invoke-static {v3}, Ll/lwk;->c(Ll/lwk;)[F

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    aget v5, v3, v6

    .line 87
    .line 88
    iget-object v7, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 89
    .line 90
    aget v7, v7, v6

    .line 91
    .line 92
    mul-float/2addr v7, v0

    .line 93
    add-float/2addr v5, v7

    .line 94
    aput v5, v3, v6

    .line 95
    .line 96
    iget-object v0, p0, Ll/lwk$a;->a:Ll/lwk;

    .line 97
    .line 98
    invoke-static {v0}, Ll/lwk;->c(Ll/lwk;)[F

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    aget v0, v0, v2

    .line 103
    .line 104
    iget-object v3, p0, Ll/lwk$a;->a:Ll/lwk;

    .line 105
    .line 106
    invoke-static {v3}, Ll/lwk;->c(Ll/lwk;)[F

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    aget v2, v3, v2

    .line 111
    .line 112
    mul-float/2addr v0, v2

    .line 113
    iget-object v2, p0, Ll/lwk$a;->a:Ll/lwk;

    .line 114
    .line 115
    invoke-static {v2}, Ll/lwk;->c(Ll/lwk;)[F

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    aget v2, v2, v4

    .line 120
    .line 121
    iget-object v3, p0, Ll/lwk$a;->a:Ll/lwk;

    .line 122
    .line 123
    invoke-static {v3}, Ll/lwk;->c(Ll/lwk;)[F

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    aget v3, v3, v4

    .line 128
    .line 129
    mul-float/2addr v2, v3

    .line 130
    add-float/2addr v0, v2

    .line 131
    iget-object v2, p0, Ll/lwk$a;->a:Ll/lwk;

    .line 132
    .line 133
    invoke-static {v2}, Ll/lwk;->c(Ll/lwk;)[F

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    aget v2, v2, v6

    .line 138
    .line 139
    iget-object v3, p0, Ll/lwk$a;->a:Ll/lwk;

    .line 140
    .line 141
    invoke-static {v3}, Ll/lwk;->c(Ll/lwk;)[F

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    aget v3, v3, v6

    .line 146
    .line 147
    mul-float/2addr v2, v3

    .line 148
    add-float/2addr v0, v2

    .line 149
    float-to-double v2, v0

    .line 150
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    .line 151
    .line 152
    .line 153
    move-result-wide v2

    .line 154
    double-to-float v0, v2

    .line 155
    const/high16 v2, 0x3f000000    # 0.5f

    .line 156
    .line 157
    cmpl-float v3, v1, v2

    .line 158
    .line 159
    if-gtz v3, :cond_0

    .line 160
    .line 161
    cmpl-float v2, v0, v2

    .line 162
    .line 163
    if-lez v2, :cond_2

    .line 164
    .line 165
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    const-string v3, "onSensorChanged omegaMagnitude = "

    .line 168
    .line 169
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v1, " angle = "

    .line 176
    .line 177
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    const-string v1, "Gyro"

    .line 188
    .line 189
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    iget-object v0, p0, Ll/lwk$a;->a:Ll/lwk;

    .line 193
    .line 194
    invoke-static {v0}, Ll/lwk;->d(Ll/lwk;)Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    if-eqz v1, :cond_1

    .line 207
    .line 208
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    check-cast v1, Ll/lwk$b;

    .line 213
    .line 214
    invoke-interface {v1}, Ll/lwk$b;->a()V

    .line 215
    .line 216
    .line 217
    goto :goto_0

    .line 218
    :cond_1
    iget-object v0, p0, Ll/lwk$a;->a:Ll/lwk;

    .line 219
    .line 220
    invoke-static {v0}, Ll/lwk;->e(Ll/lwk;)V

    .line 221
    .line 222
    .line 223
    :cond_2
    iget-object p0, p0, Ll/lwk$a;->a:Ll/lwk;

    .line 224
    .line 225
    iget-wide v0, p1, Landroid/hardware/SensorEvent;->timestamp:J

    .line 226
    .line 227
    long-to-float p1, v0

    .line 228
    invoke-static {p0, p1}, Ll/lwk;->b(Ll/lwk;F)F

    .line 229
    .line 230
    .line 231
    return-void
.end method
