.class public Ll/w4l;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;",
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;",
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
.method public B(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;->getGrade()J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    cmp-long p0, p0, v0

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;)Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;
    .locals 0

    .line 1
    invoke-static {p2}, Ll/f7t;->u(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;)Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;

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
            "Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.room.hierarchyGradeUp"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/w4l;->B(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/w4l;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;)Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
