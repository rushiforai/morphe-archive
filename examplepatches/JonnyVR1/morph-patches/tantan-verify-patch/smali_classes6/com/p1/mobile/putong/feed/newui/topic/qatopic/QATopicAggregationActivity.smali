.class public Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Ll/fub0;

.field public d:Ll/pub0;

.field public e:Lorg/json/JSONObject;


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

.method public static X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "topic_id"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "from"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const/high16 p0, 0x4000000

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public static Y1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "single_topic_moment"

    .line 6
    .line 7
    invoke-virtual {p0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method


# virtual methods
.method public Z1()Lorg/json/JSONObject;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;->e:Lorg/json/JSONObject;

    .line 2
    .line 3
    return-object p0
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public finish()V
    .locals 1

    .line 1
    invoke-static {}, Ll/l6i;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "moment"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0}, Ll/orb0;->g(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;->d:Ll/pub0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/pub0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    new-instance v0, Ll/pub0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pub0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;->d:Ll/pub0;

    .line 7
    .line 8
    new-instance v0, Ll/fub0;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/fub0;-><init>(Ll/ner;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;->c:Ll/fub0;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;->d:Ll/pub0;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;->c:Ll/fub0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/fub0;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x1020002

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/android/app/Frag;

    .line 13
    .line 14
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumFeedFrag;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumFeedFrag;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumFeedFrag;->o()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onPauseLifecycle()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->u(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onPauseLifecycle()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_topic_detail"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;->c:Ll/fub0;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/fub0;->g0()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-string v0, "topic_detail_source"

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v0, "topic_type"

    .line 17
    .line 18
    const-string v1, "qa"

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;->c:Ll/fub0;

    .line 25
    .line 26
    iget-object v1, v1, Ll/fub0;->b:Ljava/lang/String;

    .line 27
    .line 28
    const-string v2, "topic_id"

    .line 29
    .line 30
    invoke-static {v2, v1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    filled-new-array {p1, v0, v1}, [Ll/tfj0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1}, Ll/tfj0;->a([Ll/tfj0$a;)Lorg/json/JSONObject;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;->e:Lorg/json/JSONObject;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method
