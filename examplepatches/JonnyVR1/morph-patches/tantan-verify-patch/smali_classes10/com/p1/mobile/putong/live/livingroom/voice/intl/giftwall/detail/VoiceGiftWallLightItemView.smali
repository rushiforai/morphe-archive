.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pkn0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;->b:Lv/VDraweeView;

    .line 2
    .line 3
    const-string v1, "context_single_room"

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserAvatar:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, v0, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;->c:Lv/VText;

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserName:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;->d:Lv/VText;

    .line 20
    .line 21
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->dh:I

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightTime:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;->a:Landroid/widget/TextView;

    .line 33
    .line 34
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->fh:I

    .line 35
    .line 36
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserAvatar:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v1, v0, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;->c:Lv/VText;

    .line 50
    .line 51
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserName:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;->d:Lv/VText;

    .line 57
    .line 58
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->kh:I

    .line 59
    .line 60
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveCount:I

    .line 61
    .line 62
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {v0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;->a:Landroid/widget/TextView;

    .line 74
    .line 75
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->hh:I

    .line 76
    .line 77
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/detail/VoiceGiftWallLightItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
