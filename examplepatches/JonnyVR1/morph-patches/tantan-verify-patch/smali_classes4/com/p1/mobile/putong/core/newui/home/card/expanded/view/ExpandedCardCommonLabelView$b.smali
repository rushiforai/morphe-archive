.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:Z

.field public d:Z

.field public e:Landroid/graphics/RectF;

.field public f:Landroid/graphics/RectF;

.field public g:F

.field public h:F

.field public i:Ljava/lang/String;

.field public j:Landroid/graphics/Bitmap;

.field public k:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILandroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->c:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->d:Z

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->a:Ljava/lang/String;

    .line 10
    .line 11
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->b:I

    .line 12
    .line 13
    new-instance v1, Landroid/graphics/RectF;

    .line 14
    .line 15
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->e:Landroid/graphics/RectF;

    .line 19
    .line 20
    new-instance v1, Landroid/graphics/RectF;

    .line 21
    .line 22
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->f:Landroid/graphics/RectF;

    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->i:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->o()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->j:Landroid/graphics/Bitmap;

    .line 44
    .line 45
    new-instance p1, Landroid/graphics/Rect;

    .line 46
    .line 47
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->j:Landroid/graphics/Bitmap;

    .line 48
    .line 49
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->j:Landroid/graphics/Bitmap;

    .line 54
    .line 55
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    invoke-direct {p1, v0, v0, p2, p3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 60
    .line 61
    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->k:Landroid/graphics/Rect;

    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->e:Landroid/graphics/RectF;

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->c:Z

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->j:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->f:Landroid/graphics/RectF;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->k:Landroid/graphics/Rect;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->a:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->d:Z

    return p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->i:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->g:F

    return p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->h:F

    return p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->d:Z

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->i:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->g:F

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->h:F

    return-void
.end method


# virtual methods
.method public o()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->b:I

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    if-eq p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public p(Z)Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->c:Z

    .line 2
    .line 3
    return-object p0
.end method
