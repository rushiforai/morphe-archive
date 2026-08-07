.class public final enum Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lcom/squareup/wire/WireEnum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LineJoin"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;",
        ">;",
        "Lcom/squareup/wire/WireEnum;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

.field public static final ADAPTER:Lcom/squareup/wire/ProtoAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/wire/ProtoAdapter<",
            "Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum LineJoin_BEVEL:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

.field public static final enum LineJoin_MITER:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

.field public static final enum LineJoin_ROUND:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 2
    .line 3
    const-string v1, "LineJoin_MITER"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->LineJoin_MITER:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 10
    .line 11
    new-instance v1, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 12
    .line 13
    const-string v2, "LineJoin_ROUND"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->LineJoin_ROUND:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 20
    .line 21
    new-instance v2, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 22
    .line 23
    const-string v3, "LineJoin_BEVEL"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->LineJoin_BEVEL:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 30
    .line 31
    filled-new-array {v0, v1, v2}, [Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->$VALUES:[Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 36
    .line 37
    const-class v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/squareup/wire/ProtoAdapter;->newEnumAdapter(Ljava/lang/Class;)Lcom/squareup/wire/RuntimeEnumAdapter;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sput-object v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 44
    .line 45
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
    iput p3, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromValue(I)Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;
    .locals 1

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    sget-object p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->LineJoin_BEVEL:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_1
    sget-object p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->LineJoin_ROUND:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_2
    sget-object p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->LineJoin_MITER:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 18
    .line 19
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;
    .locals 1

    .line 1
    const-class v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->$VALUES:[Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->value:I

    .line 2
    .line 3
    return p0
.end method
