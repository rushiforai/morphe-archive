.class public Ll/bqy;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ll/eqy;",
            ">;>;"
        }
    .end annotation
.end field

.field public static b:Ll/ypy;

.field public static c:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/bqy;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-static {}, Ll/fu2;->e()Ll/ypy;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Ll/bqy;->b:Ll/ypy;

    .line 13
    .line 14
    const-wide/16 v0, -0x1

    .line 15
    .line 16
    sput-wide v0, Ll/bqy;->c:J

    .line 17
    .line 18
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

.method public static bridge synthetic a()Ljava/util/HashMap;
    .locals 1

    .line 1
    sget-object v0, Ll/bqy;->a:Ljava/util/HashMap;

    return-object v0
.end method

.method public static bridge synthetic b(Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bqy;->e(Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public static c(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ll/bqy;->b:Ll/ypy;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0, p0}, Ll/qzl;->b(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static d()J
    .locals 4

    .line 1
    sget-wide v0, Ll/bqy;->c:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 11
    .line 12
    invoke-static {v0}, Ll/smq0;->j(Landroid/content/Context;)J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    long-to-double v0, v0

    .line 17
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 18
    .line 19
    mul-double/2addr v0, v2

    .line 20
    const-wide/high16 v2, 0x4090000000000000L    # 1024.0

    .line 21
    .line 22
    div-double/2addr v0, v2

    .line 23
    div-double/2addr v0, v2

    .line 24
    div-double/2addr v0, v2

    .line 25
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    double-to-long v0, v0

    .line 30
    const-wide/32 v2, 0x100000

    .line 31
    .line 32
    .line 33
    mul-long/2addr v0, v2

    .line 34
    sput-wide v0, Ll/bqy;->c:J

    .line 35
    .line 36
    return-wide v0
.end method

.method public static e(Ljava/lang/String;Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/eqy;",
            ">;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/eqy;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/eqy;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x0

    .line 16
    move v3, v2

    .line 17
    move v4, v3

    .line 18
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    if-eqz v5, :cond_0

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    check-cast v5, Ll/eqy;

    .line 29
    .line 30
    iget v6, v5, Ll/eqy;->b:I

    .line 31
    .line 32
    add-int/2addr v3, v6

    .line 33
    iget v6, v5, Ll/eqy;->c:I

    .line 34
    .line 35
    add-int/2addr v2, v6

    .line 36
    iget v5, v5, Ll/eqy;->a:I

    .line 37
    .line 38
    add-int/2addr v4, v5

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    div-int/2addr v2, v1

    .line 45
    iput v2, p1, Ll/eqy;->c:I

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    div-int/2addr v3, v1

    .line 52
    iput v3, p1, Ll/eqy;->b:I

    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    div-int/2addr v4, v0

    .line 59
    iput v4, p1, Ll/eqy;->a:I

    .line 60
    .line 61
    new-instance v0, Ll/q4f;

    .line 62
    .line 63
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 64
    .line 65
    .line 66
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 67
    .line 68
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 69
    .line 70
    const-string v1, "e_memory_check"

    .line 71
    .line 72
    iput-object v1, v0, Ll/q4f;->s:Ljava/lang/String;

    .line 73
    .line 74
    iput-object p0, v0, Ll/q4f;->n:Ljava/lang/String;

    .line 75
    .line 76
    new-instance p0, Lorg/json/JSONObject;

    .line 77
    .line 78
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 79
    .line 80
    .line 81
    const-string v1, "mem_pss"

    .line 82
    .line 83
    iget v2, p1, Ll/eqy;->c:I

    .line 84
    .line 85
    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 86
    .line 87
    .line 88
    const-string v1, "mem_dalvik"

    .line 89
    .line 90
    iget v2, p1, Ll/eqy;->b:I

    .line 91
    .line 92
    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 93
    .line 94
    .line 95
    const-string v1, "mem_native"

    .line 96
    .line 97
    iget p1, p1, Ll/eqy;->a:I

    .line 98
    .line 99
    invoke-virtual {p0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 100
    .line 101
    .line 102
    const-string p1, "config_name"

    .line 103
    .line 104
    invoke-static {}, Ll/fu2;->f()Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ApmConfigSetting;->configName:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {p0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 111
    .line 112
    .line 113
    const-string p1, "device_ram"

    .line 114
    .line 115
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 116
    .line 117
    invoke-static {v1}, Ll/smq0;->j(Landroid/content/Context;)J

    .line 118
    .line 119
    .line 120
    move-result-wide v1

    .line 121
    invoke-virtual {p0, p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 122
    .line 123
    .line 124
    const-string p1, "device_ram_kb"

    .line 125
    .line 126
    invoke-static {}, Ll/bqy;->d()J

    .line 127
    .line 128
    .line 129
    move-result-wide v1

    .line 130
    invoke-virtual {p0, p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 131
    .line 132
    .line 133
    iput-object p0, v0, Ll/q4f;->w:Lorg/json/JSONObject;

    .line 134
    .line 135
    invoke-static {v0}, Ll/i4g0;->m(Ll/q4f;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :catch_0
    move-exception p0

    .line 140
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public static f(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ll/bqy;->b:Ll/ypy;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Ll/bqy;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    sget-object v0, Ll/bqy;->a:Ljava/util/HashMap;

    .line 15
    .line 16
    new-instance v1, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    :cond_1
    sget-object v0, Ll/bqy;->b:Ll/ypy;

    .line 25
    .line 26
    new-instance v1, Ll/bqy$a;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/bqy$a;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p0, v1}, Ll/qzl;->h(Ljava/lang/String;Ll/utl;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
