.class Ll/koh0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/koh0$d;,
        Ll/koh0$c;,
        Ll/koh0$e;,
        Ll/koh0$b;
    }
.end annotation


# instance fields
.field private a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ll/aje;",
            "Ljava/util/List<",
            "Ll/koh0$e;",
            ">;>;"
        }
    .end annotation
.end field

.field private b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Ljava/lang/Object;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/koh0;->a:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/Object;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/koh0;->c:Ljava/lang/Object;

    .line 17
    .line 18
    return-void
.end method

.method public synthetic constructor <init>(Ll/koh0$a;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ll/koh0;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/koh0;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/koh0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/koh0;)Ll/aje;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/koh0;->l()Ll/aje;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Ll/koh0;Ll/aje;Z)Ll/xr4;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/koh0;->n(Ll/aje;Z)Ll/xr4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Ll/koh0;Ll/xr4;Ll/aje;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/koh0;->m(Ll/xr4;Ll/aje;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/koh0;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/koh0;->a:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method private f(Ll/aje;)Ljava/lang/String;
    .locals 5

    .line 1
    invoke-virtual {p1}, Ll/aje;->d()Ll/ire0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/vi20;->f()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez v1, :cond_5

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/aje;->b()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0}, Ll/ire0;->i()Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-eqz v3, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/ire0;->e()J

    .line 23
    .line 24
    .line 25
    move-result-wide v3

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {v0}, Ll/ire0;->g()J

    .line 28
    .line 29
    .line 30
    move-result-wide v3

    .line 31
    :goto_0
    invoke-static {v1, v3, v4}, Ll/cje;->b(Ljava/lang/String;J)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    goto :goto_3

    .line 38
    :cond_1
    iget-object v0, p0, Ll/koh0;->c:Ljava/lang/Object;

    .line 39
    .line 40
    monitor-enter v0

    .line 41
    :try_start_0
    iget-object p0, p0, Ll/koh0;->a:Ljava/util/Map;

    .line 42
    .line 43
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const/4 v1, 0x1

    .line 54
    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-eqz v3, :cond_3

    .line 59
    .line 60
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    check-cast v3, Ll/koh0$e;

    .line 65
    .line 66
    invoke-static {v3}, Ll/koh0$e;->a(Ll/koh0$e;)Ll/loh0;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    iget-boolean v3, v3, Ll/loh0;->a:Z

    .line 71
    .line 72
    if-nez v3, :cond_2

    .line 73
    .line 74
    const/4 v1, 0x0

    .line 75
    goto :goto_1

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    goto :goto_2

    .line 78
    :cond_3
    if-eqz v1, :cond_4

    .line 79
    .line 80
    new-instance p0, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Ll/aje;->b()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string p1, ": 4G\u73af\u5883\u4e0b\u53d6\u6d88\u81ea\u52a8\u4e0b\u8f7d\u5927\u6587\u4ef6"

    .line 93
    .line 94
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    monitor-exit v0

    .line 102
    return-object p0

    .line 103
    :cond_4
    monitor-exit v0

    .line 104
    return-object v2

    .line 105
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    throw p0

    .line 107
    :cond_5
    :goto_3
    return-object v2
.end method

