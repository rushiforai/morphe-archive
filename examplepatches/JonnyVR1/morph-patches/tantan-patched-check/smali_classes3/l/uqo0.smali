.class public Ll/uqo0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

.field public b:Lcom/p1/mobile/putong/data/User;

.field public c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uqo0;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->EMPTY:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Ll/uqo0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 7
    .line 8
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->EMPTY_ROOM:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Ll/uqo0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 7
    .line 8
    return-void
.end method
