.class public Ll/fu2;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final b:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static c:Ll/htb;

.field public static d:Ll/ypy;

.field public static e:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

.field public static f:Lcom/p1/mobile/putong/data/ApmConfigSetting;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/fu2;->a:Ljava/util/Set;

    .line 7
    .line 8
    new-instance v1, Ljava/util/HashSet;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Ll/fu2;->b:Ljava/util/Set;

    .line 14
    .line 15
    const-string v2, "p_suggest_users_home_view"

    .line 16
    .line 17
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    const-string v2, "p_moments_view"

    .line 21
    .line 22
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    const-string v2, "p_nearby"

    .line 26
    .line 27
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    const-string v2, "p_follow"

    .line 31
    .line 32
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    const-string v2, "p_recommend"

    .line 36
    .line 37
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    invoke-interface {v1, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    const-string v0, "p_user_live_room"

    .line 44
    .line 45
    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    const-string v0, "p_messages_view"

    .line 49
    .line 50
    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
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

.method public static synthetic a()V
    .locals 6

    .line 1
    invoke-static {}, Ll/fu2;->c()Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/fu2;->f:Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 6
    .line 7
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableCpuReport:Z

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/htb;

    .line 14
    .line 15
    new-instance v3, Ll/ctb$a;

    .line 16
    .line 17
    invoke-direct {v3}, Ll/ctb$a;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v3, v2}, Ll/ctb$a;->b(Z)Ll/ctb$a;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    sget-object v4, Ll/fu2;->f:Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 25
    .line 26
    iget-wide v4, v4, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleInterval:J

    .line 27
    .line 28
    invoke-virtual {v3, v4, v5}, Ll/ctb$a;->c(J)Ll/ctb$a;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    sget-object v4, Ll/fu2;->f:Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 33
    .line 34
    iget-wide v4, v4, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleStartDelay:J

    .line 35
    .line 36
    invoke-virtual {v3, v4, v5}, Ll/ctb$a;->e(J)Ll/ctb$a;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    sget-object v4, Ll/fu2;->f:Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 41
    .line 42
    iget v4, v4, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuSamplingMaxTimes:I

    .line 43
    .line 44
    invoke-virtual {v3, v4}, Ll/ctb$a;->d(I)Ll/ctb$a;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3}, Ll/ctb$a;->a()Ll/ctb;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-direct {v0, v3}, Ll/htb;-><init>(Ll/ctb;)V

    .line 53
    .line 54
    .line 55
    sput-object v0, Ll/fu2;->c:Ll/htb;

    .line 56
    .line 57
    new-array v3, v2, [Ll/ioi0;

    .line 58
    .line 59
    aput-object v0, v3, v1

    .line 60
    .line 61
    invoke-static {v3}, Ll/du2;->b([Ll/ioi0;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    sget-object v0, Ll/fu2;->f:Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 65
    .line 66
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->enableMemoryReport:Z

    .line 67
    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    new-instance v0, Ll/ypy;

    .line 71
    .line 72
    new-instance v3, Ll/rpy$a;

    .line 73
    .line 74
    invoke-direct {v3}, Ll/rpy$a;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v3, v2}, Ll/rpy$a;->b(Z)Ll/rpy$a;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    sget-object v4, Ll/fu2;->f:Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 82
    .line 83
    iget-wide v4, v4, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleInterval:J

    .line 84
    .line 85
    invoke-virtual {v3, v4, v5}, Ll/rpy$a;->c(J)Ll/rpy$a;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    sget-object v4, Ll/fu2;->f:Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 90
    .line 91
    iget-wide v4, v4, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleStartDelay:J

    .line 92
    .line 93
    invoke-virtual {v3, v4, v5}, Ll/rpy$a;->e(J)Ll/rpy$a;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    sget-object v4, Ll/fu2;->f:Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 98
    .line 99
    iget v4, v4, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memorySamplingMaxTimes:I

    .line 100
    .line 101
    invoke-virtual {v3, v4}, Ll/rpy$a;->d(I)Ll/rpy$a;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-virtual {v3}, Ll/rpy$a;->a()Ll/rpy;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-direct {v0, v3}, Ll/ypy;-><init>(Ll/rpy;)V

    .line 110
    .line 111
    .line 112
    sput-object v0, Ll/fu2;->d:Ll/ypy;

    .line 113
    .line 114
    new-array v2, v2, [Ll/ioi0;

    .line 115
    .line 116
    aput-object v0, v2, v1

    .line 117
    .line 118
    invoke-static {v2}, Ll/du2;->b([Ll/ioi0;)V

    .line 119
    .line 120
    .line 121
    :cond_1
    return-void
.end method

.method public static b()Z
    .locals 2

    .line 1
    const-string v0, "360store"

    .line 2
    .line 3
    sget-object v1, Ll/ls4;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "baidu"

    .line 12
    .line 13
    sget-object v1, Ll/ls4;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const-string v0, "ppzhushou"

    .line 22
    .line 23
    sget-object v1, Ll/ls4;->a:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    const-string v0, "organic"

    .line 32
    .line 33
    sget-object v1, Ll/ls4;->a:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    const-string v0, "meizu"

    .line 42
    .line 43
    sget-object v1, Ll/ls4;->a:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    const-string v0, "qq"

    .line 52
    .line 53
    sget-object v1, Ll/ls4;->a:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_1

    .line 60
    .line 61
    const-string v0, "qq_32"

    .line 62
    .line 63
    sget-object v1, Ll/ls4;->a:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_1

    .line 70
    .line 71
    const-string v0, "qq_64"

    .line 72
    .line 73
    sget-object v1, Ll/ls4;->a:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_0

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_0
    const/4 v0, 0x0

    .line 83
    return v0

    .line 84
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 85
    return v0
.end method

.method public static c()Lcom/p1/mobile/putong/data/ApmConfigSetting;
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/ApmConfigSetting;->new_()Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/fu2;->f:Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 6
    .line 7
    const-wide/16 v1, 0xbb8

    .line 8
    .line 9
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleStartDelay:J

    .line 10
    .line 11
    const-wide/16 v3, 0x1388

    .line 12
    .line 13
    iput-wide v3, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleInterval:J

    .line 14
    .line 15
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleStartDelay:J

    .line 16
    .line 17
    iput-wide v3, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleInterval:J

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v3, "beatles_apm_config"

    .line 24
    .line 25
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-nez v3, :cond_0

    .line 34
    .line 35
    :try_start_0
    sget-object v3, Lcom/p1/mobile/putong/data/ApmConfigSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 36
    .line 37
    invoke-virtual {v3, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 42
    .line 43
    sput-object v0, Ll/fu2;->f:Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 44
    .line 45
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleStartDelay:J

    .line 46
    .line 47
    const-wide/16 v5, 0x3e8

    .line 48
    .line 49
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 50
    .line 51
    .line 52
    move-result-wide v3

    .line 53
    iput-wide v3, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleStartDelay:J

    .line 54
    .line 55
    sget-object v0, Ll/fu2;->f:Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 56
    .line 57
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleInterval:J

    .line 58
    .line 59
    const-wide/16 v5, 0x7d0

    .line 60
    .line 61
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 62
    .line 63
    .line 64
    move-result-wide v3

    .line 65
    iput-wide v3, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->cpuModuleInterval:J

    .line 66
    .line 67
    sget-object v0, Ll/fu2;->f:Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 68
    .line 69
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleStartDelay:J

    .line 70
    .line 71
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 72
    .line 73
    .line 74
    move-result-wide v3

    .line 75
    iput-wide v3, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleStartDelay:J

    .line 76
    .line 77
    sget-object v0, Ll/fu2;->f:Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 78
    .line 79
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleInterval:J

    .line 80
    .line 81
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 82
    .line 83
    .line 84
    move-result-wide v1

    .line 85
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->memoryModuleInterval:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :catch_0
    sget-object v0, Ll/fu2;->f:Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 89
    .line 90
    const-string v1, "default"

    .line 91
    .line 92
    iput-object v1, v0, Lcom/p1/mobile/putong/data/ApmConfigSetting;->configName:Ljava/lang/String;

    .line 93
    .line 94
    :cond_0
    :goto_0
    sget-object v0, Ll/fu2;->f:Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 95
    .line 96
    return-object v0
.end method

.method public static d()Ll/htb;
    .locals 1

    .line 1
    sget-object v0, Ll/fu2;->c:Ll/htb;

    .line 2
    .line 3
    return-object v0
.end method

.method public static e()Ll/ypy;
    .locals 1

    .line 1
    sget-object v0, Ll/fu2;->d:Ll/ypy;

    .line 2
    .line 3
    return-object v0
.end method

.method public static f()Lcom/p1/mobile/putong/data/ApmConfigSetting;
    .locals 1

    .line 1
    sget-object v0, Ll/fu2;->f:Lcom/p1/mobile/putong/data/ApmConfigSetting;

    .line 2
    .line 3
    return-object v0
.end method

.method public static g()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->x()Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/fu2;->e:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    new-array v1, v1, [Ll/ioi0;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    aput-object v0, v1, v2

    .line 12
    .line 13
    invoke-static {v1}, Ll/du2;->b([Ll/ioi0;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/fu2;->b()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    new-instance v0, Ll/eu2;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/eu2;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public static h(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ll/fu2;->a:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ll/k4j;->c(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/fu2;->c:Ll/htb;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget-object v0, Ll/fu2;->b:Ljava/util/Set;

    .line 17
    .line 18
    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-static {p0}, Ll/jtb;->c(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    sget-object v0, Ll/fu2;->d:Ll/ypy;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    sget-object v0, Ll/fu2;->b:Ljava/util/Set;

    .line 32
    .line 33
    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    invoke-static {p0}, Ll/bqy;->c(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    return-void
.end method

.method public static i(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ll/fu2;->a:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ll/k4j;->e(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/fu2;->c:Ll/htb;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget-object v0, Ll/fu2;->b:Ljava/util/Set;

    .line 17
    .line 18
    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-static {p0}, Ll/jtb;->e(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    sget-object v0, Ll/fu2;->d:Ll/ypy;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    sget-object v0, Ll/fu2;->b:Ljava/util/Set;

    .line 32
    .line 33
    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    invoke-static {p0}, Ll/bqy;->f(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    return-void
.end method

.method public static j()V
    .locals 5

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "apm_report_pids"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, ","

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    array-length v1, v0

    .line 18
    const/4 v2, 0x0

    .line 19
    :goto_0
    if-ge v2, v1, :cond_0

    .line 20
    .line 21
    aget-object v3, v0, v2

    .line 22
    .line 23
    sget-object v4, Ll/fu2;->b:Ljava/util/Set;

    .line 24
    .line 25
    invoke-interface {v4, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    add-int/lit8 v2, v2, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void

    .line 32
    :catch_0
    move-exception v0

    .line 33
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    return-void
.end method
