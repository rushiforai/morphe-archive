.class public Lcom/tantanapp/media/ttmediautils/app/AppContext;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static DEBUGGABLE:Z

.field private static currentProcessName:Ljava/lang/String;

.field public static sContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getContext()Landroid/content/Context;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediautils/app/AppContext;->sContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getCurrentProcessName()Ljava/lang/String;
    .locals 8

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediautils/app/AppContext;->sContext:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    sget-object v0, Lcom/tantanapp/media/ttmediautils/app/AppContext;->currentProcessName:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    sget-object v0, Lcom/tantanapp/media/ttmediautils/app/AppContext;->currentProcessName:Ljava/lang/String;

    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_1
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const-string v2, ""

    .line 23
    .line 24
    if-gtz v0, :cond_2

    .line 25
    .line 26
    return-object v2

    .line 27
    :cond_2
    invoke-static {}, Lcom/tantanapp/media/ttmediautils/app/AppContext;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string v4, "activity"

    .line 32
    .line 33
    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Landroid/app/ActivityManager;

    .line 38
    .line 39
    :try_start_0
    invoke-virtual {v3}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-eqz v4, :cond_4

    .line 52
    .line 53
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    check-cast v4, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 58
    .line 59
    iget v5, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    if-ne v5, v0, :cond_3

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catch_0
    :cond_4
    move-object v4, v1

    .line 65
    :goto_0
    if-eqz v4, :cond_5

    .line 66
    .line 67
    iget-object v0, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    .line 68
    .line 69
    return-object v0

    .line 70
    :cond_5
    const/16 v3, 0x80

    .line 71
    .line 72
    new-array v4, v3, [B

    .line 73
    .line 74
    :try_start_1
    new-instance v5, Ljava/io/FileInputStream;

    .line 75
    .line 76
    new-instance v6, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    const-string v7, "/proc/"

    .line 82
    .line 83
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string v0, "/cmdline"

    .line 90
    .line 91
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-direct {v5, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 99
    .line 100
    .line 101
    :try_start_2
    invoke-virtual {v5, v4}, Ljava/io/FileInputStream;->read([B)I

    .line 102
    .line 103
    .line 104
    move-result v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 105
    if-gtz v0, :cond_6

    .line 106
    .line 107
    invoke-static {v5}, Lcom/tantanapp/media/ttmediautils/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 108
    .line 109
    .line 110
    return-object v2

    .line 111
    :cond_6
    const/4 v1, 0x0

    .line 112
    move v6, v1

    .line 113
    :goto_1
    if-ge v6, v0, :cond_8

    .line 114
    .line 115
    :try_start_3
    aget-byte v7, v4, v6

    .line 116
    .line 117
    if-gt v7, v3, :cond_7

    .line 118
    .line 119
    if-lez v7, :cond_7

    .line 120
    .line 121
    add-int/lit8 v6, v6, 0x1

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_7
    move v0, v6

    .line 125
    goto :goto_2

    .line 126
    :catchall_0
    move-exception v0

    .line 127
    move-object v1, v5

    .line 128
    goto :goto_4

    .line 129
    :catch_1
    move-exception v0

    .line 130
    move-object v1, v5

    .line 131
    goto :goto_3

    .line 132
    :cond_8
    :goto_2
    new-instance v3, Ljava/lang/String;

    .line 133
    .line 134
    invoke-direct {v3, v4, v1, v0}, Ljava/lang/String;-><init>([BII)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 135
    .line 136
    .line 137
    invoke-static {v5}, Lcom/tantanapp/media/ttmediautils/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 138
    .line 139
    .line 140
    return-object v3

    .line 141
    :catchall_1
    move-exception v0

    .line 142
    goto :goto_4

    .line 143
    :catch_2
    move-exception v0

    .line 144
    :goto_3
    :try_start_4
    const-class v3, Lcom/tantanapp/media/ttmediautils/app/AppContext;

    .line 145
    .line 146
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    invoke-static {v3, v0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 151
    .line 152
    .line 153
    invoke-static {v1}, Lcom/tantanapp/media/ttmediautils/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 154
    .line 155
    .line 156
    return-object v2

    .line 157
    :goto_4
    invoke-static {v1}, Lcom/tantanapp/media/ttmediautils/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 158
    .line 159
    .line 160
    throw v0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/tantanapp/media/ttmediautils/app/AppContext;->sContext:Landroid/content/Context;

    .line 2
    .line 3
    return-void
.end method

.method public static openDebug()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Lcom/tantanapp/media/ttmediautils/app/AppContext;->DEBUGGABLE:Z

    .line 3
    .line 4
    return-void
.end method
