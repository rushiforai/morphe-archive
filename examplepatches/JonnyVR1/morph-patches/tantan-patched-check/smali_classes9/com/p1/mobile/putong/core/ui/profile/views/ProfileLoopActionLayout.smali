.class public Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VButton;

.field public c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public d:Ll/bqa0;

.field public e:Z


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

.method public static synthetic a(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->h(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->j(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/uma0;->a(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->d:Ll/bqa0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->d:Ll/bqa0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/bqa0;->H()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->getNextButton()Landroid/widget/TextView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public getNextButton()Landroid/widget/TextView;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 9
    .line 10
    return-object p0
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->d:Ll/bqa0;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->d:Ll/bqa0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/bqa0;->h1()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->d:Ll/bqa0;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->d:Ll/bqa0;

    .line 10
    .line 11
    invoke-interface {p1}, Ll/bqa0;->X()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->d:Ll/bqa0;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/bqa0;->H()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->d:Ll/bqa0;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->d:Ll/bqa0;

    .line 10
    .line 11
    invoke-interface {p1}, Ll/bqa0;->X()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->d:Ll/bqa0;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/bqa0;->H()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public k()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->getNextButton()Landroid/widget/TextView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->d:Ll/bqa0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/bqa0;->X()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Ll/kbc0;->e:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget v3, Ll/kbc0;->f:I

    .line 44
    .line 45
    invoke-virtual {v0, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 53
    .line 54
    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public l(Ll/bqa0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->d:Ll/bqa0;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/bqa0;->isLast()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->getNextButton()Landroid/widget/TextView;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->e:I

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->getNextButton()Landroid/widget/TextView;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->f:I

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->e:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 5
    .line 6
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->a:Lv/VText;

    .line 8
    .line 9
    new-instance v1, Ll/qma0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/qma0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 18
    .line 19
    new-instance v1, Ll/rma0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/rma0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 28
    .line 29
    new-instance v1, Ll/sma0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/sma0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/tma0;

    .line 38
    .line 39
    invoke-direct {v0}, Ll/tma0;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public setNextButton(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->getNextButton()Landroid/widget/TextView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
