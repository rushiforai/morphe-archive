.class public Ll/hao0;
.super Ll/w9o0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/w9o0<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiItemView;",
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
.method public L(Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiItemView;)V
    .locals 2

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
    iget-object v0, p0, Ll/w9o0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;->icon:Ljava/util/List;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiItemView;->setImageUrl(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Ll/w9o0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;->name:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    iget-object p0, p0, Ll/w9o0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;->name:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiItemView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->R9:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hao0;->L(Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
