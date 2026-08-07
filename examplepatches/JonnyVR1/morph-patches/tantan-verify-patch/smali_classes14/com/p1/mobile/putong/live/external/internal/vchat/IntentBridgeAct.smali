.class public Lcom/p1/mobile/putong/live/external/internal/vchat/IntentBridgeAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# static fields
.field public static c:Ljava/lang/String; = "intent"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/live/external/internal/vchat/IntentBridgeAct;->c:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    const-class p1, Lcom/p1/mobile/putong/live/external/internal/vchat/IntentBridgeAct;

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    return-object v0
.end method


# virtual methods
.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget-object v0, Lcom/p1/mobile/putong/live/external/internal/vchat/IntentBridgeAct;->c:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v0, "video.chat.notify.push"

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    invoke-static {p1}, Ll/jwk0;->b(Lcom/p1/mobile/android/app/Act;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
