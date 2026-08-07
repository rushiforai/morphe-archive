.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveEntranceStartLiveView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VDraweeView;

.field public d:Lv/VText;


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
    invoke-static {p0, p1}, Ll/own;->a(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveEntranceStartLiveView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q(Ll/oun;Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;)V
    .locals 2

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->title:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveEntranceStartLiveView;->d:Lv/VText;

    .line 10
    .line 11
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->title:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveEntranceStartLiveView;->c:Lv/VDraweeView;

    .line 17
    .line 18
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->icon:Ljava/lang/String;

    .line 19
    .line 20
    const-string v0, "context_square"

    .line 21
    .line 22
    invoke-static {v0, p0, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ll/oun;->L3()V

    .line 26
    .line 27
    .line 28
    const-string p0, "unknown_"

    .line 29
    .line 30
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/4 p2, 0x0

    .line 35
    invoke-virtual {p1, p0, p2}, Ll/oun;->D3(Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveEntranceStartLiveView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
