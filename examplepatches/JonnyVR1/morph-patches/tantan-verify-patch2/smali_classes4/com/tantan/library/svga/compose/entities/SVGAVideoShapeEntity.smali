.class public final Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;,
        Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$WhenMappings;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000V\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\'B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0006\u0010\u001c\u001a\u00020\u001dJ\u0010\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020!H\u0002J\u0010\u0010\"\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020!H\u0002J\u0010\u0010#\u001a\u00020\u001d2\u0006\u0010\u0002\u001a\u00020\u0003H\u0002J\u0010\u0010$\u001a\u00020\u001d2\u0006\u0010\u0002\u001a\u00020\u0003H\u0002J\u0010\u0010%\u001a\u00020\u001d2\u0006\u0010\u0002\u001a\u00020\u0003H\u0002J\u0010\u0010&\u001a\u00020\u001d2\u0006\u0010\u0002\u001a\u00020\u0003H\u0002R\u001a\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00010\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0008\u001a\u00020\t8F\u00a2\u0006\u0006\u001a\u0004\u0008\u0008\u0010\nR\"\u0010\r\u001a\u0004\u0018\u00010\u000c2\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u000c@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u001c\u0010\u0010\u001a\u0004\u0018\u00010\u0011X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013\"\u0004\u0008\u0014\u0010\u0015R\"\u0010\u0017\u001a\u0004\u0018\u00010\u00162\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u0016@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0018\u0010\u0019R\u000e\u0010\u001a\u001a\u00020\u001bX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006("
    }
    d2 = {
        "Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;",
        "",
        "obj",
        "Lcom/tantan/library/svga/compose/proto/ShapeEntity;",
        "(Lcom/tantan/library/svga/compose/proto/ShapeEntity;)V",
        "args",
        "Ljava/util/HashMap;",
        "",
        "isKeep",
        "",
        "()Z",
        "<set-?>",
        "Lcom/tantan/library/svga/utils/FMatrix;",
        "matrix",
        "getMatrix",
        "()Lcom/tantan/library/svga/utils/FMatrix;",
        "shapePath",
        "Landroid/graphics/Path;",
        "getShapePath",
        "()Landroid/graphics/Path;",
        "setShapePath",
        "(Landroid/graphics/Path;)V",
        "Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;",
        "styles",
        "getStyles",
        "()Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;",
        "type",
        "Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;",
        "buildPath",
        "",
        "checkAlphaValueRange",
        "",
        "color",
        "Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;",
        "checkValueRange",
        "parseArgs",
        "parseStyles",
        "parseTransform",
        "parseType",
        "Styles",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field private final args:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private matrix:Lcom/tantan/library/svga/utils/FMatrix;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private shapePath:Landroid/graphics/Path;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private styles:Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private type:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/compose/proto/ShapeEntity;)V
    .locals 1
    .param p1    # Lcom/tantan/library/svga/compose/proto/ShapeEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;->SHAPE:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->type:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->parseType(Lcom/tantan/library/svga/compose/proto/ShapeEntity;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->parseArgs(Lcom/tantan/library/svga/compose/proto/ShapeEntity;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->parseStyles(Lcom/tantan/library/svga/compose/proto/ShapeEntity;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->parseTransform(Lcom/tantan/library/svga/compose/proto/ShapeEntity;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private final checkAlphaValueRange(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;)F
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;->a:Ljava/lang/Float;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/high16 p1, 0x3f800000    # 1.0f

    .line 11
    .line 12
    cmpg-float p0, p0, p1

    .line 13
    .line 14
    if-gtz p0, :cond_0

    .line 15
    .line 16
    const/high16 p0, 0x437f0000    # 255.0f

    .line 17
    .line 18
    return p0

    .line 19
    :cond_0
    return p1
.end method

