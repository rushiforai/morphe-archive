.class public Ll/etb;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:F


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
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

.method public static a(Ljava/lang/String;)I
    .locals 3

    .line 1
    const-string v0, "CPU"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    const-string v1, "\\s+"

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v1, 0x0

    .line 16
    :goto_0
    array-length v2, p0

    .line 17
    if-ge v1, v2, :cond_1

    .line 18
    .line 19
    aget-object v2, p0, v1

    .line 20
    .line 21
    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    return v1

    .line 28
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/4 p0, -0x1

    .line 32
    return p0
.end method

.method public static b()F
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/etb;->c()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sput v0, Ll/etb;->a:F

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Ll/etb;->d()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    sput v0, Ll/etb;->a:F

    .line 19
    .line 20
    :goto_0
    sget v0, Ll/etb;->a:F

    .line 21
    .line 22
    return v0
.end method

.method public static c()F
    .locals 8

    .line 1
    const-string v0, "%"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    const-string v3, "top -n 1"

    .line 9
    .line 10
    invoke-virtual {v2, v3}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    .line 11
    .line 12
    .line 13
    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 14
    :try_start_1
    new-instance v3, Ljava/io/BufferedReader;

    .line 15
    .line 16
    new-instance v4, Ljava/io/InputStreamReader;

    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    invoke-direct {v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 26
    .line 27
    .line 28
    const/4 v1, -0x1

    .line 29
    move v4, v1

    .line 30
    :cond_0
    :goto_0
    :try_start_2
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    if-eqz v5, :cond_6

    .line 35
    .line 36
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    if-eqz v6, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-static {v5}, Ll/etb;->a(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    if-eq v6, v1, :cond_2

    .line 52
    .line 53
    move v4, v6

    .line 54
    goto :goto_0

    .line 55
    :cond_2
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 56
    .line 57
    .line 58
    move-result v6

    .line 59
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    if-eqz v6, :cond_0

    .line 68
    .line 69
    if-ne v4, v1, :cond_3

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    const-string v6, "\\s+"

    .line 73
    .line 74
    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    array-length v6, v5

    .line 79
    if-gt v6, v4, :cond_4

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_4
    aget-object v5, v5, v4

    .line 83
    .line 84
    invoke-virtual {v5, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result v6

    .line 88
    if-eqz v6, :cond_5

    .line 89
    .line 90
    invoke-virtual {v5, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    const/4 v7, 0x0

    .line 95
    invoke-virtual {v5, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    goto :goto_2

    .line 100
    :catchall_0
    :goto_1
    move-object v1, v2

    .line 101
    goto :goto_4

    .line 102
    :cond_5
    :goto_2
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    invoke-virtual {v6}, Ljava/lang/Runtime;->availableProcessors()I

    .line 107
    .line 108
    .line 109
    move-result v6

    .line 110
    if-eqz v6, :cond_0

    .line 111
    .line 112
    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 113
    .line 114
    .line 115
    move-result v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 116
    int-to-float v6, v6

    .line 117
    div-float/2addr v5, v6

    .line 118
    const/high16 v6, 0x7fc00000    # Float.NaN

    .line 119
    .line 120
    cmpl-float v6, v5, v6

    .line 121
    .line 122
    if-eqz v6, :cond_0

    .line 123
    .line 124
    const/high16 v6, 0x7f800000    # Float.POSITIVE_INFINITY

    .line 125
    .line 126
    cmpl-float v6, v5, v6

    .line 127
    .line 128
    if-eqz v6, :cond_0

    .line 129
    .line 130
    const/high16 v6, -0x800000    # Float.NEGATIVE_INFINITY

    .line 131
    .line 132
    cmpl-float v6, v5, v6

    .line 133
    .line 134
    if-eqz v6, :cond_0

    .line 135
    .line 136
    invoke-virtual {v2}, Ljava/lang/Process;->destroy()V

    .line 137
    .line 138
    .line 139
    invoke-static {v3}, Ll/m1m;->a(Ljava/io/Closeable;)V

    .line 140
    .line 141
    .line 142
    return v5

    .line 143
    :cond_6
    invoke-virtual {v2}, Ljava/lang/Process;->destroy()V

    .line 144
    .line 145
    .line 146
    :cond_7
    :goto_3
    invoke-static {v3}, Ll/m1m;->a(Ljava/io/Closeable;)V

    .line 147
    .line 148
    .line 149
    goto :goto_5

    .line 150
    :catchall_1
    move-object v3, v1

    .line 151
    goto :goto_1

    .line 152
    :catchall_2
    move-object v3, v1

    .line 153
    :goto_4
    if-eqz v1, :cond_7

    .line 154
    .line 155
    invoke-virtual {v1}, Ljava/lang/Process;->destroy()V

    .line 156
    .line 157
    .line 158
    goto :goto_3

    .line 159
    :goto_5
    const/4 v0, 0x0

    .line 160
    return v0
.end method

.method public static d()F
    .locals 6

    .line 1
    const-string v0, "r"

    .line 2
    .line 3
    const-string v1, "/proc/"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    new-instance v3, Ljava/io/RandomAccessFile;

    .line 7
    .line 8
    const-string v4, "/proc/stat"

    .line 9
    .line 10
    invoke-direct {v3, v4, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 11
    .line 12
    .line 13
    :try_start_1
    new-instance v4, Ljava/io/RandomAccessFile;

    .line 14
    .line 15
    new-instance v5, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, "/stat"

    .line 28
    .line 29
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-direct {v4, v1, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 37
    .line 38
    .line 39
    :try_start_2
    invoke-static {v3, v4}, Ll/etb;->e(Ljava/io/RandomAccessFile;Ljava/io/RandomAccessFile;)[F

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    const-wide/16 v1, 0x1f4

    .line 46
    .line 47
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    .line 48
    .line 49
    .line 50
    const-wide/16 v1, 0x0

    .line 51
    .line 52
    invoke-virtual {v3, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 56
    .line 57
    .line 58
    invoke-static {v3, v4}, Ll/etb;->e(Ljava/io/RandomAccessFile;Ljava/io/RandomAccessFile;)[F

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    if-eqz v1, :cond_0

    .line 63
    .line 64
    const/4 v2, 0x1

    .line 65
    aget v5, v1, v2

    .line 66
    .line 67
    aget v2, v0, v2

    .line 68
    .line 69
    sub-float/2addr v5, v2

    .line 70
    const/4 v2, 0x0

    .line 71
    aget v1, v1, v2

    .line 72
    .line 73
    aget v0, v0, v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 74
    .line 75
    sub-float/2addr v1, v0

    .line 76
    div-float/2addr v5, v1

    .line 77
    const/high16 v0, 0x42c80000    # 100.0f

    .line 78
    .line 79
    mul-float/2addr v5, v0

    .line 80
    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 81
    .line 82
    cmpl-float v0, v5, v0

    .line 83
    .line 84
    if-eqz v0, :cond_0

    .line 85
    .line 86
    const/high16 v0, 0x7f800000    # Float.POSITIVE_INFINITY

    .line 87
    .line 88
    cmpl-float v0, v5, v0

    .line 89
    .line 90
    if-eqz v0, :cond_0

    .line 91
    .line 92
    const/high16 v0, -0x800000    # Float.NEGATIVE_INFINITY

    .line 93
    .line 94
    cmpl-float v0, v5, v0

    .line 95
    .line 96
    if-eqz v0, :cond_0

    .line 97
    .line 98
    invoke-static {v3}, Ll/m1m;->a(Ljava/io/Closeable;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v4}, Ll/m1m;->a(Ljava/io/Closeable;)V

    .line 102
    .line 103
    .line 104
    return v5

    .line 105
    :catchall_0
    move-exception v0

    .line 106
    :goto_0
    move-object v2, v3

    .line 107
    goto :goto_3

    .line 108
    :catch_0
    :goto_1
    move-object v2, v3

    .line 109
    goto :goto_4

    .line 110
    :cond_0
    invoke-static {v3}, Ll/m1m;->a(Ljava/io/Closeable;)V

    .line 111
    .line 112
    .line 113
    :goto_2
    invoke-static {v4}, Ll/m1m;->a(Ljava/io/Closeable;)V

    .line 114
    .line 115
    .line 116
    goto :goto_5

    .line 117
    :catchall_1
    move-exception v0

    .line 118
    move-object v4, v2

    .line 119
    goto :goto_0

    .line 120
    :catch_1
    move-object v4, v2

    .line 121
    goto :goto_1

    .line 122
    :catchall_2
    move-exception v0

    .line 123
    move-object v4, v2

    .line 124
    goto :goto_3

    .line 125
    :catch_2
    move-object v4, v2

    .line 126
    goto :goto_4

    .line 127
    :goto_3
    invoke-static {v2}, Ll/m1m;->a(Ljava/io/Closeable;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v4}, Ll/m1m;->a(Ljava/io/Closeable;)V

    .line 131
    .line 132
    .line 133
    throw v0

    .line 134
    :goto_4
    invoke-static {v2}, Ll/m1m;->a(Ljava/io/Closeable;)V

    .line 135
    .line 136
    .line 137
    goto :goto_2

    .line 138
    :goto_5
    const/4 v0, 0x0

    .line 139
    return v0
.end method

.method public static e(Ljava/io/RandomAccessFile;Ljava/io/RandomAccessFile;)[F
    .locals 11

    .line 1
    const-string v0, "\\s+"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->readLine()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->readLine()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/4 v3, 0x2

    .line 17
    const/4 v4, 0x1

    .line 18
    if-nez v2, :cond_1

    .line 19
    .line 20
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-nez v2, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    array-length v0, p1

    .line 35
    const/16 v2, 0x11

    .line 36
    .line 37
    if-ge v0, v2, :cond_0

    .line 38
    .line 39
    return-object v1

    .line 40
    :cond_0
    aget-object v0, p0, v4

    .line 41
    .line 42
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 43
    .line 44
    .line 45
    move-result-wide v5

    .line 46
    aget-object v0, p0, v3

    .line 47
    .line 48
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 49
    .line 50
    .line 51
    move-result-wide v7

    .line 52
    add-long/2addr v5, v7

    .line 53
    const/4 v0, 0x3

    .line 54
    aget-object v0, p0, v0

    .line 55
    .line 56
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 57
    .line 58
    .line 59
    move-result-wide v7

    .line 60
    add-long/2addr v5, v7

    .line 61
    const/4 v0, 0x4

    .line 62
    aget-object v0, p0, v0

    .line 63
    .line 64
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 65
    .line 66
    .line 67
    move-result-wide v7

    .line 68
    add-long/2addr v5, v7

    .line 69
    const/4 v0, 0x5

    .line 70
    aget-object v0, p0, v0

    .line 71
    .line 72
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 73
    .line 74
    .line 75
    move-result-wide v7

    .line 76
    add-long/2addr v5, v7

    .line 77
    const/4 v0, 0x6

    .line 78
    aget-object v0, p0, v0

    .line 79
    .line 80
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 81
    .line 82
    .line 83
    move-result-wide v7

    .line 84
    add-long/2addr v5, v7

    .line 85
    const/4 v0, 0x7

    .line 86
    aget-object p0, p0, v0

    .line 87
    .line 88
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 89
    .line 90
    .line 91
    move-result-wide v7

    .line 92
    add-long/2addr v5, v7

    .line 93
    const/16 p0, 0xd

    .line 94
    .line 95
    aget-object p0, p1, p0

    .line 96
    .line 97
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 98
    .line 99
    .line 100
    move-result-wide v7

    .line 101
    const/16 p0, 0xe

    .line 102
    .line 103
    aget-object p0, p1, p0

    .line 104
    .line 105
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 106
    .line 107
    .line 108
    move-result-wide v9

    .line 109
    add-long/2addr v7, v9

    .line 110
    const/16 p0, 0xf

    .line 111
    .line 112
    aget-object p0, p1, p0

    .line 113
    .line 114
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 115
    .line 116
    .line 117
    move-result-wide v9

    .line 118
    add-long/2addr v7, v9

    .line 119
    const/16 p0, 0x10

    .line 120
    .line 121
    aget-object p0, p1, p0

    .line 122
    .line 123
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 124
    .line 125
    .line 126
    move-result-wide p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 127
    add-long/2addr v7, p0

    .line 128
    goto :goto_0

    .line 129
    :cond_1
    const-wide/16 v5, 0x0

    .line 130
    .line 131
    move-wide v7, v5

    .line 132
    :goto_0
    long-to-float p0, v5

    .line 133
    long-to-float p1, v7

    .line 134
    new-array v0, v3, [F

    .line 135
    .line 136
    const/4 v1, 0x0

    .line 137
    aput p0, v0, v1

    .line 138
    .line 139
    aput p1, v0, v4

    .line 140
    .line 141
    return-object v0

    .line 142
    :catchall_0
    return-object v1
.end method
