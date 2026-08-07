.class public Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$b;
    }
.end annotation


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

.field public c:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$b;

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
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->d:Z

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
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->d:Z

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
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->d:Z

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;)Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->c:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$b;

    return-object p0
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/otv;->a(Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->y:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->d(ZLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public d(ZLjava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->b:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->a:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/16 v2, 0x8

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->b:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 17
    .line 18
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->b:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->b:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 31
    .line 32
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->d:Z

    .line 33
    .line 34
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;->Q(ZLjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public e()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->b:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->a:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/16 v1, 0x8

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->b:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->b:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->d:Z

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    sget v3, Lcom/p1/mobile/putong/live/base/R$string;->v:I

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;->Q(ZLjava/lang/String;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->d:Z

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    sget v3, Lcom/p1/mobile/putong/live/base/R$string;->f:I

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;->Q(ZLjava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->b:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 61
    .line 62
    new-instance v1, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$a;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$a;-><init>(Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public f(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->y:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->g(ZLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public g(ZLjava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->a:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->b:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->b:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->b:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 26
    .line 27
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->d:Z

    .line 28
    .line 29
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;->Q(ZLjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    const/4 v2, -0x2

    .line 11
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 12
    .line 13
    .line 14
    const/16 v1, 0x11

    .line 15
    .line 16
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setIsHalf(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public setReloadListener(Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->c:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$b;

    .line 2
    .line 3
    return-void
.end method
