.class Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$4;
.super Landroid/os/ResultReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$4;->this$0:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$4;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$4;->b()V

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$4;->this$0:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 15
    .line 16
    const-string v2, "reportUserId"

    .line 17
    .line 18
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$4;->this$0:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->S()Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/16 v2, 0x10

    .line 28
    .line 29
    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$4;->this$0:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->S()Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->finish()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public onReceiveResult(ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$4;->this$0:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->S()Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iget-boolean p2, p2, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->finishForReport:Z

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    const/4 p2, -0x1

    .line 16
    if-ne p1, p2, :cond_0

    .line 17
    .line 18
    new-instance p1, Lcom/p1/mobile/putong/core/ui/greet/b;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/greet/b;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$4;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
