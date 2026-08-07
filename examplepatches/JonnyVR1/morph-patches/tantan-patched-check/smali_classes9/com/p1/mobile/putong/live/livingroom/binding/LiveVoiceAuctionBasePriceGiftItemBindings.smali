.class public Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionBasePriceGiftItemBindings;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationchoose/RelationPageItemView;

.field public b:Landroid/view/View;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/ViewGroup;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationchoose/RelationPageItemView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionBasePriceGiftItemBindings;->a:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationchoose/RelationPageItemView;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionBasePriceGiftItemBindings;->b:Landroid/view/View;

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    const-string v1, "_bg"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v1, 0x0

    .line 19
    :goto_0
    const/4 v2, 0x1

    .line 20
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Landroid/view/ViewGroup;

    .line 25
    .line 26
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VDraweeView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionBasePriceGiftItemBindings;->c:Lv/VDraweeView;

    .line 33
    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    const-string v1, "_icon"

    .line 37
    .line 38
    :cond_1
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/view/ViewGroup;

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lv/VText;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionBasePriceGiftItemBindings;->d:Lv/VText;

    .line 51
    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    const-string v1, "_name"

    .line 55
    .line 56
    :cond_2
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Landroid/view/ViewGroup;

    .line 61
    .line 62
    const/4 v0, 0x2

    .line 63
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Lv/VText;

    .line 68
    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionBasePriceGiftItemBindings;->e:Lv/VText;

    .line 70
    .line 71
    if-nez p1, :cond_3

    .line 72
    .line 73
    const-string v1, "_price"

    .line 74
    .line 75
    :cond_3
    if-nez v1, :cond_4

    .line 76
    .line 77
    return-void

    .line 78
    :cond_4
    const-string p0, "Missing required view with ID:"

    .line 79
    .line 80
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public getRoot()Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationchoose/RelationPageItemView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionBasePriceGiftItemBindings;->a:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationchoose/RelationPageItemView;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionBasePriceGiftItemBindings;->a(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
