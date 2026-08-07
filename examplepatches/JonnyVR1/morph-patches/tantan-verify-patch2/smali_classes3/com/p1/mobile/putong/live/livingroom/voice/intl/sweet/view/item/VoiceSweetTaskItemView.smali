.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VText;

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
    invoke-static {p0, p1}, Ll/l2p0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;->taskIcon:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "context_single_room"

    .line 6
    .line 7
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;->b:Lv/VText;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;->taskName:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;->c:Lv/VText;

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;->taskAwardDescribe:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;->d:Lv/VText;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;->taskButtonName:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;->d:Lv/VText;

    .line 32
    .line 33
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;->taskCpStatus:I

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    if-eq p1, v0, :cond_0

    .line 37
    .line 38
    const/4 v1, 0x3

    .line 39
    if-eq p1, v1, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 v0, 0x0

    .line 43
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTaskItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
