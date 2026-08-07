.class Lcom/p1/mobile/putong/data/User$39;
.super Lcom/tantanapp/common/data/orm/StringColumn;
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
        "Lcom/tantanapp/common/data/orm/StringColumn<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/StringColumn;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/User$39;->get(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public get(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    return-object p0
.end method

.method public set(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iput-object p2, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/User$39;->set(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
