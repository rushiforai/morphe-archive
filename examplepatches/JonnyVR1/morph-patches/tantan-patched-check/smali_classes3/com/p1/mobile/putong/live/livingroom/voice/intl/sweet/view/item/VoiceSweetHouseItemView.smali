.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetHouseItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VText;

.field public c:Landroid/widget/TextView;


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
    invoke-static {p0, p1}, Ll/vzo0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetHouseItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V
    .locals 9

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetHouseItemView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseImage:Ljava/lang/String;

    .line 4
    .line 5
    const/high16 v0, 0x42c80000    # 100.0f

    .line 6
    .line 7
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    invoke-static {}, Ll/irn;->a()Z

    .line 16
    .line 17
    .line 18
    move-result v7

    .line 19
    const/4 v8, 0x0

    .line 20
    const-string v0, "context_single_room"

    .line 21
    .line 22
    const/4 v5, 0x0

    .line 23
    const/4 v6, 0x0

    .line 24
    invoke-static/range {v0 .. v8}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 25
    .line 26
    .line 27
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->isUnLock:Z

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetHouseItemView;->a:Lv/VDraweeView;

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    const/high16 v0, 0x3f800000    # 1.0f

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const v0, 0x3ecccccd    # 0.4f

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 43
    .line 44
    .line 45
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetHouseItemView;->b:Lv/VText;

    .line 46
    .line 47
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->isUnLock:Z

    .line 48
    .line 49
    xor-int/lit8 p1, p1, 0x1

    .line 50
    .line 51
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetHouseItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
