.class public Lcom/immomo/utils/sensors/SensorInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/utils/sensors/SensorInfo$MyBroadcastReceiver;,
        Lcom/immomo/utils/sensors/SensorInfo$b;
    }
.end annotation


# static fields
.field public static g:I

.field public static h:F

.field public static i:F

.field public static j:F

.field public static k:F

.field public static l:F

.field public static m:F

.field public static n:F

.field public static o:F

.field public static p:F

.field private static q:Z

.field private static r:Z

.field private static final s:Ljava/lang/String;


# instance fields
.field public a:Landroid/hardware/Sensor;

.field public b:Landroid/hardware/Sensor;

.field private c:Landroid/hardware/SensorManager;

.field private d:I

.field e:Lcom/immomo/utils/sensors/SensorInfo$b;

.field f:Lcom/immomo/utils/sensors/SensorInfo$b;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x25

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Lcom/immomo/utils/sensors/SensorInfo;->s:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    sput v0, Lcom/immomo/utils/sensors/SensorInfo;->g:I

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    sput v1, Lcom/immomo/utils/sensors/SensorInfo;->h:F

    .line 19
    .line 20
    sput v1, Lcom/immomo/utils/sensors/SensorInfo;->i:F

    .line 21
    .line 22
    sput v1, Lcom/immomo/utils/sensors/SensorInfo;->j:F

    .line 23
    .line 24
    sput v1, Lcom/immomo/utils/sensors/SensorInfo;->k:F

    .line 25
    .line 26
    sput v1, Lcom/immomo/utils/sensors/SensorInfo;->l:F

    .line 27
    .line 28
    sput v1, Lcom/immomo/utils/sensors/SensorInfo;->m:F

    .line 29
    .line 30
    sput v1, Lcom/immomo/utils/sensors/SensorInfo;->n:F

    .line 31
    .line 32
    sput v1, Lcom/immomo/utils/sensors/SensorInfo;->o:F

    .line 33
    .line 34
    sput v1, Lcom/immomo/utils/sensors/SensorInfo;->p:F

    .line 35
    .line 36
    sput-boolean v0, Lcom/immomo/utils/sensors/SensorInfo;->q:Z

    .line 37
    .line 38
    sput-boolean v0, Lcom/immomo/utils/sensors/SensorInfo;->r:Z

    .line 39
    .line 40
    return-void

    .line 41
    :array_0
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x59t
        0x56t
        0x13t
        0x2t
        0x47t
        0x7t
        0x43t
        0x52t
        0x4ft
        0x13t
        0x43t
        0x4t
        0x1ft
        0x56t
        0x2t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x19t
        0x34t
        0x35t
        0x72t
        0x39t
        0x62t
        0x63t
        0x20t
        0x32t
        0x75t
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/immomo/utils/sensors/SensorInfo;->a:Landroid/hardware/Sensor;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/immomo/utils/sensors/SensorInfo;->b:Landroid/hardware/Sensor;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/immomo/utils/sensors/SensorInfo;->c:Landroid/hardware/SensorManager;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput v1, p0, Lcom/immomo/utils/sensors/SensorInfo;->d:I

    .line 13
    .line 14
    new-instance v1, Lcom/immomo/utils/sensors/SensorInfo$b;

    .line 15
    .line 16
    invoke-direct {v1, p0, v0}, Lcom/immomo/utils/sensors/SensorInfo$b;-><init>(Lcom/immomo/utils/sensors/SensorInfo;Lcom/immomo/utils/sensors/SensorInfo$a;)V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/immomo/utils/sensors/SensorInfo;->e:Lcom/immomo/utils/sensors/SensorInfo$b;

    .line 20
    .line 21
    new-instance v1, Lcom/immomo/utils/sensors/SensorInfo$b;

    .line 22
    .line 23
    invoke-direct {v1, p0, v0}, Lcom/immomo/utils/sensors/SensorInfo$b;-><init>(Lcom/immomo/utils/sensors/SensorInfo;Lcom/immomo/utils/sensors/SensorInfo$a;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/immomo/utils/sensors/SensorInfo;->f:Lcom/immomo/utils/sensors/SensorInfo$b;

    .line 27
    .line 28
    new-instance v1, Landroid/content/IntentFilter;

    .line 29
    .line 30
    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 31
    .line 32
    .line 33
    const/16 v2, 0x25

    .line 34
    .line 35
    new-array v2, v2, [B

    .line 36
    .line 37
    fill-array-data v2, :array_0

    .line 38
    .line 39
    .line 40
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    new-instance v2, Lcom/immomo/utils/sensors/SensorInfo$MyBroadcastReceiver;

    .line 48
    .line 49
    invoke-direct {v2, p0, v0}, Lcom/immomo/utils/sensors/SensorInfo$MyBroadcastReceiver;-><init>(Lcom/immomo/utils/sensors/SensorInfo;Lcom/immomo/utils/sensors/SensorInfo$a;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p1, v2, v1}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    const/4 v0, 0x6

    .line 56
    new-array v0, v0, [B

    .line 57
    .line 58
    fill-array-data v0, :array_1

    .line 59
    .line 60
    .line 61
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Landroid/hardware/SensorManager;

    .line 70
    .line 71
    iput-object v0, p0, Lcom/immomo/utils/sensors/SensorInfo;->c:Landroid/hardware/SensorManager;

    .line 72
    .line 73
    const/4 v1, 0x1

    .line 74
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Lcom/immomo/utils/sensors/SensorInfo;->a:Landroid/hardware/Sensor;

    .line 79
    .line 80
    iget-object v0, p0, Lcom/immomo/utils/sensors/SensorInfo;->c:Landroid/hardware/SensorManager;

    .line 81
    .line 82
    const/4 v1, 0x4

    .line 83
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcom/immomo/utils/sensors/SensorInfo;->b:Landroid/hardware/Sensor;

    .line 88
    .line 89
    sget v0, Lcom/immomo/utils/sensors/SensorInfo;->g:I

    .line 90
    .line 91
    const/4 v1, 0x3

    .line 92
    if-gt v0, v1, :cond_0

    .line 93
    .line 94
    iget-object v0, p0, Lcom/immomo/utils/sensors/SensorInfo;->c:Landroid/hardware/SensorManager;

    .line 95
    .line 96
    iget-object v3, p0, Lcom/immomo/utils/sensors/SensorInfo;->e:Lcom/immomo/utils/sensors/SensorInfo$b;

    .line 97
    .line 98
    iget-object v4, p0, Lcom/immomo/utils/sensors/SensorInfo;->a:Landroid/hardware/Sensor;

    .line 99
    .line 100
    invoke-virtual {v0, v3, v4, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/immomo/utils/sensors/SensorInfo;->c:Landroid/hardware/SensorManager;

    .line 104
    .line 105
    iget-object v3, p0, Lcom/immomo/utils/sensors/SensorInfo;->f:Lcom/immomo/utils/sensors/SensorInfo$b;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/immomo/utils/sensors/SensorInfo;->b:Landroid/hardware/Sensor;

    .line 108
    .line 109
    invoke-virtual {v0, v3, p0, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 110
    .line 111
    .line 112
    :cond_0
    invoke-virtual {p1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    nop

    .line 117
    :array_0
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x59t
        0x56t
        0x13t
        0x2t
        0x47t
        0x7t
        0x43t
        0x52t
        0x4ft
        0x13t
        0x43t
        0x4t
        0x1ft
        0x56t
        0x2t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x19t
        0x34t
        0x35t
        0x72t
        0x39t
        0x62t
        0x63t
        0x20t
        0x32t
        0x75t
    .end array-data

    .line 118
    .line 119
    .line 120
    .line 121
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
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    nop

    .line 141
    :array_1
    .array-data 1
        0x43t
        0x3t
        0x5ft
        0x44t
        0xet
        0x14t
    .end array-data
.end method

.method public static synthetic a(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Lcom/immomo/utils/sensors/SensorInfo;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Lcom/immomo/utils/sensors/SensorInfo;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Lcom/immomo/utils/sensors/SensorInfo;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/utils/sensors/SensorInfo;->d:I

    .line 2
    .line 3
    return p1
.end method

.method private d()Ljava/lang/String;
    .locals 4

    .line 1
    const/16 p0, 0x11

    .line 2
    .line 3
    :try_start_0
    new-array p0, p0, [B

    .line 4
    .line 5
    fill-array-data p0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/16 v0, 0xe

    .line 13
    .line 14
    new-array v0, v0, [B

    .line 15
    .line 16
    fill-array-data v0, :array_1

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/16 v1, 0x25

    .line 24
    .line 25
    new-array v1, v1, [B

    .line 26
    .line 27
    fill-array-data v1, :array_2

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const/16 v2, 0xf

    .line 35
    .line 36
    new-array v2, v2, [B

    .line 37
    .line 38
    fill-array-data v2, :array_3

    .line 39
    .line 40
    .line 41
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    const/16 v3, 0x16

    .line 46
    .line 47
    new-array v3, v3, [B

    .line 48
    .line 49
    fill-array-data v3, :array_4

    .line 50
    .line 51
    .line 52
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    filled-new-array {p0, v0, v1, v2, v3}, [Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const/4 v0, 0x0

    .line 61
    :goto_0
    const/4 v1, 0x5

    .line 62
    if-ge v0, v1, :cond_1

    .line 63
    .line 64
    aget-object v1, p0, v0

    .line 65
    .line 66
    new-instance v2, Ljava/io/File;

    .line 67
    .line 68
    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_0

    .line 76
    .line 77
    const/4 p0, 0x4

    .line 78
    new-array p0, p0, [B

    .line 79
    .line 80
    fill-array-data p0, :array_5

    .line 81
    .line 82
    .line 83
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    return-object p0

    .line 88
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :catchall_0
    :cond_1
    const/4 p0, 0x4

    .line 92
    new-array p0, p0, [B

    .line 93
    .line 94
    fill-array-data p0, :array_6

    .line 95
    .line 96
    .line 97
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0

    .line 102
    nop

    .line 103
    :array_0
    .array-data 1
        0x1ft
        0x2t
        0x54t
        0x41t
        0x4et
        0x15t
        0x5ft
        0x5t
        0x5at
        0x52t
        0x15t
        0x49t
        0x41t
        0x3t
        0x5ct
        0x42t
        0x5t
    .end array-data

    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    nop

    .line 117
    :array_1
    .array-data 1
        0x1ft
        0x2t
        0x54t
        0x41t
        0x4et
        0x17t
        0x55t
        0xbt
        0x44t
        0x68t
        0x11t
        0xft
        0x40t
        0x3t
    .end array-data

    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    nop

    .line 129
    :array_2
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x15t
        0x3t
        0x5dt
        0x49t
        0x5dt
        0x5et
        0x3t
        0x49t
        0x5ct
        0xft
        0x53t
        0x54t
        0x3et
        0xbt
        0x51t
        0xat
        0x5dt
        0x58t
        0x2t
        0x39t
        0x54t
        0x3t
        0x53t
        0x42t
        0x6t
        0x39t
        0x41t
        0x3t
        0x5ct
        0x42t
        0x4ft
        0x15t
        0x5ft
    .end array-data

    .line 130
    .line 131
    .line 132
    .line 133
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
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x17t
        0x55t
        0xbt
        0x44t
        0x68t
        0x15t
        0x14t
        0x51t
        0x5t
        0x54t
    .end array-data

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    :array_4
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x15t
        0x3t
        0x5dt
        0x49t
        0x53t
        0x5et
        0xft
        0x49t
        0x41t
        0x3t
        0x5ct
        0x42t
        0x4ct
        0x16t
        0x42t
        0x9t
        0x41t
        0x44t
    .end array-data

    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    nop

    .line 181
    :array_5
    .array-data 1
        0x61t
        0x3t
        0x0t
        0x13t
    .end array-data

    .line 182
    .line 183
    .line 184
    :array_6
    .array-data 1
        0x61t
        0x3t
        0x1t
        0x13t
    .end array-data
.end method

.method private g()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    const/4 v2, 0x3

    .line 8
    :try_start_0
    invoke-direct {p0}, Lcom/immomo/utils/sensors/SensorInfo;->i()Z

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    new-array v3, v2, [B

    .line 15
    .line 16
    fill-array-data v3, :array_0

    .line 17
    .line 18
    .line 19
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-array v3, v2, [B

    .line 25
    .line 26
    fill-array-data v3, :array_1

    .line 27
    .line 28
    .line 29
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    :goto_0
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :catchall_0
    new-array v3, v1, [B

    .line 38
    .line 39
    fill-array-data v3, :array_2

    .line 40
    .line 41
    .line 42
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    :goto_1
    :try_start_1
    invoke-direct {p0}, Lcom/immomo/utils/sensors/SensorInfo;->j()Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_1

    .line 54
    .line 55
    new-array v3, v2, [B

    .line 56
    .line 57
    fill-array-data v3, :array_3

    .line 58
    .line 59
    .line 60
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    goto :goto_2

    .line 65
    :cond_1
    new-array v3, v2, [B

    .line 66
    .line 67
    fill-array-data v3, :array_4

    .line 68
    .line 69
    .line 70
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    :goto_2
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 75
    .line 76
    .line 77
    goto :goto_3

    .line 78
    :catchall_1
    new-array v3, v1, [B

    .line 79
    .line 80
    fill-array-data v3, :array_5

    .line 81
    .line 82
    .line 83
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    :goto_3
    :try_start_2
    invoke-direct {p0}, Lcom/immomo/utils/sensors/SensorInfo;->k()Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    if-eqz v3, :cond_2

    .line 95
    .line 96
    new-array v3, v2, [B

    .line 97
    .line 98
    fill-array-data v3, :array_6

    .line 99
    .line 100
    .line 101
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    goto :goto_4

    .line 106
    :cond_2
    new-array v3, v2, [B

    .line 107
    .line 108
    fill-array-data v3, :array_7

    .line 109
    .line 110
    .line 111
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    :goto_4
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 116
    .line 117
    .line 118
    goto :goto_5

    .line 119
    :catchall_2
    new-array v3, v1, [B

    .line 120
    .line 121
    fill-array-data v3, :array_8

    .line 122
    .line 123
    .line 124
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    :goto_5
    :try_start_3
    invoke-direct {p0}, Lcom/immomo/utils/sensors/SensorInfo;->l()Z

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    if-eqz v3, :cond_3

    .line 136
    .line 137
    new-array v3, v2, [B

    .line 138
    .line 139
    fill-array-data v3, :array_9

    .line 140
    .line 141
    .line 142
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    goto :goto_6

    .line 147
    :cond_3
    new-array v3, v2, [B

    .line 148
    .line 149
    fill-array-data v3, :array_a

    .line 150
    .line 151
    .line 152
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    :goto_6
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 157
    .line 158
    .line 159
    goto :goto_7

    .line 160
    :catchall_3
    new-array v3, v1, [B

    .line 161
    .line 162
    fill-array-data v3, :array_b

    .line 163
    .line 164
    .line 165
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    :goto_7
    :try_start_4
    invoke-direct {p0}, Lcom/immomo/utils/sensors/SensorInfo;->m()Z

    .line 173
    .line 174
    .line 175
    move-result v3

    .line 176
    if-eqz v3, :cond_4

    .line 177
    .line 178
    new-array v3, v2, [B

    .line 179
    .line 180
    fill-array-data v3, :array_c

    .line 181
    .line 182
    .line 183
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    goto :goto_8

    .line 188
    :cond_4
    new-array v3, v2, [B

    .line 189
    .line 190
    fill-array-data v3, :array_d

    .line 191
    .line 192
    .line 193
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    :goto_8
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 198
    .line 199
    .line 200
    goto :goto_9

    .line 201
    :catchall_4
    new-array v3, v1, [B

    .line 202
    .line 203
    fill-array-data v3, :array_e

    .line 204
    .line 205
    .line 206
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    :goto_9
    :try_start_5
    invoke-direct {p0}, Lcom/immomo/utils/sensors/SensorInfo;->o()Z

    .line 214
    .line 215
    .line 216
    move-result v3

    .line 217
    if-eqz v3, :cond_5

    .line 218
    .line 219
    new-array v3, v2, [B

    .line 220
    .line 221
    fill-array-data v3, :array_f

    .line 222
    .line 223
    .line 224
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    goto :goto_a

    .line 229
    :cond_5
    new-array v3, v2, [B

    .line 230
    .line 231
    fill-array-data v3, :array_10

    .line 232
    .line 233
    .line 234
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    :goto_a
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    .line 239
    .line 240
    .line 241
    goto :goto_b

    .line 242
    :catchall_5
    new-array v3, v1, [B

    .line 243
    .line 244
    fill-array-data v3, :array_11

    .line 245
    .line 246
    .line 247
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v3

    .line 251
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    :goto_b
    :try_start_6
    invoke-direct {p0}, Lcom/immomo/utils/sensors/SensorInfo;->p()Z

    .line 255
    .line 256
    .line 257
    move-result v3

    .line 258
    if-eqz v3, :cond_6

    .line 259
    .line 260
    new-array v3, v2, [B

    .line 261
    .line 262
    fill-array-data v3, :array_12

    .line 263
    .line 264
    .line 265
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v3

    .line 269
    goto :goto_c

    .line 270
    :cond_6
    new-array v3, v2, [B

    .line 271
    .line 272
    fill-array-data v3, :array_13

    .line 273
    .line 274
    .line 275
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v3

    .line 279
    :goto_c
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6

    .line 280
    .line 281
    .line 282
    goto :goto_d

    .line 283
    :catchall_6
    new-array v3, v1, [B

    .line 284
    .line 285
    fill-array-data v3, :array_14

    .line 286
    .line 287
    .line 288
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v3

    .line 292
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    :goto_d
    :try_start_7
    invoke-direct {p0}, Lcom/immomo/utils/sensors/SensorInfo;->n()Z

    .line 296
    .line 297
    .line 298
    move-result p0

    .line 299
    if-eqz p0, :cond_7

    .line 300
    .line 301
    new-array p0, v2, [B

    .line 302
    .line 303
    fill-array-data p0, :array_15

    .line 304
    .line 305
    .line 306
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object p0

    .line 310
    goto :goto_e

    .line 311
    :cond_7
    new-array p0, v2, [B

    .line 312
    .line 313
    fill-array-data p0, :array_16

    .line 314
    .line 315
    .line 316
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object p0

    .line 320
    :goto_e
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_7

    .line 321
    .line 322
    .line 323
    goto :goto_f

    .line 324
    :catchall_7
    new-array p0, v1, [B

    .line 325
    .line 326
    fill-array-data p0, :array_17

    .line 327
    .line 328
    .line 329
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object p0

    .line 333
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    :goto_f
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object p0

    .line 340
    return-object p0

    .line 341
    :array_0
    .array-data 1
        0x77t
        0x57t
        0x15t
    .end array-data

    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    :array_1
    .array-data 1
        0x77t
        0x56t
        0x15t
    .end array-data

    .line 348
    .line 349
    .line 350
    .line 351
    .line 352
    .line 353
    :array_2
    .array-data 1
        0x77t
        0x54t
    .end array-data

    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    nop

    .line 359
    :array_3
    .array-data 1
        0x64t
        0x57t
        0x15t
    .end array-data

    .line 360
    .line 361
    .line 362
    .line 363
    .line 364
    .line 365
    :array_4
    .array-data 1
        0x64t
        0x56t
        0x15t
    .end array-data

    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    :array_5
    .array-data 1
        0x64t
        0x54t
    .end array-data

    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    nop

    .line 377
    :array_6
    .array-data 1
        0x7ct
        0x57t
        0x15t
    .end array-data

    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    :array_7
    .array-data 1
        0x7ct
        0x56t
        0x15t
    .end array-data

    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    :array_8
    .array-data 1
        0x7ct
        0x54t
    .end array-data

    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    nop

    .line 395
    :array_9
    .array-data 1
        0x71t
        0x57t
        0x15t
    .end array-data

    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    :array_a
    .array-data 1
        0x71t
        0x56t
        0x15t
    .end array-data

    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    :array_b
    .array-data 1
        0x71t
        0x54t
    .end array-data

    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    nop

    .line 413
    :array_c
    .array-data 1
        0x7dt
        0x57t
        0x15t
    .end array-data

    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    :array_d
    .array-data 1
        0x7dt
        0x56t
        0x15t
    .end array-data

    .line 420
    .line 421
    .line 422
    .line 423
    .line 424
    .line 425
    :array_e
    .array-data 1
        0x7dt
        0x54t
    .end array-data

    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    nop

    .line 431
    :array_f
    .array-data 1
        0x74t
        0x57t
        0x15t
    .end array-data

    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    :array_10
    .array-data 1
        0x74t
        0x56t
        0x15t
    .end array-data

    .line 438
    .line 439
    .line 440
    .line 441
    .line 442
    .line 443
    :array_11
    .array-data 1
        0x74t
        0x54t
    .end array-data

    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    nop

    .line 449
    :array_12
    .array-data 1
        0x67t
        0x57t
        0x15t
    .end array-data

    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    :array_13
    .array-data 1
        0x67t
        0x56t
        0x15t
    .end array-data

    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    :array_14
    .array-data 1
        0x67t
        0x54t
    .end array-data

    .line 462
    .line 463
    .line 464
    .line 465
    .line 466
    nop

    .line 467
    :array_15
    .array-data 1
        0x60t
        0x57t
        0x15t
    .end array-data

    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    :array_16
    .array-data 1
        0x60t
        0x56t
        0x15t
    .end array-data

    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    :array_17
    .array-data 1
        0x60t
        0x54t
    .end array-data
.end method

.method private i()Z
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/immomo/utils/sensors/SensorInfo;->c:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    const/16 v0, 0x9

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    if-gtz p0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :catchall_0
    :goto_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method private j()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/utils/sensors/SensorInfo;->c:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    invoke-virtual {p0, v0}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-gtz p0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private k()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/utils/sensors/SensorInfo;->c:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    invoke-virtual {p0, v0}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-gtz p0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private l()Z
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/immomo/utils/sensors/SensorInfo;->c:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    const/16 v0, 0xa

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    if-gtz p0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :catchall_0
    :goto_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method private m()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/utils/sensors/SensorInfo;->c:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-virtual {p0, v0}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-gtz p0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private n()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/utils/sensors/SensorInfo;->c:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    const/4 v0, 0x6

    .line 4
    invoke-virtual {p0, v0}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-gtz p0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private o()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/utils/sensors/SensorInfo;->c:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-gtz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method private p()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/utils/sensors/SensorInfo;->c:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    const/4 v0, 0x7

    .line 4
    invoke-virtual {p0, v0}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-gtz p0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private r()Ljava/lang/String;
    .locals 2

    .line 1
    const/4 p0, 0x4

    .line 2
    :try_start_0
    new-instance v0, Ljava/io/File;

    .line 3
    .line 4
    const/16 v1, 0x27

    .line 5
    .line 6
    new-array v1, v1, [B

    .line 7
    .line 8
    fill-array-data v1, :array_0

    .line 9
    .line 10
    .line 11
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    new-array v0, p0, [B

    .line 25
    .line 26
    fill-array-data v0, :array_1

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    return-object p0

    .line 34
    :catchall_0
    :cond_0
    new-array p0, p0, [B

    .line 35
    .line 36
    fill-array-data p0, :array_2

    .line 37
    .line 38
    .line 39
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    nop

    .line 45
    :array_0
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x5t
        0x5ct
        0x7t
        0x42t
        0x44t
        0x4et
        0x12t
        0x59t
        0xbt
        0x54t
        0x53t
        0x3et
        0x9t
        0x45t
        0x12t
        0x41t
        0x42t
        0x15t
        0x49t
        0x46t
        0xft
        0x53t
        0x45t
        0x0t
        0x12t
        0x5ft
        0x14t
        0x1et
        0x52t
        0xft
        0x7t
        0x52t
        0xat
        0x54t
    .end array-data

    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    :array_1
    .array-data 1
        0x46t
        0x4t
        0x0t
        0x13t
    .end array-data

    :array_2
    .array-data 1
        0x46t
        0x4t
        0x1t
        0x13t
    .end array-data
.end method


# virtual methods
.method public e()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-boolean p0, Lcom/immomo/utils/sensors/SensorInfo;->r:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    new-array v1, v0, [B

    .line 12
    .line 13
    const/16 v2, 0x48

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    aput-byte v2, v1, v3

    .line 17
    .line 18
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    sget v2, Lcom/immomo/utils/sensors/SensorInfo;->n:F

    .line 23
    .line 24
    float-to-double v4, v2

    .line 25
    invoke-virtual {p0, v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    new-array v1, v0, [B

    .line 29
    .line 30
    const/16 v2, 0x49

    .line 31
    .line 32
    aput-byte v2, v1, v3

    .line 33
    .line 34
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    sget v2, Lcom/immomo/utils/sensors/SensorInfo;->o:F

    .line 39
    .line 40
    float-to-double v4, v2

    .line 41
    invoke-virtual {p0, v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    new-array v0, v0, [B

    .line 45
    .line 46
    const/16 v1, 0x4a

    .line 47
    .line 48
    aput-byte v1, v0, v3

    .line 49
    .line 50
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sget v1, Lcom/immomo/utils/sensors/SensorInfo;->p:F

    .line 55
    .line 56
    float-to-double v1, v1

    .line 57
    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_0
    const/4 p0, 0x4

    .line 66
    new-array p0, p0, [B

    .line 67
    .line 68
    fill-array-data p0, :array_0

    .line 69
    .line 70
    .line 71
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    nop

    .line 77
    :array_0
    .array-data 1
        0x7et
        0x9t
        0x5ft
        0x52t
    .end array-data
.end method

.method public f()Ljava/lang/String;
    .locals 3

    .line 1
    sget-boolean v0, Lcom/immomo/utils/sensors/SensorInfo;->q:Z

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/immomo/utils/sensors/SensorInfo;->g()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/immomo/utils/sensors/SensorInfo;->d()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/immomo/utils/sensors/SensorInfo;->r()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    new-array p0, v1, [B

    .line 33
    .line 34
    fill-array-data p0, :array_0

    .line 35
    .line 36
    .line 37
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-direct {p0}, Lcom/immomo/utils/sensors/SensorInfo;->g()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-direct {p0}, Lcom/immomo/utils/sensors/SensorInfo;->d()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-direct {p0}, Lcom/immomo/utils/sensors/SensorInfo;->r()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    new-array p0, v1, [B

    .line 76
    .line 77
    fill-array-data p0, :array_1

    .line 78
    .line 79
    .line 80
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0

    .line 92
    nop

    .line 93
    :array_0
    .array-data 1
        0x1t
        0x42t
    .end array-data

    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    nop

    .line 99
    :array_1
    .array-data 1
        0x0t
        0x42t
    .end array-data
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/utils/sensors/SensorInfo;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public q()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/utils/sensors/SensorInfo;->c:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/immomo/utils/sensors/SensorInfo;->e:Lcom/immomo/utils/sensors/SensorInfo$b;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/immomo/utils/sensors/SensorInfo;->c:Landroid/hardware/SensorManager;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/immomo/utils/sensors/SensorInfo;->f:Lcom/immomo/utils/sensors/SensorInfo$b;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    :catchall_0
    :cond_0
    return-void
.end method
