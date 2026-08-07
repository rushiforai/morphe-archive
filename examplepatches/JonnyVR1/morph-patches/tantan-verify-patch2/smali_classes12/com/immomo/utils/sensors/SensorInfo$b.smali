.class Lcom/immomo/utils/sensors/SensorInfo$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/utils/sensors/SensorInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/utils/sensors/SensorInfo;


# direct methods
.method private constructor <init>(Lcom/immomo/utils/sensors/SensorInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/utils/sensors/SensorInfo$b;->a:Lcom/immomo/utils/sensors/SensorInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/immomo/utils/sensors/SensorInfo;Lcom/immomo/utils/sensors/SensorInfo$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/immomo/utils/sensors/SensorInfo$b;-><init>(Lcom/immomo/utils/sensors/SensorInfo;)V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 5

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
    const/4 v1, 0x2

    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x1

    .line 10
    if-eq v0, v3, :cond_1

    .line 11
    .line 12
    const/4 p0, 0x4

    .line 13
    if-eq v0, p0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {v3}, Lcom/immomo/utils/sensors/SensorInfo;->b(Z)Z

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 20
    .line 21
    aget p1, p0, v2

    .line 22
    .line 23
    sput p1, Lcom/immomo/utils/sensors/SensorInfo;->n:F

    .line 24
    .line 25
    aget p1, p0, v3

    .line 26
    .line 27
    sput p1, Lcom/immomo/utils/sensors/SensorInfo;->o:F

    .line 28
    .line 29
    aget p0, p0, v1

    .line 30
    .line 31
    sput p0, Lcom/immomo/utils/sensors/SensorInfo;->p:F

    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    sget v0, Lcom/immomo/utils/sensors/SensorInfo;->h:F

    .line 35
    .line 36
    const/4 v4, 0x0

    .line 37
    cmpl-float v0, v0, v4

    .line 38
    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    sget v0, Lcom/immomo/utils/sensors/SensorInfo;->i:F

    .line 42
    .line 43
    cmpl-float v0, v0, v4

    .line 44
    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    sget v0, Lcom/immomo/utils/sensors/SensorInfo;->j:F

    .line 48
    .line 49
    cmpl-float v0, v0, v4

    .line 50
    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    iget-object p0, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 54
    .line 55
    aget p0, p0, v2

    .line 56
    .line 57
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    sput p0, Lcom/immomo/utils/sensors/SensorInfo;->h:F

    .line 62
    .line 63
    iget-object p0, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 64
    .line 65
    aget p0, p0, v3

    .line 66
    .line 67
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    sput p0, Lcom/immomo/utils/sensors/SensorInfo;->i:F

    .line 72
    .line 73
    iget-object p0, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 74
    .line 75
    aget p0, p0, v1

    .line 76
    .line 77
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    sput p0, Lcom/immomo/utils/sensors/SensorInfo;->j:F

    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 85
    .line 86
    aget v0, v0, v2

    .line 87
    .line 88
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    sput v0, Lcom/immomo/utils/sensors/SensorInfo;->k:F

    .line 93
    .line 94
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 95
    .line 96
    aget v0, v0, v3

    .line 97
    .line 98
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    sput v0, Lcom/immomo/utils/sensors/SensorInfo;->l:F

    .line 103
    .line 104
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 105
    .line 106
    aget p1, p1, v1

    .line 107
    .line 108
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    sput p1, Lcom/immomo/utils/sensors/SensorInfo;->m:F

    .line 113
    .line 114
    sget p1, Lcom/immomo/utils/sensors/SensorInfo;->h:F

    .line 115
    .line 116
    sget v0, Lcom/immomo/utils/sensors/SensorInfo;->k:F

    .line 117
    .line 118
    cmpl-float p1, p1, v0

    .line 119
    .line 120
    if-nez p1, :cond_5

    .line 121
    .line 122
    sget p1, Lcom/immomo/utils/sensors/SensorInfo;->i:F

    .line 123
    .line 124
    sget v0, Lcom/immomo/utils/sensors/SensorInfo;->l:F

    .line 125
    .line 126
    cmpl-float p1, p1, v0

    .line 127
    .line 128
    if-nez p1, :cond_5

    .line 129
    .line 130
    sget p1, Lcom/immomo/utils/sensors/SensorInfo;->j:F

    .line 131
    .line 132
    sget v0, Lcom/immomo/utils/sensors/SensorInfo;->m:F

    .line 133
    .line 134
    cmpl-float p1, p1, v0

    .line 135
    .line 136
    if-eqz p1, :cond_3

    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_3
    sget p1, Lcom/immomo/utils/sensors/SensorInfo;->g:I

    .line 140
    .line 141
    const/4 v0, 0x3

    .line 142
    if-le p1, v0, :cond_4

    .line 143
    .line 144
    iget-object p0, p0, Lcom/immomo/utils/sensors/SensorInfo$b;->a:Lcom/immomo/utils/sensors/SensorInfo;

    .line 145
    .line 146
    invoke-virtual {p0}, Lcom/immomo/utils/sensors/SensorInfo;->q()V

    .line 147
    .line 148
    .line 149
    :cond_4
    sget p0, Lcom/immomo/utils/sensors/SensorInfo;->g:I

    .line 150
    .line 151
    add-int/2addr p0, v3

    .line 152
    sput p0, Lcom/immomo/utils/sensors/SensorInfo;->g:I

    .line 153
    .line 154
    return-void

    .line 155
    :cond_5
    :goto_0
    invoke-static {v3}, Lcom/immomo/utils/sensors/SensorInfo;->a(Z)Z

    .line 156
    .line 157
    .line 158
    iget-object p0, p0, Lcom/immomo/utils/sensors/SensorInfo$b;->a:Lcom/immomo/utils/sensors/SensorInfo;

    .line 159
    .line 160
    invoke-virtual {p0}, Lcom/immomo/utils/sensors/SensorInfo;->q()V

    .line 161
    .line 162
    .line 163
    return-void
.end method