.method private h()V
    .locals 1

    .line 1
    new-instance v0, Ll/koh0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/koh0$a;-><init>(Ll/koh0;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    invoke-static {p0, v0}, Ll/gyi0;->d(ILjava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private i(Ljava/util/List;Ll/aje;Ll/xr4;Z)Ll/xr4;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/wr4;",
            ">;",
            "Ll/aje;",
            "Ll/xr4;",
            "Z)",
            "Ll/xr4;"
        }
    .end annotation

    .line 1
    move-object/from16 v3, p2

    .line 2
    .line 3
    move-object/from16 v7, p3

    .line 4
    .line 5
    new-instance v1, Ll/koh0$c;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-direct {v1, p0, v0}, Ll/koh0$c;-><init>(Ll/koh0;Ll/koh0$a;)V

    .line 9
    .line 10
    .line 11
    if-eqz p4, :cond_0

    .line 12
    .line 13
    invoke-static {v1, p1, v3}, Ll/koh0$c;->a(Ll/koh0$c;Ljava/util/List;Ll/aje;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {v3}, Ll/cje;->p(Ll/aje;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v8

    .line 23
    :cond_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const-string v9, "SDKResource"

    .line 28
    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    move-object v2, v0

    .line 36
    check-cast v2, Ll/wr4;

    .line 37
    .line 38
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 39
    .line 40
    .line 41
    move-result-wide v10

    .line 42
    invoke-virtual {v2, v7}, Ll/wr4;->g(Ll/xr4;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2, v3}, Ll/wr4;->e(Ll/aje;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz p4, :cond_2

    .line 50
    .line 51
    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    .line 52
    .line 53
    const/high16 v6, 0x3f800000    # 1.0f

    .line 54
    .line 55
    invoke-static/range {v1 .. v6}, Ll/koh0$c;->b(Ll/koh0$c;Ll/wr4;Ll/aje;DF)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catch_0
    move-exception v0

    .line 60
    goto :goto_1

    .line 61
    :cond_2
    :goto_0
    const-string v4, "\u5b8c\u6210\u804c\u8d23\uff1a%s::%s::time: %s"

    .line 62
    .line 63
    invoke-virtual {v2}, Ll/wr4;->d()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    invoke-virtual {v3}, Ll/aje;->b()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 72
    .line 73
    .line 74
    move-result-wide v12

    .line 75
    sub-long/2addr v12, v10

    .line 76
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 77
    .line 78
    .line 79
    move-result-object v10

    .line 80
    filled-new-array {v5, v6, v10}, [Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    invoke-static {v9, v4, v5}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .line 86
    .line 87
    goto :goto_2

    .line 88
    :goto_1
    invoke-static {v9, v0}, Lcom/immomo/resdownloader/log/MLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    const/4 v4, 0x7

    .line 92
    invoke-virtual {v2, v4, v0}, Ll/wr4;->i(ILjava/lang/Exception;)V

    .line 93
    .line 94
    .line 95
    const/4 v0, 0x0

    .line 96
    :goto_2
    if-nez v0, :cond_1

    .line 97
    .line 98
    invoke-virtual {v2}, Ll/wr4;->d()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v7}, Ll/xr4;->a()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    filled-new-array {v0, v4}, [Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    const-string v4, "%s\n%s"

    .line 111
    .line 112
    invoke-static {v9, v4, v0}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    invoke-static {v3}, Ll/cje;->p(Ll/aje;)V

    .line 116
    .line 117
    .line 118
    invoke-direct {p0, v3}, Ll/koh0;->k(Ll/aje;)V

    .line 119
    .line 120
    .line 121
    const/4 p0, 0x1

    .line 122
    invoke-virtual {v7, p0}, Ll/xr4;->f(Z)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v7}, Ll/xr4;->b()I

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-nez p0, :cond_3

    .line 130
    .line 131
    new-instance p0, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v7}, Ll/xr4;->a()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v0, " handle failed "

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v2}, Ll/wr4;->d()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    const/16 v0, 0xe

    .line 160
    .line 161
    invoke-virtual {v7, v0, p0}, Ll/xr4;->e(ILjava/lang/String;)V

    .line 162
    .line 163
    .line 164
    :cond_3
    invoke-virtual {v3}, Ll/aje;->b()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    const-string v0, "\u8d44\u6e90\u540c\u6b65\u4efb\u52a1\u5b8c\u6210 : %s"

    .line 173
    .line 174
    invoke-static {v9, v0, p0}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    if-eqz p4, :cond_4

    .line 178
    .line 179
    const/16 p0, 0x64

    .line 180
    .line 181
    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    .line 182
    .line 183
    invoke-static {v1, p0, v4, v5, v3}, Ll/koh0$c;->c(Ll/koh0$c;IDLl/aje;)V

    .line 184
    .line 185
    .line 186
    :cond_4
    return-object v7
.end method

.method public static j()Ll/koh0;
    .locals 1

    .line 1
    invoke-static {}, Ll/koh0$b;->a()Ll/koh0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private k(Ll/aje;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/aje;->d()Ll/ire0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ire0;->i()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Ll/koh0;->b:Ljava/util/Map;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Landroid/util/ArrayMap;

    .line 17
    .line 18
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/koh0;->b:Ljava/util/Map;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Ll/koh0;->b:Ljava/util/Map;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/aje;->b()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ljava/lang/Integer;

    .line 34
    .line 35
    const-string v1, "SDKResource"

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    goto :goto_0

    .line 45
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-lt v3, v2, :cond_3

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/aje;->b()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string v0, "%s \u589e\u91cf\u66f4\u65b0\u5931\u8d25\uff0c\u8fdb\u884c\u5168\u91cf\u66f4\u65b0"

    .line 60
    .line 61
    invoke-static {v1, v0, p0}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1}, Ll/aje;->d()Ll/ire0;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const/4 p1, 0x0

    .line 69
    invoke-virtual {p0, p1}, Ll/ire0;->j(Z)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr v0, v2

    .line 78
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    :goto_0
    const-string v2, "\u589e\u91cf\u66f4\u65b0\u5931\u8d25\uff1a%d"

    .line 83
    .line 84
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-static {v1, v2, v3}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/koh0;->b:Ljava/util/Map;

    .line 92
    .line 93
    invoke-virtual {p1}, Ll/aje;->b()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method private l()Ll/aje;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/koh0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/koh0;->a:Ljava/util/Map;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 v1, 0x0

    .line 15
    const-wide/16 v2, -0x1

    .line 16
    .line 17
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-eqz v4, :cond_1

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    check-cast v4, Ll/aje;

    .line 28
    .line 29
    invoke-virtual {v4}, Ll/aje;->c()J

    .line 30
    .line 31
    .line 32
    move-result-wide v5

    .line 33
    cmp-long v5, v5, v2

    .line 34
    .line 35
    if-lez v5, :cond_0

    .line 36
    .line 37
    invoke-virtual {v4}, Ll/aje;->c()J

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    move-wide v2, v1

    .line 42
    move-object v1, v4

    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    monitor-exit v0

    .line 47
    return-object v1

    .line 48
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw p0
.end method

.method private m(Ll/xr4;Ll/aje;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/koh0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/koh0;->a:Ljava/util/Map;

    .line 5
    .line 6
    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ljava/util/List;

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto/16 :goto_3

    .line 18
    .line 19
    :cond_0
    iget-object v2, p0, Ll/koh0;->a:Ljava/util/Map;

    .line 20
    .line 21
    invoke-interface {v2, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_5

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Ll/koh0$e;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/xr4;->c()Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-nez v3, :cond_2

    .line 45
    .line 46
    invoke-virtual {v2, p2}, Ll/koh0$e;->d(Ll/aje;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-virtual {p1}, Ll/xr4;->b()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-virtual {p1}, Ll/xr4;->a()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-virtual {v2, v3, v4}, Ll/koh0$e;->c(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v2}, Ll/koh0$e;->a(Ll/koh0$e;)Ll/loh0;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    iget-object v3, v3, Ll/loh0;->b:[Ll/aje;

    .line 66
    .line 67
    array-length v4, v3

    .line 68
    const/4 v5, 0x0

    .line 69
    :goto_1
    if-ge v5, v4, :cond_1

    .line 70
    .line 71
    aget-object v6, v3, v5

    .line 72
    .line 73
    if-ne v6, p2, :cond_3

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_3
    iget-object v7, p0, Ll/koh0;->a:Ljava/util/Map;

    .line 77
    .line 78
    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    check-cast v7, Ljava/util/List;

    .line 83
    .line 84
    if-eqz v7, :cond_4

    .line 85
    .line 86
    invoke-interface {v7, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    if-eqz v8, :cond_4

    .line 91
    .line 92
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    .line 93
    .line 94
    .line 95
    move-result v7

    .line 96
    if-eqz v7, :cond_4

    .line 97
    .line 98
    iget-object v7, p0, Ll/koh0;->a:Ljava/util/Map;

    .line 99
    .line 100
    invoke-interface {v7, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    const-string v7, "SDKResource"

    .line 104
    .line 105
    const-string v8, "%s \u56e0\u4e3a%s\u5931\u8d25\u800c\u88ab\u53d6\u6d88\u4e0b\u8f7d"

    .line 106
    .line 107
    invoke-virtual {v6}, Ll/aje;->b()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    invoke-virtual {p2}, Ll/aje;->b()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v9

    .line 115
    filled-new-array {v6, v9}, [Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v6

    .line 119
    invoke-static {v7, v8, v6}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 120
    .line 121
    .line 122
    :cond_4
    :goto_2
    add-int/lit8 v5, v5, 0x1

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_5
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 126
    invoke-virtual {p1}, Ll/xr4;->c()Z

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    if-eqz p0, :cond_6

    .line 131
    .line 132
    invoke-static {p2, p1}, Ll/xie;->a(Ll/aje;Ll/xr4;)V

    .line 133
    .line 134
    .line 135
    :cond_6
    return-void

    .line 136
    :goto_3
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 137
    throw p0
.end method

.method private n(Ll/aje;Z)Ll/xr4;
    .locals 7

    .line 1
    invoke-virtual {p1}, Ll/aje;->d()Ll/ire0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/xr4;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/xr4;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "SDKResource"

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, 0x1

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-static {p1}, Ll/cje;->c(Ll/aje;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ll/aje;->d()Ll/ire0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v5, 0x0

    .line 24
    const-string v6, "Event_Resource_CONFIG"

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    invoke-static {v6, v3, v5}, Ll/u4d0;->a(Ljava/lang/String;ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v4}, Ll/xr4;->f(Z)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Ll/aje;->b()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p1, " \u62c9\u53d6\u670d\u52a1\u5668\u914d\u7f6e\u4fe1\u606f\u5931\u8d25"

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v1, v4, p0}, Ll/xr4;->e(ILjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-object v1

    .line 59
    :cond_0
    invoke-static {v6, v4, v5}, Ll/u4d0;->a(Ljava/lang/String;ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Ll/aje;->b()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v5, "%s \u62c9\u53d6ServerConfig\u6210\u529f"

    .line 71
    .line 72
    invoke-static {v2, v5, v0}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    invoke-virtual {p1}, Ll/aje;->g()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    new-instance p0, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Ll/aje;->b()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string p1, ":\u8d44\u6e90\u53ef\u7528\uff0c\u4e0d\u9700\u8981\u540c\u6b65"

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    new-array p1, v3, [Ljava/lang/Object;

    .line 103
    .line 104
    invoke-static {v2, p0, p1}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    return-object v1

    .line 108
    :cond_2
    if-eqz p2, :cond_3

    .line 109
    .line 110
    invoke-direct {p0, p1}, Ll/koh0;->f(Ll/aje;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    if-eqz v0, :cond_3

    .line 115
    .line 116
    invoke-virtual {v1, v4}, Ll/xr4;->f(Z)V

    .line 117
    .line 118
    .line 119
    const/16 p0, 0xc

    .line 120
    .line 121
    invoke-virtual {v1, p0, v0}, Ll/xr4;->e(ILjava/lang/String;)V

    .line 122
    .line 123
    .line 124
    return-object v1

    .line 125
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    .line 126
    .line 127
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-static {p1}, Ll/koh0$d;->a(Ll/aje;)Ljava/util/List;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 135
    .line 136
    .line 137
    new-instance v2, Ll/e1k0;

    .line 138
    .line 139
    invoke-direct {v2}, Ll/e1k0;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    if-eqz v2, :cond_4

    .line 150
    .line 151
    invoke-virtual {v1, v4}, Ll/xr4;->f(Z)V

    .line 152
    .line 153
    .line 154
    const/16 p0, 0x2710

    .line 155
    .line 156
    const-string p1, ":\u804c\u8d23\u94fe\u4e3a\u7a7a\uff0c\u8bf7\u68c0\u67e5\u4ee3\u7801\u903b\u8f91"

    .line 157
    .line 158
    invoke-virtual {v1, p0, p1}, Ll/xr4;->e(ILjava/lang/String;)V

    .line 159
    .line 160
    .line 161
    return-object v1

    .line 162
    :cond_4
    invoke-direct {p0, v0, p1, v1, p2}, Ll/koh0;->i(Ljava/util/List;Ll/aje;Ll/xr4;Z)Ll/xr4;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    return-object p0
.end method


# virtual methods
.method public g(Ll/loh0;)V
    .locals 9

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string v0, "SDKResource"

    .line 5
    .line 6
    const-string v1, " execute: %s"

    .line 7
    .line 8
    iget-object v2, p1, Ll/loh0;->b:[Ll/aje;

    .line 9
    .line 10
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-static {v0, v1, v2}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/koh0$e;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Ll/koh0$e;-><init>(Ll/loh0;)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p1, Ll/loh0;->b:[Ll/aje;

    .line 27
    .line 28
    array-length v1, v1

    .line 29
    const/4 v2, 0x0

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    const-string p0, "\u8bf7\u6c42\u4e0b\u8f7d\u7684\u8d44\u6e90\u96c6\u5408\u4e3a\u7a7a"

    .line 33
    .line 34
    invoke-virtual {v0, v2, p0}, Ll/koh0$e;->c(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object v1, p0, Ll/koh0;->c:Ljava/lang/Object;

    .line 39
    .line 40
    monitor-enter v1

    .line 41
    :try_start_0
    iget-object v3, p0, Ll/koh0;->a:Ljava/util/Map;

    .line 42
    .line 43
    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    iget-object p1, p1, Ll/loh0;->b:[Ll/aje;

    .line 48
    .line 49
    array-length v4, p1

    .line 50
    :goto_0
    if-ge v2, v4, :cond_5

    .line 51
    .line 52
    aget-object v5, p1, v2

    .line 53
    .line 54
    invoke-virtual {v5}, Ll/aje;->g()Z

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    if-eqz v6, :cond_2

    .line 59
    .line 60
    const/high16 v6, 0x42c80000    # 100.0f

    .line 61
    .line 62
    const-wide/high16 v7, -0x4010000000000000L    # -1.0

    .line 63
    .line 64
    invoke-virtual {v0, v6, v7, v8, v5}, Ll/koh0$e;->e(FDLl/aje;)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :catchall_0
    move-exception p0

    .line 69
    goto :goto_2

    .line 70
    :cond_2
    :goto_1
    iget-object v6, p0, Ll/koh0;->a:Ljava/util/Map;

    .line 71
    .line 72
    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    check-cast v6, Ljava/util/List;

    .line 77
    .line 78
    if-nez v6, :cond_3

    .line 79
    .line 80
    new-instance v6, Ljava/util/LinkedList;

    .line 81
    .line 82
    invoke-direct {v6}, Ljava/util/LinkedList;-><init>()V

    .line 83
    .line 84
    .line 85
    iget-object v7, p0, Ll/koh0;->a:Ljava/util/Map;

    .line 86
    .line 87
    invoke-interface {v7, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    :cond_3
    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    invoke-virtual {v5}, Ll/aje;->g()Z

    .line 94
    .line 95
    .line 96
    move-result v6

    .line 97
    if-eqz v6, :cond_4

    .line 98
    .line 99
    new-instance v6, Ll/xr4;

    .line 100
    .line 101
    invoke-direct {v6}, Ll/xr4;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-direct {p0, v6, v5}, Ll/koh0;->m(Ll/xr4;Ll/aje;)V

    .line 105
    .line 106
    .line 107
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_5
    if-eqz v3, :cond_6

    .line 111
    .line 112
    invoke-direct {p0}, Ll/koh0;->h()V

    .line 113
    .line 114
    .line 115
    :cond_6
    monitor-exit v1

    .line 116
    return-void

    .line 117
    :goto_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 118
    throw p0
.end method
