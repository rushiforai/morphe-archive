.class public Lcom/xiaomi/push/service/b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile a:Lcom/xiaomi/push/service/b;


# instance fields
.field private a:Landroid/content/Context;

.field private final a:Ljava/lang/Object;

.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/Object;

.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;

.field private final d:Ljava/lang/String;

.field private volatile e:Ljava/lang/String;

.field private volatile f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/xiaomi/push/service/b;->a:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/Object;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/xiaomi/push/service/b;->b:Ljava/lang/Object;

    .line 17
    .line 18
    const-string v0, "mipush_region"

    .line 19
    .line 20
    iput-object v0, p0, Lcom/xiaomi/push/service/b;->a:Ljava/lang/String;

    .line 21
    .line 22
    const-string v0, "mipush_country_code"

    .line 23
    .line 24
    iput-object v0, p0, Lcom/xiaomi/push/service/b;->b:Ljava/lang/String;

    .line 25
    .line 26
    const-string v0, "mipush_region.lock"

    .line 27
    .line 28
    iput-object v0, p0, Lcom/xiaomi/push/service/b;->c:Ljava/lang/String;

    .line 29
    .line 30
    const-string v0, "mipush_country_code.lock"

    .line 31
    .line 32
    iput-object v0, p0, Lcom/xiaomi/push/service/b;->d:Ljava/lang/String;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/xiaomi/push/service/b;->a:Landroid/content/Context;

    .line 35
    .line 36
    return-void
.end method

.method public static a(Landroid/content/Context;)Lcom/xiaomi/push/service/b;
    .locals 2

    .line 177
    sget-object v0, Lcom/xiaomi/push/service/b;->a:Lcom/xiaomi/push/service/b;

    if-nez v0, :cond_1

    .line 178
    const-class v0, Lcom/xiaomi/push/service/b;

    monitor-enter v0

    .line 179
    :try_start_0
    sget-object v1, Lcom/xiaomi/push/service/b;->a:Lcom/xiaomi/push/service/b;

    if-nez v1, :cond_0

    .line 180
    new-instance v1, Lcom/xiaomi/push/service/b;

    invoke-direct {v1, p0}, Lcom/xiaomi/push/service/b;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/xiaomi/push/service/b;->a:Lcom/xiaomi/push/service/b;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 181
    :cond_0
    :goto_0
    monitor-exit v0

    goto :goto_2

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 182
    :cond_1
    :goto_2
    sget-object p0, Lcom/xiaomi/push/service/b;->a:Lcom/xiaomi/push/service/b;

    return-object p0
.end method

