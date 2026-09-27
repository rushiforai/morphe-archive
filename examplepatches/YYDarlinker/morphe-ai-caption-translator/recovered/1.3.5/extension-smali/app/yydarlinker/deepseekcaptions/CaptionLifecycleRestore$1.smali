.class Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore$1;
.super Ljava/lang/Object;
.source "CaptionLifecycleRestore.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->install(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 2

    .line 78
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->-$$Nest$sfgetmainActivityRef()Ljava/lang/ref/WeakReference;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    if-ne p0, p1, :cond_15

    .line 79
    new-instance p0, Ljava/lang/ref/WeakReference;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->-$$Nest$sfputmainActivityRef(Ljava/lang/ref/WeakReference;)V

    :cond_15
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 2

    .line 67
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->-$$Nest$smisMainActivity(Landroid/app/Activity;)Z

    move-result p0

    if-nez p0, :cond_7

    goto :goto_1b

    .line 68
    :cond_7
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result p0

    if-eqz p0, :cond_1b

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->-$$Nest$sfgetretainedTargetCode()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_1b

    const/4 p0, 0x1

    .line 69
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->-$$Nest$sfputpausedWithVisibleAi(Z)V

    :cond_1b
    :goto_1b
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 8

    .line 49
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->-$$Nest$smisMainActivity(Landroid/app/Activity;)Z

    move-result p0

    if-nez p0, :cond_7

    return-void

    .line 50
    :cond_7
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->-$$Nest$sfgetpausedWithVisibleAi()Z

    move-result p0

    if-eqz p0, :cond_36

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result p0

    if-eqz p0, :cond_36

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->-$$Nest$sfgetretainedTargetCode()Ljava/lang/String;

    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_36

    .line 52
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->-$$Nest$sfgetresumeRestoreUntilMs()J

    move-result-wide v0

    .line 54
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const-wide/16 v4, 0x1f40

    add-long/2addr v2, v4

    .line 52
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->-$$Nest$sfputresumeRestoreUntilMs(J)V

    .line 56
    const-string p0, "LIFECYCLE_CAPTION_RESTORE_ARMED"

    const-string v0, "\u64ad\u653e\u5668\u6062\u590d\uff0c\u77ed\u65f6\u4fdd\u62a4\u5f53\u524d AI \u5b57\u5e55\u8f68"

    invoke-static {p1, p0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_36
    const/4 p0, 0x0

    .line 62
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->-$$Nest$sfputpausedWithVisibleAi(Z)V

    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method
