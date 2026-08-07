.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/bi70;


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VImage;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public h:Ljava/lang/String;

.field public i:I

.field public j:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->o(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->o(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->o(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;ILl/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->r(ILl/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    const-string v0, "personality"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string v0, "suggestion_reason"

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const-string v0, "games"

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static synthetic f(Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    const-string v0, "personality"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string v0, "suggestion_reason"

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const-string v0, "games"

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->q(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method private j(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->h:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1, v0}, Ll/bi70;->b(ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private o(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 13
    .line 14
    const/high16 v0, 0x41800000    # 16.0f

    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/ezq;->b(Landroid/view/View;F)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/bnl0;->y0()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    const/high16 v0, 0x41c00000    # 24.0f

    .line 24
    .line 25
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    sub-int/2addr p1, v0

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    new-array v0, v0, [Landroid/view/View;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    aput-object p0, v0, v1

    .line 37
    .line 38
    invoke-static {p1, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private s()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Tag;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 12
    .line 13
    new-instance v0, Ll/yh70;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/yh70;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method


# virtual methods
.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public getEntranceType()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "card"

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ai70;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->i:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->h:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, v0, v1}, Ll/bi70;->n(ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p0, v0}, Ll/bi70;->c(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "p_interactcell_detail"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->h:Ljava/lang/String;

    .line 19
    .line 20
    invoke-interface {p0, p1, v0}, Ll/bi70;->n(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final p(Landroid/view/View;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    new-instance v0, Ll/xh70;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/xh70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->w(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r(ILl/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->j(I)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-interface {p2}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance p2, Landroid/content/Intent;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {}, Ll/cmg;->j0()Z

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    if-eqz p3, :cond_1

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-interface {p3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Jn()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const-class p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;

    .line 39
    .line 40
    :goto_0
    invoke-direct {p2, p0, p3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 41
    .line 42
    .line 43
    sget p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->i:I

    .line 44
    .line 45
    invoke-virtual {p1, p2, p0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public setInteractionType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final t()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Tag;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->j:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 6
    .line 7
    new-instance v0, Ll/zh70;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/zh70;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public u(Lcom/p1/mobile/putong/data/User;ILl/x20;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->j:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->i:I

    .line 4
    .line 5
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->b:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/high16 v3, 0x42a20000    # 81.0f

    .line 14
    .line 15
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/data/Picture;->profileSize(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-virtual {v0, v1, v2, v3}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->c:Landroid/widget/TextView;

    .line 28
    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v2, "\u4e2a\u5bf9\u4f60\u611f\u5174\u8da3\u7684\u4eba"

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p1}, Ll/mrb0;->w(Lcom/p1/mobile/putong/data/User;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const-string v1, ""

    .line 54
    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_0

    .line 68
    .line 69
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Location;->isHideRegionCity()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_0

    .line 76
    .line 77
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    move-object v0, v1

    .line 85
    :goto_0
    invoke-static {p1}, Ll/mrb0;->v(Lcom/p1/mobile/putong/data/User;)Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-nez v2, :cond_1

    .line 90
    .line 91
    new-instance v1, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    const-string v2, "\u2022"

    .line 94
    .line 95
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 99
    .line 100
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 104
    .line 105
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->S4:I

    .line 106
    .line 107
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    :cond_1
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 119
    .line 120
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->e:Landroid/widget/TextView;

    .line 121
    .line 122
    const-string v4, "%s %s%s"

    .line 123
    .line 124
    filled-new-array {v2, v0, v1}, [Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-static {v4, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->v()V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->b:Lv/VDraweeView;

    .line 139
    .line 140
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->p(Landroid/view/View;Lcom/p1/mobile/putong/data/User;)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->d:Lv/VImage;

    .line 144
    .line 145
    new-instance v0, Ll/uh70;

    .line 146
    .line 147
    invoke-direct {v0, p3}, Ll/uh70;-><init>(Ll/x20;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 151
    .line 152
    .line 153
    new-instance p1, Ll/vh70;

    .line 154
    .line 155
    invoke-direct {p1, p0, p2, p3}, Ll/vh70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;ILl/x20;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public v()V
    .locals 10

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->s()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->t()Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    new-instance v2, Ll/c2b0;

    .line 13
    .line 14
    invoke-direct {v2, v0}, Ll/c2b0;-><init>(Ljava/util/ArrayList;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    new-instance v3, Ll/wh70;

    .line 22
    .line 23
    invoke-direct {v3, v0}, Ll/wh70;-><init>(Ljava/util/ArrayList;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    const/4 v4, 0x0

    .line 40
    const/4 v5, 0x3

    .line 41
    if-gt v3, v5, :cond_0

    .line 42
    .line 43
    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_0
    move v3, v4

    .line 48
    :cond_1
    :goto_0
    if-ge v3, v5, :cond_2

    .line 49
    .line 50
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 51
    .line 52
    .line 53
    move-result-wide v6

    .line 54
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result v8

    .line 58
    int-to-double v8, v8

    .line 59
    mul-double/2addr v6, v8

    .line 60
    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    .line 61
    .line 62
    .line 63
    move-result-wide v6

    .line 64
    double-to-int v6, v6

    .line 65
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    check-cast v6, Lcom/p1/mobile/putong/data/Tag;

    .line 70
    .line 71
    invoke-interface {v1, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v7

    .line 75
    if-nez v7, :cond_1

    .line 76
    .line 77
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    add-int/lit8 v3, v3, 0x1

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-ge v2, v5, :cond_5

    .line 88
    .line 89
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-lez v2, :cond_5

    .line 94
    .line 95
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    rsub-int/lit8 v3, v3, 0x3

    .line 104
    .line 105
    if-le v2, v3, :cond_4

    .line 106
    .line 107
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    sub-int/2addr v5, v2

    .line 112
    move v2, v4

    .line 113
    :cond_3
    :goto_2
    if-ge v2, v5, :cond_5

    .line 114
    .line 115
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 116
    .line 117
    .line 118
    move-result-wide v6

    .line 119
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    int-to-double v8, v3

    .line 124
    mul-double/2addr v6, v8

    .line 125
    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    .line 126
    .line 127
    .line 128
    move-result-wide v6

    .line 129
    double-to-int v3, v6

    .line 130
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    check-cast v3, Lcom/p1/mobile/putong/data/Tag;

    .line 135
    .line 136
    invoke-interface {v1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v6

    .line 140
    if-nez v6, :cond_3

    .line 141
    .line 142
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    add-int/lit8 v2, v2, 0x1

    .line 146
    .line 147
    goto :goto_2

    .line 148
    :cond_4
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 149
    .line 150
    .line 151
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->j:Lcom/p1/mobile/putong/data/User;

    .line 152
    .line 153
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-eqz v0, :cond_6

    .line 158
    .line 159
    const-string v0, "\u5979"

    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_6
    const-string v0, "\u4ed6"

    .line 163
    .line 164
    :goto_3
    const-string v2, "\u559c\u6b22"

    .line 165
    .line 166
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    move v2, v4

    .line 171
    :goto_4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    const/4 v5, 0x1

    .line 176
    if-ge v2, v3, :cond_8

    .line 177
    .line 178
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    check-cast v3, Lcom/p1/mobile/putong/data/Tag;

    .line 183
    .line 184
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 185
    .line 186
    .line 187
    move-result v6

    .line 188
    sub-int/2addr v6, v5

    .line 189
    if-ne v2, v6, :cond_7

    .line 190
    .line 191
    new-instance v5, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    iget-object v0, v3, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 200
    .line 201
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    const-string v0, "\u7b49"

    .line 205
    .line 206
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    goto :goto_5

    .line 214
    :cond_7
    new-instance v5, Ljava/lang/StringBuilder;

    .line 215
    .line 216
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 217
    .line 218
    .line 219
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    iget-object v0, v3, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 223
    .line 224
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    const-string v0, "\u3001"

    .line 228
    .line 229
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    :goto_5
    add-int/lit8 v2, v2, 0x1

    .line 237
    .line 238
    goto :goto_4

    .line 239
    :cond_8
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->f:Landroid/widget/TextView;

    .line 240
    .line 241
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 242
    .line 243
    .line 244
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->f:Landroid/widget/TextView;

    .line 245
    .line 246
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    if-lez v0, :cond_9

    .line 251
    .line 252
    move v4, v5

    .line 253
    :cond_9
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 254
    .line 255
    .line 256
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedCardView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "from_activities_profile"

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {p0, v2, p1, v0, v1}, Ll/at0;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