.method private a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance p0, Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance p0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string p1, "No ready file to get data from "

    .line 20
    .line 21
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-object v1

    .line 35
    :cond_0
    monitor-enter p4

    .line 36
    :try_start_0
    new-instance p2, Ljava/io/File;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-direct {p2, p1, p3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p2}, Ll/j6r0;->f(Ljava/io/File;)Z

    .line 46
    .line 47
    .line 48
    new-instance p1, Ljava/io/RandomAccessFile;

    .line 49
    .line 50
    const-string p3, "rw"

    .line 51
    .line 52
    invoke-direct {p1, p2, p3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 53
    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-virtual {p2}, Ljava/nio/channels/FileChannel;->lock()Ljava/nio/channels/FileLock;

    .line 60
    .line 61
    .line 62
    move-result-object p2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 63
    :try_start_2
    invoke-static {p0}, Ll/j6r0;->a(Ljava/io/File;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 67
    if-eqz p2, :cond_1

    .line 68
    .line 69
    :try_start_3
    invoke-virtual {p2}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 70
    .line 71
    .line 72
    move-result p3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 73
    if-eqz p3, :cond_1

    .line 74
    .line 75
    :try_start_4
    invoke-virtual {p2}, Ljava/nio/channels/FileLock;->release()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :catchall_0
    move-exception p0

    .line 80
    goto :goto_5

    .line 81
    :catch_0
    move-exception p2

    .line 82
    :try_start_5
    invoke-static {p2}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 83
    .line 84
    .line 85
    :cond_1
    :goto_0
    invoke-static {p1}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 86
    .line 87
    .line 88
    monitor-exit p4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 89
    return-object p0

    .line 90
    :catchall_1
    move-exception p0

    .line 91
    move-object v1, p2

    .line 92
    goto :goto_3

    .line 93
    :catch_1
    move-exception p0

    .line 94
    goto :goto_1

    .line 95
    :catchall_2
    move-exception p0

    .line 96
    goto :goto_3

    .line 97
    :catch_2
    move-exception p0

    .line 98
    move-object p2, v1

    .line 99
    goto :goto_1

    .line 100
    :catchall_3
    move-exception p0

    .line 101
    move-object p1, v1

    .line 102
    goto :goto_3

    .line 103
    :catch_3
    move-exception p0

    .line 104
    move-object p1, v1

    .line 105
    move-object p2, p1

    .line 106
    :goto_1
    :try_start_6
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 107
    .line 108
    .line 109
    if-eqz p2, :cond_2

    .line 110
    .line 111
    :try_start_7
    invoke-virtual {p2}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 112
    .line 113
    .line 114
    move-result p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 115
    if-eqz p0, :cond_2

    .line 116
    .line 117
    :try_start_8
    invoke-virtual {p2}, Ljava/nio/channels/FileLock;->release()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 118
    .line 119
    .line 120
    goto :goto_2

    .line 121
    :catch_4
    move-exception p0

    .line 122
    :try_start_9
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 123
    .line 124
    .line 125
    :cond_2
    :goto_2
    invoke-static {p1}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 126
    .line 127
    .line 128
    monitor-exit p4

    .line 129
    return-object v1

    .line 130
    :goto_3
    if-eqz v1, :cond_3

    .line 131
    .line 132
    invoke-virtual {v1}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 133
    .line 134
    .line 135
    move-result p2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 136
    if-eqz p2, :cond_3

    .line 137
    .line 138
    :try_start_a
    invoke-virtual {v1}, Ljava/nio/channels/FileLock;->release()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_5
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 139
    .line 140
    .line 141
    goto :goto_4

    .line 142
    :catch_5
    move-exception p2

    .line 143
    :try_start_b
    invoke-static {p2}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 144
    .line 145
    .line 146
    :cond_3
    :goto_4
    invoke-static {p1}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 147
    .line 148
    .line 149
    throw p0

    .line 150
    :goto_5
    monitor-exit p4
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 151
    throw p0
.end method

.method private a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .line 158
    monitor-enter p5

    const/4 p0, 0x0

    .line 159
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 160
    invoke-static {v0}, Ll/j6r0;->f(Ljava/io/File;)Z

    .line 161
    new-instance p4, Ljava/io/RandomAccessFile;

    const-string v1, "rw"

    invoke-direct {p4, v0, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 162
    :try_start_1
    invoke-virtual {p4}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->lock()Ljava/nio/channels/FileLock;

    move-result-object p0

    .line 163
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p1

    invoke-direct {v0, p1, p3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0, p2}, Ll/j6r0;->d(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz p0, :cond_0

    .line 164
    :try_start_2
    invoke-virtual {p0}, Ljava/nio/channels/FileLock;->isValid()Z

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz p1, :cond_0

    .line 165
    :goto_0
    :try_start_3
    invoke-virtual {p0}, Ljava/nio/channels/FileLock;->release()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_6

    :catch_0
    move-exception p0

    .line 166
    :try_start_4
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 167
    :cond_0
    :goto_1
    invoke-static {p4}, Ll/j6r0;->b(Ljava/io/Closeable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_3

    :catchall_1
    move-exception p1

    goto :goto_4

    :catch_1
    move-exception p1

    goto :goto_2

    :catchall_2
    move-exception p1

    move-object p4, p0

    goto :goto_4

    :catch_2
    move-exception p1

    move-object p4, p0

    .line 168
    :goto_2
    :try_start_5
    invoke-static {p1}, Ll/ouq0;->q(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-eqz p0, :cond_0

    .line 169
    :try_start_6
    invoke-virtual {p0}, Ljava/nio/channels/FileLock;->isValid()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 170
    :goto_3
    monitor-exit p5

    return-void

    :goto_4
    if-eqz p0, :cond_1

    .line 171
    invoke-virtual {p0}, Ljava/nio/channels/FileLock;->isValid()Z

    move-result p2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    if-eqz p2, :cond_1

    .line 172
    :try_start_7
    invoke-virtual {p0}, Ljava/nio/channels/FileLock;->release()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_5

    :catch_3
    move-exception p0

    .line 173
    :try_start_8
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 174
    :cond_1
    :goto_5
    invoke-static {p4}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 175
    throw p1

    .line 176
    :goto_6
    monitor-exit p5
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    throw p0
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 4

    .line 152
    iget-object v0, p0, Lcom/xiaomi/push/service/b;->e:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 153
    iget-object v0, p0, Lcom/xiaomi/push/service/b;->a:Landroid/content/Context;

    const-string v1, "mipush_region.lock"

    iget-object v2, p0, Lcom/xiaomi/push/service/b;->a:Ljava/lang/Object;

    const-string v3, "mipush_region"

    invoke-direct {p0, v0, v3, v1, v2}, Lcom/xiaomi/push/service/b;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/service/b;->e:Ljava/lang/String;

    .line 154
    :cond_0
    iget-object p0, p0, Lcom/xiaomi/push/service/b;->e:Ljava/lang/String;

    return-object p0
.end method

.method public a(Ljava/lang/String;Z)V
    .locals 7

    .line 155
    iget-object v0, p0, Lcom/xiaomi/push/service/b;->e:Ljava/lang/String;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 156
    iput-object p1, p0, Lcom/xiaomi/push/service/b;->e:Ljava/lang/String;

    :cond_0
    if-eqz p2, :cond_1

    .line 157
    iget-object v2, p0, Lcom/xiaomi/push/service/b;->a:Landroid/content/Context;

    const-string v5, "mipush_region.lock"

    iget-object v6, p0, Lcom/xiaomi/push/service/b;->a:Ljava/lang/Object;

    const-string v4, "mipush_region"

    move-object v1, p0

    move-object v3, p1

    invoke-direct/range {v1 .. v6}, Lcom/xiaomi/push/service/b;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public b()Ljava/lang/String;
    .locals 4

    .line 27
    iget-object v0, p0, Lcom/xiaomi/push/service/b;->f:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 28
    iget-object v0, p0, Lcom/xiaomi/push/service/b;->a:Landroid/content/Context;

    const-string v1, "mipush_country_code.lock"

    iget-object v2, p0, Lcom/xiaomi/push/service/b;->b:Ljava/lang/Object;

    const-string v3, "mipush_country_code"

    invoke-direct {p0, v0, v3, v1, v2}, Lcom/xiaomi/push/service/b;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/service/b;->f:Ljava/lang/String;

    .line 29
    :cond_0
    iget-object p0, p0, Lcom/xiaomi/push/service/b;->f:Ljava/lang/String;

    return-object p0
.end method

.method public b(Ljava/lang/String;Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/b;->f:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Lcom/xiaomi/push/service/b;->f:Ljava/lang/String;

    .line 10
    .line 11
    :cond_0
    if-eqz p2, :cond_1

    .line 12
    .line 13
    iget-object v2, p0, Lcom/xiaomi/push/service/b;->a:Landroid/content/Context;

    .line 14
    .line 15
    const-string v5, "mipush_region.lock"

    .line 16
    .line 17
    iget-object v6, p0, Lcom/xiaomi/push/service/b;->a:Ljava/lang/Object;

    .line 18
    .line 19
    const-string v4, "mipush_country_code"

    .line 20
    .line 21
    move-object v1, p0

    .line 22
    move-object v3, p1

    .line 23
    invoke-direct/range {v1 .. v6}, Lcom/xiaomi/push/service/b;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method
