.class public Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VDraweeView;

.field public e:Landroid/view/TextureView;

.field public f:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/ImageView;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;

.field public k:Lv/navigationbar/VNavigationBar;

.field public l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public m:Lcom/p1/mobile/android/media/gltransition/TransitionEngine;

.field public n:Ll/del0;

.field public o:Ljava/lang/String;

.field public p:Z

.field public q:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

.field public r:Landroid/graphics/drawable/ClipDrawable;

.field public s:I

.field public t:Lrx/subjects/a;

.field public u:Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->l:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine;->create(Ll/ker;)Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->m:Lcom/p1/mobile/android/media/gltransition/TransitionEngine;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->p:Z

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->s:I

    .line 22
    .line 23
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->t:Lrx/subjects/a;

    .line 28
    .line 29
    new-instance v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity$a;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity$a;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->u:Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;

    .line 35
    .line 36
    return-void
.end method

.method public static synthetic X1(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/RuntimeException;

    .line 2
    .line 3
    const-string v1, "handleVideoExportComplete error"

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->v2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->s2()V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->u2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->y2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->r2(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic d2(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/RuntimeException;

    .line 2
    .line 3
    const-string v1, "startTransitionProcess Error"

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private destroy()V
    .locals 0

    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/data/Music;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ol(Lcom/p1/mobile/putong/data/Music;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic g2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->w2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    return-void
.end method

.method public static synthetic i2(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->lambda$initSubscription$0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic k2(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;Ljava/lang/Long;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->z2(Ljava/lang/Long;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic l2(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;)Lrx/subjects/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->t:Lrx/subjects/a;

    return-object p0
.end method

.method private synthetic lambda$initSubscription$0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->r()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->q2()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static bridge synthetic m2(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->E2(F)V

    return-void
.end method

.method public static o2(Landroid/content/Context;Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/data/RankingTopic;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/RankingTopic;",
            "Ljava/lang/String;",
            ")",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Landroid/os/Bundle;

    .line 9
    .line 10
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "extra_key_image_list"

    .line 14
    .line 15
    invoke-virtual {p0, v1, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 16
    .line 17
    .line 18
    const-string p1, "extra_key_ranking_topic"

    .line 19
    .line 20
    invoke-virtual {p0, p1, p2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 21
    .line 22
    .line 23
    const-string p1, "extra_key_from"

    .line 24
    .line 25
    invoke-virtual {p0, p1, p3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    return-object v0
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->k:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Ll/c9c0;->V1:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/dbc0;->e0:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->k:Lv/navigationbar/VNavigationBar;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->k:Lv/navigationbar/VNavigationBar;

    .line 36
    .line 37
    new-instance v1, Ll/e9m;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/e9m;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->k:Lv/navigationbar/VNavigationBar;

    .line 46
    .line 47
    const/4 v1, 0x1

    .line 48
    new-array v1, v1, [Landroid/view/View;

    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    aput-object v0, v1, v2

    .line 52
    .line 53
    invoke-static {v1}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->l:Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_0

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->l:Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 71
    .line 72
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->d:Lv/VDraweeView;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v1, p0, v0}, Ll/fsb0;->i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_0
    return-void
.end method

.method private synthetic s2()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic u2(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->D2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic v2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final A2(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-object p0
.end method

.method public final B2(Ljava/lang/Long;)Lkotlin/Unit;
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    div-long/2addr v0, v2

    .line 8
    long-to-int p1, v0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ni(I)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Ll/h9m;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/h9m;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/x8m;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/x8m;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Ll/y8m;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/y8m;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 44
    .line 45
    return-object p0
.end method

.method public final C2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->q:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->m:Lcom/p1/mobile/android/media/gltransition/TransitionEngine;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->o:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->u:Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;

    .line 8
    .line 9
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine;->exportVideo(Ljava/lang/String;Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final D2()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->p:Z

    .line 8
    .line 9
    sget-object v0, Ll/del0;->Companion:Ll/del0$a;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/del0$a;->b()Ll/del0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->n:Ll/del0;

    .line 16
    .line 17
    const-string v0, "i2v.mp4"

    .line 18
    .line 19
    invoke-static {v0}, Ll/ecj;->O(Ljava/lang/String;)Ljava/io/File;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->o:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->l:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->m:Lcom/p1/mobile/android/media/gltransition/TransitionEngine;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->l:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->A2(Ljava/util/List;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->n:Ll/del0;

    .line 46
    .line 47
    new-instance v3, Ll/d9m;

    .line 48
    .line 49
    invoke-direct {v3, p0}, Ll/d9m;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine;->loadImageFromPath(Ljava/util/List;Ll/del0;Lkotlin/jvm/functions/Function1;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    return-void
.end method

.method public final E2(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->r:Landroid/graphics/drawable/ClipDrawable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->h:Landroid/widget/ImageView;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/graphics/drawable/ClipDrawable;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->r:Landroid/graphics/drawable/ClipDrawable;

    .line 14
    .line 15
    :cond_0
    const/high16 v0, 0x42c80000    # 100.0f

    .line 16
    .line 17
    mul-float/2addr p1, v0

    .line 18
    float-to-int p1, p1

    .line 19
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->s:I

    .line 20
    .line 21
    if-le p1, v0, :cond_1

    .line 22
    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->s:I

    .line 24
    .line 25
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->r:Landroid/graphics/drawable/ClipDrawable;

    .line 26
    .line 27
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->s:I

    .line 28
    .line 29
    mul-int/lit8 v0, v0, 0x64

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->i:Landroid/widget/TextView;

    .line 35
    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->s:I

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p0, "%"

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->n2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const-string v1, "extra_key_image_list"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    instance-of v1, v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->l:Ljava/util/ArrayList;

    .line 25
    .line 26
    check-cast v0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/w8m;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/w8m;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/z8m;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/z8m;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/a9m;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/a9m;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/b9m;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/b9m;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;)V

    .line 33
    .line 34
    .line 35
    new-instance p0, Ll/c9m;

    .line 36
    .line 37
    invoke-direct {p0}, Ll/c9m;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public n2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/j9m;->b(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->m:Lcom/p1/mobile/android/media/gltransition/TransitionEngine;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine;->cancel()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final p2(Ljava/lang/String;)Landroid/os/Bundle;
    .locals 2

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "extra_key_video_path"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v1, "extra_key_from"

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    const-string p1, ""

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    :goto_0
    invoke-virtual {v0, v1, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->q:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 34
    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    const-string p1, "extra_key_music_content"

    .line 38
    .line 39
    invoke-virtual {v0, p1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-object v0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    sget v0, Ll/c9c0;->b:I

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setNavigationBarColor(I)V

    .line 16
    .line 17
    .line 18
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 19
    .line 20
    const/16 v0, 0x1a

    .line 21
    .line 22
    if-lt p1, v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getSystemUiVisibility()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    and-int/lit8 p1, p1, -0x11

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public final q2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->t:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/f9m;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/f9m;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/g9m;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/g9m;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1, p0}, Lrx/c;->subscribe(Ll/y20;Ll/y20;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic r2(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->o:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->o:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->p2(Ljava/lang/String;)Landroid/os/Bundle;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    if-nez v2, :cond_1

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const-string v3, "extra_key_ranking_topic"

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Lcom/p1/mobile/putong/core/data/RankingTopic;

    .line 43
    .line 44
    :goto_0
    invoke-interface {p1, v0, v1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->oa(Lcom/p1/mobile/android/app/Act;Landroid/os/Bundle;Lcom/tantanapp/common/data/ValueObject;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final synthetic w2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->C2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic y2(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->C2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 3
    .line 4
    .line 5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 6
    .line 7
    const-string v0, "Get default music Error"

    .line 8
    .line 9
    invoke-direct {p0, v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic z2(Ljava/lang/Long;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVVideoComposerActivity;->B2(Ljava/lang/Long;)Lkotlin/Unit;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
