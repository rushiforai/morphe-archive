.class public Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$c;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->u(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/feed/data/TopicCategorie;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$c;->i:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$c;->s(Lcom/p1/mobile/putong/feed/data/TopicCategorie;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic l(Ljava/lang/Object;IJ)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$c;->t(Lcom/p1/mobile/putong/feed/data/TopicCategorie;IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/TopicCategorie;I)V
    .locals 0

    .line 1
    const-string p0, "topic_category_name"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {p0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p1, "e_topic_category"

    .line 14
    .line 15
    const-string p2, "p_pick_topic"

    .line 16
    .line 17
    invoke-static {p1, p2, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/feed/data/TopicCategorie;IJ)V
    .locals 0

    .line 1
    return-void
.end method
