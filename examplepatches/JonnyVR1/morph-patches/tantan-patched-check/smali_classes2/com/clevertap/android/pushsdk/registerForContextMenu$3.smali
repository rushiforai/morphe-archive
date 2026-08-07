.class Lcom/clevertap/android/pushsdk/registerForContextMenu$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/clevertap/android/pushsdk/registerForContextMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# static fields
.field private static onOptionsItemSelected:[C = null

.field private static openContextMenu:I = 0x0

.field private static setContentView:I = 0x1


# instance fields
.field final synthetic unregisterForContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x7

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$3;->onOptionsItemSelected:[C

    return-void

    nop

    :array_0
    .array-data 2
        0x3as
        0x74s
        0x74s
        0x62s
        0x5as
        0x69s
        0x6bs
    .end array-data
.end method

.method public constructor <init>(Lcom/clevertap/android/pushsdk/registerForContextMenu;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$3;->unregisterForContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private static registerForContextMenu(ZLjava/lang/String;[I[Ljava/lang/Object;)V
    .locals 12

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "ISO-8859-1"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :cond_0
    check-cast p1, [B

    .line 10
    .line 11
    sget-object v0, Lcom/guardsquare/dexguard/values;->registerForContextMenu:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter v0

    .line 14
    const/4 v1, 0x0

    .line 15
    :try_start_0
    aget v2, p2, v1

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    aget v4, p2, v3

    .line 19
    .line 20
    const/4 v5, 0x2

    .line 21
    aget v6, p2, v5

    .line 22
    .line 23
    const/4 v7, 0x3

    .line 24
    aget v7, p2, v7

    .line 25
    .line 26
    sget-object v8, Lcom/clevertap/android/pushsdk/registerForContextMenu$3;->onOptionsItemSelected:[C

    .line 27
    .line 28
    new-array v9, v4, [C

    .line 29
    .line 30
    invoke-static {v8, v2, v9, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 31
    .line 32
    .line 33
    if-eqz p1, :cond_3

    .line 34
    .line 35
    new-array v2, v4, [C

    .line 36
    .line 37
    sput v1, Lcom/guardsquare/dexguard/values;->onOptionsItemSelected:I

    .line 38
    .line 39
    move v8, v1

    .line 40
    :goto_0
    sget v10, Lcom/guardsquare/dexguard/values;->onOptionsItemSelected:I

    .line 41
    .line 42
    if-ge v10, v4, :cond_2

    .line 43
    .line 44
    aget-byte v11, p1, v10

    .line 45
    .line 46
    if-ne v11, v3, :cond_1

    .line 47
    .line 48
    aget-char v11, v9, v10

    .line 49
    .line 50
    shl-int/2addr v11, v3

    .line 51
    add-int/2addr v11, v3

    .line 52
    sub-int/2addr v11, v8

    .line 53
    int-to-char v8, v11

    .line 54
    aput-char v8, v2, v10

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    goto :goto_4

    .line 59
    :cond_1
    aget-char v11, v9, v10

    .line 60
    .line 61
    shl-int/2addr v11, v3

    .line 62
    sub-int/2addr v11, v8

    .line 63
    int-to-char v8, v11

    .line 64
    aput-char v8, v2, v10

    .line 65
    .line 66
    :goto_1
    aget-char v8, v2, v10

    .line 67
    .line 68
    add-int/lit8 v10, v10, 0x1

    .line 69
    .line 70
    sput v10, Lcom/guardsquare/dexguard/values;->onOptionsItemSelected:I

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    move-object v9, v2

    .line 74
    :cond_3
    if-lez v7, :cond_4

    .line 75
    .line 76
    new-array p1, v4, [C

    .line 77
    .line 78
    invoke-static {v9, v1, p1, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 79
    .line 80
    .line 81
    sub-int v2, v4, v7

    .line 82
    .line 83
    invoke-static {p1, v1, v9, v2, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 84
    .line 85
    .line 86
    invoke-static {p1, v7, v9, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 87
    .line 88
    .line 89
    :cond_4
    if-eqz p0, :cond_6

    .line 90
    .line 91
    new-array p0, v4, [C

    .line 92
    .line 93
    sput v1, Lcom/guardsquare/dexguard/values;->onOptionsItemSelected:I

    .line 94
    .line 95
    :goto_2
    sget p1, Lcom/guardsquare/dexguard/values;->onOptionsItemSelected:I

    .line 96
    .line 97
    if-ge p1, v4, :cond_5

    .line 98
    .line 99
    sub-int v2, v4, p1

    .line 100
    .line 101
    sub-int/2addr v2, v3

    .line 102
    aget-char v2, v9, v2

    .line 103
    .line 104
    aput-char v2, p0, p1

    .line 105
    .line 106
    add-int/lit8 p1, p1, 0x1

    .line 107
    .line 108
    sput p1, Lcom/guardsquare/dexguard/values;->onOptionsItemSelected:I

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_5
    move-object v9, p0

    .line 112
    :cond_6
    if-lez v6, :cond_7

    .line 113
    .line 114
    sput v1, Lcom/guardsquare/dexguard/values;->onOptionsItemSelected:I

    .line 115
    .line 116
    :goto_3
    sget p0, Lcom/guardsquare/dexguard/values;->onOptionsItemSelected:I

    .line 117
    .line 118
    if-ge p0, v4, :cond_7

    .line 119
    .line 120
    aget-char p1, v9, p0

    .line 121
    .line 122
    aget v2, p2, v5

    .line 123
    .line 124
    sub-int/2addr p1, v2

    .line 125
    int-to-char p1, p1

    .line 126
    aput-char p1, v9, p0

    .line 127
    .line 128
    add-int/lit8 p0, p0, 0x1

    .line 129
    .line 130
    sput p0, Lcom/guardsquare/dexguard/values;->onOptionsItemSelected:I

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_7
    new-instance p0, Ljava/lang/String;

    .line 134
    .line 135
    invoke-direct {p0, v9}, Ljava/lang/String;-><init>([C)V

    .line 136
    .line 137
    .line 138
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 139
    aput-object p0, p3, v1

    .line 140
    .line 141
    return-void

    .line 142
    :goto_4
    monitor-exit v0

    .line 143
    throw p0
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$3;->unregisterForContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 2
    .line 3
    const-string v1, "\u0000\u0000\u0001\u0000\u0000\u0000\u0000"

    .line 4
    .line 5
    const/4 v2, 0x7

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x1

    .line 8
    filled-new-array {v3, v2, v3, v4}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    new-array v5, v4, [Ljava/lang/Object;

    .line 13
    .line 14
    invoke-static {v4, v1, v2, v5}, Lcom/clevertap/android/pushsdk/registerForContextMenu$3;->registerForContextMenu(ZLjava/lang/String;[I[Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    aget-object v1, v5, v3

    .line 18
    .line 19
    check-cast v1, Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->registerForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$3;->unregisterForContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->registerForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;)Ljava/util/concurrent/ScheduledExecutorService;

    .line 31
    .line 32
    .line 33
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    const/4 v1, 0x0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    sget v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$3;->openContextMenu:I

    .line 38
    .line 39
    add-int/lit8 v0, v0, 0x45

    .line 40
    .line 41
    rem-int/lit16 v2, v0, 0x80

    .line 42
    .line 43
    sput v2, Lcom/clevertap/android/pushsdk/registerForContextMenu$3;->setContentView:I

    .line 44
    .line 45
    rem-int/lit8 v0, v0, 0x2

    .line 46
    .line 47
    iget-object p0, p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$3;->unregisterForContextMenu:Lcom/clevertap/android/pushsdk/registerForContextMenu;

    .line 48
    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    :try_start_1
    invoke-static {p0}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->registerForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;)Ljava/util/concurrent/ScheduledExecutorService;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-static {p0}, Lcom/clevertap/android/pushsdk/registerForContextMenu;->registerForContextMenu(Lcom/clevertap/android/pushsdk/registerForContextMenu;)Ljava/util/concurrent/ScheduledExecutorService;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdown()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 64
    .line 65
    .line 66
    :try_start_2
    throw v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 67
    :catchall_0
    move-exception p0

    .line 68
    throw p0

    .line 69
    :cond_1
    :goto_0
    sget p0, Lcom/clevertap/android/pushsdk/registerForContextMenu$3;->openContextMenu:I

    .line 70
    .line 71
    add-int/lit8 p0, p0, 0x17

    .line 72
    .line 73
    rem-int/lit16 v0, p0, 0x80

    .line 74
    .line 75
    sput v0, Lcom/clevertap/android/pushsdk/registerForContextMenu$3;->setContentView:I

    .line 76
    .line 77
    rem-int/lit8 p0, p0, 0x2

    .line 78
    .line 79
    if-eqz p0, :cond_2

    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    throw v1

    .line 83
    :catch_0
    move-exception p0

    .line 84
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 85
    .line 86
    .line 87
    return-void
.end method
