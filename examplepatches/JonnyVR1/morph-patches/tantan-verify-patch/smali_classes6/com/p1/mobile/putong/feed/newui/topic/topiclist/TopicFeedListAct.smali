.class public Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Ll/u8j0;

.field public d:Ll/s8j0;

.field public e:Landroid/view/MenuItem;

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/MenuItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/f8j0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/f8j0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;)V

    .line 7
    .line 8
    .line 9
    const/16 v1, 0x1f4

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;->f:Ll/y20;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;->a2(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;Landroid/view/MenuItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;->Z1(Landroid/view/MenuItem;)V

    return-void
.end method

.method private synthetic a2(Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;->f:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method private b2(Landroid/view/MenuItem;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    new-instance p1, Landroid/content/Intent;

    .line 10
    .line 11
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v1, Landroid/os/Bundle;

    .line 15
    .line 16
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;->d:Ll/s8j0;

    .line 20
    .line 21
    iget-object v2, v2, Ll/s8j0;->a:Ljava/util/ArrayList;

    .line 22
    .line 23
    const-string v3, "extra_topics"

    .line 24
    .line 25
    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    const/4 v1, -0x1

    .line 32
    invoke-virtual {p0, v1, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 36
    .line 37
    .line 38
    return v0
.end method


# virtual methods
.method public final synthetic Z1(Landroid/view/MenuItem;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;->b2(Landroid/view/MenuItem;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;->c:Ll/u8j0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/u8j0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    new-instance v0, Ll/u8j0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/u8j0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;->c:Ll/u8j0;

    .line 7
    .line 8
    new-instance v0, Ll/s8j0;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/s8j0;-><init>(Ll/ner;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;->d:Ll/s8j0;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;->c:Ll/u8j0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;->d:Ll/s8j0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/s8j0;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->i:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->actionItemPadding(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {p1, v0}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Ll/e8j0;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/e8j0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;->e:Landroid/view/MenuItem;

    .line 27
    .line 28
    const/4 v0, 0x2

    .line 29
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 30
    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/jka;->Pb()Ll/jfh;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {p1, p0}, Ll/jfh;->l(Lcom/p1/mobile/android/app/Act;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_pick_topic"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicFeedListAct;->d:Ll/s8j0;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Ll/s8j0;->A0(Landroid/os/Bundle;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
