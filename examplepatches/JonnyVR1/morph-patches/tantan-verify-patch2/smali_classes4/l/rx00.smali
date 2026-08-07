.class public Ll/rx00;
.super Ll/f6l;
.source "SourceFile"


# static fields
.field public static final z:I


# instance fields
.field public f:Lv/VLinear;

.field public g:Lv/VLinear;

.field public h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public i:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public j:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public k:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public l:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public m:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public n:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public o:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public p:Lv/VFrame;

.field public q:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public r:Lv/VFrame;

.field public s:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

.field public t:Lv/VText;

.field public u:Lv/VText;

.field public v:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/drawee/view/SimpleDraweeView;",
            ">;"
        }
    .end annotation
.end field

.field public w:Ll/x20;

.field public x:Lcom/p1/mobile/putong/data/User;

.field public y:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/kec0;->N0:I

    .line 2
    .line 3
    sput v0, Ll/rx00;->z:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/f6l;-><init>()V

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
    iput-object v0, p0, Ll/rx00;->v:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic D(Ll/rx00;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rx00;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/rx00;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rx00;->U(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/vg60;)V

    return-void
.end method

.method public static synthetic F(Ljava/lang/String;Ljava/lang/Boolean;)Lrx/c;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentMoments(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 v0, 0x0

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 24
    .line 25
    invoke-interface {p1, p0, v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentCachedMoments(Ljava/lang/String;ILcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic G(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic H(Ll/rx00;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rx00;->T()V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/rx00;->P(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)Z

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

.method public static synthetic J(Ll/rx00;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rx00;->R(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic K(Ll/rx00;)Ll/x20;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rx00;->O()Ll/x20;

    move-result-object p0

    return-object p0
.end method

.method public static N(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_3

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 21
    .line 22
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-nez v2, :cond_0

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 47
    .line 48
    instance-of v3, v2, Lcom/p1/mobile/putong/data/Picture;

    .line 49
    .line 50
    if-eqz v3, :cond_2

    .line 51
    .line 52
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    instance-of v3, v2, Lcom/p1/mobile/putong/data/Video;

    .line 57
    .line 58
    if-eqz v3, :cond_1

    .line 59
    .line 60
    move-object v3, v2

    .line 61
    check-cast v3, Lcom/p1/mobile/putong/data/Video;

    .line 62
    .line 63
    iget-object v4, v3, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 64
    .line 65
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-eqz v4, :cond_1

    .line 70
    .line 71
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 72
    .line 73
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-eqz v3, :cond_1

    .line 80
    .line 81
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_3
    return-object v0
.end method

.method public static P(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p0}, Ll/rx00;->Q(Ljava/util/List;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public static Q(Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Audio;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    return v1
.end method

.method private synthetic R(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rx00;->O()Ll/x20;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/rx00;->x:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iput-object p1, p0, Ll/rx00;->y:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const/4 p3, 0x0

    .line 10
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p2, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfoList:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfoList:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/rx00;->Y(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p0}, Ll/rx00;->W()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    invoke-virtual {p0, p2, p3}, Ll/dmf;->k(Ll/ner;Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    new-instance p3, Ll/nx00;

    .line 40
    .line 41
    invoke-direct {p3, p0, p1}, Ll/nx00;-><init>(Ll/rx00;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 42
    .line 43
    .line 44
    new-instance p0, Ll/ox00;

    .line 45
    .line 46
    invoke-direct {p0}, Ll/ox00;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {p3, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/sx00;->a(Ll/rx00;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final M(Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/px00;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/px00;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final O()Ll/x20;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rx00;->w:Ll/x20;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/mx00;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/mx00;-><init>(Ll/rx00;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/rx00;->w:Ll/x20;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/rx00;->w:Ll/x20;

    .line 13
    .line 14
    return-object p0
.end method

.method public final synthetic S(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rx00;->O()Ll/x20;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic T()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/rx00;->y:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->profileContext:Ll/fr90;

    .line 6
    .line 7
    instance-of v1, v0, Ll/zq90;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    check-cast v0, Ll/zq90;

    .line 12
    .line 13
    const-string v1, "from_guess_liker_result"

    .line 14
    .line 15
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p0, Ll/rx00;->x:Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    :goto_0
    return-void

    .line 29
    :cond_1
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object v3, p0, Ll/rx00;->x:Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    const-string v4, "from_ProfileFrag"

    .line 54
    .line 55
    invoke-interface {v1, v2, v3, v4}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToMomentsInProfileAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/rx00;->x:Lcom/p1/mobile/putong/data/User;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 65
    .line 66
    const-string v0, "owner_id"

    .line 67
    .line 68
    invoke-static {v0, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string v0, "e_moment"

    .line 77
    .line 78
    const-string v1, "p_suggest_user_profile_info_view"

    .line 79
    .line 80
    invoke-static {v0, v1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final synthetic U(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/vg60;)V
    .locals 0

    .line 1
    iget-object p2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfoList:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Ll/rx00;->Y(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/data/Media;Lcom/facebook/drawee/view/SimpleDraweeView;)V
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p2, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 18
    .line 19
    .line 20
    new-instance p1, Ll/rx00$a;

    .line 21
    .line 22
    invoke-direct {p1, p0}, Ll/rx00$a;-><init>(Ll/rx00;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {v0, p2, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    check-cast p1, Ll/wlj;

    .line 72
    .line 73
    new-instance v0, Ll/x0e0;

    .line 74
    .line 75
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 76
    .line 77
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-static {}, Ll/gra;->z()Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_1

    .line 86
    .line 87
    sget v2, Ll/dbc0;->Rh:I

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    sget v2, Ll/dbc0;->Ns:I

    .line 91
    .line 92
    :goto_0
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    sget-object v2, Ll/h1e0;->g:Ll/h1e0;

    .line 97
    .line 98
    invoke-direct {v0, v1, v2}, Ll/x0e0;-><init>(Landroid/graphics/drawable/Drawable;Ll/h1e0;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ll/wlj;->c(Landroid/graphics/drawable/Drawable;)V

    .line 102
    .line 103
    .line 104
    new-instance p1, Ll/rx00$b;

    .line 105
    .line 106
    invoke-direct {p1, p0}, Ll/rx00$b;-><init>(Ll/rx00;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    :cond_2
    return-void
.end method

.method public final W()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rx00;->x:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 16
    .line 17
    invoke-interface {p0, v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentMoments(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->wh(Ljava/lang/String;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance v1, Ll/qx00;

    .line 31
    .line 32
    invoke-direct {v1, v0}, Ll/qx00;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public final X(Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Audio;

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Ll/rx00;->s:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/rx00;->t:Lv/VText;

    .line 33
    .line 34
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 35
    .line 36
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Xf:I

    .line 37
    .line 38
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return v0
.end method

.method public final Y(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/rx00;->M(Ljava/util/List;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, 0x0

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/rx00;->g:Lv/VLinear;

    .line 21
    .line 22
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/rx00;->i:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 26
    .line 27
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/rx00;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 31
    .line 32
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/rx00;->s:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 36
    .line 37
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/rx00;->u:Lv/VText;

    .line 41
    .line 42
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0}, Ll/rx00;->N(Ljava/util/List;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_0

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ll/rx00;->Z(Ljava/util/List;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    invoke-virtual {p0, v0}, Ll/rx00;->a0(Ljava/util/List;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/rx00;->g:Lv/VLinear;

    .line 77
    .line 78
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/rx00;->i:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 82
    .line 83
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/rx00;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 87
    .line 88
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/rx00;->u:Lv/VText;

    .line 92
    .line 93
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, p1}, Ll/rx00;->X(Ljava/util/List;)Z

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_2
    iget-object p1, p0, Ll/rx00;->x:Lcom/p1/mobile/putong/data/User;

    .line 101
    .line 102
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-eqz p1, :cond_3

    .line 107
    .line 108
    iget-object p1, p0, Ll/rx00;->x:Lcom/p1/mobile/putong/data/User;

    .line 109
    .line 110
    invoke-virtual {p0, p1}, Ll/f6l;->x(Lcom/p1/mobile/putong/data/User;)Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-eqz p1, :cond_3

    .line 115
    .line 116
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Ll/rx00;->g:Lv/VLinear;

    .line 124
    .line 125
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Ll/rx00;->i:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 129
    .line 130
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Ll/rx00;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 134
    .line 135
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Ll/rx00;->s:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 139
    .line 140
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    iget-object p0, p0, Ll/rx00;->u:Lv/VText;

    .line 144
    .line 145
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_3
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 154
    .line 155
    .line 156
    return-void
.end method

.method public final Z(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/rx00;->i:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 6
    .line 7
    const/4 v2, 0x6

    .line 8
    const/4 v3, 0x0

    .line 9
    const/4 v4, 0x1

    .line 10
    const/4 v5, 0x3

    .line 11
    if-le v0, v5, :cond_1

    .line 12
    .line 13
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/rx00;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 17
    .line 18
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    move v0, v3

    .line 22
    :goto_0
    if-ge v0, v2, :cond_3

    .line 23
    .line 24
    iget-object v1, p0, Ll/rx00;->v:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-ge v0, v5, :cond_0

    .line 37
    .line 38
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    check-cast v5, Lcom/p1/mobile/putong/data/Media;

    .line 43
    .line 44
    invoke-virtual {p0, v5, v1}, Ll/rx00;->V(Lcom/p1/mobile/putong/data/Media;Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_0
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/rx00;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 58
    .line 59
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    move v0, v3

    .line 63
    :goto_2
    if-ge v0, v5, :cond_3

    .line 64
    .line 65
    iget-object v1, p0, Ll/rx00;->v:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 72
    .line 73
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result v6

    .line 77
    if-ge v0, v6, :cond_2

    .line 78
    .line 79
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v6

    .line 83
    check-cast v6, Lcom/p1/mobile/putong/data/Media;

    .line 84
    .line 85
    invoke-virtual {p0, v6, v1}, Ll/rx00;->V(Lcom/p1/mobile/putong/data/Media;Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 86
    .line 87
    .line 88
    goto :goto_3

    .line 89
    :cond_2
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    iget-object v0, p0, Ll/rx00;->r:Lv/VFrame;

    .line 100
    .line 101
    if-le p1, v2, :cond_4

    .line 102
    .line 103
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    goto :goto_4

    .line 107
    :cond_4
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    :goto_4
    invoke-virtual {p0}, Ll/dmf;->n()Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-eqz p1, :cond_5

    .line 115
    .line 116
    iget-object p0, p0, Ll/rx00;->x:Lcom/p1/mobile/putong/data/User;

    .line 117
    .line 118
    if-eqz p0, :cond_5

    .line 119
    .line 120
    const-string p1, "owner_id"

    .line 121
    .line 122
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 123
    .line 124
    invoke-static {p1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    const-string p1, "e_moment"

    .line 133
    .line 134
    const-string v0, "p_suggest_user_profile_info_view"

    .line 135
    .line 136
    invoke-static {p1, v0, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 137
    .line 138
    .line 139
    :cond_5
    return-void
.end method

.method public final a0(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "\r|\n"

    .line 20
    .line 21
    const-string v2, ""

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Ll/rx00;->s:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/rx00;->t:Lv/VText;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public g(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/dmf;->g(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/rx00;->L(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/rx00;->v:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/rx00;->v:Ljava/util/List;

    .line 13
    .line 14
    iget-object v0, p0, Ll/rx00;->j:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 15
    .line 16
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/rx00;->v:Ljava/util/List;

    .line 20
    .line 21
    iget-object v0, p0, Ll/rx00;->k:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 22
    .line 23
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/rx00;->v:Ljava/util/List;

    .line 27
    .line 28
    iget-object v0, p0, Ll/rx00;->l:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 29
    .line 30
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/rx00;->v:Ljava/util/List;

    .line 34
    .line 35
    iget-object v0, p0, Ll/rx00;->n:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 36
    .line 37
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/rx00;->v:Ljava/util/List;

    .line 41
    .line 42
    iget-object v0, p0, Ll/rx00;->o:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 43
    .line 44
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/rx00;->v:Ljava/util/List;

    .line 48
    .line 49
    iget-object v0, p0, Ll/rx00;->q:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 50
    .line 51
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Ll/rx00;->f:Lv/VLinear;

    .line 55
    .line 56
    new-instance v0, Ll/kx00;

    .line 57
    .line 58
    invoke-direct {v0, p0}, Ll/kx00;-><init>(Ll/rx00;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Ll/rx00;->s:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 65
    .line 66
    new-instance v0, Ll/lx00;

    .line 67
    .line 68
    invoke-direct {v0, p0}, Ll/lx00;-><init>(Ll/rx00;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public q(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/dmf;->q(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/rx00;->x:Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    const-string p1, "owner_id"

    .line 21
    .line 22
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "e_moment"

    .line 33
    .line 34
    const-string v0, "p_suggest_user_profile_info_view"

    .line 35
    .line 36
    invoke-static {p1, v0, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method
