.class public Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView$a;
.super Ll/wo0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->p(Ljava/util/List;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView$a;->c:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView$a;->a:Ljava/util/List;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/wo0;-><init>()V

    .line 8
    .line 9
    .line 10
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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView$a;->a:Ljava/util/List;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getContentPic()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView$a;->c:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView$a;->a:Ljava/util/List;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView$a;->b:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->d(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;Ljava/util/List;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method
