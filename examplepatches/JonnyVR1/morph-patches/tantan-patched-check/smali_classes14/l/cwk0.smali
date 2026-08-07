.class public Ll/cwk0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;)V
    .locals 3

    .line 1
    new-instance v0, Ll/bvk0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/bvk0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;->popupConfig:Lcom/p1/mobile/putong/live/base/data/BLivePopupConfig;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/bvk0;->o(Lcom/p1/mobile/putong/live/base/data/BLivePopupConfig;)Ll/bvk0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/stp0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/stp0;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;->dialogUrl:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ll/stp0;->k(Ljava/lang/String;)Ll/stp0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/4 v1, 0x2

    .line 24
    new-array v1, v1, [Ll/lbl0;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    aput-object v0, v1, v2

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    aput-object p1, v1, v0

    .line 31
    .line 32
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p0, p1}, Ll/cwk0;->b(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Ll/lbl0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Ll/d45;->a(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/jwu;->L(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/bwk0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/bwk0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method
