.class public Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;
    }
.end annotation


# static fields
.field public static final K0:I


# instance fields
.field public A:Landroid/graphics/RectF;

.field public B:Landroid/graphics/RectF;

.field public C:F

.field public D:F

.field public E:F

.field public E0:Z

.field public F:J

.field public F0:Z

.field public G:J

.field public G0:Z

.field public H:Landroid/graphics/Paint;

.field public H0:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;

.field public I:F

.field public I0:I

.field public J:F

.field public J0:Landroid/os/Handler;

.field public K:F

.field public L:F

.field public M:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public N:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public O:I

.field public P:I

.field public Q:I

.field public R:I

.field public S:Landroid/content/res/ColorStateList;

.field public T:Landroid/content/res/ColorStateList;

.field public U:Landroid/content/res/ColorStateList;

.field public V:Landroid/content/res/ColorStateList;

.field public W:I

.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Paint;

.field public c:I

.field public d:I

.field public e:I

.field public f:Landroid/graphics/Paint;

.field public g:F

.field public h:F

.field public i:F

.field public j:F

.field public k:F

.field public k0:I

.field public l:F

.field public m:F

.field public n:F

.field public o:F

.field public p:F

.field public p0:J

.field public q:F

.field public r:F

.field public s:F

.field public t:F

.field public u:F

.field public v:F

.field public w:F

.field public x:Landroid/graphics/Paint;

.field public y:F

