.class Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper$1;
.super Landroid/os/ResultReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->T(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

.field final synthetic val$matched:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;Landroid/os/Handler;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper$1;->this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 2
    .line 3
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper$1;->val$matched:Z

    .line 4
    .line 5
    invoke-direct {p0, p2}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper$1;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper$1;->b()V

    return-void
.end method


# virtual methods
.method public final synthetic b()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper$1;->this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->s(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)Ll/zq90;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 13
    .line 14
    const-string v2, "userId"

    .line 15
    .line 16
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "action"

    .line 21
    .line 22
    const-string v2, "report"

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper$1;->this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->t(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper$1;->this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 43
    .line 44
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->t(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public onReceiveResult(ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    const/4 p2, -0x1

    .line 2
    if-ne p1, p2, :cond_2

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper$1;->this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->s(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)Ll/zq90;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Ll/zq90;->C()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 p2, 0x1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper$1;->this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->s(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)Ll/zq90;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/zq90;->j()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper$1;->val$matched:Z

    .line 31
    .line 32
    xor-int/2addr p2, p1

    .line 33
    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper$1;->this$0:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 36
    .line 37
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->t(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance p2, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/a;

    .line 42
    .line 43
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper$1;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    return-void
.end method
