.class public Lcom/apm/lite/j/e;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/apm/lite/j/e$b;,
        Lcom/apm/lite/j/e$a;
    }
.end annotation


# static fields
.field public static a:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private static a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const-string v0, "&"

    const-string v1, "?"

    :try_start_0
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    return-object p0
.end method

.method private static b(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 5

    .line 1
    const-string v0, "UTF-8"

    invoke-static {p0}, Landroid/text/TextUtils;->isDigitsOnly(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    if-eqz p1, :cond_5

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "?"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    :try_start_0
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string v4, "&"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0}, Lcom/apm/lite/j/e;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/apm/lite/j/e;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_4
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :catch_0
    :cond_5
    :goto_1
    return-object p0
.end method

.method public static c(JLjava/lang/String;[BLcom/apm/lite/j/e$a;Ljava/lang/String;Z)Ll/r4r0;
    .locals 8

    .line 1
    const/4 v7, 0x0

    .line 2
    move-wide v0, p0

    .line 3
    move-object v2, p2

    .line 4
    move-object v3, p3

    .line 5
    move-object v4, p4

    .line 6
    move-object v5, p5

    .line 7
    move v6, p6

    .line 8
    invoke-static/range {v0 .. v7}, Lcom/apm/lite/j/e;->d(JLjava/lang/String;[BLcom/apm/lite/j/e$a;Ljava/lang/String;ZZ)Ll/r4r0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static d(JLjava/lang/String;[BLcom/apm/lite/j/e$a;Ljava/lang/String;ZZ)Ll/r4r0;
    .locals 8

    .line 1
    invoke-static {}, Ll/b350;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 p1, 0xc9

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ll/r4r0;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ll/r4r0;-><init>(I)V

    .line 12
    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    if-nez p2, :cond_1

    .line 16
    .line 17
    new-instance p0, Ll/r4r0;

    .line 18
    .line 19
    invoke-direct {p0, p1}, Ll/r4r0;-><init>(I)V

    .line 20
    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    if-nez p3, :cond_2

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    new-array p3, p0, [B

    .line 27
    .line 28
    :cond_2
    array-length p0, p3

    .line 29
    sget-object p1, Lcom/apm/lite/j/e$a;->b:Lcom/apm/lite/j/e$a;

    .line 30
    .line 31
    const/16 v0, 0x80

    .line 32
    .line 33
    if-ne p1, p4, :cond_3

    .line 34
    .line 35
    if-le p0, v0, :cond_3

    .line 36
    .line 37
    invoke-static {p3}, Lcom/apm/lite/j/e;->r([B)[B

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    const-string p0, "gzip"

    .line 42
    .line 43
    :goto_0
    move-object v3, p0

    .line 44
    move-object v1, p3

    .line 45
    goto :goto_1

    .line 46
    :cond_3
    sget-object p1, Lcom/apm/lite/j/e$a;->c:Lcom/apm/lite/j/e$a;

    .line 47
    .line 48
    if-ne p1, p4, :cond_4

    .line 49
    .line 50
    if-le p0, v0, :cond_4

    .line 51
    .line 52
    invoke-static {p3}, Lcom/apm/lite/j/e;->m([B)[B

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    const-string p0, "deflate"

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_4
    const/4 p0, 0x0

    .line 60
    goto :goto_0

    .line 61
    :goto_1
    if-nez v1, :cond_5

    .line 62
    .line 63
    new-instance p0, Ll/r4r0;

    .line 64
    .line 65
    const/16 p1, 0xca

    .line 66
    .line 67
    invoke-direct {p0, p1}, Ll/r4r0;-><init>(I)V

    .line 68
    .line 69
    .line 70
    return-object p0

    .line 71
    :cond_5
    if-eqz p6, :cond_9

    .line 72
    .line 73
    invoke-static {v1}, Ll/v2r0;->a([B)[B

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    if-eqz p0, :cond_8

    .line 78
    .line 79
    new-instance p1, Ljava/net/URL;

    .line 80
    .line 81
    invoke-direct {p1, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-eqz p1, :cond_6

    .line 93
    .line 94
    const-string p1, "?"

    .line 95
    .line 96
    invoke-virtual {p2, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result p3

    .line 100
    if-nez p3, :cond_7

    .line 101
    .line 102
    :goto_2
    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    goto :goto_3

    .line 107
    :cond_6
    const-string p1, "&"

    .line 108
    .line 109
    invoke-virtual {p2, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result p3

    .line 113
    if-nez p3, :cond_7

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_7
    :goto_3
    const-string p1, "tt_data=a"

    .line 117
    .line 118
    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    const-string p5, "application/octet-stream;tt-data=a"

    .line 123
    .line 124
    move-object v1, p0

    .line 125
    :cond_8
    move-object v0, p2

    .line 126
    move-object v2, p5

    .line 127
    const/4 v5, 0x1

    .line 128
    const/4 v6, 0x1

    .line 129
    const-string v4, "POST"

    .line 130
    .line 131
    move v7, p7

    .line 132
    invoke-static/range {v0 .. v7}, Lcom/apm/lite/j/e;->h(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZ)Ll/r4r0;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    return-object p0

    .line 137
    :cond_9
    move v7, p7

    .line 138
    const/4 v5, 0x1

    .line 139
    const/4 v6, 0x0

    .line 140
    const-string v4, "POST"

    .line 141
    .line 142
    move-object v0, p2

    .line 143
    move-object v2, p5

    .line 144
    invoke-static/range {v0 .. v7}, Lcom/apm/lite/j/e;->h(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZ)Ll/r4r0;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    return-object p0
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Z)Ll/r4r0;
    .locals 1

    .line 1
    invoke-static {}, Lcom/apm/lite/j/e;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0, p1, v0, p2}, Lcom/apm/lite/j/e;->f(Ljava/lang/String;Ljava/lang/String;ZZ)Ll/r4r0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static f(Ljava/lang/String;Ljava/lang/String;ZZ)Ll/r4r0;
    .locals 9

    .line 1
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    sget-object v5, Lcom/apm/lite/j/e$a;->b:Lcom/apm/lite/j/e$a;

    .line 19
    .line 20
    const-string v6, "application/json; charset=utf-8"

    .line 21
    .line 22
    const-wide/32 v1, 0x200000

    .line 23
    .line 24
    .line 25
    move-object v3, p0

    .line 26
    move v7, p2

    .line 27
    move v8, p3

    .line 28
    invoke-static/range {v1 .. v8}, Lcom/apm/lite/j/e;->d(JLjava/lang/String;[BLcom/apm/lite/j/e$a;Ljava/lang/String;ZZ)Ll/r4r0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    :goto_0
    new-instance p0, Ll/r4r0;

    .line 34
    .line 35
    const/16 p1, 0xc9

    .line 36
    .line 37
    invoke-direct {p0, p1}, Ll/r4r0;-><init>(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    .line 39
    .line 40
    return-object p0

    .line 41
    :catchall_0
    move-exception v0

    .line 42
    move-object p0, v0

    .line 43
    invoke-static {p0}, Ll/q5r0;->g(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    new-instance p1, Ll/r4r0;

    .line 47
    .line 48
    const/16 p2, 0xcf

    .line 49
    .line 50
    invoke-direct {p1, p2, p0}, Ll/r4r0;-><init>(ILjava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    return-object p1
.end method

.method public static varargs g(Ljava/lang/String;Ljava/lang/String;[Ljava/io/File;)Ll/r4r0;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/apm/lite/j/e;->o(Ljava/lang/String;Ljava/lang/String;[Ljava/io/File;)Ll/r4r0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static h(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZ)Ll/r4r0;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p7}, Lcom/apm/lite/j/e;->p(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZ)Ll/r4r0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static i()Z
    .locals 2

    .line 1
    const-string v0, "sdk"

    const-string v1, "app"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method public static j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const-string v0, "aid"

    invoke-static {}, Ll/b350;->d()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return v2

    :cond_0
    :try_start_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Ll/cyq0;->l(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "x-auth-token"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_2

    :cond_1
    :goto_0
    new-instance v3, Ll/v3r0;

    const-string v4, "UTF-8"

    invoke-direct {v3, p0, v4, v1, v2}, Ll/v3r0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Z)V

    invoke-virtual {v3, v0, p1}, Ll/v3r0;->c(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "device_id"

    invoke-virtual {v3, p0, p2}, Ll/v3r0;->c(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "os"

    const-string p1, "Android"

    invoke-virtual {v3, p0, p1}, Ll/v3r0;->c(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "process_name"

    invoke-virtual {v3, p0, p3}, Ll/v3r0;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_2

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p3, "logtype"

    const-string p4, "alog"

    invoke-interface {p1, p3, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "scene"

    const-string p4, "crash"

    invoke-interface {p1, p3, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v3, p3, p2, p1}, Ll/v3r0;->b(Ljava/lang/String;Ljava/io/File;Ljava/util/Map;)V

    goto :goto_1

    :cond_3
    invoke-virtual {v3}, Ll/v3r0;->a()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "errno"

    const/4 p2, -0x1

    invoke-virtual {p1, p0, p2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    const/16 p1, 0xc8

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :catch_1
    :cond_4
    return v2

    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return v2
.end method

.method private static k(Ljava/io/InputStream;)[B
    .locals 4

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v1, 0x2000

    new-array v1, v1, [B

    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v3, v2, :cond_0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    :try_start_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v0}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {v0}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    throw p0
.end method

.method public static l(Ljava/lang/String;Ljava/util/Map;[B)[B
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;[B)[B"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-static {p0, p1}, Lcom/apm/lite/j/e;->b(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    sget-object v4, Lcom/apm/lite/j/e$a;->b:Lcom/apm/lite/j/e$a;

    const-string v5, "application/json; charset=utf-8"

    const/4 v6, 0x0

    const-wide/32 v0, 0x200000

    move-object v3, p2

    invoke-static/range {v0 .. v6}, Lcom/apm/lite/j/e;->c(JLjava/lang/String;[BLcom/apm/lite/j/e$a;Ljava/lang/String;Z)Ll/r4r0;

    move-result-object p0

    invoke-virtual {p0}, Ll/r4r0;->b()[B

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    move-object p0, v0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    const/4 p0, 0x0

    return-object p0
.end method

.method private static m([B)[B
    .locals 4

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v1, 0x2000

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    new-instance v2, Ljava/util/zip/Deflater;

    invoke-direct {v2}, Ljava/util/zip/Deflater;-><init>()V

    invoke-virtual {v2, p0}, Ljava/util/zip/Deflater;->setInput([B)V

    invoke-virtual {v2}, Ljava/util/zip/Deflater;->finish()V

    new-array p0, v1, [B

    :goto_0
    invoke-virtual {v2}, Ljava/util/zip/Deflater;->finished()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v2, p0}, Ljava/util/zip/Deflater;->deflate([B)I

    move-result v1

    const/4 v3, 0x0

    invoke-virtual {v0, p0, v3, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/util/zip/Deflater;->end()V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0
.end method

.method private static n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    const-string p1, "UTF-8"

    :goto_0
    invoke-static {p0, p1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    invoke-static {p0}, Ll/tg3;->a(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static varargs o(Ljava/lang/String;Ljava/lang/String;[Ljava/io/File;)Ll/r4r0;
    .locals 3

    .line 1
    const-string v0, "have_dump=true"

    .line 2
    .line 3
    invoke-static {}, Ll/b350;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    new-instance p0, Ll/r4r0;

    .line 10
    .line 11
    const/16 p1, 0xc9

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ll/r4r0;-><init>(I)V

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/apm/lite/j/e;->i()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    const-string v1, "&encrypt=true"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const-string v1, ""

    .line 27
    .line 28
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/v3r0;

    .line 33
    .line 34
    invoke-static {p0, v0}, Lcom/apm/lite/j/e;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string v0, "UTF-8"

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    invoke-direct {v1, p0, v0, v2}, Ll/v3r0;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 42
    .line 43
    .line 44
    const-string p0, "json"

    .line 45
    .line 46
    invoke-virtual {v1, p0, p1, v2}, Ll/v3r0;->d(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 47
    .line 48
    .line 49
    const-string p0, "file"

    .line 50
    .line 51
    invoke-virtual {v1, p0, p2}, Ll/v3r0;->f(Ljava/lang/String;[Ljava/io/File;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Ll/v3r0;->a()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 58
    const/4 p1, 0x0

    .line 59
    :try_start_1
    new-instance p2, Lorg/json/JSONObject;

    .line 60
    .line 61
    invoke-direct {p2, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    new-instance p0, Ll/r4r0;

    .line 65
    .line 66
    invoke-direct {p0, p1, p2}, Ll/r4r0;-><init>(ILorg/json/JSONObject;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 67
    .line 68
    .line 69
    return-object p0

    .line 70
    :catch_0
    move-exception p0

    .line 71
    :try_start_2
    new-instance p2, Ll/r4r0;

    .line 72
    .line 73
    invoke-direct {p2, p1, p0}, Ll/r4r0;-><init>(ILjava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 74
    .line 75
    .line 76
    return-object p2

    .line 77
    :catch_1
    move-exception p0

    .line 78
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 79
    .line 80
    .line 81
    new-instance p0, Ll/r4r0;

    .line 82
    .line 83
    const/16 p1, 0xcf

    .line 84
    .line 85
    invoke-direct {p0, p1}, Ll/r4r0;-><init>(I)V

    .line 86
    .line 87
    .line 88
    return-object p0
.end method

.method private static p(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZ)Ll/r4r0;
    .locals 4

    .line 1
    const-string p6, "gzip"

    .line 2
    .line 3
    const-string v0, "http response code "

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :try_start_0
    new-instance v2, Ljava/net/URL;

    .line 7
    .line 8
    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_6

    .line 16
    .line 17
    :try_start_1
    invoke-static {p0}, Ll/irq0;->a(Ljava/net/HttpURLConnection;)V

    .line 18
    .line 19
    .line 20
    if-eqz p5, :cond_0

    .line 21
    .line 22
    const/4 p5, 0x1

    .line 23
    invoke-virtual {p0, p5}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    move-object v3, v1

    .line 29
    move-object v1, p0

    .line 30
    move-object p0, v3

    .line 31
    goto/16 :goto_5

    .line 32
    .line 33
    :cond_0
    const/4 p5, 0x0

    .line 34
    invoke-virtual {p0, p5}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 35
    .line 36
    .line 37
    :goto_0
    if-eqz p2, :cond_1

    .line 38
    .line 39
    const-string p5, "Content-Type"

    .line 40
    .line 41
    invoke-virtual {p0, p5, p2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    if-eqz p3, :cond_2

    .line 45
    .line 46
    const-string p2, "Content-Encoding"

    .line 47
    .line 48
    invoke-virtual {p0, p2, p3}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    const-string p2, "Accept-Encoding"

    .line 52
    .line 53
    invoke-virtual {p0, p2, p6}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    if-eqz p4, :cond_7

    .line 57
    .line 58
    if-eqz p7, :cond_3

    .line 59
    .line 60
    invoke-static {}, Ll/cyq0;->q()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    if-nez p3, :cond_3

    .line 69
    .line 70
    const-string p3, "aid"

    .line 71
    .line 72
    invoke-virtual {p0, p3, p2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-static {p2}, Ll/cyq0;->l(Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result p3

    .line 83
    if-nez p3, :cond_3

    .line 84
    .line 85
    const-string p3, "x-auth-token"

    .line 86
    .line 87
    invoke-virtual {p0, p3, p2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_3
    invoke-virtual {p0, p4}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    if-eqz p1, :cond_4

    .line 94
    .line 95
    array-length p2, p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 96
    if-lez p2, :cond_4

    .line 97
    .line 98
    :try_start_2
    new-instance p2, Ljava/io/DataOutputStream;

    .line 99
    .line 100
    invoke-virtual {p0}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 101
    .line 102
    .line 103
    move-result-object p3

    .line 104
    invoke-direct {p2, p3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 105
    .line 106
    .line 107
    :try_start_3
    invoke-virtual {p2, p1}, Ljava/io/OutputStream;->write([B)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p2}, Ljava/io/DataOutputStream;->flush()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 111
    .line 112
    .line 113
    :try_start_4
    invoke-static {p2}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 114
    .line 115
    .line 116
    goto :goto_2

    .line 117
    :catchall_1
    move-exception p1

    .line 118
    goto :goto_1

    .line 119
    :catchall_2
    move-exception p1

    .line 120
    move-object p2, v1

    .line 121
    :goto_1
    invoke-static {p2}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 122
    .line 123
    .line 124
    throw p1

    .line 125
    :cond_4
    :goto_2
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    const/16 p2, 0xc8

    .line 130
    .line 131
    if-ne p1, p2, :cond_6

    .line 132
    .line 133
    invoke-virtual {p0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 134
    .line 135
    .line 136
    move-result-object p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 137
    :try_start_5
    invoke-virtual {p0}, Ljava/net/URLConnection;->getContentEncoding()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    invoke-virtual {p6, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 142
    .line 143
    .line 144
    move-result p2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 145
    if-eqz p2, :cond_5

    .line 146
    .line 147
    :try_start_6
    new-instance p2, Ljava/util/zip/GZIPInputStream;

    .line 148
    .line 149
    invoke-direct {p2, p1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    .line 150
    .line 151
    .line 152
    :try_start_7
    invoke-static {p2}, Lcom/apm/lite/j/e;->k(Ljava/io/InputStream;)[B

    .line 153
    .line 154
    .line 155
    move-result-object p3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 156
    :try_start_8
    invoke-static {p2}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 157
    .line 158
    .line 159
    goto :goto_4

    .line 160
    :catchall_3
    move-exception p2

    .line 161
    move-object v1, p0

    .line 162
    move-object p0, p1

    .line 163
    move-object p1, p2

    .line 164
    goto :goto_5

    .line 165
    :catchall_4
    move-exception p3

    .line 166
    move-object v1, p2

    .line 167
    goto :goto_3

    .line 168
    :catchall_5
    move-exception p3

    .line 169
    :goto_3
    invoke-static {v1}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 170
    .line 171
    .line 172
    throw p3

    .line 173
    :cond_5
    invoke-static {p1}, Lcom/apm/lite/j/e;->k(Ljava/io/InputStream;)[B

    .line 174
    .line 175
    .line 176
    move-result-object p3

    .line 177
    :goto_4
    invoke-static {p3}, Lcom/apm/lite/j/e;->t([B)Ll/r4r0;

    .line 178
    .line 179
    .line 180
    move-result-object p2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 181
    :try_start_9
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0

    .line 182
    .line 183
    .line 184
    :catch_0
    invoke-static {p1}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 185
    .line 186
    .line 187
    return-object p2

    .line 188
    :cond_6
    :try_start_a
    new-instance p2, Ll/r4r0;

    .line 189
    .line 190
    new-instance p3, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    const/16 p3, 0xce

    .line 203
    .line 204
    invoke-direct {p2, p3, p1}, Ll/r4r0;-><init>(ILjava/lang/String;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 205
    .line 206
    .line 207
    :try_start_b
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_1

    .line 208
    .line 209
    .line 210
    :catch_1
    invoke-static {v1}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 211
    .line 212
    .line 213
    return-object p2

    .line 214
    :cond_7
    :try_start_c
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 215
    .line 216
    const-string p2, "request method is not null"

    .line 217
    .line 218
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    throw p1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 222
    :catchall_6
    move-exception p1

    .line 223
    move-object p0, v1

    .line 224
    :goto_5
    :try_start_d
    invoke-static {p1}, Ll/q5r0;->f(Ljava/lang/Throwable;)V

    .line 225
    .line 226
    .line 227
    new-instance p2, Ll/r4r0;

    .line 228
    .line 229
    const/16 p3, 0xcf

    .line 230
    .line 231
    invoke-direct {p2, p3, p1}, Ll/r4r0;-><init>(ILjava/lang/Throwable;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    .line 232
    .line 233
    .line 234
    if-eqz v1, :cond_8

    .line 235
    .line 236
    :try_start_e
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_2

    .line 237
    .line 238
    .line 239
    :catch_2
    :cond_8
    invoke-static {p0}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 240
    .line 241
    .line 242
    return-object p2

    .line 243
    :catchall_7
    move-exception p1

    .line 244
    if-eqz v1, :cond_9

    .line 245
    .line 246
    :try_start_f
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_3

    .line 247
    .line 248
    .line 249
    :catch_3
    :cond_9
    invoke-static {p0}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 250
    .line 251
    .line 252
    throw p1
.end method

.method public static q()Z
    .locals 2

    .line 1
    const-string v0, "sdk"

    const-string v1, "app"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method private static r([B)[B
    .locals 2

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v1, 0x2000

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    new-instance v1, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v1, v0}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    :try_start_0
    invoke-virtual {v1, p0}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0

    :catchall_0
    move-exception p0

    :try_start_1
    invoke-static {p0}, Ll/q5r0;->g(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    const/4 p0, 0x0

    return-object p0

    :catchall_1
    move-exception p0

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    throw p0
.end method

.method public static s()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    move-result-object v0

    invoke-virtual {v0}, Ll/ow5;->c()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static t([B)Ll/r4r0;
    .locals 2

    .line 1
    new-instance v0, Ll/r4r0;

    .line 2
    .line 3
    const/16 v1, 0xcc

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ll/r4r0;-><init>(I[B)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static u()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    move-result-object v0

    invoke-virtual {v0}, Ll/ow5;->a()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static v()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    move-result-object v0

    invoke-virtual {v0}, Ll/ow5;->e()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static w()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    move-result-object v0

    invoke-virtual {v0}, Ll/ow5;->h()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