.method private final checkValueRange(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;)F
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;->r:Ljava/lang/Float;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move p0, v0

    .line 12
    :goto_0
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;->g:Ljava/lang/Float;

    .line 13
    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    move v1, v0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    :goto_1
    add-float/2addr p0, v1

    .line 23
    iget-object p1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;->b:Ljava/lang/Float;

    .line 24
    .line 25
    if-nez p1, :cond_2

    .line 26
    .line 27
    goto :goto_2

    .line 28
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    :goto_2
    add-float/2addr p0, v0

    .line 33
    const/high16 p1, 0x40400000    # 3.0f

    .line 34
    .line 35
    cmpg-float p0, p0, p1

    .line 36
    .line 37
    if-gtz p0, :cond_3

    .line 38
    .line 39
    const/high16 p0, 0x437f0000    # 255.0f

    .line 40
    .line 41
    return p0

    .line 42
    :cond_3
    const/high16 p0, 0x3f800000    # 1.0f

    .line 43
    .line 44
    return p0
.end method

.method private final parseArgs(Lcom/tantan/library/svga/compose/proto/ShapeEntity;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->shape:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;->d:Ljava/lang/String;

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    const-string v0, ""

    .line 17
    .line 18
    :cond_0
    const-string v2, "d"

    .line 19
    .line 20
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v0, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->ellipse:Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;

    .line 24
    .line 25
    const-string v1, "y"

    .line 26
    .line 27
    const-string v2, "x"

    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    if-eqz v0, :cond_6

    .line 31
    .line 32
    iget-object v4, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 33
    .line 34
    iget-object v5, v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;->x:Ljava/lang/Float;

    .line 35
    .line 36
    if-nez v5, :cond_2

    .line 37
    .line 38
    move v5, v3

    .line 39
    goto :goto_0

    .line 40
    :cond_2
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    :goto_0
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-interface {v4, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    iget-object v4, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 52
    .line 53
    iget-object v5, v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;->y:Ljava/lang/Float;

    .line 54
    .line 55
    if-nez v5, :cond_3

    .line 56
    .line 57
    move v5, v3

    .line 58
    goto :goto_1

    .line 59
    :cond_3
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    :goto_1
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    invoke-interface {v4, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    iget-object v4, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 71
    .line 72
    iget-object v5, v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;->radiusX:Ljava/lang/Float;

    .line 73
    .line 74
    if-nez v5, :cond_4

    .line 75
    .line 76
    move v5, v3

    .line 77
    goto :goto_2

    .line 78
    :cond_4
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    :goto_2
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    const-string v6, "radiusX"

    .line 87
    .line 88
    invoke-interface {v4, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    iget-object v4, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 92
    .line 93
    iget-object v0, v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;->radiusY:Ljava/lang/Float;

    .line 94
    .line 95
    if-nez v0, :cond_5

    .line 96
    .line 97
    move v0, v3

    .line 98
    goto :goto_3

    .line 99
    :cond_5
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    :goto_3
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const-string v5, "radiusY"

    .line 108
    .line 109
    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    :cond_6
    iget-object p1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->rect:Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;

    .line 113
    .line 114
    if-eqz p1, :cond_c

    .line 115
    .line 116
    iget-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 117
    .line 118
    iget-object v4, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;->x:Ljava/lang/Float;

    .line 119
    .line 120
    if-nez v4, :cond_7

    .line 121
    .line 122
    move v4, v3

    .line 123
    goto :goto_4

    .line 124
    :cond_7
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    :goto_4
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 136
    .line 137
    iget-object v2, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;->y:Ljava/lang/Float;

    .line 138
    .line 139
    if-nez v2, :cond_8

    .line 140
    .line 141
    move v2, v3

    .line 142
    goto :goto_5

    .line 143
    :cond_8
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    :goto_5
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 155
    .line 156
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;->width:Ljava/lang/Float;

    .line 157
    .line 158
    if-nez v1, :cond_9

    .line 159
    .line 160
    move v1, v3

    .line 161
    goto :goto_6

    .line 162
    :cond_9
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    :goto_6
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    const-string v2, "width"

    .line 171
    .line 172
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 176
    .line 177
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;->height:Ljava/lang/Float;

    .line 178
    .line 179
    if-nez v1, :cond_a

    .line 180
    .line 181
    move v1, v3

    .line 182
    goto :goto_7

    .line 183
    :cond_a
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    :goto_7
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    const-string v2, "height"

    .line 192
    .line 193
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    iget-object p0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 197
    .line 198
    iget-object p1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;->cornerRadius:Ljava/lang/Float;

    .line 199
    .line 200
    if-nez p1, :cond_b

    .line 201
    .line 202
    goto :goto_8

    .line 203
    :cond_b
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 204
    .line 205
    .line 206
    move-result v3

    .line 207
    :goto_8
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    const-string v0, "cornerRadius"

    .line 212
    .line 213
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    :cond_c
    return-void
.end method

.method private final parseStyles(Lcom/tantan/library/svga/compose/proto/ShapeEntity;)V
    .locals 8

    .line 1
    iget-object p1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->styles:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;

    .line 2
    .line 3
    if-eqz p1, :cond_17

    .line 4
    .line 5
    new-instance v0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;->fill:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v1, :cond_4

    .line 14
    .line 15
    invoke-direct {p0, v1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->checkValueRange(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;)F

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-direct {p0, v1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->checkAlphaValueRange(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;)F

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    iget-object v5, v1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;->a:Ljava/lang/Float;

    .line 24
    .line 25
    if-eqz v5, :cond_0

    .line 26
    .line 27
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v5, v2

    .line 33
    :goto_0
    mul-float/2addr v5, v4

    .line 34
    float-to-int v4, v5

    .line 35
    iget-object v5, v1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;->r:Ljava/lang/Float;

    .line 36
    .line 37
    if-eqz v5, :cond_1

    .line 38
    .line 39
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    move v5, v2

    .line 45
    :goto_1
    mul-float/2addr v5, v3

    .line 46
    float-to-int v5, v5

    .line 47
    iget-object v6, v1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;->g:Ljava/lang/Float;

    .line 48
    .line 49
    if-eqz v6, :cond_2

    .line 50
    .line 51
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    goto :goto_2

    .line 56
    :cond_2
    move v6, v2

    .line 57
    :goto_2
    mul-float/2addr v6, v3

    .line 58
    float-to-int v6, v6

    .line 59
    iget-object v1, v1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;->b:Ljava/lang/Float;

    .line 60
    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    goto :goto_3

    .line 68
    :cond_3
    move v1, v2

    .line 69
    :goto_3
    mul-float/2addr v1, v3

    .line 70
    float-to-int v1, v1

    .line 71
    invoke-static {v4, v5, v6, v1}, Landroid/graphics/Color;->argb(IIII)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->setFill$svga_lib_release(I)V

    .line 76
    .line 77
    .line 78
    :cond_4
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;->stroke:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 79
    .line 80
    if-eqz v1, :cond_9

    .line 81
    .line 82
    invoke-direct {p0, v1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->checkValueRange(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;)F

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    invoke-direct {p0, v1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->checkAlphaValueRange(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;)F

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    iget-object v5, v1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;->a:Ljava/lang/Float;

    .line 91
    .line 92
    if-eqz v5, :cond_5

    .line 93
    .line 94
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    goto :goto_4

    .line 99
    :cond_5
    move v5, v2

    .line 100
    :goto_4
    mul-float/2addr v5, v4

    .line 101
    float-to-int v4, v5

    .line 102
    iget-object v5, v1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;->r:Ljava/lang/Float;

    .line 103
    .line 104
    if-eqz v5, :cond_6

    .line 105
    .line 106
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    goto :goto_5

    .line 111
    :cond_6
    move v5, v2

    .line 112
    :goto_5
    mul-float/2addr v5, v3

    .line 113
    float-to-int v5, v5

    .line 114
    iget-object v6, v1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;->g:Ljava/lang/Float;

    .line 115
    .line 116
    if-eqz v6, :cond_7

    .line 117
    .line 118
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    goto :goto_6

    .line 123
    :cond_7
    move v6, v2

    .line 124
    :goto_6
    mul-float/2addr v6, v3

    .line 125
    float-to-int v6, v6

    .line 126
    iget-object v1, v1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;->b:Ljava/lang/Float;

    .line 127
    .line 128
    if-eqz v1, :cond_8

    .line 129
    .line 130
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    goto :goto_7

    .line 135
    :cond_8
    move v1, v2

    .line 136
    :goto_7
    mul-float/2addr v1, v3

    .line 137
    float-to-int v1, v1

    .line 138
    invoke-static {v4, v5, v6, v1}, Landroid/graphics/Color;->argb(IIII)I

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->setStroke$svga_lib_release(I)V

    .line 143
    .line 144
    .line 145
    :cond_9
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;->strokeWidth:Ljava/lang/Float;

    .line 146
    .line 147
    if-nez v1, :cond_a

    .line 148
    .line 149
    move v1, v2

    .line 150
    goto :goto_8

    .line 151
    :cond_a
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    :goto_8
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->setStrokeWidth$svga_lib_release(F)V

    .line 156
    .line 157
    .line 158
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;->lineCap:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 159
    .line 160
    const-string v3, "round"

    .line 161
    .line 162
    const/4 v4, 0x3

    .line 163
    const/4 v5, 0x2

    .line 164
    const/4 v6, 0x1

    .line 165
    if-eqz v1, :cond_e

    .line 166
    .line 167
    sget-object v7, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$WhenMappings;->$EnumSwitchMapping$0:[I

    .line 168
    .line 169
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    aget v1, v7, v1

    .line 174
    .line 175
    if-eq v1, v6, :cond_d

    .line 176
    .line 177
    if-eq v1, v5, :cond_c

    .line 178
    .line 179
    if-eq v1, v4, :cond_b

    .line 180
    .line 181
    goto :goto_9

    .line 182
    :cond_b
    const-string v1, "square"

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->setLineCap$svga_lib_release(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    goto :goto_9

    .line 188
    :cond_c
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->setLineCap$svga_lib_release(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    goto :goto_9

    .line 192
    :cond_d
    const-string v1, "butt"

    .line 193
    .line 194
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->setLineCap$svga_lib_release(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    :cond_e
    :goto_9
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;->lineJoin:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 198
    .line 199
    if-eqz v1, :cond_12

    .line 200
    .line 201
    sget-object v7, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$WhenMappings;->$EnumSwitchMapping$1:[I

    .line 202
    .line 203
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    aget v1, v7, v1

    .line 208
    .line 209
    if-eq v1, v6, :cond_11

    .line 210
    .line 211
    if-eq v1, v5, :cond_10

    .line 212
    .line 213
    if-eq v1, v4, :cond_f

    .line 214
    .line 215
    goto :goto_a

    .line 216
    :cond_f
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->setLineJoin$svga_lib_release(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    goto :goto_a

    .line 220
    :cond_10
    const-string v1, "miter"

    .line 221
    .line 222
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->setLineJoin$svga_lib_release(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    goto :goto_a

    .line 226
    :cond_11
    const-string v1, "bevel"

    .line 227
    .line 228
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->setLineJoin$svga_lib_release(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    :cond_12
    :goto_a
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;->miterLimit:Ljava/lang/Float;

    .line 232
    .line 233
    if-eqz v1, :cond_13

    .line 234
    .line 235
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 236
    .line 237
    .line 238
    move-result v2

    .line 239
    :cond_13
    float-to-int v1, v2

    .line 240
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->setMiterLimit$svga_lib_release(I)V

    .line 241
    .line 242
    .line 243
    new-array v1, v4, [F

    .line 244
    .line 245
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->setLineDash$svga_lib_release([F)V

    .line 246
    .line 247
    .line 248
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;->lineDashI:Ljava/lang/Float;

    .line 249
    .line 250
    if-eqz v1, :cond_14

    .line 251
    .line 252
    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->getLineDash()[F

    .line 257
    .line 258
    .line 259
    move-result-object v2

    .line 260
    const/4 v3, 0x0

    .line 261
    aput v1, v2, v3

    .line 262
    .line 263
    :cond_14
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;->lineDashII:Ljava/lang/Float;

    .line 264
    .line 265
    if-eqz v1, :cond_15

    .line 266
    .line 267
    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    .line 268
    .line 269
    .line 270
    move-result v1

    .line 271
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->getLineDash()[F

    .line 272
    .line 273
    .line 274
    move-result-object v2

    .line 275
    aput v1, v2, v6

    .line 276
    .line 277
    :cond_15
    iget-object p1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;->lineDashIII:Ljava/lang/Float;

    .line 278
    .line 279
    if-eqz p1, :cond_16

    .line 280
    .line 281
    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;->getLineDash()[F

    .line 286
    .line 287
    .line 288
    move-result-object v1

    .line 289
    aput p1, v1, v5

    .line 290
    .line 291
    :cond_16
    iput-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->styles:Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;

    .line 292
    .line 293
    :cond_17
    return-void
.end method

.method private final parseTransform(Lcom/tantan/library/svga/compose/proto/ShapeEntity;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->transform:Lcom/tantan/library/svga/compose/proto/Transform;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tantan/library/svga/utils/FMatrix;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/tantan/library/svga/utils/FMatrix;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/utils/FMatrix;->transform$svga_lib_release(Lcom/tantan/library/svga/compose/proto/Transform;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->matrix:Lcom/tantan/library/svga/utils/FMatrix;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method private final parseType(Lcom/tantan/library/svga/compose/proto/ShapeEntity;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantan/library/svga/compose/proto/ShapeEntity;->type:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->type:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;

    .line 6
    .line 7
    :cond_0
    return-void
.end method


# virtual methods
.method public final buildPath()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->shapePath:Landroid/graphics/Path;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_7

    .line 6
    .line 7
    :cond_0
    invoke-static {}, Lcom/tantan/library/svga/compose/entities/SVGAShapeKt;->getSharedPath()Landroid/graphics/Path;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->type:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;

    .line 15
    .line 16
    sget-object v1, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$WhenMappings;->$EnumSwitchMapping$2:[I

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    aget v0, v1, v0

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    const/4 v2, 0x0

    .line 26
    if-eq v0, v1, :cond_15

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    const-string v3, "y"

    .line 30
    .line 31
    const-string v4, "x"

    .line 32
    .line 33
    if-eq v0, v1, :cond_c

    .line 34
    .line 35
    const/4 v1, 0x3

    .line 36
    if-eq v0, v1, :cond_1

    .line 37
    .line 38
    goto/16 :goto_8

    .line 39
    .line 40
    :cond_1
    iget-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 41
    .line 42
    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    instance-of v1, v0, Ljava/lang/Number;

    .line 47
    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    check-cast v0, Ljava/lang/Number;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    move-object v0, v2

    .line 54
    :goto_0
    if-nez v0, :cond_3

    .line 55
    .line 56
    goto/16 :goto_7

    .line 57
    .line 58
    :cond_3
    iget-object v1, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 59
    .line 60
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    instance-of v3, v1, Ljava/lang/Number;

    .line 65
    .line 66
    if-eqz v3, :cond_4

    .line 67
    .line 68
    check-cast v1, Ljava/lang/Number;

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_4
    move-object v1, v2

    .line 72
    :goto_1
    if-nez v1, :cond_5

    .line 73
    .line 74
    goto/16 :goto_7

    .line 75
    .line 76
    :cond_5
    iget-object v3, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 77
    .line 78
    const-string v4, "width"

    .line 79
    .line 80
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    instance-of v4, v3, Ljava/lang/Number;

    .line 85
    .line 86
    if-eqz v4, :cond_6

    .line 87
    .line 88
    check-cast v3, Ljava/lang/Number;

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_6
    move-object v3, v2

    .line 92
    :goto_2
    if-nez v3, :cond_7

    .line 93
    .line 94
    goto/16 :goto_7

    .line 95
    .line 96
    :cond_7
    iget-object v4, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 97
    .line 98
    const-string v5, "height"

    .line 99
    .line 100
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    instance-of v5, v4, Ljava/lang/Number;

    .line 105
    .line 106
    if-eqz v5, :cond_8

    .line 107
    .line 108
    check-cast v4, Ljava/lang/Number;

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_8
    move-object v4, v2

    .line 112
    :goto_3
    if-nez v4, :cond_9

    .line 113
    .line 114
    goto/16 :goto_7

    .line 115
    .line 116
    :cond_9
    iget-object v5, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 117
    .line 118
    const-string v6, "cornerRadius"

    .line 119
    .line 120
    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v5

    .line 124
    instance-of v6, v5, Ljava/lang/Number;

    .line 125
    .line 126
    if-eqz v6, :cond_a

    .line 127
    .line 128
    move-object v2, v5

    .line 129
    check-cast v2, Ljava/lang/Number;

    .line 130
    .line 131
    :cond_a
    if-nez v2, :cond_b

    .line 132
    .line 133
    goto/16 :goto_7

    .line 134
    .line 135
    :cond_b
    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    invoke-virtual {v4}, Ljava/lang/Number;->floatValue()F

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    invoke-static {}, Lcom/tantan/library/svga/compose/entities/SVGAShapeKt;->getSharedPath()Landroid/graphics/Path;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    new-instance v6, Landroid/graphics/RectF;

    .line 160
    .line 161
    add-float/2addr v3, v0

    .line 162
    add-float/2addr v4, v1

    .line 163
    invoke-direct {v6, v0, v1, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 164
    .line 165
    .line 166
    sget-object v0, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 167
    .line 168
    invoke-virtual {v5, v6, v2, v2, v0}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 169
    .line 170
    .line 171
    goto/16 :goto_8

    .line 172
    .line 173
    :cond_c
    iget-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 174
    .line 175
    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    instance-of v1, v0, Ljava/lang/Number;

    .line 180
    .line 181
    if-eqz v1, :cond_d

    .line 182
    .line 183
    check-cast v0, Ljava/lang/Number;

    .line 184
    .line 185
    goto :goto_4

    .line 186
    :cond_d
    move-object v0, v2

    .line 187
    :goto_4
    if-nez v0, :cond_e

    .line 188
    .line 189
    goto :goto_7

    .line 190
    :cond_e
    iget-object v1, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 191
    .line 192
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    instance-of v3, v1, Ljava/lang/Number;

    .line 197
    .line 198
    if-eqz v3, :cond_f

    .line 199
    .line 200
    check-cast v1, Ljava/lang/Number;

    .line 201
    .line 202
    goto :goto_5

    .line 203
    :cond_f
    move-object v1, v2

    .line 204
    :goto_5
    if-nez v1, :cond_10

    .line 205
    .line 206
    goto :goto_7

    .line 207
    :cond_10
    iget-object v3, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 208
    .line 209
    const-string v4, "radiusX"

    .line 210
    .line 211
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    instance-of v4, v3, Ljava/lang/Number;

    .line 216
    .line 217
    if-eqz v4, :cond_11

    .line 218
    .line 219
    check-cast v3, Ljava/lang/Number;

    .line 220
    .line 221
    goto :goto_6

    .line 222
    :cond_11
    move-object v3, v2

    .line 223
    :goto_6
    if-nez v3, :cond_12

    .line 224
    .line 225
    goto :goto_7

    .line 226
    :cond_12
    iget-object v4, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 227
    .line 228
    const-string v5, "radiusY"

    .line 229
    .line 230
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v4

    .line 234
    instance-of v5, v4, Ljava/lang/Number;

    .line 235
    .line 236
    if-eqz v5, :cond_13

    .line 237
    .line 238
    move-object v2, v4

    .line 239
    check-cast v2, Ljava/lang/Number;

    .line 240
    .line 241
    :cond_13
    if-nez v2, :cond_14

    .line 242
    .line 243
    :goto_7
    return-void

    .line 244
    :cond_14
    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    .line 249
    .line 250
    .line 251
    move-result v1

    .line 252
    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    .line 253
    .line 254
    .line 255
    move-result v3

    .line 256
    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    .line 257
    .line 258
    .line 259
    move-result v2

    .line 260
    invoke-static {}, Lcom/tantan/library/svga/compose/entities/SVGAShapeKt;->getSharedPath()Landroid/graphics/Path;

    .line 261
    .line 262
    .line 263
    move-result-object v4

    .line 264
    new-instance v5, Landroid/graphics/RectF;

    .line 265
    .line 266
    sub-float v6, v0, v3

    .line 267
    .line 268
    sub-float v7, v1, v2

    .line 269
    .line 270
    add-float/2addr v0, v3

    .line 271
    add-float/2addr v1, v2

    .line 272
    invoke-direct {v5, v6, v7, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 273
    .line 274
    .line 275
    sget-object v0, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 276
    .line 277
    invoke-virtual {v4, v5, v0}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 278
    .line 279
    .line 280
    goto :goto_8

    .line 281
    :cond_15
    iget-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->args:Ljava/util/HashMap;

    .line 282
    .line 283
    const-string v1, "d"

    .line 284
    .line 285
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    instance-of v1, v0, Ljava/lang/String;

    .line 290
    .line 291
    if-eqz v1, :cond_16

    .line 292
    .line 293
    move-object v2, v0

    .line 294
    check-cast v2, Ljava/lang/String;

    .line 295
    .line 296
    :cond_16
    if-eqz v2, :cond_17

    .line 297
    .line 298
    new-instance v0, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;

    .line 299
    .line 300
    invoke-direct {v0, v2}, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;-><init>(Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    invoke-static {}, Lcom/tantan/library/svga/compose/entities/SVGAShapeKt;->getSharedPath()Landroid/graphics/Path;

    .line 304
    .line 305
    .line 306
    move-result-object v1

    .line 307
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;->buildPath(Landroid/graphics/Path;)V

    .line 308
    .line 309
    .line 310
    :cond_17
    :goto_8
    new-instance v0, Landroid/graphics/Path;

    .line 311
    .line 312
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 313
    .line 314
    .line 315
    iput-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->shapePath:Landroid/graphics/Path;

    .line 316
    .line 317
    invoke-static {}, Lcom/tantan/library/svga/compose/entities/SVGAShapeKt;->getSharedPath()Landroid/graphics/Path;

    .line 318
    .line 319
    .line 320
    move-result-object p0

    .line 321
    invoke-virtual {v0, p0}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    .line 322
    .line 323
    .line 324
    return-void
.end method

.method public final getMatrix()Lcom/tantan/library/svga/utils/FMatrix;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->matrix:Lcom/tantan/library/svga/utils/FMatrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getShapePath()Landroid/graphics/Path;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->shapePath:Landroid/graphics/Path;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getStyles()Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->styles:Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity$Styles;

    .line 2
    .line 3
    return-object p0
.end method

.method public final isKeep()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->type:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;

    .line 2
    .line 3
    sget-object v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;->KEEP:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final setShapePath(Landroid/graphics/Path;)V
    .locals 0
    .param p1    # Landroid/graphics/Path;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;->shapePath:Landroid/graphics/Path;

    .line 2
    .line 3
    return-void
.end method
