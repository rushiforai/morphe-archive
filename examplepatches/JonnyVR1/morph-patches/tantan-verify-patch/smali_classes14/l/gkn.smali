.class public final Ll/gkn;
.super Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\r\u0010\t\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\t\u0010\u0008J\r\u0010\n\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\n\u0010\u0008R$\u0010\u0012\u001a\u0004\u0018\u00010\u000b8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000c\u0010\r\u001a\u0004\u0008\u000e\u0010\u000f\"\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0013"
    }
    d2 = {
        "Ll/gkn;",
        "Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;",
        "Ll/ner;",
        "lifecycleProvider",
        "<init>",
        "(Ll/ner;)V",
        "",
        "getData",
        "()V",
        "o",
        "p",
        "Lcom/p1/mobile/putong/live/base/data/BLivePopUp;",
        "a",
        "Lcom/p1/mobile/putong/live/base/data/BLivePopUp;",
        "n",
        "()Lcom/p1/mobile/putong/live/base/data/BLivePopUp;",
        "setResultData",
        "(Lcom/p1/mobile/putong/live/base/data/BLivePopUp;)V",
        "resultData",
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


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static f(Ll/gkn;Lcom/p1/mobile/putong/live/base/data/BLivePopUp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gkn;->a:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->success()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLivePopUp;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    .line 4
    .line 5
    return-object p0
.end method

.method public static h(Ll/gkn;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->error(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static i(Ll/gkn;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->error(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static j(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLivePopUp;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    .line 4
    .line 5
    return-object p0
.end method

.method public static k(Ll/gkn;Lcom/p1/mobile/putong/live/base/data/BLivePopUp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gkn;->a:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->success()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static l(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lcom/p1/mobile/putong/live/base/data/BLivePopUp;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    .line 6
    .line 7
    return-object p0
.end method

.method public static m(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lcom/p1/mobile/putong/live/base/data/BLivePopUp;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public getData()V
    .locals 0

    .line 1
    return-void
.end method

.method public final n()Lcom/p1/mobile/putong/live/base/data/BLivePopUp;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gkn;->a:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    .line 2
    .line 3
    return-object p0
.end method

.method public final o()V
    .locals 3

    .line 1
    const-string v0, "/live/popUp"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/rnl;->r(Ljava/lang/String;)Ll/rnl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ll/rnl;->p()Ll/rnl$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "live-popup"

    .line 23
    .line 24
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReqIO(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/ckn;

    .line 36
    .line 37
    invoke-direct {v1}, Ll/ckn;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/dkn;

    .line 41
    .line 42
    invoke-direct {v2, v1}, Ll/dkn;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/ekn;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/ekn;-><init>(Ll/gkn;)V

    .line 60
    .line 61
    .line 62
    new-instance v2, Ll/fkn;

    .line 63
    .line 64
    invoke-direct {v2, p0}, Ll/fkn;-><init>(Ll/gkn;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final p()V
    .locals 3

    .line 1
    const-string v0, "/voice-live/popUp"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/rnl;->r(Ljava/lang/String;)Ll/rnl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ll/rnl;->p()Ll/rnl$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "voice-live-popup"

    .line 23
    .line 24
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReqIO(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/yjn;

    .line 36
    .line 37
    invoke-direct {v1}, Ll/yjn;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/zjn;

    .line 41
    .line 42
    invoke-direct {v2, v1}, Ll/zjn;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/akn;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/akn;-><init>(Ll/gkn;)V

    .line 60
    .line 61
    .line 62
    new-instance v2, Ll/bkn;

    .line 63
    .line 64
    invoke-direct {v2, p0}, Ll/bkn;-><init>(Ll/gkn;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void
.end method
