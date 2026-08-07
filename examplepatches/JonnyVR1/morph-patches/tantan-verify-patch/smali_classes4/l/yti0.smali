.class public Ll/yti0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile b:Ll/yti0;


# instance fields
.field public a:Lcom/p1/mobile/putong/data/OMSThemeInfo;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b()Ll/yti0;
    .locals 2

    .line 1
    sget-object v0, Ll/yti0;->b:Ll/yti0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/yti0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/yti0;->b:Ll/yti0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/yti0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/yti0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/yti0;->b:Ll/yti0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/yti0;->b:Ll/yti0;

    .line 27
    .line 28
    return-object v0
.end method

.method public static k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Ll/yti0;->b:Ll/yti0;

    .line 3
    .line 4
    return-void
.end method

.method public static n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "^#([0-9a-fA-F]{6}|[0-9a-fA-F]{8})$"

    .line 8
    .line 9
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    return-object p1
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/data/OMSThemeInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 10
    .line 11
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/yti0;->j()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    sget-object v0, Landroid/util/Patterns;->WEB_URL:Ljava/util/regex/Pattern;

    .line 32
    .line 33
    iget-object v1, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-object p0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 50
    .line 51
    return-object p0

    .line 52
    :cond_0
    const/4 p0, 0x0

    .line 53
    return-object p0
.end method

.method public d()V
    .locals 2

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pk50;->m()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 21
    .line 22
    iput-object v0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 27
    .line 28
    return-void
.end method

.method public e()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 11
    .line 12
    iget-boolean v2, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestSwitch:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/yti0;->j()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z0:Ll/uab;

    .line 29
    .line 30
    iget-object p0, p0, Ll/uab;->X:Ll/jxd0;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    return p0

    .line 46
    :cond_0
    return v1
.end method

.method public f()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 11
    .line 12
    iget-boolean v2, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 13
    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestSwitch:Z

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/yti0;->j()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z0:Ll/uab;

    .line 29
    .line 30
    iget-object p0, p0, Ll/uab;->Y:Ll/jxd0;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    return p0

    .line 46
    :cond_0
    return v1
.end method

.method public g()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/yti0;->j()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public h()Z
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->OmsManagerCache:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ll/pk50;->m()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v2, 0x0

    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    iget-object v1, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 41
    .line 42
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/4 v3, 0x1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    iget-object v1, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 50
    .line 51
    iget-boolean v4, v1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 52
    .line 53
    if-eqz v4, :cond_1

    .line 54
    .line 55
    iget-boolean v4, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 56
    .line 57
    if-nez v4, :cond_1

    .line 58
    .line 59
    iget-boolean v0, v1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestSwitch:Z

    .line 60
    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/yti0;->j()Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_0

    .line 68
    .line 69
    return v3

    .line 70
    :cond_0
    return v2

    .line 71
    :cond_1
    iget-boolean v1, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 72
    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestSwitch:Z

    .line 76
    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/yti0;->j()Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_2

    .line 84
    .line 85
    return v3

    .line 86
    :cond_2
    return v2
.end method

.method public i()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/yti0;->j()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 16
    .line 17
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestSwitch:Z

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public final j()Z
    .locals 6

    .line 1
    iget-object v0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 13
    .line 14
    invoke-static {}, Ll/pzi0;->o()J

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    iget-wide v4, p0, Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;->startMs:J

    .line 19
    .line 20
    cmp-long v0, v2, v4

    .line 21
    .line 22
    if-ltz v0, :cond_0

    .line 23
    .line 24
    iget-wide v4, p0, Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;->endMs:J

    .line 25
    .line 26
    cmp-long p0, v2, v4

    .line 27
    .line 28
    if-gez p0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    return v1
.end method

.method public l(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 10
    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestSwitch:Z

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z0:Ll/uab;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, p0, p1, v1}, Ll/uab;->d3(Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/data/OMSThemeInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yti0;->a:Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 2
    .line 3
    return-void
.end method
