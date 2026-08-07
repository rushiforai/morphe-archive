.class public final enum Lrtc/volc/type/RoomMode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lrtc/volc/type/RoomMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lrtc/volc/type/RoomMode;

.field public static final enum CHAT_ROOM:Lrtc/volc/type/RoomMode;

.field public static final enum KTV:Lrtc/volc/type/RoomMode;


# instance fields
.field private value:I


# direct methods
.method private static synthetic $values()[Lrtc/volc/type/RoomMode;
    .locals 2

    .line 1
    sget-object v0, Lrtc/volc/type/RoomMode;->CHAT_ROOM:Lrtc/volc/type/RoomMode;

    .line 2
    .line 3
    sget-object v1, Lrtc/volc/type/RoomMode;->KTV:Lrtc/volc/type/RoomMode;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lrtc/volc/type/RoomMode;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lrtc/volc/type/RoomMode;

    .line 2
    .line 3
    const-string v1, "CHAT_ROOM"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lrtc/volc/type/RoomMode;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lrtc/volc/type/RoomMode;->CHAT_ROOM:Lrtc/volc/type/RoomMode;

    .line 11
    .line 12
    new-instance v0, Lrtc/volc/type/RoomMode;

    .line 13
    .line 14
    const-string v1, "KTV"

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    invoke-direct {v0, v1, v3, v2}, Lrtc/volc/type/RoomMode;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lrtc/volc/type/RoomMode;->KTV:Lrtc/volc/type/RoomMode;

    .line 21
    .line 22
    invoke-static {}, Lrtc/volc/type/RoomMode;->$values()[Lrtc/volc/type/RoomMode;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Lrtc/volc/type/RoomMode;->$VALUES:[Lrtc/volc/type/RoomMode;

    .line 27
    .line 28
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
    iput p3, p0, Lrtc/volc/type/RoomMode;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lrtc/volc/type/RoomMode;
    .locals 5

    .line 1
    invoke-static {}, Lrtc/volc/type/RoomMode;->values()[Lrtc/volc/type/RoomMode;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    invoke-virtual {v3}, Lrtc/volc/type/RoomMode;->value()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-ne v4, p0, :cond_0

    .line 16
    .line 17
    return-object v3

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lrtc/volc/type/RoomMode;
    .locals 1

    .line 1
    const-class v0, Lrtc/volc/type/RoomMode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lrtc/volc/type/RoomMode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lrtc/volc/type/RoomMode;
    .locals 1

    .line 1
    sget-object v0, Lrtc/volc/type/RoomMode;->$VALUES:[Lrtc/volc/type/RoomMode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lrtc/volc/type/RoomMode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lrtc/volc/type/RoomMode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lrtc/volc/type/RoomMode;->value:I

    .line 2
    .line 3
    return p0
.end method
