.class public final Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;
.super Lcom/squareup/wire/Message;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ShapeStyle"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$ProtoAdapter_ShapeStyle;,
        Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;,
        Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;,
        Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;,
        Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message<",
        "Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;",
        "Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;",
        ">;"
    }
.end annotation


# static fields
.field public static final ADAPTER:Lcom/squareup/wire/ProtoAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/wire/ProtoAdapter<",
            "Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEFAULT_LINECAP:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

.field public static final DEFAULT_LINEDASHI:Ljava/lang/Float;

.field public static final DEFAULT_LINEDASHII:Ljava/lang/Float;

.field public static final DEFAULT_LINEDASHIII:Ljava/lang/Float;

.field public static final DEFAULT_LINEJOIN:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

.field public static final DEFAULT_MITERLIMIT:Ljava/lang/Float;

.field public static final DEFAULT_STROKEWIDTH:Ljava/lang/Float;

.field private static final serialVersionUID:J


# instance fields
.field public final fill:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.opensource.svgaplayer.proto.ShapeEntity$ShapeStyle$RGBAColor#ADAPTER"
        tag = 0x1
    .end annotation
.end field

.field public final lineCap:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.opensource.svgaplayer.proto.ShapeEntity$ShapeStyle$LineCap#ADAPTER"
        tag = 0x4
    .end annotation
.end field

.field public final lineDashI:Ljava/lang/Float;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.squareup.wire.ProtoAdapter#FLOAT"
        tag = 0x7
    .end annotation
.end field

.field public final lineDashII:Ljava/lang/Float;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.squareup.wire.ProtoAdapter#FLOAT"
        tag = 0x8
    .end annotation
.end field

.field public final lineDashIII:Ljava/lang/Float;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.squareup.wire.ProtoAdapter#FLOAT"
        tag = 0x9
    .end annotation
.end field

.field public final lineJoin:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.opensource.svgaplayer.proto.ShapeEntity$ShapeStyle$LineJoin#ADAPTER"
        tag = 0x5
    .end annotation
.end field

.field public final miterLimit:Ljava/lang/Float;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.squareup.wire.ProtoAdapter#FLOAT"
        tag = 0x6
    .end annotation
.end field

.field public final stroke:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.opensource.svgaplayer.proto.ShapeEntity$ShapeStyle$RGBAColor#ADAPTER"
        tag = 0x2
    .end annotation
.end field

.field public final strokeWidth:Ljava/lang/Float;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.squareup.wire.ProtoAdapter#FLOAT"
        tag = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$ProtoAdapter_ShapeStyle;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$ProtoAdapter_ShapeStyle;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->DEFAULT_STROKEWIDTH:Ljava/lang/Float;

    .line 14
    .line 15
    sget-object v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;->LineCap_BUTT:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 16
    .line 17
    sput-object v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->DEFAULT_LINECAP:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 18
    .line 19
    sget-object v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;->LineJoin_MITER:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 20
    .line 21
    sput-object v1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->DEFAULT_LINEJOIN:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 22
    .line 23
    sput-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->DEFAULT_MITERLIMIT:Ljava/lang/Float;

    .line 24
    .line 25
    sput-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->DEFAULT_LINEDASHI:Ljava/lang/Float;

    .line 26
    .line 27
    sput-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->DEFAULT_LINEDASHII:Ljava/lang/Float;

    .line 28
    .line 29
    sput-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->DEFAULT_LINEDASHIII:Ljava/lang/Float;

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;Ljava/lang/Float;Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;)V
    .locals 11

    .line 25
    sget-object v10, Lokio/ByteString;->EMPTY:Lokio/ByteString;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    invoke-direct/range {v0 .. v10}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;-><init>(Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;Ljava/lang/Float;Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Lokio/ByteString;)V

    return-void
.end method

