.class public final Lorg/chromium/components/crash/browser/ChildProcessCrashObserver;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Lyzb;


# direct methods
.method public static childCrashed(I)V
    .registers 3

    sget-object p0, Lorg/chromium/components/crash/browser/ChildProcessCrashObserver;->a:Lyzb;

    if-eqz p0, :cond_14

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;

    const/4 v0, 0x1

    invoke-static {v0}, Ltz5;->d(Z)V

    iget-object v0, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->a:Lwom;

    invoke-interface {v0}, Lwom;->d()Z

    move-result v0

    if-eqz v0, :cond_15

    :cond_14
    return-void

    :cond_15
    iget-object p0, p0, Lcom/opera/android/crashhandler/MainProcessCrashHandler;->b:Lis3;

    iget-object p0, p0, Lis3;->a:Lks3;

    iget-object p0, p0, Lks3;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    const-wide/16 v0, 0xa

    invoke-static {v0, v1, p0}, Lcom/opera/android/crashhandler/CrashReportProcessingService;->c(JLandroid/content/Context;)V

    return-void
.end method
