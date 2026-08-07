.class public Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;

.field public b:Lv/VLinear;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->h(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->j()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->g(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/yf7;->a(Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()Lcom/p1/mobile/android/app/Act;
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

.method public f(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isAiStory(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreAiStoryShareStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreAiStoryShareStatus;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAiStoryShareStatus;->shareStatus:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    return-object p0

    .line 42
    :catch_0
    move-exception p1

    .line 43
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    :cond_2
    return-object p0
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u5206\u4eab\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5"

    .line 8
    .line 9
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Ll/pf60;

    .line 14
    .line 15
    const-string v1, "moment_id"

    .line 16
    .line 17
    invoke-direct {v0, v1, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    new-instance p2, Ll/pf60;

    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    const-string v1, ""

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    :goto_0
    const-string v2, "message_id"

    .line 30
    .line 31
    invoke-direct {p2, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    filled-new-array {v0, p2}, [Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    const-string v0, "e_ai_story_share_to_moment"

    .line 39
    .line 40
    const-string v1, "p_chat_view"

    .line 41
    .line 42
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 48
    .line 49
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p2, v0, p1}, Lcom/p1/mobile/putong/core/api/g;->Kn(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 54
    .line 55
    .line 56
    new-instance p1, Ll/xf7;

    .line 57
    .line 58
    invoke-direct {p1, p0}, Ll/xf7;-><init>(Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isPostingMoment()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->e()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    new-instance v3, Ll/wf7;

    .line 25
    .line 26
    invoke-direct {v3, p0, p1}, Ll/wf7;-><init>(Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {p2, v0, v1, v2, v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Kr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/y20;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 3

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->l(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->b:Lv/VLinear;

    .line 16
    .line 17
    new-instance v1, Ll/vf7;

    .line 18
    .line 19
    invoke-direct {v1, p0, p1}, Ll/vf7;-><init>(Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->c:Lv/VImage;

    .line 30
    .line 31
    sget v1, Ll/ibc0;->j:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->d:Lv/VText;

    .line 37
    .line 38
    const-string v1, "\u5206\u4eab\u81f3\u52a8\u6001"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->d:Lv/VText;

    .line 44
    .line 45
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 46
    .line 47
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    sget v2, Ll/g9c0;->v:I

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->k(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_3

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->j()V

    .line 68
    .line 69
    .line 70
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->e:Z

    .line 71
    .line 72
    if-nez v0, :cond_2

    .line 73
    .line 74
    const/4 v0, 0x1

    .line 75
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->e:Z

    .line 76
    .line 77
    new-instance p0, Ll/pf60;

    .line 78
    .line 79
    const-string v0, "message_id"

    .line 80
    .line 81
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 82
    .line 83
    invoke-direct {p0, v0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    filled-new-array {p0}, [Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string p1, "e_ai_story_share_to_moment"

    .line 91
    .line 92
    const-string v0, "p_chat_view"

    .line 93
    .line 94
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 95
    .line 96
    .line 97
    :cond_2
    return-void

    .line 98
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->b:Lv/VLinear;

    .line 99
    .line 100
    const/4 v1, 0x0

    .line 101
    invoke-virtual {p1, v1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final j()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->b:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->c:Lv/VImage;

    .line 12
    .line 13
    sget v1, Ll/ibc0;->i:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->d:Lv/VText;

    .line 19
    .line 20
    const-string v1, "\u5df2\u5206\u4eab\u81f3\u52a8\u6001"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->d:Lv/VText;

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget v1, Ll/g9c0;->s:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->f(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "shared"

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public l(Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->f(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "toShare"

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/CoreChatAiSendMomentItem;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
