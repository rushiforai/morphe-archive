.class public Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/l6c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongAct;",
        "Ll/l6c<",
        "Lcom/p1/mobile/putong/feed/data/Group;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

.field public d:Ll/c6h;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;

.field public h:Ll/hgk;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public X1(Lcom/p1/mobile/putong/feed/data/Group;Lcom/p1/mobile/putong/data/Links;)V
    .locals 1

    .line 1
    new-instance p2, Ll/c6h;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->c:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 4
    .line 5
    invoke-direct {p2, v0, p0}, Ll/c6h;-><init>(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->d:Ll/c6h;

    .line 9
    .line 10
    new-instance v0, Ll/jhk;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Ll/jhk;-><init>(Lcom/p1/mobile/putong/feed/data/Group;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2, v0}, Ll/c6h;->C(Ll/jhk;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->d:Ll/c6h;

    .line 19
    .line 20
    new-instance p2, Ll/q6i;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->g:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;

    .line 23
    .line 24
    invoke-direct {p2, v0}, Ll/q6i;-><init>(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Ll/c6h;->D(Ll/okh;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->d:Ll/c6h;

    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->f:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Ll/c6h;->E(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->d:Ll/c6h;

    .line 38
    .line 39
    invoke-interface {p0}, Ll/u5h;->l()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public Y1(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;->getValue()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;->GROUP_RECOMMEND:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;->getValue()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :goto_0
    const-string v0, "circle_detail_tab"

    .line 17
    .line 18
    invoke-static {v0, p1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    filled-new-array {p1}, [Ll/tfj0$a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p1}, Ll/tfj0;->a([Ll/tfj0$a;)Lorg/json/JSONObject;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->c:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 7
    .line 8
    new-instance p1, Ll/hgk;

    .line 9
    .line 10
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->e:Ljava/lang/String;

    .line 11
    .line 12
    invoke-direct {p1, p0, p2}, Ll/hgk;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->h:Ll/hgk;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ll/a7;->a(Ll/l6c;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->h:Ll/hgk;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/hgk;->previous()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->c:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 26
    .line 27
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "groupId"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->e:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "TopPositionMomentIdAppendInRecommend"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->f:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "jumpToTabValue"

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->g:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->Y1(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_circle_detail"

    .line 2
    .line 3
    return-object p0
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public bridge synthetic z0(Ljava/lang/Object;Lcom/p1/mobile/putong/data/Links;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;->X1(Lcom/p1/mobile/putong/feed/data/Group;Lcom/p1/mobile/putong/data/Links;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
