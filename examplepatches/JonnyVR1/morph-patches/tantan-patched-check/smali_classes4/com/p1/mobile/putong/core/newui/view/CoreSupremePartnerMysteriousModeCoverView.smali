.class public Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeCoverView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeCoverView;

.field public b:Landroid/view/View;

.field public c:Landroid/view/View;

.field public d:Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;


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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/z6b;->a(Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeCoverView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/User;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeCoverView;->d:Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;->b(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x2

    .line 7
    if-ne p1, p2, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeCoverView;->d:Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeTagView;

    .line 10
    .line 11
    const/high16 p2, 0x43100000    # 144.0f

    .line 12
    .line 13
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeCoverView;->b:Landroid/view/View;

    .line 21
    .line 22
    sget p1, Ll/dbc0;->sq:I

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeCoverView;->b:Landroid/view/View;

    .line 29
    .line 30
    sget p1, Ll/dbc0;->rq:I

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeCoverView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSupremePartnerMysteriousModeCoverView;->c:Landroid/view/View;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
