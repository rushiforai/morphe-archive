.class public Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static final c:Landroid/graphics/Paint;


# instance fields
.field public a:Z

.field public b:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;->c:Landroid/graphics/Paint;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;->a:Z

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;->b:J

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;->c:Landroid/graphics/Paint;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;->a:Z

    return p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;)F
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;->d()F

    move-result p0

    return p0
.end method

.method public static bridge synthetic c()Landroid/graphics/Paint;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;->c:Landroid/graphics/Paint;

    return-object v0
.end method


# virtual methods
.method public final d()F
    .locals 6

    .line 1
    invoke-static {}, Ll/a2j0;->h()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;->b:J

    .line 6
    .line 7
    const-wide/16 v4, 0x0

    .line 8
    .line 9
    cmp-long v2, v2, v4

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;->b:J

    .line 14
    .line 15
    :cond_0
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;->b:J

    .line 16
    .line 17
    sub-long/2addr v0, v2

    .line 18
    long-to-float p0, v0

    .line 19
    const/high16 v0, 0x44fa0000    # 2000.0f

    .line 20
    .line 21
    rem-float/2addr p0, v0

    .line 22
    float-to-int p0, p0

    .line 23
    int-to-float p0, p0

    .line 24
    const/high16 v0, 0x43fa0000    # 500.0f

    .line 25
    .line 26
    cmpg-float v1, p0, v0

    .line 27
    .line 28
    if-gez v1, :cond_1

    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_1
    sub-float/2addr p0, v0

    .line 33
    const v0, 0x44bb8000    # 1500.0f

    .line 34
    .line 35
    .line 36
    div-float/2addr p0, v0

    .line 37
    return p0
.end method
