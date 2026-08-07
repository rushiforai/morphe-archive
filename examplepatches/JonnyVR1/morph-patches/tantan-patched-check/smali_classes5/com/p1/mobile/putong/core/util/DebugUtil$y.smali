.class public Lcom/p1/mobile/putong/core/util/DebugUtil$y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->xj(Lcom/p1/mobile/putong/core/newui/home/b;Ll/b240;)Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;"
    }
.end annotation


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


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/data/Relationship;->new_()Lcom/p1/mobile/putong/data/Relationship;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/data/RelationshipExtensions;->new_()Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 20
    .line 21
    const-string v1, "\u6211\u5bf9\u4f60\u8bf4 \u54c8\u54c8\u54c8\u54c8\u54c8 \u563b\u563b\u563b\u563b \u5566\u5566\u5566\u5566 \u5471\u5471\u5471\u5471 ~~~~~~~~~~~~~~~~~~~~~~~~\u54c8\u54c8\u54c8\u54c8\u54c8 \u563b\u563b\u563b\u563b \u5566\u5566\u5566\u5566 \u5471\u5471\u5471\u5471 ~~~~~~~~~~~~~~~~~~~~~~~~\u54c8\u54c8\u54c8\u54c8\u54c8 \u563b\u563b\u563b\u563b \u5566\u5566\u5566\u5566 \u5471\u5471\u5471\u5471 ~~~~~~~~~~~~~~~~~~~~~~~~\u54c8\u54c8\u54c8\u54c8\u54c8 \u563b\u563b\u563b\u563b \u5566\u5566\u5566\u5566 \u5471\u5471\u5471\u5471 ~~~~~~~~~~~~~~~~~~~~~~~~\u54c8\u54c8\u54c8\u54c8\u54c8 \u563b\u563b\u563b\u563b \u5566\u5566\u5566\u5566 \u5471\u5471\u5471\u5471 ~~~~~~~~~~~~~~~~~~~~~~~~"

    .line 22
    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLetter:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 26
    .line 27
    const-string v1, "letter"

    .line 28
    .line 29
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 37
    .line 38
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil$y;->a(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
