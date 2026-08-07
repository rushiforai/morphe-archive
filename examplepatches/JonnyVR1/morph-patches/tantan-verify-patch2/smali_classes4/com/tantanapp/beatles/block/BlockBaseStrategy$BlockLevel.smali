.class final enum Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/block/BlockBaseStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BlockLevel"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

.field public static final enum HIGH:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

.field public static final enum LOW:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

.field public static final enum ORIGIN:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;


# instance fields
.field index:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 2
    .line 3
    const-string v1, "HIGH"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->HIGH:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 11
    .line 12
    new-instance v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 13
    .line 14
    const-string v4, "LOW"

    .line 15
    .line 16
    invoke-direct {v1, v4, v3, v2}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->LOW:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 20
    .line 21
    new-instance v2, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 22
    .line 23
    const/4 v3, 0x2

    .line 24
    const/4 v4, -0x1

    .line 25
    const-string v5, "ORIGIN"

    .line 26
    .line 27
    invoke-direct {v2, v5, v3, v4}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->ORIGIN:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 31
    .line 32
    filled-new-array {v0, v1, v2}, [Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sput-object v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->$VALUES:[Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 37
    .line 38
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
    iput p3, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->index:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;
    .locals 1

    .line 1
    const-class v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->$VALUES:[Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 8
    .line 9
    return-object v0
.end method
