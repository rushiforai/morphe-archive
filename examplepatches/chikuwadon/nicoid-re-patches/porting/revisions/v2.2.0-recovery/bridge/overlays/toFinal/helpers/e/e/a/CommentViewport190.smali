.class public final Le/e/a/CommentViewport190;
.super Ljava/lang/Object;
.source "CommentViewport190.java"


# static fields
.field private static final CLIP_RECT117:Ljava/lang/ThreadLocal;

.field private static final FIXED120:Ljava/lang/ThreadLocal;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Le/e/a/CommentViewport190;->CLIP_RECT117:Ljava/lang/ThreadLocal;

    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Le/e/a/CommentViewport190;->FIXED120:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static begin(Ljava/lang/Object;Landroid/graphics/Canvas;)V
    .registers 3

    .line 5
    invoke-static {}, Le/e/a/CommentViewport190;->fixedAbort120()V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    instance-of v0, p0, Landroid/view/View;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/view/View;

    invoke-static {p0}, Le/e/a/CommentViewport190;->clipBounds117(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    iget v0, p0, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    iget p0, p0, Landroid/graphics/Rect;->top:I

    int-to-float p0, p0

    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_0
    return-void
.end method

.method private static clipBounds117(Landroid/view/View;)Landroid/graphics/Rect;
    .registers 4

    sget-object v0, Le/e/a/CommentViewport190;->CLIP_RECT117:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Rect;

    if-nez v1, :cond_0

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_0
    invoke-virtual {p0, v1}, Landroid/view/View;->getClipBounds(Landroid/graphics/Rect;)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v1, 0x0

    :cond_1
    return-object v1
.end method

.method public static end(Landroid/graphics/Canvas;)V
    .registers 1

    .line 6
    invoke-virtual {p0}, Landroid/graphics/Canvas;->restore()V

    invoke-static {p0}, Le/e/a/CommentViewport190;->fixedEnd120(Landroid/graphics/Canvas;)V

    return-void
.end method

.method static fixedAbort120()V
    .registers 4

    .line 18
    sget-object v0, Le/e/a/CommentViewport190;->FIXED120:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    if-eqz v0, :cond_0

    const/4 v1, 0x2

    const-wide/16 v2, 0x0

    aput-wide v2, v0, v1

    :cond_0
    return-void
.end method

.method static fixedEnd120(Landroid/graphics/Canvas;)V
    .registers 16

    .line 20
    sget-object v0, Le/e/a/CommentViewport190;->FIXED120:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    .line 21
    if-eqz v0, :cond_3

    const/4 v1, 0x2

    aget-wide v2, v0, v1

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_3

    .line 22
    aget-wide v2, v0, v1

    aput-wide v4, v0, v1

    .line 23
    const/4 v1, 0x1

    aget-wide v6, v0, v1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    int-to-long v8, p0

    cmp-long p0, v6, v8

    if-eqz p0, :cond_0

    return-void

    .line 24
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    sub-long v1, v6, v2

    .line 25
    cmp-long p0, v1, v4

    if-gez p0, :cond_1

    return-void

    .line 26
    :cond_1
    const/4 p0, 0x4

    aget-wide v8, v0, p0

    add-long/2addr v8, v1

    aput-wide v8, v0, p0

    const/4 v3, 0x5

    aget-wide v8, v0, v3

    invoke-static {v8, v9, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    aput-wide v1, v0, v3

    const/4 v1, 0x6

    aget-wide v8, v0, v1

    const-wide/16 v10, 0x1

    add-long/2addr v8, v10

    aput-wide v8, v0, v1

    const/4 v2, 0x7

    aget-wide v8, v0, v2

    const/16 v10, 0x9

    aget-wide v11, v0, v10

    add-long/2addr v8, v11

    aput-wide v8, v0, v2

    const/16 v8, 0x8

    aget-wide v11, v0, v8

    aget-wide v9, v0, v10

    invoke-static {v11, v12, v9, v10}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v9

    aput-wide v9, v0, v8

    .line 27
    const/4 v9, 0x3

    aget-wide v10, v0, v9

    sub-long v10, v6, v10

    const-wide/32 v12, 0x77359400

    cmp-long v10, v10, v12

    if-ltz v10, :cond_2

    .line 28
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "owner="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const/4 v11, 0x0

    aget-wide v11, v0, v11

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " frames="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    aget-wide v11, v0, v1

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " candidateAvg="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    aget-wide v11, v0, v2

    long-to-double v11, v11

    aget-wide v13, v0, v1

    long-to-double v13, v13

    div-double/2addr v11, v13

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " candidateMax="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    aget-wide v11, v0, v8

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " fixedAvgMs="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    aget-wide v11, v0, p0

    long-to-double v11, v11

    aget-wide v13, v0, v1

    long-to-double v13, v13

    div-double/2addr v11, v13

    const-wide v13, 0x412e848000000000L    # 1000000.0

    div-double/2addr v11, v13

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " fixedMaxMs="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    aget-wide v11, v0, v3

    long-to-double v11, v11

    div-double/2addr v11, v13

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " windowMs="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    aget-wide v11, v0, v9

    sub-long v11, v6, v11

    long-to-double v11, v11

    div-double/2addr v11, v13

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const-string v11, "nicoid-fixed120"

    invoke-static {v11, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    aput-wide v6, v0, v9

    aput-wide v4, v0, v8

    aput-wide v4, v0, v2

    aput-wide v4, v0, v1

    aput-wide v4, v0, v3

    aput-wide v4, v0, p0

    .line 31
    :cond_2
    return-void

    .line 21
    :cond_3
    return-void
.end method

.method static fixedStart120(Ljava/lang/Object;Landroid/graphics/Canvas;I)V
    .registers 16

    .line 9
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 10
    sget-object v2, Le/e/a/CommentViewport190;->FIXED120:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [J

    .line 11
    if-nez v2, :cond_0

    const/16 v2, 0xa

    new-array v2, v2, [J

    sget-object v3, Le/e/a/CommentViewport190;->FIXED120:Ljava/lang/ThreadLocal;

    invoke-virtual {v3, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 12
    :cond_0
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    .line 13
    const/4 v3, 0x0

    aget-wide v4, v2, v3

    int-to-long v6, p0

    cmp-long p0, v4, v6

    const-wide/16 v4, 0x0

    const/4 v8, 0x3

    if-nez p0, :cond_1

    aget-wide v9, v2, v8

    cmp-long p0, v9, v4

    if-eqz p0, :cond_1

    aget-wide v9, v2, v8

    sub-long v9, v0, v9

    const-wide v11, 0x2540be400L

    cmp-long p0, v9, v11

    if-gtz p0, :cond_1

    aget-wide v9, v2, v8

    sub-long v9, v0, v9

    cmp-long p0, v9, v4

    if-ltz p0, :cond_1

    goto :goto_0

    .line 14
    :cond_1
    aput-wide v6, v2, v3

    aput-wide v0, v2, v8

    const/16 p0, 0x8

    aput-wide v4, v2, p0

    const/4 p0, 0x7

    aput-wide v4, v2, p0

    const/4 p0, 0x6

    aput-wide v4, v2, p0

    const/4 p0, 0x5

    aput-wide v4, v2, p0

    const/4 p0, 0x4

    aput-wide v4, v2, p0

    .line 16
    :goto_0
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    int-to-long p0, p0

    const/4 v3, 0x1

    aput-wide p0, v2, v3

    const/4 p0, 0x2

    aput-wide v0, v2, p0

    const/16 p0, 0x9

    int-to-long p1, p2

    aput-wide p1, v2, p0

    .line 17
    return-void
.end method

.method public static height(Ljava/lang/Object;Landroid/graphics/Canvas;)I
    .registers 3

    .line 8
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/CommentViewport190;->size(Ljava/lang/Object;IZ)I

    move-result p0

    return p0
.end method

.method static size(Ljava/lang/Object;IZ)I
    .registers 4

    .line 9
    instance-of v0, p0, Landroid/view/View;

    if-nez v0, :cond_0

    return p1

    :cond_0
    check-cast p0, Landroid/view/View;

    if-eqz p2, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    :goto_0
    invoke-static {p0}, Le/e/a/CommentViewport190;->clipBounds117(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object p0

    if-eqz p0, :cond_3

    if-eqz p2, :cond_2

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result p0

    goto :goto_1

    :cond_2
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result p0

    :goto_1
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_3
    if-lez v0, :cond_4

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    :cond_4
    return p1
.end method

.method public static width(Ljava/lang/Object;Landroid/graphics/Canvas;)I
    .registers 3

    .line 7
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result p1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Le/e/a/CommentViewport190;->size(Ljava/lang/Object;IZ)I

    move-result p0

    return p0
.end method
