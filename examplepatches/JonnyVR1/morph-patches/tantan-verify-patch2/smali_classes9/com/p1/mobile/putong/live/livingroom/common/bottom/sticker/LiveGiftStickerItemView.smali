.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

.field public h:I

.field public i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;

.field public final j:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->j:Landroid/view/View$OnClickListener;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->j:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->j:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public static bridge synthetic h0(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;)Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->g:Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    return-object p0
.end method

.method public static bridge synthetic i0(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->h:I

    return p0
.end method

.method public static bridge synthetic j0(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;

    return-object p0
.end method

.method private n0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->e:Lv/VText;

    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->f:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Landroid/view/View;->setSelected(Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private setGiftName(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->e:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->giftName:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    xor-int/lit8 v1, v1, 0x1

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->e:Lv/VText;

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->giftName:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->giftName:Ljava/lang/String;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string p1, ""

    .line 28
    .line 29
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private setGiftPrice(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->f:Lv/VText;

    .line 2
    .line 3
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->price:I

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    if-le v1, v2, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->f:Lv/VText;

    .line 15
    .line 16
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->me:I

    .line 17
    .line 18
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->price:I

    .line 19
    .line 20
    int-to-double v1, p1

    .line 21
    invoke-static {v1, v2}, Ll/a9g0;->d(D)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {v0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public final k0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zls;->a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->n0()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->isSelected:Z

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setSelected(Z)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->g:Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    .line 10
    .line 11
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->h:I

    .line 12
    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->m0(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->setGiftName(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->setGiftPrice(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->j:Landroid/view/View$OnClickListener;

    .line 25
    .line 26
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final m0(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->icon:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->d:Lv/VDraweeView;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->icon:Ljava/lang/String;

    .line 13
    .line 14
    sget v0, Ll/qa00;->F:I

    .line 15
    .line 16
    const-string v1, "context_livingAct"

    .line 17
    .line 18
    invoke-static {v1, p0, p1, v0, v0}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->k0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
