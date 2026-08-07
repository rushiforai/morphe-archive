.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetCpItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VLinear;

.field public c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpSimpleHeadView;


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
    invoke-static {p0, p1}, Ll/hxo0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetCpItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetCpItemView;->b:Lv/VLinear;

    .line 2
    .line 3
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->isUnLock:Z

    .line 4
    .line 5
    xor-int/lit8 v1, v1, 0x1

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetCpItemView;->a:Lv/VDraweeView;

    .line 11
    .line 12
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseImage:Ljava/lang/String;

    .line 13
    .line 14
    const/high16 v0, 0x43500000    # 208.0f

    .line 15
    .line 16
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    const/high16 v0, 0x434f0000    # 207.0f

    .line 21
    .line 22
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 23
    .line 24
    .line 25
    move-result v6

    .line 26
    invoke-static {}, Ll/irn;->a()Z

    .line 27
    .line 28
    .line 29
    move-result v9

    .line 30
    const/4 v10, 0x0

    .line 31
    const-string v2, "context_single_room"

    .line 32
    .line 33
    const/4 v7, 0x0

    .line 34
    const/4 v8, 0x0

    .line 35
    invoke-static/range {v2 .. v10}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetCpItemView;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpSimpleHeadView;

    .line 39
    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->meUserAvatar:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpUserAvatar:Ljava/lang/String;

    .line 43
    .line 44
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->isUnLock:Z

    .line 45
    .line 46
    xor-int/lit8 p1, p1, 0x1

    .line 47
    .line 48
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpSimpleHeadView;->b(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetCpItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
