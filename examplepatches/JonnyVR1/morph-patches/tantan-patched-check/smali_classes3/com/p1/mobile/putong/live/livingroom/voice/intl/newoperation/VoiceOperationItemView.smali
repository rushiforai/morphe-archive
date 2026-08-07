.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceOperationItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Ll/qdo0;


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

.method public static synthetic a(Ll/qdo0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qdo0;->b4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gfo0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceOperationItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;Ll/qdo0;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceOperationItemView;->b:Ll/qdo0;

    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->entranceImage:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceOperationItemView;->a:Lv/VDraweeView;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->entranceImage:Ljava/lang/String;

    .line 17
    .line 18
    const-string v2, "context_single_room"

    .line 19
    .line 20
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceOperationItemView;->a:Lv/VDraweeView;

    .line 24
    .line 25
    new-instance v0, Ll/ffo0;

    .line 26
    .line 27
    invoke-direct {v0, p2, p1}, Ll/ffo0;-><init>(Ll/qdo0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceOperationItemView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
