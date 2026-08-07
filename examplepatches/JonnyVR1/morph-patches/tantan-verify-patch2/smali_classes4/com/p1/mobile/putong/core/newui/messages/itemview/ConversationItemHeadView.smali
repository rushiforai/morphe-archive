.class public Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/orl;
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;

.field public b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

.field public c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

.field public d:Landroid/view/View;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

.field public h:Landroid/widget/FrameLayout;

.field public i:Lv/VImage;

.field public j:Lv/VImage;

.field public k:Lv/VImage;

.field public l:Lv/VDraweeView;

.field public m:Lv/VImage;

.field public n:Lv/VImage;

.field public o:Landroid/widget/FrameLayout;

.field public p:Lv/VText;

.field public q:Lv/VDraweeView;

.field public r:Ll/sj6;

.field public final s:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sget p1, Ll/sj6;->Q:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/high16 p1, 0x425c0000    # 55.0f

    .line 17
    .line 18
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->s:I

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 25
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 27
    invoke-static {}, Ll/gra;->z()Z

    move-result p1

    if-eqz p1, :cond_0

    sget p1, Ll/sj6;->Q:I

    goto :goto_0

    :cond_0
    const/high16 p1, 0x425c0000    # 55.0f

    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->s:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 28
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 30
    invoke-static {}, Ll/gra;->z()Z

    move-result p1

    if-eqz p1, :cond_0

    sget p1, Ll/sj6;->Q:I

    goto :goto_0

    :cond_0
    const/high16 p1, 0x425c0000    # 55.0f

    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->s:I

    return-void
.end method

