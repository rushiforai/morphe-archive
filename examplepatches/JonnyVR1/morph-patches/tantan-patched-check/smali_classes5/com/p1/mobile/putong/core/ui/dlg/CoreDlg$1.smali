.class Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$1;
.super Landroid/os/ResultReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->l1(ZZLandroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZLl/x20;ILcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Lcom/p1/mobile/android/app/Act;

.field final synthetic val$matched:Z

.field final synthetic val$profileFinishAction:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/os/Handler;ZLl/x20;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$1;->val$matched:Z

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$1;->val$profileFinishAction:Ll/x20;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$1;->val$act:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-direct {p0, p1}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onReceiveResult(ILandroid/os/Bundle;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p1, v0, :cond_2

    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$1;->val$matched:Z

    .line 5
    .line 6
    if-nez p1, :cond_1

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$1;->val$profileFinishAction:Ll/x20;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$1;->val$profileFinishAction:Ll/x20;

    .line 17
    .line 18
    invoke-interface {p0}, Ll/x20;->call()V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$1;->val$act:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setResult(I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$1;->val$act:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    const-string p0, "reason"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    :cond_2
    return-void
.end method
