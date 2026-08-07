.class public Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# static fields
.field public static l:Ljava/lang/String;

.field public static m:Z


# instance fields
.field public c:Ll/dg70;

.field public d:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

.field public e:Ll/qai;

.field public f:Ll/lxh;

.field public g:Z

.field public h:I

.field public i:Z

.field public j:Ljava/lang/Runnable;

.field public k:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct$a;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->j:Ljava/lang/Runnable;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic X1(Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->k:Lcom/p1/mobile/putong/feed/data/Moment;

    return-object p0
.end method

.method public static Y1(Landroid/content/Context;Ljava/lang/String;IZ)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    sput-object p1, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->l:Ljava/lang/String;

    .line 9
    .line 10
    const-string p0, "moment_id"

    .line 11
    .line 12
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    const-string p0, "current position"

    .line 16
    .line 17
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    const-string p0, "need draganimation"

    .line 21
    .line 22
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public static Z1(Landroid/content/Context;Ljava/lang/String;IZLjava/lang/String;ZZ)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->Y1(Landroid/content/Context;Ljava/lang/String;IZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "from"

    .line 6
    .line 7
    invoke-virtual {p0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    const-string p1, "canGreeting"

    .line 11
    .line 12
    invoke-virtual {p0, p1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    const-string p1, "start_home_card"

    .line 16
    .line 17
    invoke-virtual {p0, p1, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    return-object p0
.end method

.method public static a2(Landroid/content/Context;Ljava/lang/String;IZLjava/lang/String;ZZI)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->Z1(Landroid/content/Context;Ljava/lang/String;IZLjava/lang/String;ZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "pageType"

    .line 6
    .line 7
    invoke-virtual {p0, p1, p7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method


# virtual methods
.method public final b2()V
    .locals 2

    .line 1
    new-instance v0, Ll/dg70;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dg70;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->c:Ll/dg70;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->a()Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->d(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->b()Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->d:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->c:Ll/dg70;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public c2()Ll/qai;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->e:Ll/qai;

    .line 2
    .line 3
    return-object p0
.end method

.method public d2(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->X3(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    return-object p0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/wf70;->N()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public final e2(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->g2(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "photo"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->h2(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    const-string p0, "video"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    const-string p0, ""

    .line 20
    .line 21
    return-object p0
.end method

.method public finish()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->j:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "PhotoAlbumFeedPreviewAdapter"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, v1}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hasCustomTransition()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    sget v0, Ll/a8c0;->a:I

    .line 32
    .line 33
    sget v1, Ll/a8c0;->b:I

    .line 34
    .line 35
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->e:Ll/qai;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/qai;->i()V

    .line 41
    .line 42
    .line 43
    sget-boolean v0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->m:Z

    .line 44
    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const/4 v1, 0x0

    .line 56
    invoke-interface {v0, v1}, Ll/nam;->f(Z)V

    .line 57
    .line 58
    .line 59
    sput-boolean v1, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->m:Z

    .line 60
    .line 61
    :cond_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->g:Z

    .line 62
    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->c:Ll/dg70;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/dg70;->k0()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->h:I

    .line 72
    .line 73
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->j5(Ljava/lang/String;I)V

    .line 74
    .line 75
    .line 76
    :cond_2
    return-void
.end method

.method public final g2(Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-lez p0, :cond_0

    .line 15
    .line 16
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    return v0
.end method

.method public final h2(Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-lez p0, :cond_0

    .line 15
    .line 16
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    return v0
.end method

.method public i2()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->f:Ll/lxh;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, v0}, Ll/kxh;->a(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->d:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTopViewLayout(Landroid/view/View;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 10

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    sget-boolean v0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->m:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-interface {v0, v1}, Ll/nam;->f(Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    new-instance v0, Ll/qai;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/qai;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->e:Ll/qai;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "moment_id"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->d2(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->k:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 42
    .line 43
    const-string v1, "from"

    .line 44
    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const-string v2, "otherId"

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const-string v2, ""

    .line 66
    .line 67
    invoke-static {v2, v0, v1}, Lcom/p1/mobile/putong/feed/helper/MomentPreviewNullMomentException;->reportNullMoment(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finishWithoutCustomAnimation()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->b2()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->j:Ljava/lang/Runnable;

    .line 78
    .line 79
    const-string v2, "detailTime"

    .line 80
    .line 81
    invoke-static {v2}, Ll/ksg;->I(Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    int-to-long v2, v2

    .line 86
    const-wide/16 v4, 0x3e8

    .line 87
    .line 88
    mul-long/2addr v2, v4

    .line 89
    invoke-static {p0, v0, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    const-string v2, "start_home_card"

    .line 97
    .line 98
    const/4 v3, 0x0

    .line 99
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->i:Z

    .line 104
    .line 105
    new-instance v0, Ll/dg70;

    .line 106
    .line 107
    invoke-direct {v0, p0}, Ll/dg70;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 108
    .line 109
    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->c:Ll/dg70;

    .line 111
    .line 112
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const-string v2, "no_preview_cover"

    .line 117
    .line 118
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_2

    .line 123
    .line 124
    new-instance v0, Ll/c0f;

    .line 125
    .line 126
    invoke-direct {v0}, Ll/c0f;-><init>()V

    .line 127
    .line 128
    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->f:Ll/lxh;

    .line 130
    .line 131
    :goto_0
    move-object v8, p0

    .line 132
    goto :goto_1

    .line 133
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->k:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 134
    .line 135
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->g2(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->k:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 140
    .line 141
    const-string v2, "canGreeting"

    .line 142
    .line 143
    if-eqz v0, :cond_3

    .line 144
    .line 145
    new-instance v0, Ll/ynh;

    .line 146
    .line 147
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    invoke-virtual {v4, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    iget-boolean v3, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->i:Z

    .line 156
    .line 157
    invoke-direct {v0, v5, v2, v3, p0}, Ll/ynh;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;ZZLcom/p1/mobile/android/app/Act;)V

    .line 158
    .line 159
    .line 160
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->f:Ll/lxh;

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_3
    new-instance v4, Ll/jbi;

    .line 164
    .line 165
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 170
    .line 171
    .line 172
    move-result v6

    .line 173
    iget-boolean v7, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->i:Z

    .line 174
    .line 175
    new-instance v9, Ll/nxh;

    .line 176
    .line 177
    invoke-direct {v9}, Ll/nxh;-><init>()V

    .line 178
    .line 179
    .line 180
    move-object v8, p0

    .line 181
    invoke-direct/range {v4 .. v9}, Ll/jbi;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;ZZLcom/p1/mobile/android/app/Act;Ll/mxh;)V

    .line 182
    .line 183
    .line 184
    iput-object v4, v8, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->f:Ll/lxh;

    .line 185
    .line 186
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->a()Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    iget-object v0, v8, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 191
    .line 192
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->d(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    iget-object v0, v8, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->f:Ll/lxh;

    .line 197
    .line 198
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->c(Ll/kxh;)Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    iget-object v0, v8, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->f:Ll/lxh;

    .line 203
    .line 204
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->f(Ll/jxh;)Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->b()Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    iput-object p0, v8, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->d:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 213
    .line 214
    iget-object v0, v8, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->c:Ll/dg70;

    .line 215
    .line 216
    iget-object v2, v8, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->k:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 217
    .line 218
    iput-object v2, v0, Ll/dg70;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 219
    .line 220
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 221
    .line 222
    .line 223
    iget-object p0, v8, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->d:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 224
    .line 225
    invoke-virtual {v8}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->j:Ljava/lang/String;

    .line 234
    .line 235
    iget-object p0, v8, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->k:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 236
    .line 237
    invoke-virtual {v8, p0}, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->e2(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    iget-object v0, v8, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->k:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 242
    .line 243
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 244
    .line 245
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 246
    .line 247
    invoke-virtual {v8, p0, v1, v0}, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->l2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    return-void
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->c:Ll/dg70;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->c:Ll/dg70;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/dg70;->a0()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public k2()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/k9c0;->o0:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/high16 v1, -0x1000000

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->dimStatusBar(Z)V

    .line 29
    .line 30
    .line 31
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 32
    .line 33
    const/16 v1, 0x1a

    .line 34
    .line 35
    if-lt v0, v1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    or-int/lit8 v0, v0, 0x10

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 60
    .line 61
    .line 62
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hasCustomTransition()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    sget v0, Ll/a8c0;->c:I

    .line 69
    .line 70
    sget v1, Ll/a8c0;->d:I

    .line 71
    .line 72
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void
.end method

.method public l2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "moment_type"

    .line 4
    .line 5
    invoke-static {v1, p1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v1, "moment_id"

    .line 10
    .line 11
    invoke-static {v1, p2}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    const-string v1, "owner_id"

    .line 16
    .line 17
    invoke-static {v1, p3}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v1, "from"

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v1, "moment_showfrom"

    .line 36
    .line 37
    invoke-static {v1, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    filled-new-array {p1, p2, p3, p0}, [Ll/tfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Ll/tfj0;->a([Ll/tfj0$a;)Lorg/json/JSONObject;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->d:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->d:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->q()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_moment_preview"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->k2()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "pageType"

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->h:I

    .line 16
    .line 17
    invoke-static {v0}, Ll/ksg;->k0(I)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->g:Z

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->c:Ll/dg70;

    .line 24
    .line 25
    const-string v0, "current position"

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const-string v2, "need draganimation"

    .line 33
    .line 34
    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-virtual {p0, v0, p1}, Ll/dg70;->p0(IZ)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public trackedArgs()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->c:Ll/dg70;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dg70;->q0()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
