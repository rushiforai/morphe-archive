.class public Ll/bqe0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Landroid/hardware/SensorManager;

.field private b:Landroid/hardware/Sensor;

.field private c:Landroid/hardware/Sensor;

.field private d:Landroid/hardware/Sensor;

.field private e:Landroid/hardware/Sensor;

.field private f:Z

.field private g:D

.field private h:D

.field private i:D

.field private j:Z

.field private k:D

.field private l:D

.field private m:D

.field private n:Z

.field private o:D

.field private p:D

.field private q:D

.field private r:Lorg/json/JSONObject;

.field private final s:Landroid/hardware/SensorEventListener;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/bqe0;->a:Landroid/hardware/SensorManager;

    .line 6
    .line 7
    iput-object v0, p0, Ll/bqe0;->b:Landroid/hardware/Sensor;

    .line 8
    .line 9
    iput-object v0, p0, Ll/bqe0;->c:Landroid/hardware/Sensor;

    .line 10
    .line 11
    iput-object v0, p0, Ll/bqe0;->d:Landroid/hardware/Sensor;

    .line 12
    .line 13
    iput-object v0, p0, Ll/bqe0;->e:Landroid/hardware/Sensor;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Ll/bqe0;->f:Z

    .line 17
    .line 18
    const-wide/16 v2, 0x0

    .line 19
    .line 20
    iput-wide v2, p0, Ll/bqe0;->g:D

    .line 21
    .line 22
    iput-wide v2, p0, Ll/bqe0;->h:D

    .line 23
    .line 24
    iput-wide v2, p0, Ll/bqe0;->i:D

    .line 25
    .line 26
    iput-boolean v1, p0, Ll/bqe0;->j:Z

    .line 27
    .line 28
    iput-wide v2, p0, Ll/bqe0;->k:D

    .line 29
    .line 30
    iput-wide v2, p0, Ll/bqe0;->l:D

    .line 31
    .line 32
    iput-wide v2, p0, Ll/bqe0;->m:D

    .line 33
    .line 34
    iput-boolean v1, p0, Ll/bqe0;->n:Z

    .line 35
    .line 36
    iput-wide v2, p0, Ll/bqe0;->o:D

    .line 37
    .line 38
    iput-wide v2, p0, Ll/bqe0;->p:D

    .line 39
    .line 40
    iput-wide v2, p0, Ll/bqe0;->q:D

    .line 41
    .line 42
    iput-object v0, p0, Ll/bqe0;->r:Lorg/json/JSONObject;

    .line 43
    .line 44
    new-instance v0, Ll/bqe0$a;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/bqe0$a;-><init>(Ll/bqe0;)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Ll/bqe0;->s:Landroid/hardware/SensorEventListener;

    .line 50
    .line 51
    new-instance v0, Lorg/json/JSONObject;

    .line 52
    .line 53
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ll/bqe0;->r:Lorg/json/JSONObject;

    .line 57
    .line 58
    const/16 v1, 0xd

    .line 59
    .line 60
    :try_start_0
    new-array v2, v1, [B

    .line 61
    .line 62
    fill-array-data v2, :array_0

    .line 63
    .line 64
    .line 65
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    const/4 v3, 0x0

    .line 70
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/bqe0;->r:Lorg/json/JSONObject;

    .line 74
    .line 75
    const/16 v2, 0xb

    .line 76
    .line 77
    new-array v2, v2, [B

    .line 78
    .line 79
    fill-array-data v2, :array_1

    .line 80
    .line 81
    .line 82
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/bqe0;->r:Lorg/json/JSONObject;

    .line 90
    .line 91
    const/16 v2, 0x9

    .line 92
    .line 93
    new-array v2, v2, [B

    .line 94
    .line 95
    fill-array-data v2, :array_2

    .line 96
    .line 97
    .line 98
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Ll/bqe0;->r:Lorg/json/JSONObject;

    .line 106
    .line 107
    new-array v0, v1, [B

    .line 108
    .line 109
    fill-array-data v0, :array_3

    .line 110
    .line 111
    .line 112
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {p0, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    .line 118
    .line 119
    :catch_0
    return-void

    .line 120
    nop

    .line 121
    :array_0
    .array-data 1
        0x43t
        0x12t
        0x54t
        0x47t
        0x3et
        0x2t
        0x55t
        0x12t
        0x54t
        0x54t
        0x15t
        0x9t
        0x42t
    .end array-data

    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    nop

    .line 133
    :array_1
    .array-data 1
        0x5ft
        0x14t
        0x58t
        0x52t
        0xft
        0x12t
        0x51t
        0x12t
        0x58t
        0x58t
        0xft
    .end array-data

    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    :array_2
    .array-data 1
        0x57t
        0x1ft
        0x43t
        0x58t
        0x12t
        0x5t
        0x5ft
        0x16t
        0x54t
    .end array-data

    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    nop

    .line 153
    :array_3
    .array-data 1
        0x51t
        0x5t
        0x52t
        0x52t
        0xdt
        0x3t
        0x42t
        0x9t
        0x5ct
        0x52t
        0x15t
        0x3t
        0x42t
    .end array-data
.end method

.method public static synthetic a(Ll/bqe0;)Lorg/json/JSONObject;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bqe0;->r:Lorg/json/JSONObject;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/bqe0;)D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/bqe0;->i:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic c(Ll/bqe0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bqe0;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Ll/bqe0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bqe0;->n:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic e(Ll/bqe0;D)D
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/bqe0;->i:D

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic f(Ll/bqe0;)D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/bqe0;->p:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic g(Ll/bqe0;D)D
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/bqe0;->p:D

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic h(Ll/bqe0;D)D
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/bqe0;->q:D

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic i(Ll/bqe0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bqe0;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic j(Ll/bqe0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bqe0;->f:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic k(Ll/bqe0;)D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/bqe0;->h:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic l(Ll/bqe0;D)D
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/bqe0;->h:D

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic m(Ll/bqe0;D)D
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/bqe0;->g:D

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic n(Ll/bqe0;)D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/bqe0;->m:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic o(Ll/bqe0;D)D
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/bqe0;->m:D

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic p(Ll/bqe0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bqe0;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic q(Ll/bqe0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bqe0;->j:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic r(Ll/bqe0;)D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/bqe0;->l:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic s(Ll/bqe0;D)D
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/bqe0;->l:D

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic t(Ll/bqe0;D)D
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/bqe0;->k:D

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic u(Ll/bqe0;)D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/bqe0;->o:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic v(Ll/bqe0;D)D
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/bqe0;->o:D

    .line 2
    .line 3
    return-wide p1
.end method

.method private y(ILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bqe0;->a:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/bqe0;->a:Landroid/hardware/SensorManager;

    .line 10
    .line 11
    iget-object p0, p0, Ll/bqe0;->s:Landroid/hardware/SensorEventListener;

    .line 12
    .line 13
    const/4 v0, 0x3

    .line 14
    invoke-virtual {p2, p0, p1, v0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    :try_start_0
    iget-object p0, p0, Ll/bqe0;->r:Lorg/json/JSONObject;

    .line 19
    .line 20
    const/4 p1, -0x1

    .line 21
    invoke-virtual {p0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    :catch_0
    return-void
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/bqe0;->a:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/bqe0;->s:Landroid/hardware/SensorEventListener;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    :catchall_0
    :cond_0
    return-void
.end method

.method public w()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/bqe0;->r:Lorg/json/JSONObject;

    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public x(FFF)D
    .locals 0

    .line 1
    mul-float/2addr p1, p1

    .line 2
    mul-float/2addr p2, p2

    .line 3
    add-float/2addr p1, p2

    .line 4
    mul-float/2addr p3, p3

    .line 5
    add-float/2addr p1, p3

    .line 6
    float-to-double p0, p1

    .line 7
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method public z(Landroid/content/Context;)V
    .locals 2

    .line 1
    const/4 v0, 0x6

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Landroid/hardware/SensorManager;

    .line 16
    .line 17
    iput-object p1, p0, Ll/bqe0;->a:Landroid/hardware/SensorManager;

    .line 18
    .line 19
    const/16 p1, 0xd

    .line 20
    .line 21
    new-array v0, p1, [B

    .line 22
    .line 23
    fill-array-data v0, :array_1

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/16 v1, 0x12

    .line 31
    .line 32
    invoke-direct {p0, v1, v0}, Ll/bqe0;->y(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const/16 v0, 0x9

    .line 36
    .line 37
    new-array v0, v0, [B

    .line 38
    .line 39
    fill-array-data v0, :array_2

    .line 40
    .line 41
    .line 42
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/4 v1, 0x4

    .line 47
    invoke-direct {p0, v1, v0}, Ll/bqe0;->y(ILjava/lang/String;)V

    .line 48
    .line 49
    .line 50
    new-array p1, p1, [B

    .line 51
    .line 52
    fill-array-data p1, :array_3

    .line 53
    .line 54
    .line 55
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const/4 v0, 0x1

    .line 60
    invoke-direct {p0, v0, p1}, Ll/bqe0;->y(ILjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    const/16 p1, 0xb

    .line 64
    .line 65
    new-array p1, p1, [B

    .line 66
    .line 67
    fill-array-data p1, :array_4

    .line 68
    .line 69
    .line 70
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const/4 v0, 0x3

    .line 75
    invoke-direct {p0, v0, p1}, Ll/bqe0;->y(ILjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :array_0
    .array-data 1
        0x43t
        0x3t
        0x5ft
        0x44t
        0xet
        0x14t
    .end array-data

    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    nop

    .line 87
    :array_1
    .array-data 1
        0x43t
        0x12t
        0x54t
        0x47t
        0x3et
        0x2t
        0x55t
        0x12t
        0x54t
        0x54t
        0x15t
        0x9t
        0x42t
    .end array-data

    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    nop

    .line 99
    :array_2
    .array-data 1
        0x57t
        0x1ft
        0x43t
        0x58t
        0x12t
        0x5t
        0x5ft
        0x16t
        0x54t
    .end array-data

    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    nop

    .line 109
    :array_3
    .array-data 1
        0x51t
        0x5t
        0x52t
        0x52t
        0xdt
        0x3t
        0x42t
        0x9t
        0x5ct
        0x52t
        0x15t
        0x3t
        0x42t
    .end array-data

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    nop

    .line 121
    :array_4
    .array-data 1
        0x5ft
        0x14t
        0x58t
        0x52t
        0xft
        0x12t
        0x51t
        0x12t
        0x58t
        0x58t
        0xft
    .end array-data
.end method
