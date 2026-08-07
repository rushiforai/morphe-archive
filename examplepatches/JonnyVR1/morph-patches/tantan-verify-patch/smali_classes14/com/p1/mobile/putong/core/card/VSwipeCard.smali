.class public Lcom/p1/mobile/putong/core/card/VSwipeCard;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/card/VSwipeCard$c;,
        Lcom/p1/mobile/putong/core/card/VSwipeCard$d;
    }
.end annotation


# static fields
.field public static A:J = 0x2710L

.field public static B:I = 0x0

.field public static C:F = 0.0f

.field public static D:F = 0.0f

.field public static E:F = 0.0f

.field public static F:I = 0x0

.field public static G:I = 0x0

.field public static H:I = 0x0

.field public static I:I = 0x0

.field public static J:I = 0x0

.field public static K:I = 0x0

.field public static L:F = 0.0f

.field public static y:I = 0x1e

.field public static z:I = 0x1c2


# instance fields
.field public a:Z

.field public b:J

.field public c:Z

.field public d:Z

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/x20;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/x20;",
            ">;"
        }
    .end annotation
.end field

.field public g:Lcom/p1/mobile/putong/core/card/VSwipeCard$c;

.field public h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

.field public i:I

.field public j:I

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:F

.field public s:F

.field public t:F

.field public u:F

.field public v:F

.field public w:Ll/kmj$c;

