.class public Lcom/tencent/youtu/sdkkitframework/common/LogWriter;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final LOGFILE_TAG_NAME:Ljava/lang/String; = "logfile"

.field public static final LOG_CONFIGFILE_NAME:Ljava/lang/String; = "log.properties"

.field public static logWriter:Lcom/tencent/youtu/sdkkitframework/common/LogWriter;


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Ljava/io/PrintWriter;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "NativeLog"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "default.log"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->a:Ljava/lang/String;

    .line 50
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->a()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, "NativeLog"

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "default.log"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->a:Ljava/lang/String;

    .line 39
    .line 40
    iput-object p2, p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->d:Ljava/lang/String;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->c:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->a()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static declared-synchronized getLogWriter()Lcom/tencent/youtu/sdkkitframework/common/LogWriter;
    .locals 2

    .line 1
    const-class v0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->logWriter:Lcom/tencent/youtu/sdkkitframework/common/LogWriter;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->logWriter:Lcom/tencent/youtu/sdkkitframework/common/LogWriter;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->logWriter:Lcom/tencent/youtu/sdkkitframework/common/LogWriter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object v1

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v1
.end method

.method public static declared-synchronized getLogWriter(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/common/LogWriter;
    .locals 2

    const-class v0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;

    monitor-enter v0

    .line 24
    :try_start_0
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->logWriter:Lcom/tencent/youtu/sdkkitframework/common/LogWriter;

    if-nez v1, :cond_0

    .line 25
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;

    invoke-direct {v1, p0, p1}, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->logWriter:Lcom/tencent/youtu/sdkkitframework/common/LogWriter;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->logWriter:Lcom/tencent/youtu/sdkkitframework/common/LogWriter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 7

    .line 1
    :try_start_0
    const-string p0, "./workspace/temp/logger.log"

    .line 2
    .line 3
    const-string v0, "./workspace"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->getLogWriter(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/common/LogWriter;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "First log!"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->log(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v0, "\u7b2c\u4e8c\u4e2a\u65e5\u5fd7\u4fe1\u606f"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->log(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string v0, "Third log"

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->log(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v0, "\u7b2c\u56db\u4e2a\u65e5\u5fd7\u4fe1\u606f"

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    const-string v0, "tableaA|device_number|13701010"

    .line 30
    .line 31
    :try_start_1
    new-instance v1, Ljava/lang/StringBuffer;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 34
    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    :goto_0
    const v3, 0xf4240

    .line 38
    .line 39
    .line 40
    if-ge v2, v3, :cond_0

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 46
    .line 47
    .line 48
    const-string v3, ";\n"

    .line 49
    .line 50
    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 51
    .line 52
    .line 53
    add-int/lit8 v2, v2, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 61
    .line 62
    .line 63
    move-result-wide v1

    .line 64
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->log(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 68
    .line 69
    .line 70
    move-result-wide v3

    .line 71
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 72
    .line 73
    new-instance v5, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string v6, "\u603b\u6d88\u8017\u65f6\u95f4\uff1a"

    .line 79
    .line 80
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    sub-long/2addr v3, v1

    .line 84
    invoke-virtual {v5, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :catch_0
    move-exception p0

    .line 99
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 100
    .line 101
    .line 102
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 6

    .line 1
    const-string v0, "\u65e0\u6cd5\u6253\u5f00\u5c5e\u6027\u914d\u7f6e\u6587\u4ef6: log.properties"

    .line 2
    .line 3
    const-string v1, "\u65e5\u5fd7\u6587\u4ef6\u7684\u4f4d\u7f6e\uff1a"

    .line 4
    .line 5
    const-string v2, "init()"

    .line 6
    .line 7
    const-string v3, "LogWriter"

    .line 8
    .line 9
    invoke-static {v3, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Ljava/io/File;

    .line 13
    .line 14
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->d:Ljava/lang/String;

    .line 15
    .line 16
    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-nez v4, :cond_0

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->c:Ljava/lang/String;

    .line 29
    .line 30
    if-nez v2, :cond_2

    .line 31
    .line 32
    :try_start_0
    new-instance v2, Ljava/util/Properties;

    .line 33
    .line 34
    invoke-direct {v2}, Ljava/util/Properties;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    const-string v5, "log.properties"

    .line 42
    .line 43
    invoke-virtual {v4, v5}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    if-eqz v4, :cond_1

    .line 48
    .line 49
    invoke-virtual {v2, v4}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 53
    .line 54
    .line 55
    const-string v4, "logfile"

    .line 56
    .line 57
    invoke-virtual {v2, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 63
    .line 64
    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :catch_0
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 69
    .line 70
    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :goto_0
    const/4 v0, 0x0

    .line 74
    :goto_1
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->c:Ljava/lang/String;

    .line 75
    .line 76
    if-nez v0, :cond_2

    .line 77
    .line 78
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->a:Ljava/lang/String;

    .line 79
    .line 80
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->c:Ljava/lang/String;

    .line 81
    .line 82
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v2, "logFileName: "

    .line 85
    .line 86
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->c:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-static {v3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    new-instance v0, Ljava/io/File;

    .line 102
    .line 103
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->c:Ljava/lang/String;

    .line 104
    .line 105
    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :try_start_1
    new-instance v2, Ljava/io/PrintWriter;

    .line 109
    .line 110
    new-instance v3, Ljava/io/FileWriter;

    .line 111
    .line 112
    const/4 v4, 0x0

    .line 113
    invoke-direct {v3, v0, v4}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    .line 114
    .line 115
    .line 116
    const/4 v4, 0x1

    .line 117
    invoke-direct {v2, v3, v4}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;Z)V

    .line 118
    .line 119
    .line 120
    iput-object v2, p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->b:Ljava/io/PrintWriter;

    .line 121
    .line 122
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 123
    .line 124
    new-instance v2, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :catch_1
    move-exception p0

    .line 145
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    new-instance v1, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    const-string v2, "\u65e0\u6cd5\u6253\u5f00\u65e5\u5fd7\u6587\u4ef6:"

    .line 152
    .line 153
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    new-instance v1, Ljava/lang/Exception;

    .line 164
    .line 165
    invoke-direct {v1, v0, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 166
    .line 167
    .line 168
    throw v1
.end method

.method public close()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->logWriter:Lcom/tencent/youtu/sdkkitframework/common/LogWriter;

    .line 3
    .line 4
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->b:Ljava/io/PrintWriter;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/io/PrintWriter;->close()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public declared-synchronized log(Ljava/lang/Exception;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->b:Ljava/io/PrintWriter;

    .line 3
    .line 4
    new-instance v1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v2, Ljava/util/Date;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, ": "

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->b:Ljava/io/PrintWriter;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    .line 34
    monitor-exit p0

    .line 35
    return-void

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    throw p1
.end method

.method public declared-synchronized log(Ljava/lang/String;)V
    .locals 3

    monitor-enter p0

    .line 39
    :try_start_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->b:Ljava/io/PrintWriter;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
