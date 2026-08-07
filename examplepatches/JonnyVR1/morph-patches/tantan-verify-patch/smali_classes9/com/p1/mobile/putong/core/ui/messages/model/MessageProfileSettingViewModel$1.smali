.class Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel$1;
.super Landroid/os/ResultReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->d(Lcom/p1/mobile/putong/data/User;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel$1;->this$0:Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onReceiveResult(ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/h39;->H()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const/4 p2, -0x1

    .line 8
    if-ne p1, p2, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel$1;->this$0:Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;

    .line 11
    .line 12
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
