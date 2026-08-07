.class public Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupBanner;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VLinear;

.field public c:Lv/VText_NoTopPadding;

.field public d:Lv/VText_NoTopPadding;

.field public e:Lv/VText_NoTopPadding;


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


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupBanner;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bgp;->a(Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupBanner;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/core/data/TribeSubsetContent;Ll/ojo;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupBanner;->a:Lv/VDraweeView;

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->coverUrl:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupBanner;->d:Lv/VText_NoTopPadding;

    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->title:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupBanner;->e:Lv/VText_NoTopPadding;

    .line 21
    .line 22
    iget v1, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->totalCount:I

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {p2, v1, v2}, Ll/ojo;->t0(IZ)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupBanner;->e:Lv/VText_NoTopPadding;

    .line 33
    .line 34
    iget v1, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->totalCount:I

    .line 35
    .line 36
    const/4 v3, 0x1

    .line 37
    if-le v1, v3, :cond_1

    .line 38
    .line 39
    move v1, v3

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    move v1, v2

    .line 42
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupBanner;->c:Lv/VText_NoTopPadding;

    .line 46
    .line 47
    iget v1, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->currentLikeMe:I

    .line 48
    .line 49
    invoke-virtual {p2, v1, v3}, Ll/ojo;->t0(IZ)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupBanner;->b:Lv/VLinear;

    .line 57
    .line 58
    iget p1, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->currentLikeMe:I

    .line 59
    .line 60
    if-lez p1, :cond_2

    .line 61
    .line 62
    move v2, v3

    .line 63
    :cond_2
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
