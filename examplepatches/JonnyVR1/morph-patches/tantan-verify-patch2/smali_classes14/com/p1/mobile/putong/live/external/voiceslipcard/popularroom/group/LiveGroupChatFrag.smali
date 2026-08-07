.class public Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveMaxHeightRecyclerView;

.field public B:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public C:Lv/VImage;

.field public D:Landroid/widget/LinearLayout;

.field public E:Lv/VText;

.field public F:Ljava/lang/String;

.field public G:Ljava/lang/String;

.field public H:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

.field public I:Ll/iss;

.field public J:Z

.field public K:Z

.field public z:Landroid/widget/FrameLayout;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->J:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->K:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;Ll/kfn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->U4(Ll/kfn0;)V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->V4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->W4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic P4(Ljava/lang/String;Ll/kfn0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Ll/kfn0;->a:Ljava/util/List;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p1, Ll/kfn0;->a:Ljava/util/List;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;->sourceName:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 36
    .line 37
    return-object p0
.end method

.method private T4()Landroidx/recyclerview/widget/RecyclerView$n;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag$a;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private synthetic V4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->ze(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic W4(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-nez p1, :cond_1

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->K:Z

    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->J:Z

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->A:Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveMaxHeightRecyclerView;

    .line 16
    .line 17
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->B:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void

    .line 26
    :cond_1
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->K:Z

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public B4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Q4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/oss;->b(Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public R4(Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "feed_group_chat_room_switch"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->s(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->X4()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->G:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->S4(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v7

    .line 23
    const-string v2, "0"

    .line 24
    .line 25
    const-wide/16 v3, -0x1

    .line 26
    .line 27
    const/4 v5, 0x0

    .line 28
    const-string v6, ""

    .line 29
    .line 30
    move-object v1, p1

    .line 31
    invoke-static/range {v1 .. v7}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->getLiveListInTopicInFeed(Ljava/lang/String;Ljava/lang/String;JILjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance v0, Ll/lss;

    .line 40
    .line 41
    invoke-direct {v0, v1}, Ll/lss;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance v0, Ll/mss;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/mss;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;)V

    .line 51
    .line 52
    .line 53
    sget-object p0, Ll/vsn0;->INSTANCE:Ll/vsn0;

    .line 54
    .line 55
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    new-instance v1, Ll/nss;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/nss;-><init>(Ll/vsn0;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final S4(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "feed_group_keywords"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-static {p0}, Lcom/alibaba/fastjson/JSON;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/util/Map;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Ljava/util/List;

    .line 56
    .line 57
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-nez v2, :cond_0

    .line 62
    .line 63
    const/4 p0, 0x0

    .line 64
    invoke-interface {v1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .line 70
    return-object p0

    .line 71
    :catch_0
    move-exception p0

    .line 72
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    const-string p0, ""

    .line 76
    .line 77
    return-object p0
.end method

.method public final synthetic U4(Ll/kfn0;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Ll/kfn0;->a:Ljava/util/List;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->X4()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->J:Z

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->I:Ll/iss;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/iss;->K(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public final X4()V
    .locals 2

    .line 1
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->k7()Lrx/subjects/b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->J:Z

    .line 16
    .line 17
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->K:Z

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->A:Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveMaxHeightRecyclerView;

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->B:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->E:Lv/VText;

    .line 5
    .line 6
    new-instance v0, Ll/jss;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/jss;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "user_id"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->F:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "groupId"

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->G:Ljava/lang/String;

    .line 37
    .line 38
    new-instance p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 39
    .line 40
    const/4 v0, 0x2

    .line 41
    const/4 v1, 0x1

    .line 42
    invoke-direct {p1, v0, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;-><init>(II)V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->H:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->U(I)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->A:Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveMaxHeightRecyclerView;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->H:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 54
    .line 55
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->A:Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveMaxHeightRecyclerView;

    .line 59
    .line 60
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->T4()Landroidx/recyclerview/widget/RecyclerView$n;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->A:Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveMaxHeightRecyclerView;

    .line 68
    .line 69
    const/4 v1, 0x0

    .line 70
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 71
    .line 72
    .line 73
    new-instance p1, Ll/iss;

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    const-string v5, "group_name"

    .line 92
    .line 93
    invoke-virtual {v4, v5}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    iget-object v5, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->G:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->S4(Ljava/lang/String;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    new-instance v6, Ll/kss;

    .line 104
    .line 105
    invoke-direct {v6, p0}, Ll/kss;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;)V

    .line 106
    .line 107
    .line 108
    invoke-interface {v2, v3, v4, v5, v6}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Kg(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ll/y20;)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-direct {p1, v1, v2}, Ll/iss;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 113
    .line 114
    .line 115
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->I:Ll/iss;

    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->A:Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveMaxHeightRecyclerView;

    .line 118
    .line 119
    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->A:Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveMaxHeightRecyclerView;

    .line 123
    .line 124
    const/high16 v1, 0x431c0000    # 156.0f

    .line 125
    .line 126
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    invoke-static {p1, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->A:Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveMaxHeightRecyclerView;

    .line 134
    .line 135
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    .line 136
    .line 137
    .line 138
    const-string p1, "group-related-room"

    .line 139
    .line 140
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->R4(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->Q4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onResume()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onResume()V

    .line 2
    .line 3
    .line 4
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
