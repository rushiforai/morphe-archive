.class public Ll/y4k;
.super Ll/nwl;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nwl;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Ll/mwl;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->getGoExtra()Ljava/util/Map;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->getGoExtra()Ljava/util/Map;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v0, "avatar"

    .line 15
    .line 16
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->getGoExtra()Ljava/util/Map;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, "name"

    .line 27
    .line 28
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->getGoExtra()Ljava/util/Map;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string v0, "ttc"

    .line 39
    .line 40
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Ljava/lang/String;

    .line 45
    .line 46
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->getGoData()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string p2, "square"

    .line 51
    .line 52
    invoke-static {p1, p0, p2}, Ll/jwk0;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/mwl;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/mwl;->h(Lcom/p1/mobile/android/app/Act;)Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-interface {p2, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isNewMainActContext(Landroid/app/Activity;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    const-string p2, "videoChatSquare"

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p0, p1, p2, v0}, Ll/mwl;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    const-string p0, "source"

    .line 28
    .line 29
    invoke-static {p3, p0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p2, "roomId"

    .line 34
    .line 35
    invoke-static {p3, p2}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    if-eqz p3, :cond_2

    .line 44
    .line 45
    :goto_0
    return-void

    .line 46
    :cond_2
    invoke-static {p1, p2, p0}, Ll/jwk0;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public j(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x4

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public l(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "videoChatRoom"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/nwl;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
