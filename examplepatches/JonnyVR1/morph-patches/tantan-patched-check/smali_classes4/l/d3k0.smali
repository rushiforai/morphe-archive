.class public Ll/d3k0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/rg50;

.field public static final b:Ll/e7y;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-string v0, "application/json; charset=utf-8"

    .line 2
    .line 3
    invoke-static {v0}, Ll/e7y;->d(Ljava/lang/String;)Ll/e7y;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/d3k0;->b:Ll/e7y;

    .line 8
    .line 9
    new-instance v0, Ll/rg50$b;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/rg50$b;-><init>()V

    .line 12
    .line 13
    .line 14
    const-wide/16 v1, 0x5

    .line 15
    .line 16
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2, v3}, Ll/rg50$b;->f(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Ll/d1j0;->a(Ll/rg50$b;)Ll/rg50$b;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ll/rg50$b;->c()Ll/rg50;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Ll/d3k0;->a:Ll/rg50;

    .line 30
    .line 31
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

.method public static a(Ljava/util/List;)Lcom/google/gson/JsonArray;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/v4f;",
            ">;)",
            "Lcom/google/gson/JsonArray;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_3

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/v4f;

    .line 21
    .line 22
    new-instance v2, Lcom/google/gson/JsonParser;

    .line 23
    .line 24
    invoke-direct {v2}, Lcom/google/gson/JsonParser;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v3, v1, Ll/v4f;->b:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Lcom/google/gson/JsonParser;->parse(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Lcom/google/gson/JsonObject;

    .line 34
    .line 35
    new-instance v3, Lcom/google/gson/JsonParser;

    .line 36
    .line 37
    invoke-direct {v3}, Lcom/google/gson/JsonParser;-><init>()V

    .line 38
    .line 39
    .line 40
    iget-object v1, v1, Ll/v4f;->c:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v3, v1}, Lcom/google/gson/JsonParser;->parse(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lcom/google/gson/JsonObject;

    .line 47
    .line 48
    if-eqz v2, :cond_0

    .line 49
    .line 50
    if-eqz v1, :cond_0

    .line 51
    .line 52
    invoke-virtual {v2}, Lcom/google/gson/JsonObject;->entrySet()Ljava/util/Set;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    check-cast v3, Lcom/google/gson/JsonArray;

    .line 68
    .line 69
    const-string v4, "sdtm"

    .line 70
    .line 71
    if-nez v3, :cond_2

    .line 72
    .line 73
    new-instance v3, Lcom/google/gson/JsonArray;

    .line 74
    .line 75
    invoke-direct {v3}, Lcom/google/gson/JsonArray;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 79
    .line 80
    .line 81
    move-result-wide v5

    .line 82
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    invoke-virtual {v1, v4, v5}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/Number;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3, v1}, Lcom/google/gson/JsonArray;->add(Lcom/google/gson/JsonElement;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 97
    .line 98
    .line 99
    move-result-wide v5

    .line 100
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {v1, v4, v2}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/Number;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v3, v1}, Lcom/google/gson/JsonArray;->add(Lcom/google/gson/JsonElement;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_3
    new-instance p0, Lcom/google/gson/JsonArray;

    .line 112
    .line 113
    invoke-direct {p0}, Lcom/google/gson/JsonArray;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-eqz v1, :cond_4

    .line 129
    .line 130
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    check-cast v1, Ljava/util/Map$Entry;

    .line 135
    .line 136
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    check-cast v2, Lcom/google/gson/JsonObject;

    .line 141
    .line 142
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    check-cast v1, Lcom/google/gson/JsonArray;

    .line 147
    .line 148
    const-string v3, "evs"

    .line 149
    .line 150
    invoke-virtual {v2, v3, v1}, Lcom/google/gson/JsonObject;->add(Ljava/lang/String;Lcom/google/gson/JsonElement;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0, v2}, Lcom/google/gson/JsonArray;->add(Lcom/google/gson/JsonElement;)V

    .line 154
    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_4
    return-object p0
.end method

.method public static b(Ljava/lang/String;Lcom/google/gson/JsonArray;I)Z
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_6

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/google/gson/JsonArray;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-gtz v1, :cond_0

    .line 9
    .line 10
    goto/16 :goto_4

    .line 11
    .line 12
    :cond_0
    invoke-static {}, Ll/i4g0;->h()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    return v0

    .line 19
    :cond_1
    :try_start_0
    sget-object v1, Ll/d3k0;->b:Ll/e7y;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/google/gson/JsonElement;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Ll/sjj;->a(Ljava/lang/String;)[B

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {v1, p1}, Ll/z1d0;->create(Ll/e7y;[B)Ll/z1d0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Ll/m4g0;->d()Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v2, "build"

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->d(Ljava/lang/String;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    const-string v2, ""

    .line 48
    .line 49
    if-nez v1, :cond_2

    .line 50
    .line 51
    move-object v1, v2

    .line 52
    :cond_2
    :try_start_1
    new-instance v3, Ll/x1d0$a;

    .line 53
    .line 54
    invoke-direct {v3}, Ll/x1d0$a;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v3, "count"

    .line 62
    .line 63
    new-instance v4, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-virtual {p0, v3, p2}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const-string p2, "buildv"

    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {p0, p2, v1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const-string p2, "sdkv"

    .line 90
    .line 91
    const-string v1, "0.9.3.2-SNAPSHOT"

    .line 92
    .line 93
    invoke-virtual {p0, p2, v1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    const-string p2, "Content-Encoding"

    .line 98
    .line 99
    const-string v1, "gzip"

    .line 100
    .line 101
    invoke-virtual {p0, p2, v1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    const-string p2, "localId"

    .line 106
    .line 107
    invoke-static {}, Ll/i4g0;->e()Landroid/content/Context;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-static {v1}, Ll/tvv;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {p0, p2, v1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-static {}, Ll/i4g0;->f()Ll/rg50;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    if-nez p1, :cond_3

    .line 132
    .line 133
    sget-object p1, Ll/d3k0;->a:Ll/rg50;

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :catch_0
    move-exception p0

    .line 137
    goto :goto_1

    .line 138
    :cond_3
    :goto_0
    invoke-virtual {p1, p0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-interface {p0}, Ll/ry3;->execute()Ll/i5d0;

    .line 143
    .line 144
    .line 145
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 146
    goto :goto_2

    .line 147
    :goto_1
    invoke-static {p0}, Ll/wu80;->b(Ljava/lang/Exception;)V

    .line 148
    .line 149
    .line 150
    const/4 p0, 0x0

    .line 151
    :goto_2
    const/4 p1, 0x0

    .line 152
    if-eqz p0, :cond_5

    .line 153
    .line 154
    invoke-virtual {p0}, Ll/i5d0;->q()I

    .line 155
    .line 156
    .line 157
    move-result p2

    .line 158
    const/16 v1, 0xc8

    .line 159
    .line 160
    if-ne p2, v1, :cond_4

    .line 161
    .line 162
    goto :goto_3

    .line 163
    :cond_4
    move v0, p1

    .line 164
    :goto_3
    invoke-virtual {p0}, Ll/i5d0;->close()V

    .line 165
    .line 166
    .line 167
    move p1, v0

    .line 168
    :cond_5
    return p1

    .line 169
    :cond_6
    :goto_4
    return v0
.end method
