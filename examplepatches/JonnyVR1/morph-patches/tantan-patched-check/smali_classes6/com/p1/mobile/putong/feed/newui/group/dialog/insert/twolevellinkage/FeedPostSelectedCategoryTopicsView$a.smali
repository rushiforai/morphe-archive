.class public Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$a;->i:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$a;->s(Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic l(Ljava/lang/Object;IJ)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$a;->t(Lcom/p1/mobile/putong/feed/data/TopicMoment;IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V
    .locals 0

    .line 1
    const-string p2, "topic_id"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$a;->i:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->m(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const-string p0, "1"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string p0, "2"

    .line 25
    .line 26
    :goto_0
    const-string p2, "topic_attribute"

    .line 27
    .line 28
    invoke-static {p2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string p1, "e_add_topic_pick"

    .line 37
    .line 38
    const-string p2, "p_pick_topic"

    .line 39
    .line 40
    invoke-static {p1, p2, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/feed/data/TopicMoment;IJ)V
    .locals 0

    .line 1
    return-void
.end method
