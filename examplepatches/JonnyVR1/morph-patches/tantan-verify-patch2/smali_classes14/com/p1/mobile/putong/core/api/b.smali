.class public Lcom/p1/mobile/putong/core/api/b;
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

.method public static a(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->active:Lcom/p1/mobile/putong/core/data/Active;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public static b(Lcom/p1/mobile/putong/core/data/VirtualCardType;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->NativeAdViewCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlSeeCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 6
    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlVipCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 10
    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveActiveCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 14
    .line 15
    if-eq p0, v0, :cond_1

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->MinBoostCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 18
    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlFreeSpotlightCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 22
    .line 23
    if-eq p0, v0, :cond_1

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlTextBuzzActiveCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 26
    .line 27
    if-eq p0, v0, :cond_1

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlVoiceBuzzActiveCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 30
    .line 31
    if-eq p0, v0, :cond_1

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlVideoBuzzActiveCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 34
    .line 35
    if-ne p0, v0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0

    .line 40
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 41
    return p0
.end method
