.class public Ll/d610;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/d610$c;
    }
.end annotation


# instance fields
.field a:Ll/r31;

.field b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field c:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field d:Ll/d610$c;

.field e:Ll/puq0;

.field private volatile f:Z


# direct methods
.method private constructor <init>(Ll/d610$c;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/d610;->b:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/d610;->c:Ljava/util/HashMap;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/d610;->f:Z

    .line 20
    .line 21
    iput-object p1, p0, Ll/d610;->d:Ll/d610$c;

    .line 22
    .line 23
    iget-object p1, p1, Ll/d610$c;->h:Ll/r31;

    .line 24
    .line 25
    iput-object p1, p0, Ll/d610;->a:Ll/r31;

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic a(Ll/d610;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/d610;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/d610;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/d610;->f:Z

    .line 2
    .line 3
    return p1
.end method

.method private f(Landroid/content/Context;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/d610;->g(Landroid/content/Context;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private g(Landroid/content/Context;Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/d610$a;

    .line 6
    .line 7
    invoke-direct {v1, p0, p2, p1}, Ll/d610$a;-><init>(Ll/d610;ZLandroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 p0, 0x5

    .line 11
    .line 12
    invoke-virtual {v0, v1, p0, p1}, Ll/r5r0;->f(Ljava/lang/Runnable;J)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static declared-synchronized h(Landroid/content/Context;Ll/d610$c;)Ll/d610;
    .locals 9

    .line 1
    const-class v1, Ll/d610;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-object v0, p1, Ll/d610$c;->b:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "MonitorCrash"

    .line 13
    .line 14
    new-instance v2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v3, p1, Ll/d610$c;->a:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v3, " MonitorCrash init without token."

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception v0

    .line 38
    move-object p0, v0

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    :goto_0
    iget-object v0, p1, Ll/d610$c;->a:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v0}, Ll/cyq0;->b(Ljava/lang/String;)Ll/d610;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    const-string p0, "MonitorCrash"

    .line 49
    .line 50
    const-string p1, "Duplicate init MonitorCrash with same aid."

    .line 51
    .line 52
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    .line 54
    .line 55
    monitor-exit v1

    .line 56
    return-object v0

    .line 57
    :cond_1
    :try_start_1
    new-instance v0, Ll/d610;

    .line 58
    .line 59
    invoke-direct {v0, p1}, Ll/d610;-><init>(Ll/d610$c;)V

    .line 60
    .line 61
    .line 62
    iget-object v2, p1, Ll/d610$c;->l:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-nez v2, :cond_2

    .line 69
    .line 70
    iget-object v2, p1, Ll/d610$c;->l:Ljava/lang/String;

    .line 71
    .line 72
    invoke-direct {v0, v2}, Ll/d610;->k(Ljava/lang/String;)Ll/d610;

    .line 73
    .line 74
    .line 75
    :cond_2
    iget-object p1, p1, Ll/d610$c;->n:Ljava/util/Map;

    .line 76
    .line 77
    if-eqz p1, :cond_3

    .line 78
    .line 79
    iget-object v2, v0, Ll/d610;->c:Ljava/util/HashMap;

    .line 80
    .line 81
    invoke-virtual {v2, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 82
    .line 83
    .line 84
    iget-object p1, v0, Ll/d610;->b:Ljava/util/HashMap;

    .line 85
    .line 86
    iget-object v2, v0, Ll/d610;->c:Ljava/util/HashMap;

    .line 87
    .line 88
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 89
    .line 90
    .line 91
    :cond_3
    invoke-static {}, Ll/b350;->a()Ll/ow5;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p1}, Ll/ow5;->m()Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    invoke-static {}, Ll/b350;->a()Ll/ow5;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p1}, Ll/ow5;->m()Z

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    invoke-static {}, Ll/b350;->a()Ll/ow5;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p1}, Ll/ow5;->n()Z

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    invoke-static {}, Ll/b350;->a()Ll/ow5;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p1}, Ll/ow5;->j()Z

    .line 120
    .line 121
    .line 122
    move-result v6

    .line 123
    const-wide/16 v7, 0x0

    .line 124
    .line 125
    move-object v2, p0

    .line 126
    invoke-static/range {v2 .. v8}, Ll/s4r0;->c(Landroid/content/Context;ZZZZJ)V

    .line 127
    .line 128
    .line 129
    const/4 p0, 0x0

    .line 130
    invoke-direct {v0, v2, p0}, Ll/d610;->f(Landroid/content/Context;Z)V

    .line 131
    .line 132
    .line 133
    invoke-static {v0}, Ll/cyq0;->i(Ll/d610;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 134
    .line 135
    .line 136
    monitor-exit v1

    .line 137
    return-object v0

    .line 138
    :goto_1
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 139
    throw p0
.end method

.method public static i(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method private k(Ljava/lang/String;)Ll/d610;
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string v0, "://"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-gez v0, :cond_1

    .line 15
    .line 16
    const-string v0, "https://"

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/16 v0, 0x8

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    add-int/lit8 v0, v0, 0x3

    .line 26
    .line 27
    :goto_0
    const-string v1, "/"

    .line 28
    .line 29
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-ltz v0, :cond_2

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    :cond_2
    const-string v0, "set url "

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Ll/q5r0;->a(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "/monitor/collect/c/exception"

    .line 54
    .line 55
    invoke-virtual {p1, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ll/ow5;->u(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v1, "/monitor/collect/c/crash"

    .line 67
    .line 68
    invoke-virtual {p1, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Ll/ow5;->t(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const-string v1, "/monitor/collect/c/native_bin_crash"

    .line 80
    .line 81
    invoke-virtual {p1, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Ll/ow5;->v(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const-string v1, "/settings/get"

    .line 93
    .line 94
    invoke-virtual {p1, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v0, v1}, Ll/ow5;->r(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    const-string v1, "/monitor/collect/c/cloudcontrol/file"

    .line 106
    .line 107
    invoke-virtual {p1, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {v0, v1}, Ll/ow5;->q(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    const-string v1, "/monitor/collect/c/logcollect"

    .line 119
    .line 120
    invoke-virtual {p1, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v0, v1}, Ll/ow5;->s(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    const-string v1, "/monitor/collect/c/session"

    .line 132
    .line 133
    invoke-virtual {p1, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {v0, p1}, Ll/ow5;->w(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    return-object p0
.end method


# virtual methods
.method public c(Ljava/lang/String;Ljava/lang/String;)Ll/d610;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d610;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/d610;->b:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public d(Ljava/lang/String;Ljava/lang/String;)Ll/d610;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d610;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public e()Ll/d610$c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d610;->d:Ll/d610$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ll/o7m;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/d610$b;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/d610$b;-><init>(Ll/d610;Ll/o7m;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 p0, 0xa

    .line 11
    .line 12
    invoke-virtual {v0, v1, p0, p1}, Ll/r5r0;->f(Ljava/lang/Runnable;J)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method
