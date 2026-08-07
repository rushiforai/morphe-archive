.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/RedPacketGiftView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/view/View;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/usc0;->a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/RedPacketGiftView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/RedPacketGiftView;->e:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;->giftUrl:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageURI(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/RedPacketGiftView;->f:Lv/VText;

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;->giftName:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/RedPacketGiftView;->g:Lv/VText;

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v1, "x"

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;->num:I

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/RedPacketGiftView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/RedPacketGiftView;->d:Landroid/view/View;

    .line 8
    .line 9
    const v1, -0x25cd00

    .line 10
    .line 11
    .line 12
    const v2, 0xda3300

    .line 13
    .line 14
    .line 15
    filled-new-array {v1, v2}, [I

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 20
    .line 21
    sget v3, Ll/qa00;->g:I

    .line 22
    .line 23
    int-to-float v3, v3

    .line 24
    const/4 v4, 0x0

    .line 25
    invoke-static {v1, v2, v3, v4}, Ll/fc2;->e([ILandroid/graphics/drawable/GradientDrawable$Orientation;FZ)Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/RedPacketGiftView;->d:Landroid/view/View;

    .line 33
    .line 34
    const v0, 0x3e4ccccd    # 0.2f

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
