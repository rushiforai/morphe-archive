.class public Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;
.super Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedAbstractInputMomentTextToJoinTopicView;
.source "SourceFile"


# instance fields
.field public f:Landroid/view/View;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VImage;

.field public i:Landroid/widget/LinearLayout;

.field public j:Lv/VEditText;

.field public k:Lv/VText;

.field public l:Lv/VImage;

.field public m:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedAbstractInputMomentTextToJoinTopicView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->J(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
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

    .line 8
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedAbstractInputMomentTextToJoinTopicView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->J(Landroid/content/Context;)V

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

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedAbstractInputMomentTextToJoinTopicView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->J(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedAbstractInputMomentTextToJoinTopicView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->J(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->K(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public D(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedAbstractInputMomentTextToJoinTopicView;->j()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaInputAct;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v5, 0x1

    .line 10
    const/4 v6, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, 0x0

    .line 14
    move-object v1, p1

    .line 15
    invoke-static/range {v1 .. v6}, Ll/cn40;->W(Lcom/p1/mobile/putong/feed/data/Moment;ZZZZLjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    move-object v1, p1

    .line 20
    invoke-super {p0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedAbstractInputMomentTextToJoinTopicView;->D(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public E()V
    .locals 5

    .line 1
    invoke-static {}, Ll/cmg;->n0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->l:Lv/VImage;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedAbstractInputMomentTextToJoinTopicView;->p()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->m:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedAbstractInputMomentTextToJoinTopicView;->p()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->l:Lv/VImage;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->getSendButton()Landroid/widget/TextView;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->l:Lv/VImage;

    .line 36
    .line 37
    invoke-static {v2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->l:Lv/VImage;

    .line 45
    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->m:Lv/VText;

    .line 47
    .line 48
    const/4 v3, 0x2

    .line 49
    new-array v3, v3, [Landroid/view/View;

    .line 50
    .line 51
    const/4 v4, 0x0

    .line 52
    aput-object v0, v3, v4

    .line 53
    .line 54
    aput-object v2, v3, v1

    .line 55
    .line 56
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/hvg;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/hvg;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 66
    .line 67
    .line 68
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedAbstractInputMomentTextToJoinTopicView;->E()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public I(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/jvg;->b(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final J(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->I(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedAbstractInputMomentTextToJoinTopicView;->k(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic K(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->l:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->k:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->j:Lv/VEditText;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    xor-int/2addr p1, v1

    .line 27
    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 32
    .line 33
    .line 34
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->l:Lv/VImage;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    xor-int/2addr p1, v1

    .line 41
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic L(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ivg;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ivg;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public getBackCover()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->f:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCloseView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->h:Lv/VImage;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContainer()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->i:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEditText()Lv/VEditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->j:Lv/VEditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoot()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->g:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSendButton()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->k:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTopicSelectImg()Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;->l:Lv/VImage;

    .line 2
    .line 3
    return-object p0
.end method
