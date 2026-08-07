.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$c;
    }
.end annotation


# instance fields
.field public c:Lv/VPager;

.field public d:Lv/navigationbar/VNavigationBar;

.field public e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

.field public g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public h:Lcom/p1/mobile/putong/data/Media;

.field public i:I

.field public j:Z

.field public k:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$c;


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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->e:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->f:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->g:Ljava/util/ArrayList;

    .line 24
    .line 25
    const/4 v0, -0x1

    .line 26
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->i:I

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->j:Z

    .line 30
    .line 31
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->lambda$initSubscription$0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->g2(Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static bridge synthetic Z1(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->e:Ljava/util/ArrayList;

    return-object p0
.end method

.method public static bridge synthetic a2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->j:Z

    return p0
.end method

.method public static bridge synthetic b2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->j:Z

    return-void
.end method

.method public static bridge synthetic c2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->i2(Landroid/view/View;Z)V

    return-void
.end method

.method public static bridge synthetic d2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->m2(Landroid/view/View;Z)V

    return-void
.end method

.method public static h2(Landroid/content/Context;Lcom/p1/mobile/putong/data/Media;Ljava/util/ArrayList;)Landroid/content/Intent;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/p1/mobile/putong/data/Media;",
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
    const-class v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "selectedMedia"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "selectedImages"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method private l2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->e:Ljava/util/ArrayList;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->f:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->clearAllSelectedMedia()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->f:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->g:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->addAllSelectedMedia(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->g:Ljava/util/ArrayList;

    .line 33
    .line 34
    new-instance v1, Ll/mo20;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/mo20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->e:Ljava/util/ArrayList;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->h:Lcom/p1/mobile/putong/data/Media;

    .line 45
    .line 46
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->k2(Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Media;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->i:I

    .line 51
    .line 52
    return-void
.end method

.method private synthetic lambda$initSubscription$0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ll/c30;->m()V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->l2()V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->r()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private r()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$c;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->k:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$c;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->c:Lv/VPager;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->k:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$c;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/cf60;->notifyDataSetChanged()V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->i:I

    .line 19
    .line 20
    if-lez v0, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->c:Lv/VPager;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->d:Lv/navigationbar/VNavigationBar;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->d:Lv/navigationbar/VNavigationBar;

    .line 33
    .line 34
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/view/View;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    sget v2, Ll/k9c0;->d:I

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->d:Lv/navigationbar/VNavigationBar;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    sget v1, Ll/lbc0;->m6:I

    .line 64
    .line 65
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v0, p0}, Lv/navigationbar/VNavigationBar;->setLeftIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method


# virtual methods
.method public e2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/no20;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final g2(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->e:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final i2(Landroid/view/View;Z)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x2

    .line 4
    const/4 v3, 0x0

    .line 5
    const-string v4, "translationY"

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    neg-int p2, p2

    .line 14
    int-to-float p2, p2

    .line 15
    new-array v2, v2, [F

    .line 16
    .line 17
    aput v3, v2, v1

    .line 18
    .line 19
    aput p2, v2, v0

    .line 20
    .line 21
    invoke-static {p1, v4, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    int-to-float p2, p2

    .line 31
    new-array v2, v2, [F

    .line 32
    .line 33
    aput v3, v2, v1

    .line 34
    .line 35
    aput p2, v2, v0

    .line 36
    .line 37
    invoke-static {p1, v4, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    :goto_0
    const-wide/16 v0, 0xfa

    .line 42
    .line 43
    invoke-virtual {p2, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$b;

    .line 47
    .line 48
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$b;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2}, Landroid/animation/ObjectAnimator;->start()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->e2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/lo20;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/lo20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public k2(Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Media;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Lcom/p1/mobile/putong/data/Media;",
            ")I"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p2, :cond_1

    .line 3
    .line 4
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-ge p0, p2, :cond_3

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    if-nez p2, :cond_0

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    :goto_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-ge p0, v0, :cond_3

    .line 25
    .line 26
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    return p0

    .line 43
    :cond_2
    add-int/lit8 p0, p0, 0x1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_3
    const/4 p0, -0x1

    .line 47
    return p0
.end method

.method public final m2(Landroid/view/View;Z)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x2

    .line 4
    const/4 v3, 0x0

    .line 5
    const-string v4, "translationY"

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    neg-int p2, p2

    .line 14
    int-to-float p2, p2

    .line 15
    new-array v2, v2, [F

    .line 16
    .line 17
    aput p2, v2, v1

    .line 18
    .line 19
    aput v3, v2, v0

    .line 20
    .line 21
    invoke-static {p1, v4, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    int-to-float p2, p2

    .line 31
    new-array v2, v2, [F

    .line 32
    .line 33
    aput p2, v2, v1

    .line 34
    .line 35
    aput v3, v2, v0

    .line 36
    .line 37
    invoke-static {p1, v4, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    :goto_0
    const-wide/16 v0, 0xfa

    .line 42
    .line 43
    invoke-virtual {p2, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$a;

    .line 47
    .line 48
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$a;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2}, Landroid/animation/ObjectAnimator;->start()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "selectedMedia"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->h:Lcom/p1/mobile/putong/data/Media;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "selectedImages"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ljava/util/ArrayList;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->g:Ljava/util/ArrayList;

    .line 38
    .line 39
    :cond_0
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public shouldSwitchToGradientColoredStatusBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public shouldWrapContentViewWithTransparentHeader()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
