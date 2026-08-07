.class public Ll/fki;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static synthetic a(JLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/fki;->d(JLjava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b(Ljava/lang/String;J)V
    .locals 1

    .line 1
    new-instance v0, Ll/fki$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/fki$a;-><init>(Ljava/lang/String;J)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/u21;->b(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static c(Ljava/util/List;J)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;J)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/fki$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/fki$b;-><init>(Ljava/util/List;J)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/u21;->b(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static d(JLjava/lang/String;Ljava/lang/String;)V
    .locals 11

    .line 1
    const-string p3, "[beatles]"

    .line 2
    .line 3
    const-string v0, "[upload] upload fail:"

    .line 4
    .line 5
    const-string v1, "[upload] upload success:"

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, "filePath:"

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const-string v3, "testPath"

    .line 22
    .line 23
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/du2;->p()Ll/cjk0;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2}, Ll/cjk0;->d()Ll/r4f;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    invoke-interface {v2}, Ll/r4f;->getUserInfo()Lcom/tantanapp/beatles/v2/data/User;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2}, Lcom/tantanapp/beatles/v2/data/User;->getUserId()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    :goto_0
    move-object v6, v2

    .line 45
    goto :goto_1

    .line 46
    :cond_0
    const-string v2, ""

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :goto_1
    const/4 v2, 0x0

    .line 50
    :try_start_0
    invoke-static {p2}, Ll/nki;->r(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    new-instance v10, Ljava/io/File;

    .line 55
    .line 56
    invoke-direct {v10, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 57
    .line 58
    .line 59
    :try_start_1
    new-instance v3, Ll/tyv;

    .line 60
    .line 61
    invoke-static {}, Ll/vc60;->f()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    new-instance v9, Ljava/util/Date;

    .line 70
    .line 71
    invoke-direct {v9}, Ljava/util/Date;-><init>()V

    .line 72
    .line 73
    .line 74
    move-wide v7, p0

    .line 75
    invoke-direct/range {v3 .. v9}, Ll/tyv;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/Date;)V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Ll/du2;->o()Ll/q3k0;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0, v3}, Ll/q3k0;->t(Ll/tyv;)Lcom/tantanapp/beatles/v2/upload/UploadStatus;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    sget-object p1, Lcom/tantanapp/beatles/v2/upload/UploadStatus;->SUCCESS:Lcom/tantanapp/beatles/v2/upload/UploadStatus;

    .line 87
    .line 88
    if-ne p0, p1, :cond_1

    .line 89
    .line 90
    new-instance p0, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p3, p0}, Ll/du2;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    goto :goto_2

    .line 110
    :catchall_0
    move-exception v0

    .line 111
    move-object p0, v0

    .line 112
    move-object v2, v10

    .line 113
    goto :goto_4

    .line 114
    :catch_0
    move-object v2, v10

    .line 115
    goto :goto_3

    .line 116
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-static {p3, p0}, Ll/du2;->v(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 133
    .line 134
    .line 135
    :goto_2
    invoke-static {v10}, Ll/nki;->f(Ljava/io/File;)Z

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :catchall_1
    move-exception v0

    .line 140
    move-object p0, v0

    .line 141
    goto :goto_4

    .line 142
    :catch_1
    :goto_3
    :try_start_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-static {p3, p0}, Ll/du2;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    invoke-static {p2}, Ll/nki;->g(Ljava/lang/String;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 158
    .line 159
    .line 160
    if-eqz v2, :cond_2

    .line 161
    .line 162
    invoke-static {v2}, Ll/nki;->f(Ljava/io/File;)Z

    .line 163
    .line 164
    .line 165
    :cond_2
    return-void

    .line 166
    :goto_4
    if-eqz v2, :cond_3

    .line 167
    .line 168
    invoke-static {v2}, Ll/nki;->f(Ljava/io/File;)Z

    .line 169
    .line 170
    .line 171
    :cond_3
    throw p0
.end method
