.class public Ll/pzd;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Ljava/lang/String;

.field private static b:Ljava/lang/String;

.field private static c:Ljava/lang/String;

.field private static d:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x7

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/pzd;->a:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v0, 0x4

    .line 14
    new-array v0, v0, [B

    .line 15
    .line 16
    fill-array-data v0, :array_1

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll/pzd;->b:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v0, 0x5

    .line 26
    new-array v0, v0, [B

    .line 27
    .line 28
    fill-array-data v0, :array_2

    .line 29
    .line 30
    .line 31
    invoke-static {v0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Ll/pzd;->c:Ljava/lang/String;

    .line 36
    .line 37
    const/16 v0, 0xc

    .line 38
    .line 39
    new-array v0, v0, [B

    .line 40
    .line 41
    fill-array-data v0, :array_3

    .line 42
    .line 43
    .line 44
    invoke-static {v0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sput-object v0, Ll/pzd;->d:Ljava/lang/String;

    .line 49
    .line 50
    return-void

    .line 51
    :array_0
    .array-data 1
        0x59t
        0x8t
        0x47t
        0x56t
        0xdt
        0xft
        0x54t
    .end array-data

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    :array_1
    .array-data 1
        0x6t
        0x50t
        0x7t
        0x1t
    .end array-data

    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    :array_2
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
    .end array-data

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    nop

    .line 73
    :array_3
    .array-data 1
        0x55t
        0x1et
        0x52t
        0x52t
        0x11t
        0x12t
        0x6ft
        0x3t
        0x43t
        0x45t
        0xet
        0x14t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/16 v0, 0xa

    .line 6
    .line 7
    new-array v0, v0, [B

    .line 8
    .line 9
    fill-array-data v0, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p0, v0}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    :array_0
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x39t
        0x58t
        0x53t
    .end array-data
.end method

.method public static b()Ljava/lang/String;
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    new-instance v1, Landroid/media/MediaDrm;

    .line 7
    .line 8
    new-instance v2, Ljava/util/UUID;

    .line 9
    .line 10
    const-wide v3, -0x121074568629b532L    # -3.563403477674908E221

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    const-wide v5, -0x5c37d8232ae2de13L

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    invoke-direct {v2, v3, v4, v5, v6}, Ljava/util/UUID;-><init>(JJ)V

    .line 21
    .line 22
    .line 23
    invoke-direct {v1, v2}, Landroid/media/MediaDrm;-><init>(Ljava/util/UUID;)V

    .line 24
    .line 25
    .line 26
    const/16 v2, 0xe

    .line 27
    .line 28
    new-array v2, v2, [B

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    const/16 v4, 0x54

    .line 32
    .line 33
    aput-byte v4, v2, v3

    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    const/4 v4, 0x3

    .line 37
    aput-byte v4, v2, v3

    .line 38
    .line 39
    const/16 v3, 0x47

    .line 40
    .line 41
    const/4 v5, 0x2

    .line 42
    aput-byte v3, v2, v5

    .line 43
    .line 44
    const/16 v3, 0x5e

    .line 45
    .line 46
    aput-byte v3, v2, v4

    .line 47
    .line 48
    const/4 v3, 0x4

    .line 49
    aput-byte v5, v2, v3

    .line 50
    .line 51
    const/4 v3, 0x5

    .line 52
    aput-byte v4, v2, v3

    .line 53
    .line 54
    const/4 v3, 0x6

    .line 55
    const/16 v6, 0x65

    .line 56
    .line 57
    aput-byte v6, v2, v3

    .line 58
    .line 59
    const/4 v3, 0x7

    .line 60
    const/16 v6, 0x8

    .line 61
    .line 62
    aput-byte v6, v2, v3

    .line 63
    .line 64
    const/16 v3, 0x58

    .line 65
    .line 66
    aput-byte v3, v2, v6

    .line 67
    .line 68
    const/16 v3, 0x9

    .line 69
    .line 70
    const/16 v6, 0x46

    .line 71
    .line 72
    aput-byte v6, v2, v3

    .line 73
    .line 74
    const/16 v3, 0xa

    .line 75
    .line 76
    const/16 v6, 0x14

    .line 77
    .line 78
    aput-byte v6, v2, v3

    .line 79
    .line 80
    const/16 v3, 0xb

    .line 81
    .line 82
    aput-byte v4, v2, v3

    .line 83
    .line 84
    const/16 v3, 0xc

    .line 85
    .line 86
    const/16 v4, 0x79

    .line 87
    .line 88
    aput-byte v4, v2, v3

    .line 89
    .line 90
    const/16 v3, 0xd

    .line 91
    .line 92
    aput-byte v5, v2, v3

    .line 93
    .line 94
    invoke-static {v2}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v1, v2}, Landroid/media/MediaDrm;->getPropertyByteArray(Ljava/lang/String;)[B

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    if-eqz v2, :cond_0

    .line 103
    .line 104
    invoke-static {v2}, Ll/yhw;->a([B)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    :cond_0
    invoke-virtual {v1}, Landroid/media/MediaDrm;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :catch_0
    sget-object v1, Ll/pzd;->d:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    return-object v0
.end method

.method public static c()Ljava/lang/String;
    .locals 6

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/pzd$a;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/pzd$a;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x1

    .line 15
    :try_start_0
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 16
    .line 17
    const-wide/16 v4, 0x1f4

    .line 18
    .line 19
    invoke-interface {v1, v4, v5, v3}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    :goto_0
    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 26
    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    return-object v3

    .line 32
    :catchall_0
    move-exception v3

    .line 33
    goto :goto_1

    .line 34
    :catch_0
    :try_start_1
    const-string v3, ""
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :goto_1
    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 38
    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    throw v3
.end method

.method public static d(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-lt v0, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    :try_start_0
    sget-boolean v0, Ll/nr60;->b:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x5

    .line 14
    new-array v0, v0, [B

    .line 15
    .line 16
    fill-array-data v0, :array_0

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Landroid/telephony/TelephonyManager;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    return-object p0

    .line 34
    :catch_0
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    return-object v2

    .line 37
    :goto_1
    invoke-static {p0}, Ll/lmw;->a(Ljava/lang/Throwable;)V

    .line 38
    .line 39
    .line 40
    return-object v2

    .line 41
    :array_0
    .array-data 1
        0x40t
        0xet
        0x5et
        0x59t
        0x4t
    .end array-data
.end method

.method public static e(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 13

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ljava/util/LinkedHashMap;

    .line 12
    .line 13
    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v3, 0x6

    .line 17
    const/4 v4, 0x5

    .line 18
    const/4 v5, 0x4

    .line 19
    const/4 v6, 0x3

    .line 20
    const/16 v7, 0x9

    .line 21
    .line 22
    const/16 v8, 0xb

    .line 23
    .line 24
    const/4 v9, 0x1

    .line 25
    :try_start_0
    new-instance v10, Lorg/json/JSONObject;

    .line 26
    .line 27
    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 28
    .line 29
    .line 30
    new-array v11, v8, [B

    .line 31
    .line 32
    fill-array-data v11, :array_0

    .line 33
    .line 34
    .line 35
    invoke-static {v11}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v11

    .line 39
    invoke-static {}, Ll/pzd;->g()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v12

    .line 43
    invoke-virtual {v10, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 44
    .line 45
    .line 46
    new-array v11, v8, [B

    .line 47
    .line 48
    fill-array-data v11, :array_1

    .line 49
    .line 50
    .line 51
    invoke-static {v11}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v11

    .line 55
    const-string v12, ""

    .line 56
    .line 57
    invoke-virtual {v10, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 58
    .line 59
    .line 60
    new-array v11, v8, [B

    .line 61
    .line 62
    fill-array-data v11, :array_2

    .line 63
    .line 64
    .line 65
    invoke-static {v11}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v11

    .line 69
    invoke-static {p0, v9}, Ll/nr60;->c(Landroid/content/Context;I)I

    .line 70
    .line 71
    .line 72
    move-result v12

    .line 73
    invoke-virtual {v10, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v10

    .line 80
    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    .line 81
    .line 82
    .line 83
    move-result-object v10

    .line 84
    const/16 v11, 0x67

    .line 85
    .line 86
    invoke-static {v10, v11}, Lcom/momosec/mmuid/android/Native;->doCommand([BI)[B

    .line 87
    .line 88
    .line 89
    move-result-object v10

    .line 90
    invoke-static {v10}, Ll/m8g0;->a([B)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v10

    .line 94
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    new-array v10, v3, [B

    .line 98
    .line 99
    fill-array-data v10, :array_3

    .line 100
    .line 101
    .line 102
    invoke-static {v10}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v10

    .line 106
    invoke-static {}, Ll/pzd;->i()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v11

    .line 110
    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    new-array v10, v5, [B

    .line 114
    .line 115
    fill-array-data v10, :array_4

    .line 116
    .line 117
    .line 118
    invoke-static {v10}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v10

    .line 122
    invoke-static {p0}, Ll/pzd;->d(Landroid/content/Context;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v11

    .line 126
    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    new-array v10, v4, [B

    .line 130
    .line 131
    fill-array-data v10, :array_5

    .line 132
    .line 133
    .line 134
    invoke-static {v10}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v10

    .line 138
    invoke-static {}, Ll/pzd;->f()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v11

    .line 142
    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    new-array v10, v7, [B

    .line 146
    .line 147
    fill-array-data v10, :array_6

    .line 148
    .line 149
    .line 150
    invoke-static {v10}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v10

    .line 154
    invoke-static {p0}, Ll/pzd;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v11

    .line 158
    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    new-array v10, v6, [B

    .line 162
    .line 163
    fill-array-data v10, :array_7

    .line 164
    .line 165
    .line 166
    invoke-static {v10}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v10

    .line 170
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v11

    .line 174
    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    new-array v10, v6, [B

    .line 178
    .line 179
    fill-array-data v10, :array_8

    .line 180
    .line 181
    .line 182
    invoke-static {v10}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v10

    .line 186
    invoke-static {}, Ll/pzd;->h()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v11

    .line 190
    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    .line 192
    .line 193
    goto :goto_0

    .line 194
    :catch_0
    move-exception v10

    .line 195
    invoke-static {v10}, Ll/lmw;->a(Ljava/lang/Throwable;)V

    .line 196
    .line 197
    .line 198
    :goto_0
    :try_start_1
    sget-object v10, Ll/xnk0;->a:Ljava/lang/String;

    .line 199
    .line 200
    sget-object v11, Ll/xnk0;->b:Ljava/lang/String;

    .line 201
    .line 202
    invoke-static {v10, v11}, Ll/f4f0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v10

    .line 206
    invoke-static {v10}, Ll/m8g0;->b(Ljava/lang/String;)Z

    .line 207
    .line 208
    .line 209
    move-result v11

    .line 210
    if-nez v11, :cond_0

    .line 211
    .line 212
    const/16 v11, 0xd

    .line 213
    .line 214
    new-array v11, v11, [B

    .line 215
    .line 216
    fill-array-data v11, :array_9

    .line 217
    .line 218
    .line 219
    invoke-static {v11}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v11

    .line 223
    invoke-virtual {v0, v11, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 224
    .line 225
    .line 226
    goto :goto_1

    .line 227
    :catch_1
    move-exception p0

    .line 228
    goto/16 :goto_5

    .line 229
    .line 230
    :cond_0
    const/16 v10, 0xd

    .line 231
    .line 232
    new-array v10, v10, [B

    .line 233
    .line 234
    fill-array-data v10, :array_a

    .line 235
    .line 236
    .line 237
    invoke-static {v10}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v10

    .line 241
    new-array v11, v4, [B

    .line 242
    .line 243
    fill-array-data v11, :array_b

    .line 244
    .line 245
    .line 246
    invoke-static {v11}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v11

    .line 250
    invoke-virtual {v0, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 251
    .line 252
    .line 253
    :goto_1
    new-array v10, v3, [B

    .line 254
    .line 255
    fill-array-data v10, :array_c

    .line 256
    .line 257
    .line 258
    invoke-static {v10}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v10

    .line 262
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    invoke-virtual {v0, v10, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 271
    .line 272
    .line 273
    new-array v2, v7, [B

    .line 274
    .line 275
    fill-array-data v2, :array_d

    .line 276
    .line 277
    .line 278
    invoke-static {v2}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    invoke-virtual {v0, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 283
    .line 284
    .line 285
    new-array v2, v3, [B

    .line 286
    .line 287
    fill-array-data v2, :array_e

    .line 288
    .line 289
    .line 290
    invoke-static {v2}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v2

    .line 294
    invoke-static {}, Ll/pzd;->c()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object v10

    .line 298
    invoke-virtual {v0, v2, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 299
    .line 300
    .line 301
    const/16 v2, 0x8

    .line 302
    .line 303
    new-array v2, v2, [B

    .line 304
    .line 305
    fill-array-data v2, :array_f

    .line 306
    .line 307
    .line 308
    invoke-static {v2}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v2

    .line 312
    invoke-static {}, Ll/pzd;->j()Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v10

    .line 316
    invoke-virtual {v0, v2, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 317
    .line 318
    .line 319
    invoke-static {p0}, Ll/pzd;->d(Landroid/content/Context;)Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    invoke-static {v2}, Ll/m8g0;->b(Ljava/lang/String;)Z

    .line 324
    .line 325
    .line 326
    move-result v10

    .line 327
    if-eqz v10, :cond_1

    .line 328
    .line 329
    new-array v2, v5, [B

    .line 330
    .line 331
    fill-array-data v2, :array_10

    .line 332
    .line 333
    .line 334
    invoke-static {v2}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v2

    .line 338
    sget-object v10, Ll/pzd;->a:Ljava/lang/String;

    .line 339
    .line 340
    invoke-virtual {v0, v2, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 341
    .line 342
    .line 343
    goto :goto_2

    .line 344
    :cond_1
    new-array v10, v5, [B

    .line 345
    .line 346
    fill-array-data v10, :array_11

    .line 347
    .line 348
    .line 349
    invoke-static {v10}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v10

    .line 353
    invoke-virtual {v0, v10, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 354
    .line 355
    .line 356
    :goto_2
    new-array v2, v3, [B

    .line 357
    .line 358
    fill-array-data v2, :array_12

    .line 359
    .line 360
    .line 361
    invoke-static {v2}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object v2

    .line 365
    invoke-static {}, Ll/pzd;->i()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v3

    .line 369
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 370
    .line 371
    .line 372
    new-array v2, v7, [B

    .line 373
    .line 374
    fill-array-data v2, :array_13

    .line 375
    .line 376
    .line 377
    invoke-static {v2}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object v2

    .line 381
    invoke-static {p0}, Ll/pzd;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object v3

    .line 385
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 386
    .line 387
    .line 388
    new-array v2, v6, [B

    .line 389
    .line 390
    fill-array-data v2, :array_14

    .line 391
    .line 392
    .line 393
    invoke-static {v2}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object v2

    .line 397
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v1

    .line 401
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 402
    .line 403
    .line 404
    new-array v1, v7, [B

    .line 405
    .line 406
    fill-array-data v1, :array_15

    .line 407
    .line 408
    .line 409
    invoke-static {v1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object v1

    .line 413
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 414
    .line 415
    .line 416
    sget-object p1, Ll/xnk0;->d:Ljava/lang/String;

    .line 417
    .line 418
    invoke-static {p1}, Ll/m8g0;->b(Ljava/lang/String;)Z

    .line 419
    .line 420
    .line 421
    move-result p1

    .line 422
    if-eqz p1, :cond_2

    .line 423
    .line 424
    new-array p1, v5, [B

    .line 425
    .line 426
    fill-array-data p1, :array_16

    .line 427
    .line 428
    .line 429
    invoke-static {p1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object p1

    .line 433
    sget-object v1, Ll/pzd;->a:Ljava/lang/String;

    .line 434
    .line 435
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 436
    .line 437
    .line 438
    goto :goto_3

    .line 439
    :cond_2
    new-array p1, v5, [B

    .line 440
    .line 441
    fill-array-data p1, :array_17

    .line 442
    .line 443
    .line 444
    invoke-static {p1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object p1

    .line 448
    sget-object v1, Ll/xnk0;->d:Ljava/lang/String;

    .line 449
    .line 450
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 451
    .line 452
    .line 453
    :goto_3
    invoke-static {}, Ll/pzd;->h()Ljava/lang/String;

    .line 454
    .line 455
    .line 456
    move-result-object p1

    .line 457
    invoke-static {p1}, Ll/m8g0;->b(Ljava/lang/String;)Z

    .line 458
    .line 459
    .line 460
    move-result v1

    .line 461
    if-eqz v1, :cond_3

    .line 462
    .line 463
    new-array p1, v6, [B

    .line 464
    .line 465
    fill-array-data p1, :array_18

    .line 466
    .line 467
    .line 468
    invoke-static {p1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 469
    .line 470
    .line 471
    move-result-object p1

    .line 472
    sget-object v1, Ll/pzd;->a:Ljava/lang/String;

    .line 473
    .line 474
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 475
    .line 476
    .line 477
    goto :goto_4

    .line 478
    :cond_3
    new-array v1, v6, [B

    .line 479
    .line 480
    fill-array-data v1, :array_19

    .line 481
    .line 482
    .line 483
    invoke-static {v1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 484
    .line 485
    .line 486
    move-result-object v1

    .line 487
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 488
    .line 489
    .line 490
    :goto_4
    new-array p1, v4, [B

    .line 491
    .line 492
    fill-array-data p1, :array_1a

    .line 493
    .line 494
    .line 495
    invoke-static {p1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 496
    .line 497
    .line 498
    move-result-object p1

    .line 499
    invoke-static {}, Ll/pzd;->f()Ljava/lang/String;

    .line 500
    .line 501
    .line 502
    move-result-object v1

    .line 503
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 504
    .line 505
    .line 506
    new-array p1, v8, [B

    .line 507
    .line 508
    fill-array-data p1, :array_1b

    .line 509
    .line 510
    .line 511
    invoke-static {p1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 512
    .line 513
    .line 514
    move-result-object p1

    .line 515
    invoke-static {}, Ll/pzd;->g()Ljava/lang/String;

    .line 516
    .line 517
    .line 518
    move-result-object v1

    .line 519
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 520
    .line 521
    .line 522
    new-array p1, v8, [B

    .line 523
    .line 524
    fill-array-data p1, :array_1c

    .line 525
    .line 526
    .line 527
    invoke-static {p1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 528
    .line 529
    .line 530
    move-result-object p1

    .line 531
    invoke-static {p0, v9}, Ll/nr60;->c(Landroid/content/Context;I)I

    .line 532
    .line 533
    .line 534
    move-result v1

    .line 535
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 536
    .line 537
    .line 538
    invoke-static {p0}, Ll/tl20;->a(Landroid/content/Context;)I

    .line 539
    .line 540
    .line 541
    move-result p0

    .line 542
    if-ne p0, v9, :cond_4

    .line 543
    .line 544
    const/16 p0, 0xa

    .line 545
    .line 546
    new-array p0, p0, [B

    .line 547
    .line 548
    fill-array-data p0, :array_1d

    .line 549
    .line 550
    .line 551
    invoke-static {p0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 552
    .line 553
    .line 554
    move-result-object p0

    .line 555
    invoke-virtual {v0, p0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 556
    .line 557
    .line 558
    goto :goto_6

    .line 559
    :cond_4
    const/16 p0, 0xa

    .line 560
    .line 561
    new-array p0, p0, [B

    .line 562
    .line 563
    fill-array-data p0, :array_1e

    .line 564
    .line 565
    .line 566
    invoke-static {p0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 567
    .line 568
    .line 569
    move-result-object p0

    .line 570
    const/4 p1, 0x0

    .line 571
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 572
    .line 573
    .line 574
    goto :goto_6

    .line 575
    :goto_5
    invoke-static {p0}, Ll/lmw;->a(Ljava/lang/Throwable;)V

    .line 576
    .line 577
    .line 578
    :goto_6
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 579
    .line 580
    .line 581
    move-result-object p0

    .line 582
    return-object p0

    .line 583
    :array_0
    .array-data 1
        0x43t
        0x2t
        0x52t
        0x56t
        0x13t
        0x2t
        0x6ft
        0x16t
        0x50t
        0x43t
        0x9t
    .end array-data

    .line 584
    .line 585
    .line 586
    .line 587
    .line 588
    .line 589
    .line 590
    .line 591
    .line 592
    .line 593
    :array_1
    .array-data 1
        0x5dt
        0x7t
        0x52t
        0x68t
        0x0t
        0x2t
        0x54t
        0x14t
        0x54t
        0x44t
        0x12t
    .end array-data

    .line 594
    .line 595
    .line 596
    .line 597
    .line 598
    .line 599
    .line 600
    .line 601
    .line 602
    .line 603
    :array_2
    .array-data 1
        0x43t
        0x2t
        0x52t
        0x56t
        0x13t
        0x2t
        0x6ft
        0x16t
        0x54t
        0x45t
        0xct
    .end array-data

    .line 604
    .line 605
    .line 606
    .line 607
    .line 608
    .line 609
    .line 610
    .line 611
    .line 612
    .line 613
    :array_3
    .array-data 1
        0x43t
        0x5t
        0x43t
        0x52t
        0x4t
        0x8t
    .end array-data

    .line 614
    .line 615
    .line 616
    .line 617
    .line 618
    .line 619
    .line 620
    nop

    .line 621
    :array_4
    .array-data 1
        0x59t
        0xbt
        0x54t
        0x5et
    .end array-data

    .line 622
    .line 623
    .line 624
    .line 625
    .line 626
    .line 627
    :array_5
    .array-data 1
        0x5dt
        0x9t
        0x55t
        0x52t
        0xdt
    .end array-data

    .line 628
    .line 629
    .line 630
    .line 631
    .line 632
    .line 633
    .line 634
    nop

    .line 635
    :array_6
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0xft
        0x55t
    .end array-data

    .line 636
    .line 637
    .line 638
    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    .line 644
    nop

    .line 645
    :array_7
    .array-data 1
        0x5dt
        0x7t
        0x52t
    .end array-data

    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    :array_8
    .array-data 1
        0x53t
        0xft
        0x55t
    .end array-data

    .line 652
    .line 653
    .line 654
    .line 655
    .line 656
    .line 657
    :array_9
    .array-data 1
        0x43t
        0xet
        0x50t
        0x45t
        0x4t
        0x2t
        0x6ft
        0x2t
        0x54t
        0x41t
        0x8t
        0x5t
        0x55t
    .end array-data

    .line 658
    .line 659
    .line 660
    .line 661
    .line 662
    .line 663
    .line 664
    .line 665
    .line 666
    .line 667
    .line 668
    nop

    .line 669
    :array_a
    .array-data 1
        0x43t
        0xet
        0x50t
        0x45t
        0x4t
        0x2t
        0x6ft
        0x2t
        0x54t
        0x41t
        0x8t
        0x5t
        0x55t
    .end array-data

    .line 670
    .line 671
    .line 672
    .line 673
    .line 674
    .line 675
    .line 676
    .line 677
    .line 678
    .line 679
    .line 680
    nop

    .line 681
    :array_b
    .array-data 1
        0x55t
        0x14t
        0x43t
        0x58t
        0x13t
    .end array-data

    .line 682
    .line 683
    .line 684
    .line 685
    .line 686
    .line 687
    .line 688
    nop

    .line 689
    :array_c
    .array-data 1
        0x54t
        0x3t
        0x47t
        0x5et
        0x2t
        0x3t
    .end array-data

    .line 690
    .line 691
    .line 692
    .line 693
    .line 694
    .line 695
    .line 696
    nop

    .line 697
    :array_d
    .array-data 1
        0x43t
        0x3t
        0x42t
        0x44t
        0x8t
        0x9t
        0x5et
        0xft
        0x55t
    .end array-data

    .line 698
    .line 699
    .line 700
    .line 701
    .line 702
    .line 703
    .line 704
    .line 705
    .line 706
    nop

    .line 707
    :array_e
    .array-data 1
        0x54t
        0x14t
        0x5ct
        0x42t
        0x8t
        0x2t
    .end array-data

    .line 708
    .line 709
    .line 710
    .line 711
    .line 712
    .line 713
    .line 714
    nop

    .line 715
    :array_f
    .array-data 1
        0x43t
        0x3t
        0x43t
        0x5et
        0x0t
        0xat
        0x5et
        0x9t
    .end array-data

    .line 716
    .line 717
    .line 718
    .line 719
    .line 720
    .line 721
    .line 722
    .line 723
    :array_10
    .array-data 1
        0x59t
        0xbt
        0x54t
        0x5et
    .end array-data

    .line 724
    .line 725
    .line 726
    .line 727
    .line 728
    .line 729
    :array_11
    .array-data 1
        0x59t
        0xbt
        0x54t
        0x5et
    .end array-data

    .line 730
    .line 731
    .line 732
    .line 733
    .line 734
    .line 735
    :array_12
    .array-data 1
        0x43t
        0x5t
        0x43t
        0x52t
        0x4t
        0x8t
    .end array-data

    .line 736
    .line 737
    .line 738
    .line 739
    .line 740
    .line 741
    .line 742
    nop

    .line 743
    :array_13
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0xft
        0x55t
    .end array-data

    .line 744
    .line 745
    .line 746
    .line 747
    .line 748
    .line 749
    .line 750
    .line 751
    .line 752
    nop

    .line 753
    :array_14
    .array-data 1
        0x5dt
        0x7t
        0x52t
    .end array-data

    .line 754
    .line 755
    .line 756
    .line 757
    .line 758
    .line 759
    :array_15
    .array-data 1
        0x43t
        0x3t
        0x42t
        0x44t
        0x8t
        0x9t
        0x5et
        0xft
        0x55t
    .end array-data

    .line 760
    .line 761
    .line 762
    .line 763
    .line 764
    .line 765
    .line 766
    .line 767
    .line 768
    nop

    .line 769
    :array_16
    .array-data 1
        0x5ft
        0x7t
        0x58t
        0x53t
    .end array-data

    .line 770
    .line 771
    .line 772
    .line 773
    .line 774
    .line 775
    :array_17
    .array-data 1
        0x5ft
        0x7t
        0x58t
        0x53t
    .end array-data

    .line 776
    .line 777
    .line 778
    .line 779
    .line 780
    .line 781
    :array_18
    .array-data 1
        0x53t
        0xft
        0x55t
    .end array-data

    .line 782
    .line 783
    .line 784
    .line 785
    .line 786
    .line 787
    :array_19
    .array-data 1
        0x53t
        0xft
        0x55t
    .end array-data

    .line 788
    .line 789
    .line 790
    .line 791
    .line 792
    .line 793
    :array_1a
    .array-data 1
        0x5dt
        0x9t
        0x55t
        0x52t
        0xdt
    .end array-data

    .line 794
    .line 795
    .line 796
    .line 797
    .line 798
    .line 799
    .line 800
    nop

    .line 801
    :array_1b
    .array-data 1
        0x43t
        0x2t
        0x52t
        0x56t
        0x13t
        0x2t
        0x6ft
        0x16t
        0x50t
        0x43t
        0x9t
    .end array-data

    .line 802
    .line 803
    .line 804
    .line 805
    .line 806
    .line 807
    .line 808
    .line 809
    .line 810
    .line 811
    :array_1c
    .array-data 1
        0x43t
        0x2t
        0x52t
        0x56t
        0x13t
        0x2t
        0x6ft
        0x16t
        0x54t
        0x45t
        0xct
    .end array-data

    .line 812
    .line 813
    .line 814
    .line 815
    .line 816
    .line 817
    .line 818
    .line 819
    .line 820
    .line 821
    :array_1d
    .array-data 1
        0x47t
        0xft
        0x57t
        0x5et
        0x3et
        0x15t
        0x44t
        0x7t
        0x45t
        0x52t
    .end array-data

    .line 822
    .line 823
    .line 824
    .line 825
    .line 826
    .line 827
    .line 828
    .line 829
    .line 830
    nop

    .line 831
    :array_1e
    .array-data 1
        0x47t
        0xft
        0x57t
        0x5et
        0x3et
        0x15t
        0x44t
        0x7t
        0x45t
        0x52t
    .end array-data
.end method

.method public static f()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static g()Ljava/lang/String;
    .locals 4

    .line 1
    const/4 v0, 0x7

    .line 2
    const/4 v1, 0x0

    .line 3
    :try_start_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    new-array v3, v0, [B

    .line 8
    .line 9
    fill-array-data v3, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {v3}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Ljava/io/File;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    goto :goto_0

    .line 31
    :catch_0
    move-exception v2

    .line 32
    invoke-static {v2}, Ll/lmw;->a(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    :goto_0
    if-nez v1, :cond_1

    .line 36
    .line 37
    new-array v0, v0, [B

    .line 38
    .line 39
    fill-array-data v0, :array_1

    .line 40
    .line 41
    .line 42
    invoke-static {v0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    :cond_1
    return-object v1

    .line 47
    :array_0
    .array-data 1
        0x5dt
        0x9t
        0x44t
        0x59t
        0x15t
        0x3t
        0x54t
    .end array-data

    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    :array_1
    .array-data 1
        0x1ft
        0x15t
        0x55t
        0x54t
        0x0t
        0x14t
        0x54t
    .end array-data
.end method

.method public static h()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x1e

    .line 7
    .line 8
    new-array v1, v1, [B

    .line 9
    .line 10
    fill-array-data v1, :array_0

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/16 v2, 0x1e

    .line 18
    .line 19
    new-array v2, v2, [B

    .line 20
    .line 21
    fill-array-data v2, :array_1

    .line 22
    .line 23
    .line 24
    invoke-static {v2}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const/4 v3, 0x3

    .line 29
    :try_start_0
    new-array v3, v3, [B

    .line 30
    .line 31
    fill-array-data v3, :array_2

    .line 32
    .line 33
    .line 34
    invoke-static {v3}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-static {v1, v3}, Ll/pzd;->k(Ljava/lang/String;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    const/16 v1, 0x1d

    .line 45
    .line 46
    new-array v1, v1, [B

    .line 47
    .line 48
    fill-array-data v1, :array_3

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1}, Ll/pzd;->l(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :catch_0
    move-exception v1

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    const/4 v1, 0x2

    .line 66
    new-array v1, v1, [B

    .line 67
    .line 68
    fill-array-data v1, :array_4

    .line 69
    .line 70
    .line 71
    invoke-static {v1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-static {v2, v1}, Ll/pzd;->k(Ljava/lang/String;Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_1

    .line 80
    .line 81
    const/16 v1, 0x1d

    .line 82
    .line 83
    new-array v1, v1, [B

    .line 84
    .line 85
    fill-array-data v1, :array_5

    .line 86
    .line 87
    .line 88
    invoke-static {v1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-static {v1}, Ll/pzd;->l(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 101
    .line 102
    .line 103
    :cond_1
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    return-object v0

    .line 108
    nop

    .line 109
    :array_0
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x4t
        0x5ct
        0x9t
        0x52t
        0x5ct
        0x4et
        0xbt
        0x5dt
        0x5t
        0x53t
        0x5bt
        0xat
        0x56t
        0x1ft
        0x2t
        0x54t
        0x41t
        0x8t
        0x5t
        0x55t
        0x49t
        0x45t
        0x4et
        0x11t
        0x3t
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
    :array_1
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x4t
        0x5ct
        0x9t
        0x52t
        0x5ct
        0x4et
        0xbt
        0x5dt
        0x5t
        0x53t
        0x5bt
        0xat
        0x57t
        0x1ft
        0x2t
        0x54t
        0x41t
        0x8t
        0x5t
        0x55t
        0x49t
        0x45t
        0x4et
        0x11t
        0x3t
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
    nop

    .line 149
    :array_2
    .array-data 1
        0x5dt
        0xbt
        0x52t
    .end array-data

    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    :array_3
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x4t
        0x5ct
        0x9t
        0x52t
        0x5ct
        0x4et
        0xbt
        0x5dt
        0x5t
        0x53t
        0x5bt
        0xat
        0x56t
        0x1ft
        0x2t
        0x54t
        0x41t
        0x8t
        0x5t
        0x55t
        0x49t
        0x52t
        0x5et
        0x5t
    .end array-data

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
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    nop

    .line 175
    :array_4
    .array-data 1
        0x43t
        0x2t
    .end array-data

    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    nop

    .line 181
    :array_5
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x4t
        0x5ct
        0x9t
        0x52t
        0x5ct
        0x4et
        0xbt
        0x5dt
        0x5t
        0x53t
        0x5bt
        0xat
        0x57t
        0x1ft
        0x2t
        0x54t
        0x41t
        0x8t
        0x5t
        0x55t
        0x49t
        0x52t
        0x5et
        0x5t
    .end array-data
.end method

.method public static i()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/ode0;->a()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    new-array v2, v2, [B

    .line 20
    .line 21
    const/16 v3, 0x48

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    aput-byte v3, v2, v4

    .line 25
    .line 26
    invoke-static {v2}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/ode0;->b()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    return-object v0
.end method

.method public static j()Ljava/lang/String;
    .locals 25

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 7
    .line 8
    const/16 v2, 0x18

    .line 9
    .line 10
    if-le v1, v2, :cond_0

    .line 11
    .line 12
    sget-object v1, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :cond_0
    const/16 v1, 0x1b

    .line 20
    .line 21
    new-array v1, v1, [B

    .line 22
    .line 23
    const/16 v3, 0x51

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    aput-byte v3, v1, v4

    .line 27
    .line 28
    const/16 v3, 0x8

    .line 29
    .line 30
    const/4 v5, 0x1

    .line 31
    aput-byte v3, v1, v5

    .line 32
    .line 33
    const/16 v6, 0x55

    .line 34
    .line 35
    const/4 v7, 0x2

    .line 36
    aput-byte v6, v1, v7

    .line 37
    .line 38
    const/16 v6, 0x45

    .line 39
    .line 40
    const/4 v8, 0x3

    .line 41
    aput-byte v6, v1, v8

    .line 42
    .line 43
    const/16 v9, 0xe

    .line 44
    .line 45
    const/4 v10, 0x4

    .line 46
    aput-byte v9, v1, v10

    .line 47
    .line 48
    const/16 v11, 0xf

    .line 49
    .line 50
    const/4 v12, 0x5

    .line 51
    aput-byte v11, v1, v12

    .line 52
    .line 53
    const/16 v13, 0x54

    .line 54
    .line 55
    const/4 v14, 0x6

    .line 56
    aput-byte v13, v1, v14

    .line 57
    .line 58
    const/16 v13, 0x48

    .line 59
    .line 60
    const/4 v15, 0x7

    .line 61
    aput-byte v13, v1, v15

    .line 62
    .line 63
    const/16 v13, 0x5e

    .line 64
    .line 65
    aput-byte v13, v1, v3

    .line 66
    .line 67
    const/16 v13, 0x44

    .line 68
    .line 69
    const/16 v16, 0x9

    .line 70
    .line 71
    aput-byte v13, v1, v16

    .line 72
    .line 73
    const/16 v17, 0x4f

    .line 74
    .line 75
    const/16 v18, 0xa

    .line 76
    .line 77
    aput-byte v17, v1, v18

    .line 78
    .line 79
    const/16 v17, 0x35

    .line 80
    .line 81
    move/from16 v19, v2

    .line 82
    .line 83
    const/16 v2, 0xb

    .line 84
    .line 85
    aput-byte v17, v1, v2

    .line 86
    .line 87
    const/16 v17, 0x49

    .line 88
    .line 89
    const/16 v20, 0xc

    .line 90
    .line 91
    aput-byte v17, v1, v20

    .line 92
    .line 93
    const/16 v17, 0xd

    .line 94
    .line 95
    const/16 v21, 0x15

    .line 96
    .line 97
    aput-byte v21, v1, v17

    .line 98
    .line 99
    aput-byte v6, v1, v9

    .line 100
    .line 101
    const/16 v17, 0x52

    .line 102
    .line 103
    aput-byte v17, v1, v11

    .line 104
    .line 105
    const/16 v11, 0x10

    .line 106
    .line 107
    aput-byte v20, v1, v11

    .line 108
    .line 109
    const/16 v11, 0x11

    .line 110
    .line 111
    const/16 v20, 0x36

    .line 112
    .line 113
    aput-byte v20, v1, v11

    .line 114
    .line 115
    const/16 v11, 0x12

    .line 116
    .line 117
    const/16 v20, 0x42

    .line 118
    .line 119
    aput-byte v20, v1, v11

    .line 120
    .line 121
    const/16 v22, 0x13

    .line 122
    .line 123
    aput-byte v16, v1, v22

    .line 124
    .line 125
    const/16 v23, 0x41

    .line 126
    .line 127
    const/16 v24, 0x14

    .line 128
    .line 129
    aput-byte v23, v1, v24

    .line 130
    .line 131
    aput-byte v17, v1, v21

    .line 132
    .line 133
    const/16 v17, 0x16

    .line 134
    .line 135
    aput-byte v22, v1, v17

    .line 136
    .line 137
    const/16 v17, 0x17

    .line 138
    .line 139
    aput-byte v11, v1, v17

    .line 140
    .line 141
    const/16 v11, 0x59

    .line 142
    .line 143
    aput-byte v11, v1, v19

    .line 144
    .line 145
    const/16 v17, 0x19

    .line 146
    .line 147
    aput-byte v8, v1, v17

    .line 148
    .line 149
    const/16 v17, 0x1a

    .line 150
    .line 151
    aput-byte v20, v1, v17

    .line 152
    .line 153
    invoke-static {v1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    move/from16 v17, v3

    .line 162
    .line 163
    new-array v3, v8, [B

    .line 164
    .line 165
    const/16 v19, 0x57

    .line 166
    .line 167
    aput-byte v19, v3, v4

    .line 168
    .line 169
    aput-byte v8, v3, v5

    .line 170
    .line 171
    aput-byte v6, v3, v7

    .line 172
    .line 173
    invoke-static {v3}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    new-array v6, v5, [Ljava/lang/Class;

    .line 178
    .line 179
    const-class v19, Ljava/lang/String;

    .line 180
    .line 181
    aput-object v19, v6, v4

    .line 182
    .line 183
    invoke-virtual {v1, v3, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    new-array v6, v5, [Ljava/lang/Object;

    .line 188
    .line 189
    new-array v2, v2, [B

    .line 190
    .line 191
    aput-byte v20, v2, v4

    .line 192
    .line 193
    aput-byte v16, v2, v5

    .line 194
    .line 195
    const/16 v5, 0x1f

    .line 196
    .line 197
    aput-byte v5, v2, v7

    .line 198
    .line 199
    aput-byte v13, v2, v8

    .line 200
    .line 201
    aput-byte v10, v2, v10

    .line 202
    .line 203
    aput-byte v24, v2, v12

    .line 204
    .line 205
    aput-byte v11, v2, v14

    .line 206
    .line 207
    aput-byte v15, v2, v15

    .line 208
    .line 209
    const/16 v5, 0x5d

    .line 210
    .line 211
    aput-byte v5, v2, v17

    .line 212
    .line 213
    aput-byte v11, v2, v16

    .line 214
    .line 215
    aput-byte v9, v2, v18

    .line 216
    .line 217
    invoke-static {v2}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    aput-object v2, v6, v4

    .line 222
    .line 223
    invoke-virtual {v3, v1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    check-cast v1, Ljava/lang/String;

    .line 228
    .line 229
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    .line 231
    .line 232
    goto :goto_0

    .line 233
    :catch_0
    sget-object v1, Ll/pzd;->b:Ljava/lang/String;

    .line 234
    .line 235
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    return-object v0
.end method

.method private static k(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    new-instance p0, Ljava/io/BufferedReader;

    .line 13
    .line 14
    new-instance v1, Ljava/io/FileReader;

    .line 15
    .line 16
    invoke-direct {v1, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 20
    .line 21
    .line 22
    :try_start_0
    invoke-virtual {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, p1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    invoke-virtual {p0}, Ljava/io/BufferedReader;->close()V

    .line 35
    .line 36
    .line 37
    return p1

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 40
    :catchall_1
    move-exception v0

    .line 41
    :try_start_2
    invoke-virtual {p0}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_2
    move-exception p0

    .line 46
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    throw v0

    .line 50
    :cond_0
    const/4 p0, 0x0

    .line 51
    return p0
.end method

.method private static l(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    new-instance p0, Ljava/io/BufferedReader;

    .line 13
    .line 14
    new-instance v1, Ljava/io/FileReader;

    .line 15
    .line 16
    invoke-direct {v1, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 20
    .line 21
    .line 22
    :try_start_0
    invoke-virtual {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    invoke-virtual {p0}, Ljava/io/BufferedReader;->close()V

    .line 27
    .line 28
    .line 29
    return-object v0

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    :try_start_1
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 32
    :catchall_1
    move-exception v1

    .line 33
    :try_start_2
    invoke-virtual {p0}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_2
    move-exception p0

    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    throw v1

    .line 42
    :cond_0
    const-string p0, ""

    .line 43
    .line 44
    return-object p0
.end method
