.class public Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public a:Ll/pj80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pj80<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/pj80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pj80<",
            "Landroid/graphics/Matrix;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/pj80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pj80<",
            "Landroid/graphics/Path;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/pj80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pj80<",
            "Landroid/graphics/Paint;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->e:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/pj80;

    .line 7
    .line 8
    const/4 v0, 0x4

    .line 9
    invoke-direct {p1, v0}, Ll/pj80;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->a:Ll/pj80;

    .line 13
    .line 14
    new-instance p1, Ll/pj80;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-direct {p1, v0}, Ll/pj80;-><init>(I)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->b:Ll/pj80;

    .line 21
    .line 22
    new-instance p1, Ll/pj80;

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    invoke-direct {p1, v0}, Ll/pj80;-><init>(I)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->c:Ll/pj80;

    .line 29
    .line 30
    new-instance p1, Ll/pj80;

    .line 31
    .line 32
    const/4 v0, 0x5

    .line 33
    invoke-direct {p1, v0}, Ll/pj80;-><init>(I)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->d:Ll/pj80;

    .line 37
    .line 38
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;Ll/ius;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;-><init>(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;)Landroid/graphics/Rect;
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x0

    .line 10
    if-le p0, p1, :cond_0

    .line 11
    .line 12
    sub-int/2addr p0, p1

    .line 13
    div-int/lit8 p0, p0, 0x2

    .line 14
    .line 15
    add-int v1, p0, p1

    .line 16
    .line 17
    move v3, v0

    .line 18
    move v0, p0

    .line 19
    move p0, v1

    .line 20
    move v1, v3

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    if-le p1, p0, :cond_1

    .line 23
    .line 24
    sub-int/2addr p1, p0

    .line 25
    div-int/lit8 p1, p1, 0x2

    .line 26
    .line 27
    add-int v1, p1, p0

    .line 28
    .line 29
    move v3, v1

    .line 30
    move v1, p1

    .line 31
    move p1, v3

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move v1, v0

    .line 34
    :goto_0
    new-instance v2, Landroid/graphics/Rect;

    .line 35
    .line 36
    invoke-direct {v2, v0, v1, p0, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 37
    .line 38
    .line 39
    return-object v2
.end method

.method public b(Landroid/graphics/Matrix;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Matrix;->reset()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->b:Ll/pj80;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/pj80;->release(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public c()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->b:Ll/pj80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pj80;->acquire()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/graphics/Matrix;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Landroid/graphics/Matrix;

    .line 12
    .line 13
    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-object p0
.end method

.method public d(Landroid/graphics/Paint;)I
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p1, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 6
    .line 7
    not-int v0, p1

    .line 8
    not-int p1, p1

    .line 9
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 10
    .line 11
    not-int v1, v1

    .line 12
    sub-int/2addr p1, v1

    .line 13
    sub-int/2addr v0, p1

    .line 14
    iget p1, p0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 15
    .line 16
    iget p0, p0, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 17
    .line 18
    sub-int/2addr p1, p0

    .line 19
    sub-int/2addr v0, p1

    .line 20
    return v0
.end method

.method public e(Landroid/graphics/Paint;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Paint;->reset()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->d:Ll/pj80;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/pj80;->release(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f()Landroid/graphics/Paint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->d:Ll/pj80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pj80;->acquire()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/graphics/Paint;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Landroid/graphics/Paint;

    .line 12
    .line 13
    invoke-direct {p0}, Landroid/graphics/Paint;-><init>()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-object p0
.end method

.method public g(Landroid/graphics/Path;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->c:Ll/pj80;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/pj80;->release(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public h()Landroid/graphics/Path;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->c:Ll/pj80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pj80;->acquire()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/graphics/Path;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Landroid/graphics/Path;

    .line 12
    .line 13
    invoke-direct {p0}, Landroid/graphics/Path;-><init>()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-object p0
.end method

.method public i(Landroid/graphics/RectF;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/graphics/RectF;->setEmpty()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->a:Ll/pj80;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/pj80;->release(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j()Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->a:Ll/pj80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pj80;->acquire()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/graphics/RectF;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {p0}, Landroid/graphics/RectF;-><init>()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-object p0
.end method
