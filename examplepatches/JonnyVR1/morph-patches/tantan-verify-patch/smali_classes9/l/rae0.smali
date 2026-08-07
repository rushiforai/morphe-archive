.class public Ll/rae0;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;",
        "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;",
        ">;"
    }
.end annotation


# instance fields
.field public h:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;",
            ">;",
            "Ll/zod;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/jk2;-><init>(Ll/wbg0;Ll/zod;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/rae0;->h:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object p2, p0, Ll/rae0;->h:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/util/HashSet;->size()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/16 v0, 0x1f4

    .line 8
    .line 9
    if-lt p2, v0, :cond_0

    .line 10
    .line 11
    iget-object p2, p0, Ll/rae0;->h:Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/util/HashSet;->clear()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p2, p0, Ll/rae0;->h:Ljava/util/HashSet;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;->getUniqueId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p2, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_1

    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_1
    iget-object p0, p0, Ll/rae0;->h:Ljava/util/HashSet;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;->getUniqueId()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;
    .locals 3

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;->getScheme()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;->getDelay()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;->getUniqueId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-direct {p0, p1, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;->setResultMessage(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.common.schemePopup"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/rae0;->B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic z(Ljava/lang/String;Lcom/google/protobuf/q;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/rae0;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
