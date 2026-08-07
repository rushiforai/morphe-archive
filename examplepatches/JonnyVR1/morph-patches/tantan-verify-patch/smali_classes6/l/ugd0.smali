.class public Ll/ugd0;
.super Ll/mr2;
.source "SourceFile"


# instance fields
.field public e:Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

.field public f:Ll/v5g;

.field public g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/data/Followship;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/mr2;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/data/Followship;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/v5g;->a()Ll/v5g;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/ugd0;->f:Ll/v5g;

    .line 9
    .line 10
    iput-object p5, p0, Ll/ugd0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Ll/v5g;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ugd0;->f:Ll/v5g;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ugd0;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/String;)Ll/ugd0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ugd0;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/ugd0;
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/v5g;

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbases:Ljava/util/List;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRelations:Ljava/util/List;

    .line 10
    .line 11
    invoke-direct {v0, v1, p1}, Ll/v5g;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/ugd0;->f:Ll/v5g;

    .line 15
    .line 16
    :cond_0
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/ugd0;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->relationships:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->relationships:Ljava/util/List;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    .line 21
    .line 22
    iget-object v0, p0, Ll/mr2;->a:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iput-object p1, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 27
    .line 28
    :cond_0
    return-object p0
.end method
