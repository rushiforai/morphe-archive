.class public Lcom/bedrockstreaming/feature/player/domain/queue/item/NavigationRequestQueueItem$Factory;
.super Ljava/lang/Object;
.field public static calls:I
.field public static target:Ljava/lang/Object;
.method public a(Lcom/bedrockstreaming/component/layout/domain/core/model/Target;)Lcom/bedrockstreaming/feature/player/domain/queue/item/NavigationRequestQueueItem;
.locals 1
sget v0, Lcom/bedrockstreaming/feature/player/domain/queue/item/NavigationRequestQueueItem$Factory;->calls:I
add-int/lit8 v0, v0, 0x1
sput v0, Lcom/bedrockstreaming/feature/player/domain/queue/item/NavigationRequestQueueItem$Factory;->calls:I
sput-object p1, Lcom/bedrockstreaming/feature/player/domain/queue/item/NavigationRequestQueueItem$Factory;->target:Ljava/lang/Object;
const/4 v0, 0x0
return-object v0
.end method
