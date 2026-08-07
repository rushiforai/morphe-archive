.class public Lcom/xiaomi/push/service/az;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Ljava/lang/String;

.field private static a:Ljava/text/SimpleDateFormat;

.field private static a:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/xiaomi/push/service/az;->a:Ljava/util/concurrent/atomic/AtomicLong;

    .line 9
    .line 10
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 11
    .line 12
    const-string v1, "yyyy/MM/dd"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/xiaomi/push/service/az;->a:Ljava/text/SimpleDateFormat;

    .line 18
    .line 19
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Lcom/xiaomi/push/service/az;->a:Ljava/lang/String;

    .line 32
    .line 33
    return-void
.end method

.method private static a(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/gi;)Lcom/xiaomi/push/he;
    .locals 3

    .line 190
    new-instance v0, Lcom/xiaomi/push/he;

    const-string v1, "-1"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/xiaomi/push/he;-><init>(Ljava/lang/String;Z)V

    .line 191
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/he;->d(Ljava/lang/String;)Lcom/xiaomi/push/he;

    move-result-object p0

    .line 192
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/he;->b(Ljava/lang/String;)Lcom/xiaomi/push/he;

    move-result-object p0

    .line 193
    invoke-static {p2}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    move-result-object p1

    invoke-static {p1}, Ll/j6r0;->h([B)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/he;->a([B)Lcom/xiaomi/push/he;

    move-result-object p0

    sget-object p1, Lcom/xiaomi/push/gp;->B:Lcom/xiaomi/push/gp;

    iget-object p1, p1, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 194
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    move-result-object p0

    return-object p0
.end method

.method public static declared-synchronized a()Ljava/lang/String;
    .locals 5

    const-class v0, Lcom/xiaomi/push/service/az;

    monitor-enter v0

    .line 185
    :try_start_0
    sget-object v1, Lcom/xiaomi/push/service/az;->a:Ljava/text/SimpleDateFormat;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 186
    sget-object v2, Lcom/xiaomi/push/service/az;->a:Ljava/lang/String;

    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 187
    sget-object v2, Lcom/xiaomi/push/service/az;->a:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v3, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 188
    sput-object v1, Lcom/xiaomi/push/service/az;->a:Ljava/lang/String;

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    .line 189
    :cond_0
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "-"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/xiaomi/push/service/az;->a:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static a(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;I)Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/xiaomi/push/gj;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/ArrayList<",
            "Lcom/xiaomi/push/he;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    const-string p0, "requests can not be null in TinyDataHelper.transToThriftObj()."

    .line 5
    .line 6
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    const-string p0, "requests.length is 0 in TinyDataHelper.transToThriftObj()."

    .line 17
    .line 18
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v2, Lcom/xiaomi/push/gi;

    .line 28
    .line 29
    invoke-direct {v2}, Lcom/xiaomi/push/gi;-><init>()V

    .line 30
    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    move v4, v3

    .line 34
    move v5, v4

    .line 35
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    if-ge v4, v6, :cond_9

    .line 40
    .line 41
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    check-cast v6, Lcom/xiaomi/push/gj;

    .line 46
    .line 47
    if-nez v6, :cond_2

    .line 48
    .line 49
    goto/16 :goto_3

    .line 50
    .line 51
    :cond_2
    invoke-virtual {v6}, Lcom/xiaomi/push/gj;->a()Ljava/util/Map;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    if-eqz v7, :cond_5

    .line 56
    .line 57
    invoke-virtual {v6}, Lcom/xiaomi/push/gj;->a()Ljava/util/Map;

    .line 58
    .line 59
    .line 60
    move-result-object v7

    .line 61
    const-string v8, "item_size"

    .line 62
    .line 63
    invoke-interface {v7, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v7

    .line 67
    if-eqz v7, :cond_5

    .line 68
    .line 69
    invoke-virtual {v6}, Lcom/xiaomi/push/gj;->a()Ljava/util/Map;

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v7

    .line 77
    check-cast v7, Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v9

    .line 83
    if-nez v9, :cond_3

    .line 84
    .line 85
    :try_start_0
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    goto :goto_1

    .line 90
    :catch_0
    :cond_3
    move v7, v3

    .line 91
    :goto_1
    invoke-virtual {v6}, Lcom/xiaomi/push/gj;->a()Ljava/util/Map;

    .line 92
    .line 93
    .line 94
    move-result-object v9

    .line 95
    invoke-interface {v9}, Ljava/util/Map;->size()I

    .line 96
    .line 97
    .line 98
    move-result v9

    .line 99
    const/4 v10, 0x1

    .line 100
    if-ne v9, v10, :cond_4

    .line 101
    .line 102
    invoke-virtual {v6, v0}, Lcom/xiaomi/push/gj;->a(Ljava/util/Map;)Lcom/xiaomi/push/gj;

    .line 103
    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_4
    invoke-virtual {v6}, Lcom/xiaomi/push/gj;->a()Ljava/util/Map;

    .line 107
    .line 108
    .line 109
    move-result-object v9

    .line 110
    invoke-interface {v9, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_5
    move v7, v3

    .line 115
    :goto_2
    if-gtz v7, :cond_6

    .line 116
    .line 117
    invoke-static {v6}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    array-length v7, v7

    .line 122
    :cond_6
    if-le v7, p3, :cond_7

    .line 123
    .line 124
    new-instance v7, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    const-string v8, "TinyData is too big, ignore upload request item:"

    .line 127
    .line 128
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v6}, Lcom/xiaomi/push/gj;->d()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v6

    .line 135
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v6

    .line 142
    invoke-static {v6}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_7
    add-int v8, v5, v7

    .line 147
    .line 148
    if-le v8, p3, :cond_8

    .line 149
    .line 150
    invoke-static {p1, p2, v2}, Lcom/xiaomi/push/service/az;->a(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/gi;)Lcom/xiaomi/push/he;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    new-instance v2, Lcom/xiaomi/push/gi;

    .line 158
    .line 159
    invoke-direct {v2}, Lcom/xiaomi/push/gi;-><init>()V

    .line 160
    .line 161
    .line 162
    move v5, v3

    .line 163
    :cond_8
    invoke-virtual {v2, v6}, Lcom/xiaomi/push/gi;->a(Lcom/xiaomi/push/gj;)V

    .line 164
    .line 165
    .line 166
    add-int/2addr v5, v7

    .line 167
    :goto_3
    add-int/lit8 v4, v4, 0x1

    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :cond_9
    invoke-virtual {v2}, Lcom/xiaomi/push/gi;->a()I

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    if-eqz p0, :cond_a

    .line 176
    .line 177
    invoke-static {p1, p2, v2}, Lcom/xiaomi/push/service/az;->a(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/gi;)Lcom/xiaomi/push/he;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    :cond_a
    return-object v1
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .locals 1

    .line 208
    new-instance v0, Lcom/xiaomi/push/gj;

    invoke-direct {v0}, Lcom/xiaomi/push/gj;-><init>()V

    .line 209
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gj;->d(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 210
    invoke-virtual {v0, p2}, Lcom/xiaomi/push/gj;->c(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 211
    invoke-virtual {v0, p3, p4}, Lcom/xiaomi/push/gj;->a(J)Lcom/xiaomi/push/gj;

    .line 212
    invoke-virtual {v0, p5}, Lcom/xiaomi/push/gj;->b(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 213
    const-string p1, "push_sdk_channel"

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gj;->a(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 214
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gj;->g(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 215
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gj;->e(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    const/4 p1, 0x1

    .line 216
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gj;->a(Z)Lcom/xiaomi/push/gj;

    .line 217
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    invoke-virtual {v0, p1, p2}, Lcom/xiaomi/push/gj;->b(J)Lcom/xiaomi/push/gj;

    .line 218
    invoke-static {}, Lcom/xiaomi/push/service/az;->a()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gj;->f(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 219
    invoke-static {p0, v0}, Lcom/xiaomi/push/service/ba;->a(Landroid/content/Context;Lcom/xiaomi/push/gj;)V

    return-void
.end method

.method public static a(Lcom/xiaomi/push/gj;Z)Z
    .locals 2

    const/4 v0, 0x1

    if-nez p0, :cond_0

    .line 195
    const-string p0, "item is null, verfiy ClientUploadDataItem failed."

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return v0

    :cond_0
    if-nez p1, :cond_1

    .line 196
    iget-object p1, p0, Lcom/xiaomi/push/gj;->a:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 197
    const-string p0, "item.channel is null or empty, verfiy ClientUploadDataItem failed."

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return v0

    .line 198
    :cond_1
    iget-object p1, p0, Lcom/xiaomi/push/gj;->d:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 199
    const-string p0, "item.category is null or empty, verfiy ClientUploadDataItem failed."

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return v0

    .line 200
    :cond_2
    iget-object p1, p0, Lcom/xiaomi/push/gj;->c:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 201
    const-string p0, "item.name is null or empty, verfiy ClientUploadDataItem failed."

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return v0

    .line 202
    :cond_3
    iget-object p1, p0, Lcom/xiaomi/push/gj;->d:Ljava/lang/String;

    invoke-static {p1}, Ll/bvq0;->i(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 203
    const-string p0, "item.category can only contain ascii char, verfiy ClientUploadDataItem failed."

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return v0

    .line 204
    :cond_4
    iget-object p1, p0, Lcom/xiaomi/push/gj;->c:Ljava/lang/String;

    invoke-static {p1}, Ll/bvq0;->i(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 205
    const-string p0, "item.name can only contain ascii char, verfiy ClientUploadDataItem failed."

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return v0

    .line 206
    :cond_5
    iget-object p1, p0, Lcom/xiaomi/push/gj;->b:Ljava/lang/String;

    if-eqz p1, :cond_6

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    const/16 v1, 0x7800

    if-le p1, v1, :cond_6

    .line 207
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "item.data is too large("

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/xiaomi/push/gj;->b:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "), max size for data is 30720 , verfiy ClientUploadDataItem failed."

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return v0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public static a(Ljava/lang/String;)Z
    .locals 1

    .line 220
    invoke-static {}, Ll/t5r0;->i()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "com.miui.hybrid"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method
