.class public Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberFooterDescView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberFooterDescView;

.field public b:Lv/VText;


# direct methods
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

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
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

    .line 5
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/i4t;->a(Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberFooterDescView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b(I)I
    .locals 0

    .line 1
    add-int/lit8 p1, p1, -0x1

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    if-gtz p1, :cond_0

    .line 5
    .line 6
    return p0

    .line 7
    :cond_0
    mul-int/lit8 p1, p1, 0x3e

    .line 8
    .line 9
    rsub-int p1, p1, 0xce

    .line 10
    .line 11
    if-gtz p1, :cond_1

    .line 12
    .line 13
    return p0

    .line 14
    :cond_1
    int-to-float p0, p1

    .line 15
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public c(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberFooterDescView;->d(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public d(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberFooterDescView;->b:Lv/VText;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const-string p0, "\u5df2\u7ecf\u5230\u5e95\u4e86"

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->O5:I

    .line 12
    .line 13
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(I)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberFooterDescView;->a:Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberFooterDescView;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberFooterDescView;->b(I)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p2, p1, p0, p1, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberFooterDescView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
