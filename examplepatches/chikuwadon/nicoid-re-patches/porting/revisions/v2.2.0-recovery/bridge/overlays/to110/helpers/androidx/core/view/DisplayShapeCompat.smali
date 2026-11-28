.class public final Landroidx/core/view/DisplayShapeCompat;
.super Ljava/lang/Object;
.source "DisplayShapeCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/view/DisplayShapeCompat$Impl34;,
        Landroidx/core/view/DisplayShapeCompat$Impl;,
        Landroidx/core/view/DisplayShapeCompat$ImplBase;
    }
.end annotation


# static fields
.field static final EMPTY:Landroidx/core/view/DisplayShapeCompat;

.field private static final TAG:Ljava/lang/String; = "DisplayShapeCompat"


# instance fields
.field private final mImpl:Landroidx/core/view/DisplayShapeCompat$Impl;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 235
    new-instance v0, Landroidx/core/view/DisplayShapeCompat;

    const/4 v7, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    const-string v1, ""

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v8}, Landroidx/core/view/DisplayShapeCompat;-><init>(Ljava/lang/String;IIFIIIF)V

    sput-object v0, Landroidx/core/view/DisplayShapeCompat;->EMPTY:Landroidx/core/view/DisplayShapeCompat;

    return-void
.end method

.method private constructor <init>(Landroid/view/DisplayShape;)V
    .registers 3
    .param p1, "platformDisplayShape"    # Landroid/view/DisplayShape;

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Landroidx/core/view/DisplayShapeCompat$Impl34;

    invoke-direct {v0, p1}, Landroidx/core/view/DisplayShapeCompat$Impl34;-><init>(Landroid/view/DisplayShape;)V

    iput-object v0, p0, Landroidx/core/view/DisplayShapeCompat;->mImpl:Landroidx/core/view/DisplayShapeCompat$Impl;

    .line 59
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIFIIIF)V
    .registers 18
    .param p1, "spec"    # Ljava/lang/String;
    .param p2, "displayWidth"    # I
    .param p3, "displayHeight"    # I
    .param p4, "physicalPixelDisplaySizeRatio"    # F
    .param p5, "rotation"    # I
    .param p6, "offsetX"    # I
    .param p7, "offsetY"    # I
    .param p8, "scale"    # F

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Landroidx/core/view/DisplayShapeCompat$ImplBase;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Landroidx/core/view/DisplayShapeCompat$ImplBase;-><init>(Ljava/lang/String;IIFIIIF)V

    iput-object v0, p0, Landroidx/core/view/DisplayShapeCompat;->mImpl:Landroidx/core/view/DisplayShapeCompat$Impl;

    .line 66
    return-void
.end method

.method public static create(IIZIIII)Landroidx/core/view/DisplayShapeCompat;
    .registers 16
    .param p0, "displayWidth"    # I
    .param p1, "displayHeight"    # I
    .param p2, "isCircular"    # Z
    .param p3, "topLeftRadius"    # I
    .param p4, "topRightRadius"    # I
    .param p5, "bottomRightRadius"    # I
    .param p6, "bottomLeftRadius"    # I

    .line 136
    invoke-static/range {p0 .. p6}, Landroidx/core/view/DisplayShapeCompat;->createSpecString(IIZIIII)Ljava/lang/String;

    move-result-object v1

    .line 139
    .local v1, "spec":Ljava/lang/String;
    new-instance v0, Landroidx/core/view/DisplayShapeCompat;

    const/4 v7, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    const/4 v6, 0x0

    move v2, p0

    move v3, p1

    .end local p0    # "displayWidth":I
    .end local p1    # "displayHeight":I
    .local v2, "displayWidth":I
    .local v3, "displayHeight":I
    invoke-direct/range {v0 .. v8}, Landroidx/core/view/DisplayShapeCompat;-><init>(Ljava/lang/String;IIFIIIF)V

    .end local v2    # "displayWidth":I
    .end local v3    # "displayHeight":I
    .restart local p0    # "displayWidth":I
    .restart local p1    # "displayHeight":I
    return-object v0
.end method

.method public static create(Ljava/lang/String;FII)Landroidx/core/view/DisplayShapeCompat;
    .registers 13
    .param p0, "spec"    # Ljava/lang/String;
    .param p1, "physicalPixelDisplaySizeRatio"    # F
    .param p2, "displayWidth"    # I
    .param p3, "displayHeight"    # I

    .line 111
    new-instance v0, Landroidx/core/view/DisplayShapeCompat;

    const/4 v7, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    move v4, p1

    move v2, p2

    move v3, p3

    .end local p0    # "spec":Ljava/lang/String;
    .end local p1    # "physicalPixelDisplaySizeRatio":F
    .end local p2    # "displayWidth":I
    .end local p3    # "displayHeight":I
    .local v1, "spec":Ljava/lang/String;
    .local v2, "displayWidth":I
    .local v3, "displayHeight":I
    .local v4, "physicalPixelDisplaySizeRatio":F
    invoke-direct/range {v0 .. v8}, Landroidx/core/view/DisplayShapeCompat;-><init>(Ljava/lang/String;IIFIIIF)V

    return-object v0
.end method

