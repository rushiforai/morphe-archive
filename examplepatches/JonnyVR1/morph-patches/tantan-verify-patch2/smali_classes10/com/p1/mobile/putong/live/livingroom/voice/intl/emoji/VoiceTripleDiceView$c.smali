.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView$c;
.super Ll/wo0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;->f(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;Ljava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView$c;->b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView$c;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/wo0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wo0;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView$c;->b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView$c;->b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;->f:Lv/VDraweeView;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView$c;->b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;->f:Lv/VDraweeView;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView$c;->a:Ljava/util/List;

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getContentPic()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v1, "context_livingAct"

    .line 38
    .line 39
    invoke-static {v1, v0, p0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
