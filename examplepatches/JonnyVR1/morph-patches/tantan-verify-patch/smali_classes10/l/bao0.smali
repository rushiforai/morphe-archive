.class public Ll/bao0;
.super Ll/w9o0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/w9o0<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDynamicItemView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w9o0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public L(Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDynamicItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/w9o0;->J(Landroid/widget/RelativeLayout;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/w9o0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;->icon:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/w9o0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;->icon:Ljava/util/List;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDynamicItemView;->setImageUrl(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->P9:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDynamicItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bao0;->L(Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDynamicItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
