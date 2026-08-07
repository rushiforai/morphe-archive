.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Landroid/widget/ImageView;

.field public c:Lv/VText;

.field public d:Lv/VMarqueeText;

.field public e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, -0x1

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;->u()V

    return-void
.end method


# virtual methods
.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;->s(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final s(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/y3n0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final u()V
    .locals 3

    .line 1
    invoke-static {}, Ll/i9n;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    const/4 v1, 0x0

    .line 12
    const-string v2, "https://auto.tancdn.com/v1/raw/a17b6437-a1fc-4363-941a-797e8f0a827e14.svga"

    .line 13
    .line 14
    invoke-virtual {p0, v2, v0, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;->c:Lv/VText;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;->memberNum:I

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;->c:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v0, Ll/x3n0;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/x3n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;)V

    .line 26
    .line 27
    .line 28
    const-wide/16 v1, 0x1c2

    .line 29
    .line 30
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
