.class public Ll/iz40;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/byd0;

.field public static final b:Ll/byd0;

.field public static final c:Ll/byd0;

.field public static final d:Ll/byd0;

.field public static final e:Ll/byd0;

.field public static final f:Ll/vxd0;

.field public static final g:Ll/byd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public static final h:Ll/vxd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public static i:Ll/pej0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/byd0;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "notification_switch_dialog_first_show"

    .line 10
    .line 11
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/iz40;->a:Ll/byd0;

    .line 15
    .line 16
    new-instance v0, Ll/byd0;

    .line 17
    .line 18
    const-string v2, "notification_switch_dialog_second_show"

    .line 19
    .line 20
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Ll/iz40;->b:Ll/byd0;

    .line 24
    .line 25
    new-instance v0, Ll/byd0;

    .line 26
    .line 27
    const-string v2, "notification_switch_banner_first_show"

    .line 28
    .line 29
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 30
    .line 31
    .line 32
    sput-object v0, Ll/iz40;->c:Ll/byd0;

    .line 33
    .line 34
    new-instance v0, Ll/byd0;

    .line 35
    .line 36
    const-string v2, "notification_switch_banner_second_show"

    .line 37
    .line 38
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 39
    .line 40
    .line 41
    sput-object v0, Ll/iz40;->d:Ll/byd0;

    .line 42
    .line 43
    new-instance v0, Ll/byd0;

    .line 44
    .line 45
    const-string v2, "notification_switch_dialog_show_banner_time"

    .line 46
    .line 47
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 48
    .line 49
    .line 50
    sput-object v0, Ll/iz40;->e:Ll/byd0;

    .line 51
    .line 52
    new-instance v0, Ll/vxd0;

    .line 53
    .line 54
    const-string v2, "notification_switch_dialog_show_banner_cnt"

    .line 55
    .line 56
    const/4 v3, 0x0

    .line 57
    invoke-direct {v0, v2, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 58
    .line 59
    .line 60
    sput-object v0, Ll/iz40;->f:Ll/vxd0;

    .line 61
    .line 62
    new-instance v0, Ll/byd0;

    .line 63
    .line 64
    const-string v2, "notification_home_dialog_show_time"

    .line 65
    .line 66
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Ll/iz40;->g:Ll/byd0;

    .line 70
    .line 71
    new-instance v0, Ll/vxd0;

    .line 72
    .line 73
    const-string v1, "notification_home_dialog_show_cnt"

    .line 74
    .line 75
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 76
    .line 77
    .line 78
    sput-object v0, Ll/iz40;->h:Ll/vxd0;

    .line 79
    .line 80
    const/4 v0, 0x0

    .line 81
    sput-object v0, Ll/iz40;->i:Ll/pej0;

    .line 82
    .line 83
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

.method public static A()V
    .locals 5

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 7
    .line 8
    const/16 v2, 0x1a

    .line 9
    .line 10
    const/high16 v3, 0x10000000

    .line 11
    .line 12
    const-string v4, "android.settings.APP_NOTIFICATION_SETTINGS"

    .line 13
    .line 14
    if-lt v1, v2, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "android.provider.extra.APP_PACKAGE"

    .line 26
    .line 27
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {v0, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-string v2, "app_package"

    .line 47
    .line 48
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 49
    .line 50
    .line 51
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 52
    .line 53
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget v1, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 58
    .line 59
    const-string v2, "app_uid"

    .line 60
    .line 61
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 62
    .line 63
    .line 64
    :goto_0
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 65
    .line 66
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :catch_0
    move-exception v0

    .line 71
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public static B()Z
    .locals 11

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 6
    .line 7
    if-ne v0, v1, :cond_2

    .line 8
    .line 9
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    sget-object v2, Ll/iz40;->c:Ll/byd0;

    .line 16
    .line 17
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Ljava/lang/Long;

    .line 22
    .line 23
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    const-wide/16 v5, 0x0

    .line 28
    .line 29
    cmp-long v7, v3, v5

    .line 30
    .line 31
    const/4 v8, 0x1

    .line 32
    if-nez v7, :cond_0

    .line 33
    .line 34
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v2, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    return v8

    .line 42
    :cond_0
    sub-long v2, v0, v3

    .line 43
    .line 44
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    .line 45
    .line 46
    .line 47
    move-result-wide v2

    .line 48
    const-wide/32 v9, 0x48190800

    .line 49
    .line 50
    .line 51
    cmp-long v2, v2, v9

    .line 52
    .line 53
    if-gez v2, :cond_2

    .line 54
    .line 55
    sget-object v2, Ll/iz40;->d:Ll/byd0;

    .line 56
    .line 57
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Ljava/lang/Long;

    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 64
    .line 65
    .line 66
    move-result-wide v2

    .line 67
    cmp-long v4, v2, v5

    .line 68
    .line 69
    if-nez v4, :cond_1

    .line 70
    .line 71
    return v8

    .line 72
    :cond_1
    sub-long/2addr v0, v2

    .line 73
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 74
    .line 75
    .line 76
    move-result-wide v0

    .line 77
    const-wide/32 v2, 0x5265c00

    .line 78
    .line 79
    .line 80
    cmp-long v0, v0, v2

    .line 81
    .line 82
    if-lez v0, :cond_2

    .line 83
    .line 84
    return v8

    .line 85
    :cond_2
    const/4 v0, 0x0

    .line 86
    return v0
.end method

.method public static C()V
    .locals 3

    .line 1
    sget-object v0, Ll/iz40;->d:Ll/byd0;

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static D()V
    .locals 3

    .line 1
    sget-object v0, Ll/iz40;->f:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    sget-object v0, Ll/iz40;->e:Ll/byd0;

    .line 23
    .line 24
    invoke-static {}, Ll/pzi0;->o()J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static E(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V
    .locals 5

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    new-array v0, v0, [Z

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    aput-boolean v1, v0, v1

    .line 12
    .line 13
    new-instance v2, Ll/jl80$a;

    .line 14
    .line 15
    invoke-direct {v2, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/gra;->z()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    sget v3, Ll/dbc0;->Zh:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sget v3, Ll/dbc0;->Au:I

    .line 28
    .line 29
    :goto_0
    invoke-virtual {v2, v3}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {}, Ll/gra;->z()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_1

    .line 38
    .line 39
    sget v3, Ll/dbc0;->R:I

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    const/4 v3, -0x1

    .line 43
    :goto_1
    invoke-virtual {v2, v3}, Ll/jl80$a;->d0(I)Ll/jl80$a;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    sget v3, Lcom/p1/mobile/putong/core/R$string;->ik:I

    .line 48
    .line 49
    new-array v4, v1, [Ljava/lang/Object;

    .line 50
    .line 51
    invoke-virtual {v2, v3, v4}, Ll/jl80$a;->x0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    sget v3, Lcom/p1/mobile/putong/core/R$string;->hk:I

    .line 56
    .line 57
    new-array v4, v1, [Ljava/lang/Object;

    .line 58
    .line 59
    invoke-virtual {v2, v3, v4}, Ll/jl80$a;->s0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    sget v3, Lcom/p1/mobile/putong/core/R$string;->gk:I

    .line 64
    .line 65
    new-instance v4, Ll/uy40;

    .line 66
    .line 67
    invoke-direct {v4, p0}, Ll/uy40;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, v3, v4}, Ll/jl80$a;->a0(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Al:I

    .line 75
    .line 76
    new-array v1, v1, [Ljava/lang/Object;

    .line 77
    .line 78
    invoke-virtual {p0, v2, v1}, Ll/jl80$a;->V(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    new-instance v1, Ll/vy40;

    .line 87
    .line 88
    invoke-direct {v1, v0, p1}, Ll/vy40;-><init>([ZLl/x20;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, v1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 92
    .line 93
    .line 94
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_2

    .line 99
    .line 100
    new-instance p1, Ll/wy40;

    .line 101
    .line 102
    invoke-direct {p1, v0, p2}, Ll/wy40;-><init>([ZLl/x20;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, p1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    invoke-static {}, Ll/fph0;->N()V

    .line 109
    .line 110
    .line 111
    :cond_3
    return-void
.end method

.method public static F(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V
    .locals 5

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x21

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    const-string v0, "android.permission.POST_NOTIFICATIONS"

    .line 8
    .line 9
    filled-new-array {v0}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget-object v0, Ll/iz40;->g:Ll/byd0;

    .line 21
    .line 22
    invoke-static {}, Ll/pzi0;->o()J

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    sget-object v0, Ll/iz40;->h:Ll/vxd0;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ljava/lang/Integer;

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    const/4 v2, 0x1

    .line 46
    add-int/2addr v1, v2

    .line 47
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    new-array v0, v2, [Z

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    aput-boolean v1, v0, v1

    .line 58
    .line 59
    new-instance v2, Ll/jl80$a;

    .line 60
    .line 61
    invoke-direct {v2, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Ll/gra;->z()Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eqz v3, :cond_1

    .line 69
    .line 70
    sget v3, Ll/dbc0;->Zh:I

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    sget v3, Ll/dbc0;->Au:I

    .line 74
    .line 75
    :goto_0
    invoke-virtual {v2, v3}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 80
    .line 81
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 82
    .line 83
    invoke-virtual {v3}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 88
    .line 89
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    const-string v4, "female"

    .line 94
    .line 95
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-eqz v3, :cond_2

    .line 100
    .line 101
    sget v3, Lcom/p1/mobile/putong/core/R$string;->t2:I

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_2
    sget v3, Lcom/p1/mobile/putong/core/R$string;->u2:I

    .line 105
    .line 106
    :goto_1
    new-array v4, v1, [Ljava/lang/Object;

    .line 107
    .line 108
    invoke-virtual {v2, v3, v4}, Ll/jl80$a;->x0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    sget v3, Lcom/p1/mobile/putong/core/R$string;->w2:I

    .line 113
    .line 114
    new-array v4, v1, [Ljava/lang/Object;

    .line 115
    .line 116
    invoke-virtual {v2, v3, v4}, Ll/jl80$a;->s0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-virtual {v2, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    sget v2, Lcom/p1/mobile/putong/core/R$string;->v2:I

    .line 125
    .line 126
    new-instance v3, Ll/hz40;

    .line 127
    .line 128
    invoke-direct {v3, p0}, Ll/hz40;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1, v2, v3}, Ll/jl80$a;->a0(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    sget v1, Lcom/p1/mobile/putong/core/R$string;->s2:I

    .line 136
    .line 137
    new-instance v2, Ll/py40;

    .line 138
    .line 139
    invoke-direct {v2}, Ll/py40;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, v1, v2}, Ll/jl80$a;->U(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    new-instance v1, Ll/qy40;

    .line 151
    .line 152
    invoke-direct {v1, v0, p1}, Ll/qy40;-><init>([ZLl/x20;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0, v1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 156
    .line 157
    .line 158
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-eqz p1, :cond_3

    .line 163
    .line 164
    new-instance p1, Ll/ry40;

    .line 165
    .line 166
    invoke-direct {p1, v0, p2}, Ll/ry40;-><init>([ZLl/x20;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0, p1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 170
    .line 171
    .line 172
    :cond_3
    invoke-static {}, Ll/fph0;->N()V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public static G(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 9

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_open_push_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const-string v1, "card"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string v1, "message"

    .line 19
    .line 20
    :goto_0
    const-string v2, "popoup_page_source"

    .line 21
    .line 22
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    filled-new-array {v1}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/pej0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    sput-object v1, Ll/iz40;->i:Ll/pej0;

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 42
    .line 43
    .line 44
    sget-object v1, Ll/iz40;->i:Ll/pej0;

    .line 45
    .line 46
    sget v2, Ll/kec0;->jb:I

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 49
    .line 50
    .line 51
    sget-object v1, Ll/iz40;->i:Ll/pej0;

    .line 52
    .line 53
    sget v2, Ll/adc0;->c9:I

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Lv/VRelative;

    .line 60
    .line 61
    sget-object v2, Ll/iz40;->i:Ll/pej0;

    .line 62
    .line 63
    sget v3, Ll/adc0;->C:I

    .line 64
    .line 65
    invoke-virtual {v2, v3}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    check-cast v2, Lv/VRelative;

    .line 70
    .line 71
    sget-object v3, Ll/iz40;->i:Ll/pej0;

    .line 72
    .line 73
    sget v4, Ll/adc0;->r4:I

    .line 74
    .line 75
    invoke-virtual {v3, v4}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    check-cast v3, Lv/VIcon;

    .line 80
    .line 81
    sget-object v4, Ll/iz40;->i:Ll/pej0;

    .line 82
    .line 83
    sget v5, Ll/adc0;->d9:I

    .line 84
    .line 85
    invoke-virtual {v4, v5}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    check-cast v4, Lv/VImage;

    .line 90
    .line 91
    sget-object v5, Ll/iz40;->i:Ll/pej0;

    .line 92
    .line 93
    sget v6, Ll/adc0;->D:I

    .line 94
    .line 95
    invoke-virtual {v5, v6}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    check-cast v5, Lv/VImage;

    .line 100
    .line 101
    sget-object v6, Ll/iz40;->i:Ll/pej0;

    .line 102
    .line 103
    sget v7, Ll/adc0;->g9:I

    .line 104
    .line 105
    invoke-virtual {v6, v7}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    check-cast v6, Lv/VButton;

    .line 110
    .line 111
    const-string v7, "openWithFriend"

    .line 112
    .line 113
    filled-new-array {v7}, [Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v7

    .line 117
    new-instance v8, Ll/oy40;

    .line 118
    .line 119
    invoke-direct {v8, v4, v5, v7}, Ll/oy40;-><init>(Lv/VImage;Lv/VImage;[Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v1, v8}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    new-instance v1, Ll/zy40;

    .line 126
    .line 127
    invoke-direct {v1, v4, v5, v7}, Ll/zy40;-><init>(Lv/VImage;Lv/VImage;[Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v2, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 131
    .line 132
    .line 133
    new-instance v1, Ll/az40;

    .line 134
    .line 135
    invoke-direct {v1, v7, p0, v0}, Ll/az40;-><init>([Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/l4g0;)V

    .line 136
    .line 137
    .line 138
    invoke-static {v6, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    new-instance v1, Ll/bz40;

    .line 142
    .line 143
    invoke-direct {v1}, Ll/bz40;-><init>()V

    .line 144
    .line 145
    .line 146
    invoke-static {v3, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 147
    .line 148
    .line 149
    sget-object v1, Ll/iz40;->i:Ll/pej0;

    .line 150
    .line 151
    new-instance v2, Ll/cz40;

    .line 152
    .line 153
    invoke-direct {v2, v0, p1}, Ll/cz40;-><init>(Ll/l4g0;Z)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 157
    .line 158
    .line 159
    sget-object v1, Ll/iz40;->i:Ll/pej0;

    .line 160
    .line 161
    new-instance v2, Ll/dz40;

    .line 162
    .line 163
    invoke-direct {v2, v0}, Ll/dz40;-><init>(Ll/l4g0;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 167
    .line 168
    .line 169
    sget-object v0, Ll/iz40;->i:Ll/pej0;

    .line 170
    .line 171
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    const v1, 0x3e99999a    # 0.3f

    .line 176
    .line 177
    .line 178
    invoke-virtual {v0, v1}, Landroid/view/Window;->setDimAmount(F)V

    .line 179
    .line 180
    .line 181
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    if-eqz v1, :cond_1

    .line 186
    .line 187
    const v1, 0x1020002

    .line 188
    .line 189
    .line 190
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    sget v1, Ll/adc0;->q2:I

    .line 195
    .line 196
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    check-cast v0, Landroid/widget/FrameLayout;

    .line 201
    .line 202
    sget v1, Ll/dbc0;->Up:I

    .line 203
    .line 204
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 205
    .line 206
    .line 207
    :cond_1
    if-nez p1, :cond_2

    .line 208
    .line 209
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 210
    .line 211
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 212
    .line 213
    iget-object p1, p1, Ll/dkb;->j0:Ll/byd0;

    .line 214
    .line 215
    invoke-static {}, Ll/pzi0;->o()J

    .line 216
    .line 217
    .line 218
    move-result-wide v0

    .line 219
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    :cond_2
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/poplevel/a;->I()Z

    .line 231
    .line 232
    .line 233
    move-result p1

    .line 234
    if-eqz p1, :cond_3

    .line 235
    .line 236
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    sget-object v0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->Notifycation:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 241
    .line 242
    sget-object v1, Ll/iz40;->i:Ll/pej0;

    .line 243
    .line 244
    const/16 v2, 0x4e20

    .line 245
    .line 246
    invoke-virtual {p1, v0, p0, v1, v2}, Lcom/p1/mobile/android/ui/poplevel/a;->C(Ll/c3m;Ll/e3m;Ll/d3m;I)V

    .line 247
    .line 248
    .line 249
    return-void

    .line 250
    :cond_3
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 251
    .line 252
    .line 253
    move-result-object p0

    .line 254
    sget-object p1, Ll/iz40;->i:Ll/pej0;

    .line 255
    .line 256
    invoke-static {p1}, Ll/al80;->a(Ll/f3m;)Ll/al80;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    invoke-virtual {p0, p1}, Ll/cl80;->q(Ll/al80;)V

    .line 261
    .line 262
    .line 263
    return-void
.end method

.method public static H(Lcom/p1/mobile/android/app/Act;IZ)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->d2:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 25
    .line 26
    iget-object p2, p2, Ll/dkb;->d2:Ll/jxd0;

    .line 27
    .line 28
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 36
    .line 37
    iget-object p2, p2, Ll/dkb;->a2:Ll/byd0;

    .line 38
    .line 39
    invoke-static {}, Ll/pzi0;->o()J

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p2, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    const-class p2, Lcom/p1/mobile/android/app/Dialog;

    .line 51
    .line 52
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    const-string v0, "p_notification_permission_popup"

    .line 57
    .line 58
    invoke-static {v0, p2}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    if-lez p1, :cond_1

    .line 63
    .line 64
    const-string v0, "match"

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    const-string v0, "message"

    .line 68
    .line 69
    :goto_0
    const-string v1, "notify_popup_type"

    .line 70
    .line 71
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    filled-new-array {v0}, [Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p2, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p2}, Ll/w1e;->f(Ll/l4g0;)V

    .line 83
    .line 84
    .line 85
    new-instance v0, Ll/jl80$a;

    .line 86
    .line 87
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 88
    .line 89
    .line 90
    invoke-static {}, Ll/gra;->z()Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-eqz v1, :cond_2

    .line 95
    .line 96
    sget v1, Ll/dbc0;->ki:I

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_2
    if-lez p1, :cond_3

    .line 100
    .line 101
    sget v1, Ll/dbc0;->ho:I

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_3
    sget v1, Ll/dbc0;->io:I

    .line 105
    .line 106
    :goto_1
    invoke-virtual {v0, v1}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-static {}, Ll/gra;->z()Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-eqz v1, :cond_4

    .line 115
    .line 116
    sget v1, Ll/dbc0;->R:I

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_4
    const/4 v1, -0x1

    .line 120
    :goto_2
    invoke-virtual {v0, v1}, Ll/jl80$a;->d0(I)Ll/jl80$a;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    if-lez p1, :cond_5

    .line 125
    .line 126
    const-string v1, "\u5339\u914d\u6d88\u606f\u901a\u77e5\u8bbe\u7f6e"

    .line 127
    .line 128
    goto :goto_3

    .line 129
    :cond_5
    const-string v1, "\u6253\u5f00\u52a8\u6001\u6d88\u606f\u901a\u77e5"

    .line 130
    .line 131
    :goto_3
    invoke-virtual {v0, v1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    if-lez p1, :cond_7

    .line 136
    .line 137
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 142
    .line 143
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 144
    .line 145
    iget-object v1, v1, Ll/dkb;->c2:Ll/jxd0;

    .line 146
    .line 147
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    check-cast v1, Ljava/lang/Boolean;

    .line 152
    .line 153
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    if-eqz v1, :cond_6

    .line 158
    .line 159
    const-string v1, "\u4ed6"

    .line 160
    .line 161
    goto :goto_4

    .line 162
    :cond_6
    const-string v1, "\u5979"

    .line 163
    .line 164
    :goto_4
    filled-new-array {p1, v1}, [Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    const-string v1, "\u521a\u521a\u4f60\u559c\u6b22\u4e86%s\u4eba\uff0c\u6253\u5f00\u6d88\u606f\u901a\u77e5\uff0c%s\u4eec\u559c\u6b22\u4f60\u540e\u4f1a\u7b2c\u4e00\u65f6\u95f4\u901a\u77e5\u4f60"

    .line 169
    .line 170
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    goto :goto_5

    .line 175
    :cond_7
    const-string p1, "\u53ca\u65f6\u83b7\u53d6\u79c1\u804a\u3001\u914d\u5bf9\u3001\u8bc4\u8bba\u7b49\u4e92\u52a8\u6d88\u606f\uff0c\u4e0d\u9519\u8fc7\u4efb\u4f55\u4e00\u6b21\u4ea4\u53cb\u673a\u4f1a"

    .line 176
    .line 177
    :goto_5
    invoke-virtual {v0, p1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    const/4 v0, 0x0

    .line 182
    invoke-virtual {p1, v0}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    new-instance v0, Ll/ez40;

    .line 187
    .line 188
    invoke-direct {v0, p0}, Ll/ez40;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 189
    .line 190
    .line 191
    const-string p0, "\u53bb\u5f00\u542f"

    .line 192
    .line 193
    invoke-virtual {p1, p0, v0}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    new-instance p1, Ll/fz40;

    .line 198
    .line 199
    invoke-direct {p1}, Ll/fz40;-><init>()V

    .line 200
    .line 201
    .line 202
    const-string v0, "\u6682\u4e0d\u8bbe\u7f6e"

    .line 203
    .line 204
    invoke-virtual {p0, v0, p1}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    new-instance p1, Ll/gz40;

    .line 213
    .line 214
    invoke-direct {p1, p2}, Ll/gz40;-><init>(Ll/l4g0;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p0, p1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 218
    .line 219
    .line 220
    return-void
.end method

.method public static synthetic a(Lv/VImage;Lv/VImage;[Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    sget p3, Ll/dbc0;->A:I

    .line 2
    .line 3
    invoke-virtual {p0, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 4
    .line 5
    .line 6
    sget p0, Ll/dbc0;->B:I

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    const-string p1, "openWithAll"

    .line 13
    .line 14
    aput-object p1, p2, p0

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic b([Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/l4g0;Landroid/view/View;)V
    .locals 3

    .line 1
    const/4 p3, 0x0

    .line 2
    aget-object v0, p0, p3

    .line 3
    .line 4
    const-string v1, "openWithFriend"

    .line 5
    .line 6
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "friends"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v0, "all"

    .line 16
    .line 17
    :goto_0
    const-string v1, "push_scope_choose"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {v0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "e_open_push_click"

    .line 28
    .line 29
    const-string v2, "p_open_push_popup"

    .line 30
    .line 31
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget-object v1, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    if-eq v0, v1, :cond_1

    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->getUserPushAllEnable()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_1

    .line 56
    .line 57
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 60
    .line 61
    aget-object p0, p0, p3

    .line 62
    .line 63
    invoke-virtual {v0, p0, v2, p3, p3}, Ll/dkb;->K9(Ljava/lang/String;ZII)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    new-instance p1, Ll/sy40;

    .line 72
    .line 73
    invoke-direct {p1}, Ll/sy40;-><init>()V

    .line 74
    .line 75
    .line 76
    new-instance p3, Ll/ty40;

    .line 77
    .line 78
    invoke-direct {p3}, Ll/ty40;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-static {p1, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 90
    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 92
    .line 93
    aget-object p0, p0, p3

    .line 94
    .line 95
    invoke-virtual {v0, p0, v2, p3, p3}, Ll/dkb;->K9(Ljava/lang/String;ZII)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    invoke-static {p3}, Ll/psd0;->L(Ll/bb50;)Lcom/p1/mobile/android/rx/a;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    invoke-virtual {p0, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 112
    .line 113
    .line 114
    invoke-static {}, Ll/iz40;->v()Z

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    if-eqz p0, :cond_2

    .line 119
    .line 120
    invoke-static {p1}, Ll/iz40;->u(Lcom/p1/mobile/android/app/Act;)V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_2
    invoke-static {}, Ll/iz40;->A()V

    .line 125
    .line 126
    .line 127
    :goto_1
    sget-object p0, Ll/iz40;->i:Ll/pej0;

    .line 128
    .line 129
    const/4 p1, 0x0

    .line 130
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 131
    .line 132
    .line 133
    invoke-static {p2}, Ll/w1e;->e(Ll/l4g0;)V

    .line 134
    .line 135
    .line 136
    sget-object p0, Ll/iz40;->i:Ll/pej0;

    .line 137
    .line 138
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public static synthetic c(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    const-string v0, "e_notification_permission_popup_open"

    .line 2
    .line 3
    const-string v1, "p_notification_permission_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/iz40;->v()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-static {p0}, Ll/iz40;->u(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-static {}, Ll/iz40;->A()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic e()V
    .locals 2

    .line 1
    const-string v0, "e_notification_permission_popup_later"

    .line 2
    .line 3
    const-string v1, "p_notification_permission_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/iz40;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/iz40;->u(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/fph0;->I()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {}, Ll/iz40;->A()V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/fph0;->I()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    const-string p0, "\u5df2\u5f00\u542f\u6d88\u606f\u901a\u77e5"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/iz40;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/iz40;->u(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/fph0;->I()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {}, Ll/iz40;->A()V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/fph0;->I()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic l([ZLl/x20;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    aget-boolean p0, p0, p2

    .line 3
    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p1}, Ll/x20;->call()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public static synthetic m(Ll/l4g0;ZLandroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    const-string p0, "e_close_push_popup"

    .line 5
    .line 6
    const-string p2, "p_open_push_popup"

    .line 7
    .line 8
    invoke-static {p0, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/w250;->a()Ll/w250;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/w250;->h()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic n([ZLl/x20;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    aget-boolean p0, p0, p2

    .line 3
    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p1}, Ll/x20;->call()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public static synthetic o(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Lv/VImage;Lv/VImage;[Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    sget p3, Ll/dbc0;->B:I

    .line 2
    .line 3
    invoke-virtual {p0, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 4
    .line 5
    .line 6
    sget p0, Ll/dbc0;->A:I

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    const-string p1, "openWithFriend"

    .line 13
    .line 14
    aput-object p1, p2, p0

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p0, Ll/iz40;->i:Ll/pej0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic r([ZLl/x20;Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/fph0;->M()V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    const/4 v0, 0x1

    .line 6
    aput-boolean v0, p0, p2

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-interface {p1}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static synthetic s([ZLl/x20;Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    const/4 p2, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    aput-boolean v0, p0, p2

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static t(JJ)I
    .locals 2

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    invoke-direct {v0, p2, p3}, Ljava/util/Date;-><init>(J)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Ljava/util/Date;

    .line 7
    .line 8
    invoke-direct {p2, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1, p2}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 23
    .line 24
    .line 25
    const/4 p2, 0x6

    .line 26
    invoke-virtual {p0, p2}, Ljava/util/Calendar;->get(I)I

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    invoke-virtual {p1, p2}, Ljava/util/Calendar;->get(I)I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eq p0, p1, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    :goto_0
    if-ge p0, p1, :cond_3

    .line 47
    .line 48
    rem-int/lit8 v1, p0, 0x4

    .line 49
    .line 50
    if-nez v1, :cond_0

    .line 51
    .line 52
    rem-int/lit8 v1, p0, 0x64

    .line 53
    .line 54
    if-nez v1, :cond_1

    .line 55
    .line 56
    :cond_0
    rem-int/lit16 v1, p0, 0x190

    .line 57
    .line 58
    if-nez v1, :cond_2

    .line 59
    .line 60
    :cond_1
    add-int/lit16 v0, v0, 0x16e

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    add-int/lit16 v0, v0, 0x16d

    .line 64
    .line 65
    :goto_1
    add-int/lit8 p0, p0, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    sub-int/2addr p2, p3

    .line 69
    add-int/2addr v0, p2

    .line 70
    return v0

    .line 71
    :cond_4
    sub-int/2addr p2, p3

    .line 72
    return p2
.end method

.method public static u(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "android.permission.POST_NOTIFICATIONS"

    .line 6
    .line 7
    filled-new-array {v1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/xy40;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/xy40;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance v2, Ll/yy40;

    .line 35
    .line 36
    invoke-direct {v2}, Ll/yy40;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static v()Z
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x21

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    return v0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    return v0
.end method

.method public static w()Z
    .locals 1

    .line 1
    sget-object v0, Ll/iz40;->i:Ll/pej0;

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
    sget-object v0, Ll/iz40;->i:Ll/pej0;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    return v0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    return v0
.end method

.method public static x(Lcom/p1/mobile/android/app/Act;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/iz40;->y(Lcom/p1/mobile/android/app/Act;Z)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public static y(Lcom/p1/mobile/android/app/Act;Z)Z
    .locals 10

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_3

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 12
    .line 13
    if-ne p0, v0, :cond_3

    .line 14
    .line 15
    sget-object p0, Ll/iz40;->a:Ll/byd0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/Long;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    sget-object v2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 28
    .line 29
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 30
    .line 31
    .line 32
    move-result-wide v2

    .line 33
    const-wide/16 v4, 0x0

    .line 34
    .line 35
    cmp-long v6, v0, v4

    .line 36
    .line 37
    const/4 v7, 0x1

    .line 38
    if-nez v6, :cond_1

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    :cond_0
    return v7

    .line 50
    :cond_1
    sget-object p0, Ll/iz40;->b:Ll/byd0;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    check-cast v6, Ljava/lang/Long;

    .line 57
    .line 58
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 59
    .line 60
    .line 61
    move-result-wide v8

    .line 62
    cmp-long v4, v8, v4

    .line 63
    .line 64
    if-nez v4, :cond_3

    .line 65
    .line 66
    sub-long v0, v2, v0

    .line 67
    .line 68
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 69
    .line 70
    .line 71
    move-result-wide v0

    .line 72
    const-wide/32 v4, 0x240c8400

    .line 73
    .line 74
    .line 75
    cmp-long v0, v0, v4

    .line 76
    .line 77
    if-lez v0, :cond_3

    .line 78
    .line 79
    if-nez p1, :cond_2

    .line 80
    .line 81
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    :cond_2
    return v7

    .line 89
    :cond_3
    const/4 p0, 0x0

    .line 90
    return p0
.end method

.method public static z()Z
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    sget-object v0, Ll/iz40;->e:Ll/byd0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Long;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    sget-object v3, Ll/iz40;->f:Ll/vxd0;

    .line 23
    .line 24
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Ljava/lang/Integer;

    .line 29
    .line 30
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    const/4 v4, 0x5

    .line 35
    if-ge v3, v4, :cond_0

    .line 36
    .line 37
    invoke-static {}, Ll/pzi0;->o()J

    .line 38
    .line 39
    .line 40
    move-result-wide v3

    .line 41
    sub-long/2addr v3, v0

    .line 42
    const-wide/32 v0, 0xa4cb800

    .line 43
    .line 44
    .line 45
    cmp-long v0, v3, v0

    .line 46
    .line 47
    if-lez v0, :cond_0

    .line 48
    .line 49
    const/4 v0, 0x1

    .line 50
    return v0

    .line 51
    :cond_0
    return v2
.end method
