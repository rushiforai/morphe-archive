.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadLikerItemLayout;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VDraweeView;

.field public c:Lv/VFrame;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V
    .locals 6

    .line 1
    const-string p2, "position"

    .line 2
    .line 3
    const-string v0, "2"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const-string v0, "nomatch_guide_type"

    .line 10
    .line 11
    const-string v1, "see"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    const-string v0, "e_nomatch_svip_guide"

    .line 22
    .line 23
    const-string v1, "p_messages_view"

    .line 24
    .line 25
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 37
    .line 38
    filled-new-array {p1}, [Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h7()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    new-instance v4, Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string v5, "p_message,nomatch_guide"

    .line 64
    .line 65
    move-object v1, p0

    .line 66
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->n8(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-interface {p1, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hg(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/android/app/Act$w;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {v1, p0, p1}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadLikerItemLayout;->s(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final s(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/p86;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadLikerItemLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 6

    return-void

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->A:Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadLikerItemLayout;->b:Lv/VDraweeView;

    .line 9
    .line 10
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;->avatar:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v4, 0x4

    .line 13
    const/16 v5, 0x23

    .line 14
    .line 15
    invoke-virtual {v1, v2, v3, v4, v5}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadLikerItemLayout;->d:Lv/VImage;

    .line 19
    .line 20
    sget v2, Ll/dbc0;->t8:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadLikerItemLayout;->e:Lv/VText;

    .line 26
    .line 27
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;->title:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadLikerItemLayout;->f:Lv/VText;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;->subTitle:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/o86;

    .line 40
    .line 41
    invoke-direct {v0, p1, p2}, Ll/o86;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    const-string p0, "position"

    .line 48
    .line 49
    const-string p1, "2"

    .line 50
    .line 51
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, "nomatch_guide_type"

    .line 56
    .line 57
    const-string p2, "see"

    .line 58
    .line 59
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p1, "e_nomatch_svip_guide"

    .line 68
    .line 69
    const-string p2, "p_messages_view"

    .line 70
    .line 71
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method