.method public constructor <init>(Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;Ljava/lang/Float;Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Lokio/ByteString;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 2
    .line 3
    invoke-direct {p0, v0, p10}, Lcom/squareup/wire/Message;-><init>(Lcom/squareup/wire/ProtoAdapter;Lokio/ByteString;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->fill:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->stroke:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 9
    .line 10
    iput-object p3, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->strokeWidth:Ljava/lang/Float;

    .line 11
    .line 12
    iput-object p4, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineCap:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 13
    .line 14
    iput-object p5, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineJoin:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 15
    .line 16
    iput-object p6, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->miterLimit:Ljava/lang/Float;

    .line 17
    .line 18
    iput-object p7, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashI:Ljava/lang/Float;

    .line 19
    .line 20
    iput-object p8, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashII:Ljava/lang/Float;

    .line 21
    .line 22
    iput-object p9, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashIII:Ljava/lang/Float;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p1}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v1, v3}, Lokio/ByteString;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->fill:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 28
    .line 29
    iget-object v3, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->fill:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 30
    .line 31
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->stroke:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 38
    .line 39
    iget-object v3, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->stroke:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 40
    .line 41
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->strokeWidth:Ljava/lang/Float;

    .line 48
    .line 49
    iget-object v3, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->strokeWidth:Ljava/lang/Float;

    .line 50
    .line 51
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineCap:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 58
    .line 59
    iget-object v3, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineCap:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 60
    .line 61
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineJoin:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineJoin:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 70
    .line 71
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->miterLimit:Ljava/lang/Float;

    .line 78
    .line 79
    iget-object v3, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->miterLimit:Ljava/lang/Float;

    .line 80
    .line 81
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_2

    .line 86
    .line 87
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashI:Ljava/lang/Float;

    .line 88
    .line 89
    iget-object v3, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashI:Ljava/lang/Float;

    .line 90
    .line 91
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_2

    .line 96
    .line 97
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashII:Ljava/lang/Float;

    .line 98
    .line 99
    iget-object v3, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashII:Ljava/lang/Float;

    .line 100
    .line 101
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_2

    .line 106
    .line 107
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashIII:Ljava/lang/Float;

    .line 108
    .line 109
    iget-object p1, p1, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashIII:Ljava/lang/Float;

    .line 110
    .line 111
    invoke-static {p0, p1}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    if-eqz p0, :cond_2

    .line 116
    .line 117
    return v0

    .line 118
    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/squareup/wire/Message;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_9

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lokio/ByteString;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    mul-int/lit8 v0, v0, 0x25

    .line 14
    .line 15
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->fill:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;->hashCode()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v1, v2

    .line 26
    :goto_0
    add-int/2addr v0, v1

    .line 27
    mul-int/lit8 v0, v0, 0x25

    .line 28
    .line 29
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->stroke:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;->hashCode()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move v1, v2

    .line 39
    :goto_1
    add-int/2addr v0, v1

    .line 40
    mul-int/lit8 v0, v0, 0x25

    .line 41
    .line 42
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->strokeWidth:Ljava/lang/Float;

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/Float;->hashCode()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    goto :goto_2

    .line 51
    :cond_2
    move v1, v2

    .line 52
    :goto_2
    add-int/2addr v0, v1

    .line 53
    mul-int/lit8 v0, v0, 0x25

    .line 54
    .line 55
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineCap:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 56
    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    goto :goto_3

    .line 64
    :cond_3
    move v1, v2

    .line 65
    :goto_3
    add-int/2addr v0, v1

    .line 66
    mul-int/lit8 v0, v0, 0x25

    .line 67
    .line 68
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineJoin:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 69
    .line 70
    if-eqz v1, :cond_4

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    goto :goto_4

    .line 77
    :cond_4
    move v1, v2

    .line 78
    :goto_4
    add-int/2addr v0, v1

    .line 79
    mul-int/lit8 v0, v0, 0x25

    .line 80
    .line 81
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->miterLimit:Ljava/lang/Float;

    .line 82
    .line 83
    if-eqz v1, :cond_5

    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/lang/Float;->hashCode()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    goto :goto_5

    .line 90
    :cond_5
    move v1, v2

    .line 91
    :goto_5
    add-int/2addr v0, v1

    .line 92
    mul-int/lit8 v0, v0, 0x25

    .line 93
    .line 94
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashI:Ljava/lang/Float;

    .line 95
    .line 96
    if-eqz v1, :cond_6

    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/Float;->hashCode()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    goto :goto_6

    .line 103
    :cond_6
    move v1, v2

    .line 104
    :goto_6
    add-int/2addr v0, v1

    .line 105
    mul-int/lit8 v0, v0, 0x25

    .line 106
    .line 107
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashII:Ljava/lang/Float;

    .line 108
    .line 109
    if-eqz v1, :cond_7

    .line 110
    .line 111
    invoke-virtual {v1}, Ljava/lang/Float;->hashCode()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    goto :goto_7

    .line 116
    :cond_7
    move v1, v2

    .line 117
    :goto_7
    add-int/2addr v0, v1

    .line 118
    mul-int/lit8 v0, v0, 0x25

    .line 119
    .line 120
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashIII:Ljava/lang/Float;

    .line 121
    .line 122
    if-eqz v1, :cond_8

    .line 123
    .line 124
    invoke-virtual {v1}, Ljava/lang/Float;->hashCode()I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    :cond_8
    add-int/2addr v0, v2

    .line 129
    iput v0, p0, Lcom/squareup/wire/Message;->hashCode:I

    .line 130
    .line 131
    :cond_9
    return v0
