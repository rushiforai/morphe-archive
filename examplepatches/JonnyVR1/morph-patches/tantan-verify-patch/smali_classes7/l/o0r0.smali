.class Ll/o0r0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a0r0$a;


# instance fields
.field private a:Landroid/app/PendingIntent;

.field protected b:Landroid/content/Context;

.field private volatile c:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/o0r0;->a:Landroid/app/PendingIntent;

    .line 6
    .line 7
    iput-object v0, p0, Ll/o0r0;->b:Landroid/content/Context;

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    iput-wide v0, p0, Ll/o0r0;->c:J

    .line 12
    .line 13
    iput-object p1, p0, Ll/o0r0;->b:Landroid/content/Context;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a()V
    .locals 6

    .line 89
    const-string v0, "[Alarm] unregister timer"

    iget-object v1, p0, Ll/o0r0;->a:Landroid/app/PendingIntent;

    const-wide/16 v2, 0x0

    if-eqz v1, :cond_0

    .line 90
    iget-object v1, p0, Ll/o0r0;->b:Landroid/content/Context;

    const-string v4, "alarm"

    .line 91
    invoke-virtual {v1, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AlarmManager;

    const/4 v4, 0x0

    .line 92
    :try_start_0
    iget-object v5, p0, Ll/o0r0;->a:Landroid/app/PendingIntent;

    invoke-virtual {v1, v5}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    :catch_0
    iput-object v4, p0, Ll/o0r0;->a:Landroid/app/PendingIntent;

    .line 94
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 95
    iput-wide v2, p0, Ll/o0r0;->c:J

    goto :goto_0

    :catchall_0
    move-exception v1

    .line 96
    iput-object v4, p0, Ll/o0r0;->a:Landroid/app/PendingIntent;

    .line 97
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 98
    iput-wide v2, p0, Ll/o0r0;->c:J

    .line 99
    throw v1

    .line 100
    :cond_0
    :goto_0
    iput-wide v2, p0, Ll/o0r0;->c:J

    return-void
.end method

.method public a(Z)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/o0r0;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/xiaomi/push/service/m;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/m;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/xiaomi/push/service/m;->a()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    iget-wide v4, p0, Ll/o0r0;->c:J

    .line 16
    .line 17
    cmp-long v4, v4, v2

    .line 18
    .line 19
    if-nez v4, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/o0r0;->a()V

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 28
    .line 29
    .line 30
    move-result-wide v4

    .line 31
    if-nez p1, :cond_3

    .line 32
    .line 33
    iget-wide v6, p0, Ll/o0r0;->c:J

    .line 34
    .line 35
    cmp-long p1, v6, v2

    .line 36
    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    iget-wide v2, p0, Ll/o0r0;->c:J

    .line 41
    .line 42
    cmp-long p1, v2, v4

    .line 43
    .line 44
    if-gtz p1, :cond_4

    .line 45
    .line 46
    iget-wide v2, p0, Ll/o0r0;->c:J

    .line 47
    .line 48
    add-long/2addr v2, v0

    .line 49
    iput-wide v2, p0, Ll/o0r0;->c:J

    .line 50
    .line 51
    iget-wide v2, p0, Ll/o0r0;->c:J

    .line 52
    .line 53
    cmp-long p1, v2, v4

    .line 54
    .line 55
    if-gez p1, :cond_4

    .line 56
    .line 57
    add-long/2addr v4, v0

    .line 58
    iput-wide v4, p0, Ll/o0r0;->c:J

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_3
    :goto_0
    rem-long v2, v4, v0

    .line 62
    .line 63
    sub-long/2addr v0, v2

    .line 64
    add-long/2addr v4, v0

    .line 65
    iput-wide v4, p0, Ll/o0r0;->c:J

    .line 66
    .line 67
    :cond_4
    :goto_1
    new-instance p1, Landroid/content/Intent;

    .line 68
    .line 69
    sget-object v0, Lcom/xiaomi/push/service/an;->q:Ljava/lang/String;

    .line 70
    .line 71
    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/o0r0;->b:Landroid/content/Context;

    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 81
    .line 82
    .line 83
    iget-wide v0, p0, Ll/o0r0;->c:J

    .line 84
    .line 85
    invoke-virtual {p0, p1, v0, v1}, Ll/o0r0;->b(Landroid/content/Intent;J)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public a()Z
    .locals 4

    .line 101
    iget-wide v0, p0, Ll/o0r0;->c:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public b(Landroid/content/Intent;J)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/o0r0;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "alarm"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/app/AlarmManager;

    .line 10
    .line 11
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 12
    .line 13
    iget-object v2, p0, Ll/o0r0;->b:Landroid/content/Context;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    const/16 v4, 0x1f

    .line 17
    .line 18
    if-lt v1, v4, :cond_0

    .line 19
    .line 20
    const/high16 v5, 0x2000000

    .line 21
    .line 22
    invoke-static {v2, v3, p1, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Ll/o0r0;->a:Landroid/app/PendingIntent;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {v2, v3, p1, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Ll/o0r0;->a:Landroid/app/PendingIntent;

    .line 34
    .line 35
    :goto_0
    const/4 p1, 0x2

    .line 36
    if-lt v1, v4, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Ll/o0r0;->b:Landroid/content/Context;

    .line 39
    .line 40
    invoke-static {v1}, Ll/l4r0;->j(Landroid/content/Context;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_1

    .line 45
    .line 46
    iget-object p0, p0, Ll/o0r0;->a:Landroid/app/PendingIntent;

    .line 47
    .line 48
    invoke-virtual {v0, p1, p2, p3, p0}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object p0, p0, Ll/o0r0;->a:Landroid/app/PendingIntent;

    .line 61
    .line 62
    filled-new-array {p1, v1, p0}, [Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string p1, "setExactAndAllowWhileIdle"

    .line 67
    .line 68
    invoke-static {v0, p1, p0}, Ll/otq0;->e(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string p1, "[Alarm] register timer "

    .line 74
    .line 75
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-static {p0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method
