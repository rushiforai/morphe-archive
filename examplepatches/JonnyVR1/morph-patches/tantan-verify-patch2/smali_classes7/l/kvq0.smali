.class public Ll/kvq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private a:Ll/ewq0;

.field private b:Landroid/content/Context;


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


# virtual methods
.method public a(Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kvq0;->b:Landroid/content/Context;

    .line 2
    .line 3
    return-void
.end method

.method public b(Ll/ewq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kvq0;->a:Ll/ewq0;

    .line 2
    .line 3
    return-void
.end method

.method public run()V
    .locals 5

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/kvq0;->a:Ll/ewq0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/ewq0;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const-string v0, "begin read and send perf / event"

    .line 9
    .line 10
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/kvq0;->a:Ll/ewq0;

    .line 14
    .line 15
    instance-of v1, v0, Ll/ysl;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    const-string v2, "sp_client_report_status"

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    :try_start_1
    iget-object p0, p0, Ll/kvq0;->b:Landroid/content/Context;

    .line 22
    .line 23
    invoke-static {p0}, Ll/mvq0;->c(Landroid/content/Context;)Ll/mvq0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "event_last_upload_time"

    .line 28
    .line 29
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 30
    .line 31
    .line 32
    move-result-wide v3

    .line 33
    invoke-virtual {p0, v2, v0, v3, v4}, Ll/mvq0;->d(Ljava/lang/String;Ljava/lang/String;J)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    instance-of v0, v0, Ll/l2m;

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    iget-object p0, p0, Ll/kvq0;->b:Landroid/content/Context;

    .line 42
    .line 43
    invoke-static {p0}, Ll/mvq0;->c(Landroid/content/Context;)Ll/mvq0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string v0, "perf_last_upload_time"

    .line 48
    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 50
    .line 51
    .line 52
    move-result-wide v3

    .line 53
    invoke-virtual {p0, v2, v0, v3, v4}, Ll/mvq0;->d(Ljava/lang/String;Ljava/lang/String;J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 54
    .line 55
    .line 56
    :cond_2
    return-void

    .line 57
    :catch_0
    move-exception p0

    .line 58
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method
