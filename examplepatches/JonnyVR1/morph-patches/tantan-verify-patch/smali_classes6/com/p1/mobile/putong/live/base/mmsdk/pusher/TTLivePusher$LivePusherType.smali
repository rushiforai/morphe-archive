.class public final enum Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LivePusherType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;

.field public static final enum NEW_MOMO:Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;->NEW_MOMO:Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;

    .line 2
    .line 3
    filled-new-array {v0}, [Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;

    .line 2
    .line 3
    const-string v1, "NEW_MOMO"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;->NEW_MOMO:Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;->$values()[Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;->$VALUES:[Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;

    .line 16
    .line 17
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;->$VALUES:[Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;

    .line 8
    .line 9
    return-object v0
.end method
