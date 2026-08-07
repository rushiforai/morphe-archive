.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Landroid/view/GestureDetector;

.field public h:Landroid/graphics/Paint;

.field public i:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->c:I

    .line 6
    .line 7
    const/high16 p1, 0x41000000    # 8.0f

    .line 8
    .line 9
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->d:I

    .line 14
    .line 15
    const/high16 p1, 0x40600000    # 3.5f

    .line 16
    .line 17
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->e:I

    .line 22
    .line 23
    const/high16 p1, 0x40900000    # 4.5f

    .line 24
    .line 25
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->f:I

    .line 30
    .line 31
    new-instance p1, Landroid/graphics/Paint;

    .line 32
    .line 33
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->h:Landroid/graphics/Paint;

    .line 37
    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 39
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 40
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->c:I

    const/high16 p1, 0x41000000    # 8.0f

    .line 41
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->d:I

    const/high16 p1, 0x40600000    # 3.5f

    .line 42
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->e:I

    const/high16 p1, 0x40900000    # 4.5f

    .line 43
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->f:I

    .line 44
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->h:Landroid/graphics/Paint;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 45
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 46
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->c:I

    const/high16 p1, 0x41000000    # 8.0f

    .line 47
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->d:I

    const/high16 p1, 0x40600000    # 3.5f

    .line 48
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->e:I

    const/high16 p1, 0x40900000    # 4.5f

    .line 49
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->f:I

    .line 50
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->h:Landroid/graphics/Paint;

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->a:I

    return p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->b:I

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->d:I

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->c:I

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->c:I

    return-void
.end method


# virtual methods
.method public f(IIILl/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->i:Ll/y20;

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->a:I

    .line 4
    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->c:I

    .line 6
    .line 7
    if-le p3, p2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move p2, p3

    .line 11
    :goto_0
    add-int/2addr p1, p2

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->b:I

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->h:Landroid/graphics/Paint;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    sget p3, Ll/k9c0;->n:I

    .line 21
    .line 22
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->g()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final g()V
    .locals 2

    .line 1
    new-instance v0, Landroid/view/GestureDetector;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroid/view/GestureDetector;-><init>(Landroid/view/GestureDetector$OnGestureListener;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->g:Landroid/view/GestureDetector;

    .line 12
    .line 13
    return-void
.end method

.method public h(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->c:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->g()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->c:I

    .line 5
    .line 6
    int-to-float v2, v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->f:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    int-to-float v4, v0

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v5, v0

    .line 16
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->e:I

    .line 17
    .line 18
    int-to-float v6, v0

    .line 19
    int-to-float v7, v0

    .line 20
    iget-object v8, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->h:Landroid/graphics/Paint;

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    move-object v1, p1

    .line 24
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v2, 0x3

    .line 13
    if-ne v0, v2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->g:Landroid/view/GestureDetector;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->i:Ll/y20;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->i:Ll/y20;

    .line 32
    .line 33
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->c:I

    .line 34
    .line 35
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->a:I

    .line 36
    .line 37
    sub-int/2addr v0, p0

    .line 38
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    return v1
.end method
