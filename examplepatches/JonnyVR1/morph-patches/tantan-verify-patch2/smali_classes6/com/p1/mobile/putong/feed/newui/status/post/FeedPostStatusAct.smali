.class public Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;
.super Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;
.source "SourceFile"


# instance fields
.field public h:Ll/cxh;

.field public i:Ll/lwh;

.field public j:Lcom/p1/mobile/putong/data/Emotion;

.field public k:Lcom/p1/mobile/putong/data/BubbleInfo;

.field public l:Z

.field public m:Ljava/lang/String;


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

.method public static synthetic q2(Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->w2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static r2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const/high16 p0, 0x24000000

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "userState"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "from"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public static s2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Emotion;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const/high16 p0, 0x24000000

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "emotion"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static u2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Emotion;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->s2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Emotion;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "from"

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public static v2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)Landroid/content/Intent;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const/high16 p0, 0x24000000

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "my_states"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method private synthetic w2(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->h:Ll/cxh;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->h:Ll/cxh;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/cxh;->R()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public d2()I
    .locals 0

    .line 1
    const-string p0, "#cc000000"

    .line 2
    .line 3
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e2()Landroid/graphics/drawable/GradientDrawable;
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->h2()[I

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->j:Lcom/p1/mobile/putong/data/Emotion;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->j:Lcom/p1/mobile/putong/data/Emotion;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    new-array v0, v0, [I

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->j:Lcom/p1/mobile/putong/data/Emotion;

    .line 26
    .line 27
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-ge v1, v2, :cond_1

    .line 34
    .line 35
    :try_start_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->j:Lcom/p1/mobile/putong/data/Emotion;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :catch_0
    move-exception v2

    .line 53
    const-string v3, "#ffffff"

    .line 54
    .line 55
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    aput v3, v0, v1

    .line 60
    .line 61
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    return-object v0

    .line 68
    :cond_2
    :goto_2
    const/4 p0, 0x0

    .line 69
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    new-instance v0, Ll/cxh;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cxh;-><init>(Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->h:Ll/cxh;

    .line 7
    .line 8
    new-instance v0, Ll/lwh;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/lwh;-><init>(Ll/ner;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->i:Ll/lwh;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->h:Ll/cxh;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->i:Ll/lwh;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/lwh;->Z()V

    .line 23
    .line 24
    .line 25
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "from"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->m:Ljava/lang/String;

    .line 43
    .line 44
    const-string v1, "onlinematch"

    .line 45
    .line 46
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 51
    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    const-string v0, "quickchat"

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    const-string v0, "moment"

    .line 58
    .line 59
    :goto_0
    const-string v1, "where_show_from"

    .line 60
    .line 61
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    filled-new-array {v0}, [Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p0, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/iwh;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/iwh;-><init>(Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public m2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->h:Ll/cxh;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/cxh;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x2724

    .line 5
    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    if-ne p2, p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->i:Ll/lwh;

    .line 12
    .line 13
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p1, p2}, Ll/lwh;->h0(Landroid/os/Bundle;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->h:Ll/cxh;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/cxh;->Y()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    if-nez p3, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Ljava/util/ArrayList;

    .line 36
    .line 37
    const/4 p2, 0x0

    .line 38
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    instance-of p2, p2, Lcom/p1/mobile/putong/data/Video;

    .line 43
    .line 44
    if-eqz p2, :cond_2

    .line 45
    .line 46
    :goto_0
    return-void

    .line 47
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->h:Ll/cxh;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/cxh;->U(Ljava/util/ArrayList;)V

    .line 50
    .line 51
    .line 52
    return-void
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
    if-eqz v0, :cond_3

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->l:Z

    .line 12
    .line 13
    const-string v0, "my_states"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ljava/util/ArrayList;

    .line 30
    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->h:Ll/cxh;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ll/cxh;->U(Ljava/util/ArrayList;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    const-string v0, "emotion"

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lcom/p1/mobile/putong/data/Emotion;

    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->j:Lcom/p1/mobile/putong/data/Emotion;

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->h:Ll/cxh;

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Ll/cxh;->T(Lcom/p1/mobile/putong/data/Emotion;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->h:Ll/cxh;

    .line 71
    .line 72
    iget-object v0, v0, Ll/cxh;->v:Lcom/p1/mobile/putong/data/Media;

    .line 73
    .line 74
    if-nez v0, :cond_2

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->e2()Landroid/graphics/drawable/GradientDrawable;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->o2(Landroid/graphics/drawable/GradientDrawable;)V

    .line 81
    .line 82
    .line 83
    :cond_2
    const-string v0, "userState"

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_3

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 100
    .line 101
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->k:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->h:Ll/cxh;

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Ll/cxh;->V(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 106
    .line 107
    .line 108
    :cond_3
    :goto_0
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
    const-string v0, "emotion"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/p1/mobile/putong/data/Emotion;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->j:Lcom/p1/mobile/putong/data/Emotion;

    .line 17
    .line 18
    const-string v0, "userState"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->k:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 37
    .line 38
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->j:Lcom/p1/mobile/putong/data/Emotion;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 45
    .line 46
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 47
    .line 48
    const/4 p1, 0x1

    .line 49
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->l:Z

    .line 50
    .line 51
    :cond_0
    return-void
.end method
