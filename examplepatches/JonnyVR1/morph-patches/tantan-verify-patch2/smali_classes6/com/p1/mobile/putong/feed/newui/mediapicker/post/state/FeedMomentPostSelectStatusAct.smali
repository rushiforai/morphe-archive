.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;
.super Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;
.source "SourceFile"


# instance fields
.field public h:Lcom/p1/mobile/putong/data/Emotion;

.field public i:Lcom/p1/mobile/putong/data/BubbleInfo;

.field public j:Ll/chh;

.field public k:Ll/ygh;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static q2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/BubbleInfo;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "userState"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method


# virtual methods
.method public initDataOnCreate()V
    .locals 2

    .line 1
    new-instance v0, Ll/chh;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/chh;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->j:Ll/chh;

    .line 7
    .line 8
    new-instance v0, Ll/ygh;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/ygh;-><init>(Ll/ner;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->k:Ll/ygh;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->j:Ll/chh;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->k:Ll/ygh;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/ygh;->Z()V

    .line 23
    .line 24
    .line 25
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public m2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->j:Ll/chh;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/chh;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->k:Ll/ygh;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ygh;->a0()V

    .line 10
    .line 11
    .line 12
    return-object p1
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_moment_fast_state_post"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "userState"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->i:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 31
    .line 32
    iget-object p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 35
    .line 36
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 37
    .line 38
    :cond_0
    return-void
.end method
