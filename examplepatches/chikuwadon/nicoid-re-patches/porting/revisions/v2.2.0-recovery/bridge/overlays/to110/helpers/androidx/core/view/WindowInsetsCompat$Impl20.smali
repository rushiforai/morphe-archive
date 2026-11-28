.class Landroidx/core/view/WindowInsetsCompat$Impl20;
.super Landroidx/core/view/WindowInsetsCompat$Impl;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/WindowInsetsCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Impl20"
.end annotation


# static fields
.field private static final SYSTEM_BAR_VISIBILITY_MASK:I = 0x6

.field private static sAttachInfoClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static sAttachInfoField:Ljava/lang/reflect/Field;

.field private static sGetViewRootImplMethod:Ljava/lang/reflect/Method;

.field private static sVisibleInsetsField:Ljava/lang/reflect/Field;

.field private static sVisibleRectReflectionFetched:Z


# instance fields
.field mDisplayShapeCompat:Landroidx/core/view/DisplayShapeCompat;

.field private mOverriddenInsets:[Landroidx/core/graphics/Insets;

.field final mPlatformInsets:Landroid/view/WindowInsets;

.field mRootViewHeight:I

.field mRootViewVisibleInsets:Landroidx/core/graphics/Insets;

.field mRootViewWidth:I

.field private mRootWindowInsets:Landroidx/core/view/WindowInsetsCompat;

.field mSystemUiVisibility:I

.field private mSystemWindowInsets:Landroidx/core/graphics/Insets;

.field private mTypeBoundingRectsMap:[[Landroid/graphics/Rect;

.field private mTypeMaxBoundingRectsMap:[[Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 1013
    const/4 v0, 0x0

    sput-boolean v0, Landroidx/core/view/WindowInsetsCompat$Impl20;->sVisibleRectReflectionFetched:Z

    return-void
.end method

.method constructor <init>(Landroidx/core/view/WindowInsetsCompat;Landroid/view/WindowInsets;)V
    .registers 5
    .param p1, "host"    # Landroidx/core/view/WindowInsetsCompat;
    .param p2, "insets"    # Landroid/view/WindowInsets;

    .line 1042
    invoke-direct {p0, p1}, Landroidx/core/view/WindowInsetsCompat$Impl;-><init>(Landroidx/core/view/WindowInsetsCompat;)V

    .line 1025
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mSystemWindowInsets:Landroidx/core/graphics/Insets;

    .line 1037
    const/16 v0, 0xa

    new-array v1, v0, [[Landroid/graphics/Rect;

    iput-object v1, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mTypeBoundingRectsMap:[[Landroid/graphics/Rect;

    .line 1039
    new-array v0, v0, [[Landroid/graphics/Rect;

    iput-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mTypeMaxBoundingRectsMap:[[Landroid/graphics/Rect;

    .line 1043
    iput-object p2, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mPlatformInsets:Landroid/view/WindowInsets;

    .line 1044
    return-void
.end method

.method constructor <init>(Landroidx/core/view/WindowInsetsCompat;Landroidx/core/view/WindowInsetsCompat$Impl20;)V
    .registers 5
    .param p1, "host"    # Landroidx/core/view/WindowInsetsCompat;
    .param p2, "other"    # Landroidx/core/view/WindowInsetsCompat$Impl20;

    .line 1047
    new-instance v0, Landroid/view/WindowInsets;

    iget-object v1, p2, Landroidx/core/view/WindowInsetsCompat$Impl20;->mPlatformInsets:Landroid/view/WindowInsets;

    invoke-direct {v0, v1}, Landroid/view/WindowInsets;-><init>(Landroid/view/WindowInsets;)V

    invoke-direct {p0, p1, v0}, Landroidx/core/view/WindowInsetsCompat$Impl20;-><init>(Landroidx/core/view/WindowInsetsCompat;Landroid/view/WindowInsets;)V

    .line 1048
    return-void
.end method

.method private createDisplayShape(Landroid/view/View;)Landroidx/core/view/DisplayShapeCompat;
    .registers 16
    .param p1, "rootView"    # Landroid/view/View;

    .line 1306
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 1307
    return-object v0

    .line 1309
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object v1

    .line 1310
    .local v1, "display":Landroid/view/Display;
    if-nez v1, :cond_1

    .line 1311
    return-object v0

    .line 1314
    :cond_1
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 1315
    .local v0, "displaySize":Landroid/graphics/Point;
    invoke-virtual {v1, v0}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 1317
    iget-object v2, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mHost:Landroidx/core/view/WindowInsetsCompat;

    invoke-virtual {v2}, Landroidx/core/view/WindowInsetsCompat;->isRound()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1319
    iget v3, v0, Landroid/graphics/Point;->x:I

    iget v4, v0, Landroid/graphics/Point;->y:I

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v3 .. v9}, Landroidx/core/view/DisplayShapeCompat;->create(IIZIIII)Landroidx/core/view/DisplayShapeCompat;

    move-result-object v2

    return-object v2

    .line 1324
    :cond_2
    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroidx/core/view/DisplayCompat;->getRoundedCorner(Landroid/view/Display;I)Landroidx/core/view/RoundedCornerCompat;

    move-result-object v3

    .line 1326
    .local v3, "topLeft":Landroidx/core/view/RoundedCornerCompat;
    const/4 v4, 0x1

    invoke-static {v1, v4}, Landroidx/core/view/DisplayCompat;->getRoundedCorner(Landroid/view/Display;I)Landroidx/core/view/RoundedCornerCompat;

    move-result-object v4

    .line 1328
    .local v4, "topRight":Landroidx/core/view/RoundedCornerCompat;
    const/4 v5, 0x2

    invoke-static {v1, v5}, Landroidx/core/view/DisplayCompat;->getRoundedCorner(Landroid/view/Display;I)Landroidx/core/view/RoundedCornerCompat;

    move-result-object v5

    .line 1330
    .local v5, "bottomRight":Landroidx/core/view/RoundedCornerCompat;
    const/4 v6, 0x3

    invoke-static {v1, v6}, Landroidx/core/view/DisplayCompat;->getRoundedCorner(Landroid/view/Display;I)Landroidx/core/view/RoundedCornerCompat;

    move-result-object v6

    .line 1333
    .local v6, "bottomLeft":Landroidx/core/view/RoundedCornerCompat;
    iget v7, v0, Landroid/graphics/Point;->x:I

    iget v8, v0, Landroid/graphics/Point;->y:I

    .line 1334
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Landroidx/core/view/RoundedCornerCompat;->getRadius()I

    move-result v9

    move v10, v9

    goto :goto_0

    :cond_3
    move v10, v2

    .line 1335
    :goto_0
    if-eqz v4, :cond_4

    invoke-virtual {v4}, Landroidx/core/view/RoundedCornerCompat;->getRadius()I

    move-result v9

    move v11, v9

    goto :goto_1

    :cond_4
    move v11, v2

    .line 1336
    :goto_1
    if-eqz v5, :cond_5

    invoke-virtual {v5}, Landroidx/core/view/RoundedCornerCompat;->getRadius()I

    move-result v9

    move v12, v9

    goto :goto_2

    :cond_5
    move v12, v2

    .line 1337
    :goto_2
    if-eqz v6, :cond_6

    invoke-virtual {v6}, Landroidx/core/view/RoundedCornerCompat;->getRadius()I

    move-result v2

    :cond_6
    move v13, v2

    .line 1333
    const/4 v9, 0x0

    invoke-static/range {v7 .. v13}, Landroidx/core/view/DisplayShapeCompat;->create(IIZIIII)Landroidx/core/view/DisplayShapeCompat;

    move-result-object v2

    return-object v2
.end method

.method private static getBoundingRects([[Landroid/graphics/Rect;I)Ljava/util/List;
    .registers 9
    .param p0, "typeBoundingRectsMap"    # [[Landroid/graphics/Rect;
    .param p1, "typeMask"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([[",
            "Landroid/graphics/Rect;",
            "I)",
            "Ljava/util/List<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation

    .line 1457
    const/4 v0, 0x0

    .line 1458
    .local v0, "allRects":[Landroid/graphics/Rect;
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    const/16 v2, 0x200

    if-gt v1, v2, :cond_3

    .line 1459
    and-int v2, p1, v1

    if-nez v2, :cond_0

    .line 1460
    goto :goto_1

    .line 1462
    :cond_0
    invoke-static {v1}, Landroidx/core/view/WindowInsetsCompat$Type;->indexOf(I)I

    move-result v2

    aget-object v2, p0, v2

    .line 1463
    .local v2, "rects":[Landroid/graphics/Rect;
    if-nez v2, :cond_1

    .line 1464
    goto :goto_1

    .line 1466
    :cond_1
    if-nez v0, :cond_2

    .line 1467
    move-object v0, v2

    goto :goto_1

    .line 1469
    :cond_2
    array-length v3, v0

    array-length v4, v2

    add-int/2addr v3, v4

    new-array v3, v3, [Landroid/graphics/Rect;

    .line 1470
    .local v3, "concat":[Landroid/graphics/Rect;
    array-length v4, v0

    const/4 v5, 0x0

    invoke-static {v0, v5, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1471
    array-length v4, v0

    array-length v6, v2

    invoke-static {v2, v5, v3, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1472
    move-object v0, v3

    .line 1458
    .end local v2    # "rects":[Landroid/graphics/Rect;
    .end local v3    # "concat":[Landroid/graphics/Rect;
    :goto_1
    shl-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1475
    .end local v1    # "i":I
    :cond_3
    if-nez v0, :cond_4

    .line 1476
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    return-object v1

    .line 1478
    :cond_4
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method private getBoundingRectsFromInsets(Landroidx/core/graphics/Insets;)[Landroid/graphics/Rect;
    .registers 8
    .param p1, "insets"    # Landroidx/core/graphics/Insets;

    .line 1285
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1286
    .local v0, "boundingRects":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Rect;>;"
    iget v1, p1, Landroidx/core/graphics/Insets;->left:I

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 1287
    new-instance v1, Landroid/graphics/Rect;

    iget v3, p1, Landroidx/core/graphics/Insets;->left:I

    iget v4, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewHeight:I

    invoke-direct {v1, v2, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1289
    :cond_0
    iget v1, p1, Landroidx/core/graphics/Insets;->top:I

    if-eqz v1, :cond_1

    .line 1290
    new-instance v1, Landroid/graphics/Rect;

    iget v3, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewWidth:I

    iget v4, p1, Landroidx/core/graphics/Insets;->top:I

    invoke-direct {v1, v2, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1292
    :cond_1
    iget v1, p1, Landroidx/core/graphics/Insets;->right:I

    if-eqz v1, :cond_2

    .line 1293
    new-instance v1, Landroid/graphics/Rect;

    iget v3, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewWidth:I

    iget v4, p1, Landroidx/core/graphics/Insets;->right:I

    sub-int/2addr v3, v4

    iget v4, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewWidth:I

    iget v5, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewHeight:I

    invoke-direct {v1, v3, v2, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1297
    :cond_2
    iget v1, p1, Landroidx/core/graphics/Insets;->bottom:I

    if-eqz v1, :cond_3

    .line 1298
    new-instance v1, Landroid/graphics/Rect;

    iget v3, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewHeight:I

    iget v4, p1, Landroidx/core/graphics/Insets;->bottom:I

    sub-int/2addr v3, v4

    iget v4, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewWidth:I

    iget v5, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewHeight:I

    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1302
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Landroid/graphics/Rect;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/graphics/Rect;

    return-object v1
.end method

.method private getInsets(IZ)Landroidx/core/graphics/Insets;
    .registers 6
    .param p1, "typeMask"    # I
    .param p2, "ignoreVisibility"    # Z

    .line 1081
    sget-object v0, Landroidx/core/graphics/Insets;->NONE:Landroidx/core/graphics/Insets;

    .line 1082
    .local v0, "result":Landroidx/core/graphics/Insets;
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    const/16 v2, 0x200

    if-gt v1, v2, :cond_1

    .line 1083
    and-int v2, p1, v1

    if-nez v2, :cond_0

    .line 1084
    goto :goto_1

    .line 1086
    :cond_0
    invoke-virtual {p0, v1, p2}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getInsetsForType(IZ)Landroidx/core/graphics/Insets;

    move-result-object v2

    invoke-static {v0, v2}, Landroidx/core/graphics/Insets;->max(Landroidx/core/graphics/Insets;Landroidx/core/graphics/Insets;)Landroidx/core/graphics/Insets;

    move-result-object v0

    .line 1082
    :goto_1
    shl-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1088
    .end local v1    # "i":I
    :cond_1
    return-object v0
.end method

.method private getRootStableInsets()Landroidx/core/graphics/Insets;
    .registers 2

    .line 1248
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootWindowInsets:Landroidx/core/view/WindowInsetsCompat;

    if-eqz v0, :cond_0

    .line 1249
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootWindowInsets:Landroidx/core/view/WindowInsetsCompat;

    invoke-virtual {v0}, Landroidx/core/view/WindowInsetsCompat;->getStableInsets()Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0

    .line 1251
    :cond_0
    sget-object v0, Landroidx/core/graphics/Insets;->NONE:Landroidx/core/graphics/Insets;

    return-object v0
.end method

.method private getVisibleInsets(Landroid/view/View;)Landroidx/core/graphics/Insets;
    .registers 7
    .param p1, "rootView"    # Landroid/view/View;

    .line 1368
    const-string v0, "WindowInsetsCompat"

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-ge v1, v2, :cond_4

    .line 1372
    sget-boolean v1, Landroidx/core/view/WindowInsetsCompat$Impl20;->sVisibleRectReflectionFetched:Z

    if-nez v1, :cond_0

    .line 1373
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Impl20;->loadReflectionField()V

    .line 1376
    :cond_0
    sget-object v1, Landroidx/core/view/WindowInsetsCompat$Impl20;->sGetViewRootImplMethod:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    sget-object v1, Landroidx/core/view/WindowInsetsCompat$Impl20;->sAttachInfoClass:Ljava/lang/Class;

    if-eqz v1, :cond_3

    sget-object v1, Landroidx/core/view/WindowInsetsCompat$Impl20;->sVisibleInsetsField:Ljava/lang/reflect/Field;

    if-eqz v1, :cond_3

    .line 1383
    :try_start_0
    sget-object v1, Landroidx/core/view/WindowInsetsCompat$Impl20;->sGetViewRootImplMethod:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 1384
    .local v1, "viewRootImpl":Ljava/lang/Object;
    if-nez v1, :cond_1

    .line 1385
    const-string v3, "Failed to get visible insets. getViewRootImpl() returned null from the provided view. This means that the view is either not attached or the method has been overridden"

    new-instance v4, Ljava/lang/NullPointerException;

    invoke-direct {v4}, Ljava/lang/NullPointerException;-><init>()V

    invoke-static {v0, v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1389
    return-object v2

    .line 1391
    :cond_1
    sget-object v3, Landroidx/core/view/WindowInsetsCompat$Impl20;->sAttachInfoField:Ljava/lang/reflect/Field;

    invoke-virtual {v3, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 1392
    .local v3, "mAttachInfo":Ljava/lang/Object;
    sget-object v4, Landroidx/core/view/WindowInsetsCompat$Impl20;->sVisibleInsetsField:Ljava/lang/reflect/Field;

    invoke-virtual {v4, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/Rect;

    .line 1393
    .local v4, "visibleRect":Landroid/graphics/Rect;
    if-eqz v4, :cond_2

    invoke-static {v4}, Landroidx/core/graphics/Insets;->of(Landroid/graphics/Rect;)Landroidx/core/graphics/Insets;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    return-object v2

    .line 1395
    .end local v1    # "viewRootImpl":Ljava/lang/Object;
    .end local v3    # "mAttachInfo":Ljava/lang/Object;
    .end local v4    # "visibleRect":Landroid/graphics/Rect;
    :catch_0
    move-exception v1

    .line 1396
    .local v1, "e":Ljava/lang/ReflectiveOperationException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to get visible insets. (Reflection error). "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1397
    invoke-virtual {v1}, Ljava/lang/ReflectiveOperationException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1396
    invoke-static {v0, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1401
    .end local v1    # "e":Ljava/lang/ReflectiveOperationException;
    return-object v2

    .line 1379
    :cond_3
    return-object v2

    .line 1369
    :cond_4
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "getVisibleInsets() should not be called on API >= 30. Use WindowInsets.isVisible() instead."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static loadReflectionField()V
    .registers 4

    .line 1413
    const/4 v0, 0x1

    :try_start_0
    const-class v1, Landroid/view/View;

    const-string v2, "getViewRootImpl"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Landroidx/core/view/WindowInsetsCompat$Impl20;->sGetViewRootImplMethod:Ljava/lang/reflect/Method;

    .line 1414
    const-string v1, "android.view.View$AttachInfo"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Landroidx/core/view/WindowInsetsCompat$Impl20;->sAttachInfoClass:Ljava/lang/Class;

    .line 1415
    sget-object v1, Landroidx/core/view/WindowInsetsCompat$Impl20;->sAttachInfoClass:Ljava/lang/Class;

    const-string v2, "mVisibleInsets"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Landroidx/core/view/WindowInsetsCompat$Impl20;->sVisibleInsetsField:Ljava/lang/reflect/Field;

    .line 1416
    const-string v1, "android.view.ViewRootImpl"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 1417
    .local v1, "viewRootImplClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "mAttachInfo"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    sput-object v2, Landroidx/core/view/WindowInsetsCompat$Impl20;->sAttachInfoField:Ljava/lang/reflect/Field;

    .line 1418
    sget-object v2, Landroidx/core/view/WindowInsetsCompat$Impl20;->sVisibleInsetsField:Ljava/lang/reflect/Field;

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 1419
    sget-object v2, Landroidx/core/view/WindowInsetsCompat$Impl20;->sAttachInfoField:Ljava/lang/reflect/Field;

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1423
    .end local v1    # "viewRootImplClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_0

    .line 1420
    :catch_0
    move-exception v1

    .line 1421
    .local v1, "e":Ljava/lang/ReflectiveOperationException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to get visible insets. (Reflection error). "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/ReflectiveOperationException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "WindowInsetsCompat"

    invoke-static {v3, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1424
    .end local v1    # "e":Ljava/lang/ReflectiveOperationException;
    :goto_0
    sput-boolean v0, Landroidx/core/view/WindowInsetsCompat$Impl20;->sVisibleRectReflectionFetched:Z

    .line 1425
    return-void
.end method

.method static systemBarVisibilityEquals(II)Z
    .registers 4
    .param p0, "vis1"    # I
    .param p1, "vis2"    # I

    .line 1441
    and-int/lit8 v0, p0, 0x6

    and-int/lit8 v1, p1, 0x6

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method copyRootViewBounds(Landroid/view/View;)V
    .registers 3
    .param p1, "rootView"    # Landroid/view/View;

    .line 1257
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    iput v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewWidth:I

    .line 1258
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    iput v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewHeight:I

    .line 1259
    invoke-direct {p0, p1}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getVisibleInsets(Landroid/view/View;)Landroidx/core/graphics/Insets;

    move-result-object v0

    .line 1260
    .local v0, "visibleInsets":Landroidx/core/graphics/Insets;
    if-nez v0, :cond_0

    .line 1261
    sget-object v0, Landroidx/core/graphics/Insets;->NONE:Landroidx/core/graphics/Insets;

    .line 1263
    :cond_0
    invoke-virtual {p0, v0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->setRootViewData(Landroidx/core/graphics/Insets;)V

    .line 1264
    return-void
.end method

.method copyWindowDataInto(Landroidx/core/view/WindowInsetsCompat;)V
    .registers 3
    .param p1, "other"    # Landroidx/core/view/WindowInsetsCompat;

    .line 1228
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootWindowInsets:Landroidx/core/view/WindowInsetsCompat;

    invoke-virtual {p1, v0}, Landroidx/core/view/WindowInsetsCompat;->setRootWindowInsets(Landroidx/core/view/WindowInsetsCompat;)V

    .line 1229
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewVisibleInsets:Landroidx/core/graphics/Insets;

    invoke-virtual {p1, v0}, Landroidx/core/view/WindowInsetsCompat;->setRootViewData(Landroidx/core/graphics/Insets;)V

    .line 1230
    iget v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mSystemUiVisibility:I

    invoke-virtual {p1, v0}, Landroidx/core/view/WindowInsetsCompat;->setSystemUiVisibility(I)V

    .line 1231
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mDisplayShapeCompat:Landroidx/core/view/DisplayShapeCompat;

    invoke-virtual {p1, v0}, Landroidx/core/view/WindowInsetsCompat;->setDisplayShape(Landroidx/core/view/DisplayShapeCompat;)V

    .line 1232
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mTypeBoundingRectsMap:[[Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroidx/core/view/WindowInsetsCompat;->setTypeBoundingRectsMap([[Landroid/graphics/Rect;)V

    .line 1233
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mTypeMaxBoundingRectsMap:[[Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroidx/core/view/WindowInsetsCompat;->setTypeMaxBoundingRectsMap([[Landroid/graphics/Rect;)V

    .line 1234
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .line 1434
    invoke-super {p0, p1}, Landroidx/core/view/WindowInsetsCompat$Impl;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 1435
    :cond_0
    move-object v0, p1

    check-cast v0, Landroidx/core/view/WindowInsetsCompat$Impl20;

    .line 1436
    .local v0, "impl20":Landroidx/core/view/WindowInsetsCompat$Impl20;
    iget-object v2, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewVisibleInsets:Landroidx/core/graphics/Insets;

    iget-object v3, v0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewVisibleInsets:Landroidx/core/graphics/Insets;

    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget v2, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mSystemUiVisibility:I

    iget v3, v0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mSystemUiVisibility:I

    .line 1437
    invoke-static {v2, v3}, Landroidx/core/view/WindowInsetsCompat$Impl20;->systemBarVisibilityEquals(II)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    nop

    .line 1436
    :goto_0
    return v1
.end method

.method getBoundingRects(I)Ljava/util/List;
    .registers 3
    .param p1, "typeMask"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation

    .line 1446
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mTypeBoundingRectsMap:[[Landroid/graphics/Rect;

    invoke-static {v0, p1}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getBoundingRects([[Landroid/graphics/Rect;I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method getBoundingRectsIgnoringVisibility(I)Ljava/util/List;
    .registers 3
    .param p1, "typeMask"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation

    .line 1451
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mTypeMaxBoundingRectsMap:[[Landroid/graphics/Rect;

    invoke-static {v0, p1}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getBoundingRects([[Landroid/graphics/Rect;I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method getDisplayShape()Landroidx/core/view/DisplayShapeCompat;
    .registers 2

    .line 1429
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mDisplayShapeCompat:Landroidx/core/view/DisplayShapeCompat;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mDisplayShapeCompat:Landroidx/core/view/DisplayShapeCompat;

    goto :goto_0

    :cond_0
    sget-object v0, Landroidx/core/view/DisplayShapeCompat;->EMPTY:Landroidx/core/view/DisplayShapeCompat;

    :goto_0
    return-object v0
.end method

.method public getInsets(I)Landroidx/core/graphics/Insets;
    .registers 3
    .param p1, "typeMask"    # I

    .line 1057
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getInsets(IZ)Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0
.end method

.method protected getInsetsForType(IZ)Landroidx/core/graphics/Insets;
    .registers 10
    .param p1, "type"    # I
    .param p2, "ignoreVisibility"    # Z

    .line 1093
    const/4 v0, 0x0

    const/4 v1, 0x0

    sparse-switch p1, :sswitch_data_0

    .line 1186
    sget-object v0, Landroidx/core/graphics/Insets;->NONE:Landroidx/core/graphics/Insets;

    return-object v0

    .line 1175
    :sswitch_0
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootWindowInsets:Landroidx/core/view/WindowInsetsCompat;

    if-eqz v0, :cond_0

    .line 1176
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootWindowInsets:Landroidx/core/view/WindowInsetsCompat;

    invoke-virtual {v0}, Landroidx/core/view/WindowInsetsCompat;->getDisplayCutout()Landroidx/core/view/DisplayCutoutCompat;

    move-result-object v0

    goto :goto_0

    .line 1177
    :cond_0
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getDisplayCutout()Landroidx/core/view/DisplayCutoutCompat;

    move-result-object v0

    :goto_0
    nop

    .line 1178
    .local v0, "cutout":Landroidx/core/view/DisplayCutoutCompat;
    if-eqz v0, :cond_1

    .line 1179
    invoke-virtual {v0}, Landroidx/core/view/DisplayCutoutCompat;->getSafeInsetLeft()I

    move-result v1

    invoke-virtual {v0}, Landroidx/core/view/DisplayCutoutCompat;->getSafeInsetTop()I

    move-result v2

    .line 1180
    invoke-virtual {v0}, Landroidx/core/view/DisplayCutoutCompat;->getSafeInsetRight()I

    move-result v3

    invoke-virtual {v0}, Landroidx/core/view/DisplayCutoutCompat;->getSafeInsetBottom()I

    move-result v4

    .line 1179
    invoke-static {v1, v2, v3, v4}, Landroidx/core/graphics/Insets;->of(IIII)Landroidx/core/graphics/Insets;

    move-result-object v1

    return-object v1

    .line 1182
    :cond_1
    sget-object v1, Landroidx/core/graphics/Insets;->NONE:Landroidx/core/graphics/Insets;

    return-object v1

    .line 1171
    .end local v0    # "cutout":Landroidx/core/view/DisplayCutoutCompat;
    :sswitch_1
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getTappableElementInsets()Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0

    .line 1167
    :sswitch_2
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getMandatorySystemGestureInsets()Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0

    .line 1163
    :sswitch_3
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getSystemGestureInsets()Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0

    .line 1139
    :sswitch_4
    iget-object v2, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mOverriddenInsets:[Landroidx/core/graphics/Insets;

    if-eqz v2, :cond_2

    .line 1140
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mOverriddenInsets:[Landroidx/core/graphics/Insets;

    const/16 v2, 0x8

    invoke-static {v2}, Landroidx/core/view/WindowInsetsCompat$Type;->indexOf(I)I

    move-result v2

    aget-object v0, v0, v2

    goto :goto_1

    :cond_2
    nop

    .line 1141
    .local v0, "overriddenInsets":Landroidx/core/graphics/Insets;
    :goto_1
    if-eqz v0, :cond_3

    .line 1142
    return-object v0

    .line 1144
    :cond_3
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getSystemWindowInsets()Landroidx/core/graphics/Insets;

    move-result-object v2

    .line 1145
    .local v2, "systemWindow":Landroidx/core/graphics/Insets;
    invoke-direct {p0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getRootStableInsets()Landroidx/core/graphics/Insets;

    move-result-object v3

    .line 1147
    .local v3, "rootStable":Landroidx/core/graphics/Insets;
    iget v4, v2, Landroidx/core/graphics/Insets;->bottom:I

    iget v5, v3, Landroidx/core/graphics/Insets;->bottom:I

    if-le v4, v5, :cond_4

    .line 1150
    iget v4, v2, Landroidx/core/graphics/Insets;->bottom:I

    invoke-static {v1, v1, v1, v4}, Landroidx/core/graphics/Insets;->of(IIII)Landroidx/core/graphics/Insets;

    move-result-object v1

    return-object v1

    .line 1151
    :cond_4
    iget-object v4, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewVisibleInsets:Landroidx/core/graphics/Insets;

    if-eqz v4, :cond_5

    iget-object v4, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewVisibleInsets:Landroidx/core/graphics/Insets;

    sget-object v5, Landroidx/core/graphics/Insets;->NONE:Landroidx/core/graphics/Insets;

    .line 1152
    invoke-virtual {v4, v5}, Landroidx/core/graphics/Insets;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 1155
    iget-object v4, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewVisibleInsets:Landroidx/core/graphics/Insets;

    iget v4, v4, Landroidx/core/graphics/Insets;->bottom:I

    iget v5, v3, Landroidx/core/graphics/Insets;->bottom:I

    if-le v4, v5, :cond_5

    .line 1156
    iget-object v4, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewVisibleInsets:Landroidx/core/graphics/Insets;

    iget v4, v4, Landroidx/core/graphics/Insets;->bottom:I

    invoke-static {v1, v1, v1, v4}, Landroidx/core/graphics/Insets;->of(IIII)Landroidx/core/graphics/Insets;

    move-result-object v1

    return-object v1

    .line 1159
    :cond_5
    sget-object v1, Landroidx/core/graphics/Insets;->NONE:Landroidx/core/graphics/Insets;

    return-object v1

    .line 1106
    .end local v0    # "overriddenInsets":Landroidx/core/graphics/Insets;
    .end local v2    # "systemWindow":Landroidx/core/graphics/Insets;
    .end local v3    # "rootStable":Landroidx/core/graphics/Insets;
    :sswitch_5
    if-eqz p2, :cond_6

    .line 1107
    invoke-direct {p0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getRootStableInsets()Landroidx/core/graphics/Insets;

    move-result-object v0

    .line 1108
    .local v0, "rootStable":Landroidx/core/graphics/Insets;
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getStableInsets()Landroidx/core/graphics/Insets;

    move-result-object v2

    .line 1109
    .local v2, "stable":Landroidx/core/graphics/Insets;
    iget v3, v0, Landroidx/core/graphics/Insets;->left:I

    iget v4, v2, Landroidx/core/graphics/Insets;->left:I

    .line 1110
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget v4, v0, Landroidx/core/graphics/Insets;->right:I

    iget v5, v2, Landroidx/core/graphics/Insets;->right:I

    .line 1112
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    iget v5, v0, Landroidx/core/graphics/Insets;->bottom:I

    iget v6, v2, Landroidx/core/graphics/Insets;->bottom:I

    .line 1113
    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 1109
    invoke-static {v3, v1, v4, v5}, Landroidx/core/graphics/Insets;->of(IIII)Landroidx/core/graphics/Insets;

    move-result-object v1

    return-object v1

    .line 1115
    .end local v0    # "rootStable":Landroidx/core/graphics/Insets;
    .end local v2    # "stable":Landroidx/core/graphics/Insets;
    :cond_6
    iget v2, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mSystemUiVisibility:I

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_7

    .line 1116
    sget-object v0, Landroidx/core/graphics/Insets;->NONE:Landroidx/core/graphics/Insets;

    return-object v0

    .line 1118
    :cond_7
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getSystemWindowInsets()Landroidx/core/graphics/Insets;

    move-result-object v2

    .line 1119
    .local v2, "systemWindow":Landroidx/core/graphics/Insets;
    iget-object v3, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootWindowInsets:Landroidx/core/view/WindowInsetsCompat;

    if-eqz v3, :cond_8

    .line 1120
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootWindowInsets:Landroidx/core/view/WindowInsetsCompat;

    invoke-virtual {v0}, Landroidx/core/view/WindowInsetsCompat;->getStableInsets()Landroidx/core/graphics/Insets;

    move-result-object v0

    goto :goto_2

    .line 1121
    :cond_8
    nop

    :goto_2
    nop

    .line 1123
    .restart local v0    # "rootStable":Landroidx/core/graphics/Insets;
    iget v3, v2, Landroidx/core/graphics/Insets;->bottom:I

    .line 1124
    .local v3, "bottom":I
    if-eqz v0, :cond_9

    .line 1128
    iget v4, v0, Landroidx/core/graphics/Insets;->bottom:I

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 1130
    :cond_9
    iget v4, v2, Landroidx/core/graphics/Insets;->left:I

    iget v5, v2, Landroidx/core/graphics/Insets;->right:I

    invoke-static {v4, v1, v5, v3}, Landroidx/core/graphics/Insets;->of(IIII)Landroidx/core/graphics/Insets;

    move-result-object v1

    return-object v1

    .line 1095
    .end local v0    # "rootStable":Landroidx/core/graphics/Insets;
    .end local v2    # "systemWindow":Landroidx/core/graphics/Insets;
    .end local v3    # "bottom":I
    :sswitch_6
    if-eqz p2, :cond_a

    .line 1096
    invoke-direct {p0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getRootStableInsets()Landroidx/core/graphics/Insets;

    move-result-object v0

    .line 1097
    .restart local v0    # "rootStable":Landroidx/core/graphics/Insets;
    iget v2, v0, Landroidx/core/graphics/Insets;->top:I

    .line 1098
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getSystemWindowInsets()Landroidx/core/graphics/Insets;

    move-result-object v3

    iget v3, v3, Landroidx/core/graphics/Insets;->top:I

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 1097
    invoke-static {v1, v2, v1, v1}, Landroidx/core/graphics/Insets;->of(IIII)Landroidx/core/graphics/Insets;

    move-result-object v1

    return-object v1

    .line 1099
    .end local v0    # "rootStable":Landroidx/core/graphics/Insets;
    :cond_a
    iget v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mSystemUiVisibility:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_b

    .line 1100
    sget-object v0, Landroidx/core/graphics/Insets;->NONE:Landroidx/core/graphics/Insets;

    return-object v0

    .line 1102
    :cond_b
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getSystemWindowInsets()Landroidx/core/graphics/Insets;

    move-result-object v0

    iget v0, v0, Landroidx/core/graphics/Insets;->top:I

    invoke-static {v1, v0, v1, v1}, Landroidx/core/graphics/Insets;->of(IIII)Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_6
        0x2 -> :sswitch_5
        0x8 -> :sswitch_4
        0x10 -> :sswitch_3
        0x20 -> :sswitch_2
        0x40 -> :sswitch_1
        0x80 -> :sswitch_0
    .end sparse-switch
.end method

.method public getInsetsIgnoringVisibility(I)Landroidx/core/graphics/Insets;
    .registers 3
    .param p1, "typeMask"    # I

    .line 1062
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getInsets(IZ)Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0
.end method

.method final getSystemWindowInsets()Landroidx/core/graphics/Insets;
    .registers 5

    .line 1207
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mSystemWindowInsets:Landroidx/core/graphics/Insets;

    if-nez v0, :cond_0

    .line 1208
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mPlatformInsets:Landroid/view/WindowInsets;

    .line 1209
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    move-result v0

    iget-object v1, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mPlatformInsets:Landroid/view/WindowInsets;

    .line 1210
    invoke-virtual {v1}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v1

    iget-object v2, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mPlatformInsets:Landroid/view/WindowInsets;

    .line 1211
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetRight()I

    move-result v2

    iget-object v3, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mPlatformInsets:Landroid/view/WindowInsets;

    .line 1212
    invoke-virtual {v3}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v3

    .line 1208
    invoke-static {v0, v1, v2, v3}, Landroidx/core/graphics/Insets;->of(IIII)Landroidx/core/graphics/Insets;

    move-result-object v0

    iput-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mSystemWindowInsets:Landroidx/core/graphics/Insets;

    .line 1214
    :cond_0
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mSystemWindowInsets:Landroidx/core/graphics/Insets;

    return-object v0
.end method

.method initDisplayShape(Landroid/view/View;)V
    .registers 3
    .param p1, "rootView"    # Landroid/view/View;

    .line 1268
    invoke-direct {p0, p1}, Landroidx/core/view/WindowInsetsCompat$Impl20;->createDisplayShape(Landroid/view/View;)Landroidx/core/view/DisplayShapeCompat;

    move-result-object v0

    iput-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mDisplayShapeCompat:Landroidx/core/view/DisplayShapeCompat;

    .line 1269
    return-void
.end method

.method initTypeBoundingRectsMaps()V
    .registers 5

    .line 1274
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x200

    if-gt v0, v1, :cond_1

    .line 1275
    invoke-static {v0}, Landroidx/core/view/WindowInsetsCompat$Type;->indexOf(I)I

    move-result v1

    .line 1276
    .local v1, "index":I
    iget-object v2, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mTypeBoundingRectsMap:[[Landroid/graphics/Rect;

    invoke-virtual {p0, v0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v3

    invoke-direct {p0, v3}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getBoundingRectsFromInsets(Landroidx/core/graphics/Insets;)[Landroid/graphics/Rect;

    move-result-object v3

    aput-object v3, v2, v1

    .line 1277
    const/16 v2, 0x8

    if-eq v0, v2, :cond_0

    .line 1278
    iget-object v2, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mTypeMaxBoundingRectsMap:[[Landroid/graphics/Rect;

    .line 1279
    invoke-virtual {p0, v0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getInsetsIgnoringVisibility(I)Landroidx/core/graphics/Insets;

    move-result-object v3

    .line 1278
    invoke-direct {p0, v3}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getBoundingRectsFromInsets(Landroidx/core/graphics/Insets;)[Landroid/graphics/Rect;

    move-result-object v3

    aput-object v3, v2, v1

    .line 1274
    .end local v1    # "index":I
    :cond_0
    shl-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1282
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method inset(IIII)Landroidx/core/view/WindowInsetsCompat;
    .registers 7
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .line 1220
    new-instance v0, Landroidx/core/view/WindowInsetsCompat$Builder;

    iget-object v1, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mPlatformInsets:Landroid/view/WindowInsets;

    invoke-static {v1}, Landroidx/core/view/WindowInsetsCompat;->toWindowInsetsCompat(Landroid/view/WindowInsets;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/core/view/WindowInsetsCompat$Builder;-><init>(Landroidx/core/view/WindowInsetsCompat;)V

    .line 1221
    .local v0, "b":Landroidx/core/view/WindowInsetsCompat$Builder;
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getSystemWindowInsets()Landroidx/core/graphics/Insets;

    move-result-object v1

    invoke-static {v1, p1, p2, p3, p4}, Landroidx/core/view/WindowInsetsCompat;->insetInsets(Landroidx/core/graphics/Insets;IIII)Landroidx/core/graphics/Insets;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/core/view/WindowInsetsCompat$Builder;->setSystemWindowInsets(Landroidx/core/graphics/Insets;)Landroidx/core/view/WindowInsetsCompat$Builder;

    .line 1222
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getStableInsets()Landroidx/core/graphics/Insets;

    move-result-object v1

    invoke-static {v1, p1, p2, p3, p4}, Landroidx/core/view/WindowInsetsCompat;->insetInsets(Landroidx/core/graphics/Insets;IIII)Landroidx/core/graphics/Insets;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/core/view/WindowInsetsCompat$Builder;->setStableInsets(Landroidx/core/graphics/Insets;)Landroidx/core/view/WindowInsetsCompat$Builder;

    .line 1223
    invoke-virtual {v0}, Landroidx/core/view/WindowInsetsCompat$Builder;->build()Landroidx/core/view/WindowInsetsCompat;

    move-result-object v1

    return-object v1
.end method

.method isRound()Z
    .registers 2

    .line 1052
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mPlatformInsets:Landroid/view/WindowInsets;

    invoke-virtual {v0}, Landroid/view/WindowInsets;->isRound()Z

    move-result v0

    return v0
.end method

.method protected isTypeVisible(I)Z
    .registers 5
    .param p1, "type"    # I

    .line 1191
    const/4 v0, 0x1

    const/4 v1, 0x0

    sparse-switch p1, :sswitch_data_0

    .line 1201
    return v0

    .line 1199
    :sswitch_0
    return v1

    .line 1196
    :sswitch_1
    invoke-virtual {p0, p1, v1}, Landroidx/core/view/WindowInsetsCompat$Impl20;->getInsetsForType(IZ)Landroidx/core/graphics/Insets;

    move-result-object v1

    sget-object v2, Landroidx/core/graphics/Insets;->NONE:Landroidx/core/graphics/Insets;

    invoke-virtual {v1, v2}, Landroidx/core/graphics/Insets;->equals(Ljava/lang/Object;)Z

    move-result v1

    xor-int/2addr v1, v0

    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_1
        0x4 -> :sswitch_0
        0x8 -> :sswitch_1
        0x80 -> :sswitch_1
    .end sparse-switch
.end method

.method isVisible(I)Z
    .registers 4
    .param p1, "typeMask"    # I

    .line 1068
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x200

    if-gt v0, v1, :cond_2

    .line 1069
    and-int v1, p1, v0

    if-nez v1, :cond_0

    .line 1070
    goto :goto_1

    .line 1072
    :cond_0
    invoke-virtual {p0, v0}, Landroidx/core/view/WindowInsetsCompat$Impl20;->isTypeVisible(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1073
    const/4 v1, 0x0

    return v1

    .line 1068
    :cond_1
    :goto_1
    shl-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1076
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method public setDisplayShape(Landroidx/core/view/DisplayShapeCompat;)V
    .registers 2
    .param p1, "displayShape"    # Landroidx/core/view/DisplayShapeCompat;

    .line 1342
    iput-object p1, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mDisplayShapeCompat:Landroidx/core/view/DisplayShapeCompat;

    .line 1343
    return-void
.end method

.method public setOverriddenInsets([Landroidx/core/graphics/Insets;)V
    .registers 2
    .param p1, "insetsTypeMask"    # [Landroidx/core/graphics/Insets;

    .line 1406
    iput-object p1, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mOverriddenInsets:[Landroidx/core/graphics/Insets;

    .line 1407
    return-void
.end method

.method setRootViewData(Landroidx/core/graphics/Insets;)V
    .registers 2
    .param p1, "visibleInsets"    # Landroidx/core/graphics/Insets;

    .line 1243
    iput-object p1, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootViewVisibleInsets:Landroidx/core/graphics/Insets;

    .line 1244
    return-void
.end method

.method setRootWindowInsets(Landroidx/core/view/WindowInsetsCompat;)V
    .registers 2
    .param p1, "rootWindowInsets"    # Landroidx/core/view/WindowInsetsCompat;

    .line 1238
    iput-object p1, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mRootWindowInsets:Landroidx/core/view/WindowInsetsCompat;

    .line 1239
    return-void
.end method

.method setSystemUiVisibility(I)V
    .registers 2
    .param p1, "systemUiVisibility"    # I

    .line 1359
    iput p1, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mSystemUiVisibility:I

    .line 1360
    return-void
.end method

.method setTypeBoundingRectsMap([[Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "typeBoundingRectsMap"    # [[Landroid/graphics/Rect;

    .line 1347
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1348
    invoke-virtual {p1}, [[Landroid/graphics/Rect;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Landroid/graphics/Rect;

    iput-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mTypeBoundingRectsMap:[[Landroid/graphics/Rect;

    .line 1349
    return-void
.end method

.method setTypeMaxBoundingRectsMap([[Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "typeMaxBoundingRectsMap"    # [[Landroid/graphics/Rect;

    .line 1353
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1354
    invoke-virtual {p1}, [[Landroid/graphics/Rect;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Landroid/graphics/Rect;

    iput-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl20;->mTypeMaxBoundingRectsMap:[[Landroid/graphics/Rect;

    .line 1355
    return-void
.end method
