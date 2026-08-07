.class Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$6;
.super Landroid/os/ResultReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->Id(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

.field final synthetic val$matched:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;Landroid/os/Handler;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$6;->this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 2
    .line 3
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$6;->val$matched:Z

    .line 4
    .line 5
    invoke-direct {p0, p2}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$6;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$6;->b()V

    return-void
.end method


# virtual methods
.method public final synthetic b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$6;->this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/app/Activity;->setResult(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$6;->this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onReceiveResult(ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    const/4 p2, -0x1

    .line 2
    if-ne p1, p2, :cond_0

    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$6;->val$matched:Z

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$6;->this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 9
    .line 10
    new-instance p2, Lcom/p1/mobile/putong/core/ui/profile/profilelist/a;

    .line 11
    .line 12
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$6;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Frag;->l4(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