.method private static createSpecString(IIZIIII)Ljava/lang/String;
    .registers 24
    .param p0, "displayWidth"    # I
    .param p1, "displayHeight"    # I
    .param p2, "isCircular"    # Z
    .param p3, "topLeftRadius"    # I
    .param p4, "topRightRadius"    # I
    .param p5, "bottomRightRadius"    # I
    .param p6, "bottomLeftRadius"    # I

    .line 151
    move/from16 v0, p0

    move/from16 v1, p1

    const-string v2, " Z"

    const-string v3, ","

    if-eqz p2, :cond_0

    .line 152
    div-int/lit8 v4, v0, 0x2

    .line 153
    .local v4, "xRadius":I
    div-int/lit8 v5, v1, 0x2

    .line 154
    .local v5, "yRadius":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "M0,"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " A"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, " 0 1,1 "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, " 0 1,1 0,"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 159
    .end local v4    # "xRadius":I
    .end local v5    # "yRadius":I
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .local v4, "spec":Ljava/lang/StringBuilder;
    div-int/lit8 v5, v0, 0x2

    div-int/lit8 v6, v1, 0x2

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 163
    .local v5, "maxRadius":I
    move/from16 v6, p3

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 164
    .local v7, "rTL":I
    move/from16 v8, p4

    invoke-static {v5, v8}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 165
    .local v9, "rTR":I
    move/from16 v10, p5

    invoke-static {v5, v10}, Ljava/lang/Math;->min(II)I

    move-result v11

    .line 166
    .local v11, "rBR":I
    move/from16 v12, p6

    invoke-static {v5, v12}, Ljava/lang/Math;->min(II)I

    move-result v13

    .line 168
    .local v13, "rBL":I
    const-string v14, "M "

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ",0"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    const-string v14, " L "

    move/from16 v16, v5

    .end local v5    # "maxRadius":I
    .local v16, "maxRadius":I
    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sub-int v6, v0, v9

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    const-string v5, " 0 0,1 "

    const-string v6, " A "

    if-lez v9, :cond_1

    .line 172
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    .line 173
    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 176
    :cond_1
    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sub-int v0, v1, v11

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 177
    if-lez v11, :cond_2

    .line 178
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sub-int v15, p0, v11

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 179
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 182
    :cond_2
    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 183
    const/4 v0, 0x0

    if-lez v13, :cond_3

    .line 184
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    .line 185
    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sub-int v0, v1, v13

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 189
    :cond_3
    if-lez v7, :cond_4

    .line 190
    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v14, 0x0

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 191
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 192
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v14, 0x0

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 195
    :cond_4
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static toDisplayShapeCompat(Landroid/view/DisplayShape;)Landroidx/core/view/DisplayShapeCompat;
    .registers 2
    .param p0, "ds"    # Landroid/view/DisplayShape;

    .line 78
    if-nez p0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    new-instance v0, Landroidx/core/view/DisplayShapeCompat;

    invoke-direct {v0, p0}, Landroidx/core/view/DisplayShapeCompat;-><init>(Landroid/view/DisplayShape;)V

    :goto_0
    return-object v0
.end method

.method static toPlatformDisplayShape(Landroidx/core/view/DisplayShapeCompat;)Landroid/view/DisplayShape;
    .registers 2
    .param p0, "dsc"    # Landroidx/core/view/DisplayShapeCompat;

    .line 91
    if-nez p0, :cond_0

    .line 92
    const/4 v0, 0x0

    return-object v0

    .line 94
    :cond_0
    iget-object v0, p0, Landroidx/core/view/DisplayShapeCompat;->mImpl:Landroidx/core/view/DisplayShapeCompat$Impl;

    invoke-interface {v0}, Landroidx/core/view/DisplayShapeCompat$Impl;->getPlatformDisplayShape()Landroid/view/DisplayShape;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 213
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    return v0

    .line 214
    :cond_0
    instance-of v0, p1, Landroidx/core/view/DisplayShapeCompat;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    .line 215
    :cond_1
    move-object v0, p1

    check-cast v0, Landroidx/core/view/DisplayShapeCompat;

    .line 216
    .local v0, "that":Landroidx/core/view/DisplayShapeCompat;
    iget-object v1, p0, Landroidx/core/view/DisplayShapeCompat;->mImpl:Landroidx/core/view/DisplayShapeCompat$Impl;

    iget-object v2, v0, Landroidx/core/view/DisplayShapeCompat;->mImpl:Landroidx/core/view/DisplayShapeCompat$Impl;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public getPath()Landroid/graphics/Path;
    .registers 2

    .line 208
    iget-object v0, p0, Landroidx/core/view/DisplayShapeCompat;->mImpl:Landroidx/core/view/DisplayShapeCompat$Impl;

    invoke-interface {v0}, Landroidx/core/view/DisplayShapeCompat$Impl;->getPath()Landroid/graphics/Path;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .line 221
    iget-object v0, p0, Landroidx/core/view/DisplayShapeCompat;->mImpl:Landroidx/core/view/DisplayShapeCompat$Impl;

    invoke-static {v0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 227
    iget-object v0, p0, Landroidx/core/view/DisplayShapeCompat;->mImpl:Landroidx/core/view/DisplayShapeCompat$Impl;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
