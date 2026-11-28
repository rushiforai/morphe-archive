.class public final Lcom/waze/gw/AaStreetRendererBridge;
.super Ljava/lang/Object;
.source "WazeSource"

# Draws a street name into Android Auto's street pill: the same bitmap builder, bitmap wrapper and widget state
# Waze uses (5.27.90.900: car_lib/j/b/a/d, map/dq, bq/a/c, WazeMapWidgetNativeRenderer.g). 5.24 names:
# car_lib/h/b/a/d, map/eq, bl/a/c.

.method public static render(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/String;)Z
    .locals 6

    :try_start_0
    check-cast p1, Lcom/waze/map/isolated/WazeMapWidgetNativeRenderer;

    new-instance v0, Lcom/waze/car_lib/j/b/a/d;
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    move-object v1, p0
    move-object v2, p2
    const/4 v3, 0x0
    const v4, -0xe6892e
    const/4 v5, -0x1
    invoke-virtual/range {v0 .. v5}, Lcom/waze/car_lib/j/b/a/d;->a(Landroid/content/Context;Ljava/lang/String;ZII)Landroid/graphics/Bitmap;
    move-result-object v0

    new-instance v1, Lcom/waze/map/dq;
    invoke-direct {v1, v0}, Lcom/waze/map/dq;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v2, Lcom/waze/bq/a/c;
    const/4 v3, 0x0
    const/4 v4, 0x1
    invoke-direct {v2, v3, v4, v1}, Lcom/waze/bq/a/c;-><init>(ZZLcom/waze/map/b/ba;)V
    invoke-virtual {p1, v2}, Lcom/waze/map/isolated/WazeMapWidgetNativeRenderer;->g(Lcom/waze/bq/a/c;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1
    return v0

    :catch_0
    move-exception v0
    const/4 v0, 0x0
    return v0
.end method
