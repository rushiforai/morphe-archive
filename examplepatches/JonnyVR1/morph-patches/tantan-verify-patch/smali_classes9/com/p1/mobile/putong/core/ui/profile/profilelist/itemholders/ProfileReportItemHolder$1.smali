.class Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder$1;
.super Landroid/os/ResultReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder;->t()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder$1;->this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder;

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
    const/4 p2, -0x1

    .line 2
    if-ne p1, p2, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder$1;->this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder;->O()Ll/t3m;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 17
    .line 18
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    invoke-virtual {p1, p2}, Landroid/app/Activity;->setResult(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder$1;->this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder;->O()Ll/t3m;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method
