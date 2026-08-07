.class public final enum Lcom/ss/bytertc/engine/type/RoomEvent;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/type/RoomEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/type/RoomEvent;

.field public static final enum FORBIDDEN:Lcom/ss/bytertc/engine/type/RoomEvent;

.field public static final enum USER_NOTIFY_STOP:Lcom/ss/bytertc/engine/type/RoomEvent;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/type/RoomEvent;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/16 v2, -0x7dd

    .line 5
    .line 6
    const-string v3, "USER_NOTIFY_STOP"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/ss/bytertc/engine/type/RoomEvent;-><init>(Ljava/lang/String;II)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/ss/bytertc/engine/type/RoomEvent;->USER_NOTIFY_STOP:Lcom/ss/bytertc/engine/type/RoomEvent;

    .line 12
    .line 13
    new-instance v1, Lcom/ss/bytertc/engine/type/RoomEvent;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const/16 v3, -0x7dc

    .line 17
    .line 18
    const-string v4, "FORBIDDEN"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v3}, Lcom/ss/bytertc/engine/type/RoomEvent;-><init>(Ljava/lang/String;II)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/ss/bytertc/engine/type/RoomEvent;->FORBIDDEN:Lcom/ss/bytertc/engine/type/RoomEvent;

    .line 24
    .line 25
    filled-new-array {v0, v1}, [Lcom/ss/bytertc/engine/type/RoomEvent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Lcom/ss/bytertc/engine/type/RoomEvent;->$VALUES:[Lcom/ss/bytertc/engine/type/RoomEvent;

    .line 30
    .line 31
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/ss/bytertc/engine/type/RoomEvent;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(I)Lcom/ss/bytertc/engine/type/RoomEvent;
    .locals 1

    .line 1
    const/16 v0, -0x7dd

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, -0x7dc

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomEvent;->FORBIDDEN:Lcom/ss/bytertc/engine/type/RoomEvent;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_1
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomEvent;->USER_NOTIFY_STOP:Lcom/ss/bytertc/engine/type/RoomEvent;

    .line 15
    .line 16
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/type/RoomEvent;
    .locals 1

    .line 17
    const-class v0, Lcom/ss/bytertc/engine/type/RoomEvent;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/ss/bytertc/engine/type/RoomEvent;

    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/type/RoomEvent;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/type/RoomEvent;->$VALUES:[Lcom/ss/bytertc/engine/type/RoomEvent;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/type/RoomEvent;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/type/RoomEvent;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/type/RoomEvent;->value:I

    .line 2
    .line 3
    return p0
.end method
