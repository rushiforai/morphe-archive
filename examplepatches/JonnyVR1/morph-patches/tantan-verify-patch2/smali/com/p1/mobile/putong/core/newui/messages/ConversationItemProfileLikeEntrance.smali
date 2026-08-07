.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VDraweeView;

.field public d:Landroid/view/View;

.field public e:Lv/VLinear;

.field public f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lcom/p1/mobile/putong/core/data/Conversation;

.field public k:I

.field public l:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->k:I

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->l:Z

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 11
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->k:I

    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->l:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->k:I

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->l:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->g(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->h(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hb6;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const/16 v0, 0x8

    .line 15
    .line 16
    if-ge p0, v0, :cond_1

    .line 17
    .line 18
    return-object p1

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    invoke-virtual {p1, p0, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "..."

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public final e()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/s;->N4()Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget v0, v0, Lcom/p1/mobile/putong/data/VisitorCounter;->totalCnt:I

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v3, "tantan://webview?url="

    .line 28
    .line 29
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/b1a0;->c()Ll/b1a0;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v3, v0}, Ll/b1a0;->d(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v1, v0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 52
    .line 53
    .line 54
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->K1:Lcom/p1/mobile/putong/core/api/h;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->j:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/h;->u3(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->j:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 4
    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->profileLikeComment:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public final synthetic g(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->e()V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->k:I

    .line 5
    .line 6
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-string v0, "unread"

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->f()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v0, "receive_profile_like_is_null"

    .line 25
    .line 26
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "e_receive_profile_like_entrance"

    .line 35
    .line 36
    const-string v0, "p_messages_view"

    .line 37
    .line 38
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->c:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->d:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->c:Lv/VDraweeView;

    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->h:Lv/VText;

    .line 28
    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p0, "\uff1a"

    .line 44
    .line 45
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->profileLikeComment:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->comment:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/data/Conversation;Ll/pol;)V
    .locals 5

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumWidth(I)V

    return-void

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->j:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 16
    .line 17
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catch_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->new_()Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 25
    .line 26
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->l:Z

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    const/4 v2, 0x0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->k:I

    .line 33
    .line 34
    iget v3, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 35
    .line 36
    if-eq v0, v3, :cond_1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    move v0, v2

    .line 40
    goto :goto_2

    .line 41
    :cond_2
    :goto_1
    move v0, v1

    .line 42
    :goto_2
    iget v3, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 43
    .line 44
    iput v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->k:I

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->l:Z

    .line 49
    .line 50
    const-string v0, "unread"

    .line 51
    .line 52
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-static {v0, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->f()Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    const-string v4, "receive_profile_like_is_null"

    .line 69
    .line 70
    invoke-static {v4, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    filled-new-array {v0, v3}, [Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const-string v3, "e_receive_profile_like_entrance"

    .line 79
    .line 80
    const-string v4, "p_messages_view"

    .line 81
    .line 82
    invoke-static {v3, v4, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 83
    .line 84
    .line 85
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->g:Lv/VText;

    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    sget v4, Ll/c9c0;->g0:I

    .line 92
    .line 93
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->g:Lv/VText;

    .line 101
    .line 102
    iget-wide v3, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 103
    .line 104
    invoke-static {v3, v4}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->i:Lv/VText;

    .line 112
    .line 113
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Conversation;->profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 114
    .line 115
    iget v3, v3, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->receive:I

    .line 116
    .line 117
    invoke-static {v3}, Ll/a9g0;->f(I)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->i:Lv/VText;

    .line 125
    .line 126
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Conversation;->profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 127
    .line 128
    iget v3, v3, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->receive:I

    .line 129
    .line 130
    if-eqz v3, :cond_4

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_4
    move v1, v2

    .line 134
    :goto_3
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->i:Lv/VText;

    .line 138
    .line 139
    sget v1, Ll/dbc0;->V5:I

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 145
    .line 146
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->profileLikeComment:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 147
    .line 148
    if-nez v0, :cond_5

    .line 149
    .line 150
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->h:Lv/VText;

    .line 151
    .line 152
    const-string p2, "\u8fd8\u672a\u6536\u5230\u79f0\u8d5e"

    .line 153
    .line 154
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    .line 156
    .line 157
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->c:Lv/VDraweeView;

    .line 158
    .line 159
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 160
    .line 161
    .line 162
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->d:Landroid/view/View;

    .line 163
    .line 164
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    goto :goto_4

    .line 168
    :cond_5
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 173
    .line 174
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 175
    .line 176
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 177
    .line 178
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->profileLikeInfo:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 179
    .line 180
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->profileLikeComment:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 181
    .line 182
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->userId:Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {v1, v2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    invoke-interface {p2, v0, v1}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    new-instance v0, Ll/gb6;

    .line 193
    .line 194
    invoke-direct {v0, p0, p1}, Ll/gb6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 195
    .line 196
    .line 197
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 202
    .line 203
    .line 204
    :goto_4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->l:Z

    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/fb6;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/fb6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
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
    sget v0, Ll/sj6;->R:I

    .line 22
    .line 23
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    sget v0, Ll/sj6;->Q:I

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->a:Lv/VImage;

    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    new-array v2, v2, [Landroid/view/View;

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    aput-object v1, v2, v3

    .line 35
    .line 36
    invoke-static {v0, v2}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->g:Lv/VText;

    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/ue6;->k0(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->h:Lv/VText;

    .line 47
    .line 48
    invoke-static {v0}, Ll/ue6;->e0(Landroid/widget/TextView;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->a:Lv/VImage;

    .line 52
    .line 53
    sget v0, Ll/dbc0;->gn:I

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method
