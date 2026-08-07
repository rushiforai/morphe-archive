.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;
.super Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;
.source "SourceFile"


# instance fields
.field public B:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;

.field public C:Lv/VLinear;

.field public D:Landroid/widget/TextView;

.field public E:Lv/VText;

.field public F:Landroid/widget/LinearLayout;

.field public G:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

.field public H:Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;

.field public I:Landroid/view/View;

.field public J:Landroid/widget/RelativeLayout;

.field public K:Lv/VDraweeView;

.field public L:Landroid/widget/TextView;

.field public M:Lv/VDraweeView;

.field public N:Landroid/widget/TextView;

.field public O:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


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

.method private getFrom()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v0, "from_nearby_falls_feed"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    const-string v0, "from_nearby_focus"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    const-string p0, "page_photo"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    const-string p0, "page_follow"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    const-string p0, "page_nearby"

    .line 29
    .line 30
    return-object p0
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->p0(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    return-void
.end method

.method private synthetic p0(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->m0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Z(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V
    .locals 10
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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->J:Landroid/widget/RelativeLayout;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x1

    .line 8
    if-ne p1, v2, :cond_0

    .line 9
    .line 10
    move v3, v2

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v3, v1

    .line 13
    :goto_0
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->F:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    if-eq p1, v2, :cond_1

    .line 19
    .line 20
    move v3, v2

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    move v3, v1

    .line 23
    :goto_1
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {v0}, Ll/ftn0;->a()Ljava/util/HashMap;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->O:Ljava/util/Map;

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 41
    .line 42
    iget-object v3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p3, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    if-nez v3, :cond_2

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_2
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Ljava/lang/Boolean;

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    :goto_2
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->L(Z)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/ztg;

    .line 68
    .line 69
    invoke-direct {v1, p0, p3, p2}, Ll/ztg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->Q(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->M(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 81
    .line 82
    .line 83
    if-ne p1, v2, :cond_3

    .line 84
    .line 85
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 86
    .line 87
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->K:Lv/VDraweeView;

    .line 88
    .line 89
    iget-object v5, p2, Lcom/p1/mobile/putong/feed/data/Moment;->headImage:Ljava/lang/String;

    .line 90
    .line 91
    const/4 v8, 0x0

    .line 92
    const/4 v9, 0x0

    .line 93
    const/4 v6, 0x1

    .line 94
    const/4 v7, 0x0

    .line 95
    invoke-virtual/range {v3 .. v9}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 96
    .line 97
    .line 98
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 99
    .line 100
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->M:Lv/VDraweeView;

    .line 101
    .line 102
    sget v0, Ll/lbc0;->K5:I

    .line 103
    .line 104
    invoke-virtual {p1, p3, v0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->N:Landroid/widget/TextView;

    .line 108
    .line 109
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 110
    .line 111
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 112
    .line 113
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->title:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->o0()Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->H:Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;

    .line 124
    .line 125
    if-eqz p1, :cond_4

    .line 126
    .line 127
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_4
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->t(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public final m0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/aug;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final o0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->O:Ljava/util/Map;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->O:Ljava/util/Map;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->getFrom()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "type_big_card"

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->m0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->r()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->a:Landroid/view/View;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->G:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->getTextView()Lv/VText;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->g:Lv/VText;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->I:Landroid/view/View;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->h:Landroid/view/View;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->D:Landroid/widget/TextView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->c:Landroid/widget/TextView;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->E:Lv/VText;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->d:Lv/VText;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->C:Lv/VLinear;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->b:Lv/VLinear;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceRoomView;->F:Landroid/widget/LinearLayout;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 37
    .line 38
    return-void
.end method