.field public z:Landroid/graphics/RectF;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/high16 v0, 0x403e000000000000L    # 30.0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    double-to-int v0, v0

    .line 8
    sput v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->K0:I

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 65
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 64
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/high16 p3, 0x40800000    # 4.0f

    .line 5
    .line 6
    invoke-static {p3}, Ll/bnl0;->w(F)I

    .line 7
    .line 8
    .line 9
    move-result p3

    .line 10
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->e:I

    .line 11
    .line 12
    new-instance p3, Landroid/graphics/RectF;

    .line 13
    .line 14
    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->z:Landroid/graphics/RectF;

    .line 18
    .line 19
    new-instance p3, Landroid/graphics/RectF;

    .line 20
    .line 21
    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->A:Landroid/graphics/RectF;

    .line 25
    .line 26
    new-instance p3, Landroid/graphics/RectF;

    .line 27
    .line 28
    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->B:Landroid/graphics/RectF;

    .line 32
    .line 33
    const/4 p3, 0x0

    .line 34
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->O:I

    .line 35
    .line 36
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->P:I

    .line 37
    .line 38
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->Q:I

    .line 39
    .line 40
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->R:I

    .line 41
    .line 42
    const/16 p3, 0x64

    .line 43
    .line 44
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->W:I

    .line 45
    .line 46
    const/16 p3, 0x3a98

    .line 47
    .line 48
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->k0:I

    .line 49
    .line 50
    new-instance p3, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$a;

    .line 51
    .line 52
    invoke-direct {p3, p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$a;-><init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;)V

    .line 53
    .line 54
    .line 55
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J0:Landroid/os/Handler;

    .line 56
    .line 57
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->E(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->F()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->q()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->r()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->s()V

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->t()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->u()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->v()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->w()V

    return-void
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->x()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->y()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->z()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->O()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->S()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->T()V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->V()V

    return-void
.end method


# virtual methods
.method public final A()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->W:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->I()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :pswitch_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->H()V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :pswitch_1
    const-string v0, "android.permission.RECORD_AUDIO"

    .line 15
    .line 16
    filled-new-array {v0}, [Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    filled-new-array {v0}, [Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/4 v1, 0x1

    .line 44
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J()V

    .line 59
    .line 60
    .line 61
    :goto_0
    :pswitch_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->H0:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;

    .line 62
    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->W:I

    .line 66
    .line 67
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;->a(I)V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-void

    .line 71
    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public B()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final C(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->D()Landroid/graphics/Paint;

    .line 2
    .line 3
    .line 4
    move-result-object v5

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v6

    .line 11
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/Float;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->B:Landroid/graphics/RectF;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/high16 v2, 0x42b80000    # 92.0f

    .line 30
    .line 31
    sub-float v2, v0, v2

    .line 32
    .line 33
    const/high16 v3, 0x40800000    # 4.0f

    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    move-object v0, p1

    .line 37
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-void
.end method

.method public final D()Landroid/graphics/Paint;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->S:Landroid/content/res/ColorStateList;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 17
    .line 18
    .line 19
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->y:F

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 22
    .line 23
    .line 24
    sget-object p0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method public final E(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    sget-object v0, Ll/shc0;->o:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget p2, Ll/shc0;->s:I

    .line 8
    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->c:I

    .line 10
    .line 11
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->c:I

    .line 16
    .line 17
    sget p2, Ll/shc0;->r:I

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->S:Landroid/content/res/ColorStateList;

    .line 24
    .line 25
    sget p2, Ll/shc0;->t:I

    .line 26
    .line 27
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->e:I

    .line 28
    .line 29
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->e:I

    .line 34
    .line 35
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->c:I

    .line 36
    .line 37
    sub-int/2addr v0, p2

    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->d:I

    .line 39
    .line 40
    sget p2, Ll/shc0;->u:I

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->T:Landroid/content/res/ColorStateList;

    .line 47
    .line 48
    sget p2, Ll/shc0;->q:I

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->U:Landroid/content/res/ColorStateList;

    .line 55
    .line 56
    sget p2, Ll/shc0;->p:I

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->V:Landroid/content/res/ColorStateList;

    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->T:Landroid/content/res/ColorStateList;

    .line 65
    .line 66
    const-string p2, "#FE7E1D"

    .line 67
    .line 68
    if-nez p1, :cond_0

    .line 69
    .line 70
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->T:Landroid/content/res/ColorStateList;

    .line 79
    .line 80
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->U:Landroid/content/res/ColorStateList;

    .line 81
    .line 82
    if-nez p1, :cond_1

    .line 83
    .line 84
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->U:Landroid/content/res/ColorStateList;

    .line 93
    .line 94
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->V:Landroid/content/res/ColorStateList;

    .line 95
    .line 96
    if-nez p1, :cond_2

    .line 97
    .line 98
    const-string p1, "#33FFFFFF"

    .line 99
    .line 100
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->V:Landroid/content/res/ColorStateList;

    .line 109
    .line 110
    :cond_2
    return-void
.end method

.method public final F()V
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->a:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->a:Landroid/graphics/Paint;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->S:Landroid/content/res/ColorStateList;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->a:Landroid/graphics/Paint;

    .line 24
    .line 25
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Landroid/graphics/Paint;

    .line 31
    .line 32
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->b:Landroid/graphics/Paint;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->b:Landroid/graphics/Paint;

    .line 41
    .line 42
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->S:Landroid/content/res/ColorStateList;

    .line 43
    .line 44
    invoke-virtual {v3}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->b:Landroid/graphics/Paint;

    .line 52
    .line 53
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 54
    .line 55
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 56
    .line 57
    .line 58
    new-instance v0, Landroid/graphics/Paint;

    .line 59
    .line 60
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->f:Landroid/graphics/Paint;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->f:Landroid/graphics/Paint;

    .line 69
    .line 70
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->U:Landroid/content/res/ColorStateList;

    .line 71
    .line 72
    invoke-virtual {v4}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->f:Landroid/graphics/Paint;

    .line 80
    .line 81
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 82
    .line 83
    .line 84
    new-instance v0, Landroid/graphics/Paint;

    .line 85
    .line 86
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 87
    .line 88
    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->x:Landroid/graphics/Paint;

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->x:Landroid/graphics/Paint;

    .line 95
    .line 96
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->T:Landroid/content/res/ColorStateList;

    .line 97
    .line 98
    invoke-virtual {v4}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->x:Landroid/graphics/Paint;

    .line 106
    .line 107
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 108
    .line 109
    .line 110
    new-instance v0, Landroid/graphics/Paint;

    .line 111
    .line 112
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 113
    .line 114
    .line 115
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->H:Landroid/graphics/Paint;

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->H:Landroid/graphics/Paint;

    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->V:Landroid/content/res/ColorStateList;

    .line 123
    .line 124
    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->H:Landroid/graphics/Paint;

    .line 132
    .line 133
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 134
    .line 135
    .line 136
    new-instance v0, Ljava/util/ArrayList;

    .line 137
    .line 138
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 139
    .line 140
    .line 141
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->M:Ljava/util/List;

    .line 142
    .line 143
    new-instance v0, Ljava/util/ArrayList;

    .line 144
    .line 145
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 146
    .line 147
    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N:Ljava/util/List;

    .line 149
    .line 150
    return-void
.end method

.method public final G()V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J0:Landroid/os/Handler;

    .line 2
    .line 3
    const/16 v0, 0x3ea

    .line 4
    .line 5
    const-wide/16 v1, 0x10

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public H()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J0:Landroid/os/Handler;

    .line 2
    .line 3
    const/16 v1, 0x3e7

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J0:Landroid/os/Handler;

    .line 9
    .line 10
    const/16 v1, 0x3e8

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->F0:Z

    .line 17
    .line 18
    new-instance v0, Ljava/lang/Long;

    .line 19
    .line 20
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 21
    .line 22
    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    const-wide/16 v3, 0x0

    .line 30
    .line 31
    cmp-long v1, v1, v3

    .line 32
    .line 33
    if-lez v1, :cond_0

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->M:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    :cond_0
    iput-wide v3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J0:Landroid/os/Handler;

    .line 43
    .line 44
    const/16 v0, 0x3e9

    .line 45
    .line 46
    const-wide/16 v1, 0x10

    .line 47
    .line 48
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public I()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->O:I

    .line 2
    .line 3
    div-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->Q:I

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->P:I

    .line 8
    .line 9
    div-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->R:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public J()V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->p0:J

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->E0:Z

    .line 8
    .line 9
    const-wide/16 v1, 0x10

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->F0:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G0:Z

    .line 17
    .line 18
    new-instance v0, Ljava/lang/Float;

    .line 19
    .line 20
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->E:F

    .line 21
    .line 22
    invoke-direct {v0, v3}, Ljava/lang/Float;-><init>(F)V

    .line 23
    .line 24
    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J0:Landroid/os/Handler;

    .line 31
    .line 32
    const/16 v0, 0x3e8

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    const/4 v0, 0x1

    .line 39
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->E0:Z

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J0:Landroid/os/Handler;

    .line 42
    .line 43
    const/16 v0, 0x3e7

    .line 44
    .line 45
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public K()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->M:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->M:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/lit8 v1, v1, -0x1

    .line 16
    .line 17
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-lez v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    add-int/lit8 v1, v1, -0x1

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->Q()V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->M:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->L()V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 57
    .line 58
    .line 59
    move-result-wide v2

    .line 60
    add-long/2addr v0, v2

    .line 61
    long-to-float v0, v0

    .line 62
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->k0:I

    .line 63
    .line 64
    int-to-float v1, v1

    .line 65
    div-float/2addr v0, v1

    .line 66
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->D:F

    .line 67
    .line 68
    const/high16 v1, 0x43b40000    # 360.0f

    .line 69
    .line 70
    mul-float/2addr v0, v1

    .line 71
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->E:F

    .line 72
    .line 73
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 76
    .line 77
    .line 78
    move-result-wide v2

    .line 79
    add-long/2addr v0, v2

    .line 80
    long-to-float v0, v0

    .line 81
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 82
    .line 83
    div-float/2addr v0, v1

    .line 84
    float-to-int v0, v0

    .line 85
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->I0:I

    .line 86
    .line 87
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->U(I)V

    .line 88
    .line 89
    .line 90
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 91
    .line 92
    .line 93
    :cond_2
    return-void
.end method

.method public L()V
    .locals 3

    .line 1
    const/16 v0, 0x64

    .line 2
    .line 3
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->W:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->E0:Z

    .line 7
    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->F0:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G0:Z

    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->I0:I

    .line 13
    .line 14
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->D:F

    .line 20
    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->E:F

    .line 22
    .line 23
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J:F

    .line 24
    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->L:F

    .line 26
    .line 27
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->g:F

    .line 28
    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->q:F

    .line 30
    .line 31
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->h:F

    .line 32
    .line 33
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->r:F

    .line 34
    .line 35
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->i:F

    .line 36
    .line 37
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->s:F

    .line 38
    .line 39
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->j:F

    .line 40
    .line 41
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->t:F

    .line 42
    .line 43
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->k:F

    .line 44
    .line 45
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->u:F

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->B:Landroid/graphics/RectF;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->z:Landroid/graphics/RectF;

    .line 50
    .line 51
    iget v2, v1, Landroid/graphics/RectF;->left:F

    .line 52
    .line 53
    iput v2, v0, Landroid/graphics/RectF;->left:F

    .line 54
    .line 55
    iget v2, v1, Landroid/graphics/RectF;->top:F

    .line 56
    .line 57
    iput v2, v0, Landroid/graphics/RectF;->top:F

    .line 58
    .line 59
    iget v2, v1, Landroid/graphics/RectF;->right:F

    .line 60
    .line 61
    iput v2, v0, Landroid/graphics/RectF;->right:F

    .line 62
    .line 63
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 64
    .line 65
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N:Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->M:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->R()V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public M()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->W:I

    .line 2
    .line 3
    return p0
.end method

.method public N()J
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->M:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Ljava/lang/Long;

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    add-long/2addr v0, v2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-wide v0
.end method

.method public final O()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->H0:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0x6b

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;->onEvent(II)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void

    .line 16
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J0:Landroid/os/Handler;

    .line 17
    .line 18
    const/16 v0, 0x3ea

    .line 19
    .line 20
    const-wide/16 v1, 0x10

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final P(Z)V
    .locals 4

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p1, v0, v2

    .line 8
    .line 9
    if-lez p1, :cond_0

    .line 10
    .line 11
    new-instance p1, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-direct {p1, v0, v1}, Ljava/lang/Long;-><init>(J)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->M:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 22
    .line 23
    :cond_0
    const/16 p1, 0x66

    .line 24
    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->W:I

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G()V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public final Q()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->H0:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x68

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;->onEvent(II)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final R()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->H0:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x6a

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;->onEvent(II)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final S()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J0:Landroid/os/Handler;

    .line 7
    .line 8
    const/16 v0, 0x3e9

    .line 9
    .line 10
    const-wide/16 v1, 0x10

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final T()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 6
    .line 7
    add-long/2addr v0, v2

    .line 8
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->k0:I

    .line 9
    .line 10
    int-to-long v2, v2

    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-gez v0, :cond_1

    .line 14
    .line 15
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->W:I

    .line 16
    .line 17
    const/16 v1, 0x65

    .line 18
    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J0:Landroid/os/Handler;

    .line 23
    .line 24
    const/16 v0, 0x3e7

    .line 25
    .line 26
    const-wide/16 v1, 0x10

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    iget-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 37
    .line 38
    add-long/2addr v0, v2

    .line 39
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->k0:I

    .line 40
    .line 41
    int-to-long v2, v2

    .line 42
    cmp-long v0, v0, v2

    .line 43
    .line 44
    if-ltz v0, :cond_2

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    goto :goto_1

    .line 48
    :cond_2
    const/4 v0, 0x0

    .line 49
    :goto_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->P(Z)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->A()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final U(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->H0:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x69

    .line 6
    .line 7
    invoke-interface {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;->onEvent(II)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final V()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 6
    .line 7
    add-long/2addr v0, v2

    .line 8
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->k0:I

    .line 9
    .line 10
    int-to-long v2, v2

    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-gez v0, :cond_1

    .line 14
    .line 15
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->W:I

    .line 16
    .line 17
    const/16 v1, 0x65

    .line 18
    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J0:Landroid/os/Handler;

    .line 23
    .line 24
    const/16 v0, 0x3e8

    .line 25
    .line 26
    const-wide/16 v1, 0x10

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    iget-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 37
    .line 38
    add-long/2addr v0, v2

    .line 39
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->k0:I

    .line 40
    .line 41
    int-to-long v2, v2

    .line 42
    cmp-long v0, v0, v2

    .line 43
    .line 44
    if-ltz v0, :cond_2

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    goto :goto_1

    .line 48
    :cond_2
    const/4 v0, 0x0

    .line 49
    :goto_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->P(Z)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->A()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final W()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->W:I

    .line 2
    .line 3
    const/16 v1, 0x64

    .line 4
    .line 5
    const/16 v2, 0x65

    .line 6
    .line 7
    if-eq v0, v1, :cond_2

    .line 8
    .line 9
    const/16 v1, 0x66

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    if-ne v0, v2, :cond_1

    .line 15
    .line 16
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->W:I

    .line 17
    .line 18
    :cond_1
    return-void

    .line 19
    :cond_2
    :goto_0
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->W:I

    .line 20
    .line 21
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->M:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getLastDuration()J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->M:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->M:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Long;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    return-wide v0

    .line 28
    :cond_0
    const-wide/16 v0, 0x0

    .line 29
    .line 30
    return-wide v0
.end method

.method public o()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->W()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->A()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->W:I

    .line 5
    .line 6
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->Q:I

    .line 7
    .line 8
    packed-switch v2, :pswitch_data_0

    .line 9
    .line 10
    .line 11
    int-to-float v2, v3

    .line 12
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->R:I

    .line 13
    .line 14
    int-to-float v3, v3

    .line 15
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->c:I

    .line 16
    .line 17
    int-to-float v4, v4

    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->a:Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-virtual {p1, v2, v3, v4, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :pswitch_0
    int-to-float v2, v3

    .line 25
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->R:I

    .line 26
    .line 27
    int-to-float v3, v3

    .line 28
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->L:F

    .line 29
    .line 30
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->H:Landroid/graphics/Paint;

    .line 31
    .line 32
    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->B:Landroid/graphics/RectF;

    .line 36
    .line 37
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->E:F

    .line 38
    .line 39
    const/4 v5, 0x0

    .line 40
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->x:Landroid/graphics/Paint;

    .line 41
    .line 42
    const/high16 v3, -0x3d4c0000    # -90.0f

    .line 43
    .line 44
    move-object v1, p1

    .line 45
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 46
    .line 47
    .line 48
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->q:F

    .line 49
    .line 50
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->r:F

    .line 51
    .line 52
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->s:F

    .line 53
    .line 54
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->t:F

    .line 55
    .line 56
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->u:F

    .line 57
    .line 58
    iget-object v8, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->f:Landroid/graphics/Paint;

    .line 59
    .line 60
    move v7, v6

    .line 61
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->C(Landroid/graphics/Canvas;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    nop

    .line 69
    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onMeasure(II)V
    .locals 6

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->O:I

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->P:I

    .line 15
    .line 16
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->O:I

    .line 17
    .line 18
    div-int/lit8 p2, p2, 0x2

    .line 19
    .line 20
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->Q:I

    .line 21
    .line 22
    div-int/lit8 p1, p1, 0x2

    .line 23
    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->R:I

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->a:Landroid/graphics/Paint;

    .line 27
    .line 28
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->e:I

    .line 29
    .line 30
    int-to-float p2, p2

    .line 31
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 32
    .line 33
    .line 34
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->O:I

    .line 35
    .line 36
    div-int/lit8 p1, p1, 0x2

    .line 37
    .line 38
    int-to-float p1, p1

    .line 39
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J:F

    .line 40
    .line 41
    const/high16 p1, 0x42380000    # 46.0f

    .line 42
    .line 43
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    int-to-float p1, p1

    .line 48
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->I:F

    .line 49
    .line 50
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J:F

    .line 51
    .line 52
    sub-float/2addr p2, p1

    .line 53
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    const/high16 p2, 0x40c00000    # 6.0f

    .line 58
    .line 59
    div-float/2addr p1, p2

    .line 60
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->K:F

    .line 61
    .line 62
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J:F

    .line 63
    .line 64
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->L:F

    .line 65
    .line 66
    invoke-static {p2}, Ll/bnl0;->w(F)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    int-to-float p1, p1

    .line 71
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->y:F

    .line 72
    .line 73
    const/high16 v0, 0x40000000    # 2.0f

    .line 74
    .line 75
    div-float v1, p1, v0

    .line 76
    .line 77
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->I:F

    .line 78
    .line 79
    sub-float/2addr v2, v1

    .line 80
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J:F

    .line 81
    .line 82
    sub-float/2addr v3, v1

    .line 83
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->x:Landroid/graphics/Paint;

    .line 84
    .line 85
    invoke-virtual {v4, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->z:Landroid/graphics/RectF;

    .line 89
    .line 90
    iput v1, p1, Landroid/graphics/RectF;->left:F

    .line 91
    .line 92
    iput v1, p1, Landroid/graphics/RectF;->top:F

    .line 93
    .line 94
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->O:I

    .line 95
    .line 96
    int-to-float v5, v4

    .line 97
    sub-float/2addr v5, v1

    .line 98
    iput v5, p1, Landroid/graphics/RectF;->right:F

    .line 99
    .line 100
    int-to-float v4, v4

    .line 101
    sub-float/2addr v4, v1

    .line 102
    iput v4, p1, Landroid/graphics/RectF;->bottom:F

    .line 103
    .line 104
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->A:Landroid/graphics/RectF;

    .line 105
    .line 106
    sub-float/2addr v3, v2

    .line 107
    add-float/2addr v3, v1

    .line 108
    iput v3, v4, Landroid/graphics/RectF;->left:F

    .line 109
    .line 110
    iput v3, v4, Landroid/graphics/RectF;->top:F

    .line 111
    .line 112
    mul-float/2addr v2, v0

    .line 113
    add-float v1, v3, v2

    .line 114
    .line 115
    iput v1, v4, Landroid/graphics/RectF;->right:F

    .line 116
    .line 117
    add-float/2addr v2, v3

    .line 118
    iput v2, v4, Landroid/graphics/RectF;->bottom:F

    .line 119
    .line 120
    iget p1, p1, Landroid/graphics/RectF;->left:F

    .line 121
    .line 122
    sub-float/2addr v3, p1

    .line 123
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    div-float/2addr p1, p2

    .line 128
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->C:F

    .line 129
    .line 130
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->B:Landroid/graphics/RectF;

    .line 131
    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->z:Landroid/graphics/RectF;

    .line 133
    .line 134
    iget v2, v1, Landroid/graphics/RectF;->left:F

    .line 135
    .line 136
    iput v2, p1, Landroid/graphics/RectF;->left:F

    .line 137
    .line 138
    iget v2, v1, Landroid/graphics/RectF;->top:F

    .line 139
    .line 140
    iput v2, p1, Landroid/graphics/RectF;->top:F

    .line 141
    .line 142
    iget v2, v1, Landroid/graphics/RectF;->right:F

    .line 143
    .line 144
    iput v2, p1, Landroid/graphics/RectF;->right:F

    .line 145
    .line 146
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 147
    .line 148
    iput v1, p1, Landroid/graphics/RectF;->bottom:F

    .line 149
    .line 150
    const/high16 p1, 0x41c00000    # 24.0f

    .line 151
    .line 152
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    int-to-float p1, p1

    .line 157
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->O:I

    .line 158
    .line 159
    div-int/lit8 v1, v1, 0x2

    .line 160
    .line 161
    int-to-float v1, v1

    .line 162
    div-float v2, p1, v0

    .line 163
    .line 164
    sub-float/2addr v1, v2

    .line 165
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->g:F

    .line 166
    .line 167
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->h:F

    .line 168
    .line 169
    add-float v2, v1, p1

    .line 170
    .line 171
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->i:F

    .line 172
    .line 173
    add-float/2addr v1, p1

    .line 174
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->j:F

    .line 175
    .line 176
    const/high16 p1, 0x40e00000    # 7.0f

    .line 177
    .line 178
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    int-to-float p1, p1

    .line 183
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->k:F

    .line 184
    .line 185
    const/high16 p1, 0x42300000    # 44.0f

    .line 186
    .line 187
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    int-to-float p1, p1

    .line 192
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->O:I

    .line 193
    .line 194
    div-int/lit8 v1, v1, 0x2

    .line 195
    .line 196
    int-to-float v1, v1

    .line 197
    div-float v0, p1, v0

    .line 198
    .line 199
    sub-float/2addr v1, v0

    .line 200
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->l:F

    .line 201
    .line 202
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->m:F

    .line 203
    .line 204
    add-float v2, v1, p1

    .line 205
    .line 206
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->n:F

    .line 207
    .line 208
    add-float/2addr p1, v1

    .line 209
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->o:F

    .line 210
    .line 211
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->p:F

    .line 212
    .line 213
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->g:F

    .line 214
    .line 215
    sub-float/2addr v1, p1

    .line 216
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    div-float/2addr p1, p2

    .line 221
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->v:F

    .line 222
    .line 223
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->p:F

    .line 224
    .line 225
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->k:F

    .line 226
    .line 227
    sub-float/2addr p1, v0

    .line 228
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    div-float/2addr p1, p2

    .line 233
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->w:F

    .line 234
    .line 235
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->g:F

    .line 236
    .line 237
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->q:F

    .line 238
    .line 239
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->h:F

    .line 240
    .line 241
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->r:F

    .line 242
    .line 243
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->i:F

    .line 244
    .line 245
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->s:F

    .line 246
    .line 247
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->j:F

    .line 248
    .line 249
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->t:F

    .line 250
    .line 251
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->k:F

    .line 252
    .line 253
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->u:F

    .line 254
    .line 255
    const/16 p1, 0x3a98

    .line 256
    .line 257
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->k0:I

    .line 258
    .line 259
    return-void
.end method

.method public p(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->W:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->A()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final q()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->L:F

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->I:F

    .line 4
    .line 5
    cmpg-float v2, v0, v1

    .line 6
    .line 7
    if-gtz v2, :cond_0

    .line 8
    .line 9
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->L:F

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->K:F

    .line 16
    .line 17
    sub-float/2addr v0, v1

    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->L:F

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final r()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->L:F

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J:F

    .line 4
    .line 5
    cmpl-float v2, v0, v1

    .line 6
    .line 7
    if-ltz v2, :cond_0

    .line 8
    .line 9
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->L:F

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->K:F

    .line 16
    .line 17
    add-float/2addr v0, v1

    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->L:F

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final s()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->q:F

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->l:F

    .line 4
    .line 5
    cmpl-float v2, v0, v1

    .line 6
    .line 7
    if-ltz v2, :cond_0

    .line 8
    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->u:F

    .line 10
    .line 11
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->p:F

    .line 12
    .line 13
    cmpl-float v2, v2, v3

    .line 14
    .line 15
    if-ltz v2, :cond_0

    .line 16
    .line 17
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->q:F

    .line 18
    .line 19
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->m:F

    .line 20
    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->r:F

    .line 22
    .line 23
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->n:F

    .line 24
    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->s:F

    .line 26
    .line 27
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->o:F

    .line 28
    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->t:F

    .line 30
    .line 31
    iput v3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->u:F

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->v:F

    .line 38
    .line 39
    sub-float/2addr v0, v1

    .line 40
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->q:F

    .line 41
    .line 42
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->r:F

    .line 43
    .line 44
    sub-float/2addr v0, v1

    .line 45
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->r:F

    .line 46
    .line 47
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->s:F

    .line 48
    .line 49
    add-float/2addr v0, v1

    .line 50
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->s:F

    .line 51
    .line 52
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->t:F

    .line 53
    .line 54
    add-float/2addr v0, v1

    .line 55
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->t:F

    .line 56
    .line 57
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->u:F

    .line 58
    .line 59
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->w:F

    .line 60
    .line 61
    add-float/2addr v0, v1

    .line 62
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->u:F

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public setStateListener(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->H0:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;

    .line 2
    .line 3
    return-void
.end method

.method public final t()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->q:F

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->g:F

    .line 4
    .line 5
    cmpl-float v2, v0, v1

    .line 6
    .line 7
    if-ltz v2, :cond_0

    .line 8
    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->u:F

    .line 10
    .line 11
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->k:F

    .line 12
    .line 13
    cmpg-float v2, v2, v3

    .line 14
    .line 15
    if-gtz v2, :cond_0

    .line 16
    .line 17
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->q:F

    .line 18
    .line 19
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->h:F

    .line 20
    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->r:F

    .line 22
    .line 23
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->i:F

    .line 24
    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->s:F

    .line 26
    .line 27
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->j:F

    .line 28
    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->t:F

    .line 30
    .line 31
    iput v3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->u:F

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->v:F

    .line 38
    .line 39
    add-float/2addr v0, v1

    .line 40
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->q:F

    .line 41
    .line 42
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->r:F

    .line 43
    .line 44
    add-float/2addr v0, v1

    .line 45
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->r:F

    .line 46
    .line 47
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->s:F

    .line 48
    .line 49
    sub-float/2addr v0, v1

    .line 50
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->s:F

    .line 51
    .line 52
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->t:F

    .line 53
    .line 54
    sub-float/2addr v0, v1

    .line 55
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->t:F

    .line 56
    .line 57
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->u:F

    .line 58
    .line 59
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->w:F

    .line 60
    .line 61
    sub-float/2addr v0, v1

    .line 62
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->u:F

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final u()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->B:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->A:Landroid/graphics/RectF;

    .line 6
    .line 7
    iget v3, v2, Landroid/graphics/RectF;->left:F

    .line 8
    .line 9
    cmpl-float v4, v1, v3

    .line 10
    .line 11
    if-ltz v4, :cond_0

    .line 12
    .line 13
    iput v3, v0, Landroid/graphics/RectF;->left:F

    .line 14
    .line 15
    iget v1, v2, Landroid/graphics/RectF;->top:F

    .line 16
    .line 17
    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 18
    .line 19
    iget v1, v2, Landroid/graphics/RectF;->right:F

    .line 20
    .line 21
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 22
    .line 23
    iget v1, v2, Landroid/graphics/RectF;->bottom:F

    .line 24
    .line 25
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G0:Z

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->C:F

    .line 35
    .line 36
    add-float/2addr v1, v2

    .line 37
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 38
    .line 39
    iget v1, v0, Landroid/graphics/RectF;->top:F

    .line 40
    .line 41
    add-float/2addr v1, v2

    .line 42
    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 43
    .line 44
    iget v1, v0, Landroid/graphics/RectF;->right:F

    .line 45
    .line 46
    sub-float/2addr v1, v2

    .line 47
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 48
    .line 49
    iget v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 50
    .line 51
    sub-float/2addr v1, v2

    .line 52
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final v()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->B:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->z:Landroid/graphics/RectF;

    .line 6
    .line 7
    iget v3, v2, Landroid/graphics/RectF;->left:F

    .line 8
    .line 9
    cmpg-float v4, v1, v3

    .line 10
    .line 11
    if-gtz v4, :cond_0

    .line 12
    .line 13
    iput v3, v0, Landroid/graphics/RectF;->left:F

    .line 14
    .line 15
    iget v1, v2, Landroid/graphics/RectF;->top:F

    .line 16
    .line 17
    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 18
    .line 19
    iget v1, v2, Landroid/graphics/RectF;->right:F

    .line 20
    .line 21
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 22
    .line 23
    iget v1, v2, Landroid/graphics/RectF;->bottom:F

    .line 24
    .line 25
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->C:F

    .line 32
    .line 33
    sub-float/2addr v1, v2

    .line 34
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 35
    .line 36
    iget v1, v0, Landroid/graphics/RectF;->top:F

    .line 37
    .line 38
    sub-float/2addr v1, v2

    .line 39
    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 40
    .line 41
    iget v1, v0, Landroid/graphics/RectF;->right:F

    .line 42
    .line 43
    add-float/2addr v1, v2

    .line 44
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 45
    .line 46
    iget v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 47
    .line 48
    add-float/2addr v1, v2

    .line 49
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final w()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->J:F

    .line 2
    .line 3
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->L:F

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final x()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->g:F

    .line 2
    .line 3
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->q:F

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->h:F

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->r:F

    .line 8
    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->i:F

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->s:F

    .line 12
    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->j:F

    .line 14
    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->t:F

    .line 16
    .line 17
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->k:F

    .line 18
    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->u:F

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final y()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->B:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->z:Landroid/graphics/RectF;

    .line 4
    .line 5
    iget v2, v1, Landroid/graphics/RectF;->left:F

    .line 6
    .line 7
    iput v2, v0, Landroid/graphics/RectF;->left:F

    .line 8
    .line 9
    iget v2, v1, Landroid/graphics/RectF;->top:F

    .line 10
    .line 11
    iput v2, v0, Landroid/graphics/RectF;->top:F

    .line 12
    .line 13
    iget v2, v1, Landroid/graphics/RectF;->right:F

    .line 14
    .line 15
    iput v2, v0, Landroid/graphics/RectF;->right:F

    .line 16
    .line 17
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 18
    .line 19
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final z()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->F0:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 10
    .line 11
    add-long/2addr v0, v2

    .line 12
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->k0:I

    .line 13
    .line 14
    int-to-long v2, v2

    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->F:J

    .line 25
    .line 26
    iget-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->p0:J

    .line 27
    .line 28
    sub-long/2addr v0, v2

    .line 29
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    add-long/2addr v0, v2

    .line 36
    long-to-float v0, v0

    .line 37
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 38
    .line 39
    div-float/2addr v0, v1

    .line 40
    float-to-int v0, v0

    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->I0:I

    .line 42
    .line 43
    if-ge v0, v1, :cond_1

    .line 44
    .line 45
    move v0, v1

    .line 46
    :cond_1
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->I0:I

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->U(I)V

    .line 49
    .line 50
    .line 51
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 54
    .line 55
    .line 56
    move-result-wide v2

    .line 57
    add-long/2addr v0, v2

    .line 58
    long-to-float v0, v0

    .line 59
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->k0:I

    .line 60
    .line 61
    int-to-float v1, v1

    .line 62
    div-float/2addr v0, v1

    .line 63
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->D:F

    .line 64
    .line 65
    const/high16 v1, 0x43b40000    # 360.0f

    .line 66
    .line 67
    mul-float/2addr v0, v1

    .line 68
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->E:F

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    :goto_0
    new-instance v0, Ljava/lang/Long;

    .line 75
    .line 76
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 77
    .line 78
    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 82
    .line 83
    .line 84
    move-result-wide v1

    .line 85
    const-wide/16 v3, 0x0

    .line 86
    .line 87
    cmp-long v1, v1, v3

    .line 88
    .line 89
    if-lez v1, :cond_3

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->M:Ljava/util/List;

    .line 92
    .line 93
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    :cond_3
    iput-wide v3, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->G:J

    .line 97
    .line 98
    return-void
.end method
