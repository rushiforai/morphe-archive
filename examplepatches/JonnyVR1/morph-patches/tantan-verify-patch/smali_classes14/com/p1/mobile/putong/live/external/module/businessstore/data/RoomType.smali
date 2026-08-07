.class public final enum Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;

.field public static final enum nearby:Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;

.field public static final enum suggest:Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;


# instance fields
.field private name:Ljava/lang/String;

.field private searchKey:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;->suggest:Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;->nearby:Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;

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
    new-instance v0, Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "\u63a8\u8350"

    .line 5
    .line 6
    const-string v3, "suggest"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2, v3}, Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;->suggest:Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "\u9644\u8fd1"

    .line 17
    .line 18
    const-string v3, "nearby"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2, v3}, Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;->nearby:Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;->$values()[Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;->$VALUES:[Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;

    .line 30
    .line 31
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;->name:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p4, p0, Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;->searchKey:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;->$VALUES:[Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/live/external/module/businessstore/data/RoomType;

    .line 8
    .line 9
    return-object v0
.end method
