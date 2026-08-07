.class public final enum Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lcom/squareup/wire/WireEnum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ShapeType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;",
        ">;",
        "Lcom/squareup/wire/WireEnum;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

.field public static final ADAPTER:Lcom/squareup/wire/ProtoAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/wire/ProtoAdapter<",
            "Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum ELLIPSE:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

.field public static final enum KEEP:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

.field public static final enum RECT:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

.field public static final enum SHAPE:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 2
    .line 3
    const-string v1, "SHAPE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->SHAPE:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 10
    .line 11
    new-instance v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 12
    .line 13
    const-string v2, "RECT"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->RECT:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 20
    .line 21
    new-instance v2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 22
    .line 23
    const-string v3, "ELLIPSE"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->ELLIPSE:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 30
    .line 31
    new-instance v3, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 32
    .line 33
    const-string v4, "KEEP"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->KEEP:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 40
    .line 41
    filled-new-array {v0, v1, v2, v3}, [Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->$VALUES:[Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 46
    .line 47
    const-class v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/squareup/wire/ProtoAdapter;->newEnumAdapter(Ljava/lang/Class;)Lcom/squareup/wire/RuntimeEnumAdapter;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sput-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 54
    .line 55
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
    iput p3, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromValue(I)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;
    .locals 1

    .line 1
    if-eqz p0, :cond_3

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p0, v0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->KEEP:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    sget-object p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->ELLIPSE:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_2
    sget-object p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->RECT:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_3
    sget-object p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->SHAPE:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 24
    .line 25
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->$VALUES:[Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->value:I

    .line 2
    .line 3
    return p0
.end method
