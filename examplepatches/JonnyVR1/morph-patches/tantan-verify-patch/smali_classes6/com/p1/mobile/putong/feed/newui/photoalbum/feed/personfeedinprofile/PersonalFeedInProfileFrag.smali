.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Ll/s2m;
.implements Ll/n2m;
.implements Ll/v0q;


# instance fields
.field public A:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedWriterLevelInProfileView;

.field public B:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/TopicListView;

.field public C:Landroid/widget/FrameLayout;

.field public D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

.field public E:Ll/tt60;

.field public F:Ljava/lang/String;

.field public G:Z

.field public H:Ll/s8h;

.field public I:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/a;

.field public J:F

.field public K:I

.field public L:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;

.field public M:I

.field public N:Z

.field public z:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->J:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->K:I

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->N:Z

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic M4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->V4(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->U4()V

    return-void
.end method

.method public static bridge synthetic P4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->J:F

    return p0
.end method

.method public static bridge synthetic Q4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    return-object p0
.end method

.method public static bridge synthetic R4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->K:I

    return p0
.end method

.method public static bridge synthetic S4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->J:F

    return-void
.end method


# virtual methods
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

.method public L0()Ll/n570;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/a;

    .line 7
    .line 8
    return-object v0
.end method

.method public N0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->G:Z

    .line 3
    .line 4
    return-void
.end method

.method public Q0()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public T4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/gv60;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic U4()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 7
    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->C:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->C:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-lt v0, v2, :cond_1

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    :cond_1
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->N:Z

    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    :goto_0
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->N:Z

    .line 36
    .line 37
    return-void
.end method

.method public final synthetic V4(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 4

    .line 1
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->L:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;

    .line 18
    .line 19
    const/high16 v0, 0x41700000    # 15.0f

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-static {p1, v0}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->M:I

    .line 36
    .line 37
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/TopicListView;

    .line 38
    .line 39
    const/16 p1, 0x8

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/TopicListView;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/TopicListView;

    .line 52
    .line 53
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;

    .line 54
    .line 55
    invoke-direct {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;-><init>()V

    .line 56
    .line 57
    .line 58
    const/high16 v3, 0x41200000    # 10.0f

    .line 59
    .line 60
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;->b(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/a;

    .line 69
    .line 70
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;->d(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$b;)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const/16 v2, 0x1e

    .line 75
    .line 76
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    invoke-interface {p1, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;->e(Ljava/util/List;)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const/4 p1, 0x1

    .line 93
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;->c(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;->a()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/TopicListView;->s(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final W4()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->F:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/jka;->Zc(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/dv60;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/dv60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/ev60;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/ev60;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public X0()Ll/s8h;
    .locals 5

    .line 1
    new-instance v0, Ll/s8h;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->E:Ll/tt60;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/s8h;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->H:Ll/s8h;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/TopicListView;

    .line 24
    .line 25
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 30
    .line 31
    const/high16 v3, 0x41900000    # 18.0f

    .line 32
    .line 33
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 38
    .line 39
    const/high16 v3, 0x40c00000    # 6.0f

    .line 40
    .line 41
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-interface {v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->F:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_1

    .line 64
    .line 65
    new-instance v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-direct {v3, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;-><init>(Landroid/content/Context;)V

    .line 72
    .line 73
    .line 74
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->L:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;

    .line 75
    .line 76
    const-string v4, "p_suggest_user_profile_info_view"

    .line 77
    .line 78
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;->setPageId(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->L:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;

    .line 82
    .line 83
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 84
    .line 85
    .line 86
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->M:I

    .line 87
    .line 88
    if-eqz v3, :cond_0

    .line 89
    .line 90
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->L:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;

    .line 91
    .line 92
    invoke-static {v4, v3}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 93
    .line 94
    .line 95
    :cond_0
    const/high16 v3, 0x41c00000    # 24.0f

    .line 96
    .line 97
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    iput v4, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 102
    .line 103
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 108
    .line 109
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/TopicListView;

    .line 110
    .line 111
    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    .line 113
    .line 114
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->H:Ll/s8h;

    .line 115
    .line 116
    invoke-virtual {v2, v0}, Ll/zzk;->H(Landroid/view/View;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->E:Ll/tt60;

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->s0(I)V

    .line 122
    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->H:Ll/s8h;

    .line 125
    .line 126
    return-object p0
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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->F:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "PhotoAlbumFeedBaseFrag"

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    const/4 v1, 0x1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->k5(Z)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->h5(Ll/s2m;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->F:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const-string v2, "selected_item_position"

    .line 60
    .line 61
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const-string v2, "target_moment_id"

    .line 70
    .line 71
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    const/4 v7, 0x2

    .line 76
    const/4 v8, 0x1

    .line 77
    const/4 v2, 0x0

    .line 78
    const-string v4, "from_profile_album"

    .line 79
    .line 80
    invoke-static/range {v2 .. v8}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->N4(ZLjava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 85
    .line 86
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->k5(Z)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 90
    .line 91
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 95
    .line 96
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->h5(Ll/s2m;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    sget v1, Ll/hdc0;->g:I

    .line 108
    .line 109
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 110
    .line 111
    invoke-virtual {p1, v1, v2, v0}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1}, Landroidx/fragment/app/k;->j()I

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->W4()V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->T4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
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
    const/4 p0, 0x0

    return p0
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

.method public s0()Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;
    .locals 8

    .line 1
    new-instance v0, Ll/tt60;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 6
    .line 7
    iget-object v3, v2, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->F:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v6, 0x2

    .line 12
    const/4 v7, 0x1

    .line 13
    const-string v5, "from_profile_album"

    .line 14
    .line 15
    move-object v2, p0

    .line 16
    invoke-direct/range {v0 .. v7}, Ll/tt60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Ll/v0q;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 17
    .line 18
    .line 19
    iput-object v0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->E:Ll/tt60;

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->t1:I

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ll/tt60;->C0(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    iput p0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->K:I

    .line 39
    .line 40
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 41
    .line 42
    const/4 v0, -0x1

    .line 43
    const/4 v1, -0x2

    .line 44
    invoke-direct {p0, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 45
    .line 46
    .line 47
    iget-object v0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 50
    .line 51
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 59
    .line 60
    iget-object p0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    new-instance v0, Ll/fv60;

    .line 67
    .line 68
    invoke-direct {v0, v2}, Ll/fv60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 77
    .line 78
    iget-object p0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 79
    .line 80
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag$a;

    .line 81
    .line 82
    invoke-direct {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 91
    .line 92
    iget-object p0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 93
    .line 94
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag$b;

    .line 95
    .line 96
    invoke-direct {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag$b;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnItemTouchListener(Landroidx/recyclerview/widget/RecyclerView$s;)V

    .line 100
    .line 101
    .line 102
    iget-object p0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 105
    .line 106
    iget-object p0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 107
    .line 108
    const/high16 v0, 0x42dc0000    # 110.0f

    .line 109
    .line 110
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    invoke-static {p0, v0}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 115
    .line 116
    .line 117
    iget-object p0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 120
    .line 121
    iget-object p0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 122
    .line 123
    const/4 v0, 0x0

    .line 124
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    .line 125
    .line 126
    .line 127
    iget-object p0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->E:Ll/tt60;

    .line 128
    .line 129
    return-object p0
.end method

.method public w1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->G:Z

    .line 2
    .line 3
    return p0
.end method
