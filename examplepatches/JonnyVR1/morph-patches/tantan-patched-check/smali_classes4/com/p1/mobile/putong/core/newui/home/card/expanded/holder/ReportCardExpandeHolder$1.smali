.class Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder$1;
.super Landroid/os/ResultReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;->g(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder$1;->this$0:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;

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
    .locals 1

    .line 1
    const/4 p2, -0x1

    .line 2
    if-ne p1, p2, :cond_0

    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->I2:Lrx/subjects/a;

    .line 9
    .line 10
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder$1;->this$0:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 27
    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder$1;->this$0:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    invoke-virtual {p1, p2}, Landroid/app/Activity;->setResult(I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder$1;->this$0:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/ReportCardExpandeHolder;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method
