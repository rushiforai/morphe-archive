.class public final enum Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MomoPushType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

.field public static final enum RTC:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

.field public static final enum RTMP:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;->RTMP:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;->RTC:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 2
    .line 3
    const-string v1, "RTMP"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;->RTMP:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 12
    .line 13
    const-string v1, "RTC"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;->RTC:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;->$values()[Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;->$VALUES:[Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 26
    .line 27
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

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;->$VALUES:[Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 8
    .line 9
    return-object v0
.end method
