# Test-only queue dependency. Never bundled into the application.
.class public Lcom/bedrockstreaming/feature/player/domain/mediaplayer/usecase/AddReplayQueueItemUseCase;
.super Ljava/lang/Object;
.field public static calls:I
.field public static media:Ljava/lang/Object;
.field public static continuation:Ljava/lang/Object;
.field public static suspend:Z
.method public a(LZe/c;Lmf/d;LR7/g;Lcom/bedrockstreaming/component/layout/domain/core/model/MediaItem;Ljava/lang/String;Ljava/lang/String;Lbv/c;)Ljava/lang/Object;
.locals 1
sget v0, Lcom/bedrockstreaming/feature/player/domain/mediaplayer/usecase/AddReplayQueueItemUseCase;->calls:I
add-int/lit8 v0, v0, 0x1
sput v0, Lcom/bedrockstreaming/feature/player/domain/mediaplayer/usecase/AddReplayQueueItemUseCase;->calls:I
sput-object p4, Lcom/bedrockstreaming/feature/player/domain/mediaplayer/usecase/AddReplayQueueItemUseCase;->media:Ljava/lang/Object;
sput-object p7, Lcom/bedrockstreaming/feature/player/domain/mediaplayer/usecase/AddReplayQueueItemUseCase;->continuation:Ljava/lang/Object;
const/4 v0, 0x0
invoke-virtual {p2, v0}, Lmf/d;->a(Lnf/g;)V
sget-boolean v0, Lcom/bedrockstreaming/feature/player/domain/mediaplayer/usecase/AddReplayQueueItemUseCase;->suspend:Z
if-eqz v0, :complete
sget-object v0, Lav/a;->N:Lav/a;
return-object v0
:complete
sget-object v0, LVu/M;->a:LVu/M;
return-object v0
.end method
