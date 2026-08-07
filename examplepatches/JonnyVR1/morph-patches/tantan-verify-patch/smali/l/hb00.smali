.class public Ll/hb00;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/wyd0;

.field public static final b:Ll/fb00;

.field public static final c:Z

.field public static d:Ljava/lang/String;

.field public static final e:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "miit_oaid"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Ll/hb00;->a:Ll/wyd0;

    .line 12
    .line 13
    new-instance v0, Ll/fb00;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/fb00;-><init>()V

    .line 16
    .line 17
    .line 18
    sput-object v0, Ll/hb00;->b:Ll/fb00;

    .line 19
    .line 20
    invoke-static {}, Ll/hb00;->d()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sput-boolean v0, Ll/hb00;->c:Z

    .line 25
    .line 26
    const-string v0, "none"

    .line 27
    .line 28
    sput-object v0, Ll/hb00;->d:Ljava/lang/String;

    .line 29
    .line 30
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 33
    .line 34
    .line 35
    sput-object v0, Ll/hb00;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 36
    .line 37
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
    .locals 1

    return-void

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {v0}, Ll/hb00;->c(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static b()Ljava/lang/String;
    .locals 4

    const-string v0, ""

    return-object v0

    .line 1
    sget-object v0, Ll/hb00;->a:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    sget-object v0, Ll/hb00;->b:Ll/fb00;

    .line 17
    .line 18
    iget-object v1, v0, Ll/fb00;->a:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    const-string v1, "status"

    .line 27
    .line 28
    sget-object v2, Ll/hb00;->d:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    filled-new-array {v1}, [Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v2, "e_request_none_oaid"

    .line 39
    .line 40
    const-string v3, ""

    .line 41
    .line 42
    invoke-static {v2, v3, v1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    sget-boolean v1, Ll/hb00;->c:Z

    .line 46
    .line 47
    if-nez v1, :cond_1

    .line 48
    .line 49
    new-instance v1, Ll/gb00;

    .line 50
    .line 51
    invoke-direct {v1}, Ll/gb00;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    iget-object v0, v0, Ll/fb00;->a:Ljava/lang/String;

    .line 58
    .line 59
    return-object v0
.end method

.method public static c(Landroid/content/Context;)V
    .locals 6

    return-void

    return-void

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    sget-boolean v0, Ll/hb00;->c:Z

    .line 5
    .line 6
    if-nez v0, :cond_5

    .line 7
    .line 8
    const-string v0, "init"

    .line 9
    .line 10
    sput-object v0, Ll/hb00;->d:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v0, Ll/wyd0;

    .line 13
    .line 14
    const-string v1, "miit_control"

    .line 15
    .line 16
    const-string v2, ""

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    invoke-direct {v0, v1, v2, v3}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    const-string v5, "end"

    .line 33
    .line 34
    if-nez v4, :cond_1

    .line 35
    .line 36
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_4

    .line 41
    .line 42
    :cond_1
    sget-object v1, Ll/hb00;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 43
    .line 44
    const/4 v4, 0x0

    .line 45
    invoke-virtual {v1, v4, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_4

    .line 50
    .line 51
    const-string v1, "start"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    :try_start_0
    sget-object v1, Ll/hb00;->b:Ll/fb00;

    .line 57
    .line 58
    invoke-virtual {v1, p0}, Ll/fb00;->a(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :catchall_0
    move-exception p0

    .line 63
    const-string v1, "windows"

    .line 64
    .line 65
    sget-object v3, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    new-instance v1, Ll/wyd0;

    .line 75
    .line 76
    const-string v3, "miit_report_error_app_version"

    .line 77
    .line 78
    invoke-direct {v1, v3, v2, v4}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 79
    .line 80
    .line 81
    sget-object v2, Ll/uqb0;->s:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-nez v2, :cond_3

    .line 92
    .line 93
    sget-object v2, Ll/uqb0;->s:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v1, v2}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 99
    .line 100
    .line 101
    :cond_3
    :goto_0
    invoke-virtual {v0, v5}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    :cond_4
    :goto_1
    return-void

    .line 105
    :cond_5
    const-string p0, "uninit"

    .line 106
    .line 107
    sput-object p0, Ll/hb00;->d:Ljava/lang/String;

    .line 108
    .line 109
    return-void
.end method

.method public static d()Z
    .locals 2

    const/4 v0, 0x0

    return v0

    .line 1
    invoke-static {}, Ll/ive0;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    const/16 v1, 0x1a

    .line 10
    .line 11
    if-lt v0, v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    return v0

    .line 16
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 17
    return v0
.end method
