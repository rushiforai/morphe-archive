.class public Lcom/p1/mobile/putong/feed/newui/dialog/FeedPostBaseDialogAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Landroid/widget/RelativeLayout;

.field public d:Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;


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

.method public static synthetic X1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/feed/newui/dialog/FeedPostBaseDialogAct;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/dialog/FeedPostBaseDialogAct;->b2(Ll/uxj0;)V

    return-void
.end method

.method public static a2(Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/dialog/FeedPostBaseDialogAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "extra_postBasePopWindow"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method


# virtual methods
.method public Z1(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/gth;->b(Lcom/p1/mobile/putong/feed/newui/dialog/FeedPostBaseDialogAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic b2(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/dialog/FeedPostBaseDialogAct;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public finish()V
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {v0}, Ll/kth;->f(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    sget v2, Ll/a8c0;->h:I

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 14
    .line 15
    .line 16
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/dialog/FeedPostBaseDialogAct;->Z1(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->h:Ll/cu9;

    .line 6
    .line 7
    iget-object p2, p2, Ll/cu9;->O:Lrx/subjects/b;

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/eth;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/eth;-><init>(Lcom/p1/mobile/putong/feed/newui/dialog/FeedPostBaseDialogAct;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/fth;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/fth;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-object p1
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_moment_post_guide_pop"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "extra_postBasePopWindow"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/dialog/FeedPostBaseDialogAct;->d:Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->param:Lcom/p1/mobile/putong/feed/data/BuryingPointParam;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/BuryingPointParam;->guideFrom:Ljava/lang/String;

    .line 22
    .line 23
    const-string v2, "guide_from"

    .line 24
    .line 25
    invoke-static {v2, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    filled-new-array {v0}, [Ll/tfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ll/tfj0;->a([Ll/tfj0$a;)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 38
    .line 39
    .line 40
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
