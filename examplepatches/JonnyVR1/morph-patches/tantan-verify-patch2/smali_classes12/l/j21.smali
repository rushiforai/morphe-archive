.class public Ll/j21;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/j21$a;
    }
.end annotation


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

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/j21;->b(Ljava/lang/String;Ll/j21$a;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static b(Ljava/lang/String;Ll/j21$a;)Ljava/lang/String;
    .locals 11
    .param p1    # Ll/j21$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "/assets/"

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    return-object v2

    .line 11
    :cond_0
    const/4 v1, 0x2

    .line 12
    const/4 v3, 0x1

    .line 13
    const/4 v4, 0x3

    .line 14
    const/4 v5, 0x0

    .line 15
    :try_start_0
    const-string v6, "assets:///"

    .line 16
    .line 17
    invoke-virtual {p0, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    if-eqz v6, :cond_1

    .line 22
    .line 23
    const/16 v6, 0xa

    .line 24
    .line 25
    invoke-virtual {p0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-class v0, Ll/j21;

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    goto :goto_1

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    move-object v0, v2

    .line 42
    move-object v6, v0

    .line 43
    goto/16 :goto_6

    .line 44
    .line 45
    :catch_0
    move-exception p0

    .line 46
    move-object v0, v2

    .line 47
    move-object v6, v0

    .line 48
    :goto_0
    move-object v7, v6

    .line 49
    goto/16 :goto_4

    .line 50
    .line 51
    :cond_1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->n()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 64
    .line 65
    .line 66
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    :goto_1
    :try_start_1
    new-instance v0, Ljava/io/BufferedInputStream;

    .line 68
    .line 69
    invoke-direct {v0, p0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 70
    .line 71
    .line 72
    :try_start_2
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    .line 73
    .line 74
    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 75
    .line 76
    .line 77
    const/16 v7, 0x800

    .line 78
    .line 79
    :try_start_3
    new-array v7, v7, [B

    .line 80
    .line 81
    :goto_2
    invoke-virtual {v0, v7}, Ljava/io/InputStream;->read([B)I

    .line 82
    .line 83
    .line 84
    move-result v8

    .line 85
    const/4 v9, -0x1

    .line 86
    if-eq v8, v9, :cond_2

    .line 87
    .line 88
    invoke-virtual {v6, v7, v5, v8}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 89
    .line 90
    .line 91
    goto :goto_2

    .line 92
    :catchall_1
    move-exception p1

    .line 93
    :goto_3
    move-object v2, v0

    .line 94
    move-object v0, p0

    .line 95
    move-object p0, p1

    .line 96
    goto/16 :goto_6

    .line 97
    .line 98
    :catch_1
    move-exception v7

    .line 99
    move-object v10, v0

    .line 100
    move-object v0, p0

    .line 101
    move-object p0, v7

    .line 102
    move-object v7, v6

    .line 103
    move-object v6, v10

    .line 104
    goto :goto_4

    .line 105
    :cond_2
    new-instance v7, Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 108
    .line 109
    .line 110
    move-result-object v8

    .line 111
    invoke-direct {v7, v8}, Ljava/lang/String;-><init>([B)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 112
    .line 113
    .line 114
    new-array p1, v4, [Ljava/io/Closeable;

    .line 115
    .line 116
    aput-object v0, p1, v5

    .line 117
    .line 118
    aput-object v6, p1, v3

    .line 119
    .line 120
    aput-object p0, p1, v1

    .line 121
    .line 122
    invoke-static {p1}, Ll/jb5;->a([Ljava/io/Closeable;)V

    .line 123
    .line 124
    .line 125
    return-object v7

    .line 126
    :catchall_2
    move-exception p1

    .line 127
    move-object v6, v2

    .line 128
    goto :goto_3

    .line 129
    :catch_2
    move-exception v6

    .line 130
    move-object v7, v0

    .line 131
    move-object v0, p0

    .line 132
    move-object p0, v6

    .line 133
    move-object v6, v7

    .line 134
    move-object v7, v2

    .line 135
    goto :goto_4

    .line 136
    :catchall_3
    move-exception p1

    .line 137
    move-object v0, p0

    .line 138
    move-object p0, p1

    .line 139
    move-object v6, v2

    .line 140
    goto :goto_6

    .line 141
    :catch_3
    move-exception v0

    .line 142
    move-object v6, v0

    .line 143
    move-object v0, p0

    .line 144
    move-object p0, v6

    .line 145
    move-object v6, v2

    .line 146
    goto :goto_0

    .line 147
    :goto_4
    if-nez p1, :cond_3

    .line 148
    .line 149
    :try_start_4
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 150
    .line 151
    .line 152
    goto :goto_5

    .line 153
    :catchall_4
    move-exception p0

    .line 154
    move-object v2, v6

    .line 155
    move-object v6, v7

    .line 156
    goto :goto_6

    .line 157
    :cond_3
    invoke-interface {p1, p0}, Ll/j21$a;->a(Ljava/lang/Exception;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 158
    .line 159
    .line 160
    :goto_5
    new-array p0, v4, [Ljava/io/Closeable;

    .line 161
    .line 162
    aput-object v6, p0, v5

    .line 163
    .line 164
    aput-object v7, p0, v3

    .line 165
    .line 166
    aput-object v0, p0, v1

    .line 167
    .line 168
    invoke-static {p0}, Ll/jb5;->a([Ljava/io/Closeable;)V

    .line 169
    .line 170
    .line 171
    return-object v2

    .line 172
    :goto_6
    new-array p1, v4, [Ljava/io/Closeable;

    .line 173
    .line 174
    aput-object v2, p1, v5

    .line 175
    .line 176
    aput-object v6, p1, v3

    .line 177
    .line 178
    aput-object v0, p1, v1

    .line 179
    .line 180
    invoke-static {p1}, Ll/jb5;->a([Ljava/io/Closeable;)V

    .line 181
    .line 182
    .line 183
    throw p0
.end method
