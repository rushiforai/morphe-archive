.class public Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
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
.field public final synthetic i:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag$a;->i:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;

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
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag$a;->s(Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V

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
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag$a;->t(Lcom/p1/mobile/putong/feed/data/TopicMoment;IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Ll/h80;->j(Ljava/lang/Object;I)V

    .line 2
    .line 3
    .line 4
    const-string p0, "topic_id"

    .line 5
    .line 6
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 13
    .line 14
    iget-object p2, p2, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    const-string v0, "is_create"

    .line 33
    .line 34
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0, p1}, Ll/er60;->E(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v0, "topic_type"

    .line 47
    .line 48
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const-string v0, "topic_source"

    .line 53
    .line 54
    const-string v1, "circle_relate_topic"

    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    filled-new-array {p0, p2, p1, v0}, [Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p1, "e_topic"

    .line 65
    .line 66
    const-string p2, "p_circle_detail"

    .line 67
    .line 68
    invoke-static {p1, p2, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/feed/data/TopicMoment;IJ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/h80;->l(Ljava/lang/Object;IJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
