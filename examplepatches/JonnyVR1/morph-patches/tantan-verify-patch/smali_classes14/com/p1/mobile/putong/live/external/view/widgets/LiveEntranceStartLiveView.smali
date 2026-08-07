.class public Lcom/p1/mobile/putong/live/external/view/widgets/LiveEntranceStartLiveView;
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
    invoke-static {p0, p1}, Ll/gbs;->a(Lcom/p1/mobile/putong/live/external/view/widgets/LiveEntranceStartLiveView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q(Ll/msr;Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;)V
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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveEntranceStartLiveView;->d:Lv/VText;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveEntranceStartLiveView;->c:Lv/VDraweeView;

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
    const-string p0, "p_live_recommend"

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/msr;->h3()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_2

    .line 36
    .line 37
    const-string p0, "p_live_nearby"

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/msr;->h3()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return-void

    .line 51
    :cond_2
    :goto_0
    const-string p0, "e_bubble_live_start"

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/msr;->h3()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveEntranceStartLiveView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/mbs;->h()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget v0, Ll/qa00;->i:I

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    sget v0, Ll/nbc0;->t:I

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
