.class public Ll/cap;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/chat/emoji/IntlEmojiRandomView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cap;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/chat/emoji/IntlEmojiRandomView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cap;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/chat/emoji/IntlEmojiRandomView;->P(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->s2:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/chat/emoji/IntlEmojiRandomView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cap;->H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/chat/emoji/IntlEmojiRandomView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
