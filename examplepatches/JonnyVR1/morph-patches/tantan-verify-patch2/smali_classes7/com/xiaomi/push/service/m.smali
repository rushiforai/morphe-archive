.class public Lcom/xiaomi/push/service/m;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/service/m$a;
    }
.end annotation


# static fields
.field private static volatile a:Lcom/xiaomi/push/service/m;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field


# instance fields
.field private a:I

.field private a:J

.field private final a:Landroid/content/Context;

.field private final a:Landroid/content/SharedPreferences;

.field private a:Ljava/lang/String;

.field private final a:Ljava/util/concurrent/atomic/AtomicInteger;

.field private volatile a:Z

.field private b:J

.field private b:Ljava/lang/String;

.field private final b:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final b:Z

.field private final c:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final c:Z

.field private final d:Z


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    .line 14
    .line 15
    iput-boolean v1, p0, Lcom/xiaomi/push/service/m;->a:Z

    .line 16
    .line 17
    iput-object v0, p0, Lcom/xiaomi/push/service/m;->b:Ljava/lang/String;

    .line 18
    .line 19
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/xiaomi/push/service/m;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 25
    .line 26
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/xiaomi/push/service/m;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 32
    .line 33
    const/4 v0, -0x1

    .line 34
    iput v0, p0, Lcom/xiaomi/push/service/m;->a:I

    .line 35
    .line 36
    const-wide/16 v2, -0x1

    .line 37
    .line 38
    iput-wide v2, p0, Lcom/xiaomi/push/service/m;->b:J

    .line 39
    .line 40
    iput-object p1, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/Context;

    .line 41
    .line 42
    invoke-static {p1}, Ll/l4r0;->j(Landroid/content/Context;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput-boolean v0, p0, Lcom/xiaomi/push/service/m;->c:Z

    .line 47
    .line 48
    invoke-static {p1}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget-object v4, Lcom/xiaomi/push/gk;->bg:Lcom/xiaomi/push/gk;

    .line 53
    .line 54
    invoke-virtual {v4}, Lcom/xiaomi/push/gk;->a()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    const/4 v5, 0x1

    .line 59
    invoke-virtual {v0, v4, v5}, Lcom/xiaomi/push/service/ah;->a(IZ)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iput-boolean v0, p0, Lcom/xiaomi/push/service/m;->b:Z

    .line 64
    .line 65
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->g()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iput-boolean v0, p0, Lcom/xiaomi/push/service/m;->d:Z

    .line 70
    .line 71
    const-string v0, "hb_record"

    .line 72
    .line 73
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 78
    .line 79
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 80
    .line 81
    .line 82
    move-result-wide v0

    .line 83
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->c()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-interface {p1, v4, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 88
    .line 89
    .line 90
    move-result-wide v4

    .line 91
    cmp-long v4, v4, v2

    .line 92
    .line 93
    if-nez v4, :cond_0

    .line 94
    .line 95
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->c()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    invoke-interface {v4, v5, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 108
    .line 109
    .line 110
    :cond_0
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->i()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-interface {p1, v4, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 115
    .line 116
    .line 117
    move-result-wide v4

    .line 118
    iput-wide v4, p0, Lcom/xiaomi/push/service/m;->a:J

    .line 119
    .line 120
    cmp-long v2, v4, v2

    .line 121
    .line 122
    if-nez v2, :cond_1

    .line 123
    .line 124
    iput-wide v0, p0, Lcom/xiaomi/push/service/m;->a:J

    .line 125
    .line 126
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->i()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-interface {p0, p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 139
    .line 140
    .line 141
    :cond_1
    return-void
.end method

.method private a()I
    .locals 2

    .line 214
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 215
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    iget-object p0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    invoke-static {p0}, Lcom/xiaomi/push/service/m$a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    :catchall_0
    :cond_0
    return v1
.end method

.method public static a(Landroid/content/Context;)Lcom/xiaomi/push/service/m;
    .locals 2

    .line 167
    sget-object v0, Lcom/xiaomi/push/service/m;->a:Lcom/xiaomi/push/service/m;

    if-nez v0, :cond_1

    .line 168
    const-class v0, Lcom/xiaomi/push/service/m;

    monitor-enter v0

    .line 169
    :try_start_0
    sget-object v1, Lcom/xiaomi/push/service/m;->a:Lcom/xiaomi/push/service/m;

    if-nez v1, :cond_0

    .line 170
    new-instance v1, Lcom/xiaomi/push/service/m;

    invoke-direct {v1, p0}, Lcom/xiaomi/push/service/m;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/xiaomi/push/service/m;->a:Lcom/xiaomi/push/service/m;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 171
    :cond_0
    :goto_0
    monitor-exit v0

    goto :goto_2

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 172
    :cond_1
    :goto_2
    sget-object p0, Lcom/xiaomi/push/service/m;->a:Lcom/xiaomi/push/service/m;

    return-object p0
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/xiaomi/push/gj;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/xiaomi/push/gj;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gj;->d(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 7
    .line 8
    .line 9
    const-string p1, "hb_name"

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gj;->c(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 12
    .line 13
    .line 14
    const-string p1, "hb_channel"

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gj;->a(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 17
    .line 18
    .line 19
    const-wide/16 v1, 0x1

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/gj;->a(J)Lcom/xiaomi/push/gj;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p2}, Lcom/xiaomi/push/gj;->b(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 25
    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gj;->a(Z)Lcom/xiaomi/push/gj;

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/gj;->b(J)Lcom/xiaomi/push/gj;

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/Context;

    .line 39
    .line 40
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {v0, p2}, Lcom/xiaomi/push/gj;->g(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 45
    .line 46
    .line 47
    const-string p2, "com.xiaomi.xmsf"

    .line 48
    .line 49
    invoke-virtual {v0, p2}, Lcom/xiaomi/push/gj;->e(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 50
    .line 51
    .line 52
    if-nez p3, :cond_0

    .line 53
    .line 54
    new-instance p3, Ljava/util/HashMap;

    .line 55
    .line 56
    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object p2, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/Context;

    .line 60
    .line 61
    invoke-static {p2}, Lcom/xiaomi/push/service/q;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/p;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    if-eqz p2, :cond_1

    .line 66
    .line 67
    iget-object v1, p2, Lcom/xiaomi/push/service/p;->a:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-nez v1, :cond_1

    .line 74
    .line 75
    iget-object p2, p2, Lcom/xiaomi/push/service/p;->a:Ljava/lang/String;

    .line 76
    .line 77
    const-string v1, "@"

    .line 78
    .line 79
    invoke-virtual {p2, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    array-length v1, p2

    .line 84
    if-lez v1, :cond_1

    .line 85
    .line 86
    aget-object p1, p2, p1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    const/4 p1, 0x0

    .line 90
    :goto_0
    const-string p2, "uuid"

    .line 91
    .line 92
    invoke-interface {p3, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    const-string p1, "model"

    .line 96
    .line 97
    invoke-static {}, Ll/q4r0;->a()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    invoke-interface {p3, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/Context;

    .line 105
    .line 106
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    invoke-static {p1, p2}, Lcom/xiaomi/push/g;->b(Landroid/content/Context;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    const-string p2, "avc"

    .line 119
    .line 120
    invoke-interface {p3, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    const p1, 0xc6dd

    .line 124
    .line 125
    .line 126
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    const-string p2, "pvc"

    .line 131
    .line 132
    invoke-interface {p3, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    const/16 p1, 0x30

    .line 136
    .line 137
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    const-string p2, "cvc"

    .line 142
    .line 143
    invoke-interface {p3, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, p3}, Lcom/xiaomi/push/gj;->a(Ljava/util/Map;)Lcom/xiaomi/push/gj;

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/Context;

    .line 150
    .line 151
    invoke-static {p1}, Ll/z2r0;->b(Landroid/content/Context;)Ll/z2r0;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    if-eqz p1, :cond_2

    .line 156
    .line 157
    iget-object p0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/Context;

    .line 158
    .line 159
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {p1, v0, p0}, Ll/z2r0;->e(Lcom/xiaomi/push/gj;Ljava/lang/String;)Z

    .line 164
    .line 165
    .line 166
    :cond_2
    return-void
.end method

.method private a(Z)V
    .locals 6

    .line 218
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->c()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_4

    :cond_0
    if-eqz p1, :cond_1

    .line 219
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    :goto_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    goto :goto_0

    .line 220
    :goto_1
    const-string v1, "long"

    const-string v2, "short"

    if-eqz p1, :cond_2

    move-object v3, v2

    goto :goto_2

    :cond_2
    move-object v3, v1

    .line 221
    :goto_2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    .line 222
    const-string v4, "[HB] %s ping interval count: %s"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ll/ouq0;->w(Ljava/lang/String;)V

    const/4 v3, 0x5

    if-lt v0, v3, :cond_6

    if-eqz p1, :cond_3

    .line 223
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->d()Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    .line 224
    :cond_3
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->e()Ljava/lang/String;

    move-result-object v3

    .line 225
    :goto_3
    iget-object v4, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    const/4 v5, 0x0

    invoke-interface {v4, v3, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    add-int/2addr v4, v0

    .line 226
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    if-eqz p1, :cond_4

    move-object v1, v2

    .line 227
    :cond_4
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v1, v0}, [Ljava/lang/Object;

    move-result-object v0

    .line 228
    const-string v1, "[HB] accumulate %s hb count(%s) and write to file. "

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    if-eqz p1, :cond_5

    .line 229
    iget-object p0, p0, Lcom/xiaomi/push/service/m;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p0, v5}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void

    .line 230
    :cond_5
    iget-object p0, p0, Lcom/xiaomi/push/service/m;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p0, v5}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    :cond_6
    :goto_4
    return-void
.end method

.method private a()Z
    .locals 3

    .line 198
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/push/gk;->bi:Lcom/xiaomi/push/gk;

    .line 199
    invoke-virtual {v1}, Lcom/xiaomi/push/gk;->a()I

    move-result v1

    const/4 v2, 0x3

    .line 200
    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/ah;->a(II)I

    move-result v0

    .line 201
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 202
    iget-object p0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p0

    if-lt p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private a(Ljava/lang/String;)Z
    .locals 1

    .line 216
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    return v0

    .line 217
    :cond_0
    const-string p0, "W-"

    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_2

    const-string p0, "M-"

    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private b(Ljava/lang/String;)V
    .locals 9

    .line 1
    const-string v0, "WIFI-ID-UNKNOWN"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object p1, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const-string v0, "W-"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-boolean p1, p0, Lcom/xiaomi/push/service/m;->d:Z

    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    const-string p1, "W-NETWORK_ID_WIFI_DEFAULT"

    .line 27
    .line 28
    iput-object p1, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/4 p1, 0x0

    .line 32
    iput-object p1, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    iput-object p1, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    .line 36
    .line 37
    :goto_0
    iget-object p1, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/xiaomi/push/service/m$a;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const/4 v1, -0x1

    .line 46
    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 51
    .line 52
    iget-object v2, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v2}, Lcom/xiaomi/push/service/m$a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    const-wide/16 v3, -0x1

    .line 59
    .line 60
    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 61
    .line 62
    .line 63
    move-result-wide v5

    .line 64
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 65
    .line 66
    .line 67
    move-result-wide v7

    .line 68
    if-eq p1, v1, :cond_4

    .line 69
    .line 70
    cmp-long p1, v5, v3

    .line 71
    .line 72
    if-nez p1, :cond_3

    .line 73
    .line 74
    iget-object p1, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 75
    .line 76
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v0}, Lcom/xiaomi/push/service/m$a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->d()J

    .line 87
    .line 88
    .line 89
    move-result-wide v2

    .line 90
    add-long/2addr v7, v2

    .line 91
    invoke-interface {p1, v0, v7, v8}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_3
    cmp-long p1, v7, v5

    .line 100
    .line 101
    if-lez p1, :cond_4

    .line 102
    .line 103
    iget-object p1, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 104
    .line 105
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v0}, Lcom/xiaomi/push/service/m$a;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {v0}, Lcom/xiaomi/push/service/m$a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 130
    .line 131
    .line 132
    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/xiaomi/push/service/m;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 133
    .line 134
    const/4 v0, 0x0

    .line 135
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndSet(I)I

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-nez p1, :cond_6

    .line 145
    .line 146
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->a()I

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    if-eq p1, v1, :cond_5

    .line 151
    .line 152
    goto :goto_2

    .line 153
    :cond_5
    const/4 p1, 0x1

    .line 154
    iput-boolean p1, p0, Lcom/xiaomi/push/service/m;->a:Z

    .line 155
    .line 156
    goto :goto_3

    .line 157
    :cond_6
    :goto_2
    iput-boolean v0, p0, Lcom/xiaomi/push/service/m;->a:Z

    .line 158
    .line 159
    :goto_3
    iget-object p1, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    .line 160
    .line 161
    iget-boolean p0, p0, Lcom/xiaomi/push/service/m;->a:Z

    .line 162
    .line 163
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    const-string p1, "[HB] network changed, netid:%s, %s"

    .line 172
    .line 173
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    return-void
.end method

.method private b()Z
    .locals 4

    .line 193
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 194
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    const-string v2, "M-"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 195
    iget-object p0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/Context;

    invoke-static {p0}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    move-result-object p0

    sget-object v0, Lcom/xiaomi/push/gk;->bj:Lcom/xiaomi/push/gk;

    .line 196
    invoke-virtual {v0}, Lcom/xiaomi/push/gk;->a()I

    move-result v0

    .line 197
    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/push/service/ah;->a(IZ)Z

    move-result p0

    if-nez p0, :cond_1

    return v2

    .line 198
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    const-string v3, "W-NETWORK_ID_WIFI_DEFAULT"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 199
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->g()Z

    move-result p0

    if-nez p0, :cond_1

    return v2

    :cond_1
    return v1
.end method

.method private c()J
    .locals 3

    .line 57
    iget-object p0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    invoke-static {}, Lcom/xiaomi/push/service/m$a;->j()Ljava/lang/String;

    move-result-object v0

    const-wide/16 v1, -0x1

    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method private c(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/m;->a(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 9
    .line 10
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {p1}, Lcom/xiaomi/push/service/m$a;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const v1, 0x395f8

    .line 19
    .line 20
    .line 21
    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 29
    .line 30
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/xiaomi/push/service/m$a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 41
    .line 42
    .line 43
    move-result-wide v1

    .line 44
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->d()J

    .line 45
    .line 46
    .line 47
    move-result-wide v3

    .line 48
    add-long/2addr v1, v3

    .line 49
    invoke-interface {p1, v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private c()Z
    .locals 3

    .line 60
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/push/gk;->bh:Lcom/xiaomi/push/gk;

    .line 61
    invoke-virtual {v1}, Lcom/xiaomi/push/gk;->a()I

    move-result v1

    const/4 v2, 0x1

    .line 62
    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/ah;->a(IZ)Z

    move-result v0

    .line 63
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->d()Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/xiaomi/push/n;->a:Lcom/xiaomi/push/n;

    .line 64
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/Context;

    invoke-static {p0}, Lcom/xiaomi/push/service/b;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/b;

    move-result-object p0

    invoke-virtual {p0}, Lcom/xiaomi/push/service/b;->a()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    return v2

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private d()J
    .locals 3

    .line 148
    iget-object p0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/Context;

    invoke-static {p0}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    move-result-object p0

    sget-object v0, Lcom/xiaomi/push/gk;->br:Lcom/xiaomi/push/gk;

    .line 149
    invoke-virtual {v0}, Lcom/xiaomi/push/gk;->a()I

    move-result v0

    const-wide v1, 0x1cf7c5800L

    .line 150
    invoke-virtual {p0, v0, v1, v2}, Lcom/xiaomi/push/service/ah;->a(IJ)J

    move-result-wide v0

    return-wide v0
.end method

.method private d(Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    goto/16 :goto_2

    .line 16
    .line 17
    :cond_1
    const-string v0, "W-"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    const-string v0, "W"

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    const-string v0, "M-"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_4

    .line 35
    .line 36
    const-string v0, "M"

    .line 37
    .line 38
    :goto_0
    const v1, 0x395f8

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 46
    .line 47
    .line 48
    move-result-wide v2

    .line 49
    const-wide/16 v4, 0x3e8

    .line 50
    .line 51
    div-long/2addr v2, v4

    .line 52
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    new-instance v3, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p1, ":::"

    .line 65
    .line 66
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 85
    .line 86
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->f()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    const/4 v1, 0x0

    .line 91
    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_3

    .line 100
    .line 101
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    goto :goto_1

    .line 106
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string p1, "###"

    .line 115
    .line 116
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    :goto_1
    iget-object p0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 131
    .line 132
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->f()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 145
    .line 146
    .line 147
    :cond_4
    :goto_2
    return-void
.end method

.method private d()Z
    .locals 4

    .line 155
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->c()J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ltz v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    .line 156
    :goto_0
    iget-boolean v3, p0, Lcom/xiaomi/push/service/m;->c:Z

    if-eqz v3, :cond_2

    iget-boolean v3, p0, Lcom/xiaomi/push/service/m;->b:Z

    if-nez v3, :cond_1

    iget-boolean p0, p0, Lcom/xiaomi/push/service/m;->d:Z

    if-nez p0, :cond_1

    if-eqz v0, :cond_2

    :cond_1
    return v2

    :cond_2
    return v1
.end method

.method private e()V
    .locals 3

    .line 39
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    invoke-static {}, Lcom/xiaomi/push/service/m$a;->a()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 40
    iget-object p0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {}, Lcom/xiaomi/push/service/m$a;->a()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_0
    return-void
.end method

.method private e()Z
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-wide/16 v1, -0x1

    .line 8
    .line 9
    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 10
    .line 11
    .line 12
    move-result-wide v3

    .line 13
    cmp-long p0, v3, v1

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    cmp-long p0, v3, v1

    .line 24
    .line 25
    const/4 v5, 0x1

    .line 26
    if-lez p0, :cond_1

    .line 27
    .line 28
    return v5

    .line 29
    :cond_1
    sub-long/2addr v1, v3

    .line 30
    const-wide/32 v3, 0xf731400

    .line 31
    .line 32
    .line 33
    cmp-long p0, v1, v3

    .line 34
    .line 35
    if-ltz p0, :cond_2

    .line 36
    .line 37
    return v5

    .line 38
    :cond_2
    return v0
.end method

.method private f()V
    .locals 6

    .line 1
    iget v0, p0, Lcom/xiaomi/push/service/m;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->h()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    goto :goto_0

    .line 15
    :cond_1
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->g()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_3

    .line 24
    .line 25
    iget-object v2, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 26
    .line 27
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->i()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-wide/16 v4, -0x1

    .line 32
    .line 33
    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    cmp-long v2, v2, v4

    .line 38
    .line 39
    if-nez v2, :cond_2

    .line 40
    .line 41
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 42
    .line 43
    .line 44
    move-result-wide v2

    .line 45
    iput-wide v2, p0, Lcom/xiaomi/push/service/m;->a:J

    .line 46
    .line 47
    iget-object v2, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 48
    .line 49
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->i()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    iget-wide v4, p0, Lcom/xiaomi/push/service/m;->a:J

    .line 58
    .line 59
    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 64
    .line 65
    .line 66
    :cond_2
    iget-object v2, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 67
    .line 68
    const/4 v3, 0x0

    .line 69
    invoke-interface {v2, v0, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    iget-object p0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 74
    .line 75
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    add-int/2addr v2, v1

    .line 80
    invoke-interface {p0, v0, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 85
    .line 86
    .line 87
    :cond_3
    return-void
.end method

.method private f()Z
    .locals 6

    .line 88
    iget-wide v0, p0, Lcom/xiaomi/push/service/m;->a:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 89
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 90
    iget-wide v4, p0, Lcom/xiaomi/push/service/m;->a:J

    cmp-long p0, v4, v2

    const/4 v0, 0x1

    if-lez p0, :cond_1

    return v0

    :cond_1
    sub-long/2addr v2, v4

    const-wide/32 v4, 0xf731400

    cmp-long p0, v2, v4

    if-ltz p0, :cond_2

    return v0

    :cond_2
    return v1
.end method

.method private g()V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/xiaomi/push/service/m;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_9

    .line 8
    .line 9
    iget-object v1, v0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 10
    .line 11
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->f()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const-string v4, "category_hb_change"

    .line 25
    .line 26
    const-string v5, "timestamp"

    .line 27
    .line 28
    const-string v6, "interval"

    .line 29
    .line 30
    const-string v7, "model"

    .line 31
    .line 32
    const-string v8, "net_type"

    .line 33
    .line 34
    const-string v9, "event"

    .line 35
    .line 36
    const/4 v10, 0x0

    .line 37
    if-nez v2, :cond_2

    .line 38
    .line 39
    const-string v2, "###"

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    move v2, v10

    .line 48
    :goto_0
    array-length v11, v1

    .line 49
    if-ge v2, v11, :cond_1

    .line 50
    .line 51
    aget-object v11, v1, v2

    .line 52
    .line 53
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v11

    .line 57
    if-nez v11, :cond_0

    .line 58
    .line 59
    aget-object v11, v1, v2

    .line 60
    .line 61
    const-string v12, ":::"

    .line 62
    .line 63
    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v11

    .line 67
    if-eqz v11, :cond_0

    .line 68
    .line 69
    array-length v12, v11

    .line 70
    const/4 v13, 0x4

    .line 71
    if-lt v12, v13, :cond_0

    .line 72
    .line 73
    aget-object v12, v11, v10

    .line 74
    .line 75
    const/4 v13, 0x1

    .line 76
    aget-object v13, v11, v13

    .line 77
    .line 78
    const/4 v14, 0x2

    .line 79
    aget-object v14, v11, v14

    .line 80
    .line 81
    const/4 v15, 0x3

    .line 82
    aget-object v11, v11, v15

    .line 83
    .line 84
    new-instance v15, Ljava/util/HashMap;

    .line 85
    .line 86
    invoke-direct {v15}, Ljava/util/HashMap;-><init>()V

    .line 87
    .line 88
    .line 89
    const-string v10, "change"

    .line 90
    .line 91
    invoke-interface {v15, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    invoke-static {}, Ll/q4r0;->a()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v10

    .line 98
    invoke-interface {v15, v7, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    invoke-interface {v15, v8, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    const-string v10, "net_name"

    .line 105
    .line 106
    invoke-interface {v15, v10, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    invoke-interface {v15, v6, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    invoke-interface {v15, v5, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    invoke-direct {v0, v4, v3, v15}, Lcom/xiaomi/push/service/m;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 116
    .line 117
    .line 118
    const-string v10, "[HB] report hb changed events."

    .line 119
    .line 120
    invoke-static {v10}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 124
    .line 125
    const/4 v10, 0x0

    .line 126
    goto :goto_0

    .line 127
    :cond_1
    iget-object v1, v0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 128
    .line 129
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->f()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 142
    .line 143
    .line 144
    :cond_2
    iget-object v1, v0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 145
    .line 146
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->a()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    const/4 v10, 0x0

    .line 151
    invoke-interface {v1, v2, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-eqz v1, :cond_3

    .line 156
    .line 157
    iget-object v1, v0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 158
    .line 159
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->b()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    const-wide/16 v10, 0x0

    .line 164
    .line 165
    invoke-interface {v1, v2, v10, v11}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 166
    .line 167
    .line 168
    move-result-wide v1

    .line 169
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 170
    .line 171
    .line 172
    move-result-wide v10

    .line 173
    sub-long v1, v10, v1

    .line 174
    .line 175
    const-wide/32 v12, 0x4d3f6400

    .line 176
    .line 177
    .line 178
    cmp-long v1, v1, v12

    .line 179
    .line 180
    if-lez v1, :cond_3

    .line 181
    .line 182
    new-instance v1, Ljava/util/HashMap;

    .line 183
    .line 184
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 185
    .line 186
    .line 187
    const-string v2, "support"

    .line 188
    .line 189
    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    invoke-static {}, Ll/q4r0;->a()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    invoke-interface {v1, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 200
    .line 201
    .line 202
    move-result-wide v12

    .line 203
    const-wide/16 v14, 0x3e8

    .line 204
    .line 205
    div-long/2addr v12, v14

    .line 206
    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    invoke-interface {v1, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    invoke-direct {v0, v4, v3, v1}, Lcom/xiaomi/push/service/m;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 214
    .line 215
    .line 216
    const-string v1, "[HB] report support wifi digest events."

    .line 217
    .line 218
    invoke-static {v1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    iget-object v1, v0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 222
    .line 223
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->b()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    invoke-interface {v1, v2, v10, v11}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 236
    .line 237
    .line 238
    :cond_3
    invoke-direct {v0}, Lcom/xiaomi/push/service/m;->e()Z

    .line 239
    .line 240
    .line 241
    move-result v1

    .line 242
    const-string v2, "end_time"

    .line 243
    .line 244
    const-string v3, "start_time"

    .line 245
    .line 246
    if-eqz v1, :cond_6

    .line 247
    .line 248
    iget-object v1, v0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 249
    .line 250
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->d()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v4

    .line 254
    const/4 v10, 0x0

    .line 255
    invoke-interface {v1, v4, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    iget-object v4, v0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 260
    .line 261
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->e()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v5

    .line 265
    invoke-interface {v4, v5, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 266
    .line 267
    .line 268
    move-result v4

    .line 269
    if-gtz v1, :cond_4

    .line 270
    .line 271
    if-lez v4, :cond_5

    .line 272
    .line 273
    :cond_4
    iget-object v5, v0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 274
    .line 275
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->c()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v7

    .line 279
    const-wide/16 v10, -0x1

    .line 280
    .line 281
    invoke-interface {v5, v7, v10, v11}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 282
    .line 283
    .line 284
    move-result-wide v10

    .line 285
    const v5, 0x395f8

    .line 286
    .line 287
    .line 288
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v5

    .line 292
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v7

    .line 296
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 297
    .line 298
    .line 299
    move-result-wide v10

    .line 300
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v10

    .line 304
    :try_start_0
    new-instance v11, Lorg/json/JSONObject;

    .line 305
    .line 306
    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 307
    .line 308
    .line 309
    invoke-virtual {v11, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 310
    .line 311
    .line 312
    const-string v5, "c_short"

    .line 313
    .line 314
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v6

    .line 318
    invoke-virtual {v11, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 319
    .line 320
    .line 321
    const-string v5, "c_long"

    .line 322
    .line 323
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v6

    .line 327
    invoke-virtual {v11, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 328
    .line 329
    .line 330
    const-string v5, "count"

    .line 331
    .line 332
    add-int/2addr v1, v4

    .line 333
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object v1

    .line 337
    invoke-virtual {v11, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 338
    .line 339
    .line 340
    invoke-virtual {v11, v3, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 341
    .line 342
    .line 343
    invoke-virtual {v11, v2, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 344
    .line 345
    .line 346
    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    new-instance v4, Ljava/util/HashMap;

    .line 351
    .line 352
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 353
    .line 354
    .line 355
    const-string v5, "long_and_short_hb_count"

    .line 356
    .line 357
    invoke-interface {v4, v9, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    .line 359
    .line 360
    const-string v5, "category_hb_count"

    .line 361
    .line 362
    invoke-direct {v0, v5, v1, v4}, Lcom/xiaomi/push/service/m;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 363
    .line 364
    .line 365
    const-string v1, "[HB] report short/long hb count events."

    .line 366
    .line 367
    invoke-static {v1}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 368
    .line 369
    .line 370
    :catchall_0
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 371
    .line 372
    .line 373
    move-result-wide v4

    .line 374
    iget-object v1, v0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 375
    .line 376
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 377
    .line 378
    .line 379
    move-result-object v1

    .line 380
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->d()Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object v6

    .line 384
    const/4 v10, 0x0

    .line 385
    invoke-interface {v1, v6, v10}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->e()Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object v6

    .line 393
    invoke-interface {v1, v6, v10}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 394
    .line 395
    .line 396
    move-result-object v1

    .line 397
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->c()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v6

    .line 401
    invoke-interface {v1, v6, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 402
    .line 403
    .line 404
    move-result-object v1

    .line 405
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 406
    .line 407
    .line 408
    :cond_6
    invoke-direct {v0}, Lcom/xiaomi/push/service/m;->f()Z

    .line 409
    .line 410
    .line 411
    move-result v1

    .line 412
    if-eqz v1, :cond_9

    .line 413
    .line 414
    iget-wide v4, v0, Lcom/xiaomi/push/service/m;->a:J

    .line 415
    .line 416
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object v1

    .line 420
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 421
    .line 422
    .line 423
    move-result-wide v4

    .line 424
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v4

    .line 428
    iget-object v5, v0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 429
    .line 430
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->g()Ljava/lang/String;

    .line 431
    .line 432
    .line 433
    move-result-object v6

    .line 434
    const/4 v10, 0x0

    .line 435
    invoke-interface {v5, v6, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 436
    .line 437
    .line 438
    move-result v5

    .line 439
    const-string v6, "category_lc_ptc"

    .line 440
    .line 441
    const-string v7, "ptc_event"

    .line 442
    .line 443
    const-string v10, "ptc"

    .line 444
    .line 445
    if-lez v5, :cond_7

    .line 446
    .line 447
    :try_start_1
    new-instance v11, Lorg/json/JSONObject;

    .line 448
    .line 449
    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 450
    .line 451
    .line 452
    const-string v12, "M"

    .line 453
    .line 454
    invoke-virtual {v11, v8, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 455
    .line 456
    .line 457
    invoke-virtual {v11, v10, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 458
    .line 459
    .line 460
    invoke-virtual {v11, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 461
    .line 462
    .line 463
    invoke-virtual {v11, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 464
    .line 465
    .line 466
    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object v5

    .line 470
    new-instance v11, Ljava/util/HashMap;

    .line 471
    .line 472
    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 473
    .line 474
    .line 475
    invoke-interface {v11, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    .line 477
    .line 478
    invoke-direct {v0, v6, v5, v11}, Lcom/xiaomi/push/service/m;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 479
    .line 480
    .line 481
    const-string v5, "[HB] report ping timeout count events of mobile network."

    .line 482
    .line 483
    invoke-static {v5}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 484
    .line 485
    .line 486
    iget-object v5, v0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 487
    .line 488
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 489
    .line 490
    .line 491
    move-result-object v5

    .line 492
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->g()Ljava/lang/String;

    .line 493
    .line 494
    .line 495
    move-result-object v11

    .line 496
    const/4 v12, 0x0

    .line 497
    invoke-interface {v5, v11, v12}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 498
    .line 499
    .line 500
    move-result-object v5

    .line 501
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 502
    .line 503
    .line 504
    :cond_7
    const/4 v12, 0x0

    .line 505
    goto :goto_1

    .line 506
    :catchall_1
    iget-object v5, v0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 507
    .line 508
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 509
    .line 510
    .line 511
    move-result-object v5

    .line 512
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->g()Ljava/lang/String;

    .line 513
    .line 514
    .line 515
    move-result-object v11

    .line 516
    const/4 v12, 0x0

    .line 517
    invoke-interface {v5, v11, v12}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 518
    .line 519
    .line 520
    move-result-object v5

    .line 521
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 522
    .line 523
    .line 524
    :goto_1
    iget-object v5, v0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 525
    .line 526
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->h()Ljava/lang/String;

    .line 527
    .line 528
    .line 529
    move-result-object v11

    .line 530
    invoke-interface {v5, v11, v12}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 531
    .line 532
    .line 533
    move-result v5

    .line 534
    if-lez v5, :cond_8

    .line 535
    .line 536
    :try_start_2
    new-instance v11, Lorg/json/JSONObject;

    .line 537
    .line 538
    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 539
    .line 540
    .line 541
    const-string v12, "W"

    .line 542
    .line 543
    invoke-virtual {v11, v8, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 544
    .line 545
    .line 546
    invoke-virtual {v11, v10, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 547
    .line 548
    .line 549
    invoke-virtual {v11, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 550
    .line 551
    .line 552
    invoke-virtual {v11, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 553
    .line 554
    .line 555
    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 556
    .line 557
    .line 558
    move-result-object v1

    .line 559
    new-instance v2, Ljava/util/HashMap;

    .line 560
    .line 561
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 562
    .line 563
    .line 564
    invoke-interface {v2, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 565
    .line 566
    .line 567
    invoke-direct {v0, v6, v1, v2}, Lcom/xiaomi/push/service/m;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 568
    .line 569
    .line 570
    const-string v1, "[HB] report ping timeout count events of wifi network."

    .line 571
    .line 572
    invoke-static {v1}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 573
    .line 574
    .line 575
    :catchall_2
    iget-object v1, v0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 576
    .line 577
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 578
    .line 579
    .line 580
    move-result-object v1

    .line 581
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->h()Ljava/lang/String;

    .line 582
    .line 583
    .line 584
    move-result-object v2

    .line 585
    const/4 v10, 0x0

    .line 586
    invoke-interface {v1, v2, v10}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 587
    .line 588
    .line 589
    move-result-object v1

    .line 590
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 591
    .line 592
    .line 593
    :cond_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 594
    .line 595
    .line 596
    move-result-wide v1

    .line 597
    iput-wide v1, v0, Lcom/xiaomi/push/service/m;->a:J

    .line 598
    .line 599
    iget-object v1, v0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    .line 600
    .line 601
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 602
    .line 603
    .line 604
    move-result-object v1

    .line 605
    invoke-static {}, Lcom/xiaomi/push/service/m$a;->i()Ljava/lang/String;

    .line 606
    .line 607
    .line 608
    move-result-object v2

    .line 609
    iget-wide v3, v0, Lcom/xiaomi/push/service/m;->a:J

    .line 610
    .line 611
    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 612
    .line 613
    .line 614
    move-result-object v0

    .line 615
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 616
    .line 617
    .line 618
    :cond_9
    return-void
.end method

.method private g()Z
    .locals 2

    .line 619
    iget-object p0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/Context;

    invoke-static {p0}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    move-result-object p0

    sget-object v0, Lcom/xiaomi/push/gk;->bv:Lcom/xiaomi/push/gk;

    .line 620
    invoke-virtual {v0}, Lcom/xiaomi/push/gk;->a()I

    move-result v0

    const/4 v1, 0x1

    .line 621
    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/push/service/ah;->a(IZ)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public a()J
    .locals 8

    .line 203
    invoke-static {}, Ll/a2r0;->f()I

    move-result v0

    int-to-long v0, v0

    .line 204
    iget-boolean v2, p0, Lcom/xiaomi/push/service/m;->c:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->b()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/Context;

    .line 205
    invoke-static {v2}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    move-result-object v2

    sget-object v4, Lcom/xiaomi/push/gk;->bg:Lcom/xiaomi/push/gk;

    .line 206
    invoke-virtual {v4}, Lcom/xiaomi/push/gk;->a()I

    move-result v4

    .line 207
    invoke-virtual {v2, v4, v3}, Lcom/xiaomi/push/service/ah;->a(IZ)Z

    move-result v2

    if-nez v2, :cond_0

    .line 208
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->c()J

    move-result-wide v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    cmp-long v2, v4, v6

    if-ltz v2, :cond_1

    .line 209
    :cond_0
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->a()I

    move-result v2

    const/4 v4, -0x1

    if-eq v2, v4, :cond_1

    int-to-long v0, v2

    .line 210
    :cond_1
    iget-object v2, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "WIFI-ID-UNKNOWN"

    iget-object v4, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    iget v2, p0, Lcom/xiaomi/push/service/m;->a:I

    if-ne v2, v3, :cond_3

    const-wide/32 v4, 0x493e0

    cmp-long v2, v0, v4

    if-gez v2, :cond_2

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    .line 211
    :goto_0
    invoke-direct {p0, v3}, Lcom/xiaomi/push/service/m;->a(Z)V

    .line 212
    :cond_3
    iput-wide v0, p0, Lcom/xiaomi/push/service/m;->b:J

    .line 213
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v2, "[HB] ping interval:"

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return-wide v0
.end method

.method public a()V
    .locals 0

    .line 231
    return-void
.end method

.method public a(I)V
    .locals 4

    .line 196
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    mul-int/lit16 p1, p1, 0x3e8

    int-to-long v2, p1

    add-long/2addr v0, v2

    .line 197
    iget-object p0, p0, Lcom/xiaomi/push/service/m;->a:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {}, Lcom/xiaomi/push/service/m$a;->j()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public declared-synchronized a(Ljava/lang/String;)V
    .locals 2

    const-string v0, "W-"

    monitor-enter p0

    .line 189
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 190
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->e()V

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 191
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->d()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 192
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 193
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 194
    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/m;->b(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 195
    :cond_1
    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized a(Ll/ntq0;)V
    .locals 4

    const-string v0, "M-"

    monitor-enter p0

    .line 173
    :try_start_0
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->d()Z

    move-result v1

    if-eqz v1, :cond_5

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-eqz p1, :cond_4

    .line 174
    invoke-virtual {p1}, Ll/ntq0;->a()I

    move-result v3

    if-nez v3, :cond_1

    .line 175
    invoke-virtual {p1}, Ll/ntq0;->h()Ljava/lang/String;

    move-result-object p1

    .line 176
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "UNKNOWN"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 177
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_3

    .line 178
    :cond_0
    :goto_0
    invoke-direct {p0, v2}, Lcom/xiaomi/push/service/m;->b(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 179
    iput p1, p0, Lcom/xiaomi/push/service/m;->a:I

    goto :goto_2

    .line 180
    :cond_1
    invoke-virtual {p1}, Ll/ntq0;->a()I

    move-result v0

    const/4 v3, 0x1

    if-eq v0, v3, :cond_3

    .line 181
    invoke-virtual {p1}, Ll/ntq0;->a()I

    move-result p1

    const/4 v0, 0x6

    if-ne p1, v0, :cond_2

    goto :goto_1

    .line 182
    :cond_2
    invoke-direct {p0, v2}, Lcom/xiaomi/push/service/m;->b(Ljava/lang/String;)V

    .line 183
    iput v1, p0, Lcom/xiaomi/push/service/m;->a:I

    goto :goto_2

    .line 184
    :cond_3
    :goto_1
    const-string p1, "WIFI-ID-UNKNOWN"

    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/m;->b(Ljava/lang/String;)V

    .line 185
    iput v3, p0, Lcom/xiaomi/push/service/m;->a:I

    goto :goto_2

    .line 186
    :cond_4
    invoke-direct {p0, v2}, Lcom/xiaomi/push/service/m;->b(Ljava/lang/String;)V

    .line 187
    iput v1, p0, Lcom/xiaomi/push/service/m;->a:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 188
    :cond_5
    :goto_2
    monitor-exit p0

    return-void

    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public b()J
    .locals 2

    .line 192
    iget-wide v0, p0, Lcom/xiaomi/push/service/m;->b:J

    return-wide v0
.end method

.method public b()V
    .locals 2

    .line 181
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 182
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->f()V

    .line 183
    iget-boolean v0, p0, Lcom/xiaomi/push/service/m;->a:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    iget-object v1, p0, Lcom/xiaomi/push/service/m;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 185
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[HB] ping timeout count:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/xiaomi/push/service/m;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 186
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 187
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[HB] change hb interval for net:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 188
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/xiaomi/push/service/m;->c(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 189
    iput-boolean v0, p0, Lcom/xiaomi/push/service/m;->a:Z

    .line 190
    iget-object v1, p0, Lcom/xiaomi/push/service/m;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndSet(I)I

    .line 191
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/xiaomi/push/service/m;->d(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 58
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/lang/String;

    iput-object v0, p0, Lcom/xiaomi/push/service/m;->b:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public d()V
    .locals 1

    .line 151
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 152
    invoke-direct {p0}, Lcom/xiaomi/push/service/m;->g()V

    .line 153
    iget-boolean v0, p0, Lcom/xiaomi/push/service/m;->a:Z

    if-eqz v0, :cond_0

    .line 154
    iget-object p0, p0, Lcom/xiaomi/push/service/m;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndSet(I)I

    :cond_0
    return-void
.end method
