.class Lcom/p1/mobile/putong/data/User$149;
.super Lcom/tantanapp/common/data/orm/LongColumn;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/User;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/orm/LongColumn<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/LongColumn;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public get(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 2
    .line 3
    iget-wide p0, p0, Lcom/p1/mobile/putong/data/ActivityUser;->score:J

    .line 4
    .line 5
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/User$149;->get(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public set(Lcom/p1/mobile/putong/data/User;Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide p1

    .line 7
    iput-wide p1, p0, Lcom/p1/mobile/putong/data/ActivityUser;->score:J

    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/User$149;->set(Lcom/p1/mobile/putong/data/User;Ljava/lang/Long;)V

    return-void
.end method
