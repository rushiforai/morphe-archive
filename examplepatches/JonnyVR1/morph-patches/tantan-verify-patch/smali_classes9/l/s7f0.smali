.class public Ll/s7f0;
.super Ll/o2e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/o2e0<",
        "Ll/zit;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o2e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/hyr;Ll/gae0;Ll/bae0$b;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zit;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/s7f0;->b(Ll/zit;Ll/gae0;Ll/bae0$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ll/zit;Ll/gae0;Ll/bae0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SignInEvent:Lcom/tantan/live/eventbus/LiveEventBus$SignInEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SignInEvent;->showSignDialog()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;

    .line 12
    .line 13
    invoke-direct {p2}, Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string p3, "source"

    .line 17
    .line 18
    invoke-virtual {p1, p3}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    sget-object p2, Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$Page;->MAIN:Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$Page;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;->b(Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$Page;)Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;->a()Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
