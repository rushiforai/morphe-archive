.class Lcom/mm/mmfile/AppFrontBackHelper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mm/mmfile/AppFrontBackHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private activityStartCount:I

.field final synthetic this$0:Lcom/mm/mmfile/AppFrontBackHelper;


# direct methods
.method public constructor <init>(Lcom/mm/mmfile/AppFrontBackHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mmfile/AppFrontBackHelper$1;->this$0:Lcom/mm/mmfile/AppFrontBackHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/mm/mmfile/AppFrontBackHelper$1;->activityStartCount:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 1

    .line 1
    iget p1, p0, Lcom/mm/mmfile/AppFrontBackHelper$1;->activityStartCount:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    add-int/2addr p1, v0

    .line 5
    iput p1, p0, Lcom/mm/mmfile/AppFrontBackHelper$1;->activityStartCount:I

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/mm/mmfile/AppFrontBackHelper$1;->this$0:Lcom/mm/mmfile/AppFrontBackHelper;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/mm/mmfile/AppFrontBackHelper;->access$000(Lcom/mm/mmfile/AppFrontBackHelper;)Lcom/mm/mmfile/AppFrontBackHelper$OnAppStatusListener;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/mm/mmfile/AppFrontBackHelper$1;->this$0:Lcom/mm/mmfile/AppFrontBackHelper;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/mm/mmfile/AppFrontBackHelper;->access$000(Lcom/mm/mmfile/AppFrontBackHelper;)Lcom/mm/mmfile/AppFrontBackHelper$OnAppStatusListener;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Lcom/mm/mmfile/AppFrontBackHelper$OnAppStatusListener;->onFront()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    .line 1
    iget p1, p0, Lcom/mm/mmfile/AppFrontBackHelper$1;->activityStartCount:I

    .line 2
    .line 3
    add-int/lit8 p1, p1, -0x1

    .line 4
    .line 5
    iput p1, p0, Lcom/mm/mmfile/AppFrontBackHelper$1;->activityStartCount:I

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/mm/mmfile/AppFrontBackHelper$1;->this$0:Lcom/mm/mmfile/AppFrontBackHelper;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/mm/mmfile/AppFrontBackHelper;->access$000(Lcom/mm/mmfile/AppFrontBackHelper;)Lcom/mm/mmfile/AppFrontBackHelper$OnAppStatusListener;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/mm/mmfile/AppFrontBackHelper$1;->this$0:Lcom/mm/mmfile/AppFrontBackHelper;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/mm/mmfile/AppFrontBackHelper;->access$000(Lcom/mm/mmfile/AppFrontBackHelper;)Lcom/mm/mmfile/AppFrontBackHelper$OnAppStatusListener;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Lcom/mm/mmfile/AppFrontBackHelper$OnAppStatusListener;->onBack()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
