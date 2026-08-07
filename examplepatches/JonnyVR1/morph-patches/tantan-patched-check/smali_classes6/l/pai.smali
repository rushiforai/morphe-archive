.class public Ll/pai;
.super Lcom/p1/mobile/android/app/Act$w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/android/app/Act$w<",
        "Lcom/p1/mobile/putong/app/PutongAct;",
        "Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act$w;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic c(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/pai;->i(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic d(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/pai;->j(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public i(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;)Landroid/animation/Animator;
    .locals 5

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->b2()Ll/wai;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/wai;->l()Ll/gai;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Ll/gai;->k:Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return-object v1

    .line 15
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->getViewModel()Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->b:Lv/VPager;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    return-object v1

    .line 33
    :cond_1
    sget v3, Ll/hdc0;->o1:I

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lv/a$b;

    .line 40
    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    return-object v1

    .line 44
    :cond_2
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Landroid/view/ViewGroup;

    .line 61
    .line 62
    invoke-interface {v0, p1}, Lv/a$b;->l(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    sget-object v0, Ll/gt0;->k:Landroid/util/Property;

    .line 73
    .line 74
    const/16 v1, 0xff

    .line 75
    .line 76
    filled-new-array {v2, v1}, [I

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-static {v3, v0, v1}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    const-wide/16 v3, 0x90

    .line 85
    .line 86
    invoke-virtual {v0, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    const/4 v1, 0x2

    .line 91
    new-array v1, v1, [Landroid/animation/Animator;

    .line 92
    .line 93
    aput-object p1, v1, v2

    .line 94
    .line 95
    const/4 p1, 0x1

    .line 96
    aput-object v0, v1, p1

    .line 97
    .line 98
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    new-instance v0, Ll/pai$a;

    .line 103
    .line 104
    invoke-direct {v0, p0, p2}, Ll/pai$a;-><init>(Ll/pai;Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 108
    .line 109
    .line 110
    return-object p1

    .line 111
    :cond_3
    return-object v1
.end method

.method public j(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;)Landroid/animation/Animator;
    .locals 10

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->b2()Ll/wai;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/wai;->l()Ll/gai;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Ll/gai;->k:Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->getViewModel()Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->b:Lv/VPager;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {p0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    return-object v0

    .line 33
    :cond_1
    sget v2, Ll/hdc0;->o1:I

    .line 34
    .line 35
    invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Lv/a$b;

    .line 40
    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    return-object v0

    .line 44
    :cond_2
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Landroid/view/ViewGroup;

    .line 61
    .line 62
    invoke-interface {p0, p1}, Lv/a$b;->n(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_3

    .line 71
    .line 72
    sget-object v3, Ll/gt0;->k:Landroid/util/Property;

    .line 73
    .line 74
    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-static {p1}, Ll/oce;->d(Landroid/graphics/drawable/Drawable;)I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    filled-new-array {p1, v1}, [I

    .line 83
    .line 84
    .line 85
    move-result-object v9

    .line 86
    const-wide/16 v4, 0x24

    .line 87
    .line 88
    const-wide/16 v6, 0x90

    .line 89
    .line 90
    const/4 v8, 0x0

    .line 91
    invoke-static/range {v2 .. v9}, Ll/gt0;->m(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[I)Landroid/animation/Animator;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    const/4 p2, 0x2

    .line 96
    new-array p2, p2, [Landroid/animation/Animator;

    .line 97
    .line 98
    aput-object p0, p2, v1

    .line 99
    .line 100
    const/4 p0, 0x1

    .line 101
    aput-object p1, p2, p0

    .line 102
    .line 103
    invoke-static {p2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    return-object p0

    .line 108
    :cond_3
    return-object v0
.end method
