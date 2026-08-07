.class public Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;
.super Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;

.field public e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

.field public f:Lv/VFrame;

.field public g:Lv/VRelative;

.field public h:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

.field public i:Lv/VDraweeView;

.field public j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

.field public k:Lv/VFrame;

.field public l:Lv/VImage;

.field public m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public n:Lcom/p1/mobile/putong/core/ui/VText_Bold;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->T(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;
    .locals 2

    .line 1
    new-instance p0, Ll/pf60;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-direct {p0, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->V(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Ll/pf60;)V

    return-void
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->W(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->S(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method private X(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v2, Ll/q3d0;

    .line 32
    .line 33
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 34
    .line 35
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->getAvatarSize()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 40
    .line 41
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->getAvatarSize()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    invoke-direct {v2, v3, v4}, Ll/q3d0;-><init>(II)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v2, "onVoice"

    .line 57
    .line 58
    iget-object v3, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->j:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 65
    .line 66
    if-eqz v2, :cond_0

    .line 67
    .line 68
    const v4, -0x298501

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    const v4, -0x9655

    .line 73
    .line 74
    .line 75
    :goto_0
    if-eqz v2, :cond_1

    .line 76
    .line 77
    const v5, -0x578301

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_1
    const v5, -0xa116

    .line 82
    .line 83
    .line 84
    :goto_1
    invoke-virtual {v3, v4, v5}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->e(II)V

    .line 85
    .line 86
    .line 87
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 88
    .line 89
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 90
    .line 91
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    new-instance v5, Ll/k66;

    .line 95
    .line 96
    invoke-direct {v5, v4}, Ll/k66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v3, v0, v5}, Ll/fsb0;->F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->G(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Z)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->k:Lv/VFrame;

    .line 106
    .line 107
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 111
    .line 112
    const-string v0, "\u76f4\u64ad\u4e2d"

    .line 113
    .line 114
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->l:Lv/VImage;

    .line 118
    .line 119
    sget p1, Ll/dbc0;->hp:I

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 122
    .line 123
    .line 124
    return-void
.end method


# virtual methods
.method public F()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 2
    .line 3
    const-string v1, "\u6682\u65e0\u63a8\u8350"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/gra;->z()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 15
    .line 16
    sget v1, Ll/dbc0;->Fh:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->z0(I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 22
    .line 23
    const/high16 v0, -0x1000000

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 30
    .line 31
    const-string v1, "#66000000"

    .line 32
    .line 33
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 41
    .line 42
    sget v0, Ll/dbc0;->gp:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->z0(I)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bqc0;->a(Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final R()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->k:Lv/VFrame;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->g:Lv/VRelative;

    .line 19
    .line 20
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic S(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Ll/pf60;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->C()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1, p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->O(Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->f:Z

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->X(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 41
    .line 42
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 53
    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 55
    .line 56
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->B(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 63
    .line 64
    .line 65
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_3

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_4

    .line 80
    .line 81
    :cond_3
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 82
    .line 83
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 84
    .line 85
    sget v3, Ll/dbc0;->i0:I

    .line 86
    .line 87
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 88
    .line 89
    .line 90
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 93
    .line 94
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 95
    .line 96
    const/4 v3, 0x5

    .line 97
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/core/api/f;->k3(Lcom/p1/mobile/putong/data/User;I)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    const/4 v2, 0x1

    .line 102
    if-eqz v0, :cond_5

    .line 103
    .line 104
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->f:Z

    .line 105
    .line 106
    if-nez v0, :cond_5

    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->k:Lv/VFrame;

    .line 109
    .line 110
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->l:Lv/VImage;

    .line 114
    .line 115
    sget v4, Ll/dbc0;->jp:I

    .line 116
    .line 117
    invoke-virtual {v0, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 121
    .line 122
    const-string v4, "\u5728\u7ebf"

    .line 123
    .line 124
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    .line 126
    .line 127
    :cond_5
    invoke-static {}, Ll/gra;->P()Lcom/p1/mobile/putong/core/data/ChatRoundsDisplayedExternallyConfig;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iget-boolean v4, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->f:Z

    .line 132
    .line 133
    if-nez v4, :cond_7

    .line 134
    .line 135
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    if-eqz v4, :cond_7

    .line 140
    .line 141
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/ChatRoundsDisplayedExternallyConfig;->enabled:Z

    .line 142
    .line 143
    if-eqz v0, :cond_7

    .line 144
    .line 145
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 146
    .line 147
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-eqz v0, :cond_7

    .line 152
    .line 153
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 154
    .line 155
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->doubleDefault()Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_7

    .line 160
    .line 161
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 162
    .line 163
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 164
    .line 165
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-eqz v0, :cond_7

    .line 170
    .line 171
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 172
    .line 173
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 174
    .line 175
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 176
    .line 177
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-eqz v0, :cond_7

    .line 182
    .line 183
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 184
    .line 185
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 186
    .line 187
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 188
    .line 189
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->partnerSwitch:Z

    .line 190
    .line 191
    if-eqz v0, :cond_7

    .line 192
    .line 193
    iput v2, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->v:I

    .line 194
    .line 195
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->k:Lv/VFrame;

    .line 196
    .line 197
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 198
    .line 199
    .line 200
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 201
    .line 202
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 203
    .line 204
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 205
    .line 206
    invoke-virtual {v0, v4, v3}, Lcom/p1/mobile/putong/core/api/f;->k3(Lcom/p1/mobile/putong/data/User;I)Z

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    if-eqz v0, :cond_6

    .line 211
    .line 212
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->f:Z

    .line 213
    .line 214
    if-nez v0, :cond_6

    .line 215
    .line 216
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 217
    .line 218
    const-string v3, "\u5728\u7ebf\u00b7\u5bc6\u53cb"

    .line 219
    .line 220
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 221
    .line 222
    .line 223
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->l:Lv/VImage;

    .line 224
    .line 225
    sget v3, Ll/dbc0;->ip:I

    .line 226
    .line 227
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 228
    .line 229
    .line 230
    goto :goto_1

    .line 231
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 232
    .line 233
    const-string v3, "\u5bc6\u53cb"

    .line 234
    .line 235
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 236
    .line 237
    .line 238
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->l:Lv/VImage;

    .line 239
    .line 240
    sget v3, Ll/dbc0;->fp:I

    .line 241
    .line 242
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 243
    .line 244
    .line 245
    :cond_7
    :goto_1
    iget v0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 246
    .line 247
    const/16 v3, 0x15

    .line 248
    .line 249
    if-ne v0, v3, :cond_8

    .line 250
    .line 251
    const/4 p3, 0x0

    .line 252
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 253
    .line 254
    .line 255
    move-object v4, p1

    .line 256
    goto :goto_2

    .line 257
    :cond_8
    new-instance v3, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;

    .line 258
    .line 259
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 260
    .line 261
    .line 262
    move-result-object v5

    .line 263
    iget-object p3, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 264
    .line 265
    move-object v6, p3

    .line 266
    check-cast v6, Ll/pf60;

    .line 267
    .line 268
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 269
    .line 270
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 271
    .line 272
    move-object v4, p1

    .line 273
    invoke-direct/range {v3 .. v8}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Landroid/content/Context;Ll/pf60;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {p0, v3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 277
    .line 278
    .line 279
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 280
    .line 281
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 282
    .line 283
    iget-object p3, p3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 284
    .line 285
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 286
    .line 287
    .line 288
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 289
    .line 290
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 291
    .line 292
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->n0(Lcom/p1/mobile/putong/data/User;)V

    .line 293
    .line 294
    .line 295
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 296
    .line 297
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 298
    .line 299
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->m0(Lcom/p1/mobile/putong/data/User;)Z

    .line 300
    .line 301
    .line 302
    move-result p1

    .line 303
    invoke-virtual {p0, v4, p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->K(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Z)V

    .line 304
    .line 305
    .line 306
    iget p1, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 307
    .line 308
    const/16 p3, 0x10

    .line 309
    .line 310
    const/16 v0, 0x11

    .line 311
    .line 312
    if-eq p1, p3, :cond_a

    .line 313
    .line 314
    if-ne p1, v0, :cond_9

    .line 315
    .line 316
    goto :goto_3

    .line 317
    :cond_9
    return-void

    .line 318
    :cond_a
    :goto_3
    if-ne p1, v0, :cond_b

    .line 319
    .line 320
    move v1, v2

    .line 321
    :cond_b
    invoke-virtual {p0, p2, v1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->G(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Z)V

    .line 322
    .line 323
    .line 324
    return-void
.end method

.method public final synthetic W(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->onClick(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final Y(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 10

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->z:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/high16 v1, -0x1000000

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 16
    .line 17
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 18
    .line 19
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->l:Lv/VImage;

    .line 20
    .line 21
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 22
    .line 23
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->d:Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;

    .line 24
    .line 25
    move-object v3, p2

    .line 26
    invoke-static/range {v2 .. v8}, Ll/vj30;->x(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/gra;->z()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 34
    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const-string p1, "#E9B442"

    .line 42
    .line 43
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 48
    .line 49
    .line 50
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->l:Lv/VImage;

    .line 51
    .line 52
    sget p2, Ll/dbc0;->lp:I

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 55
    .line 56
    .line 57
    goto :goto_3

    .line 58
    :cond_1
    move-object v3, p2

    .line 59
    iget-object p2, v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->y:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 60
    .line 61
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    const-string v0, "#FF9669"

    .line 66
    .line 67
    if-eqz p2, :cond_3

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 74
    .line 75
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 76
    .line 77
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->l:Lv/VImage;

    .line 78
    .line 79
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 80
    .line 81
    iget-object v9, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->d:Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;

    .line 82
    .line 83
    move-object v4, v3

    .line 84
    move-object v3, p1

    .line 85
    invoke-static/range {v2 .. v9}, Ll/vj30;->v(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    invoke-static {}, Ll/gra;->z()Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 93
    .line 94
    if-eqz p1, :cond_2

    .line 95
    .line 96
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_2
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 105
    .line 106
    .line 107
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->l:Lv/VImage;

    .line 108
    .line 109
    sget p2, Ll/dbc0;->kp:I

    .line 110
    .line 111
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 112
    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 120
    .line 121
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 122
    .line 123
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->l:Lv/VImage;

    .line 124
    .line 125
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 126
    .line 127
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->d:Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;

    .line 128
    .line 129
    invoke-static/range {v2 .. v8}, Ll/vj30;->u(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;)V

    .line 130
    .line 131
    .line 132
    invoke-static {}, Ll/gra;->z()Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 137
    .line 138
    if-eqz p1, :cond_4

    .line 139
    .line 140
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 141
    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_4
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 149
    .line 150
    .line 151
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->l:Lv/VImage;

    .line 152
    .line 153
    sget p2, Ll/dbc0;->kp:I

    .line 154
    .line 155
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 156
    .line 157
    .line 158
    :goto_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->k:Lv/VFrame;

    .line 159
    .line 160
    const/4 p1, 0x1

    .line 161
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method public final Z(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    iget-object v2, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/wpc0;

    .line 16
    .line 17
    invoke-direct {v2, p0}, Ll/wpc0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 25
    .line 26
    iget-object v2, v2, Ll/il8;->m:Ll/mm6;

    .line 27
    .line 28
    iget-object v3, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ll/wzh0;->uiGet(Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    new-instance v3, Ll/xpc0;

    .line 35
    .line 36
    invoke-direct {v3, p0}, Ll/xpc0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, v3}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    new-instance v3, Ll/ypc0;

    .line 44
    .line 45
    invoke-direct {v3}, Ll/ypc0;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v3}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    new-instance v3, Ll/mie0;

    .line 53
    .line 54
    invoke-direct {v3}, Ll/mie0;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-static {v1, v2, v3}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {p1, v0, v1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v1, Ll/zpc0;

    .line 74
    .line 75
    invoke-direct {v1, p0, p1, p2}, Ll/zpc0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    new-instance v0, Ll/aqc0;

    .line 86
    .line 87
    invoke-direct {v0, p0, p1, p2}, Ll/aqc0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 88
    .line 89
    .line 90
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public a0(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 1

    return-void

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->R()V

    .line 2
    .line 3
    .line 4
    iget p2, p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 5
    .line 6
    const/16 v0, 0xf

    .line 7
    .line 8
    if-ne p2, v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->Y(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->Z(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onFinishInflate()V
    .locals 7

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->c:Lv/VDraweeView;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->setShowSVipFrame(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 22
    .line 23
    const/high16 v2, 0x3f800000    # 1.0f

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->setPicPercent(F)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/gra;->d3()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->d:Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;

    .line 35
    .line 36
    const/high16 v2, 0x42c00000    # 96.0f

    .line 37
    .line 38
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-static {v0, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 46
    .line 47
    const/high16 v2, 0x41800000    # 16.0f

    .line 48
    .line 49
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-static {v0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->f:Lv/VFrame;

    .line 57
    .line 58
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 63
    .line 64
    .line 65
    :cond_0
    invoke-static {}, Ll/gra;->z()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    sget v0, Ll/sj6;->Q:I

    .line 72
    .line 73
    sget v2, Ll/qa00;->g:I

    .line 74
    .line 75
    add-int v3, v0, v2

    .line 76
    .line 77
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->d:Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;

    .line 78
    .line 79
    const/4 v5, 0x1

    .line 80
    new-array v6, v5, [Landroid/view/View;

    .line 81
    .line 82
    aput-object v4, v6, v1

    .line 83
    .line 84
    invoke-static {v3, v6}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 85
    .line 86
    .line 87
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->d:Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;

    .line 88
    .line 89
    sget v4, Ll/qa00;->R:I

    .line 90
    .line 91
    invoke-static {v3, v4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 92
    .line 93
    .line 94
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 95
    .line 96
    sget v4, Ll/qa00;->m:I

    .line 97
    .line 98
    invoke-static {v3, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 99
    .line 100
    .line 101
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->f:Lv/VFrame;

    .line 102
    .line 103
    invoke-static {v3, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 104
    .line 105
    .line 106
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 107
    .line 108
    new-array v4, v5, [Landroid/view/View;

    .line 109
    .line 110
    aput-object v3, v4, v1

    .line 111
    .line 112
    invoke-static {v0, v4}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 113
    .line 114
    .line 115
    add-int/2addr v2, v0

    .line 116
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->f:Lv/VFrame;

    .line 117
    .line 118
    new-array v4, v5, [Landroid/view/View;

    .line 119
    .line 120
    aput-object v3, v4, v1

    .line 121
    .line 122
    invoke-static {v2, v4}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 123
    .line 124
    .line 125
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->g:Lv/VRelative;

    .line 126
    .line 127
    new-array v3, v5, [Landroid/view/View;

    .line 128
    .line 129
    aput-object v2, v3, v1

    .line 130
    .line 131
    invoke-static {v0, v3}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 132
    .line 133
    .line 134
    const/high16 v2, 0x41300000    # 11.0f

    .line 135
    .line 136
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    sub-int v3, v0, v3

    .line 141
    .line 142
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->i:Lv/VDraweeView;

    .line 143
    .line 144
    new-array v6, v5, [Landroid/view/View;

    .line 145
    .line 146
    aput-object v4, v6, v1

    .line 147
    .line 148
    invoke-static {v3, v6}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 149
    .line 150
    .line 151
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 152
    .line 153
    new-array v4, v5, [Landroid/view/View;

    .line 154
    .line 155
    aput-object v3, v4, v1

    .line 156
    .line 157
    invoke-static {v0, v4}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 158
    .line 159
    .line 160
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 161
    .line 162
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    sub-int v2, v0, v2

    .line 167
    .line 168
    invoke-virtual {v1, v2, v0}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->d(II)V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->k:Lv/VFrame;

    .line 172
    .line 173
    const/high16 v1, 0x42440000    # 49.0f

    .line 174
    .line 175
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 180
    .line 181
    .line 182
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 183
    .line 184
    const/high16 v0, -0x1000000

    .line 185
    .line 186
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 187
    .line 188
    .line 189
    :cond_1
    return-void
.end method
