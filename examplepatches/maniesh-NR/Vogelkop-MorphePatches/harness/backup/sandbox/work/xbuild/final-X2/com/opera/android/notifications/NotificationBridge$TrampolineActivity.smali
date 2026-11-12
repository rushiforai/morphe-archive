.class public Lcom/opera/android/notifications/NotificationBridge$TrampolineActivity;
.super Landroid/app/Activity;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/notifications/NotificationBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TrampolineActivity"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_6d

    invoke-static {p1}, Lcom/opera/android/notifications/NotificationBridge;->c(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_6d

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x23

    if-lt v0, v1, :cond_57

    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->a()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_1e
    if-ge v2, v1, :cond_33

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Landroid/app/Activity;

    invoke-static {v3}, Lorg/chromium/base/ApplicationStatus;->b(Landroid/app/Activity;)I

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_57

    const/4 v4, 0x4

    if-ne v3, v4, :cond_1e

    goto :goto_57

    :cond_33
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lkqd;

    const/16 v2, 0xb

    invoke-direct {v1, p0, v2}, Lkqd;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->n:Lorg/chromium/base/CommandLine;

    if-nez p0, :cond_4b

    const/4 p0, 0x0

    :cond_4b
    invoke-static {v0, p0}, Lfsp;->g(Landroid/content/Context;Lorg/chromium/base/CommandLine;)V

    new-instance p0, Lcom/opera/android/notifications/b;

    invoke-direct {p0, v0, p1, v1}, Lcom/opera/android/notifications/b;-><init>(Landroid/content/Context;Landroid/content/Intent;Lkqd;)V

    invoke-static {v0, p0}, Le7d;->a(Landroid/content/Context;Lc7d;)V

    return-void

    :cond_57
    :goto_57
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    const-class p1, Lcom/opera/android/notifications/NotificationService;

    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_6d
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method
