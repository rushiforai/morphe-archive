.class public abstract Lvj6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    sput-object v0, Lvj6;->a:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    return-void
.end method

.method public static declared-synchronized a(FFFFLandroid/graphics/Canvas;I)V
    .registers 10

    const-class v1, Lvj6;

    monitor-enter v1

    move v0, p5

    :try_start_4
    sget-object p5, Lvj6;->a:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p5, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {p5, v0}, Landroid/graphics/Paint;->setColor(I)V

    move v3, p1

    move p1, p0

    move-object p0, p4

    move p4, p3

    move p3, p2

    move p2, v3

    invoke-virtual/range {p0 .. p5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
    :try_end_17
    .catchall {:try_start_4 .. :try_end_17} :catchall_1b

    monitor-exit v1

    return-void

    :goto_19
    :try_start_19
    monitor-exit v1
    :try_end_1a
    .catchall {:try_start_19 .. :try_end_1a} :catchall_1b

    throw p0

    :catchall_1b
    move-exception v0

    move-object p0, v0

    goto :goto_19
.end method
