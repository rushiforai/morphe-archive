.class public Ll/nxq0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:I = 0x0

.field private static b:Z = true


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private static a(Landroid/content/Context;)I
    .locals 1

    .line 1
    sget v0, Ll/nxq0;->a:I

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ll/l4r0;->l(Landroid/content/Context;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sput p0, Ll/nxq0;->a:I

    .line 10
    .line 11
    :cond_0
    sget p0, Ll/nxq0;->a:I

    .line 12
    .line 13
    return p0
.end method

.method private static b(Z)I
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method private static c(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2

    .line 1
    const-string v0, "sp_power_stats"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method private static d(Landroid/content/Context;)Ll/lxq0;
    .locals 7

    .line 1
    invoke-static {p0}, Ll/nxq0;->c(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/lxq0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/lxq0;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "off_up_count"

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Ll/lxq0;->c(I)V

    .line 18
    .line 19
    .line 20
    const-string v1, "off_down_count"

    .line 21
    .line 22
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v1}, Ll/lxq0;->g(I)V

    .line 27
    .line 28
    .line 29
    const-string v1, "off_ping_count"

    .line 30
    .line 31
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, v1}, Ll/lxq0;->k(I)V

    .line 36
    .line 37
    .line 38
    const-string v1, "off_pong_count"

    .line 39
    .line 40
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v0, v1}, Ll/lxq0;->o(I)V

    .line 45
    .line 46
    .line 47
    const-string v1, "off_duration"

    .line 48
    .line 49
    const-wide/16 v3, 0x0

    .line 50
    .line 51
    invoke-interface {p0, v1, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 52
    .line 53
    .line 54
    move-result-wide v5

    .line 55
    invoke-virtual {v0, v5, v6}, Ll/lxq0;->d(J)V

    .line 56
    .line 57
    .line 58
    const-string v1, "on_up_count"

    .line 59
    .line 60
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-virtual {v0, v1}, Ll/lxq0;->r(I)V

    .line 65
    .line 66
    .line 67
    const-string v1, "on_down_count"

    .line 68
    .line 69
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-virtual {v0, v1}, Ll/lxq0;->t(I)V

    .line 74
    .line 75
    .line 76
    const-string v1, "on_ping_count"

    .line 77
    .line 78
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    invoke-virtual {v0, v1}, Ll/lxq0;->v(I)V

    .line 83
    .line 84
    .line 85
    const-string v1, "on_pong_count"

    .line 86
    .line 87
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    invoke-virtual {v0, v1}, Ll/lxq0;->x(I)V

    .line 92
    .line 93
    .line 94
    const-string v1, "on_duration"

    .line 95
    .line 96
    invoke-interface {p0, v1, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 97
    .line 98
    .line 99
    move-result-wide v5

    .line 100
    invoke-virtual {v0, v5, v6}, Ll/lxq0;->h(J)V

    .line 101
    .line 102
    .line 103
    const-string v1, "start_time"

    .line 104
    .line 105
    invoke-interface {p0, v1, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 106
    .line 107
    .line 108
    move-result-wide v5

    .line 109
    invoke-virtual {v0, v5, v6}, Ll/lxq0;->l(J)V

    .line 110
    .line 111
    .line 112
    const-string v1, "end_time"

    .line 113
    .line 114
    invoke-interface {p0, v1, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 115
    .line 116
    .line 117
    move-result-wide v3

    .line 118
    invoke-virtual {v0, v3, v4}, Ll/lxq0;->p(J)V

    .line 119
    .line 120
    .line 121
    const-string v1, "xmsf_vc"

    .line 122
    .line 123
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    invoke-virtual {v0, v1}, Ll/lxq0;->z(I)V

    .line 128
    .line 129
    .line 130
    const-string v1, "android_vc"

    .line 131
    .line 132
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    invoke-virtual {v0, p0}, Ll/lxq0;->B(I)V

    .line 137
    .line 138
    .line 139
    return-object v0
.end method

.method private static e(Landroid/content/Context;JI)V
    .locals 2

    .line 1
    const-string v0, "upload"

    .line 2
    .line 3
    invoke-static {v0}, Ll/kxq0;->c(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/nxq0;->d(Landroid/content/Context;)Ll/lxq0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/mxq0;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/mxq0;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, p0, v0}, Ll/mxq0;->a(Landroid/content/Context;Ll/lxq0;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, p1, p2, p3}, Ll/nxq0;->j(Landroid/content/Context;JI)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private static f(Landroid/content/Context;JJII)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p0}, Ll/nxq0;->i(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const v0, 0x3fffffff    # 1.9999999f

    .line 14
    .line 15
    .line 16
    if-ge p5, v0, :cond_0

    .line 17
    .line 18
    sub-long p1, p3, p1

    .line 19
    .line 20
    const-wide/32 v0, 0x5265c00

    .line 21
    .line 22
    .line 23
    cmp-long p1, p1, v0

    .line 24
    .line 25
    if-ltz p1, :cond_1

    .line 26
    .line 27
    :cond_0
    invoke-static {p0}, Ll/nxq0;->c(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string p2, "end_time"

    .line 36
    .line 37
    invoke-interface {p1, p2, p3, p4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 42
    .line 43
    .line 44
    invoke-static {p0, p3, p4, p6}, Ll/nxq0;->e(Landroid/content/Context;JI)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public static g(Landroid/content/Context;JZ)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/tsq0;->f(Landroid/content/Context;)Ll/tsq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/nxq0$a;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2, p3}, Ll/nxq0$a;-><init>(Landroid/content/Context;JZ)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/tsq0;->g(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private static h(Landroid/content/Context;Landroid/content/SharedPreferences;JI)V
    .locals 1

    .line 1
    const-string v0, "recordInit"

    .line 2
    .line 3
    invoke-static {v0}, Ll/kxq0;->c(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-string v0, "start_time"

    .line 11
    .line 12
    invoke-interface {p1, v0, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v0, "current_screen_state"

    .line 17
    .line 18
    invoke-interface {p1, v0, p4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string p4, "current_screen_state_start_time"

    .line 23
    .line 24
    invoke-interface {p1, p4, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string p2, "xmsf_vc"

    .line 29
    .line 30
    invoke-static {p0}, Ll/nxq0;->a(Landroid/content/Context;)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-interface {p1, p2, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "android_vc"

    .line 39
    .line 40
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 41
    .line 42
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private static i(Landroid/content/Context;)Z
    .locals 4

    .line 1
    sget-boolean v0, Ll/nxq0;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    sput-boolean v1, Ll/nxq0;->b:Z

    .line 7
    .line 8
    invoke-static {p0}, Ll/nxq0;->c(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v2, "xmsf_vc"

    .line 13
    .line 14
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const-string v3, "android_vc"

    .line 19
    .line 20
    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v2, :cond_2

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {p0}, Ll/nxq0;->a(Landroid/content/Context;)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-ne v2, p0, :cond_1

    .line 34
    .line 35
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 36
    .line 37
    if-eq v0, p0, :cond_2

    .line 38
    .line 39
    :cond_1
    const/4 v1, 0x1

    .line 40
    :cond_2
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v0, "isVcChanged = "

    .line 43
    .line 44
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p0}, Ll/kxq0;->c(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return v1
.end method

.method private static j(Landroid/content/Context;JI)V
    .locals 2

    .line 1
    const-string v0, "reset"

    .line 2
    .line 3
    invoke-static {v0}, Ll/kxq0;->c(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/nxq0;->c(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "start_time"

    .line 19
    .line 20
    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "current_screen_state"

    .line 25
    .line 26
    invoke-interface {v0, v1, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    const-string v0, "current_screen_state_start_time"

    .line 31
    .line 32
    invoke-interface {p3, v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string p2, "xmsf_vc"

    .line 37
    .line 38
    invoke-static {p0}, Ll/nxq0;->a(Landroid/content/Context;)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-interface {p1, p2, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string p1, "android_vc"

    .line 47
    .line 48
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 49
    .line 50
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static k(Landroid/content/Context;JZ)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/tsq0;->f(Landroid/content/Context;)Ll/tsq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/nxq0$b;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2, p3}, Ll/nxq0$b;-><init>(Landroid/content/Context;JZ)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/tsq0;->g(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static l(Landroid/content/Context;JZ)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/tsq0;->f(Landroid/content/Context;)Ll/tsq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/nxq0$c;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2, p3}, Ll/nxq0$c;-><init>(Landroid/content/Context;JZ)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/tsq0;->g(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static m(Landroid/content/Context;JZ)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/tsq0;->f(Landroid/content/Context;)Ll/tsq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/nxq0$d;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2, p3}, Ll/nxq0$d;-><init>(Landroid/content/Context;JZ)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/tsq0;->g(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic n(Landroid/content/Context;JZ)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/nxq0;->r(Landroid/content/Context;JZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Landroid/content/Context;JZ)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/nxq0;->s(Landroid/content/Context;JZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Landroid/content/Context;JZ)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/nxq0;->t(Landroid/content/Context;JZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Landroid/content/Context;JZ)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/nxq0;->u(Landroid/content/Context;JZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static declared-synchronized r(Landroid/content/Context;JZ)V
    .locals 9

    .line 1
    const-class v1, Ll/nxq0;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    const-string v0, "recordSendMsg start"

    .line 5
    .line 6
    invoke-static {v0}, Ll/kxq0;->c(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p3}, Ll/nxq0;->b(Z)I

    .line 10
    .line 11
    .line 12
    move-result v8

    .line 13
    invoke-static {p0}, Ll/nxq0;->c(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    const-string v0, "start_time"

    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    invoke-interface {p3, v0, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    cmp-long v0, v4, v2

    .line 26
    .line 27
    if-gtz v0, :cond_0

    .line 28
    .line 29
    invoke-static {p0, p3, p1, p2, v8}, Ll/nxq0;->h(Landroid/content/Context;Landroid/content/SharedPreferences;JI)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    move-object p0, v0

    .line 35
    goto :goto_3

    .line 36
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 37
    const/4 v2, 0x1

    .line 38
    if-ne v8, v2, :cond_1

    .line 39
    .line 40
    const-string v3, "on_up_count"

    .line 41
    .line 42
    invoke-interface {p3, v3, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    add-int/2addr v0, v2

    .line 47
    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    const-string v2, "on_up_count"

    .line 52
    .line 53
    invoke-interface {p3, v2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 58
    .line 59
    .line 60
    :goto_1
    move-object v2, p0

    .line 61
    move v7, v0

    .line 62
    move-wide v3, v4

    .line 63
    move-wide v5, p1

    .line 64
    goto :goto_2

    .line 65
    :cond_1
    const-string v3, "off_up_count"

    .line 66
    .line 67
    invoke-interface {p3, v3, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr v0, v2

    .line 72
    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    const-string v2, "off_up_count"

    .line 77
    .line 78
    invoke-interface {p3, v2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :goto_2
    invoke-static/range {v2 .. v8}, Ll/nxq0;->f(Landroid/content/Context;JJII)V

    .line 87
    .line 88
    .line 89
    const-string p0, "recordSendMsg complete"

    .line 90
    .line 91
    invoke-static {p0}, Ll/kxq0;->c(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    .line 93
    .line 94
    monitor-exit v1

    .line 95
    return-void

    .line 96
    :goto_3
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    throw p0
.end method

.method private static declared-synchronized s(Landroid/content/Context;JZ)V
    .locals 9

    .line 1
    const-class v1, Ll/nxq0;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    const-string v0, "recordReceiveMsg start"

    .line 5
    .line 6
    invoke-static {v0}, Ll/kxq0;->c(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p3}, Ll/nxq0;->b(Z)I

    .line 10
    .line 11
    .line 12
    move-result v8

    .line 13
    invoke-static {p0}, Ll/nxq0;->c(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    const-string v0, "start_time"

    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    invoke-interface {p3, v0, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    cmp-long v0, v4, v2

    .line 26
    .line 27
    if-gtz v0, :cond_0

    .line 28
    .line 29
    invoke-static {p0, p3, p1, p2, v8}, Ll/nxq0;->h(Landroid/content/Context;Landroid/content/SharedPreferences;JI)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    move-object p0, v0

    .line 35
    goto :goto_3

    .line 36
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 37
    const/4 v2, 0x1

    .line 38
    if-ne v8, v2, :cond_1

    .line 39
    .line 40
    const-string v3, "on_down_count"

    .line 41
    .line 42
    invoke-interface {p3, v3, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    add-int/2addr v0, v2

    .line 47
    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    const-string v2, "on_down_count"

    .line 52
    .line 53
    invoke-interface {p3, v2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 58
    .line 59
    .line 60
    :goto_1
    move-object v2, p0

    .line 61
    move v7, v0

    .line 62
    move-wide v3, v4

    .line 63
    move-wide v5, p1

    .line 64
    goto :goto_2

    .line 65
    :cond_1
    const-string v3, "off_down_count"

    .line 66
    .line 67
    invoke-interface {p3, v3, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr v0, v2

    .line 72
    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    const-string v2, "off_down_count"

    .line 77
    .line 78
    invoke-interface {p3, v2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :goto_2
    invoke-static/range {v2 .. v8}, Ll/nxq0;->f(Landroid/content/Context;JJII)V

    .line 87
    .line 88
    .line 89
    const-string p0, "recordReceiveMsg complete"

    .line 90
    .line 91
    invoke-static {p0}, Ll/kxq0;->c(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    .line 93
    .line 94
    monitor-exit v1

    .line 95
    return-void

    .line 96
    :goto_3
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    throw p0
.end method

.method private static declared-synchronized t(Landroid/content/Context;JZ)V
    .locals 9

    .line 1
    const-class v1, Ll/nxq0;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    const-string v0, "recordPing start"

    .line 5
    .line 6
    invoke-static {v0}, Ll/kxq0;->c(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p3}, Ll/nxq0;->b(Z)I

    .line 10
    .line 11
    .line 12
    move-result v8

    .line 13
    invoke-static {p0}, Ll/nxq0;->c(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    const-string v0, "start_time"

    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    invoke-interface {p3, v0, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    cmp-long v0, v4, v2

    .line 26
    .line 27
    if-gtz v0, :cond_0

    .line 28
    .line 29
    invoke-static {p0, p3, p1, p2, v8}, Ll/nxq0;->h(Landroid/content/Context;Landroid/content/SharedPreferences;JI)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    move-object p0, v0

    .line 35
    goto :goto_3

    .line 36
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 37
    const/4 v2, 0x1

    .line 38
    if-ne v8, v2, :cond_1

    .line 39
    .line 40
    const-string v3, "on_ping_count"

    .line 41
    .line 42
    invoke-interface {p3, v3, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    add-int/2addr v0, v2

    .line 47
    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    const-string v2, "on_ping_count"

    .line 52
    .line 53
    invoke-interface {p3, v2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 58
    .line 59
    .line 60
    :goto_1
    move-object v2, p0

    .line 61
    move v7, v0

    .line 62
    move-wide v3, v4

    .line 63
    move-wide v5, p1

    .line 64
    goto :goto_2

    .line 65
    :cond_1
    const-string v3, "off_ping_count"

    .line 66
    .line 67
    invoke-interface {p3, v3, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr v0, v2

    .line 72
    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    const-string v2, "off_ping_count"

    .line 77
    .line 78
    invoke-interface {p3, v2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :goto_2
    invoke-static/range {v2 .. v8}, Ll/nxq0;->f(Landroid/content/Context;JJII)V

    .line 87
    .line 88
    .line 89
    const-string p0, "recordPing complete"

    .line 90
    .line 91
    invoke-static {p0}, Ll/kxq0;->c(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    .line 93
    .line 94
    monitor-exit v1

    .line 95
    return-void

    .line 96
    :goto_3
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    throw p0
.end method

.method private static declared-synchronized u(Landroid/content/Context;JZ)V
    .locals 9

    .line 1
    const-class v1, Ll/nxq0;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    const-string v0, "recordPong start"

    .line 5
    .line 6
    invoke-static {v0}, Ll/kxq0;->c(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p3}, Ll/nxq0;->b(Z)I

    .line 10
    .line 11
    .line 12
    move-result v8

    .line 13
    invoke-static {p0}, Ll/nxq0;->c(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    const-string v0, "start_time"

    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    invoke-interface {p3, v0, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    cmp-long v0, v4, v2

    .line 26
    .line 27
    if-gtz v0, :cond_0

    .line 28
    .line 29
    invoke-static {p0, p3, p1, p2, v8}, Ll/nxq0;->h(Landroid/content/Context;Landroid/content/SharedPreferences;JI)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    move-object p0, v0

    .line 35
    goto :goto_3

    .line 36
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 37
    const/4 v2, 0x1

    .line 38
    if-ne v8, v2, :cond_1

    .line 39
    .line 40
    const-string v3, "on_pong_count"

    .line 41
    .line 42
    invoke-interface {p3, v3, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    add-int/2addr v0, v2

    .line 47
    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    const-string v2, "on_pong_count"

    .line 52
    .line 53
    invoke-interface {p3, v2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 58
    .line 59
    .line 60
    :goto_1
    move-object v2, p0

    .line 61
    move v7, v0

    .line 62
    move-wide v3, v4

    .line 63
    move-wide v5, p1

    .line 64
    goto :goto_2

    .line 65
    :cond_1
    const-string v3, "off_pong_count"

    .line 66
    .line 67
    invoke-interface {p3, v3, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr v0, v2

    .line 72
    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    const-string v2, "off_pong_count"

    .line 77
    .line 78
    invoke-interface {p3, v2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :goto_2
    invoke-static/range {v2 .. v8}, Ll/nxq0;->f(Landroid/content/Context;JJII)V

    .line 87
    .line 88
    .line 89
    const-string p0, "recordPong complete"

    .line 90
    .line 91
    invoke-static {p0}, Ll/kxq0;->c(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    .line 93
    .line 94
    monitor-exit v1

    .line 95
    return-void

    .line 96
    :goto_3
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    throw p0
.end method
