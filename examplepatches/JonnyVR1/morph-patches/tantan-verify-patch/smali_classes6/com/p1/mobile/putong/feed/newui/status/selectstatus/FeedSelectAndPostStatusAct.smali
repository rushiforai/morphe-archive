.class public Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;
.super Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;
.source "SourceFile"


# instance fields
.field public h:Lcom/p1/mobile/putong/data/Emotion;

.field public i:Lcom/p1/mobile/putong/data/BubbleInfo;

.field public j:Ll/ozh;

.field public k:Ll/izh;

.field public l:Ljava/lang/String;


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

.method public static q2(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static r2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

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
    const-string p0, "from"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static s2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "from"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public static u2(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->q2(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static v2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->s2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public e2()Landroid/graphics/drawable/GradientDrawable;
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->h2()[I

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 6
    .line 7
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 8
    .line 9
    invoke-direct {v0, v1, p0}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 10
    .line 11
    .line 12
    const/high16 p0, 0x42000000    # 32.0f

    .line 13
    .line 14
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    int-to-float v1, v1

    .line 19
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    int-to-float v2, v2

    .line 24
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    int-to-float v3, v3

    .line 29
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    int-to-float p0, p0

    .line 34
    const/16 v4, 0x8

    .line 35
    .line 36
    new-array v4, v4, [F

    .line 37
    .line 38
    const/4 v5, 0x0

    .line 39
    aput v1, v4, v5

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    aput v2, v4, v1

    .line 43
    .line 44
    const/4 v1, 0x2

    .line 45
    aput v3, v4, v1

    .line 46
    .line 47
    const/4 v1, 0x3

    .line 48
    aput p0, v4, v1

    .line 49
    .line 50
    const/4 p0, 0x4

    .line 51
    const/4 v1, 0x0

    .line 52
    aput v1, v4, p0

    .line 53
    .line 54
    const/4 p0, 0x5

    .line 55
    aput v1, v4, p0

    .line 56
    .line 57
    const/4 p0, 0x6

    .line 58
    aput v1, v4, p0

    .line 59
    .line 60
    const/4 p0, 0x7

    .line 61
    aput v1, v4, p0

    .line 62
    .line 63
    invoke-virtual {v0, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 64
    .line 65
    .line 66
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 67
    .line 68
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 69
    .line 70
    .line 71
    return-object v0
.end method

.method public h2()[I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/k9c0;->I:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget v2, Ll/k9c0;->I:I

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget v2, Ll/k9c0;->I:I

    .line 26
    .line 27
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    filled-new-array {v0, v1, p0}, [I

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    new-instance v0, Ll/ozh;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ozh;-><init>(Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->j:Ll/ozh;

    .line 7
    .line 8
    new-instance v0, Ll/izh;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/izh;-><init>(Ll/ner;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->k:Ll/izh;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->j:Ll/ozh;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->k:Ll/izh;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/izh;->Z()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "from"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->l:Ljava/lang/String;

    .line 40
    .line 41
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public m2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->j:Ll/ozh;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/ozh;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->k:Ll/izh;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/izh;->a0()V

    .line 10
    .line 11
    .line 12
    return-object p1
.end method

.method public n2()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->n2()Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string v0, "userState"

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->i:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->j:Ll/ozh;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ll/ozh;->B(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->e2()Landroid/graphics/drawable/GradientDrawable;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->o2(Landroid/graphics/drawable/GradientDrawable;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_set_my_state_post"

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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->i:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

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
