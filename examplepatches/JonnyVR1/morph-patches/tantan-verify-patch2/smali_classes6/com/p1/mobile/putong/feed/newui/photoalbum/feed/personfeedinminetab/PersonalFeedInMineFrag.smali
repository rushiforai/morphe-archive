.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Ll/s2m;
.implements Ll/n2m;
.implements Ll/v0q;
.implements Ll/mch;


# instance fields
.field public A:Landroid/widget/FrameLayout;

.field public B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

.field public C:Ljava/lang/String;

.field public D:Z

.field public E:Ll/ut60;

.field public F:Ll/s8h;

.field public G:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMineTabSendMomentEnterView;

.field public H:Landroid/view/View;

.field public I:Z

.field public J:Lv/VRelative;

.field public K:Z

.field public L:Lcom/p1/mobile/putong/newui/view/NestedUseAgencyScrollView;

.field public M:Ll/hu60;

.field public N:Ll/bkj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bkj0<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;"
        }
    .end annotation
.end field

.field public O:Z

.field public P:Z

.field public Q:Ll/byd0;

.field public R:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;

.field public S:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;

.field public T:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;

.field public U:Lv/VLinear;

.field public V:Landroid/widget/TextView;

.field public W:Landroid/view/View;

.field public z:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/byd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "mine_tab_show_album_post_guide_time_"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->Q:Ll/byd0;

    .line 38
    .line 39
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->s5()V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->p5(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/feed/data/TopicOperations;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 2
    .line 3
    const-string v0, "bubble"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->u5(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic Q4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->r5(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic R4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->o5(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic S4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->m5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->q5()V

    return-void
.end method

.method public static synthetic U4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->t5(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->n5()V

    return-void
.end method

.method public static synthetic W4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic X4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic Y4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->H:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic Z4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->H:Landroid/view/View;

    return-void
.end method

.method public static bridge synthetic a5(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->e5()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static d5(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "user_id"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method private l5()Z
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->Q:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    invoke-static {v0, v1, v2, v3}, Ll/p6i;->l(JJ)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x1

    .line 26
    return p0
.end method

.method private synthetic n5()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->M:Ll/hu60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hu60;->A()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic o5(Ll/uxj0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/qu60;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/qu60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v1, 0x3e8

    .line 11
    .line 12
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic p5(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->U:Lv/VLinear;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->U:Lv/VLinear;

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->U:Lv/VLinear;

    .line 29
    .line 30
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->U:Lv/VLinear;

    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method private y5()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 6
    .line 7
    const-string v2, "album"

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Ll/jka;->mc(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/tu60;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/tu60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)V

    .line 20
    .line 21
    .line 22
    new-instance p0, Ll/ju60;

    .line 23
    .line 24
    invoke-direct {p0}, Ll/ju60;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public A5(Ll/bkj0;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->V:Landroid/widget/TextView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Ljava/util/Collection;

    .line 15
    .line 16
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p1, Ljava/util/Collection;

    .line 25
    .line 26
    new-instance v0, Ll/ou60;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/ou60;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 36
    .line 37
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->l5()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->V:Landroid/widget/TextView;

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 53
    .line 54
    .line 55
    if-eqz p2, :cond_1

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/PostGuide;->title:Ljava/lang/String;

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->H:I

    .line 67
    .line 68
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->V:Landroid/widget/TextView;

    .line 73
    .line 74
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->x5(Ljava/lang/String;Landroid/view/View;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->Q:Ll/byd0;

    .line 78
    .line 79
    invoke-static {}, Ll/pzi0;->o()J

    .line 80
    .line 81
    .line 82
    move-result-wide p1

    .line 83
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->P:Z

    .line 92
    .line 93
    if-nez p1, :cond_3

    .line 94
    .line 95
    const/4 p1, 0x1

    .line 96
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->P:Z

    .line 97
    .line 98
    const-string p0, "post_bubble"

    .line 99
    .line 100
    const-string p1, "0"

    .line 101
    .line 102
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    filled-new-array {p0}, [Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    const-string p1, "e_moment_post"

    .line 111
    .line 112
    const-string p2, "p_navigation_view"

    .line 113
    .line 114
    invoke-static {p1, p2, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 115
    .line 116
    .line 117
    :cond_3
    :goto_1
    return-void
.end method

.method public B3(Ll/pf60;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/Boolean;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public B4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public B5()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 4
    .line 5
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 6
    .line 7
    const-string v1, "feed_moments"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 15
    .line 16
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 25
    .line 26
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setOverScrollMode(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 35
    .line 36
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->requestDisallowInterceptTouchEvent(Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 45
    .line 46
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 47
    .line 48
    const/high16 v2, 0x42300000    # 44.0f

    .line 49
    .line 50
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-static {v0, v2}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 60
    .line 61
    iget-object p0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 62
    .line 63
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public C5()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/4 v0, 0x0

    .line 28
    new-array v0, v0, [Lcom/p1/mobile/putong/data/Media;

    .line 29
    .line 30
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v1, 0x1

    .line 35
    const-string v2, "mine"

    .line 36
    .line 37
    invoke-static {p0, v0, v1, v2}, Ll/cn40;->k0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public L0()Ll/n570;
    .locals 2

    .line 1
    new-instance v0, Ll/hu60;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1, p0}, Ll/hu60;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;ZLl/n2m;)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->M:Ll/hu60;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/hu60;->Q(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->M:Ll/hu60;

    .line 13
    .line 14
    return-object p0
.end method

.method public N0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->D:Z

    .line 3
    .line 4
    return-void
.end method

.method public Q0()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public U3()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->H:Landroid/view/View;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public X0()Ll/s8h;
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->E:Ll/ut60;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->F:Ll/s8h;

    .line 9
    .line 10
    new-instance v0, Landroid/widget/LinearLayout;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->k5()Landroid/widget/RelativeLayout;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/cmg;->W()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-nez v2, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->i5()Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMineTabSendMomentEnterView;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMineTabSendMomentEnterView;

    .line 44
    .line 45
    const/high16 v3, 0x41800000    # 16.0f

    .line 46
    .line 47
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-static {v2, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->F:Ll/s8h;

    .line 55
    .line 56
    invoke-virtual {v2, v0}, Ll/zzk;->H(Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->E:Ll/ut60;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->s0(I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->j5()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B5()V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->F:Ll/s8h;

    .line 71
    .line 72
    return-object p0
.end method

.method public b5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/uu60;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c5()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->J:Lv/VRelative;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->z:Landroid/widget/LinearLayout;

    .line 7
    .line 8
    const-class v1, Lv/VRelative;

    .line 9
    .line 10
    const-string v2, "moment_outer"

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->f5(Landroid/view/View;Ljava/lang/Class;Ljava/lang/String;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lv/VRelative;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->J:Lv/VRelative;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->h5()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->W:Landroid/view/View;

    .line 27
    .line 28
    sget v1, Ll/hdc0;->l1:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Landroid/widget/TextView;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->V:Landroid/widget/TextView;

    .line 37
    .line 38
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 39
    .line 40
    const/high16 v1, 0x42400000    # 48.0f

    .line 41
    .line 42
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/4 v2, -0x2

    .line 47
    invoke-direct {v0, v2, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 48
    .line 49
    .line 50
    const/16 v1, 0xc

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 53
    .line 54
    .line 55
    const/16 v1, 0xb

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 58
    .line 59
    .line 60
    const/high16 v1, 0x40e00000    # 7.0f

    .line 61
    .line 62
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 67
    .line 68
    const/high16 v1, 0x41000000    # 8.0f

    .line 69
    .line 70
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->W:Landroid/view/View;

    .line 77
    .line 78
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->W:Landroid/view/View;

    .line 82
    .line 83
    new-instance v1, Ll/ru60;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/ru60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->J:Lv/VRelative;

    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->W:Landroid/view/View;

    .line 94
    .line 95
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 96
    .line 97
    .line 98
    :cond_1
    :goto_0
    return-void
.end method

.method public final e5()Landroid/view/View;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v1, "p_navigation_view"

    .line 10
    .line 11
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ng(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 16
    .line 17
    const/4 v1, -0x1

    .line 18
    const/4 v2, -0x2

    .line 19
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    return-object p0
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->u8()Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/mu60;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/mu60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 29
    .line 30
    iget-object v0, v0, Ll/jka;->v1:Lrx/subjects/b;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/nu60;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/nu60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public f5(Landroid/view/View;Ljava/lang/Class;Ljava/lang/String;)Landroid/view/View;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(",
            "Landroid/view/View;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    return-object p1

    .line 30
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    instance-of v0, v0, Landroid/view/View;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Landroid/view/View;

    .line 43
    .line 44
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->f5(Landroid/view/View;Ljava/lang/Class;Ljava/lang/String;)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_1
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method public g0()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->I:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->H:Landroid/view/View;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->H:Landroid/view/View;

    .line 11
    .line 12
    const/high16 v2, 0x41a00000    # 20.0f

    .line 13
    .line 14
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/su60;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/su60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 32
    .line 33
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->L:Lcom/p1/mobile/putong/newui/view/NestedUseAgencyScrollView;

    .line 39
    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const/4 v0, -0x2

    .line 47
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 9

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "user_id"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->C:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v1, "PhotoAlbumFeedBaseFrag"

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->C:Ljava/lang/String;

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    const/4 v0, 0x1

    .line 47
    if-eqz p1, :cond_0

    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->k5(Z)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 60
    .line 61
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->h5(Ll/s2m;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->C:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const-string v2, "selected_item_position"

    .line 72
    .line 73
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const-string v2, "target_moment_id"

    .line 82
    .line 83
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    const/4 v7, 0x2

    .line 88
    const/4 v8, 0x1

    .line 89
    const/4 v2, 0x0

    .line 90
    const-string v4, "from_profile_album"

    .line 91
    .line 92
    invoke-static/range {v2 .. v8}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->N4(ZLjava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->k5(Z)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 107
    .line 108
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->h5(Ll/s2m;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    sget v0, Ll/hdc0;->g:I

    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 122
    .line 123
    invoke-virtual {p1, v0, p0, v1}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1}, Landroidx/fragment/app/k;->j()I

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public g5(Landroid/view/View;)Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(",
            "Landroid/view/View;",
            ")TT;"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/newui/view/NestedUseAgencyScrollView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object p1

    .line 6
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    instance-of v0, v0, Landroid/view/View;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->g5(Landroid/view/View;)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public final h5()Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget v0, Ll/tec0;->x2:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public i5()Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMineTabSendMomentEnterView;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMineTabSendMomentEnterView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMineTabSendMomentEnterView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMineTabSendMomentEnterView;

    .line 11
    .line 12
    const-string v1, "p_navigation_view"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMineTabSendMomentEnterView;->setPageId(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->y5()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMineTabSendMomentEnterView;

    .line 21
    .line 22
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->b5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j5()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->e5()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->H:Landroid/view/View;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->F:Ll/s8h;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ll/zzk;->F(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->H:Landroid/view/View;

    .line 13
    .line 14
    const/16 v0, 0x8

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public k5()Landroid/widget/RelativeLayout;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->o4:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget v2, Ll/k9c0;->A:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    const/high16 v1, 0x41700000    # 15.0f

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 39
    .line 40
    .line 41
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 42
    .line 43
    const/4 v2, -0x2

    .line 44
    invoke-direct {v1, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 45
    .line 46
    .line 47
    const/16 v3, 0xf

    .line 48
    .line 49
    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    .line 54
    .line 55
    sget v1, Ll/hdc0;->v1:I

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    .line 58
    .line 59
    .line 60
    new-instance v1, Landroid/widget/RelativeLayout;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-direct {v1, p0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 67
    .line 68
    .line 69
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 70
    .line 71
    const/4 v3, -0x1

    .line 72
    invoke-direct {p0, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 73
    .line 74
    .line 75
    const/high16 v2, 0x41400000    # 12.0f

    .line 76
    .line 77
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    iput v2, p0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 82
    .line 83
    const/high16 v2, 0x41c00000    # 24.0f

    .line 84
    .line 85
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    iput v2, p0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 90
    .line 91
    invoke-virtual {v1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    return-object v1
.end method

.method public final synthetic m5(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->O:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "1"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p1, "0"

    .line 9
    .line 10
    :goto_0
    const-string v0, "post_bubble"

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    filled-new-array {p1}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "e_moment_post"

    .line 21
    .line 22
    const-string v1, "p_navigation_view"

    .line 23
    .line 24
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->C5()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public n1(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;I)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;",
            ">;Z",
            "Lcom/p1/mobile/putong/data/User;",
            "I)Z"
        }
    .end annotation

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->E:Ll/ut60;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/4 p3, 0x0

    .line 8
    if-eqz p2, :cond_1

    .line 9
    .line 10
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMineTabSendMomentEnterView;

    .line 11
    .line 12
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMineTabSendMomentEnterView;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->N:Ll/bkj0;

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-lez p1, :cond_0

    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move p1, p3

    .line 31
    :goto_0
    invoke-virtual {p2, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMineTabSendMomentEnterView;->W(Ll/bkj0;Z)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return p3
.end method

.method public o()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->K:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->v5()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->K:Z

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->R:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->R:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->Z()V

    .line 28
    .line 29
    .line 30
    :cond_1
    const/4 p1, 0x1

    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->K:Z

    .line 32
    .line 33
    return-void
.end method

.method public onResume()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/cmg;->W()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->c5()V

    .line 11
    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 14
    .line 15
    const-string v1, "album"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/jka;->mc(Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/iu60;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/iu60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/lu60;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/lu60;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->w5()V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ll/cmg;->W()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->v5()V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onStop()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic q5()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 4
    .line 5
    iget-object p0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 6
    .line 7
    const/4 v0, -0x2

    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic r5(Ll/bkj0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->E:Ll/ut60;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->C()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->A5(Ll/bkj0;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public s0()Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;
    .locals 8

    .line 1
    new-instance v0, Ll/ut60;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 6
    .line 7
    iget-object v3, v2, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->C:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v6, 0x2

    .line 12
    const/4 v7, 0x1

    .line 13
    const-string v5, "from_mine_tab_album"

    .line 14
    .line 15
    move-object v2, p0

    .line 16
    invoke-direct/range {v0 .. v7}, Ll/ut60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Ll/v0q;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 17
    .line 18
    .line 19
    iput-object v0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->E:Ll/ut60;

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Ll/ut60;->D0(Ll/mch;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->E:Ll/ut60;

    .line 25
    .line 26
    return-object p0
.end method

.method public final synthetic s5()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->I:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 8
    .line 9
    iget-object p0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 10
    .line 11
    const/4 v0, -0x2

    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 17
    .line 18
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->L:Lcom/p1/mobile/putong/newui/view/NestedUseAgencyScrollView;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 40
    .line 41
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->L:Lcom/p1/mobile/putong/newui/view/NestedUseAgencyScrollView;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    invoke-static {v0, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 56
    .line 57
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    if-nez v1, :cond_3

    .line 64
    .line 65
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    :goto_0
    invoke-static {p0}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    const/high16 v1, 0x42a00000    # 80.0f

    .line 77
    .line 78
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    sub-int/2addr p0, v1

    .line 83
    invoke-static {}, Ll/bnl0;->F0()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    sub-int/2addr p0, v1

    .line 88
    invoke-static {v0, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final synthetic t5(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string p1, "post_bubble"

    .line 2
    .line 3
    const-string v0, "1"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "e_moment_post"

    .line 14
    .line 15
    const-string v1, "p_navigation_view"

    .line 16
    .line 17
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->C5()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic u5(Ll/bkj0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->N:Ll/bkj0;

    .line 2
    .line 3
    return-void
.end method

.method public v5()V
    .locals 3

    .line 1
    invoke-static {}, Ll/cmg;->W()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "p_navigation_view"

    .line 6
    .line 7
    const-string v2, "e_moment_post"

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->O:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-string p0, "1"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p0, "0"

    .line 19
    .line 20
    :goto_0
    const-string v0, "post_bubble"

    .line 21
    .line 22
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    filled-new-array {p0}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {v2, v1, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    const/4 p0, 0x0

    .line 35
    new-array p0, p0, [Ll/pf60;

    .line 36
    .line 37
    invoke-static {v2, v1, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public w1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->D:Z

    .line 2
    .line 3
    return p0
.end method

.method public w5()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->L:Lcom/p1/mobile/putong/newui/view/NestedUseAgencyScrollView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 9
    .line 10
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->g5(Landroid/view/View;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/newui/view/NestedUseAgencyScrollView;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->L:Lcom/p1/mobile/putong/newui/view/NestedUseAgencyScrollView;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    new-instance v1, Ll/cfh;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 26
    .line 27
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 28
    .line 29
    iget-object v2, v2, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 30
    .line 31
    invoke-direct {v1, v2, v0}, Ll/cfh;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroidx/core/widget/NestedScrollView;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/view/NestedUseAgencyScrollView;->T(Ll/xh20;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->L:Lcom/p1/mobile/putong/newui/view/NestedUseAgencyScrollView;

    .line 38
    .line 39
    new-instance v1, Ll/pu60;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/pu60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public x5(Ljava/lang/String;Landroid/view/View;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/high16 v1, 0x41100000    # 9.0f

    .line 15
    .line 16
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    sget v2, Ll/k9c0;->n:I

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    filled-new-array {v1}, [I

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const/high16 v1, 0x41500000    # 13.0f

    .line 47
    .line 48
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const/4 v1, 0x1

    .line 53
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const/high16 v2, 0x41a00000    # 20.0f

    .line 58
    .line 59
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    neg-int v2, v2

    .line 64
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const/high16 v2, 0x40a00000    # 5.0f

    .line 69
    .line 70
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->u(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const-wide/16 v2, 0xfa0

    .line 79
    .line 80
    invoke-virtual {p1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->M(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->y(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    new-instance v2, Ll/ku60;

    .line 93
    .line 94
    invoke-direct {v2, p0}, Ll/ku60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->d(Lcom/p1/mobile/android/ui/bubble/a$b;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    sget v2, Ll/zvk;->C:I

    .line 102
    .line 103
    const/high16 v3, 0x41200000    # 10.0f

    .line 104
    .line 105
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    invoke-virtual {p1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 114
    .line 115
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 116
    .line 117
    or-int/2addr v2, v3

    .line 118
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 119
    .line 120
    .line 121
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    const-string v2, "SHARE_TIP_POST_MOMENT"

    .line 126
    .line 127
    invoke-virtual {p1, v0, p2, v2}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->O:Z

    .line 131
    .line 132
    const-string p0, "post_bubble"

    .line 133
    .line 134
    const-string p1, "1"

    .line 135
    .line 136
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    filled-new-array {p0}, [Ll/pf60;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    const-string p1, "e_moment_post"

    .line 145
    .line 146
    const-string p2, "p_navigation_view"

    .line 147
    .line 148
    invoke-static {p1, p2, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public z5(Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->U:Lv/VLinear;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->S:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->T:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->R:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    :goto_0
    return-void

    .line 33
    :cond_3
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 34
    .line 35
    invoke-static {}, Ll/bnl0;->y0()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    const/4 v2, -0x2

    .line 40
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    const-string v2, "p_navigation_view"

    .line 48
    .line 49
    const/4 v3, 0x1

    .line 50
    if-eqz v1, :cond_6

    .line 51
    .line 52
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->style:I

    .line 53
    .line 54
    const/4 v4, 0x2

    .line 55
    if-ne v1, v4, :cond_4

    .line 56
    .line 57
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-direct {v1, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;-><init>(Landroid/content/Context;)V

    .line 64
    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->S:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;

    .line 67
    .line 68
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->U:Lv/VLinear;

    .line 69
    .line 70
    invoke-virtual {v4, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->S:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;

    .line 74
    .line 75
    invoke-virtual {v0, p1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->T(Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->S:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;

    .line 79
    .line 80
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_4
    const/4 v4, 0x3

    .line 85
    if-ne v1, v4, :cond_5

    .line 86
    .line 87
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    invoke-direct {v1, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;-><init>(Landroid/content/Context;)V

    .line 94
    .line 95
    .line 96
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->T:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;

    .line 97
    .line 98
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->U:Lv/VLinear;

    .line 99
    .line 100
    invoke-virtual {v4, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->T:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;

    .line 104
    .line 105
    invoke-virtual {v0, p1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;->T(Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->T:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;

    .line 109
    .line 110
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_5
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    invoke-direct {v1, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;-><init>(Landroid/content/Context;)V

    .line 121
    .line 122
    .line 123
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->R:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;

    .line 124
    .line 125
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->U:Lv/VLinear;

    .line 126
    .line 127
    invoke-virtual {v4, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->R:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;

    .line 131
    .line 132
    invoke-virtual {v0, p1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->Y(Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->R:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;

    .line 136
    .line 137
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->new_()Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    const-string v1, "\u53d1\u5e03\u52a8\u6001\u8ba4\u8bc6\u66f4\u591a\u65b0\u670b\u53cb"

    .line 146
    .line 147
    iput-object v1, p1, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->title:Ljava/lang/String;

    .line 148
    .line 149
    iput v3, p1, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->style:I

    .line 150
    .line 151
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;

    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    invoke-direct {v1, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;-><init>(Landroid/content/Context;)V

    .line 158
    .line 159
    .line 160
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->R:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;

    .line 161
    .line 162
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->U:Lv/VLinear;

    .line 163
    .line 164
    invoke-virtual {v4, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->R:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;

    .line 168
    .line 169
    invoke-virtual {v0, p1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->Y(Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->R:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;

    .line 173
    .line 174
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 175
    .line 176
    .line 177
    :goto_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    .line 178
    .line 179
    .line 180
    return-void
.end method
