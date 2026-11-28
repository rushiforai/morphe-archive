.class Landroidx/core/view/DisplayCompat$Api23Impl;
.super Ljava/lang/Object;
.source "DisplayCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/DisplayCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Api23Impl"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 246
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getMode(Landroid/content/Context;Landroid/view/Display;)Landroidx/core/view/DisplayCompat$ModeCompat;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "display"    # Landroid/view/Display;

    .line 249
    invoke-virtual {p1}, Landroid/view/Display;->getMode()Landroid/view/Display$Mode;

    move-result-object v0

    .line 250
    .local v0, "currentMode":Landroid/view/Display$Mode;
    invoke-static {p0, p1}, Landroidx/core/view/DisplayCompat;->getCurrentDisplaySizeFromWorkarounds(Landroid/content/Context;Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v1

    .line 253
    .local v1, "workaroundSize":Landroid/graphics/Point;
    if-eqz v1, :cond_0

    invoke-static {v0, v1}, Landroidx/core/view/DisplayCompat$Api23Impl;->physicalSizeEquals(Landroid/view/Display$Mode;Landroid/graphics/Point;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 255
    new-instance v2, Landroidx/core/view/DisplayCompat$ModeCompat;

    invoke-direct {v2, v0, v1}, Landroidx/core/view/DisplayCompat$ModeCompat;-><init>(Landroid/view/Display$Mode;Landroid/graphics/Point;)V

    goto :goto_0

    .line 254
    :cond_0
    new-instance v2, Landroidx/core/view/DisplayCompat$ModeCompat;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Landroidx/core/view/DisplayCompat$ModeCompat;-><init>(Landroid/view/Display$Mode;Z)V

    .line 253
    :goto_0
    return-object v2
.end method

.method public static getSupportedModes(Landroid/content/Context;Landroid/view/Display;)[Landroidx/core/view/DisplayCompat$ModeCompat;
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "display"    # Landroid/view/Display;

    .line 261
    invoke-virtual {p1}, Landroid/view/Display;->getSupportedModes()[Landroid/view/Display$Mode;

    move-result-object v0

    .line 262
    .local v0, "supportedModes":[Landroid/view/Display$Mode;
    array-length v1, v0

    new-array v1, v1, [Landroidx/core/view/DisplayCompat$ModeCompat;

    .line 264
    .local v1, "supportedModesCompat":[Landroidx/core/view/DisplayCompat$ModeCompat;
    invoke-virtual {p1}, Landroid/view/Display;->getMode()Landroid/view/Display$Mode;

    move-result-object v2

    .line 265
    .local v2, "currentMode":Landroid/view/Display$Mode;
    invoke-static {p0, p1}, Landroidx/core/view/DisplayCompat;->getCurrentDisplaySizeFromWorkarounds(Landroid/content/Context;Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v3

    .line 268
    .local v3, "workaroundSize":Landroid/graphics/Point;
    if-eqz v3, :cond_1

    invoke-static {v2, v3}, Landroidx/core/view/DisplayCompat$Api23Impl;->physicalSizeEquals(Landroid/view/Display$Mode;Landroid/graphics/Point;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 276
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v5, v0

    if-ge v4, v5, :cond_2

    .line 278
    aget-object v5, v0, v4

    invoke-static {v5, v2}, Landroidx/core/view/DisplayCompat$Api23Impl;->physicalSizeEquals(Landroid/view/Display$Mode;Landroid/view/Display$Mode;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 279
    new-instance v5, Landroidx/core/view/DisplayCompat$ModeCompat;

    aget-object v6, v0, v4

    invoke-direct {v5, v6, v3}, Landroidx/core/view/DisplayCompat$ModeCompat;-><init>(Landroid/view/Display$Mode;Landroid/graphics/Point;)V

    goto :goto_1

    .line 280
    :cond_0
    new-instance v5, Landroidx/core/view/DisplayCompat$ModeCompat;

    aget-object v6, v0, v4

    const/4 v7, 0x0

    invoke-direct {v5, v6, v7}, Landroidx/core/view/DisplayCompat$ModeCompat;-><init>(Landroid/view/Display$Mode;Z)V

    :goto_1
    aput-object v5, v1, v4

    .line 276
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 270
    .end local v4    # "i":I
    :cond_1
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_2
    array-length v5, v0

    if-ge v4, v5, :cond_2

    .line 271
    aget-object v5, v0, v4

    invoke-static {v5, v2}, Landroidx/core/view/DisplayCompat$Api23Impl;->physicalSizeEquals(Landroid/view/Display$Mode;Landroid/view/Display$Mode;)Z

    move-result v5

    .line 272
    .local v5, "isNative":Z
    new-instance v6, Landroidx/core/view/DisplayCompat$ModeCompat;

    aget-object v7, v0, v4

    invoke-direct {v6, v7, v5}, Landroidx/core/view/DisplayCompat$ModeCompat;-><init>(Landroid/view/Display$Mode;Z)V

    aput-object v6, v1, v4

    .line 270
    .end local v5    # "isNative":Z
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 283
    .end local v4    # "i":I
    :cond_2
    return-object v1
.end method

.method static isCurrentModeTheLargestMode(Landroid/view/Display;)Z
    .registers 9
    .param p0, "display"    # Landroid/view/Display;

    .line 287
    invoke-virtual {p0}, Landroid/view/Display;->getMode()Landroid/view/Display$Mode;

    move-result-object v0

    .line 288
    .local v0, "currentMode":Landroid/view/Display$Mode;
    invoke-virtual {p0}, Landroid/view/Display;->getSupportedModes()[Landroid/view/Display$Mode;

    move-result-object v1

    .line 289
    .local v1, "supportedModes":[Landroid/view/Display$Mode;
    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v5, v1, v4

    .line 290
    .local v5, "supportedMode":Landroid/view/Display$Mode;
    invoke-virtual {v0}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v6

    invoke-virtual {v5}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v7

    if-lt v6, v7, :cond_0

    .line 291
    invoke-virtual {v0}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v6

    invoke-virtual {v5}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v7

    if-lt v6, v7, :cond_0

    .line 289
    .end local v5    # "supportedMode":Landroid/view/Display$Mode;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 292
    .restart local v5    # "supportedMode":Landroid/view/Display$Mode;
    :cond_0
    return v3

    .line 295
    .end local v5    # "supportedMode":Landroid/view/Display$Mode;
    :cond_1
    const/4 v2, 0x1

    return v2
.end method

.method static physicalSizeEquals(Landroid/view/Display$Mode;Landroid/graphics/Point;)Z
    .registers 4
    .param p0, "mode"    # Landroid/view/Display$Mode;
    .param p1, "size"    # Landroid/graphics/Point;

    .line 303
    invoke-virtual {p0}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v0

    iget v1, p1, Landroid/graphics/Point;->x:I

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v0

    iget v1, p1, Landroid/graphics/Point;->y:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 304
    :cond_0
    invoke-virtual {p0}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v0

    iget v1, p1, Landroid/graphics/Point;->y:I

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v0

    iget v1, p1, Landroid/graphics/Point;->x:I

    if-ne v0, v1, :cond_1

    :goto_0
    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    .line 303
    :goto_1
    return v0
.end method

.method static physicalSizeEquals(Landroid/view/Display$Mode;Landroid/view/Display$Mode;)Z
    .registers 4
    .param p0, "mode"    # Landroid/view/Display$Mode;
    .param p1, "otherMode"    # Landroid/view/Display$Mode;

    .line 312
    invoke-virtual {p0}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 313
    invoke-virtual {p0}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 312
    :goto_0
    return v0
.end method
