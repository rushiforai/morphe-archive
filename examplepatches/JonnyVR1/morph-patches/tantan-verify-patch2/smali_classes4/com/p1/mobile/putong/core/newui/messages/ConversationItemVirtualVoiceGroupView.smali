.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

.field public e:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

.field public f:Lv/VImage;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lv/VText;

.field public i:Landroid/widget/TextView;

.field public j:Lv/VText;

.field public k:Lv/VLinear;

.field public l:Lv/VText;

.field public m:Lv/VImage;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Ll/w30;

.field public q:Z

.field public r:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
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

.method public static synthetic h0(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->y0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Landroid/view/View;)V
    .locals 6

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->s0:Ll/rl9;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/rl9;->i3(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->r9()Ll/c8m0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 21
    .line 22
    iget p1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSeq:I

    .line 23
    .line 24
    int-to-long v3, p1

    .line 25
    const/4 v5, 0x0

    .line 26
    const-string v2, "undisplay"

    .line 27
    .line 28
    invoke-interface/range {v0 .. v5}, Ll/c8m0;->e(Ljava/lang/String;Ljava/lang/String;JLjava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 32
    .line 33
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isGuest:Z

    .line 34
    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Xk()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_0

    .line 50
    .line 51
    const-string p0, "operation_type"

    .line 52
    .line 53
    const-string p1, "hide"

    .line 54
    .line 55
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    filled-new-array {p0}, [Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p1, "e_recommand_audio_room_operate"

    .line 64
    .line 65
    const-string v0, "p_messages_view"

    .line 66
    .line 67
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->B0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic k0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->w0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Landroid/view/View;)V
    .locals 7

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->s0:Ll/rl9;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/rl9;->i3(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 9
    .line 10
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isGuest:Z

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Xk()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->r9()Ll/c8m0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 37
    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 41
    .line 42
    iget p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSeq:I

    .line 43
    .line 44
    int-to-long v3, p0

    .line 45
    const-string v5, "guest"

    .line 46
    .line 47
    const/4 v6, 0x0

    .line 48
    const-string v2, "delete"

    .line 49
    .line 50
    invoke-interface/range {v0 .. v6}, Ll/c8m0;->c(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/Runnable;)V

    .line 51
    .line 52
    .line 53
    const-string p0, "operation_type"

    .line 54
    .line 55
    const-string p1, "delete"

    .line 56
    .line 57
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    filled-new-array {p0}, [Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string p1, "e_recommand_audio_room_operate"

    .line 66
    .line 67
    const-string v0, "p_messages_view"

    .line 68
    .line 69
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->r9()Ll/c8m0;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 82
    .line 83
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 86
    .line 87
    iget p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSeq:I

    .line 88
    .line 89
    int-to-long v3, p0

    .line 90
    const/4 v5, 0x0

    .line 91
    const-string v2, "delete"

    .line 92
    .line 93
    invoke-interface/range {v0 .. v5}, Ll/c8m0;->e(Ljava/lang/String;Ljava/lang/String;JLjava/lang/Runnable;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public static synthetic n0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->v0(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->z0(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->u0(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method private synthetic y0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->p:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final synthetic B0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)Z
    .locals 2

    .line 1
    new-instance p4, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 7
    .line 8
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isOnTop:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const-string v0, "\u7f6e\u9876"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v0, "\u53d6\u6d88\u7f6e\u9876"

    .line 16
    .line 17
    :goto_0
    invoke-virtual {p4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    const-string v0, "\u4e0d\u663e\u793a"

    .line 21
    .line 22
    invoke-virtual {p4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    const-string v0, "\u5220\u9664"

    .line 26
    .line 27
    invoke-virtual {p4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/w30$b;

    .line 31
    .line 32
    invoke-direct {v0, p2}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    sget v1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 40
    .line 41
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {v0, p2}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    new-instance v0, Ll/xe6;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Ll/xe6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2, v0}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p2, p4}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    new-instance p4, Ll/ye6;

    .line 63
    .line 64
    invoke-direct {p4, p0, p3, p1}, Ll/ye6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2, p4}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Ll/w30$b;->F()Ll/w30;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->p:Ll/w30;

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 78
    .line 79
    .line 80
    const-string p0, "e_recommand_audio_room_operate"

    .line 81
    .line 82
    const-string p1, "p_messages_view"

    .line 83
    .line 84
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    const/4 p0, 0x1

    .line 88
    return p0
.end method

.method public final D0(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 7

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isOnTop:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->r9()Ll/c8m0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 16
    .line 17
    iget-object v2, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 20
    .line 21
    iget v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSeq:I

    .line 22
    .line 23
    int-to-long v4, v0

    .line 24
    new-instance v6, Ll/df6;

    .line 25
    .line 26
    invoke-direct {v6, p0, p1}, Ll/df6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 27
    .line 28
    .line 29
    const-string v3, "unstick"

    .line 30
    .line 31
    invoke-interface/range {v1 .. v6}, Ll/c8m0;->e(Ljava/lang/String;Ljava/lang/String;JLjava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->r9()Ll/c8m0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 44
    .line 45
    iget-object v2, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 48
    .line 49
    iget v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSeq:I

    .line 50
    .line 51
    int-to-long v4, v0

    .line 52
    new-instance v6, Ll/ef6;

    .line 53
    .line 54
    invoke-direct {v6, p0, p1}, Ll/ef6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 55
    .line 56
    .line 57
    const-string v3, "stick"

    .line 58
    .line 59
    invoke-interface/range {v1 .. v6}, Ll/c8m0;->e(Ljava/lang/String;Ljava/lang/String;JLjava/lang/Runnable;)V

    .line 60
    .line 61
    .line 62
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->s0:Ll/rl9;

    .line 65
    .line 66
    invoke-virtual {p0, p2}, Ll/rl9;->j3(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 67
    .line 68
    .line 69
    const-string p0, "operation_type"

    .line 70
    .line 71
    const-string p1, "topped"

    .line 72
    .line 73
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    filled-new-array {p0}, [Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string p1, "e_recommand_audio_room_operate"

    .line 82
    .line 83
    const-string p2, "p_messages_view"

    .line 84
    .line 85
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public E0(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/data/Conversation;I)V
    .locals 7

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 4
    .line 5
    if-eqz v0, :cond_13

    .line 6
    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 8
    .line 9
    if-eqz v1, :cond_13

    .line 10
    .line 11
    iget-object v2, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 12
    .line 13
    if-eqz v2, :cond_13

    .line 14
    .line 15
    iget-object v2, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 16
    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    goto/16 :goto_8

    .line 20
    .line 21
    :cond_0
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isOnTop:Z

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    const-string v1, "#08000000"

    .line 27
    .line 28
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 37
    .line 38
    .line 39
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->i:Landroid/widget/TextView;

    .line 40
    .line 41
    iget-object v3, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 42
    .line 43
    iget-object v3, v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->title:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->m:Lv/VImage;

    .line 49
    .line 50
    iget-object v3, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 51
    .line 52
    iget-boolean v3, v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemind:Z

    .line 53
    .line 54
    const/4 v4, 0x1

    .line 55
    xor-int/2addr v3, v4

    .line 56
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/gra;->z()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    const/high16 v1, 0x42800000    # 64.0f

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    const/high16 v1, 0x425c0000    # 55.0f

    .line 69
    .line 70
    :goto_1
    iget-object v3, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 71
    .line 72
    iget-boolean v3, v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isEntrance:Z

    .line 73
    .line 74
    if-eqz v3, :cond_3

    .line 75
    .line 76
    iget-object v3, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 77
    .line 78
    iget-boolean v3, v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->isLiving:Z

    .line 79
    .line 80
    if-eqz v3, :cond_3

    .line 81
    .line 82
    const/high16 v3, 0x41000000    # 8.0f

    .line 83
    .line 84
    sub-float/2addr v1, v3

    .line 85
    :cond_3
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->e:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 86
    .line 87
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->setRadius(F)V

    .line 88
    .line 89
    .line 90
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->e:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 95
    .line 96
    new-array v6, v4, [Landroid/view/View;

    .line 97
    .line 98
    aput-object v5, v6, v2

    .line 99
    .line 100
    invoke-static {v3, v6}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 101
    .line 102
    .line 103
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->e:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 104
    .line 105
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    invoke-static {v3, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 110
    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->e:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 113
    .line 114
    iget-object v3, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 115
    .line 116
    iget-object v3, v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->avatars:Ljava/util/List;

    .line 117
    .line 118
    invoke-virtual {v1, v3, v2}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->p0(Ljava/util/List;Z)V

    .line 119
    .line 120
    .line 121
    iget-object v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 122
    .line 123
    iget v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->unreadedCount:I

    .line 124
    .line 125
    if-lez v1, :cond_4

    .line 126
    .line 127
    iget-object v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 128
    .line 129
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemoved:Z

    .line 130
    .line 131
    if-nez v3, :cond_4

    .line 132
    .line 133
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isDissolved:Z

    .line 134
    .line 135
    if-nez v1, :cond_4

    .line 136
    .line 137
    goto :goto_2

    .line 138
    :cond_4
    move v4, v2

    .line 139
    :goto_2
    iput-boolean v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->q:Z

    .line 140
    .line 141
    const/4 v1, 0x4

    .line 142
    if-eqz v4, :cond_7

    .line 143
    .line 144
    iget-object v3, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 145
    .line 146
    iget-boolean v3, v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemind:Z

    .line 147
    .line 148
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->f:Lv/VImage;

    .line 149
    .line 150
    if-eqz v3, :cond_6

    .line 151
    .line 152
    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 153
    .line 154
    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->g:Landroid/widget/FrameLayout;

    .line 156
    .line 157
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 158
    .line 159
    .line 160
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->h:Lv/VText;

    .line 161
    .line 162
    iget-object v3, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 163
    .line 164
    iget v3, v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->unreadedCount:I

    .line 165
    .line 166
    const/16 v4, 0x64

    .line 167
    .line 168
    if-ge v3, v4, :cond_5

    .line 169
    .line 170
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    goto :goto_3

    .line 175
    :cond_5
    const-string v3, "99+"

    .line 176
    .line 177
    :goto_3
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 178
    .line 179
    .line 180
    goto :goto_4

    .line 181
    :cond_6
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 182
    .line 183
    .line 184
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->g:Landroid/widget/FrameLayout;

    .line 185
    .line 186
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 187
    .line 188
    .line 189
    goto :goto_4

    .line 190
    :cond_7
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->g:Landroid/widget/FrameLayout;

    .line 191
    .line 192
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 193
    .line 194
    .line 195
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->f:Lv/VImage;

    .line 196
    .line 197
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 198
    .line 199
    .line 200
    :goto_4
    const-string v1, ""

    .line 201
    .line 202
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->r:Ljava/lang/String;

    .line 203
    .line 204
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 205
    .line 206
    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 207
    .line 208
    .line 209
    iget-object v3, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 210
    .line 211
    iget-object v3, v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateText:Ljava/lang/String;

    .line 212
    .line 213
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 214
    .line 215
    .line 216
    move-result v4

    .line 217
    if-nez v4, :cond_a

    .line 218
    .line 219
    iget-object v4, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 220
    .line 221
    iget-object v4, v4, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 222
    .line 223
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 224
    .line 225
    .line 226
    move-result v4

    .line 227
    if-eqz v4, :cond_8

    .line 228
    .line 229
    iget-object v4, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 230
    .line 231
    iget-object v4, v4, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 232
    .line 233
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 234
    .line 235
    .line 236
    move-result v4

    .line 237
    if-nez v4, :cond_9

    .line 238
    .line 239
    :cond_8
    new-instance v4, Ljava/lang/StringBuilder;

    .line 240
    .line 241
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 242
    .line 243
    .line 244
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    const-string v3, " \u00b7 "

    .line 248
    .line 249
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v3

    .line 256
    :cond_9
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->r:Ljava/lang/String;

    .line 257
    .line 258
    invoke-virtual {v1, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 259
    .line 260
    .line 261
    :cond_a
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->q:Z

    .line 262
    .line 263
    if-eqz v3, :cond_c

    .line 264
    .line 265
    iget-object v3, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 266
    .line 267
    iget-boolean v3, v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemind:Z

    .line 268
    .line 269
    if-nez v3, :cond_c

    .line 270
    .line 271
    iget-object v3, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 272
    .line 273
    iget v3, v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->unreadedCount:I

    .line 274
    .line 275
    const/16 v4, 0x63

    .line 276
    .line 277
    if-le v3, v4, :cond_b

    .line 278
    .line 279
    const-string v3, "[99+]"

    .line 280
    .line 281
    goto :goto_5

    .line 282
    :cond_b
    new-instance v3, Ljava/lang/StringBuilder;

    .line 283
    .line 284
    const-string v4, "["

    .line 285
    .line 286
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    iget-object v4, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 290
    .line 291
    iget v4, v4, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->unreadedCount:I

    .line 292
    .line 293
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    const-string v4, "\u6761]"

    .line 297
    .line 298
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v3

    .line 305
    :goto_5
    invoke-virtual {v1, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 306
    .line 307
    .line 308
    :cond_c
    iget-object v3, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 309
    .line 310
    iget-object v3, v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 311
    .line 312
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 313
    .line 314
    .line 315
    move-result v3

    .line 316
    if-nez v3, :cond_d

    .line 317
    .line 318
    iget-object v3, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 319
    .line 320
    iget-object v3, v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 321
    .line 322
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 323
    .line 324
    .line 325
    move-result v3

    .line 326
    if-eqz v3, :cond_d

    .line 327
    .line 328
    iget-object v3, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 329
    .line 330
    iget-object v3, v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 331
    .line 332
    invoke-virtual {v1, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 333
    .line 334
    .line 335
    move-result-object v3

    .line 336
    const-string v4, ":"

    .line 337
    .line 338
    invoke-virtual {v3, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 339
    .line 340
    .line 341
    move-result-object v3

    .line 342
    iget-object v4, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 343
    .line 344
    iget-object v4, v4, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentMsg:Ljava/lang/String;

    .line 345
    .line 346
    invoke-virtual {v3, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 347
    .line 348
    .line 349
    :cond_d
    iget-object v3, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 350
    .line 351
    iget-object v3, v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 352
    .line 353
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 354
    .line 355
    .line 356
    move-result v3

    .line 357
    if-nez v3, :cond_e

    .line 358
    .line 359
    iget-object v3, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 360
    .line 361
    iget-object v3, v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 362
    .line 363
    invoke-virtual {v1, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 364
    .line 365
    .line 366
    :cond_e
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->r:Ljava/lang/String;

    .line 367
    .line 368
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 369
    .line 370
    .line 371
    move-result v3

    .line 372
    if-nez v3, :cond_f

    .line 373
    .line 374
    :try_start_0
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    .line 375
    .line 376
    iget-object v4, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 377
    .line 378
    iget-object v4, v4, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateTextColor:Ljava/lang/String;

    .line 379
    .line 380
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 381
    .line 382
    .line 383
    move-result v4

    .line 384
    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 385
    .line 386
    .line 387
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->r:Ljava/lang/String;

    .line 388
    .line 389
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 390
    .line 391
    .line 392
    move-result v4

    .line 393
    const/16 v5, 0x22

    .line 394
    .line 395
    invoke-virtual {v1, v3, v2, v4, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 396
    .line 397
    .line 398
    goto :goto_6

    .line 399
    :catch_0
    move-exception v2

    .line 400
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 401
    .line 402
    .line 403
    :cond_f
    :goto_6
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->j:Lv/VText;

    .line 404
    .line 405
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 406
    .line 407
    .line 408
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->l:Lv/VText;

    .line 409
    .line 410
    iget-object v2, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 411
    .line 412
    iget-wide v2, v2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentTime:J

    .line 413
    .line 414
    long-to-double v2, v2

    .line 415
    invoke-static {v2, v3}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object v2

    .line 419
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 420
    .line 421
    .line 422
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->G0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 423
    .line 424
    .line 425
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->J0(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 426
    .line 427
    .line 428
    iget-object v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 429
    .line 430
    iget-boolean v2, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isEntrance:Z

    .line 431
    .line 432
    const-string v3, "p_messages_view"

    .line 433
    .line 434
    if-eqz v2, :cond_10

    .line 435
    .line 436
    const-string v1, "e_audio_liked_room_cell"

    .line 437
    .line 438
    invoke-static {v1, v3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 439
    .line 440
    .line 441
    goto :goto_7

    .line 442
    :cond_10
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isGuest:Z

    .line 443
    .line 444
    if-eqz v1, :cond_11

    .line 445
    .line 446
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 447
    .line 448
    .line 449
    move-result-object v1

    .line 450
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 451
    .line 452
    .line 453
    move-result-object v1

    .line 454
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Xk()Z

    .line 455
    .line 456
    .line 457
    move-result v1

    .line 458
    if-eqz v1, :cond_12

    .line 459
    .line 460
    const-string v1, "anchorId"

    .line 461
    .line 462
    const-string v2, "NA"

    .line 463
    .line 464
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 465
    .line 466
    .line 467
    move-result-object v1

    .line 468
    iget-object v2, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 469
    .line 470
    iget-object v2, v2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->liveId:Ljava/lang/String;

    .line 471
    .line 472
    const-string v4, "liveId"

    .line 473
    .line 474
    invoke-static {v4, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 475
    .line 476
    .line 477
    move-result-object v2

    .line 478
    const-string v4, "audio_card_type"

    .line 479
    .line 480
    const-string v5, "message_cell"

    .line 481
    .line 482
    invoke-static {v4, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 483
    .line 484
    .line 485
    move-result-object v4

    .line 486
    iget-object v5, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 487
    .line 488
    iget-object v5, v5, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 489
    .line 490
    const-string v6, "roomId"

    .line 491
    .line 492
    invoke-static {v6, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 493
    .line 494
    .line 495
    move-result-object v5

    .line 496
    filled-new-array {v1, v2, v4, v5}, [Ll/pf60;

    .line 497
    .line 498
    .line 499
    move-result-object v1

    .line 500
    const-string v2, "e_radio_room_recommend"

    .line 501
    .line 502
    invoke-static {v2, v3, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 503
    .line 504
    .line 505
    goto :goto_7

    .line 506
    :cond_11
    const-string v1, "e_live_audio_room_enter"

    .line 507
    .line 508
    invoke-virtual {p0, v0, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->t0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;I)Ljava/util/HashMap;

    .line 509
    .line 510
    .line 511
    move-result-object v2

    .line 512
    invoke-static {v1, v3, v2}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 513
    .line 514
    .line 515
    :cond_12
    :goto_7
    new-instance v1, Ll/ve6;

    .line 516
    .line 517
    invoke-direct {v1, p0, v0, p3}, Ll/ve6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;I)V

    .line 518
    .line 519
    .line 520
    invoke-virtual {p0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 521
    .line 522
    .line 523
    iget-object p3, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 524
    .line 525
    iget-boolean p3, p3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isEntrance:Z

    .line 526
    .line 527
    if-nez p3, :cond_13

    .line 528
    .line 529
    new-instance p3, Ll/we6;

    .line 530
    .line 531
    invoke-direct {p3, p0, v0, p1, p2}, Ll/we6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 532
    .line 533
    .line 534
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 535
    .line 536
    .line 537
    :cond_13
    :goto_8
    return-void
.end method

.method public final G0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->d:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 4
    .line 5
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isEntrance:Z

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 12
    .line 13
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->isLiving:Z

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    move v1, v3

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v1, v2

    .line 20
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->o:Lv/VText;

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 26
    .line 27
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isEntrance:Z

    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 32
    .line 33
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->isLiving:Z

    .line 34
    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    move v1, v3

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    move v1, v2

    .line 40
    :goto_1
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->l:Lv/VText;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 46
    .line 47
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isEntrance:Z

    .line 48
    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 52
    .line 53
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->isLiving:Z

    .line 54
    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    move v2, v3

    .line 58
    :cond_2
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 62
    .line 63
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isEntrance:Z

    .line 64
    .line 65
    if-eqz v0, :cond_4

    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 68
    .line 69
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->isLiving:Z

    .line 70
    .line 71
    if-nez p1, :cond_3

    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->d:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->f()V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_4
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->d:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->g()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final H0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 1

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "\u4e0d\u663e\u793a\u8be5\u804a\u5929"

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "\u70b9\u51fb\u786e\u5b9a\u5f53\u524d\u4f1a\u8bdd\u6d88\u5931\uff0c\u6536\u5230\u65b0\u6d88\u606f\u4f1a\u518d\u6b21\u51fa\u73b0"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "\u786e\u5b9a"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance v0, Ll/bf6;

    .line 34
    .line 35
    invoke-direct {v0, p1}, Ll/bf6;-><init>(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string p1, "\u518d\u60f3\u60f3"

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance p1, Ll/cf6;

    .line 49
    .line 50
    invoke-direct {p1}, Ll/cf6;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final I0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 1

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "\u662f\u5426\u8981\u5220\u9664\u8be5\u5bf9\u8bdd\uff1f"

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "\u786e\u8ba4\u540e\uff0c\u597d\u53cb\u4f1a\u8bdd\u53ca\u804a\u5929\u8bb0\u5f55\u4f1a\u6d88\u5931\uff0c\u4e0b\u6b21\u6536\u5230\u6d88\u606f\u65f6\u4f1a\u8bdd\u4f1a\u518d\u6b21\u51fa\u73b0"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "\u786e\u5b9a"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance v0, Ll/ze6;

    .line 34
    .line 35
    invoke-direct {v0, p1}, Ll/ze6;-><init>(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string p1, "\u518d\u60f3\u60f3"

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance p1, Ll/af6;

    .line 49
    .line 50
    invoke-direct {p1}, Ll/af6;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final J0(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->n:Lv/VText;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 7

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->r0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget v0, Ll/sj6;->R:I

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    const/high16 v0, 0x40c00000    # 6.0f

    .line 19
    .line 20
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sget v1, Ll/sj6;->Q:I

    .line 25
    .line 26
    add-int/2addr v0, v1

    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->d:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 28
    .line 29
    const/4 v3, 0x1

    .line 30
    new-array v4, v3, [Landroid/view/View;

    .line 31
    .line 32
    const/4 v5, 0x0

    .line 33
    aput-object v2, v4, v5

    .line 34
    .line 35
    invoke-static {v0, v4}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->d:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 39
    .line 40
    sget v2, Ll/qa00;->h:I

    .line 41
    .line 42
    sub-int v4, v1, v2

    .line 43
    .line 44
    sget v6, Ll/qa00;->g:I

    .line 45
    .line 46
    add-int/2addr v6, v1

    .line 47
    invoke-virtual {v0, v4, v6}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->d(II)V

    .line 48
    .line 49
    .line 50
    sub-int/2addr v1, v2

    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->e:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 52
    .line 53
    new-array v2, v3, [Landroid/view/View;

    .line 54
    .line 55
    aput-object v0, v2, v5

    .line 56
    .line 57
    invoke-static {v1, v2}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->i:Landroid/widget/TextView;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->l:Lv/VText;

    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/ue6;->k0(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->j:Lv/VText;

    .line 68
    .line 69
    invoke-static {p0}, Ll/ue6;->e0(Landroid/widget/TextView;)V

    .line 70
    .line 71
    .line 72
    :cond_0
    return-void
.end method

.method public final r0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ff6;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final s0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 1

    .line 1
    const-string p1, "e_audio_liked_room_cell"

    .line 2
    .line 3
    const-string v0, "p_messages_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p1, p0}, Ll/ftn0;->n(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final t0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;I)Ljava/util/HashMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;",
            "I)",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "anchorId"

    .line 7
    .line 8
    const-string v1, "NA"

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->liveId:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "liveId"

    .line 18
    .line 19
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    const-string p1, "audio_card_type"

    .line 23
    .line 24
    const-string v0, "message_settled_room"

    .line 25
    .line 26
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    const-string p1, "index"

    .line 30
    .line 31
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    return-object p0
.end method

.method public final synthetic u0(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isOnTop:Z

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->r9()Ll/c8m0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 24
    .line 25
    invoke-interface {p0, p1}, Ll/c8m0;->b(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic v0(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isOnTop:Z

    .line 9
    .line 10
    const-string v0, "#08000000"

    .line 11
    .line 12
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->r9()Ll/c8m0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 30
    .line 31
    invoke-interface {p0, p1}, Ll/c8m0;->b(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic w0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;ILandroid/view/View;)V
    .locals 8

    .line 1
    iget-object p3, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 2
    .line 3
    iget-boolean v0, p3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isEntrance:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->s0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-boolean p3, p3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isDissolved:Z

    .line 12
    .line 13
    if-eqz p3, :cond_1

    .line 14
    .line 15
    new-instance p2, Ll/th0$a;

    .line 16
    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-direct {p2, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->dissolveReason:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p2, p0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "\u786e\u8ba4"

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    invoke-interface {p3}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->act()Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget-object p3, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 59
    .line 60
    iget-object v2, p3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->liveId:Ljava/lang/String;

    .line 61
    .line 62
    const-string v4, ""

    .line 63
    .line 64
    const/4 v5, 0x0

    .line 65
    const-string v3, "suggest-card"

    .line 66
    .line 67
    invoke-interface/range {v0 .. v5}, Ll/ftn0;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object p3, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 71
    .line 72
    iget-boolean p3, p3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isGuest:Z

    .line 73
    .line 74
    const-string v0, "p_messages_view"

    .line 75
    .line 76
    if-eqz p3, :cond_3

    .line 77
    .line 78
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Xk()Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-eqz p0, :cond_2

    .line 91
    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->r9()Ll/c8m0;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 101
    .line 102
    iget-object v2, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 103
    .line 104
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 105
    .line 106
    iget p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSeq:I

    .line 107
    .line 108
    int-to-long v4, p0

    .line 109
    const-string v6, "guest"

    .line 110
    .line 111
    const/4 v7, 0x0

    .line 112
    const-string v3, "click"

    .line 113
    .line 114
    invoke-interface/range {v1 .. v7}, Ll/c8m0;->c(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/Runnable;)V

    .line 115
    .line 116
    .line 117
    const-string p0, "anchorId"

    .line 118
    .line 119
    const-string p2, "NA"

    .line 120
    .line 121
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    iget-object p2, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 126
    .line 127
    iget-object p2, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->liveId:Ljava/lang/String;

    .line 128
    .line 129
    const-string p3, "liveId"

    .line 130
    .line 131
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    const-string p3, "audio_card_type"

    .line 136
    .line 137
    const-string v1, "message_cell"

    .line 138
    .line 139
    invoke-static {p3, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 140
    .line 141
    .line 142
    move-result-object p3

    .line 143
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 144
    .line 145
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 146
    .line 147
    const-string v1, "roomId"

    .line 148
    .line 149
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    filled-new-array {p0, p2, p3, p1}, [Ll/pf60;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    const-string p1, "e_radio_room_recommend"

    .line 158
    .line 159
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 160
    .line 161
    .line 162
    :cond_2
    return-void

    .line 163
    :cond_3
    const-string p3, "e_live_audio_room_enter"

    .line 164
    .line 165
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->t0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;I)Ljava/util/HashMap;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-static {p3, v0, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 170
    .line 171
    .line 172
    return-void
.end method

.method public final synthetic z0(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    if-eqz p5, :cond_1

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    if-eq p5, p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->I0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->H0(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->D0(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 15
    .line 16
    .line 17
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->p:Ll/w30;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 20
    .line 21
    .line 22
    return-void
.end method
