.class public Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaInputAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


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

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->E()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaInputAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaInputAct;->b2()V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaInputAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaInputAct;->a2()V

    return-void
.end method

.method private synthetic a2()V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {p0, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final synthetic b2()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    sget p0, Ll/tec0;->R2:I

    .line 2
    .line 3
    invoke-virtual {p1, p0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onResumeLifecycle()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onResumeLifecycle()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/hdc0;->w0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "from"

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedAbstractInputMomentTextToJoinTopicView;->setFrom(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Ll/txh;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/txh;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaInputAct;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedAbstractInputMomentTextToJoinTopicView;->setSendSuccess(Ll/x20;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/uxh;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/uxh;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaInputAct;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedAbstractInputMomentTextToJoinTopicView;->setCloseAction(Ll/x20;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "topicMoment"

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedAbstractInputMomentTextToJoinTopicView;->setTopicMoment(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 54
    .line 55
    .line 56
    new-instance v1, Ll/vxh;

    .line 57
    .line 58
    invoke-direct {v1, v0}, Ll/vxh;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;)V

    .line 59
    .line 60
    .line 61
    const-wide/16 v2, 0x190

    .line 62
    .line 63
    invoke-virtual {p0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
