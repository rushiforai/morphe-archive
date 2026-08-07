.class Ltech/sud/runtime/component/c/i$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/c/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private a:Ltech/sud/runtime/core/b;

.field private b:I

.field private c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/core/b;)V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const-string v0, "low"

    iput-object v0, p0, Ltech/sud/runtime/component/c/i$b;->c:Ljava/lang/String;

    .line 15
    iput-object p1, p0, Ltech/sud/runtime/component/c/i$b;->a:Ltech/sud/runtime/core/b;

    return-void
.end method

.method public constructor <init>(Ltech/sud/runtime/core/b;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "low"

    .line 5
    .line 6
    iput-object v0, p0, Ltech/sud/runtime/component/c/i$b;->c:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ltech/sud/runtime/component/c/i$b;->a:Ltech/sud/runtime/core/b;

    .line 9
    .line 10
    iput p2, p0, Ltech/sud/runtime/component/c/i$b;->b:I

    .line 11
    .line 12
    return-void
.end method

.method private a(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/c/i$b;->a:Ltech/sud/runtime/core/b;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, Ltech/sud/runtime/core/b;->a(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/hardware/Sensor;->getType()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x3

    .line 6
    if-ne p1, v0, :cond_2

    .line 7
    .line 8
    const/4 p1, 0x2

    .line 9
    if-eq p2, p1, :cond_1

    .line 10
    .line 11
    if-eq p2, v0, :cond_0

    .line 12
    .line 13
    const-string p1, "low"

    .line 14
    .line 15
    iput-object p1, p0, Ltech/sud/runtime/component/c/i$b;->c:Ljava/lang/String;

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const-string p1, "high"

    .line 19
    .line 20
    iput-object p1, p0, Ltech/sud/runtime/component/c/i$b;->c:Ljava/lang/String;

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const-string p1, "medium"

    .line 24
    .line 25
    iput-object p1, p0, Ltech/sud/runtime/component/c/i$b;->c:Ljava/lang/String;

    .line 26
    .line 27
    :cond_2
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 11

    .line 1
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "z"

    .line 8
    .line 9
    const-string v2, "y"

    .line 10
    .line 11
    const-string v3, "x"

    .line 12
    .line 13
    const/4 v4, 0x2

    .line 14
    const/4 v5, 0x0

    .line 15
    const/4 v6, 0x1

    .line 16
    if-eq v0, v6, :cond_3

    .line 17
    .line 18
    const/4 v7, 0x3

    .line 19
    if-eq v0, v7, :cond_1

    .line 20
    .line 21
    const/4 v7, 0x4

    .line 22
    if-eq v0, v7, :cond_0

    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    .line 27
    .line 28
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 29
    .line 30
    .line 31
    :try_start_0
    iget-object v7, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 32
    .line 33
    aget v5, v7, v5

    .line 34
    .line 35
    float-to-double v7, v5

    .line 36
    invoke-virtual {v0, v3, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 37
    .line 38
    .line 39
    iget-object v3, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 40
    .line 41
    aget v3, v3, v6

    .line 42
    .line 43
    float-to-double v5, v3

    .line 44
    invoke-virtual {v0, v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 45
    .line 46
    .line 47
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 48
    .line 49
    aget p1, p1, v4

    .line 50
    .line 51
    float-to-double v2, p1

    .line 52
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    .line 55
    :catch_0
    const-string p1, "GyroscopeChange"

    .line 56
    .line 57
    invoke-direct {p0, p1, v0}, Ltech/sud/runtime/component/c/i$b;->a(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    new-instance v0, Lorg/json/JSONObject;

    .line 62
    .line 63
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 64
    .line 65
    .line 66
    iget v1, p0, Ltech/sud/runtime/component/c/i$b;->b:I

    .line 67
    .line 68
    if-ne v1, v7, :cond_2

    .line 69
    .line 70
    :try_start_1
    const-string v1, "alpha"

    .line 71
    .line 72
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 73
    .line 74
    aget v2, v2, v5

    .line 75
    .line 76
    float-to-double v2, v2

    .line 77
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 78
    .line 79
    .line 80
    const-string v1, "beta"

    .line 81
    .line 82
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 83
    .line 84
    aget v2, v2, v6

    .line 85
    .line 86
    float-to-double v2, v2

    .line 87
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 88
    .line 89
    .line 90
    const-string v1, "gamma"

    .line 91
    .line 92
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 93
    .line 94
    aget p1, p1, v4

    .line 95
    .line 96
    float-to-double v2, p1

    .line 97
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 98
    .line 99
    .line 100
    :catch_1
    const-string p1, "DeviceMotionChange"

    .line 101
    .line 102
    invoke-direct {p0, p1, v0}, Ltech/sud/runtime/component/c/i$b;->a(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_2
    :try_start_2
    const-string v1, "direction"

    .line 107
    .line 108
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 109
    .line 110
    aget p1, p1, v5

    .line 111
    .line 112
    float-to-double v2, p1

    .line 113
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 114
    .line 115
    .line 116
    const-string p1, "accuracy"

    .line 117
    .line 118
    iget-object v1, p0, Ltech/sud/runtime/component/c/i$b;->c:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 121
    .line 122
    .line 123
    :catch_2
    const-string p1, "CompassChange"

    .line 124
    .line 125
    invoke-direct {p0, p1, v0}, Ltech/sud/runtime/component/c/i$b;->a(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 126
    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_3
    new-instance v0, Lorg/json/JSONObject;

    .line 130
    .line 131
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 132
    .line 133
    .line 134
    :try_start_3
    iget-object v7, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 135
    .line 136
    aget v5, v7, v5

    .line 137
    .line 138
    float-to-double v7, v5

    .line 139
    const-wide v9, -0x4046666666666666L    # -0.1

    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    mul-double/2addr v7, v9

    .line 145
    invoke-virtual {v0, v3, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 146
    .line 147
    .line 148
    iget-object v3, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 149
    .line 150
    aget v3, v3, v6

    .line 151
    .line 152
    float-to-double v5, v3

    .line 153
    mul-double/2addr v5, v9

    .line 154
    invoke-virtual {v0, v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 155
    .line 156
    .line 157
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 158
    .line 159
    aget p1, p1, v4

    .line 160
    .line 161
    float-to-double v2, p1

    .line 162
    mul-double/2addr v2, v9

    .line 163
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    .line 164
    .line 165
    .line 166
    :catch_3
    const-string p1, "AccelerometerChange"

    .line 167
    .line 168
    invoke-direct {p0, p1, v0}, Ltech/sud/runtime/component/c/i$b;->a(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 169
    .line 170
    .line 171
    :goto_0
    return-void
.end method
