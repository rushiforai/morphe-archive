.class public Ll/eek0;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;",
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
    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getHierarchys()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchys;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchys;->getWealthHierarchy()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchy;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchy;->getGrade()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmp-long p2, v0, v2

    .line 16
    .line 17
    if-lez p2, :cond_1

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getRoomId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-nez p2, :cond_0

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getRoomId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "no_care"

    .line 34
    .line 35
    invoke-virtual {p0, p1, p2, p2}, Ll/mq2;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    :cond_0
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_1
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;
    .locals 0

    .line 1
    invoke-static {p2}, Ll/f7t;->s(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.privilege.enterroomeffect"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/eek0;->B(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/eek0;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
