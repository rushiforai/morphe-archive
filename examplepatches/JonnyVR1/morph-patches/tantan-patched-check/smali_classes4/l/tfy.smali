.class public Ll/tfy;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

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
    iput-object v0, p0, Ll/tfy;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/tfy;->d:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic E(Ll/tfy;Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tfy;->K(Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/tfy;Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tfy;->J(Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->getItem()Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->getItem()Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/tfy;->H(Landroid/view/View;Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tfy;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p2, Ll/pec0;->x1:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public H(Landroid/view/View;Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;

    .line 2
    .line 3
    new-instance p3, Ll/qfy;

    .line 4
    .line 5
    invoke-direct {p3, p0, p2}, Ll/qfy;-><init>(Ll/tfy;Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;)V

    .line 6
    .line 7
    .line 8
    new-instance p4, Ll/rfy;

    .line 9
    .line 10
    invoke-direct {p4, p0, p2}, Ll/rfy;-><init>(Ll/tfy;Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->R(Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;Ll/y20;Ll/y20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public I(I)Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tfy;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic J(Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->getItem()Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 6
    .line 7
    const-string v0, "live"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/LiveType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LiveType;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "meet_photo"

    .line 14
    .line 15
    const-string v2, "meet_realtime_relationship"

    .line 16
    .line 17
    const-string v3, "p_meet"

    .line 18
    .line 19
    if-ne p2, v0, :cond_0

    .line 20
    .line 21
    invoke-static {p1}, Ll/dby;->c(Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-static {v2, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    const-string v0, "module"

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    const-string v2, "other_user_id"

    .line 40
    .line 41
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "live_enter_source"

    .line 46
    .line 47
    const-string v4, "realtime_meet"

    .line 48
    .line 49
    invoke-static {v2, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    filled-new-array {p2, v0, v1, v2}, [Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    const-string v0, "e_live_room_enter"

    .line 58
    .line 59
    invoke-static {v0, v3, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/tfy;->d:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 63
    .line 64
    iget-object p2, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->getItem()Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->n1(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->getItem()Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 83
    .line 84
    const-string v0, "liveVoice"

    .line 85
    .line 86
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/LiveType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LiveType;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    if-ne p2, v0, :cond_1

    .line 91
    .line 92
    invoke-static {p1}, Ll/dby;->c(Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-static {v2, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    const-string v0, "audio_card_type"

    .line 101
    .line 102
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    const-string v0, "e_live_audio_room_enter"

    .line 111
    .line 112
    invoke-static {v0, v3, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Ll/tfy;->d:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 116
    .line 117
    iget-object p2, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 118
    .line 119
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->getItem()Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->o1(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_1
    return-void
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tfy;->d:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->h1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public L(Ljava/util/List;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NotifyDataSetChanged"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tfy;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v1, Ll/sfy;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/sfy;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, v0, v1}, Ll/jyb;->l(Ljava/util/Collection;Ljava/util/Collection;Ll/rcj;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/tfy;->c:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/tfy;->c:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tfy;->I(I)Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
