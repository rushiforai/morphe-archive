.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VText;

.field public c:Ljava/lang/String;

.field public d:Z


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
.method public a(I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    move v1, v0

    .line 7
    :goto_0
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    if-nez p1, :cond_2

    .line 11
    .line 12
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->d:Z

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->a:Lv/VImage;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    sget p1, Ll/nbc0;->S0:I

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->b:Lv/VText;

    .line 24
    .line 25
    const-string p1, "\u6682\u65f6\u6ca1\u6709\u65b0\u7684\u5185\u5bb9"

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    sget p1, Ll/nbc0;->o1:I

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->b:Lv/VText;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->c:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->a:Lv/VImage;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 47
    .line 48
    .line 49
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->d:Z

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->a:Lv/VImage;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget v0, Ll/nbc0;->T0:I

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->b:Lv/VText;

    .line 17
    .line 18
    const-string v0, "\u5f53\u524d\u7f51\u7edc\u4e0d\u53ef\u7528"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    sget v0, Ll/nbc0;->n1:I

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->b:Lv/VText;

    .line 30
    .line 31
    sget v0, Lcom/p1/mobile/putong/live/external/R$string;->S:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->d:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->b:Lv/VText;

    .line 5
    .line 6
    const-string v0, "#d8d8d8"

    .line 7
    .line 8
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/ldc0;->u0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VImage;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->a:Lv/VImage;

    .line 13
    .line 14
    sget v0, Ll/ldc0;->l2:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->b:Lv/VText;

    .line 23
    .line 24
    return-void
.end method

.method public setEmptyText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/fragmentnew2/LiveEmptyErrorView;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
