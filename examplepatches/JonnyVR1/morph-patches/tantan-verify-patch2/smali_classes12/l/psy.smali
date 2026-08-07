.class public Ll/psy;
.super Ll/wr4;
.source "SourceFile"


# instance fields
.field private e:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 12
    const-string v0, "MergeFileHandler"

    invoke-direct {p0, v0}, Ll/psy;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wr4;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput p1, p0, Ll/psy;->e:I

    .line 6
    .line 7
    const/4 p1, 0x4

    .line 8
    invoke-virtual {p0, p1}, Ll/wr4;->j(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private k(Ljava/io/File;Ljava/io/File;Ljava/io/File;Ll/ire0;)Z
    .locals 9

    .line 1
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "SDKResource"

    .line 18
    .line 19
    const-string v2, "applyArchiveZipPatch %s - %s - %s"

    .line 20
    .line 21
    invoke-static {v1, v2, v0}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    move-object v2, v0

    .line 26
    :cond_0
    new-instance v3, Ljava/util/zip/Inflater;

    .line 27
    .line 28
    const/4 v4, 0x1

    .line 29
    invoke-direct {v3, v4}, Ljava/util/zip/Inflater;-><init>(Z)V

    .line 30
    .line 31
    .line 32
    :try_start_0
    new-instance v5, Ljava/io/FileInputStream;

    .line 33
    .line 34
    invoke-direct {v5, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/util/zip/Inflater;->end()V

    .line 38
    .line 39
    .line 40
    :try_start_1
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    .line 42
    .line 43
    :catchall_0
    :try_start_2
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 44
    :catchall_1
    move-exception p0

    .line 45
    goto/16 :goto_1

    .line 46
    .line 47
    :catch_0
    move-exception v2

    .line 48
    :try_start_3
    invoke-static {v1, v2}, Lcom/immomo/resdownloader/log/MLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/util/zip/Inflater;->end()V

    .line 52
    .line 53
    .line 54
    :try_start_4
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 55
    :catchall_2
    :try_start_5
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 56
    :catchall_3
    iget v3, p0, Ll/psy;->e:I

    .line 57
    .line 58
    add-int/lit8 v5, v3, -0x1

    .line 59
    .line 60
    iput v5, p0, Ll/psy;->e:I

    .line 61
    .line 62
    if-gtz v3, :cond_0

    .line 63
    .line 64
    const-string v3, "Event_Resource_Patch"

    .line 65
    .line 66
    const/4 v5, 0x0

    .line 67
    invoke-static {v3, v5, v0}, Ll/u4d0;->a(Ljava/lang/String;ILjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p2}, Ll/miw;->e(Ljava/io/File;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    const/4 v8, 0x5

    .line 79
    if-eqz v7, :cond_2

    .line 80
    .line 81
    invoke-virtual {p4}, Ll/ire0;->d()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p4

    .line 85
    invoke-static {p4, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result p4

    .line 89
    if-eqz p4, :cond_2

    .line 90
    .line 91
    invoke-virtual {p3}, Ljava/io/File;->delete()Z

    .line 92
    .line 93
    .line 94
    invoke-virtual {p2, p3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    if-eqz p2, :cond_2

    .line 99
    .line 100
    const-string p2, "Event_Resource_Local_Access_Patch"

    .line 101
    .line 102
    invoke-static {p2, v4, v0}, Ll/u4d0;->a(Ljava/lang/String;ILjava/lang/String;)V

    .line 103
    .line 104
    .line 105
    const-string p2, "applyArchiveZipPatch success"

    .line 106
    .line 107
    new-array p4, v5, [Ljava/lang/Object;

    .line 108
    .line 109
    invoke-static {v1, p2, p4}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v3, v4, v0}, Ll/u4d0;->a(Ljava/lang/String;ILjava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-static {p1}, Ll/zie;->a(Ljava/io/File;)Z

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    if-nez p2, :cond_1

    .line 120
    .line 121
    const-string p1, "\u5220\u9664patch\u6587\u4ef6\u5931\u8d25\uff0cArchiveZipPatch"

    .line 122
    .line 123
    invoke-virtual {p0, v8, p1}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 124
    .line 125
    .line 126
    return v5

    .line 127
    :cond_1
    invoke-virtual {p3, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    return p0

    .line 132
    :cond_2
    if-eqz v2, :cond_3

    .line 133
    .line 134
    invoke-virtual {p0, v8, v2}, Ll/wr4;->i(ILjava/lang/Exception;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v8, v6}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-static {v1, v2}, Lcom/immomo/resdownloader/log/MLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 141
    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    const-string p2, "ArchiveZipPatch apply patch error "

    .line 147
    .line 148
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p0, v8, p1}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 159
    .line 160
    .line 161
    const-string p0, "applyArchiveZipPatch failed"

    .line 162
    .line 163
    new-array p1, v5, [Ljava/lang/Object;

    .line 164
    .line 165
    invoke-static {v1, p0, p1}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    :goto_0
    return v5

    .line 169
    :goto_1
    invoke-virtual {v3}, Ljava/util/zip/Inflater;->end()V

    .line 170
    .line 171
    .line 172
    :try_start_6
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 173
    :catchall_4
    :try_start_7
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    .line 174
    :catchall_5
    throw p0
.end method

.method private l(Ljava/io/File;Ljava/io/File;Ljava/io/File;Ll/ire0;)Z
    .locals 0

    .line 1
    const-string p1, "Event_Resource_Patch"

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p3

    .line 8
    invoke-static {p1, p2, p3}, Ll/u4d0;->a(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x5

    .line 12
    const-string p3, "NormalDiffPatch apply patch error"

    .line 13
    .line 14
    invoke-virtual {p0, p1, p3}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return p2
.end method


# virtual methods
.method public e(Ll/aje;)Z
    .locals 4

    .line 1
    invoke-static {p1}, Ll/zie;->d(Ll/aje;)Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Ll/zie;->e(Ll/aje;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {p1}, Ll/zie;->b(Ll/aje;)Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-static {v2}, Ll/zie;->a(Ljava/io/File;)Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-nez v3, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x5

    .line 20
    const-string v0, "\u5220\u9664\u5df2\u7ecf\u5b58\u5728\u7684\u5408\u5e76\u597d\u7684\u6587\u4ef6\u5931\u8d25"

    .line 21
    .line 22
    invoke-virtual {p0, p1, v0}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :cond_0
    invoke-virtual {p1}, Ll/aje;->d()Ll/ire0;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-static {v3}, Ll/cje;->m(Ll/ire0;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/aje;->d()Ll/ire0;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-direct {p0, v0, v1, v2, p1}, Ll/psy;->k(Ljava/io/File;Ljava/io/File;Ljava/io/File;Ll/ire0;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_1
    invoke-virtual {p1}, Ll/aje;->d()Ll/ire0;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-direct {p0, v0, v1, v2, p1}, Ll/psy;->l(Ljava/io/File;Ljava/io/File;Ljava/io/File;Ll/ire0;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    return p0
.end method
