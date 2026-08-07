.class public Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

.field public c:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public d:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->d:Z

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->b(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s6b0;->a(Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 3
    .line 4
    .line 5
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget v0, Ll/rec0;->x2:I

    .line 10
    .line 11
    invoke-virtual {p1, v0, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->a(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public c(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->d()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->b:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->i()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->b:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->a:Lv/VText;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->a:Lv/VText;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/16 p1, 0x8

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final d()V
    .locals 1

    .line 1
    sget v0, Ll/jbc0;->Z5:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setInNewMyTab(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPurchaseType(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    return-void
.end method
