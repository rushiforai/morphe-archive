.class public Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:[I

.field public b:[F

.field public c:F

.field public d:J

.field public e:F

.field public f:I

.field public g:F

.field public h:I

.field public i:I

.field public j:Landroid/animation/TimeInterpolator;


# direct methods
.method public constructor <init>([I[F)V
    .locals 2
    .param p1    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [F
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x41f00000    # 30.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->c:F

    .line 7
    .line 8
    const-wide/16 v0, 0x7d0

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->d:J

    .line 11
    .line 12
    const/high16 v0, 0x42c80000    # 100.0f

    .line 13
    .line 14
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    int-to-float v0, v0

    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->e:F

    .line 20
    .line 21
    const/4 v0, -0x1

    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->f:I

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->g:F

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->h:I

    .line 29
    .line 30
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->i:I

    .line 31
    .line 32
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 33
    .line 34
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->j:Landroid/animation/TimeInterpolator;

    .line 38
    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->a:[I

    .line 40
    .line 41
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->b:[F

    .line 42
    .line 43
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->a:[I

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->d:J

    return-wide v0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)Landroid/animation/TimeInterpolator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->j:Landroid/animation/TimeInterpolator;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->b:[F

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->g:F

    return p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->i:I

    return p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->f:I

    return p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->c:F

    return p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->h:I

    return p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->e:F

    return p0
.end method


# virtual methods
.method public k()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->f:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    if-eq p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public l(J)Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->d:J

    .line 2
    .line 3
    return-object p0
.end method

.method public m(F)Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->g:F

    .line 2
    .line 3
    return-object p0
.end method

.method public n(F)Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->c:F

    .line 2
    .line 3
    return-object p0
.end method

.method public o(I)Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->h:I

    .line 2
    .line 3
    return-object p0
.end method

.method public p(I)Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->e:F

    .line 3
    .line 4
    return-object p0
.end method
