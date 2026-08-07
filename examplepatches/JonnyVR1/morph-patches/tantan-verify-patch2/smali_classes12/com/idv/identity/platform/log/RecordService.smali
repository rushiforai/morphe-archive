.class public Lcom/idv/identity/platform/log/RecordService;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static LOG_FILE_NAME:Ljava/lang/String; = null

.field private static final MAX_RECORD_COUNT:I = 0xa

.field private static s_instance:Lcom/idv/identity/platform/log/RecordService;


# instance fields
.field private clientIdx:I

.field private records:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/idv/identity/platform/log/RecordBase;",
            ">;"
        }
    .end annotation
.end field

.field private simpleDateFormat:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/idv/identity/platform/log/RecordService;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/idv/identity/platform/log/RecordService;->s_instance:Lcom/idv/identity/platform/log/RecordService;

    .line 7
    .line 8
    const-string v0, "idv_identity_platform_log"

    .line 9
    .line 10
    sput-object v0, Lcom/idv/identity/platform/log/RecordService;->LOG_FILE_NAME:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 5
    .line 6
    const-string v1, "yyyy-MM-dd HH:mm:ss:SSS"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/idv/identity/platform/log/RecordService;->simpleDateFormat:Ljava/text/SimpleDateFormat;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/idv/identity/platform/log/RecordService;->clientIdx:I

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/idv/identity/platform/log/RecordService;->records:Ljava/util/List;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic access$000(Lcom/idv/identity/platform/log/RecordService;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/platform/log/RecordService;->cacheLogs(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private cacheLogs(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    goto/16 :goto_b

    .line 14
    .line 15
    :cond_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordConst;->getLogFilePath()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    new-instance v1, Ljava/io/File;

    .line 26
    .line 27
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/io/File;->length()J

    .line 37
    .line 38
    .line 39
    move-result-wide v2

    .line 40
    const-wide/32 v4, 0x100000

    .line 41
    .line 42
    .line 43
    cmp-long v2, v2, v4

    .line 44
    .line 45
    if-lez v2, :cond_1

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    .line 50
    :cond_1
    const/4 v1, 0x0

    .line 51
    :try_start_1
    new-instance v2, Ljava/io/FileWriter;

    .line 52
    .line 53
    const/4 v3, 0x1

    .line 54
    invoke-direct {v2, v0, v3}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 55
    .line 56
    .line 57
    :try_start_2
    new-instance v0, Ljava/io/BufferedWriter;

    .line 58
    .line 59
    invoke-direct {v0, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 60
    .line 61
    .line 62
    :try_start_3
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_2

    .line 71
    .line 72
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    const-string v1, "\n"

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :catchall_1
    move-exception p1

    .line 88
    move-object v1, v0

    .line 89
    goto/16 :goto_7

    .line 90
    .line 91
    :catch_0
    move-exception p1

    .line 92
    move-object v1, v0

    .line 93
    goto :goto_2

    .line 94
    :cond_2
    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2}, Ljava/io/Writer;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 98
    .line 99
    .line 100
    goto :goto_6

    .line 101
    :catch_1
    move-exception p1

    .line 102
    :try_start_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    const-string v1, "cacheLog error: "

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 123
    goto :goto_5

    .line 124
    :catchall_2
    move-exception p1

    .line 125
    goto :goto_7

    .line 126
    :catch_2
    move-exception p1

    .line 127
    goto :goto_2

    .line 128
    :catchall_3
    move-exception p1

    .line 129
    move-object v2, v1

    .line 130
    goto :goto_7

    .line 131
    :catch_3
    move-exception p1

    .line 132
    move-object v2, v1

    .line 133
    :goto_2
    :try_start_6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    const-string v3, "cacheLog error: "

    .line 139
    .line 140
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-static {p1}, Ll/o6r0;->c(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 155
    .line 156
    .line 157
    if-eqz v1, :cond_3

    .line 158
    .line 159
    :try_start_7
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->close()V

    .line 160
    .line 161
    .line 162
    goto :goto_3

    .line 163
    :catch_4
    move-exception p1

    .line 164
    goto :goto_4

    .line 165
    :cond_3
    :goto_3
    if-eqz v2, :cond_4

    .line 166
    .line 167
    invoke-virtual {v2}, Ljava/io/Writer;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 168
    .line 169
    .line 170
    goto :goto_6

    .line 171
    :goto_4
    :try_start_8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    .line 175
    .line 176
    const-string v1, "cacheLog error: "

    .line 177
    .line 178
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    goto :goto_1

    .line 189
    :goto_5
    invoke-static {p1}, Ll/o6r0;->c(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    :cond_4
    :goto_6
    monitor-exit p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 193
    return-void

    .line 194
    :goto_7
    if-eqz v1, :cond_5

    .line 195
    .line 196
    :try_start_9
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->close()V

    .line 197
    .line 198
    .line 199
    goto :goto_8

    .line 200
    :catch_5
    move-exception v0

    .line 201
    goto :goto_9

    .line 202
    :cond_5
    :goto_8
    if-eqz v2, :cond_6

    .line 203
    .line 204
    invoke-virtual {v2}, Ljava/io/Writer;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 205
    .line 206
    .line 207
    goto :goto_a

    .line 208
    :goto_9
    :try_start_a
    new-instance v1, Ljava/lang/StringBuilder;

    .line 209
    .line 210
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 211
    .line 212
    .line 213
    const-string v2, "cacheLog error: "

    .line 214
    .line 215
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    invoke-static {v0}, Ll/o6r0;->c(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    :cond_6
    :goto_a
    throw p1

    .line 233
    :goto_b
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 234
    throw p1
.end method

.method private deleteLogFile()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordConst;->getLogFilePath()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/io/File;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static getInstance()Lcom/idv/identity/platform/log/RecordService;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/platform/log/RecordService;->s_instance:Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    return-object v0
.end method

.method private readCacheLogs()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/idv/identity/platform/log/RecordConst;->getLogFilePath()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ljava/io/File;

    .line 11
    .line 12
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-nez v2, :cond_0

    .line 20
    .line 21
    goto :goto_4

    .line 22
    :cond_0
    const/4 v2, 0x0

    .line 23
    :try_start_0
    new-instance v3, Ljava/io/FileReader;

    .line 24
    .line 25
    invoke-direct {v3, v0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 26
    .line 27
    .line 28
    :try_start_1
    new-instance v0, Ljava/io/BufferedReader;

    .line 29
    .line 30
    invoke-direct {v0, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 31
    .line 32
    .line 33
    :goto_0
    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    :goto_1
    move-object v2, v3

    .line 45
    goto :goto_5

    .line 46
    :catch_0
    move-exception v2

    .line 47
    goto :goto_3

    .line 48
    :cond_1
    :try_start_3
    invoke-virtual {v3}, Ljava/io/Reader;->close()V

    .line 49
    .line 50
    .line 51
    :goto_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 52
    .line 53
    .line 54
    :catch_1
    :cond_2
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 55
    .line 56
    .line 57
    goto :goto_4

    .line 58
    :catchall_1
    move-exception p0

    .line 59
    move-object v0, v2

    .line 60
    goto :goto_1

    .line 61
    :catch_2
    move-exception v0

    .line 62
    move-object v4, v2

    .line 63
    move-object v2, v0

    .line 64
    move-object v0, v4

    .line 65
    goto :goto_3

    .line 66
    :catchall_2
    move-exception p0

    .line 67
    move-object v0, v2

    .line 68
    goto :goto_5

    .line 69
    :catch_3
    move-exception v0

    .line 70
    move-object v3, v2

    .line 71
    move-object v2, v0

    .line 72
    move-object v0, v3

    .line 73
    :goto_3
    :try_start_4
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 74
    .line 75
    .line 76
    if-eqz v3, :cond_3

    .line 77
    .line 78
    :try_start_5
    invoke-virtual {v3}, Ljava/io/Reader;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 79
    .line 80
    .line 81
    :cond_3
    if-eqz v0, :cond_2

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :goto_4
    return-object p0

    .line 85
    :goto_5
    if-eqz v2, :cond_4

    .line 86
    .line 87
    :try_start_6
    invoke-virtual {v2}, Ljava/io/Reader;->close()V

    .line 88
    .line 89
    .line 90
    :cond_4
    if-eqz v0, :cond_5

    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    .line 93
    .line 94
    .line 95
    :catch_4
    :cond_5
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 96
    .line 97
    .line 98
    throw p0
.end method

.method public static recordAlertAppear(Ljava/lang/String;)V
    .locals 4

    .line 1
    sget-object v0, Ll/dfm;->f:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "exitAlertAppear"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "CODE_OVER_TIME"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const-string p0, "timeOutAlertAppear"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    sget-object v0, Ll/dfm;->l:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string p0, "overTimesAlertAppear"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const-string p0, "interruptedAlertAppear"

    .line 35
    .line 36
    :goto_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 41
    .line 42
    const-string v2, "PAGER_BEHAVIOR"

    .line 43
    .line 44
    const-string v3, "FACE"

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2, p0, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static recordAlertBtn(Ljava/lang/String;)V
    .locals 4

    .line 1
    sget-object v0, Ll/dfm;->f:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "exitConfirmBtn"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "CODE_OVER_TIME"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const-string p0, "timeOutRetryBtn"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    sget-object v0, Ll/dfm;->l:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string p0, "overTimesExitBtn"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const-string p0, "interruptedRetryBtn"

    .line 35
    .line 36
    :goto_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 41
    .line 42
    const-string v2, "PAGER_BEHAVIOR"

    .line 43
    .line 44
    const-string v3, "FACE"

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2, p0, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static recordAlertCancel(Ljava/lang/String;)V
    .locals 4

    .line 1
    sget-object v0, Ll/dfm;->f:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "exitCancelBtn"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "CODE_OVER_TIME"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const-string p0, "timeOutExitBtn"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    sget-object v0, Ll/dfm;->l:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string p0, "overTimesExitBtn"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const-string p0, "interruptedRetryBtn"

    .line 35
    .line 36
    :goto_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 41
    .line 42
    const-string v2, "PAGER_BEHAVIOR"

    .line 43
    .line 44
    const-string v3, "FACE"

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2, p0, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static recordAlertClose(Ljava/lang/String;)V
    .locals 4

    .line 1
    sget-object v0, Ll/dfm;->f:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "exitAlertClose"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "CODE_OVER_TIME"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const-string p0, "timeOutAlertClose"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    sget-object v0, Ll/dfm;->l:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string p0, "overTimesAlertClose"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const-string p0, "interruptedAlertClose"

    .line 35
    .line 36
    :goto_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 41
    .line 42
    const-string v2, "PAGER_BEHAVIOR"

    .line 43
    .line 44
    const-string v3, "FACE"

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2, p0, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private varargs recordEventEx(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 5

    .line 1
    iget v0, p0, Lcom/idv/identity/platform/log/RecordService;->clientIdx:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/idv/identity/platform/log/RecordService;->clientIdx:I

    .line 6
    .line 7
    const/16 v1, 0x2710

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-le v0, v1, :cond_0

    .line 11
    .line 12
    iput v2, p0, Lcom/idv/identity/platform/log/RecordService;->clientIdx:I

    .line 13
    .line 14
    :cond_0
    new-instance v0, Lcom/idv/identity/platform/log/EventRecord;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/idv/identity/platform/log/EventRecord;-><init>()V

    .line 17
    .line 18
    .line 19
    iget v1, p0, Lcom/idv/identity/platform/log/RecordService;->clientIdx:I

    .line 20
    .line 21
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/log/RecordBase;->setLogIdx(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/log/RecordBase;->setLogLevel(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p2}, Lcom/idv/identity/platform/log/RecordBase;->setActionName(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    new-instance p1, Ljava/util/HashMap;

    .line 39
    .line 40
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 41
    .line 42
    .line 43
    if-eqz p3, :cond_1

    .line 44
    .line 45
    array-length v1, p3

    .line 46
    rem-int/lit8 v1, v1, 0x2

    .line 47
    .line 48
    if-nez v1, :cond_1

    .line 49
    .line 50
    move v1, v2

    .line 51
    :goto_0
    array-length v3, p3

    .line 52
    add-int/lit8 v3, v3, -0x1

    .line 53
    .line 54
    if-ge v1, v3, :cond_1

    .line 55
    .line 56
    aget-object v3, p3, v1

    .line 57
    .line 58
    add-int/lit8 v4, v1, 0x1

    .line 59
    .line 60
    aget-object v4, p3, v4

    .line 61
    .line 62
    invoke-interface {p1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    add-int/lit8 v1, v1, 0x2

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    .line 69
    .line 70
    .line 71
    move-result p3

    .line 72
    if-eqz p3, :cond_2

    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    new-instance p3, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    const-string v1, "action("

    .line 78
    .line 79
    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget v1, p0, Lcom/idv/identity/platform/log/RecordService;->clientIdx:I

    .line 83
    .line 84
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v1, ")=> "

    .line 88
    .line 89
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string p2, " "

    .line 96
    .line 97
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    invoke-static {p2}, Ll/o6r0;->a(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/log/RecordBase;->setBizParam(Ljava/util/Map;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/idv/identity/platform/log/RecordService;->records:Ljava/util/List;

    .line 118
    .line 119
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    invoke-direct {p0, v2}, Lcom/idv/identity/platform/log/RecordService;->tryUpload(Z)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public static recordOcrAlertAppear(Ljava/lang/String;)V
    .locals 1

    .line 118
    const-string v0, "OCR_SCAN"

    invoke-static {p0, v0}, Lcom/idv/identity/platform/log/RecordService;->recordOcrAlertAppear(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static recordOcrAlertAppear(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string p1, "ocr_failed_code"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const-string v0, "interruptedAlertAppear"

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p1, "ocr_over_time_code"

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    const-string v0, "overTimesAlertAppear"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const-string p1, "ocr_exit_code"

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    const-string v0, "exitAlertAppear"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const-string p1, "ocr_network_error_code"

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_3

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    const-string p1, "ocr_out_time_code"

    .line 44
    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_4

    .line 50
    .line 51
    const-string v0, "timeOutAlertAppear"

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_4
    const-string p1, "ocr_msg_error_code"

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_5

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_5
    const-string p1, "OCR_PERM_ERROR_CODE"

    .line 64
    .line 65
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_6

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_6
    const-string p1, "OCR_TYPE_ERROR_CODE"

    .line 73
    .line 74
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_7

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_7
    const-string p1, "ORC_RES_PAGE_EXIT_CODE"

    .line 82
    .line 83
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-eqz p1, :cond_8

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_8
    const-string p1, "ORC_RES_PAGE_NET_ERROR_CODE"

    .line 91
    .line 92
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_9

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_9
    const-string p1, "ORC_RES_PAGE_INFO_EMPTY_CODE"

    .line 100
    .line 101
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    :goto_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    sget-object p1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 109
    .line 110
    const-string v1, "PAGER_BEHAVIOR"

    .line 111
    .line 112
    const-string v2, "OCR_SCAN"

    .line 113
    .line 114
    invoke-virtual {p0, p1, v1, v0, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public static recordOcrAlertCancel(Ljava/lang/String;)V
    .locals 1

    .line 116
    const-string v0, "OCR_SCAN"

    invoke-static {p0, v0}, Lcom/idv/identity/platform/log/RecordService;->recordOcrAlertCancel(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static recordOcrAlertCancel(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "ocr_failed_code"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "interruptedRetryBtn"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "ocr_over_time_code"

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const-string v1, "overTimesExitBtn"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const-string v0, "ocr_exit_code"

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    const-string v1, "exitCancelBtn"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const-string v0, "ocr_network_error_code"

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    const-string v0, "ocr_out_time_code"

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_4

    .line 50
    .line 51
    const-string v1, "timeOutExitBtn"

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_4
    const-string v0, "ocr_msg_error_code"

    .line 55
    .line 56
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_5
    const-string v0, "OCR_PERM_ERROR_CODE"

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_6

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_6
    const-string v0, "OCR_TYPE_ERROR_CODE"

    .line 73
    .line 74
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_7

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_7
    const-string v0, "ORC_RES_PAGE_EXIT_CODE"

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_8

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_8
    const-string v0, "ORC_RES_PAGE_NET_ERROR_CODE"

    .line 91
    .line 92
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_9

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_9
    const-string v0, "ORC_RES_PAGE_INFO_EMPTY_CODE"

    .line 100
    .line 101
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    :goto_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 109
    .line 110
    const-string v2, "PAGER_BEHAVIOR"

    .line 111
    .line 112
    invoke-virtual {p0, v0, v2, v1, p1}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public static recordOcrAlertClose(Ljava/lang/String;)V
    .locals 1

    .line 116
    const-string v0, "OCR_SCAN"

    invoke-static {p0, v0}, Lcom/idv/identity/platform/log/RecordService;->recordOcrAlertClose(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static recordOcrAlertClose(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "ocr_failed_code"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "interruptedAlertClose"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "ocr_over_time_code"

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const-string v1, "overTimesAlertClose"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const-string v0, "ocr_exit_code"

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    const-string v1, "exitAlertClose"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const-string v0, "ocr_network_error_code"

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    const-string v0, "ocr_out_time_code"

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_4

    .line 50
    .line 51
    const-string v1, "timeOutAlertClose"

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_4
    const-string v0, "ocr_msg_error_code"

    .line 55
    .line 56
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_5
    const-string v0, "OCR_PERM_ERROR_CODE"

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_6

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_6
    const-string v0, "OCR_TYPE_ERROR_CODE"

    .line 73
    .line 74
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_7

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_7
    const-string v0, "ORC_RES_PAGE_EXIT_CODE"

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_8

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_8
    const-string v0, "ORC_RES_PAGE_NET_ERROR_CODE"

    .line 91
    .line 92
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_9

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_9
    const-string v0, "ORC_RES_PAGE_INFO_EMPTY_CODE"

    .line 100
    .line 101
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    :goto_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 109
    .line 110
    const-string v2, "PAGER_BEHAVIOR"

    .line 111
    .line 112
    invoke-virtual {p0, v0, v2, v1, p1}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public static recordOcrAlertConfirm(Ljava/lang/String;)V
    .locals 1

    .line 116
    const-string v0, "OCR_SCAN"

    invoke-static {p0, v0}, Lcom/idv/identity/platform/log/RecordService;->recordOcrAlertConfirm(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static recordOcrAlertConfirm(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "ocr_failed_code"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "interruptedRetryBtn"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "ocr_over_time_code"

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const-string v1, "overTimesExitBtn"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const-string v0, "ocr_exit_code"

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    const-string v1, "exitConfirmBtn"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const-string v0, "ocr_network_error_code"

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    const-string v0, "ocr_out_time_code"

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_4

    .line 50
    .line 51
    const-string v1, "timeOutRetryBtn"

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_4
    const-string v0, "ocr_msg_error_code"

    .line 55
    .line 56
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_5
    const-string v0, "OCR_PERM_ERROR_CODE"

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_6

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_6
    const-string v0, "OCR_TYPE_ERROR_CODE"

    .line 73
    .line 74
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_7

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_7
    const-string v0, "ORC_RES_PAGE_EXIT_CODE"

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_8

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_8
    const-string v0, "ORC_RES_PAGE_NET_ERROR_CODE"

    .line 91
    .line 92
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_9

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_9
    const-string v0, "ORC_RES_PAGE_INFO_EMPTY_CODE"

    .line 100
    .line 101
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    :goto_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 109
    .line 110
    const-string v2, "PAGER_BEHAVIOR"

    .line 111
    .line 112
    invoke-virtual {p0, v0, v2, v1, p1}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method private tryUpload(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/log/RecordService;->records:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0xa

    .line 8
    .line 9
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/idv/identity/platform/log/RecordService;->records:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lcom/idv/identity/platform/log/RecordBase;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/idv/identity/platform/log/RecordBase;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget-object v0, p0, Lcom/idv/identity/platform/log/RecordService;->records:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0}, Lcom/idv/identity/platform/log/RecordService;->readCacheLogs()Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    invoke-direct {p0}, Lcom/idv/identity/platform/log/RecordService;->deleteLogFile()V

    .line 58
    .line 59
    .line 60
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-gtz v0, :cond_2

    .line 65
    .line 66
    :goto_1
    return-void

    .line 67
    :cond_2
    new-instance v0, Lcom/idv/identity/platform/log/RecordService$1;

    .line 68
    .line 69
    invoke-direct {v0, p0}, Lcom/idv/identity/platform/log/RecordService$1;-><init>(Lcom/idv/identity/platform/log/RecordService;)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x0

    .line 73
    invoke-static {p1, p0, v0}, Ll/qk20;->j(Ljava/util/List;ZLl/n3k0;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 2

    .line 1
    const-class v0, Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    invoke-direct {p0, v1}, Lcom/idv/identity/platform/log/RecordService;->tryUpload(Z)V

    .line 6
    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    throw p0
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/idv/identity/platform/log/RecordService;->clientIdx:I

    .line 6
    .line 7
    invoke-static {p2}, Lcom/idv/identity/platform/log/RecordConst;->setClientId(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p3}, Lcom/idv/identity/platform/log/RecordConst;->setClientVersion(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p4}, Lcom/idv/identity/platform/log/RecordConst;->setDeviceId(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p5}, Lcom/idv/identity/platform/log/RecordConst;->setSessionId(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p6}, Lcom/idv/identity/platform/log/RecordConst;->setPhonePrint(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p7}, Lcom/idv/identity/platform/log/RecordConst;->setOsVersion(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p8}, Lcom/idv/identity/platform/log/RecordConst;->setNetType(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p9}, Lcom/idv/identity/platform/log/RecordConst;->setScreenMetrics(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p0}, Lcom/idv/identity/platform/log/RecordConst;->setPackageName(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    add-int/lit8 p1, p1, -0x1

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    const/16 p2, 0x2f

    .line 57
    .line 58
    if-eq p1, p2, :cond_1

    .line 59
    .line 60
    const-string p1, "/"

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    sget-object p0, Lcom/idv/identity/platform/log/RecordService;->LOG_FILE_NAME:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string p1, "logFilePath: "

    .line 84
    .line 85
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-static {p1}, Ll/o6r0;->a(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p0}, Lcom/idv/identity/platform/log/RecordConst;->setLogFilePath(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public varargs recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1

    .line 1
    const-class v0, Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lcom/idv/identity/platform/log/RecordService;->recordEventEx(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    monitor-exit v0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p0
.end method

.method public recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 48
    const-string v5, ""

    const-string v6, ""

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v6}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 13

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->i0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v4

    .line 9
    iget-object v0, p0, Lcom/idv/identity/platform/log/RecordService;->simpleDateFormat:Ljava/text/SimpleDateFormat;

    .line 10
    .line 11
    new-instance v1, Ljava/util/Date;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const-string v9, "currentAlert"

    .line 21
    .line 22
    const-string v11, "eventName"

    .line 23
    .line 24
    const-string v1, "time"

    .line 25
    .line 26
    const-string v3, "productCode"

    .line 27
    .line 28
    const-string v5, "currentPage"

    .line 29
    .line 30
    const-string v7, "cost"

    .line 31
    .line 32
    move-object/from16 v12, p3

    .line 33
    .line 34
    move-object/from16 v6, p4

    .line 35
    .line 36
    move-object/from16 v10, p5

    .line 37
    .line 38
    move-object/from16 v8, p6

    .line 39
    .line 40
    filled-new-array/range {v1 .. v12}, [Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, p1, p2, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 42
    const-string v4, ""

    const-string v5, ""

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/idv/identity/platform/log/RecordService;->recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 11

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->i0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v6

    .line 9
    iget-object v0, p0, Lcom/idv/identity/platform/log/RecordService;->simpleDateFormat:Ljava/text/SimpleDateFormat;

    .line 10
    .line 11
    new-instance v1, Ljava/util/Date;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const-string v7, "cost"

    .line 21
    .line 22
    const-string v9, "exitReason"

    .line 23
    .line 24
    const-string v1, "time"

    .line 25
    .line 26
    const-string v3, "currentPage"

    .line 27
    .line 28
    const-string v5, "productCode"

    .line 29
    .line 30
    move-object v4, p3

    .line 31
    move-object v8, p4

    .line 32
    move-object/from16 v10, p5

    .line 33
    .line 34
    filled-new-array/range {v1 .. v10}, [Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    invoke-virtual {p0, p1, p2, p3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public recordException(Ljava/lang/Throwable;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string p1, "Null"

    .line 29
    .line 30
    :goto_0
    const-string v2, "exception"

    .line 31
    .line 32
    const-string v3, "errMsg"

    .line 33
    .line 34
    filled-new-array {v2, v1, v3, p1}, [Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string v1, "FaceVerify"

    .line 39
    .line 40
    invoke-virtual {p0, v0, v1, p1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
