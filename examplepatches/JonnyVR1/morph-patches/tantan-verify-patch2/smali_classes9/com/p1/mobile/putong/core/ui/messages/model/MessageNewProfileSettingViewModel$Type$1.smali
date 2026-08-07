.class Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type$1;
.super Landroid/os/ResultReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$pair:Landroid/util/Pair;


# direct methods
.method public constructor <init>(Landroid/os/Handler;Landroid/util/Pair;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type$1;->val$pair:Landroid/util/Pair;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type$1;->val$pair:Landroid/util/Pair;

    .line 11
    .line 12
    iget-object p0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;

    .line 15
    .line 16
    iget-object p0, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
