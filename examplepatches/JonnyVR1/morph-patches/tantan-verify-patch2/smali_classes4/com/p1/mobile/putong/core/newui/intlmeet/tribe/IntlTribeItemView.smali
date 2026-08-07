.class public Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeItemView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText_NoTopPadding;

.field public d:Lv/VText_NoTopPadding;

.field public e:Lv/VRecyclerView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/egp;->a(Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/core/data/TribeSubset;Ll/ojo;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeItemView;->c:Lv/VText_NoTopPadding;

    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/TribeSubset;->mainHead:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeItemView;->d:Lv/VText_NoTopPadding;

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/TribeSubset;->subHead:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeItemView;->d:Lv/VText_NoTopPadding;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/TribeSubset;->subHead:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    xor-int/lit8 p1, p1, 0x1

    .line 27
    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeItemView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
