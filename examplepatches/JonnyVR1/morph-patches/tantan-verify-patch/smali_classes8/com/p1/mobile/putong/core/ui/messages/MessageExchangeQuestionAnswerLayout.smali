.class public Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VImage;

.field public d:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public e:Lv/VImage;

.field public f:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public g:Lv/VLinear;

.field public h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public i:Landroid/view/View;

.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->j:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->j:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->j:Ljava/lang/String;

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->Y(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p2, Ll/xcz;

    .line 2
    .line 3
    invoke-direct {p2, p1}, Ll/xcz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0, p2}, Ll/yxz;->Q1(ZLjava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p1, "shortcut_type"

    .line 15
    .line 16
    const-string p2, "answer"

    .line 17
    .line 18
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    filled-new-array {p1}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string p2, "e_close_click"

    .line 27
    .line 28
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 2
    .line 3
    check-cast p0, Ll/tvz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tvz;->Dg()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->Z(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->X(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    return-void
.end method


# virtual methods
.method public final V(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zcz;->a(Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final W(I)Ljava/lang/String;
    .locals 5

    .line 1
    invoke-static {}, Ll/h39;->D()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const-string p0, "\u5982\u679c\u4e0d\u9700\u8981\u62c5\u5fe7\u7ecf\u6d4e\u95ee\u9898\uff0c\u4f60\u4f1a\u9009\u62e9\u505a\u4ec0\u4e48\u5de5\u4f5c\uff1f"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    const/4 v3, 0x1

    .line 20
    if-ne v1, v3, :cond_1

    .line 21
    .line 22
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ljava/lang/String;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    invoke-static {v0, v3}, Ll/g96;->b(Ljava/util/List;I)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->j:Ljava/lang/String;

    .line 34
    .line 35
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, Ljava/lang/CharSequence;

    .line 40
    .line 41
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_3

    .line 46
    .line 47
    const/4 v1, 0x3

    .line 48
    if-le p1, v1, :cond_2

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    add-int/2addr p1, v3

    .line 52
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->W(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_3
    :goto_0
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, Ljava/lang/String;

    .line 62
    .line 63
    return-object p0
.end method

.method public final synthetic X(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 6
    .line 7
    iget-object v1, v1, Ll/clz;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

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
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->j:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p1, v0, p0}, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->E2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 27
    .line 28
    check-cast p0, Ll/tvz;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/tvz;->Dg()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic Y(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p3, Ll/ycz;

    .line 2
    .line 3
    invoke-direct {p3, p0, p2}, Ll/ycz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p1, v0, p3}, Ll/yxz;->Q1(ZLjava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string p2, "answer_write"

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->j:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    filled-new-array {p0}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p2, "e_change_now"

    .line 27
    .line 28
    invoke-static {p2, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic Z(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->b0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string p2, "answer_write"

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->j:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    filled-new-array {p0}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p2, "e_change_one"

    .line 21
    .line 22
    invoke-static {p2, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public a0(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/yxz;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->e:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/ucz;

    .line 4
    .line 5
    invoke-direct {v1, p2, p1}, Ll/ucz;-><init>(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 12
    .line 13
    new-instance v1, Ll/vcz;

    .line 14
    .line 15
    invoke-direct {v1, p0, p2, p1}, Ll/vcz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->i:Landroid/view/View;

    .line 22
    .line 23
    new-instance v0, Ll/wcz;

    .line 24
    .line 25
    invoke-direct {v0, p0, p1}, Ll/wcz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->b0()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string p2, "answer_write"

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->j:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {p2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    filled-new-array {p0}, [Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string p2, "e_exchange_answer_shortcut"

    .line 51
    .line 52
    invoke-static {p2, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final b0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->W(I)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->j:Ljava/lang/String;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->f:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->V(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->c:Lv/VImage;

    .line 22
    .line 23
    sget v1, Ll/ibc0;->A7:I

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->e:Lv/VImage;

    .line 29
    .line 30
    sget v1, Ll/ibc0;->n7:I

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->d:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    sget v2, Ll/g9c0;->i:I

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->f:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    sget v2, Ll/g9c0;->g:I

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    sget v2, Ll/g9c0;->j:I

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageExchangeQuestionAnswerLayout;->i:Landroid/view/View;

    .line 81
    .line 82
    sget v0, Ll/ibc0;->B7:I

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 85
    .line 86
    .line 87
    :cond_0
    return-void
.end method
