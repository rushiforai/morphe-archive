.class public Ll/a3e0;
.super Ll/o5e0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o5e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/a3e0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/a3e0;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    return-void
.end method


# virtual methods
.method public a(Ll/abe0;Ll/z20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/o5e0;->a(Ll/abe0;Ll/z20;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    instance-of p2, p2, Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    const-string v0, "source"

    .line 17
    .line 18
    invoke-static {p2, v0}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "liveId"

    .line 23
    .line 24
    invoke-static {p2, v1}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    invoke-static {v0, p2}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->requestSuggestVoiceLive(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    new-instance v0, Ll/y2e0;

    .line 43
    .line 44
    invoke-direct {v0, p0, p1}, Ll/y2e0;-><init>(Ll/a3e0;Lcom/p1/mobile/android/app/Act;)V

    .line 45
    .line 46
    .line 47
    new-instance p0, Ll/z2e0;

    .line 48
    .line 49
    invoke-direct {p0}, Ll/z2e0;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method public c(Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final synthetic f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/a3e0;->g(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 p2, 0x0

    .line 19
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;->getGoAction()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p1, p0}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method