.method public static synthetic M0(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;Lcom/p1/mobile/putong/data/UserLiveLabel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->h1(Lcom/p1/mobile/putong/data/UserLiveLabel;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b1(Ljava/text/SimpleDateFormat;JLl/orl;)V
    .locals 8

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v2

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->I0:Ll/byd0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Long;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v4

    .line 21
    move-object v1, p0

    .line 22
    move-wide v6, p1

    .line 23
    move-object v0, p3

    .line 24
    invoke-interface/range {v0 .. v7}, Ll/nrl;->r(Ljava/text/SimpleDateFormat;JJJ)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic c1(Ll/sj6;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->performClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private setLivingHead(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    invoke-interface {p0, v0, p1}, Ll/ue6;->H(Ll/sj6;Z)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_5

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 10
    .line 11
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    invoke-static {p1}, Ll/ue6;->o(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    goto/16 :goto_2

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 22
    .line 23
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 34
    .line 35
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 48
    .line 49
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    goto :goto_0

    .line 64
    :cond_1
    const-string p1, ""

    .line 65
    .line 66
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 67
    .line 68
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 69
    .line 70
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 77
    .line 78
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_2

    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 87
    .line 88
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 89
    .line 90
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    :cond_2
    invoke-static {}, Ll/gra;->a2()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_3

    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 101
    .line 102
    iget-boolean v1, v0, Ll/sj6;->e:Z

    .line 103
    .line 104
    invoke-interface {p0, v1}, Ll/ue6;->V0(Z)Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    invoke-interface {p0, v0, v1}, Ll/ue6;->a0(Ll/sj6;Z)Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 113
    .line 114
    invoke-interface {p0, v1}, Ll/ue6;->r0(Ll/sj6;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-nez v2, :cond_4

    .line 123
    .line 124
    move-object p1, v1

    .line 125
    goto :goto_1

    .line 126
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->getUserLiveLabelHashMap()Ljava/util/HashMap;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 131
    .line 132
    iget-object v1, v1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 133
    .line 134
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    check-cast v0, Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 141
    .line 142
    :cond_4
    :goto_1
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->k1(Lcom/p1/mobile/putong/data/UserLiveLabel;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 146
    .line 147
    const/4 p1, 0x0

    .line 148
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 149
    .line 150
    .line 151
    :cond_5
    :goto_2
    return-void
.end method

.method public static synthetic u(Ll/sj6;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->performClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public A(Ll/sj6;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public G0(Ll/sj6;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 6
    .line 7
    iget-object p1, p1, Ll/sj6;->c:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-static {p1}, Ll/gra;->Z(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, p0, p1, v1}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public J(Ll/sj6;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "fake_conversation_anonymous_greeting"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {v1, v2}, Landroid/view/View;->setClickable(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->k:Lv/VImage;

    .line 26
    .line 27
    const/16 v3, 0x8

    .line 28
    .line 29
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/gra;->z()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    sget v1, Ll/dbc0;->xg:I

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    sget v1, Ll/dbc0;->F6:I

    .line 42
    .line 43
    :goto_0
    if-eqz v0, :cond_1

    .line 44
    .line 45
    sget v1, Ll/dbc0;->r0:I

    .line 46
    .line 47
    :cond_1
    invoke-static {}, Ll/d79;->U()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->i:Lv/VImage;

    .line 54
    .line 55
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    sget v1, Ll/dbc0;->z9:I

    .line 59
    .line 60
    :cond_2
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 61
    .line 62
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 63
    .line 64
    invoke-virtual {v0, v3, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 84
    .line 85
    iget v0, v0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->unseen:I

    .line 86
    .line 87
    if-lez v0, :cond_3

    .line 88
    .line 89
    invoke-interface {p0, p1}, Ll/ue6;->D(Ll/sj6;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-nez p1, :cond_3

    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->j:Lv/VImage;

    .line 96
    .line 97
    const/4 p1, 0x1

    .line 98
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    :cond_3
    return-void
.end method

.method public K0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public P(Ll/sj6;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p1, Ll/sj6;->F:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    iget v1, p1, Ll/sj6;->H:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 8
    .line 9
    .line 10
    iget-boolean v0, p1, Ll/sj6;->u:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p1, Ll/sj6;->r:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 41
    .line 42
    invoke-interface {p0, p1}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_0
    iget v0, p1, Ll/sj6;->H:I

    .line 51
    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget-object p1, p1, Ll/sj6;->I:Lcom/p1/mobile/putong/core/data/Message;

    .line 55
    .line 56
    if-nez p1, :cond_1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 70
    .line 71
    sget v1, Ll/qa00;->e:I

    .line 72
    .line 73
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 77
    .line 78
    sget v1, Ll/dbc0;->wu:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 81
    .line 82
    .line 83
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 86
    .line 87
    invoke-interface {p0, p1}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 96
    .line 97
    const/4 v0, 0x0

    .line 98
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 102
    .line 103
    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 104
    .line 105
    .line 106
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 109
    .line 110
    sget v1, Ll/dbc0;->Dp:I

    .line 111
    .line 112
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 113
    .line 114
    .line 115
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->w1()V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public Q0(Ll/sj6;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->o:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->f:Landroid/view/View;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->v1()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->p1()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l1()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 26
    .line 27
    const-string v2, "intlSeeChatRequest"

    .line 28
    .line 29
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->j1(Lcom/p1/mobile/putong/data/User;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->m:Lv/VImage;

    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->m1()V

    .line 47
    .line 48
    .line 49
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 50
    .line 51
    iget-object v2, p1, Ll/sj6;->c:Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    iget v3, p1, Ll/sj6;->A:I

    .line 54
    .line 55
    invoke-virtual {p0, v0, v2, v3}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->o1(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->n1()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q1()V

    .line 62
    .line 63
    .line 64
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 65
    .line 66
    invoke-static {v0}, Ll/ue6;->o(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_1

    .line 71
    .line 72
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 73
    .line 74
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 75
    .line 76
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 77
    .line 78
    invoke-interface {p0, p1}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    const/4 v3, 0x4

    .line 87
    const/4 v4, 0x5

    .line 88
    invoke-virtual {v0, v2, p1, v3, v4}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 92
    .line 93
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_1
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 98
    .line 99
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 100
    .line 101
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 102
    .line 103
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isQuickChatClearAvatar(Lcom/p1/mobile/putong/data/User;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_2

    .line 112
    .line 113
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 116
    .line 117
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 118
    .line 119
    invoke-interface {p0, p1}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 124
    .line 125
    .line 126
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->y0()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->w1()V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r1()V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public U(Ll/sj6;)V
    .locals 3
    .param p1    # Ll/sj6;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->d:Landroid/view/View;

    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->e:Landroid/view/View;

    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->h:Landroid/widget/FrameLayout;

    .line 25
    .line 26
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->m:Lv/VImage;

    .line 30
    .line 31
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->n:Lv/VImage;

    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->o:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_frame()Lv/VDraweeView;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->s:I

    .line 60
    .line 61
    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 62
    .line 63
    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 66
    .line 67
    invoke-virtual {v1, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    .line 69
    .line 70
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 73
    .line 74
    sget v2, Ll/dbc0;->U5:I

    .line 75
    .line 76
    invoke-virtual {p1, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 80
    .line 81
    const/4 v1, 0x1

    .line 82
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 86
    .line 87
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 91
    .line 92
    const/4 v1, 0x0

    .line 93
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g1()V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public X0(Ll/sj6;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 4
    .line 5
    new-instance v1, Ll/ia6;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Ll/ia6;-><init>(Ll/sj6;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->d:Landroid/view/View;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->d:Landroid/view/View;

    .line 20
    .line 21
    sget v1, Ll/dbc0;->t5:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    sget p1, Ll/dbc0;->u5:I

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->z0(I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->B0(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public d(Ll/sj6;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 14
    .line 15
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, v1, p0}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public d0(Ll/sj6;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    iget-boolean v2, p1, Ll/sj6;->u:Z

    .line 12
    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    iget-object v2, p1, Ll/sj6;->r:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 61
    .line 62
    invoke-interface {p0, p1}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 67
    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :cond_1
    invoke-static {}, Ll/gra;->t1()Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-eqz v2, :cond_3

    .line 76
    .line 77
    iget-object v2, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_2

    .line 84
    .line 85
    iget-object v2, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 86
    .line 87
    iget-boolean v3, v2, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 88
    .line 89
    if-nez v3, :cond_2

    .line 90
    .line 91
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 92
    .line 93
    const-string v3, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 94
    .line 95
    invoke-static {v3}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_3

    .line 104
    .line 105
    :cond_2
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 108
    .line 109
    sget v1, Ll/dbc0;->bd:I

    .line 110
    .line 111
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 112
    .line 113
    .line 114
    goto/16 :goto_0

    .line 115
    .line 116
    :cond_3
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 117
    .line 118
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-eqz v2, :cond_6

    .line 123
    .line 124
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 125
    .line 126
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 127
    .line 128
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    if-eqz v2, :cond_6

    .line 133
    .line 134
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 135
    .line 136
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 137
    .line 138
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->avatarBlurred:Z

    .line 139
    .line 140
    if-eqz v2, :cond_4

    .line 141
    .line 142
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->z(I)Ll/pf60;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 147
    .line 148
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 149
    .line 150
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 151
    .line 152
    invoke-interface {p0, p1}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    iget-object v3, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 161
    .line 162
    check-cast v3, Ljava/lang/Integer;

    .line 163
    .line 164
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 165
    .line 166
    .line 167
    move-result v3

    .line 168
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 169
    .line 170
    check-cast v0, Ljava/lang/Integer;

    .line 171
    .line 172
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    invoke-virtual {v1, v2, p1, v3, v0}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 177
    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_4
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    if-eqz v0, :cond_5

    .line 185
    .line 186
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 187
    .line 188
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 189
    .line 190
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 191
    .line 192
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    goto :goto_0

    .line 200
    :cond_5
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 201
    .line 202
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 203
    .line 204
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 205
    .line 206
    invoke-interface {p0, p1}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 211
    .line 212
    .line 213
    goto :goto_0

    .line 214
    :cond_6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    if-eqz v0, :cond_7

    .line 219
    .line 220
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 221
    .line 222
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-eqz v0, :cond_7

    .line 227
    .line 228
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 229
    .line 230
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 231
    .line 232
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 233
    .line 234
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    goto :goto_0

    .line 242
    :cond_7
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 243
    .line 244
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 245
    .line 246
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 247
    .line 248
    invoke-interface {p0, p1}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 253
    .line 254
    .line 255
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->w1()V

    .line 256
    .line 257
    .line 258
    return-void
.end method

.method public final d1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ja6;->a(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e(Ll/sj6;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-boolean v0, p1, Ll/sj6;->u:Z

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p1, Ll/sj6;->w:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 19
    .line 20
    iget-object v3, p1, Ll/sj6;->w:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    invoke-interface {p0, v3}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v0, p1, Ll/sj6;->B:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 43
    .line 44
    sget v3, Ll/dbc0;->m8:I

    .line 45
    .line 46
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 51
    .line 52
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 53
    .line 54
    iget-object v3, p1, Ll/sj6;->B:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 55
    .line 56
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Lcom/p1/mobile/putong/data/Picture;

    .line 63
    .line 64
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :goto_0
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 80
    .line 81
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 82
    .line 83
    const/4 v3, 0x1

    .line 84
    if-eqz v2, :cond_3

    .line 85
    .line 86
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->j:Lv/VImage;

    .line 87
    .line 88
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 89
    .line 90
    if-lez v0, :cond_2

    .line 91
    .line 92
    invoke-interface {p0, p1}, Ll/ue6;->D(Ll/sj6;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-nez v0, :cond_2

    .line 97
    .line 98
    move v0, v3

    .line 99
    goto :goto_1

    .line 100
    :cond_2
    move v0, v1

    .line 101
    :goto_1
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 102
    .line 103
    .line 104
    move v0, v3

    .line 105
    goto :goto_2

    .line 106
    :cond_3
    move v0, v1

    .line 107
    :goto_2
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->o:Landroid/widget/FrameLayout;

    .line 108
    .line 109
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    if-nez v0, :cond_4

    .line 113
    .line 114
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 115
    .line 116
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 117
    .line 118
    if-lez v0, :cond_4

    .line 119
    .line 120
    invoke-interface {p0, p1}, Ll/ue6;->D(Ll/sj6;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-nez v0, :cond_4

    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->o:Landroid/widget/FrameLayout;

    .line 127
    .line 128
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 132
    .line 133
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 134
    .line 135
    invoke-static {v0}, Ll/a9g0;->f(I)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    if-nez v2, :cond_4

    .line 144
    .line 145
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->p:Lv/VText;

    .line 146
    .line 147
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    .line 149
    .line 150
    :cond_4
    iget-object v0, p1, Ll/sj6;->B:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 151
    .line 152
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 153
    .line 154
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 163
    .line 164
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-nez v0, :cond_5

    .line 169
    .line 170
    invoke-static {}, Lcom/p1/mobile/putong/data/User;->new_()Lcom/p1/mobile/putong/data/User;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    iget-object v2, p1, Ll/sj6;->B:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 175
    .line 176
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 177
    .line 178
    iput-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 179
    .line 180
    iput-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 181
    .line 182
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->setLivingHead(Z)V

    .line 183
    .line 184
    .line 185
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->y0()V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->w1()V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r1()V

    .line 192
    .line 193
    .line 194
    return-void
.end method

.method public final e1()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->a2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->isClickable()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-virtual {v1}, Landroid/view/View;->isClickable()Z

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public f1()V
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->I0:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    const-wide/16 v2, 0x3e8

    .line 18
    .line 19
    div-long/2addr v0, v2

    .line 20
    invoke-static {}, Ll/pzi0;->o()J

    .line 21
    .line 22
    .line 23
    move-result-wide v4

    .line 24
    div-long/2addr v4, v2

    .line 25
    sub-long/2addr v0, v4

    .line 26
    long-to-int v0, v0

    .line 27
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->I0:Ll/byd0;

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ljava/lang/Long;

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 40
    .line 41
    .line 42
    move-result-wide v4

    .line 43
    div-long/2addr v4, v2

    .line 44
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->H0:Ll/byd0;

    .line 49
    .line 50
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Ljava/lang/Long;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 57
    .line 58
    .line 59
    move-result-wide v6

    .line 60
    div-long/2addr v6, v2

    .line 61
    sub-long/2addr v4, v6

    .line 62
    if-lez v0, :cond_1

    .line 63
    .line 64
    const-wide/16 v0, 0x0

    .line 65
    .line 66
    cmp-long v0, v4, v0

    .line 67
    .line 68
    if-gtz v0, :cond_0

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 72
    .line 73
    const-string v1, "HH:mm:ss"

    .line 74
    .line 75
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    const-string v1, "GMT"

    .line 79
    .line 80
    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 88
    .line 89
    sget v2, Ll/dbc0;->Kd:I

    .line 90
    .line 91
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->setBitmapRes(I)V

    .line 92
    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 95
    .line 96
    iget-object v1, v1, Ll/sj6;->E:Ljava/util/List;

    .line 97
    .line 98
    new-instance v2, Ll/ha6;

    .line 99
    .line 100
    invoke-direct {v2, v0, v4, v5}, Ll/ha6;-><init>(Ljava/text/SimpleDateFormat;J)V

    .line 101
    .line 102
    .line 103
    invoke-interface {p0, v1, v2}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 104
    .line 105
    .line 106
    new-instance p0, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 107
    .line 108
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 109
    .line 110
    .line 111
    const-string v0, "countdown_conv_list_key"

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const/4 v1, 0x1

    .line 118
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0$a;->a(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 123
    .line 124
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 125
    .line 126
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/g;->I0:Ll/byd0;

    .line 127
    .line 128
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    check-cast v2, Ljava/lang/Long;

    .line 133
    .line 134
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 135
    .line 136
    .line 137
    move-result-wide v2

    .line 138
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0$a;->e(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 143
    .line 144
    .line 145
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 146
    .line 147
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 148
    .line 149
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_1
    :goto_0
    invoke-interface {p0}, Ll/ue6;->h()V

    .line 154
    .line 155
    .line 156
    return-void
.end method

.method public final g1()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    move v1, v0

    .line 8
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;

    .line 9
    .line 10
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-ge v1, v2, :cond_3

    .line 15
    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;

    .line 17
    .line 18
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    sget v4, Ll/adc0;->i7:I

    .line 27
    .line 28
    if-eq v3, v4, :cond_1

    .line 29
    .line 30
    sget v4, Ll/adc0;->Z6:I

    .line 31
    .line 32
    if-eq v3, v4, :cond_1

    .line 33
    .line 34
    sget v4, Ll/adc0;->e1:I

    .line 35
    .line 36
    if-eq v3, v4, :cond_1

    .line 37
    .line 38
    sget v4, Ll/adc0;->mf:I

    .line 39
    .line 40
    if-eq v3, v4, :cond_1

    .line 41
    .line 42
    sget v4, Ll/adc0;->lf:I

    .line 43
    .line 44
    if-eq v3, v4, :cond_1

    .line 45
    .line 46
    sget v4, Ll/adc0;->N7:I

    .line 47
    .line 48
    if-eq v3, v4, :cond_1

    .line 49
    .line 50
    sget v4, Ll/adc0;->J7:I

    .line 51
    .line 52
    if-ne v3, v4, :cond_2

    .line 53
    .line 54
    :cond_1
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    :goto_1
    return-void
.end method

.method public bridge synthetic getUserLiveLabelHashMap()Ljava/util/HashMap;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ue6;->getUserLiveLabelHashMap()Ljava/util/HashMap;

    move-result-object p0

    return-object p0
.end method

.method public h0(Ll/sj6;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic h1(Lcom/p1/mobile/putong/data/UserLiveLabel;Landroid/view/View;)V
    .locals 6

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    iget-object p2, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->schema:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 12
    .line 13
    iget-object p0, p0, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->schema:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string p2, "onLive"

    .line 26
    .line 27
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-nez p2, :cond_2

    .line 34
    .line 35
    const-string p2, "onMultiCall"

    .line 36
    .line 37
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-nez p2, :cond_2

    .line 44
    .line 45
    const-string p2, "onCall"

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-eqz p2, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    const-string p2, "onVoice"

    .line 57
    .line 58
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    if-eqz p2, :cond_3

    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-interface {p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 75
    .line 76
    iget-object v1, p2, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveId:Ljava/lang/String;

    .line 79
    .line 80
    iget-object v4, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->userId:Ljava/lang/String;

    .line 81
    .line 82
    const/4 v5, 0x0

    .line 83
    const-string v3, "conversation"

    .line 84
    .line 85
    invoke-interface/range {v0 .. v5}, Ll/ftn0;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 89
    .line 90
    invoke-interface {p0, p2, p1}, Ll/ue6;->Q(Ll/sj6;Lcom/p1/mobile/putong/data/UserLiveLabel;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 99
    .line 100
    iget-object v0, v0, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 101
    .line 102
    iget-object v1, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveId:Ljava/lang/String;

    .line 103
    .line 104
    const-string v2, "conversation"

    .line 105
    .line 106
    const/4 v3, 0x0

    .line 107
    invoke-interface {p2, v0, v1, v2, v3}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->startAudienceLive(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 111
    .line 112
    iget-object p2, p2, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 113
    .line 114
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    if-eqz p2, :cond_3

    .line 119
    .line 120
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 121
    .line 122
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 125
    .line 126
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 127
    .line 128
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/api/e;->h7(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result p2

    .line 138
    if-eqz p2, :cond_3

    .line 139
    .line 140
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 141
    .line 142
    invoke-interface {p0, p2, p1}, Ll/ue6;->Q(Ll/sj6;Lcom/p1/mobile/putong/data/UserLiveLabel;)V

    .line 143
    .line 144
    .line 145
    :cond_3
    return-void
.end method

.method public final i1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/ue6;->a1(Ll/sj6;)Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 14
    .line 15
    iget-object v1, v1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    invoke-interface {p0, v1}, Ll/ue6;->Y(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 24
    .line 25
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 32
    .line 33
    invoke-interface {p0, v1, v0}, Ll/ue6;->Q(Ll/sj6;Lcom/p1/mobile/putong/data/UserLiveLabel;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 37
    .line 38
    iget-object p0, p0, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    invoke-static {p0, v0}, Ll/u1t;->a(Landroid/app/Activity;Lcom/p1/mobile/putong/data/UserLiveLabel;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 45
    .line 46
    iget-object v0, v0, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 55
    .line 56
    iget-object p0, p0, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->performClick()Z

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method public j1(Lcom/p1/mobile/putong/data/User;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 2
    .line 3
    sget v1, Ll/dbc0;->T5:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 9
    .line 10
    const/high16 v1, 0x40800000    # 4.0f

    .line 11
    .line 12
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/rbb0;->q()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/4 v1, 0x0

    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 39
    .line 40
    invoke-interface {p0, p1}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v0, p1, v2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->v0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 51
    .line 52
    invoke-interface {p0, p1}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    const/4 v4, 0x4

    .line 61
    const/4 v5, 0x5

    .line 62
    invoke-virtual {v0, v2, v3, v4, v5}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 68
    .line 69
    .line 70
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->m:Lv/VImage;

    .line 71
    .line 72
    const/4 v2, 0x1

    .line 73
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v0, v0, Ll/r8n;->n:Ljava/util/List;

    .line 81
    .line 82
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 83
    .line 84
    iget-boolean v3, v3, Ll/sj6;->e:Z

    .line 85
    .line 86
    const-string v4, "chatList"

    .line 87
    .line 88
    const-string v5, "matchList"

    .line 89
    .line 90
    if-eqz v3, :cond_1

    .line 91
    .line 92
    move-object v3, v5

    .line 93
    goto :goto_1

    .line 94
    :cond_1
    move-object v3, v4

    .line 95
    :goto_1
    iget-object v6, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 96
    .line 97
    const/4 v7, 0x2

    .line 98
    new-array v8, v7, [Ljava/lang/CharSequence;

    .line 99
    .line 100
    aput-object v3, v8, v1

    .line 101
    .line 102
    aput-object v6, v8, v2

    .line 103
    .line 104
    invoke-static {v8}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-nez v0, :cond_4

    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 119
    .line 120
    iget-boolean v0, v0, Ll/sj6;->e:Z

    .line 121
    .line 122
    if-eqz v0, :cond_2

    .line 123
    .line 124
    move-object v0, v5

    .line 125
    goto :goto_2

    .line 126
    :cond_2
    move-object v0, v4

    .line 127
    :goto_2
    const-string v3, "show_where"

    .line 128
    .line 129
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 134
    .line 135
    iget-object v3, v3, Ll/sj6;->i:Ljava/lang/String;

    .line 136
    .line 137
    const-string v6, "request_show_type"

    .line 138
    .line 139
    invoke-static {v6, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    new-instance v6, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .line 147
    .line 148
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 149
    .line 150
    iget v8, v8, Ll/sj6;->g:I

    .line 151
    .line 152
    add-int/2addr v8, v2

    .line 153
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string v8, "/"

    .line 157
    .line 158
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 162
    .line 163
    iget-object v8, v8, Ll/sj6;->d:Ll/pol;

    .line 164
    .line 165
    check-cast v8, Ll/u46;

    .line 166
    .line 167
    invoke-interface {v8}, Ll/u46;->h()I

    .line 168
    .line 169
    .line 170
    move-result v8

    .line 171
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v6

    .line 178
    const-string v8, "show_position"

    .line 179
    .line 180
    invoke-static {v8, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 181
    .line 182
    .line 183
    move-result-object v6

    .line 184
    filled-new-array {v0, v3, v6}, [Ll/pf60;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    const-string v3, "e_chat_request"

    .line 189
    .line 190
    const-string v6, "p_messages_view"

    .line 191
    .line 192
    invoke-static {v3, v6, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 193
    .line 194
    .line 195
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    iget-object v0, v0, Ll/r8n;->n:Ljava/util/List;

    .line 200
    .line 201
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 202
    .line 203
    iget-boolean p0, p0, Ll/sj6;->e:Z

    .line 204
    .line 205
    if-eqz p0, :cond_3

    .line 206
    .line 207
    move-object v4, v5

    .line 208
    :cond_3
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 209
    .line 210
    new-array p1, v7, [Ljava/lang/CharSequence;

    .line 211
    .line 212
    aput-object v4, p1, v1

    .line 213
    .line 214
    aput-object p0, p1, v2

    .line 215
    .line 216
    invoke-static {p1}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    :cond_4
    return-void
.end method

.method public final k1(Lcom/p1/mobile/putong/data/UserLiveLabel;Ljava/lang/String;)V
    .locals 6
    .param p1    # Lcom/p1/mobile/putong/data/UserLiveLabel;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;

    .line 4
    .line 5
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x1

    .line 10
    if-ge v1, v2, :cond_2

    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;

    .line 13
    .line 14
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    sget v5, Ll/adc0;->Ne:I

    .line 23
    .line 24
    if-eq v4, v5, :cond_1

    .line 25
    .line 26
    sget v5, Ll/adc0;->i7:I

    .line 27
    .line 28
    if-ne v4, v5, :cond_0

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_0
    move v3, v0

    .line 32
    :goto_1
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 39
    .line 40
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/UserLiveLabel;->isVoiceChat()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 56
    .line 57
    const v1, -0xcd3c45

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1, v1}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->e(II)V

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_3
    invoke-static {}, Ll/gra;->z()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 69
    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    const v0, -0x9654

    .line 73
    .line 74
    .line 75
    const v2, -0xa017

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->e(II)V

    .line 79
    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_4
    const v0, -0x9655

    .line 83
    .line 84
    .line 85
    const v2, -0xa116

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->e(II)V

    .line 89
    .line 90
    .line 91
    :goto_2
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_5

    .line 96
    .line 97
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 98
    .line 99
    invoke-virtual {v0, p2}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    new-instance v0, Ll/q3d0;

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->getAvatarSize()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 112
    .line 113
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->getAvatarSize()I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    invoke-direct {v0, v1, v2}, Ll/q3d0;-><init>(II)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2, v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    invoke-virtual {p2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 131
    .line 132
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    new-instance v2, Ll/k66;

    .line 136
    .line 137
    invoke-direct {v2, v1}, Ll/k66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, p2, v2}, Ll/fsb0;->F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V

    .line 141
    .line 142
    .line 143
    :cond_5
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 144
    .line 145
    new-instance v0, Ll/fa6;

    .line 146
    .line 147
    invoke-direct {v0, p0, p1}, Ll/fa6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;Lcom/p1/mobile/putong/data/UserLiveLabel;)V

    .line 148
    .line 149
    .line 150
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Ll/sj6;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 p3, 0x1

    .line 4
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    sget p1, Ll/qa00;->j:I

    .line 8
    .line 9
    sget p3, Ll/qa00;->c:I

    .line 10
    .line 11
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->u1(II)V

    .line 12
    .line 13
    .line 14
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 17
    .line 18
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final l1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/ue6;->A0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->t1()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->s1()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public m(Ll/sj6;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    invoke-static {}, Ll/gra;->a2()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Landroid/view/View;->setClickable(Z)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 27
    .line 28
    invoke-virtual {p1, v2}, Landroid/view/View;->setClickable(Z)V

    .line 29
    .line 30
    .line 31
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 32
    .line 33
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g1()V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 40
    .line 41
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->j:Lv/VImage;

    .line 45
    .line 46
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 50
    .line 51
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 55
    .line 56
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->o:Landroid/widget/FrameLayout;

    .line 60
    .line 61
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public m0(Ll/sj6;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    sget p1, Ll/qa00;->j:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->u1(II)V

    .line 11
    .line 12
    .line 13
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 16
    .line 17
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik9IM1VYMjRHV083V0dBTVQzQzNSVTdBWENMSEdNNDE0IiwidyI6OTYsImgiOjk3LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MzEyODA4MTUyMzgwNDQ4NDM5NX0.png"

    .line 18
    .line 19
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/high16 v0, 0x425c0000    # 55.0f

    .line 29
    .line 30
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 35
    .line 36
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    .line 46
    .line 47
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 50
    .line 51
    sget v0, Ll/dbc0;->Ed:I

    .line 52
    .line 53
    invoke-virtual {p1, p0, v0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final m1()V
    .locals 4

    .line 1
    sget v0, Ll/qa00;->i:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    invoke-static {v0}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-virtual {v2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Ll/wlj;

    .line 19
    .line 20
    invoke-virtual {v2, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/spl0;->X()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 30
    .line 31
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitedTrialSee(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    invoke-static {}, Ll/joa;->M3()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_0

    .line 52
    .line 53
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_0

    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 75
    .line 76
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik9IM1VYMjRHV083V0dBTVQzQzNSVTdBWENMSEdNNDE0IiwidyI6OTYsImgiOjk3LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MzEyODA4MTUyMzgwNDQ4NDM5NX0.png"

    .line 77
    .line 78
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->xn()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_2

    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 97
    .line 98
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 99
    .line 100
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_2

    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 107
    .line 108
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isConfessionFirstConv()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_2

    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 117
    .line 118
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 119
    .line 120
    .line 121
    invoke-static {}, Ll/gra;->z()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-eqz v0, :cond_1

    .line 126
    .line 127
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 130
    .line 131
    sget v1, Ll/dbc0;->Gh:I

    .line 132
    .line 133
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 140
    .line 141
    sget v1, Ll/dbc0;->zp:I

    .line 142
    .line 143
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 148
    .line 149
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 150
    .line 151
    invoke-static {v0}, Ll/pm6;->d(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    const/4 v2, 0x0

    .line 156
    if-eqz v0, :cond_3

    .line 157
    .line 158
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 159
    .line 160
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->f:Landroid/view/View;

    .line 164
    .line 165
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->f:Landroid/view/View;

    .line 173
    .line 174
    sget v1, Ll/dbc0;->xf:I

    .line 175
    .line 176
    invoke-static {v0, p0, v1}, Ll/bnl0;->A0(Landroid/content/Context;Landroid/view/View;I)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 181
    .line 182
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 183
    .line 184
    invoke-static {v0}, Ll/pm6;->f(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-nez v0, :cond_5

    .line 189
    .line 190
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 191
    .line 192
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 193
    .line 194
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 195
    .line 196
    const-string v3, "fakeIntlReceiveLikeGuideSVip"

    .line 197
    .line 198
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    if-eqz v0, :cond_4

    .line 203
    .line 204
    goto :goto_0

    .line 205
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 206
    .line 207
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :cond_5
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 212
    .line 213
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 214
    .line 215
    .line 216
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->f:Landroid/view/View;

    .line 217
    .line 218
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->f:Landroid/view/View;

    .line 226
    .line 227
    sget v1, Ll/dbc0;->uf:I

    .line 228
    .line 229
    invoke-static {v0, p0, v1}, Ll/bnl0;->A0(Landroid/content/Context;Landroid/view/View;I)V

    .line 230
    .line 231
    .line 232
    return-void
.end method

.method public final n1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_chat_source:Lcom/p1/mobile/putong/core/data/IntlChatSource;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 16
    .line 17
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_chat_source:Lcom/p1/mobile/putong/core/data/IntlChatSource;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IntlChatSource;->source:Ljava/lang/String;

    .line 24
    .line 25
    const-string v1, "spotLight"

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->d:Landroid/view/View;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->d:Landroid/view/View;

    .line 41
    .line 42
    const/16 v0, 0x8

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final o1(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;I)V
    .locals 2

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    invoke-interface {p0, p3}, Ll/ue6;->c0(Ll/sj6;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 10
    .line 11
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 20
    .line 21
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 30
    .line 31
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->B0(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 40
    .line 41
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-interface {p0, p2}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1, p3, p0}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 52
    .line 53
    const/4 p3, 0x0

    .line 54
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 58
    .line 59
    iget-object p2, p2, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 60
    .line 61
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-eqz p2, :cond_2

    .line 66
    .line 67
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 68
    .line 69
    iget-object p2, p2, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 70
    .line 71
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    if-eqz p2, :cond_2

    .line 76
    .line 77
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 82
    .line 83
    iget-object v1, v1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 93
    .line 94
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 101
    .line 102
    iget-object v0, v0, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 103
    .line 104
    invoke-interface {p0, v0}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->v0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 109
    .line 110
    .line 111
    :goto_0
    invoke-interface {p0, p1}, Ll/ue6;->n(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 112
    .line 113
    .line 114
    move-result p2

    .line 115
    if-eqz p2, :cond_3

    .line 116
    .line 117
    invoke-interface {p0, p1}, Ll/ue6;->j(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    if-nez p2, :cond_3

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->e1()V

    .line 125
    .line 126
    .line 127
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 128
    .line 129
    invoke-interface {p0, p2}, Ll/ue6;->U0(Ll/sj6;)Z

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->setLivingHead(Z)V

    .line 134
    .line 135
    .line 136
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 137
    .line 138
    const-string p2, "lovescript"

    .line 139
    .line 140
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-eqz p1, :cond_4

    .line 145
    .line 146
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 147
    .line 148
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 149
    .line 150
    iget-object p2, p2, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 151
    .line 152
    invoke-interface {p0, p2}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p2

    .line 160
    const/4 v0, 0x2

    .line 161
    const/16 v1, 0x8

    .line 162
    .line 163
    invoke-virtual {p1, p2, v0, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->i0(Ljava/lang/String;II)V

    .line 164
    .line 165
    .line 166
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 167
    .line 168
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 172
    .line 173
    const/4 p2, 0x1

    .line 174
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 178
    .line 179
    sget p2, Ll/dbc0;->Jd:I

    .line 180
    .line 181
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->setBitmapRes(I)V

    .line 182
    .line 183
    .line 184
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 185
    .line 186
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->s:I

    .line 191
    .line 192
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 193
    .line 194
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 195
    .line 196
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 197
    .line 198
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 199
    .line 200
    .line 201
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 202
    .line 203
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->b()V

    .line 204
    .line 205
    .line 206
    :cond_4
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->K0()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 9
    .line 10
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ll/ue6;->w(Ll/sj6;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    invoke-static {}, Ll/gra;->a2()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->i1()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 40
    .line 41
    const-string v2, "conversation_view"

    .line 42
    .line 43
    const/4 v3, 0x0

    .line 44
    invoke-static {v1, v0, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 52
    .line 53
    invoke-interface {p0, p1}, Ll/ue6;->x0(Ll/sj6;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public onFinishInflate()V
    .locals 8

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->d1(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 14
    .line 15
    invoke-static {}, Ll/gra;->z()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget v0, Ll/sj6;->Q:I

    .line 22
    .line 23
    sget v1, Ll/qa00;->j:I

    .line 24
    .line 25
    mul-int/lit8 v1, v1, 0x2

    .line 26
    .line 27
    add-int/2addr v1, v0

    .line 28
    const/4 v2, 0x1

    .line 29
    new-array v3, v2, [Landroid/view/View;

    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    aput-object p0, v3, v4

    .line 33
    .line 34
    invoke-static {v1, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    const/high16 v1, 0x41700000    # 15.0f

    .line 38
    .line 39
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    add-int/2addr v3, v0

    .line 44
    invoke-static {p0, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 45
    .line 46
    .line 47
    const/high16 v3, 0x40e00000    # 7.0f

    .line 48
    .line 49
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    add-int/2addr v5, v0

    .line 54
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 55
    .line 56
    new-array v7, v2, [Landroid/view/View;

    .line 57
    .line 58
    aput-object v6, v7, v4

    .line 59
    .line 60
    invoke-static {v5, v7}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 61
    .line 62
    .line 63
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 64
    .line 65
    sget v6, Ll/qa00;->h:I

    .line 66
    .line 67
    sub-int v6, v0, v6

    .line 68
    .line 69
    sget v7, Ll/qa00;->g:I

    .line 70
    .line 71
    add-int/2addr v7, v0

    .line 72
    invoke-virtual {v5, v6, v7}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->d(II)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    add-int/2addr v1, v0

    .line 80
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 81
    .line 82
    new-array v6, v2, [Landroid/view/View;

    .line 83
    .line 84
    aput-object v5, v6, v4

    .line 85
    .line 86
    invoke-static {v1, v6}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 87
    .line 88
    .line 89
    const/high16 v1, 0x40c00000    # 6.0f

    .line 90
    .line 91
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    add-int/2addr v5, v0

    .line 96
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->d:Landroid/view/View;

    .line 97
    .line 98
    filled-new-array {v6}, [Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    invoke-static {v5, v6}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    add-int/2addr v1, v0

    .line 110
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 111
    .line 112
    new-array v6, v2, [Landroid/view/View;

    .line 113
    .line 114
    aput-object v5, v6, v4

    .line 115
    .line 116
    invoke-static {v1, v6}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 117
    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->h:Landroid/widget/FrameLayout;

    .line 120
    .line 121
    new-array v2, v2, [Landroid/view/View;

    .line 122
    .line 123
    aput-object v1, v2, v4

    .line 124
    .line 125
    invoke-static {v0, v2}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->k:Lv/VImage;

    .line 129
    .line 130
    sget v1, Ll/dbc0;->ug:I

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 136
    .line 137
    sget v1, Ll/qa00;->e:I

    .line 138
    .line 139
    neg-int v1, v1

    .line 140
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 141
    .line 142
    .line 143
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 144
    .line 145
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    neg-int v0, v0

    .line 150
    invoke-static {p0, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 151
    .line 152
    .line 153
    :cond_0
    return-void
.end method

.method public final p1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->lowPayOneSideConv()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->i:Lv/VImage;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 15
    .line 16
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 27
    .line 28
    iget-object p0, p0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 33
    .line 34
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/LowPayOneside;->reddot:Z

    .line 35
    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 v2, 0x0

    .line 40
    :goto_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 45
    .line 46
    iget-object p0, p0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    xor-int/2addr p0, v2

    .line 55
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final q1()V
    .locals 8

    .line 1
    invoke-static {}, Ll/d79;->e0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 9
    .line 10
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 19
    .line 20
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 23
    .line 24
    const-string v2, "lovebuzz"

    .line 25
    .line 26
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->n:Lv/VImage;

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->e:Landroid/view/View;

    .line 39
    .line 40
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 52
    .line 53
    iget-object v2, v2, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 54
    .line 55
    invoke-interface {v0, v2}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->zo(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    const/16 v2, 0x64

    .line 60
    .line 61
    if-nez v0, :cond_0

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 64
    .line 65
    iget v0, v0, Ll/sj6;->A:I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    move v0, v2

    .line 69
    :goto_0
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 70
    .line 71
    invoke-virtual {v3}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 76
    .line 77
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 78
    .line 79
    iget-object v5, v5, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 80
    .line 81
    invoke-static {v5}, Ll/vx6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    invoke-virtual {v6}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 98
    .line 99
    iget-object v7, v7, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 100
    .line 101
    invoke-interface {v6, v7}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Wr(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 102
    .line 103
    .line 104
    move-result v6

    .line 105
    if-eqz v6, :cond_1

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_1
    move v2, v0

    .line 109
    :goto_1
    invoke-interface {v3, v4, v5, v2}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->xp(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 110
    .line 111
    .line 112
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 113
    .line 114
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->n:Lv/VImage;

    .line 119
    .line 120
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->e:Landroid/view/View;

    .line 124
    .line 125
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public r(Ljava/text/SimpleDateFormat;JJJ)V
    .locals 1

    .line 1
    cmp-long p1, p2, p4

    .line 2
    .line 3
    if-gez p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    sub-long/2addr p4, p2

    .line 25
    const-wide/16 p1, 0x3e8

    .line 26
    .line 27
    div-long/2addr p4, p1

    .line 28
    long-to-int p1, p4

    .line 29
    const-wide/16 p2, 0x0

    .line 30
    .line 31
    cmp-long p2, p6, p2

    .line 32
    .line 33
    if-lez p2, :cond_1

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 36
    .line 37
    mul-int/lit8 p1, p1, 0x64

    .line 38
    .line 39
    int-to-long p1, p1

    .line 40
    div-long/2addr p1, p6

    .line 41
    long-to-int p1, p1

    .line 42
    rsub-int/lit8 p1, p1, 0x64

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->setProgress(I)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public r1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 4
    .line 5
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const-string v1, "1"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v1, "0"

    .line 15
    .line 16
    :goto_0
    iput-object v1, v0, Ll/sj6;->K:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 19
    .line 20
    iget-object v1, v0, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 31
    .line 32
    iget-object p0, p0, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->m0(Lcom/p1/mobile/putong/data/User;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    const-string p0, "audio_avatar_frame"

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    const-string p0, ""

    .line 44
    .line 45
    :goto_1
    iput-object p0, v0, Ll/sj6;->L:Ljava/lang/String;

    .line 46
    .line 47
    return-void
.end method

.method public final s1()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->loveScript:Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 8
    .line 9
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/LoveScript;->expireTime:J

    .line 10
    .line 11
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    if-gtz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v2, "love_script_tag_"

    .line 26
    .line 27
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 31
    .line 32
    iget-object v2, v2, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 51
    .line 52
    iget-object v1, v1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Tf(Ljava/lang/String;)Lrx/c;

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 60
    .line 61
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->loveScript:Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 66
    .line 67
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/LoveScript;->expireTime:J

    .line 68
    .line 69
    invoke-static {}, Ll/pzi0;->o()J

    .line 70
    .line 71
    .line 72
    move-result-wide v2

    .line 73
    cmp-long v0, v0, v2

    .line 74
    .line 75
    if-lez v0, :cond_1

    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 78
    .line 79
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->loveScript:Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 84
    .line 85
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/LoveScript;->createdTime:J

    .line 86
    .line 87
    const-wide/16 v3, 0x0

    .line 88
    .line 89
    cmp-long v3, v1, v3

    .line 90
    .line 91
    if-eqz v3, :cond_1

    .line 92
    .line 93
    iget-wide v3, v0, Lcom/p1/mobile/putong/core/data/LoveScript;->expireTime:J

    .line 94
    .line 95
    sub-long v0, v3, v1

    .line 96
    .line 97
    invoke-static {}, Ll/pzi0;->o()J

    .line 98
    .line 99
    .line 100
    move-result-wide v5

    .line 101
    sub-long/2addr v3, v5

    .line 102
    const-wide/16 v5, 0x64

    .line 103
    .line 104
    mul-long/2addr v3, v5

    .line 105
    div-long/2addr v3, v0

    .line 106
    long-to-float v0, v3

    .line 107
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    int-to-double v0, v0

    .line 112
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    .line 113
    .line 114
    div-double/2addr v0, v2

    .line 115
    mul-double/2addr v0, v2

    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 117
    .line 118
    double-to-int v0, v0

    .line 119
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;->setProgress(I)V

    .line 120
    .line 121
    .line 122
    :cond_1
    return-void
.end method

.method public setPicPercent(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->setPicPercent(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t0(Ll/sj6;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->j:Lv/VImage;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->o:Landroid/widget/FrameLayout;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->s:I

    .line 26
    .line 27
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 28
    .line 29
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 32
    .line 33
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 37
    .line 38
    const/4 v2, 0x1

    .line 39
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-boolean v0, p1, Ll/sj6;->v:Z

    .line 48
    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_0

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_frame()Lv/VDraweeView;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 80
    .line 81
    iget-object v2, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 82
    .line 83
    invoke-interface {p0, v2}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 88
    .line 89
    .line 90
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 91
    .line 92
    new-instance v0, Ll/ga6;

    .line 93
    .line 94
    invoke-direct {v0, p1}, Ll/ga6;-><init>(Ll/sj6;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_1
    invoke-static {}, Ll/gra;->a2()Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 106
    .line 107
    if-eqz p1, :cond_2

    .line 108
    .line 109
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 113
    .line 114
    invoke-virtual {p1, v2}, Landroid/view/View;->setClickable(Z)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_2
    const/4 p1, 0x0

    .line 119
    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 123
    .line 124
    invoke-virtual {p1, v1}, Landroid/view/View;->setClickable(Z)V

    .line 125
    .line 126
    .line 127
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g1()V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->q:Lv/VDraweeView;

    .line 131
    .line 132
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 133
    .line 134
    .line 135
    sget p1, Ll/qa00;->i:I

    .line 136
    .line 137
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->u1(II)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final t1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/ue6;->D(Ll/sj6;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->j:Lv/VImage;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final u1(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/wlj;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/facebook/drawee/generic/RoundingParams;->f()[F

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    array-length v2, v1

    .line 30
    if-lez v2, :cond_0

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    aget v1, v1, v2

    .line 34
    .line 35
    int-to-float v2, p1

    .line 36
    cmpl-float v1, v1, v2

    .line 37
    .line 38
    if-nez v1, :cond_0

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/facebook/drawee/generic/RoundingParams;->e()F

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    int-to-float v1, p2

    .line 45
    cmpl-float v0, v0, v1

    .line 46
    .line 47
    if-nez v0, :cond_0

    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    int-to-float p1, p1

    .line 51
    invoke-static {p1}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const/4 v0, -0x1

    .line 56
    int-to-float p2, p2

    .line 57
    invoke-virtual {p1, v0, p2}, Lcom/facebook/drawee/generic/RoundingParams;->o(IF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 58
    .line 59
    .line 60
    const/4 p2, 0x1

    .line 61
    invoke-virtual {p1, p2}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    check-cast p0, Ll/wlj;

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final v1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/ue6;->p(Ll/sj6;)Lcom/p1/mobile/putong/core/data/Message;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 8
    .line 9
    invoke-interface {p0, v1}, Ll/ue6;->D(Ll/sj6;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 16
    .line 17
    iget-object v2, v1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    iget-object v1, v1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 20
    .line 21
    invoke-interface {p0, v0, v2, v1}, Ll/ue6;->f(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 28
    .line 29
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 30
    .line 31
    iget v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 32
    .line 33
    invoke-interface {p0, v0}, Ll/ue6;->M(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr v1, v0

    .line 38
    invoke-static {v1}, Ll/a9g0;->f(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->o:Landroid/widget/FrameLayout;

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->p:Lv/VText;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->p:Lv/VText;

    .line 54
    .line 55
    sget v0, Ll/dbc0;->l1:I

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public w1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/sj6;->o:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->k:Lv/VImage;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->o:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public y0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/ue6;->Y(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->h:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    move v1, v0

    .line 20
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-ge v1, v2, :cond_3

    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;

    .line 29
    .line 30
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    sget v4, Ll/adc0;->i7:I

    .line 39
    .line 40
    if-eq v3, v4, :cond_1

    .line 41
    .line 42
    sget v4, Ll/adc0;->e1:I

    .line 43
    .line 44
    if-eq v3, v4, :cond_1

    .line 45
    .line 46
    sget v4, Ll/adc0;->lf:I

    .line 47
    .line 48
    if-ne v3, v4, :cond_2

    .line 49
    .line 50
    :cond_1
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->h:Landroid/widget/FrameLayout;

    .line 57
    .line 58
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public z0(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Ll/sj6;)V
    .locals 1

    .line 1
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->r:Ll/sj6;

    .line 2
    .line 3
    iget-object p1, p3, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p3, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p1, p3, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_2

    .line 31
    .line 32
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->f1()V

    .line 33
    .line 34
    .line 35
    :cond_2
    iput-object p2, p3, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iget-object p1, p3, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 53
    .line 54
    iget-object p2, p3, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    invoke-interface {p0, p2}, Ll/ue6;->N0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->v0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_4
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 65
    .line 66
    sget p1, Ll/dbc0;->i0:I

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->z0(I)V

    .line 69
    .line 70
    .line 71
    return-void
.end method
