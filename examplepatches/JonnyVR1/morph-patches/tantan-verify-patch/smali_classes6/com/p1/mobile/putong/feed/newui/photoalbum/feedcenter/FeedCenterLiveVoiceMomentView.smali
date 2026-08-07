.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;
.super Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;
.source "SourceFile"


# instance fields
.field public B:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;

.field public C:Lv/VLinear;

.field public D:Landroid/widget/TextView;

.field public E:Lv/VText;

.field public F:Landroid/widget/LinearLayout;

.field public G:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

.field public H:Landroid/widget/LinearLayout;

.field public I:Lv/VImage;

.field public J:Landroid/widget/TextView;

.field public K:Lv/VLinear;

.field public L:Lv/VFrame;

.field public M:Lv/VDraweeView;

.field public N:Lv/VFrame;

.field public O:Lv/VDraweeView;

.field public P:Lv/VFrame;

.field public Q:Lv/VDraweeView;

.field public R:Lv/VText;

.field public S:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->q0(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->p0(Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;Landroid/view/View;)V

    return-void
.end method

.method private synthetic q0(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 1

    .line 1
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k0(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public C()V
    .locals 0

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->o0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Z(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->Z(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 5
    .line 6
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    :goto_0
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->L(Z)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v0, Ll/utg;

    .line 33
    .line 34
    invoke-direct {v0, p0, p3, p2}, Ll/utg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->Q(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->M(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 44
    .line 45
    .line 46
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 55
    .line 56
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceId:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-nez p1, :cond_2

    .line 63
    .line 64
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 65
    .line 66
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 67
    .line 68
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceId:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p1, p3}, Ll/jka;->L7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    if-nez p1, :cond_1

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_1
    iput-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 78
    .line 79
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->J:Landroid/widget/TextView;

    .line 80
    .line 81
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->r0(Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    :goto_1
    return-void
.end method

.method public final o0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wtg;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->o0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p0(Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->p:Z

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const-string v0, "anchorId"

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "liveId"

    .line 18
    .line 19
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "topic_id"

    .line 26
    .line 27
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const-string v3, "audio_card_type"

    .line 34
    .line 35
    const-string v4, "follow_moments"

    .line 36
    .line 37
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    const-string v4, "audio_room_label"

    .line 42
    .line 43
    iget-object v5, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v4, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    filled-new-array {v0, v1, v2, v3, v4}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "e_live_audio_room_enter"

    .line 54
    .line 55
    invoke-static {v1, p2, v0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

    .line 71
    .line 72
    invoke-interface {p2, v0, p0, p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->ga(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->r()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->G:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->a:Landroid/view/View;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->getTextView()Lv/VText;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->g:Lv/VText;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->F:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->D:Landroid/widget/TextView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->c:Landroid/widget/TextView;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->E:Lv/VText;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->d:Lv/VText;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->C:Lv/VLinear;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->b:Lv/VLinear;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->S:Landroid/view/View;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->h:Landroid/view/View;

    .line 35
    .line 36
    return-void
.end method

.method public final r0(Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;)V
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->K:Lv/VLinear;

    .line 11
    .line 12
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->K:Lv/VLinear;

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v4, 0x3

    .line 26
    const/4 v5, 0x2

    .line 27
    if-lt v1, v4, :cond_1

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->P:Lv/VFrame;

    .line 30
    .line 31
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->N:Lv/VFrame;

    .line 35
    .line 36
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->L:Lv/VFrame;

    .line 40
    .line 41
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 45
    .line 46
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->Q:Lv/VDraweeView;

    .line 47
    .line 48
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    check-cast v5, Lcom/p1/mobile/putong/feed/data/MemberUsers;

    .line 53
    .line 54
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/MemberUsers;->avatar:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v1, v4, v5}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 60
    .line 61
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->O:Lv/VDraweeView;

    .line 62
    .line 63
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    check-cast v3, Lcom/p1/mobile/putong/feed/data/MemberUsers;

    .line 68
    .line 69
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/MemberUsers;->avatar:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v1, v4, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 75
    .line 76
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->M:Lv/VDraweeView;

    .line 77
    .line 78
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MemberUsers;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MemberUsers;->avatar:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v1, v3, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-ne v1, v5, :cond_2

    .line 95
    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->P:Lv/VFrame;

    .line 97
    .line 98
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->N:Lv/VFrame;

    .line 102
    .line 103
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->L:Lv/VFrame;

    .line 107
    .line 108
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 109
    .line 110
    .line 111
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 112
    .line 113
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->O:Lv/VDraweeView;

    .line 114
    .line 115
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Lcom/p1/mobile/putong/feed/data/MemberUsers;

    .line 120
    .line 121
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/MemberUsers;->avatar:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v1, v4, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 127
    .line 128
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->M:Lv/VDraweeView;

    .line 129
    .line 130
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MemberUsers;

    .line 135
    .line 136
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MemberUsers;->avatar:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {v1, v3, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    if-ne v1, v3, :cond_3

    .line 147
    .line 148
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->P:Lv/VFrame;

    .line 149
    .line 150
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 151
    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->N:Lv/VFrame;

    .line 154
    .line 155
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 156
    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->L:Lv/VFrame;

    .line 159
    .line 160
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 161
    .line 162
    .line 163
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 164
    .line 165
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->M:Lv/VDraweeView;

    .line 166
    .line 167
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MemberUsers;

    .line 172
    .line 173
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MemberUsers;->avatar:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {v1, v3, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    :cond_3
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 179
    .line 180
    const-string v1, "stopped"

    .line 181
    .line 182
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->R:Lv/VText;

    .line 187
    .line 188
    if-eqz v0, :cond_4

    .line 189
    .line 190
    new-instance v0, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 193
    .line 194
    .line 195
    iget v2, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->audienceCount:I

    .line 196
    .line 197
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    const-string v2, "\u4eba\u53c2\u4e0e"

    .line 201
    .line 202
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 210
    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 214
    .line 215
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 216
    .line 217
    .line 218
    iget v2, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberCount:I

    .line 219
    .line 220
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    const-string v2, "\u4eba\u5728\u804a"

    .line 224
    .line 225
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 233
    .line 234
    .line 235
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->H:Landroid/widget/LinearLayout;

    .line 236
    .line 237
    new-instance v1, Ll/vtg;

    .line 238
    .line 239
    invoke-direct {v1, p0, p1}, Ll/vtg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;)V

    .line 240
    .line 241
    .line 242
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 243
    .line 244
    .line 245
    return-void
.end method