.field public x:Ll/kmj;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/high16 v0, 0x427c0000    # 63.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->B:I

    .line 8
    .line 9
    const/high16 v0, 0x3fc00000    # 1.5f

    .line 10
    .line 11
    sput v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->C:F

    .line 12
    .line 13
    sput v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->D:F

    .line 14
    .line 15
    const/high16 v0, 0x40000000    # 2.0f

    .line 16
    .line 17
    sput v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->E:F

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    sput v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->F:I

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    sput v1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->G:I

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    sput v1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->H:I

    .line 27
    .line 28
    const/4 v1, -0x1

    .line 29
    sput v1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->I:I

    .line 30
    .line 31
    const/4 v1, 0x3

    .line 32
    sput v1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->J:I

    .line 33
    .line 34
    sput v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->K:I

    .line 35
    .line 36
    const/high16 v0, 0x40e00000    # 7.0f

    .line 37
    .line 38
    sput v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->L:F

    .line 39
    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->c:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->d:Z

    .line 9
    .line 10
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    const/high16 v0, 0x42280000    # 42.0f

    .line 14
    .line 15
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->i:I

    .line 20
    .line 21
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->k:Z

    .line 22
    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->l:Z

    .line 24
    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->m:Z

    .line 26
    .line 27
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->n:Z

    .line 28
    .line 29
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->o:Z

    .line 30
    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->p:Z

    .line 32
    .line 33
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->q:Z

    .line 34
    .line 35
    const/high16 v0, 0x3f800000    # 1.0f

    .line 36
    .line 37
    iput v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->s:F

    .line 38
    .line 39
    iput v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->u:F

    .line 40
    .line 41
    new-instance v0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;-><init>(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->w:Ll/kmj$c;

    .line 47
    .line 48
    new-instance v0, Ll/kmj;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->w:Ll/kmj$c;

    .line 55
    .line 56
    new-instance v3, Landroid/os/Handler;

    .line 57
    .line 58
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 63
    .line 64
    .line 65
    invoke-direct {v0, v1, v2, v3}, Ll/kmj;-><init>(Landroid/content/Context;Ll/kmj$c;Landroid/os/Handler;)V

    .line 66
    .line 67
    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->x:Ll/kmj;

    .line 69
    .line 70
    invoke-virtual {v0, p1}, Ll/kmj;->m(Z)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4

    .line 74
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 75
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->c:Z

    const/4 p1, 0x0

    .line 76
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->d:Z

    .line 77
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/high16 p2, 0x42280000    # 42.0f

    .line 78
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->i:I

    .line 79
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->k:Z

    .line 80
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->l:Z

    .line 81
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->m:Z

    .line 82
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->n:Z

    .line 83
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->o:Z

    .line 84
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->p:Z

    .line 85
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->q:Z

    const/high16 p2, 0x3f800000    # 1.0f

    .line 86
    iput p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->s:F

    .line 87
    iput p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->u:F

    .line 88
    new-instance p2, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;

    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;-><init>(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->w:Ll/kmj$c;

    .line 89
    new-instance p2, Ll/kmj;

    .line 90
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->w:Ll/kmj$c;

    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {p2, v0, v1, v2}, Ll/kmj;-><init>(Landroid/content/Context;Ll/kmj$c;Landroid/os/Handler;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->x:Ll/kmj;

    .line 91
    invoke-virtual {p2, p1}, Ll/kmj;->m(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 92
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 93
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->c:Z

    const/4 p1, 0x0

    .line 94
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->d:Z

    .line 95
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/high16 p2, 0x42280000    # 42.0f

    .line 96
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->i:I

    .line 97
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->k:Z

    .line 98
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->l:Z

    .line 99
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->m:Z

    .line 100
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->n:Z

    .line 101
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->o:Z

    .line 102
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->p:Z

    .line 103
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->q:Z

    const/high16 p2, 0x3f800000    # 1.0f

    .line 104
    iput p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->s:F

    .line 105
    iput p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->u:F

    .line 106
    new-instance p2, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;

    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;-><init>(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->w:Ll/kmj$c;

    .line 107
    new-instance p2, Ll/kmj;

    .line 108
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->w:Ll/kmj$c;

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {p2, p3, v0, v1}, Ll/kmj;-><init>(Landroid/content/Context;Ll/kmj$c;Landroid/os/Handler;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->x:Ll/kmj;

    .line 109
    invoke-virtual {p2, p1}, Ll/kmj;->m(Z)V

    return-void
.end method

.method public static bridge synthetic E0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Lcom/p1/mobile/putong/core/card/VSwipeCard$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    return-object p0
.end method

.method public static bridge synthetic F0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->e:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic G0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->f:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic H0(Lcom/p1/mobile/putong/core/card/VSwipeCard;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->b:J

    return-void
.end method

.method public static bridge synthetic I0(Lcom/p1/mobile/putong/core/card/VSwipeCard;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->p:Z

    return-void
.end method

.method public static bridge synthetic J0(Lcom/p1/mobile/putong/core/card/VSwipeCard;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->a:Z

    return-void
.end method

.method public static bridge synthetic K0(Lcom/p1/mobile/putong/core/card/VSwipeCard;FFF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->S0(FFF)V

    return-void
.end method

.method public static bridge synthetic L0(Lcom/p1/mobile/putong/core/card/VSwipeCard;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->T0(F)V

    return-void
.end method

.method public static bridge synthetic N0(Lcom/p1/mobile/putong/core/card/VSwipeCard;FFFF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->m1(FFFF)V

    return-void
.end method

.method public static bridge synthetic X(Lcom/p1/mobile/putong/core/card/VSwipeCard;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->b:J

    return-wide v0
.end method

.method public static bridge synthetic c0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->p:Z

    return p0
.end method

.method public static bridge synthetic s0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->i:I

    return p0
.end method


# virtual methods
.method public F()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public O0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->a:Z

    .line 2
    .line 3
    return-void
.end method

.method public P0(Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->e:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->e:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->e:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public Q0()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->z:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->R0(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public R()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->b:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public R0(I)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->b1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Landroid/view/animation/OvershootInterpolator;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 11
    .line 12
    .line 13
    int-to-long v1, p1

    .line 14
    const/4 p1, 0x1

    .line 15
    new-array v3, p1, [F

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    const/4 v5, 0x0

    .line 19
    aput v5, v3, v4

    .line 20
    .line 21
    const-string v6, "translationX"

    .line 22
    .line 23
    invoke-static {p0, v6, v3}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    new-array v6, p1, [F

    .line 28
    .line 29
    aput v5, v6, v4

    .line 30
    .line 31
    const-string v7, "translationY"

    .line 32
    .line 33
    invoke-static {p0, v7, v6}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    new-array p1, p1, [F

    .line 38
    .line 39
    aput v5, p1, v4

    .line 40
    .line 41
    const-string v5, "rotation"

    .line 42
    .line 43
    invoke-static {p0, v5, p1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    filled-new-array {v3, v6, p1}, [Landroid/animation/Animator;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {v0, v1, v2, p1}, Ll/gt0;->y(Landroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance v0, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard$a;-><init>(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 61
    .line 62
    .line 63
    iput-boolean v4, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->p:Z

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->Z0(Landroid/animation/Animator;)V

    .line 66
    .line 67
    .line 68
    invoke-static {p0, p1}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final S0(FFF)V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    iget v3, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 8
    .line 9
    sget v4, Lcom/p1/mobile/putong/core/card/VSwipeCard;->F:I

    .line 10
    .line 11
    if-ne v3, v4, :cond_12

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    iput-boolean v3, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->a:Z

    .line 15
    .line 16
    iput-boolean v3, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->p:Z

    .line 17
    .line 18
    neg-float v4, v2

    .line 19
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    sget v6, Lcom/p1/mobile/putong/core/card/VSwipeCard;->E:F

    .line 24
    .line 25
    mul-float/2addr v5, v6

    .line 26
    cmpl-float v4, v4, v5

    .line 27
    .line 28
    const/4 v5, 0x1

    .line 29
    const/4 v6, 0x0

    .line 30
    if-lez v4, :cond_0

    .line 31
    .line 32
    iget-object v4, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 33
    .line 34
    invoke-interface {v4, v5}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->c(Z)Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-eqz v4, :cond_0

    .line 39
    .line 40
    sget-object v4, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    cmpl-float v4, v1, v6

    .line 44
    .line 45
    if-lez v4, :cond_1

    .line 46
    .line 47
    sget-object v4, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    sget-object v4, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 51
    .line 52
    :goto_0
    sget-object v7, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 53
    .line 54
    const-string v8, "rotation"

    .line 55
    .line 56
    const-string v9, "translationY"

    .line 57
    .line 58
    const-string v10, "translationX"

    .line 59
    .line 60
    const-wide v15, 0x3f9db22d0e560419L    # 0.029

    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    const-wide v17, 0x3ff6ed916872b021L    # 1.433

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    const/16 v19, -0x1

    .line 71
    .line 72
    const-wide/16 v20, 0xa

    .line 73
    .line 74
    move/from16 v22, v3

    .line 75
    .line 76
    if-eq v4, v7, :cond_2

    .line 77
    .line 78
    sget-object v3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 79
    .line 80
    if-ne v4, v3, :cond_3

    .line 81
    .line 82
    :cond_2
    move/from16 v23, v6

    .line 83
    .line 84
    goto/16 :goto_5

    .line 85
    .line 86
    :cond_3
    sget-object v3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 87
    .line 88
    if-ne v4, v3, :cond_12

    .line 89
    .line 90
    iget-object v3, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 91
    .line 92
    invoke-interface {v3, v5}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->c(Z)Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-eqz v3, :cond_12

    .line 97
    .line 98
    invoke-static {}, Ll/bnl0;->w0()I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    neg-int v3, v3

    .line 103
    int-to-float v3, v3

    .line 104
    cmpl-float v4, v1, v6

    .line 105
    .line 106
    move/from16 v23, v6

    .line 107
    .line 108
    if-lez v4, :cond_4

    .line 109
    .line 110
    float-to-double v6, v1

    .line 111
    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    .line 112
    .line 113
    .line 114
    move-result-wide v6

    .line 115
    goto :goto_1

    .line 116
    :cond_4
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    float-to-double v6, v1

    .line 121
    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    .line 122
    .line 123
    .line 124
    move-result-wide v6

    .line 125
    neg-double v6, v6

    .line 126
    :goto_1
    cmpl-float v1, v2, v23

    .line 127
    .line 128
    if-lez v1, :cond_5

    .line 129
    .line 130
    float-to-double v11, v2

    .line 131
    invoke-static {v11, v12}, Ljava/lang/Math;->sqrt(D)D

    .line 132
    .line 133
    .line 134
    move-result-wide v11

    .line 135
    goto :goto_2

    .line 136
    :cond_5
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    float-to-double v11, v1

    .line 141
    invoke-static {v11, v12}, Ljava/lang/Math;->sqrt(D)D

    .line 142
    .line 143
    .line 144
    move-result-wide v11

    .line 145
    neg-double v11, v11

    .line 146
    :goto_2
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    sub-float v1, v3, v1

    .line 151
    .line 152
    div-float/2addr v1, v2

    .line 153
    double-to-float v6, v6

    .line 154
    mul-float/2addr v1, v6

    .line 155
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-lez v4, :cond_6

    .line 160
    .line 161
    move v4, v5

    .line 162
    goto :goto_3

    .line 163
    :cond_6
    move/from16 v4, v19

    .line 164
    .line 165
    :goto_3
    int-to-float v4, v4

    .line 166
    mul-float/2addr v1, v4

    .line 167
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 168
    .line 169
    .line 170
    move-result v4

    .line 171
    add-float/2addr v1, v4

    .line 172
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 173
    .line 174
    .line 175
    move-result v4

    .line 176
    sub-float v4, v3, v4

    .line 177
    .line 178
    float-to-double v6, v4

    .line 179
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    float-to-double v13, v2

    .line 184
    mul-double/2addr v13, v15

    .line 185
    add-double v13, v13, v17

    .line 186
    .line 187
    mul-double/2addr v13, v11

    .line 188
    div-double/2addr v6, v13

    .line 189
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->k:Z

    .line 190
    .line 191
    if-eqz v2, :cond_7

    .line 192
    .line 193
    const-wide v11, 0x407a900000000000L    # 425.0

    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    goto :goto_4

    .line 199
    :cond_7
    const-wide v11, 0x4085180000000000L    # 675.0

    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    :goto_4
    invoke-static {v6, v7, v11, v12}, Ljava/lang/Math;->min(DD)D

    .line 205
    .line 206
    .line 207
    move-result-wide v6

    .line 208
    double-to-long v6, v6

    .line 209
    cmp-long v2, v6, v20

    .line 210
    .line 211
    if-gtz v2, :cond_8

    .line 212
    .line 213
    move-wide/from16 v6, v20

    .line 214
    .line 215
    :cond_8
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 216
    .line 217
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 218
    .line 219
    .line 220
    new-array v4, v5, [F

    .line 221
    .line 222
    aput v1, v4, v22

    .line 223
    .line 224
    invoke-static {v0, v10, v4}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    new-array v4, v5, [F

    .line 229
    .line 230
    aput v3, v4, v22

    .line 231
    .line 232
    invoke-static {v0, v9, v4}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 233
    .line 234
    .line 235
    move-result-object v3

    .line 236
    new-array v4, v5, [F

    .line 237
    .line 238
    aput v23, v4, v22

    .line 239
    .line 240
    invoke-static {v0, v8, v4}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 241
    .line 242
    .line 243
    move-result-object v4

    .line 244
    filled-new-array {v1, v3, v4}, [Landroid/animation/Animator;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    invoke-static {v2, v6, v7, v1}, Ll/gt0;->y(Landroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->Z0(Landroid/animation/Animator;)V

    .line 253
    .line 254
    .line 255
    sget v2, Lcom/p1/mobile/putong/core/card/VSwipeCard;->G:I

    .line 256
    .line 257
    iput v2, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 258
    .line 259
    invoke-static {v0, v1}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 260
    .line 261
    .line 262
    return-void

    .line 263
    :goto_5
    cmpl-float v3, v1, v23

    .line 264
    .line 265
    if-lez v3, :cond_9

    .line 266
    .line 267
    sget-object v4, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 268
    .line 269
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 270
    .line 271
    .line 272
    move-result v4

    .line 273
    goto :goto_6

    .line 274
    :cond_9
    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 275
    .line 276
    .line 277
    move-result v4

    .line 278
    :goto_6
    invoke-static {}, Ll/bnl0;->y0()I

    .line 279
    .line 280
    .line 281
    move-result v6

    .line 282
    mul-int/2addr v6, v4

    .line 283
    int-to-float v6, v6

    .line 284
    const/high16 v7, 0x40000000    # 2.0f

    .line 285
    .line 286
    mul-float/2addr v6, v7

    .line 287
    if-lez v3, :cond_a

    .line 288
    .line 289
    float-to-double v11, v1

    .line 290
    invoke-static {v11, v12}, Ljava/lang/Math;->sqrt(D)D

    .line 291
    .line 292
    .line 293
    move-result-wide v11

    .line 294
    goto :goto_7

    .line 295
    :cond_a
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 296
    .line 297
    .line 298
    move-result v3

    .line 299
    float-to-double v11, v3

    .line 300
    invoke-static {v11, v12}, Ljava/lang/Math;->sqrt(D)D

    .line 301
    .line 302
    .line 303
    move-result-wide v11

    .line 304
    neg-double v11, v11

    .line 305
    :goto_7
    cmpl-float v3, v2, v23

    .line 306
    .line 307
    if-lez v3, :cond_b

    .line 308
    .line 309
    float-to-double v13, v2

    .line 310
    invoke-static {v13, v14}, Ljava/lang/Math;->sqrt(D)D

    .line 311
    .line 312
    .line 313
    move-result-wide v13

    .line 314
    goto :goto_8

    .line 315
    :cond_b
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 316
    .line 317
    .line 318
    move-result v2

    .line 319
    float-to-double v13, v2

    .line 320
    invoke-static {v13, v14}, Ljava/lang/Math;->sqrt(D)D

    .line 321
    .line 322
    .line 323
    move-result-wide v13

    .line 324
    neg-double v13, v13

    .line 325
    :goto_8
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 326
    .line 327
    .line 328
    move-result v2

    .line 329
    sub-float v2, v6, v2

    .line 330
    .line 331
    div-float/2addr v2, v1

    .line 332
    double-to-float v7, v13

    .line 333
    mul-float/2addr v2, v7

    .line 334
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 335
    .line 336
    .line 337
    move-result v2

    .line 338
    if-lez v3, :cond_c

    .line 339
    .line 340
    move v7, v5

    .line 341
    goto :goto_9

    .line 342
    :cond_c
    move/from16 v7, v19

    .line 343
    .line 344
    :goto_9
    int-to-float v7, v7

    .line 345
    mul-float/2addr v2, v7

    .line 346
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 347
    .line 348
    .line 349
    move-result v7

    .line 350
    add-float/2addr v2, v7

    .line 351
    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    .line 352
    .line 353
    .line 354
    move-result v7

    .line 355
    if-eqz v7, :cond_e

    .line 356
    .line 357
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 358
    .line 359
    .line 360
    move-result v2

    .line 361
    div-int/lit8 v2, v2, 0xa

    .line 362
    .line 363
    if-lez v3, :cond_d

    .line 364
    .line 365
    move/from16 v19, v5

    .line 366
    .line 367
    :cond_d
    mul-int v2, v2, v19

    .line 368
    .line 369
    int-to-float v2, v2

    .line 370
    :cond_e
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 371
    .line 372
    .line 373
    move-result v3

    .line 374
    sub-float v3, v6, v3

    .line 375
    .line 376
    float-to-double v13, v3

    .line 377
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 378
    .line 379
    .line 380
    move-result v1

    .line 381
    move v7, v6

    .line 382
    float-to-double v5, v1

    .line 383
    mul-double/2addr v5, v15

    .line 384
    add-double v5, v5, v17

    .line 385
    .line 386
    mul-double/2addr v5, v11

    .line 387
    div-double/2addr v13, v5

    .line 388
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->k:Z

    .line 389
    .line 390
    if-eqz v1, :cond_f

    .line 391
    .line 392
    const-wide v11, 0x407a900000000000L    # 425.0

    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    goto :goto_a

    .line 398
    :cond_f
    const-wide v11, 0x4085180000000000L    # 675.0

    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    :goto_a
    invoke-static {v13, v14, v11, v12}, Ljava/lang/Math;->min(DD)D

    .line 404
    .line 405
    .line 406
    move-result-wide v5

    .line 407
    double-to-long v5, v5

    .line 408
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->m:Z

    .line 409
    .line 410
    if-eqz v1, :cond_10

    .line 411
    .line 412
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 413
    .line 414
    .line 415
    move-result v1

    .line 416
    if-eqz v1, :cond_10

    .line 417
    .line 418
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 419
    .line 420
    .line 421
    move-result v1

    .line 422
    int-to-float v1, v1

    .line 423
    div-float v1, v2, v1

    .line 424
    .line 425
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 426
    .line 427
    .line 428
    move-result v1

    .line 429
    const/high16 v11, 0x3f800000    # 1.0f

    .line 430
    .line 431
    invoke-static {v11, v1}, Ljava/lang/Math;->max(FF)F

    .line 432
    .line 433
    .line 434
    move-result v1

    .line 435
    long-to-float v5, v5

    .line 436
    mul-float/2addr v5, v1

    .line 437
    float-to-long v5, v5

    .line 438
    sget-wide v11, Lcom/p1/mobile/putong/core/card/VSwipeCard;->A:J

    .line 439
    .line 440
    invoke-static {v5, v6, v11, v12}, Ljava/lang/Math;->min(JJ)J

    .line 441
    .line 442
    .line 443
    move-result-wide v5

    .line 444
    :cond_10
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->k1(F)F

    .line 445
    .line 446
    .line 447
    move-result v1

    .line 448
    cmp-long v2, v5, v20

    .line 449
    .line 450
    if-gtz v2, :cond_11

    .line 451
    .line 452
    move-wide/from16 v5, v20

    .line 453
    .line 454
    :cond_11
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 455
    .line 456
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 457
    .line 458
    .line 459
    const/4 v3, 0x1

    .line 460
    new-array v11, v3, [F

    .line 461
    .line 462
    aput v7, v11, v22

    .line 463
    .line 464
    invoke-static {v0, v10, v11}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 465
    .line 466
    .line 467
    move-result-object v7

    .line 468
    new-array v10, v3, [F

    .line 469
    .line 470
    aput v1, v10, v22

    .line 471
    .line 472
    invoke-static {v0, v9, v10}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 473
    .line 474
    .line 475
    move-result-object v1

    .line 476
    int-to-float v9, v4

    .line 477
    move/from16 v10, p3

    .line 478
    .line 479
    invoke-virtual {v0, v10}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->e1(F)F

    .line 480
    .line 481
    .line 482
    move-result v10

    .line 483
    mul-float/2addr v9, v10

    .line 484
    new-array v3, v3, [F

    .line 485
    .line 486
    aput v9, v3, v22

    .line 487
    .line 488
    invoke-static {v0, v8, v3}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 489
    .line 490
    .line 491
    move-result-object v3

    .line 492
    filled-new-array {v7, v1, v3}, [Landroid/animation/Animator;

    .line 493
    .line 494
    .line 495
    move-result-object v1

    .line 496
    invoke-static {v2, v5, v6, v1}, Ll/gt0;->y(Landroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 497
    .line 498
    .line 499
    move-result-object v1

    .line 500
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->Z0(Landroid/animation/Animator;)V

    .line 501
    .line 502
    .line 503
    sget v2, Lcom/p1/mobile/putong/core/card/VSwipeCard;->H:I

    .line 504
    .line 505
    mul-int/2addr v2, v4

    .line 506
    iput v2, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 507
    .line 508
    invoke-static {v0, v1}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 509
    .line 510
    .line 511
    :cond_12
    return-void
.end method

.method public final T0(F)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    neg-float v0, v0

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sget v2, Lcom/p1/mobile/putong/core/card/VSwipeCard;->E:F

    .line 15
    .line 16
    mul-float/2addr v1, v2

    .line 17
    cmpl-float v0, v0, v1

    .line 18
    .line 19
    if-lez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->c(Z)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->l:Z

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    int-to-float v1, v1

    .line 47
    const v2, 0x4019999a    # 2.4f

    .line 48
    .line 49
    .line 50
    div-float/2addr v1, v2

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->f1()F

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    :goto_0
    cmpg-float v0, v0, v1

    .line 57
    .line 58
    if-gez v0, :cond_1

    .line 59
    .line 60
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    const/4 v1, 0x0

    .line 68
    cmpl-float v0, v0, v1

    .line 69
    .line 70
    if-lez v0, :cond_2

    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 76
    .line 77
    :goto_1
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->U0(Lcom/p1/mobile/putong/core/data/SwipeDirection;F)Z

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final U0(Lcom/p1/mobile/putong/core/data/SwipeDirection;F)Z
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v2, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 6
    .line 7
    sget v3, Lcom/p1/mobile/putong/core/card/VSwipeCard;->F:I

    .line 8
    .line 9
    const/4 v8, 0x0

    .line 10
    if-ne v2, v3, :cond_c

    .line 11
    .line 12
    iput-boolean v8, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->a:Z

    .line 13
    .line 14
    iput-boolean v8, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->p:Z

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const/high16 v3, 0x42c00000    # 96.0f

    .line 25
    .line 26
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    int-to-float v3, v3

    .line 31
    cmpl-float v2, v2, v3

    .line 32
    .line 33
    if-gtz v2, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    const/high16 v3, 0x42ac0000    # 86.0f

    .line 44
    .line 45
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    int-to-float v3, v3

    .line 50
    cmpl-float v2, v2, v3

    .line 51
    .line 52
    if-lez v2, :cond_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    move v2, v8

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    :goto_0
    const/4 v2, 0x1

    .line 58
    :goto_1
    new-instance v10, Landroid/view/animation/LinearInterpolator;

    .line 59
    .line 60
    invoke-direct {v10}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 61
    .line 62
    .line 63
    sget-object v3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 64
    .line 65
    const-string v11, "rotation"

    .line 66
    .line 67
    const-string v12, "translationY"

    .line 68
    .line 69
    const-string v13, "translationX"

    .line 70
    .line 71
    if-eq v1, v3, :cond_2

    .line 72
    .line 73
    sget-object v3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 74
    .line 75
    if-ne v1, v3, :cond_3

    .line 76
    .line 77
    :cond_2
    const/16 v21, 0x0

    .line 78
    .line 79
    goto/16 :goto_4

    .line 80
    .line 81
    :cond_3
    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 82
    .line 83
    if-ne v1, v2, :cond_5

    .line 84
    .line 85
    iget-object v1, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 86
    .line 87
    invoke-interface {v1, v8}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->c(Z)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_5

    .line 92
    .line 93
    invoke-static {}, Ll/bnl0;->w0()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    int-to-float v15, v1

    .line 98
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->k:Z

    .line 99
    .line 100
    if-eqz v1, :cond_4

    .line 101
    .line 102
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->l:Z

    .line 103
    .line 104
    if-nez v1, :cond_4

    .line 105
    .line 106
    sget v1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->z:I

    .line 107
    .line 108
    div-int/lit8 v2, v1, 0x4

    .line 109
    .line 110
    sub-int v3, v1, v2

    .line 111
    .line 112
    int-to-long v4, v1

    .line 113
    new-instance v1, Landroid/view/animation/OvershootInterpolator;

    .line 114
    .line 115
    invoke-direct {v1}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 116
    .line 117
    .line 118
    int-to-long v6, v2

    .line 119
    const/4 v2, 0x2

    .line 120
    move-wide/from16 v16, v4

    .line 121
    .line 122
    move-wide v4, v6

    .line 123
    new-array v7, v2, [F

    .line 124
    .line 125
    fill-array-data v7, :array_0

    .line 126
    .line 127
    .line 128
    move-object v6, v1

    .line 129
    const-string v1, "superLikeIconScale"

    .line 130
    .line 131
    move/from16 v19, v2

    .line 132
    .line 133
    move/from16 v18, v3

    .line 134
    .line 135
    const-wide/16 v2, 0x0

    .line 136
    .line 137
    move-object/from16 v20, v6

    .line 138
    .line 139
    const/4 v6, 0x0

    .line 140
    move-wide/from16 v22, v16

    .line 141
    .line 142
    move/from16 v14, v18

    .line 143
    .line 144
    move/from16 v9, v19

    .line 145
    .line 146
    const/16 v21, 0x0

    .line 147
    .line 148
    move/from16 v16, v8

    .line 149
    .line 150
    move-object/from16 v8, v20

    .line 151
    .line 152
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    new-array v7, v9, [F

    .line 157
    .line 158
    fill-array-data v7, :array_1

    .line 159
    .line 160
    .line 161
    move-object v0, v1

    .line 162
    const-string v1, "superLikeIconAlpha"

    .line 163
    .line 164
    move-object v9, v0

    .line 165
    move-object/from16 v0, p0

    .line 166
    .line 167
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    filled-new-array {v9, v1}, [Landroid/animation/Animator;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-static {v8, v4, v5, v1}, Ll/gt0;->y(Landroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    int-to-long v2, v14

    .line 180
    const/4 v4, 0x1

    .line 181
    new-array v5, v4, [F

    .line 182
    .line 183
    aput v21, v5, v16

    .line 184
    .line 185
    invoke-static {v0, v13, v5}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 186
    .line 187
    .line 188
    move-result-object v5

    .line 189
    neg-float v6, v15

    .line 190
    new-array v7, v4, [F

    .line 191
    .line 192
    aput v6, v7, v16

    .line 193
    .line 194
    invoke-static {v0, v12, v7}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 195
    .line 196
    .line 197
    move-result-object v6

    .line 198
    new-array v7, v4, [F

    .line 199
    .line 200
    aput v21, v7, v16

    .line 201
    .line 202
    invoke-static {v0, v11, v7}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    filled-new-array {v5, v6, v4}, [Landroid/animation/Animator;

    .line 207
    .line 208
    .line 209
    move-result-object v4

    .line 210
    invoke-static {v10, v2, v3, v4}, Ll/gt0;->y(Landroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    filled-new-array {v1, v2}, [Landroid/animation/Animator;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    const/4 v2, 0x0

    .line 219
    move/from16 v5, v16

    .line 220
    .line 221
    move-wide/from16 v3, v22

    .line 222
    .line 223
    invoke-static {v5, v2, v3, v4, v1}, Ll/gt0;->u(ZLandroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    goto :goto_2

    .line 228
    :cond_4
    move v5, v8

    .line 229
    const/16 v21, 0x0

    .line 230
    .line 231
    sget v1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->z:I

    .line 232
    .line 233
    int-to-long v1, v1

    .line 234
    const/4 v4, 0x1

    .line 235
    new-array v3, v4, [F

    .line 236
    .line 237
    aput v21, v3, v5

    .line 238
    .line 239
    invoke-static {v0, v13, v3}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    neg-float v6, v15

    .line 244
    new-array v7, v4, [F

    .line 245
    .line 246
    aput v6, v7, v5

    .line 247
    .line 248
    invoke-static {v0, v12, v7}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 249
    .line 250
    .line 251
    move-result-object v6

    .line 252
    new-array v7, v4, [F

    .line 253
    .line 254
    aput v21, v7, v5

    .line 255
    .line 256
    invoke-static {v0, v11, v7}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 257
    .line 258
    .line 259
    move-result-object v4

    .line 260
    filled-new-array {v3, v6, v4}, [Landroid/animation/Animator;

    .line 261
    .line 262
    .line 263
    move-result-object v3

    .line 264
    invoke-static {v10, v1, v2, v3}, Ll/gt0;->y(Landroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    :goto_2
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->Z0(Landroid/animation/Animator;)V

    .line 269
    .line 270
    .line 271
    sget v2, Lcom/p1/mobile/putong/core/card/VSwipeCard;->G:I

    .line 272
    .line 273
    iput v2, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 274
    .line 275
    invoke-static {v0, v1}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 276
    .line 277
    .line 278
    :cond_5
    :goto_3
    const/16 v17, 0x1

    .line 279
    .line 280
    goto/16 :goto_a

    .line 281
    .line 282
    :goto_4
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 283
    .line 284
    .line 285
    move-result v3

    .line 286
    invoke-static {}, Ll/bnl0;->y0()I

    .line 287
    .line 288
    .line 289
    move-result v4

    .line 290
    mul-int/2addr v3, v4

    .line 291
    int-to-float v3, v3

    .line 292
    const/high16 v4, 0x3fc00000    # 1.5f

    .line 293
    .line 294
    mul-float/2addr v3, v4

    .line 295
    if-eqz v2, :cond_8

    .line 296
    .line 297
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 298
    .line 299
    .line 300
    move-result v4

    .line 301
    move/from16 v5, v21

    .line 302
    .line 303
    invoke-static {v4, v5}, Ljava/lang/Float;->compare(FF)I

    .line 304
    .line 305
    .line 306
    move-result v4

    .line 307
    if-nez v4, :cond_6

    .line 308
    .line 309
    goto :goto_6

    .line 310
    :cond_6
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 311
    .line 312
    .line 313
    move-result v4

    .line 314
    invoke-static {v4, v5}, Ljava/lang/Float;->compare(FF)I

    .line 315
    .line 316
    .line 317
    move-result v4

    .line 318
    if-nez v4, :cond_7

    .line 319
    .line 320
    invoke-static {}, Ll/bnl0;->w0()I

    .line 321
    .line 322
    .line 323
    move-result v4

    .line 324
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 325
    .line 326
    .line 327
    move-result v5

    .line 328
    mul-int/2addr v4, v5

    .line 329
    :goto_5
    int-to-float v4, v4

    .line 330
    goto :goto_7

    .line 331
    :cond_7
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 332
    .line 333
    .line 334
    move-result v4

    .line 335
    mul-float/2addr v4, v3

    .line 336
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 337
    .line 338
    .line 339
    move-result v5

    .line 340
    div-float/2addr v4, v5

    .line 341
    goto :goto_7

    .line 342
    :cond_8
    :goto_6
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 343
    .line 344
    .line 345
    move-result v4

    .line 346
    div-int/lit8 v4, v4, 0xa

    .line 347
    .line 348
    goto :goto_5

    .line 349
    :goto_7
    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    .line 350
    .line 351
    .line 352
    move-result v5

    .line 353
    if-eqz v5, :cond_a

    .line 354
    .line 355
    if-nez v2, :cond_9

    .line 356
    .line 357
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 358
    .line 359
    .line 360
    move-result v2

    .line 361
    div-int/lit8 v2, v2, 0xa

    .line 362
    .line 363
    :goto_8
    int-to-float v4, v2

    .line 364
    goto :goto_9

    .line 365
    :cond_9
    invoke-static {}, Ll/bnl0;->w0()I

    .line 366
    .line 367
    .line 368
    move-result v2

    .line 369
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 370
    .line 371
    .line 372
    move-result v4

    .line 373
    mul-int/2addr v2, v4

    .line 374
    goto :goto_8

    .line 375
    :cond_a
    :goto_9
    sget v2, Lcom/p1/mobile/putong/core/card/VSwipeCard;->z:I

    .line 376
    .line 377
    int-to-long v5, v2

    .line 378
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->m:Z

    .line 379
    .line 380
    if-eqz v2, :cond_b

    .line 381
    .line 382
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 383
    .line 384
    .line 385
    move-result v2

    .line 386
    if-eqz v2, :cond_b

    .line 387
    .line 388
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 389
    .line 390
    .line 391
    move-result v2

    .line 392
    int-to-float v2, v2

    .line 393
    div-float v2, v4, v2

    .line 394
    .line 395
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 396
    .line 397
    .line 398
    move-result v2

    .line 399
    const/high16 v5, 0x3f800000    # 1.0f

    .line 400
    .line 401
    invoke-static {v5, v2}, Ljava/lang/Math;->max(FF)F

    .line 402
    .line 403
    .line 404
    move-result v2

    .line 405
    sget v5, Lcom/p1/mobile/putong/core/card/VSwipeCard;->z:I

    .line 406
    .line 407
    int-to-float v5, v5

    .line 408
    mul-float/2addr v5, v2

    .line 409
    float-to-long v5, v5

    .line 410
    sget-wide v7, Lcom/p1/mobile/putong/core/card/VSwipeCard;->A:J

    .line 411
    .line 412
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    .line 413
    .line 414
    .line 415
    move-result-wide v5

    .line 416
    :cond_b
    const/4 v2, 0x1

    .line 417
    new-array v7, v2, [F

    .line 418
    .line 419
    const/16 v16, 0x0

    .line 420
    .line 421
    aput v3, v7, v16

    .line 422
    .line 423
    invoke-static {v0, v13, v7}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 424
    .line 425
    .line 426
    move-result-object v3

    .line 427
    new-array v7, v2, [F

    .line 428
    .line 429
    aput v4, v7, v16

    .line 430
    .line 431
    invoke-static {v0, v12, v7}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 432
    .line 433
    .line 434
    move-result-object v4

    .line 435
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 436
    .line 437
    .line 438
    move-result v7

    .line 439
    int-to-float v7, v7

    .line 440
    move/from16 v8, p2

    .line 441
    .line 442
    invoke-virtual {v0, v8}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->e1(F)F

    .line 443
    .line 444
    .line 445
    move-result v8

    .line 446
    mul-float/2addr v7, v8

    .line 447
    new-array v8, v2, [F

    .line 448
    .line 449
    aput v7, v8, v16

    .line 450
    .line 451
    invoke-static {v0, v11, v8}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 452
    .line 453
    .line 454
    move-result-object v2

    .line 455
    filled-new-array {v3, v4, v2}, [Landroid/animation/Animator;

    .line 456
    .line 457
    .line 458
    move-result-object v2

    .line 459
    invoke-static {v10, v5, v6, v2}, Ll/gt0;->y(Landroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 460
    .line 461
    .line 462
    move-result-object v2

    .line 463
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->Z0(Landroid/animation/Animator;)V

    .line 464
    .line 465
    .line 466
    sget v3, Lcom/p1/mobile/putong/core/card/VSwipeCard;->H:I

    .line 467
    .line 468
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 469
    .line 470
    .line 471
    move-result v1

    .line 472
    mul-int/2addr v3, v1

    .line 473
    iput v3, v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 474
    .line 475
    invoke-static {v0, v2}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 476
    .line 477
    .line 478
    goto/16 :goto_3

    .line 479
    .line 480
    :goto_a
    return v17

    .line 481
    :cond_c
    move/from16 v16, v8

    .line 482
    .line 483
    return v16

    .line 484
    nop

    .line 485
    :array_0
    .array-data 4
        0x3fc00000    # 1.5f
        0x3f800000    # 1.0f
    .end array-data

    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    .line 492
    .line 493
    :array_1
    .array-data 4
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public V0(FF)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->s:F

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->r:F

    .line 4
    .line 5
    iget p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->t:F

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->setBasedTranslationY(F)V

    .line 8
    .line 9
    .line 10
    iget p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->u:F

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->setBasedScale(F)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public W0(ZF)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->b:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 18
    .line 19
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->h(ZF)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public X0()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public Y0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Z0(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public a1()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->q:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->b1()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public b1()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->F:I

    .line 4
    .line 5
    if-eq p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public c1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public d1()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->f(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final e1(F)F
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    div-int/lit8 v0, v0, 0x3

    .line 6
    .line 7
    mul-int/lit8 v0, v0, 0x2

    .line 8
    .line 9
    int-to-float v0, v0

    .line 10
    cmpl-float v0, p1, v0

    .line 11
    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    div-int/lit8 v0, v0, 0x3

    .line 19
    .line 20
    mul-int/lit8 v0, v0, 0x2

    .line 21
    .line 22
    int-to-float v0, v0

    .line 23
    sub-float/2addr v0, p1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    div-int/lit8 v0, v0, 0x3

    .line 30
    .line 31
    mul-int/lit8 v0, v0, 0x2

    .line 32
    .line 33
    int-to-float v0, v0

    .line 34
    sub-float/2addr v0, p1

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    div-int/lit8 p1, p1, 0x3

    .line 40
    .line 41
    int-to-float p1, p1

    .line 42
    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    int-to-float p0, p0

    .line 51
    div-float/2addr v0, p0

    .line 52
    sget p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->y:I

    .line 53
    .line 54
    int-to-float p0, p0

    .line 55
    mul-float/2addr v0, p0

    .line 56
    const p0, 0x3fb33333    # 1.4f

    .line 57
    .line 58
    .line 59
    mul-float/2addr v0, p0

    .line 60
    return v0
.end method

.method public f1()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    const v0, 0x4019999a    # 2.4f

    .line 7
    .line 8
    .line 9
    div-float/2addr p0, v0

    .line 10
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public g1()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    const/high16 v0, 0x40400000    # 3.0f

    .line 7
    .line 8
    div-float/2addr p0, v0

    .line 9
    return p0
.end method

.method public getBasedScale()F
    .locals 0
    .annotation build Ll/w6e;
    .end annotation

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->u:F

    .line 2
    .line 3
    return p0
.end method

.method public getBasedTranslationY()F
    .locals 0
    .annotation build Ll/w6e;
    .end annotation

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->t:F

    .line 2
    .line 3
    return p0
.end method

.method public h1()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public i1(F)F
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    sget v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->C:F

    .line 7
    .line 8
    div-float/2addr p0, v0

    .line 9
    const/4 v0, 0x0

    .line 10
    cmpl-float v1, p0, v0

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    div-float/2addr p1, p0

    .line 16
    const/high16 p0, 0x3f800000    # 1.0f

    .line 17
    .line 18
    invoke-static {p1, p0}, Ljava/lang/Math;->min(FF)F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/high16 p1, -0x40800000    # -1.0f

    .line 23
    .line 24
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method public j1(F)F
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    sget v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->D:F

    .line 7
    .line 8
    div-float/2addr p0, v0

    .line 9
    const/4 v0, 0x0

    .line 10
    cmpl-float v1, p0, v0

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    div-float/2addr p1, p0

    .line 16
    const/high16 p0, 0x3f800000    # 1.0f

    .line 17
    .line 18
    invoke-static {p1, p0}, Ljava/lang/Math;->min(FF)F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/high16 p1, -0x40800000    # -1.0f

    .line 23
    .line 24
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method public k1(F)F
    .locals 0

    .line 1
    return p1
.end method

.method public l1(Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->f:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->f:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->f:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final m1(FFFF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->setTranslationX(F)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->setTranslationY(F)V

    .line 5
    .line 6
    .line 7
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->c:Z

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->i1(F)F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->e1(F)F

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    mul-float/2addr p1, p2

    .line 20
    invoke-virtual {p0, p1}, Landroid/view/View;->setRotation(F)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public n1()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->setTranslationX(F)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->setTranslationY(F)V

    .line 6
    .line 7
    .line 8
    const/high16 v1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->setScaleX(F)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->setScaleY(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setRotation(F)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    div-int/lit8 v0, v0, 0x2

    .line 24
    .line 25
    int-to-float v0, v0

    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotX(F)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    div-int/lit8 v0, v0, 0x2

    .line 34
    .line 35
    int-to-float v0, v0

    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotY(F)V

    .line 37
    .line 38
    .line 39
    sget v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->F:I

    .line 40
    .line 41
    iput v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 42
    .line 43
    const-wide/16 v0, 0x0

    .line 44
    .line 45
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->b:J

    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->p:Z

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->f:Ljava/util/List;

    .line 51
    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->e:Ljava/util/List;

    .line 58
    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 62
    .line 63
    .line 64
    :cond_1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->b:J

    .line 65
    .line 66
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->o1(J)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public o1(J)V
    .locals 0

    .line 1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 10
    .line 11
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->g(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->X0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->a1()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_3

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->d1()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->g:Lcom/p1/mobile/putong/core/card/VSwipeCard$c;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->g:Lcom/p1/mobile/putong/core/card/VSwipeCard$c;

    .line 34
    .line 35
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/card/VSwipeCard$c;->a()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 42
    .line 43
    .line 44
    :cond_2
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0

    .line 49
    :cond_3
    :goto_0
    const/4 p0, 0x1

    .line 50
    return p0
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    sub-int/2addr p4, p2

    .line 5
    div-int/lit8 p4, p4, 0x2

    .line 6
    .line 7
    int-to-float p1, p4

    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setPivotX(F)V

    .line 9
    .line 10
    .line 11
    sub-int/2addr p5, p3

    .line 12
    div-int/lit8 p5, p5, 0x2

    .line 13
    .line 14
    int-to-float p1, p5

    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setPivotY(F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->X0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->a:Z

    .line 13
    .line 14
    if-eqz v0, :cond_8

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    goto/16 :goto_2

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->x:Ll/kmj;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ll/kmj;->l(Landroid/view/MotionEvent;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x1

    .line 29
    if-nez v0, :cond_7

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eq v0, v1, :cond_2

    .line 36
    .line 37
    const/4 v2, 0x3

    .line 38
    if-eq v0, v2, :cond_2

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    sget v2, Lcom/p1/mobile/putong/core/card/VSwipeCard;->E:F

    .line 50
    .line 51
    div-float/2addr v0, v2

    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    neg-float v2, v2

    .line 57
    cmpl-float v0, v0, v2

    .line 58
    .line 59
    if-gtz v0, :cond_5

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 62
    .line 63
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->c(Z)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_3

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 71
    .line 72
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->c(Z)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_7

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    neg-float v0, v0

    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->g1()F

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    cmpl-float v0, v0, v2

    .line 88
    .line 89
    if-lez v0, :cond_4

    .line 90
    .line 91
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->T0(F)V

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->Q0()V

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_5
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->f1()F

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    cmpl-float v0, v0, v2

    .line 116
    .line 117
    if-lez v0, :cond_6

    .line 118
    .line 119
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->T0(F)V

    .line 124
    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->Q0()V

    .line 128
    .line 129
    .line 130
    :cond_7
    :goto_1
    return v1

    .line 131
    :cond_8
    :goto_2
    const/4 p0, 0x0

    .line 132
    return p0
.end method

.method public setBasedScale(F)V
    .locals 1
    .annotation build Ll/w6e;
    .end annotation

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->u:F

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->s:F

    .line 4
    .line 5
    mul-float/2addr v0, p1

    .line 6
    invoke-static {v0}, Ll/bnl0;->S(F)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->s:F

    .line 14
    .line 15
    mul-float/2addr v0, p1

    .line 16
    invoke-super {p0, v0}, Landroid/view/View;->setScaleX(F)V

    .line 17
    .line 18
    .line 19
    iget v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->s:F

    .line 20
    .line 21
    mul-float/2addr v0, p1

    .line 22
    invoke-super {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public setBasedTranslationY(F)V
    .locals 1
    .annotation build Ll/w6e;
    .end annotation

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->t:F

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->r:F

    .line 4
    .line 5
    add-float/2addr v0, p1

    .line 6
    invoke-super {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setCustomClickGesture(Lcom/p1/mobile/putong/core/card/VSwipeCard$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->g:Lcom/p1/mobile/putong/core/card/VSwipeCard$c;

    .line 2
    .line 3
    return-void
.end method

.method public setMinFlingSwipeX(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public setOptStackCard(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->n:Z

    .line 2
    .line 3
    return-void
.end method

.method public setScaleX(F)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->c1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 12
    .line 13
    sget v1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->F:I

    .line 14
    .line 15
    if-ne v0, v1, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    invoke-static {p1}, Ll/bnl0;->S(F)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    :goto_0
    return-void

    .line 25
    :cond_2
    invoke-super {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setScaleY(F)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->c1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 12
    .line 13
    sget v1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->F:I

    .line 14
    .line 15
    if-ne v0, v1, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    invoke-static {p1}, Ll/bnl0;->S(F)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    :goto_0
    return-void

    .line 25
    :cond_2
    invoke-super {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setShowSuperLikeIcon(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSwipeCardObserver(Lcom/p1/mobile/putong/core/card/VSwipeCard$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 2
    .line 3
    return-void
.end method

.method public setTranslationX(F)V
    .locals 8

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto/16 :goto_3

    .line 9
    .line 10
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 11
    .line 12
    sget v1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->J:I

    .line 13
    .line 14
    if-eq v0, v1, :cond_7

    .line 15
    .line 16
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->b:J

    .line 17
    .line 18
    const-wide/16 v2, 0x0

    .line 19
    .line 20
    cmp-long v0, v0, v2

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    const/high16 v0, -0x3cb80000    # -200.0f

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move v0, v1

    .line 29
    :goto_0
    sget v4, Lcom/p1/mobile/putong/core/card/VSwipeCard;->C:F

    .line 30
    .line 31
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    mul-float/2addr v4, v5

    .line 36
    add-float/2addr v0, v4

    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    add-float/2addr v0, v4

    .line 46
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->i1(F)F

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->v:F

    .line 51
    .line 52
    iget v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 53
    .line 54
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    sget v4, Lcom/p1/mobile/putong/core/card/VSwipeCard;->H:I

    .line 59
    .line 60
    const/4 v5, 0x1

    .line 61
    if-ne v0, v4, :cond_4

    .line 62
    .line 63
    iget v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->v:F

    .line 64
    .line 65
    const/high16 v4, 0x3f800000    # 1.0f

    .line 66
    .line 67
    cmpl-float v0, v0, v4

    .line 68
    .line 69
    if-ltz v0, :cond_4

    .line 70
    .line 71
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    cmpl-float v0, v0, v1

    .line 76
    .line 77
    if-lez v0, :cond_4

    .line 78
    .line 79
    iget p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 80
    .line 81
    sget v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->J:I

    .line 82
    .line 83
    iput v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 86
    .line 87
    invoke-interface {v0, v4}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->e(F)V

    .line 88
    .line 89
    .line 90
    iput-boolean v5, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->p:Z

    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 93
    .line 94
    if-ltz p1, :cond_2

    .line 95
    .line 96
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 100
    .line 101
    :goto_1
    iget v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->v:F

    .line 102
    .line 103
    iget-wide v6, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->b:J

    .line 104
    .line 105
    cmp-long v2, v6, v2

    .line 106
    .line 107
    if-eqz v2, :cond_3

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_3
    const/4 v5, 0x0

    .line 111
    :goto_2
    invoke-interface {v0, p0, p1, v1, v5}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->i(Lcom/p1/mobile/putong/core/card/VSwipeCard;Lcom/p1/mobile/putong/core/data/SwipeDirection;FZ)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 116
    .line 117
    iget v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->v:F

    .line 118
    .line 119
    invoke-interface {v0, v2}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->e(F)V

    .line 120
    .line 121
    .line 122
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    neg-float v2, v2

    .line 131
    sget v3, Lcom/p1/mobile/putong/core/card/VSwipeCard;->E:F

    .line 132
    .line 133
    div-float/2addr v2, v3

    .line 134
    cmpl-float v0, v0, v2

    .line 135
    .line 136
    const/high16 v2, 0x40000000    # 2.0f

    .line 137
    .line 138
    if-gtz v0, :cond_5

    .line 139
    .line 140
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    neg-float v0, v0

    .line 145
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->g1()F

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    div-float/2addr v3, v2

    .line 150
    cmpg-float v0, v0, v3

    .line 151
    .line 152
    if-gtz v0, :cond_7

    .line 153
    .line 154
    :cond_5
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    mul-float/2addr v0, v2

    .line 159
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->i1(F)F

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    cmpl-float p1, p1, v1

    .line 164
    .line 165
    if-lez p1, :cond_6

    .line 166
    .line 167
    invoke-virtual {p0, v5, v0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->W0(ZF)V

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_6
    neg-float p1, v0

    .line 172
    invoke-virtual {p0, v5, p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->W0(ZF)V

    .line 173
    .line 174
    .line 175
    :cond_7
    :goto_3
    return-void
.end method

.method public setTranslationY(F)V
    .locals 9

    .line 1
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move p1, v1

    .line 9
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    goto/16 :goto_2

    .line 17
    .line 18
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 19
    .line 20
    sget v2, Lcom/p1/mobile/putong/core/card/VSwipeCard;->J:I

    .line 21
    .line 22
    if-eq v0, v2, :cond_a

    .line 23
    .line 24
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->b:J

    .line 25
    .line 26
    const-wide/16 v4, 0x0

    .line 27
    .line 28
    cmp-long v0, v2, v4

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/high16 v0, -0x3cb80000    # -200.0f

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    move v0, v1

    .line 36
    :goto_0
    sget v2, Lcom/p1/mobile/putong/core/card/VSwipeCard;->C:F

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    mul-float/2addr v2, v3

    .line 47
    add-float/2addr v0, v2

    .line 48
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    add-float/2addr v0, v2

    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->i1(F)F

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iget v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 58
    .line 59
    sget v3, Lcom/p1/mobile/putong/core/card/VSwipeCard;->G:I

    .line 60
    .line 61
    const/4 v6, 0x0

    .line 62
    if-ne v2, v3, :cond_5

    .line 63
    .line 64
    iget v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->v:F

    .line 65
    .line 66
    const/high16 v3, 0x3f800000    # 1.0f

    .line 67
    .line 68
    cmpl-float v2, v2, v3

    .line 69
    .line 70
    if-gez v2, :cond_3

    .line 71
    .line 72
    cmpl-float v0, v0, v3

    .line 73
    .line 74
    if-ltz v0, :cond_5

    .line 75
    .line 76
    :cond_3
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-lez v0, :cond_5

    .line 85
    .line 86
    sget p1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->J:I

    .line 87
    .line 88
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 91
    .line 92
    invoke-interface {p1, v3}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->e(F)V

    .line 93
    .line 94
    .line 95
    const/4 p1, 0x1

    .line 96
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->p:Z

    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h:Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 99
    .line 100
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 101
    .line 102
    iget v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->v:F

    .line 103
    .line 104
    iget-wide v7, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->b:J

    .line 105
    .line 106
    cmp-long v3, v7, v4

    .line 107
    .line 108
    if-eqz v3, :cond_4

    .line 109
    .line 110
    move v6, p1

    .line 111
    :cond_4
    invoke-interface {v0, p0, v1, v2, v6}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->i(Lcom/p1/mobile/putong/core/card/VSwipeCard;Lcom/p1/mobile/putong/core/data/SwipeDirection;FZ)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    neg-float v2, p1

    .line 124
    sget v3, Lcom/p1/mobile/putong/core/card/VSwipeCard;->E:F

    .line 125
    .line 126
    div-float v3, v2, v3

    .line 127
    .line 128
    cmpg-float v0, v0, v3

    .line 129
    .line 130
    if-gtz v0, :cond_a

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->g1()F

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    const/high16 v3, 0x40000000    # 2.0f

    .line 137
    .line 138
    div-float/2addr v0, v3

    .line 139
    cmpl-float v0, v2, v0

    .line 140
    .line 141
    if-gtz v0, :cond_6

    .line 142
    .line 143
    cmpl-float v0, p1, v1

    .line 144
    .line 145
    if-nez v0, :cond_a

    .line 146
    .line 147
    :cond_6
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->k:Z

    .line 148
    .line 149
    if-eqz v0, :cond_7

    .line 150
    .line 151
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->R()Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-nez v0, :cond_7

    .line 156
    .line 157
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->l:Z

    .line 158
    .line 159
    if-nez v0, :cond_7

    .line 160
    .line 161
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->o:Z

    .line 162
    .line 163
    if-nez v0, :cond_7

    .line 164
    .line 165
    invoke-virtual {p0, v6, v1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->W0(ZF)V

    .line 166
    .line 167
    .line 168
    return-void

    .line 169
    :cond_7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->R()Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-eqz v0, :cond_8

    .line 174
    .line 175
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    mul-float/2addr v0, v3

    .line 180
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j1(F)F

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    goto :goto_1

    .line 185
    :cond_8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->g1()F

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    div-float/2addr v0, v3

    .line 190
    add-float/2addr v0, p1

    .line 191
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    mul-float/2addr v0, v3

    .line 196
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j1(F)F

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    :goto_1
    cmpg-float v2, p1, v1

    .line 201
    .line 202
    if-ltz v2, :cond_9

    .line 203
    .line 204
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->R()Z

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    if-eqz v2, :cond_a

    .line 209
    .line 210
    cmpl-float p1, p1, v1

    .line 211
    .line 212
    if-nez p1, :cond_a

    .line 213
    .line 214
    :cond_9
    mul-float/2addr v0, v3

    .line 215
    invoke-virtual {p0, v6, v0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->W0(ZF)V

    .line 216
    .line 217
    .line 218
    :cond_a
    :goto_2
    return-void
.end method
