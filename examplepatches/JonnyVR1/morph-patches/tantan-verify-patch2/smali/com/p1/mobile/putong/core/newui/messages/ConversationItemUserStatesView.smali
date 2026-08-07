.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VImage;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Landroid/widget/TextView;


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

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;Lcom/p1/mobile/putong/app/PutongAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;->h(Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;Lcom/p1/mobile/putong/app/PutongAct;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;Ll/bkj0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const-string v1, "p_messages_view"

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Ljava/lang/CharSequence;

    .line 15
    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast p1, Ljava/lang/String;

    .line 39
    .line 40
    invoke-interface {v0, p0, v2, p1, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Dk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-interface {p1, p0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->j9(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "p_messages_view"

    .line 9
    .line 10
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->j9(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;Lcom/p1/mobile/putong/app/PutongAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;->g(Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;Lcom/p1/mobile/putong/app/PutongAct;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tc6;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Tg()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lrx/c;->first()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v0, Ll/rc6;

    .line 23
    .line 24
    invoke-direct {v0, p1}, Ll/rc6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 25
    .line 26
    .line 27
    new-instance v1, Ll/sc6;

    .line 28
    .line 29
    invoke-direct {v1, p1}, Ll/sc6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;Lcom/p1/mobile/putong/app/PutongAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;->j(Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;->f(Lcom/p1/mobile/android/app/Act;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;Lcom/p1/mobile/putong/app/PutongAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;->j(Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->q1:Lcom/p1/mobile/putong/core/api/i;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/i;->C3()Lrx/c;

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "p_messages_view"

    .line 16
    .line 17
    invoke-interface {p0, p2, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Tf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 3

    return-void

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;->d:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 12
    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 14
    .line 15
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/16 v1, 0x8

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;->haveMatchedState:Z

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    iget v0, p2, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;->unread:I

    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;->e:Lv/VText;

    .line 31
    .line 32
    if-lez v0, :cond_1

    .line 33
    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    iget v1, p2, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;->unread:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v1, "\u4e2a\u597d\u53cb\u66f4\u65b0\u4e86\u72b6\u6001"

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;->b:Lv/VImage;

    .line 57
    .line 58
    const/4 v1, 0x0

    .line 59
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    const-string v0, "\u770b\u770b\u597d\u53cb\u7684\u6700\u65b0\u72b6\u6001\uff0c\u5373\u523b\u5f00\u804a"

    .line 64
    .line 65
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;->b:Lv/VImage;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 71
    .line 72
    .line 73
    :goto_0
    new-instance v0, Ll/qc6;

    .line 74
    .line 75
    invoke-direct {v0, p0, p2, p1}, Ll/qc6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 76
    .line 77
    .line 78
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;->e:Lv/VText;

    .line 83
    .line 84
    const-string v2, "\u5206\u4eab\u6b64\u523b\u72b6\u6001\uff0c\u4e0e\u597d\u53cb\u5373\u523b\u5f00\u804a"

    .line 85
    .line 86
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;->b:Lv/VImage;

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 92
    .line 93
    .line 94
    new-instance v0, Ll/pc6;

    .line 95
    .line 96
    invoke-direct {v0, p0, p2, p1}, Ll/pc6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 97
    .line 98
    .line 99
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final j(Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;)V
    .locals 1

    .line 1
    new-instance p0, Ll/pf60;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget p1, p1, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;->unread:I

    .line 10
    .line 11
    if-lez p1, :cond_0

    .line 12
    .line 13
    const-string p1, "yes"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p1, "no"

    .line 17
    .line 18
    :goto_0
    const-string v0, "has_red_dot"

    .line 19
    .line 20
    invoke-direct {p0, v0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    filled-new-array {p0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "e_match_state"

    .line 28
    .line 29
    const-string v0, "p_messages_view"

    .line 30
    .line 31
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
