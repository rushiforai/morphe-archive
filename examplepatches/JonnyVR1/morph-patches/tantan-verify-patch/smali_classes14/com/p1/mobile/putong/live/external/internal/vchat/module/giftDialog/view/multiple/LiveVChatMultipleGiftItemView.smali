.class public Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView$ContinueType2;
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

.field public h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

.field public j:Landroid/graphics/Bitmap;

.field public k:Landroid/text/SpannableString;

.field public final l:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView$a;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->l:Ljava/lang/Runnable;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView$a;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->l:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView$a;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->l:Ljava/lang/Runnable;

    return-void
.end method

.method public static bridge synthetic h0(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;)Landroid/text/SpannableString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->k:Landroid/text/SpannableString;

    return-object p0
.end method


# virtual methods
.method public getGears()Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/upu;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j0(I)V
    .locals 2

    .line 1
    const/4 v0, 0x5

    .line 2
    sget-object v1, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    .line 3
    .line 4
    invoke-static {p1, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->j:Landroid/graphics/Bitmap;

    .line 9
    .line 10
    return-void
.end method

.method public final k0(I)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->j:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->j0(I)V

    .line 15
    .line 16
    .line 17
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->j:Landroid/graphics/Bitmap;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-ge v0, p1, :cond_3

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->j:Landroid/graphics/Bitmap;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->j0(I)V

    .line 31
    .line 32
    .line 33
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->j:Landroid/graphics/Bitmap;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Landroid/graphics/Bitmap;->setWidth(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->j:Landroid/graphics/Bitmap;

    .line 39
    .line 40
    return-object p0
.end method

.method public final l0(Ljava/lang/String;I)V
    .locals 3

    .line 1
    new-instance v0, Landroid/text/SpannableString;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, " "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->k:Landroid/text/SpannableString;

    .line 21
    .line 22
    new-instance p1, Landroid/text/style/ImageSpan;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->k0(I)Landroid/graphics/Bitmap;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-direct {p1, v0, p2}, Landroid/text/style/ImageSpan;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->k:Landroid/text/SpannableString;

    .line 36
    .line 37
    const/4 p2, 0x1

    .line 38
    const/16 v0, 0x21

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {p0, p1, v1, p2, v0}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public m0(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView$ContinueType2;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->d:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView$ContinueType2;->getBgRes()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 11
    .line 12
    sget p1, Ll/m9c0;->C:I

    .line 13
    .line 14
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final n0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;Ll/jjs;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->l:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;->combosHitNum:J

    .line 11
    .line 12
    long-to-int v0, v0

    .line 13
    invoke-static {p2, v0}, Ll/f3e;->d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;I)D

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    double-to-long v0, v0

    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;->previewText:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1}, Ll/dpj;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget p2, Lcom/p1/mobile/putong/live/external/R$string;->b0:I

    .line 25
    .line 26
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {p2, v0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 35
    .line 36
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_0

    .line 64
    .line 65
    const-string v1, ""

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v2, "    "

    .line 71
    .line 72
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 90
    .line 91
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1, p2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    const/high16 v1, 0x428c0000    # 70.0f

    .line 100
    .line 101
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    int-to-float v1, v1

    .line 106
    sub-float/2addr v1, p2

    .line 107
    const/high16 p2, 0x40000000    # 2.0f

    .line 108
    .line 109
    div-float/2addr v1, p2

    .line 110
    float-to-int p2, v1

    .line 111
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->l0(Ljava/lang/String;I)V

    .line 112
    .line 113
    .line 114
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-nez p1, :cond_1

    .line 119
    .line 120
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->l:Ljava/lang/Runnable;

    .line 125
    .line 126
    const-wide/16 v0, 0x3e8

    .line 127
    .line 128
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 129
    .line 130
    .line 131
    :cond_1
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;Ll/jjs;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->f:Landroid/widget/TextView;

    .line 4
    .line 5
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;->combosHitNum:J

    .line 6
    .line 7
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->n0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;Ll/jjs;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->f:Landroid/widget/TextView;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/n0k;->e(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->e:Landroid/widget/TextView;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/n0k;->e(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;->e:Landroid/widget/TextView;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
