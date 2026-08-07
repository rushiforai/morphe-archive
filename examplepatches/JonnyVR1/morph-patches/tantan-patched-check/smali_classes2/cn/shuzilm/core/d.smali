.class Lcn/shuzilm/core/d;
.super Ljava/util/TimerTask;
.source "SourceFile"


# instance fields
.field final synthetic a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/shuzilm/core/d;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    :try_start_0
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->a()Lcn/shuzilm/core/DUHelper;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->h()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-gtz v0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->a()Lcn/shuzilm/core/DUHelper;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Lcn/shuzilm/core/d;->a:Landroid/content/Context;

    .line 15
    .line 16
    const-string v3, "DefaultChannel"

    .line 17
    .line 18
    const-string v4, "ZVTFJRA"

    .line 19
    .line 20
    const/4 v5, 0x0

    .line 21
    const/4 v6, 0x2

    .line 22
    invoke-static/range {v1 .. v6}, Lcn/shuzilm/core/DUHelper;->a(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcn/shuzilm/core/Listener;I)V

    .line 23
    .line 24
    .line 25
    const-wide/16 v0, 0x14

    .line 26
    .line 27
    invoke-static {v0, v1}, Landroid/os/SystemClock;->sleep(J)V

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->i()Ljava/util/Timer;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->i()Ljava/util/Timer;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Ljava/util/Timer;->cancel()V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->a(Ljava/util/Timer;)Ljava/util/Timer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    :catchall_0
    :cond_1
    return-void
.end method
