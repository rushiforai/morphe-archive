.class public final Ll/fwp;
.super Ll/o4n;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Ll/fwp;",
        "Ll/o4n;",
        "Ll/ner;",
        "lifecycleProvider",
        "Ll/nus;",
        "info",
        "<init>",
        "(Ll/ner;Ll/nus;)V",
        "",
        "T",
        "()V",
        "",
        "W2",
        "()Z",
        "external_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/nus;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Ll/o4n;-><init>(Ll/ner;Ll/nus;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ll/ewp;

    .line 11
    .line 12
    invoke-direct {p1, p0}, Ll/ewp;-><init>(Ll/fwp;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/o4n;->X2(Lkotlin/jvm/functions/Function1;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static d3(Ll/fwp;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    xor-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/o4n;->Z2(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/o4n;->U2()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/o4n;->V2()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Ll/o4n;->Y2(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/o4n;->T2()Ll/gkn;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/gkn;->p()V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public static e3(Ll/fwp;Lcom/p1/mobile/putong/live/base/data/BLivePopUp;)Lkotlin/Unit;
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const/4 v3, 0x1

    .line 21
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePopUp;->liveId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePopUp;->source:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v0, v1, p1}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 49
    .line 50
    return-object p0
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/o4n;->T()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/avo0;->INSTANCE:Ll/avo0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/avo0;->a()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/dwp;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/dwp;-><init>(Ll/fwp;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public W2()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
