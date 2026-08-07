.class public Ll/d4h;
.super Lcom/p1/mobile/android/app/Act$w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/android/app/Act$w<",
        "Lcom/p1/mobile/putong/app/PutongAct;",
        "Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;",
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
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/d4h;->i(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;)Landroid/animation/Animator;

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
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/d4h;->j(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public i(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;)Landroid/animation/Animator;
    .locals 4

    .line 1
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;->c:Ll/hxg;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hxg;->e()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    sget v1, Ll/hdc0;->o1:I

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lv/a$b;

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Landroid/view/ViewGroup;

    .line 39
    .line 40
    invoke-interface {p0, p1}, Lv/a$b;->l(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    sget-object p1, Ll/gt0;->k:Landroid/util/Property;

    .line 51
    .line 52
    const/16 v0, 0xff

    .line 53
    .line 54
    const/4 v1, 0x0

    .line 55
    filled-new-array {v1, v0}, [I

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {p2, p1, v0}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const-wide/16 v2, 0x90

    .line 64
    .line 65
    invoke-virtual {p1, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const/4 p2, 0x2

    .line 70
    new-array p2, p2, [Landroid/animation/Animator;

    .line 71
    .line 72
    aput-object p0, p2, v1

    .line 73
    .line 74
    const/4 p0, 0x1

    .line 75
    aput-object p1, p2, p0

    .line 76
    .line 77
    invoke-static {p2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_2
    return-object v0
.end method

.method public j(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;)Landroid/animation/Animator;
    .locals 9

    .line 1
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/preview/FeedCommentPhotoPreviewAct;->c:Ll/hxg;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hxg;->e:Landroid/view/View;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    sget v1, Ll/hdc0;->o1:I

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lv/a$b;

    .line 16
    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Landroid/view/ViewGroup;

    .line 37
    .line 38
    invoke-interface {p0, p1}, Lv/a$b;->n(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    if-eqz p2, :cond_2

    .line 51
    .line 52
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    if-eqz p2, :cond_2

    .line 57
    .line 58
    sget-object v2, Ll/gt0;->k:Landroid/util/Property;

    .line 59
    .line 60
    invoke-static {p1}, Ll/oce;->d(Landroid/graphics/drawable/Drawable;)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    const/4 p2, 0x0

    .line 65
    filled-new-array {p1, p2}, [I

    .line 66
    .line 67
    .line 68
    move-result-object v8

    .line 69
    const-wide/16 v3, 0x24

    .line 70
    .line 71
    const-wide/16 v5, 0x90

    .line 72
    .line 73
    const/4 v7, 0x0

    .line 74
    invoke-static/range {v1 .. v8}, Ll/gt0;->m(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[I)Landroid/animation/Animator;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const/4 v0, 0x2

    .line 79
    new-array v0, v0, [Landroid/animation/Animator;

    .line 80
    .line 81
    aput-object p0, v0, p2

    .line 82
    .line 83
    const/4 p0, 0x1

    .line 84
    aput-object p1, v0, p0

    .line 85
    .line 86
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_2
    return-object v0
.end method
