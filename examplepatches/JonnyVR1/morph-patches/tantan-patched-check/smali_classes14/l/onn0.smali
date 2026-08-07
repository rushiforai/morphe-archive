.class public Ll/onn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/lnn0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Landroidx/recyclerview/widget/RecyclerView;

.field public c:Lv/VLinear;

.field public d:Landroid/widget/ImageView;

.field public e:Landroid/widget/TextView;

.field public f:Ll/lnn0;

.field public g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public h:Landroidx/recyclerview/widget/LinearLayoutManager;

.field public i:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/onn0;->i:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/onn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/onn0;->k()V

    return-void
.end method

.method public static synthetic b(Ll/onn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/onn0;->i(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c(Ll/onn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/onn0;->k()V

    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/onn0;->f:Ll/lnn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lnn0;->f0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pnn0;->b(Ll/onn0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/lnn0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/onn0;->f:Ll/lnn0;

    .line 2
    .line 3
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/onn0;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    const-string v1, "\u559c\u6b22\u7684\u804a\u5929\u5ba4"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/onn0;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/mnn0;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/mnn0;-><init>(Ll/onn0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/onn0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 19
    .line 20
    new-instance v1, Ll/onn0$a;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/onn0$a;-><init>(Ll/onn0;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 29
    .line 30
    iget-object v1, p0, Ll/onn0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const/4 v2, 0x1

    .line 37
    const/4 v3, 0x0

    .line 38
    invoke-direct {v0, v1, v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Ll/onn0;->h:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 42
    .line 43
    iget-object v1, p0, Ll/onn0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 49
    .line 50
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Ll/onn0;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 54
    .line 55
    iget-object v1, p0, Ll/onn0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/onn0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 61
    .line 62
    new-instance v1, Ll/onn0$b;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/onn0$b;-><init>(Ll/onn0;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/lnn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/onn0;->e(Ll/lnn0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/onn0;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/onn0;->c:Lv/VLinear;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/onn0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 15
    .line 16
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/onn0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 24
    .line 25
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-ge v2, v1, :cond_1

    .line 38
    .line 39
    new-instance v1, Ll/hnn0;

    .line 40
    .line 41
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 46
    .line 47
    invoke-direct {v1, v2, v3}, Ll/hnn0;-><init>(ILcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    add-int/lit8 v2, v2, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    iget-object p1, p0, Ll/onn0;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 59
    .line 60
    .line 61
    :goto_1
    new-instance p1, Ll/nnn0;

    .line 62
    .line 63
    invoke-direct {p1, p0}, Ll/nnn0;-><init>(Ll/onn0;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final k()V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/onn0;->h:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/onn0;->h:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ltz v0, :cond_3

    .line 14
    .line 15
    if-gez v1, :cond_0

    .line 16
    .line 17
    goto/16 :goto_2

    .line 18
    .line 19
    :cond_0
    :goto_0
    if-gt v0, v1, :cond_3

    .line 20
    .line 21
    iget-object v2, p0, Ll/onn0;->i:Ljava/util/HashSet;

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v2, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_2

    .line 32
    .line 33
    iget-object v2, p0, Ll/onn0;->i:Ljava/util/HashSet;

    .line 34
    .line 35
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v2, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Ll/onn0;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 43
    .line 44
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Ll/hnn0;

    .line 53
    .line 54
    sget-object v3, Ll/zeu;->g:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v2}, Ll/hnn0;->H()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    iget-object v4, v4, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 61
    .line 62
    iget-object v4, v4, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->anchorId:Ljava/lang/String;

    .line 63
    .line 64
    const-string v5, "anchorId"

    .line 65
    .line 66
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    invoke-virtual {v2}, Ll/hnn0;->H()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    iget-object v4, v4, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 75
    .line 76
    iget-object v4, v4, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 77
    .line 78
    const-string v5, "roomId"

    .line 79
    .line 80
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object v7

    .line 84
    invoke-virtual {v2}, Ll/hnn0;->H()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    iget-object v4, v4, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 89
    .line 90
    iget-object v4, v4, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->liveId:Ljava/lang/String;

    .line 91
    .line 92
    const-string v5, "liveId"

    .line 93
    .line 94
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object v8

    .line 98
    invoke-virtual {v2}, Ll/hnn0;->I()I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    const-string v5, "index"

    .line 107
    .line 108
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object v9

    .line 112
    const-string v4, "audio_card_type"

    .line 113
    .line 114
    const-string v5, "liked_audio_room"

    .line 115
    .line 116
    invoke-static {v4, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 117
    .line 118
    .line 119
    move-result-object v10

    .line 120
    invoke-virtual {v2}, Ll/hnn0;->H()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    iget-object v2, v2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 125
    .line 126
    iget-boolean v2, v2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->isLiving:Z

    .line 127
    .line 128
    if-eqz v2, :cond_1

    .line 129
    .line 130
    const-string v2, "onLive"

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_1
    const-string v2, "endLive"

    .line 134
    .line 135
    :goto_1
    const-string v4, "liveStatus"

    .line 136
    .line 137
    invoke-static {v4, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 138
    .line 139
    .line 140
    move-result-object v11

    .line 141
    filled-new-array/range {v6 .. v11}, [Ll/pf60;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    const-string v4, "e_live_audio_room_enter"

    .line 146
    .line 147
    invoke-static {v4, v3, v2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 148
    .line 149
    .line 150
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :cond_3
    :goto_2
    return-void
.end method
