.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetCpLimitItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VLinear;

.field public c:Lv/VLinear;

.field public d:Landroid/widget/TextView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;


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
    invoke-static {p0, p1}, Ll/lxo0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetCpLimitItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;)V
    .locals 13

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;->remainingMill:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v0, v1

    .line 13
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetCpLimitItemView;->b:Lv/VLinear;

    .line 14
    .line 15
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetCpLimitItemView;->c:Lv/VLinear;

    .line 19
    .line 20
    xor-int/lit8 v3, v0, 0x1

    .line 21
    .line 22
    invoke-static {v2, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetCpLimitItemView;->a:Lv/VDraweeView;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const v0, 0x3e99999a    # 0.3f

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v0}, Landroid/view/View;->setAlpha(F)V

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 37
    .line 38
    invoke-virtual {v2, v0}, Landroid/view/View;->setAlpha(F)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetCpLimitItemView;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;

    .line 42
    .line 43
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;->remainingMill:J

    .line 44
    .line 45
    invoke-virtual {v0, v2, v3, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->b(JZ)V

    .line 46
    .line 47
    .line 48
    :goto_1
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetCpLimitItemView;->a:Lv/VDraweeView;

    .line 49
    .line 50
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;->image:Ljava/lang/String;

    .line 51
    .line 52
    const/high16 p0, 0x43480000    # 200.0f

    .line 53
    .line 54
    invoke-static {p0}, Ll/bnl0;->w(F)I

    .line 55
    .line 56
    .line 57
    move-result v7

    .line 58
    invoke-static {p0}, Ll/bnl0;->w(F)I

    .line 59
    .line 60
    .line 61
    move-result v8

    .line 62
    invoke-static {}, Ll/irn;->a()Z

    .line 63
    .line 64
    .line 65
    move-result v11

    .line 66
    const/4 v12, 0x0

    .line 67
    const-string v4, "context_single_room"

    .line 68
    .line 69
    const/4 v9, 0x0

    .line 70
    const/4 v10, 0x0

    .line 71
    invoke-static/range {v4 .. v12}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetCpLimitItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetCpLimitItemView;->d:Landroid/widget/TextView;

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->zh:I

    .line 15
    .line 16
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ":"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