.end method

.method public newBuilder()Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->fill:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->fill:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->stroke:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->stroke:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->strokeWidth:Ljava/lang/Float;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->strokeWidth:Ljava/lang/Float;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineCap:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineCap:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineJoin:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineJoin:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->miterLimit:Ljava/lang/Float;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->miterLimit:Ljava/lang/Float;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashI:Ljava/lang/Float;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineDashI:Ljava/lang/Float;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashII:Ljava/lang/Float;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineDashII:Ljava/lang/Float;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashIII:Ljava/lang/Float;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineDashIII:Ljava/lang/Float;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Lcom/squareup/wire/Message$Builder;->addUnknownFields(Lokio/ByteString;)Lcom/squareup/wire/Message$Builder;

    .line 47
    .line 48
    .line 49
    return-object v0
.end method

.method public bridge synthetic newBuilder()Lcom/squareup/wire/Message$Builder;
    .locals 0

    .line 50
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->newBuilder()Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->fill:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const-string v1, ", fill="

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->fill:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->stroke:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    const-string v1, ", stroke="

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->stroke:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->strokeWidth:Ljava/lang/Float;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    const-string v1, ", strokeWidth="

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->strokeWidth:Ljava/lang/Float;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    :cond_2
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineCap:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    const-string v1, ", lineCap="

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineCap:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    :cond_3
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineJoin:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    const-string v1, ", lineJoin="

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineJoin:Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    :cond_4
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->miterLimit:Ljava/lang/Float;

    .line 77
    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    const-string v1, ", miterLimit="

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->miterLimit:Ljava/lang/Float;

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    :cond_5
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashI:Ljava/lang/Float;

    .line 91
    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    const-string v1, ", lineDashI="

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashI:Ljava/lang/Float;

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    :cond_6
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashII:Ljava/lang/Float;

    .line 105
    .line 106
    if-eqz v1, :cond_7

    .line 107
    .line 108
    const-string v1, ", lineDashII="

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashII:Ljava/lang/Float;

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    :cond_7
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashIII:Ljava/lang/Float;

    .line 119
    .line 120
    if-eqz v1, :cond_8

    .line 121
    .line 122
    const-string v1, ", lineDashIII="

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeStyle;->lineDashIII:Ljava/lang/Float;

    .line 128
    .line 129
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    :cond_8
    const/4 p0, 0x2

    .line 133
    const-string v1, "ShapeStyle{"

    .line 134
    .line 135
    const/4 v2, 0x0

    .line 136
    invoke-virtual {v0, v2, p0, v1}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    const/16 v0, 0x7d

    .line 141
    .line 142
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    return-object p0
.end method
