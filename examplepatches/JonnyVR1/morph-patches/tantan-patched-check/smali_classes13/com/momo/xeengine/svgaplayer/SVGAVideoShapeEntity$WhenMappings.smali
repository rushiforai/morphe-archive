.class public final synthetic Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$WhenMappings;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0xf
    }
.end annotation


# static fields
.field public static final synthetic $EnumSwitchMapping$0:[I

.field public static final synthetic $EnumSwitchMapping$1:[I

.field public static final synthetic $EnumSwitchMapping$2:[I


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 6

    invoke-static {}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->values()[Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$WhenMappings;->$EnumSwitchMapping$0:[I

    sget-object v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->SHAPE:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1

    sget-object v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->RECT:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v3, 0x2

    aput v3, v0, v1

    sget-object v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->ELLIPSE:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v4, 0x3

    aput v4, v0, v1

    sget-object v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;->KEEP:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v5, 0x4

    aput v5, v0, v1

    invoke-static {}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;->values()[Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$WhenMappings;->$EnumSwitchMapping$1:[I

    sget-object v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;->LineCap_BUTT:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aput v2, v0, v1

    sget-object v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;->LineCap_ROUND:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aput v3, v0, v1

    sget-object v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;->LineCap_SQUARE:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aput v4, v0, v1

    invoke-static {}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->values()[Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/momo/xeengine/svgaplayer/SVGAVideoShapeEntity$WhenMappings;->$EnumSwitchMapping$2:[I

    sget-object v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->LineJoin_BEVEL:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aput v2, v0, v1

    sget-object v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->LineJoin_MITER:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aput v3, v0, v1

    sget-object v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->LineJoin_ROUND:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aput v4, v0, v1

    return-void
.end method
