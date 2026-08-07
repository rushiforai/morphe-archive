.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/feed/data/RecommendUsers;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView$a;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic j(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/RecommendUsers;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView$a;->s(Lcom/p1/mobile/putong/feed/data/RecommendUsers;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic l(Ljava/lang/Object;IJ)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/RecommendUsers;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView$a;->t(Lcom/p1/mobile/putong/feed/data/RecommendUsers;IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/RecommendUsers;I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView$a;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->P(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p2, Ll/pf60;

    .line 8
    .line 9
    const-string v0, "card_user_id"

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/RecommendUsers;->userId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {p2, v0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    filled-new-array {p2}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string p2, "e_user_suggest_card"

    .line 21
    .line 22
    invoke-static {p2, p0, p1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/feed/data/RecommendUsers;IJ)V
    .locals 0

    .line 1
    return-void
.end method
