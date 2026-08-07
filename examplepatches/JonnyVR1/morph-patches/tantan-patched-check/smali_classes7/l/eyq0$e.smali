.class Ll/eyq0$e;
.super Ll/eyq0$d;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/eyq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation


# instance fields
.field d:Ljava/lang/String;

.field e:Ljava/lang/String;

.field f:Ljava/io/File;

.field g:I

.field h:Z

.field i:Z

.field final synthetic j:Ll/eyq0;


# direct methods
.method public constructor <init>(Ll/eyq0;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eyq0$e;->j:Ll/eyq0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/eyq0$d;-><init>(Ll/eyq0;)V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/eyq0$e;->d:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/eyq0$e;->e:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ll/eyq0$e;->f:Ljava/io/File;

    .line 11
    .line 12
    iput-boolean p5, p0, Ll/eyq0$e;->i:Z

    .line 13
    .line 14
    return-void
.end method

.method private f()Z
    .locals 11

    .line 1
    const-string v0, "times"

    .line 2
    .line 3
    const-string v1, "time"

    .line 4
    .line 5
    iget-object p0, p0, Ll/eyq0$e;->j:Ll/eyq0;

    .line 6
    .line 7
    invoke-static {p0}, Ll/eyq0;->a(Ll/eyq0;)Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v2, "log.timestamp"

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v2, ""

    .line 19
    .line 20
    const-string v4, "log.requst"

    .line 21
    .line 22
    invoke-interface {p0, v4, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v5

    .line 30
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    .line 31
    .line 32
    invoke-direct {v7, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v7, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 36
    .line 37
    .line 38
    move-result-wide v5

    .line 39
    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    goto :goto_0

    .line 44
    :catch_0
    move v2, v3

    .line 45
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 46
    .line 47
    .line 48
    move-result-wide v7

    .line 49
    sub-long/2addr v7, v5

    .line 50
    const-wide/32 v9, 0x5265c00

    .line 51
    .line 52
    .line 53
    cmp-long v7, v7, v9

    .line 54
    .line 55
    if-gez v7, :cond_1

    .line 56
    .line 57
    const/16 v7, 0xa

    .line 58
    .line 59
    if-le v2, v7, :cond_0

    .line 60
    .line 61
    return v3

    .line 62
    :cond_0
    move v3, v2

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 65
    .line 66
    .line 67
    move-result-wide v5

    .line 68
    :goto_1
    new-instance v2, Lorg/json/JSONObject;

    .line 69
    .line 70
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 71
    .line 72
    .line 73
    const/4 v7, 0x1

    .line 74
    :try_start_1
    invoke-virtual {v2, v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 75
    .line 76
    .line 77
    add-int/2addr v3, v7

    .line 78
    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 79
    .line 80
    .line 81
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-interface {p0, v4, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 94
    .line 95
    .line 96
    goto :goto_2

    .line 97
    :catch_1
    move-exception p0

    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    const-string v1, "JSONException on put "

    .line 101
    .line 102
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-static {p0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    :goto_2
    return v7
.end method


# virtual methods
.method public b()V
    .locals 4

    .line 1
    :try_start_0
    invoke-direct {p0}, Ll/eyq0$e;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "uid"

    .line 13
    .line 14
    invoke-static {}, Lcom/xiaomi/push/service/ax;->a()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    const-string v1, "token"

    .line 22
    .line 23
    iget-object v2, p0, Ll/eyq0$e;->e:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    const-string v1, "net"

    .line 29
    .line 30
    iget-object v2, p0, Ll/eyq0$e;->j:Ll/eyq0;

    .line 31
    .line 32
    invoke-static {v2}, Ll/eyq0;->a(Ll/eyq0;)Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {v2}, Ll/mtq0;->e(Landroid/content/Context;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/eyq0$e;->d:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v2, p0, Ll/eyq0$e;->f:Ljava/io/File;

    .line 46
    .line 47
    const-string v3, "file"

    .line 48
    .line 49
    invoke-static {v1, v0, v2, v3}, Ll/mtq0;->i(Ljava/lang/String;Ljava/util/Map;Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    :cond_0
    const/4 v0, 0x1

    .line 53
    iput-boolean v0, p0, Ll/eyq0$e;->h:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    :catch_0
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/eyq0$e;->h:Z

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Ll/eyq0$e;->g:I

    .line 8
    .line 9
    add-int/2addr v0, v2

    .line 10
    iput v0, p0, Ll/eyq0$e;->g:I

    .line 11
    .line 12
    if-ge v0, v1, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/eyq0$e;->j:Ll/eyq0;

    .line 15
    .line 16
    invoke-static {v0}, Ll/eyq0;->b(Ll/eyq0;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-boolean v0, p0, Ll/eyq0$e;->h:Z

    .line 24
    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    iget v0, p0, Ll/eyq0$e;->g:I

    .line 28
    .line 29
    if-lt v0, v1, :cond_2

    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Ll/eyq0$e;->f:Ljava/io/File;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 34
    .line 35
    .line 36
    :cond_2
    iget-object v0, p0, Ll/eyq0$e;->j:Ll/eyq0;

    .line 37
    .line 38
    iget p0, p0, Ll/eyq0$e;->g:I

    .line 39
    .line 40
    shl-int p0, v2, p0

    .line 41
    .line 42
    mul-int/lit16 p0, p0, 0x3e8

    .line 43
    .line 44
    int-to-long v1, p0

    .line 45
    invoke-static {v0, v1, v2}, Ll/eyq0;->h(Ll/eyq0;J)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eyq0$e;->j:Ll/eyq0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/eyq0;->a(Ll/eyq0;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/mtq0;->x(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-boolean v0, p0, Ll/eyq0$e;->i:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/eyq0$e;->j:Ll/eyq0;

    .line 18
    .line 19
    invoke-static {p0}, Ll/eyq0;->a(Ll/eyq0;)Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/mtq0;->t(Landroid/content/Context;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 33
    return p0
.end method
