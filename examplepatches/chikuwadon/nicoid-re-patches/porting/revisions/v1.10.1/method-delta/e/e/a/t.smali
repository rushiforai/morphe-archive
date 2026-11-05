.class public Le/e/a/t;
.super Landroid/view/SurfaceView;
.source ""

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/view/SurfaceHolder$Callback;
.implements Le/e/a/l3/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/t$d;
    }
.end annotation


# instance fields
.field public A:Z

.field public B:Z

.field public C:Z

.field public D:Z

.field public E:Le/e/a/n0;

.field public F:Le/e/a/l3/c;

.field public G:[Ljava/lang/String;

.field public H:I

.field public I:F

.field public J:F

.field public K:F

.field public L:F

.field public M:F

.field public N:F

.field public O:F

.field public P:F

.field public Q:F

.field public R:F

.field public S:I

.field public T:I

.field public U:I

.field public V:I

.field public W:I

.field public a:I

.field public a0:I

.field public b:Z

.field public b0:J

.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/q;",
            ">;"
        }
    .end annotation
.end field

.field public c0:I

.field public d:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Float;",
            "Le/e/a/t$d;",
            ">;"
        }
    .end annotation
.end field

.field public d0:I

.field public e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Float;",
            "Le/e/a/t$d;",
            ">;"
        }
    .end annotation
.end field

.field public e0:I

.field public f:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Float;",
            "Le/e/a/t$d;",
            ">;"
        }
    .end annotation
.end field

.field public f0:I

.field public g:Z

.field public g0:I

.field public h0:J

.field public i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/q;",
            ">;"
        }
    .end annotation
.end field

.field public i0:F

.field public j:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Float;",
            "Le/e/a/t$d;",
            ">;"
        }
    .end annotation
.end field

.field public j0:J

.field public k:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Float;",
            "Le/e/a/t$d;",
            ">;"
        }
    .end annotation
.end field

.field public k0:I

.field public l:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Float;",
            "Le/e/a/t$d;",
            ">;"
        }
    .end annotation
.end field

.field public l0:I

.field public m:Z

.field public m0:I

.field public n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/q;",
            ">;"
        }
    .end annotation
.end field

.field public n0:I

.field public o:Z

.field public o0:I

.field public p:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/q;",
            ">;"
        }
    .end annotation
.end field

.field public p0:Z

.field public q:[Ljava/lang/Float;

.field public q0:Z

.field public r:Z

.field public r0:I

.field public s:Z

.field public s0:Landroid/graphics/Paint;

.field public t:Landroid/view/SurfaceHolder;

.field public t0:Z

.field public u:Ljava/lang/Thread;

.field public v:Z

.field public w:Z

.field public x:Z

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Le/e/a/v;)V
    .registers 7

    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    const/16 p1, 0x1e

    iput p1, p0, Le/e/a/t;->a:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/t;->b:Z

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Le/e/a/t;->d:Ljava/util/HashMap;

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Le/e/a/t;->e:Ljava/util/HashMap;

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Le/e/a/t;->f:Ljava/util/HashMap;

    iput-boolean p1, p0, Le/e/a/t;->g:Z

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Le/e/a/t;->j:Ljava/util/HashMap;

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Le/e/a/t;->k:Ljava/util/HashMap;

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Le/e/a/t;->l:Ljava/util/HashMap;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-boolean p1, p0, Le/e/a/t;->m:Z

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Le/e/a/t;->n:Ljava/util/ArrayList;

    iput-boolean p1, p0, Le/e/a/t;->o:Z

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Le/e/a/t;->p:Ljava/util/ArrayList;

    const/4 p2, 0x5

    new-array p2, p2, [Ljava/lang/Float;

    const/high16 v0, -0x40800000    # -1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, p2, p1

    const/4 v1, 0x1

    aput-object v0, p2, v1

    const/4 v2, 0x2

    aput-object v0, p2, v2

    const/4 v3, 0x3

    aput-object v0, p2, v3

    const/4 v3, 0x4

    aput-object v0, p2, v3

    iput-object p2, p0, Le/e/a/t;->q:[Ljava/lang/Float;

    iput-boolean p1, p0, Le/e/a/t;->r:Z

    iput-boolean p1, p0, Le/e/a/t;->s:Z

    iput-boolean p1, p0, Le/e/a/t;->v:Z

    iput-boolean p1, p0, Le/e/a/t;->w:Z

    iput-boolean p1, p0, Le/e/a/t;->x:Z

    iput-boolean p1, p0, Le/e/a/t;->y:Z

    iput-boolean p1, p0, Le/e/a/t;->z:Z

    iput-boolean p1, p0, Le/e/a/t;->A:Z

    iput-boolean p1, p0, Le/e/a/t;->B:Z

    iput-boolean p1, p0, Le/e/a/t;->C:Z

    iput-boolean p1, p0, Le/e/a/t;->D:Z

    new-array p2, v2, [Ljava/lang/String;

    const-string v0, ""

    aput-object v0, p2, p1

    aput-object v0, p2, v1

    iput-object p2, p0, Le/e/a/t;->G:[Ljava/lang/String;

    iput p1, p0, Le/e/a/t;->H:I

    const/4 p2, 0x0

    iput p2, p0, Le/e/a/t;->I:F

    iput p2, p0, Le/e/a/t;->J:F

    iput p2, p0, Le/e/a/t;->K:F

    iput p2, p0, Le/e/a/t;->L:F

    iput p2, p0, Le/e/a/t;->M:F

    iput p2, p0, Le/e/a/t;->N:F

    iput p2, p0, Le/e/a/t;->O:F

    iput p2, p0, Le/e/a/t;->P:F

    iput p2, p0, Le/e/a/t;->Q:F

    iput p2, p0, Le/e/a/t;->R:F

    const/16 p2, 0x190

    iput p2, p0, Le/e/a/t;->S:I

    const/16 p2, 0x12c

    iput p2, p0, Le/e/a/t;->T:I

    const/16 p2, 0x28

    iput p2, p0, Le/e/a/t;->U:I

    iput p1, p0, Le/e/a/t;->V:I

    iput p1, p0, Le/e/a/t;->W:I

    const/16 p2, 0xff

    iput p2, p0, Le/e/a/t;->a0:I

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Le/e/a/t;->b0:J

    invoke-static {p1, p1, p1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Le/e/a/t;->c0:I

    invoke-static {p2, p2, p2}, Landroid/graphics/Color;->rgb(III)I

    move-result p2

    iput p2, p0, Le/e/a/t;->d0:I

    iget p2, p0, Le/e/a/t;->d0:I

    iput p2, p0, Le/e/a/t;->e0:I

    iput p1, p0, Le/e/a/t;->f0:I

    iput p1, p0, Le/e/a/t;->g0:I

    iput-wide v2, p0, Le/e/a/t;->j0:J

    iput p1, p0, Le/e/a/t;->k0:I

    iput p1, p0, Le/e/a/t;->l0:I

    iput p1, p0, Le/e/a/t;->m0:I

    const/4 p2, -0x1

    iput p2, p0, Le/e/a/t;->n0:I

    iput p1, p0, Le/e/a/t;->o0:I

    iput-boolean p1, p0, Le/e/a/t;->p0:Z

    iput-boolean p1, p0, Le/e/a/t;->q0:Z

    iput p1, p0, Le/e/a/t;->r0:I

    new-instance p1, Landroid/graphics/Paint;

    const/16 p2, 0x81

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-static/range {p0 .. p0}, Le/e/a/CommentStyle;->bind(Landroid/view/View;)V

    iput-boolean v1, p0, Le/e/a/t;->t0:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/Float;Le/e/a/v;)V
    .registers 9

    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    const/16 p3, 0x1e

    iput p3, p0, Le/e/a/t;->a:I

    const/4 p3, 0x0

    iput-boolean p3, p0, Le/e/a/t;->b:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/t;->d:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/t;->e:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/t;->f:Ljava/util/HashMap;

    iput-boolean p3, p0, Le/e/a/t;->g:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/t;->j:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/t;->k:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/t;->l:Ljava/util/HashMap;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-boolean p3, p0, Le/e/a/t;->m:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/t;->n:Ljava/util/ArrayList;

    iput-boolean p3, p0, Le/e/a/t;->o:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/t;->p:Ljava/util/ArrayList;

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Float;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    aput-object v1, v0, p3

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const/4 v3, 0x2

    aput-object v1, v0, v3

    const/4 v4, 0x3

    aput-object v1, v0, v4

    const/4 v4, 0x4

    aput-object v1, v0, v4

    iput-object v0, p0, Le/e/a/t;->q:[Ljava/lang/Float;

    iput-boolean p3, p0, Le/e/a/t;->r:Z

    iput-boolean p3, p0, Le/e/a/t;->s:Z

    iput-boolean p3, p0, Le/e/a/t;->v:Z

    iput-boolean p3, p0, Le/e/a/t;->w:Z

    iput-boolean p3, p0, Le/e/a/t;->x:Z

    iput-boolean p3, p0, Le/e/a/t;->y:Z

    iput-boolean p3, p0, Le/e/a/t;->z:Z

    iput-boolean p3, p0, Le/e/a/t;->A:Z

    iput-boolean p3, p0, Le/e/a/t;->B:Z

    iput-boolean p3, p0, Le/e/a/t;->C:Z

    iput-boolean p3, p0, Le/e/a/t;->D:Z

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, ""

    aput-object v1, v0, p3

    aput-object v1, v0, v2

    iput-object v0, p0, Le/e/a/t;->G:[Ljava/lang/String;

    iput p3, p0, Le/e/a/t;->H:I

    const/4 v0, 0x0

    iput v0, p0, Le/e/a/t;->I:F

    iput v0, p0, Le/e/a/t;->J:F

    iput v0, p0, Le/e/a/t;->K:F

    iput v0, p0, Le/e/a/t;->L:F

    iput v0, p0, Le/e/a/t;->M:F

    iput v0, p0, Le/e/a/t;->N:F

    iput v0, p0, Le/e/a/t;->O:F

    iput v0, p0, Le/e/a/t;->P:F

    iput v0, p0, Le/e/a/t;->Q:F

    iput v0, p0, Le/e/a/t;->R:F

    const/16 v0, 0x190

    iput v0, p0, Le/e/a/t;->S:I

    const/16 v0, 0x12c

    iput v0, p0, Le/e/a/t;->T:I

    const/16 v0, 0x28

    iput v0, p0, Le/e/a/t;->U:I

    iput p3, p0, Le/e/a/t;->V:I

    iput p3, p0, Le/e/a/t;->W:I

    const/16 v0, 0xff

    iput v0, p0, Le/e/a/t;->a0:I

    const-wide/16 v3, 0x0

    iput-wide v3, p0, Le/e/a/t;->b0:J

    invoke-static {p3, p3, p3}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    iput v1, p0, Le/e/a/t;->c0:I

    invoke-static {v0, v0, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Le/e/a/t;->d0:I

    iget v0, p0, Le/e/a/t;->d0:I

    iput v0, p0, Le/e/a/t;->e0:I

    iput p3, p0, Le/e/a/t;->f0:I

    iput p3, p0, Le/e/a/t;->g0:I

    iput-wide v3, p0, Le/e/a/t;->j0:J

    iput p3, p0, Le/e/a/t;->k0:I

    iput p3, p0, Le/e/a/t;->l0:I

    iput p3, p0, Le/e/a/t;->m0:I

    const/4 v0, -0x1

    iput v0, p0, Le/e/a/t;->n0:I

    iput p3, p0, Le/e/a/t;->o0:I

    iput-boolean p3, p0, Le/e/a/t;->p0:Z

    iput-boolean p3, p0, Le/e/a/t;->q0:Z

    iput p3, p0, Le/e/a/t;->r0:I

    new-instance v0, Landroid/graphics/Paint;

    const/16 v1, 0x81

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-static/range {p0 .. p0}, Le/e/a/CommentStyle;->bind(Landroid/view/View;)V

    iput-boolean v2, p0, Le/e/a/t;->t0:Z

    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Le/e/a/t;->t:Landroid/view/SurfaceHolder;

    iget-object v0, p0, Le/e/a/t;->t:Landroid/view/SurfaceHolder;

    const/4 v1, -0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setFormat(I)V

    iget-object v0, p0, Le/e/a/t;->t:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    invoke-virtual {p0, v2}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    iput p2, p0, Le/e/a/t;->O:F

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string p2, "comment_hide"

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_11d

    invoke-virtual {p0, v2}, Le/e/a/t;->b(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_11d

    invoke-virtual {p0, p3}, Le/e/a/t;->b(Z)Ljava/lang/Boolean;

    :cond_11d
    const-string p2, "player_no_wait"

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p0, Le/e/a/t;->A:Z

    const-string p2, "comment_fps"

    const-string p3, "60"

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    iput p2, p0, Le/e/a/t;->a:I

    const-string p2, "comment_shadow"

    const-string p3, "0"

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    iput p2, p0, Le/e/a/t;->H:I

    const-string p2, "comment_alpha"

    const-string p3, "255"

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Le/e/a/t;->a0:I

    return-void
.end method


# virtual methods
.method public final a(FF)V
    .registers 4

    iput p1, p0, Le/e/a/t;->I:F

    iput p2, p0, Le/e/a/t;->J:F

    iget p1, p0, Le/e/a/t;->J:F

    const/high16 p2, 0x41600000    # 14.0f

    div-float/2addr p1, p2

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Le/e/a/ModernEnhancements;->commentSize(Landroid/content/Context;F)F

    move-result p1

    iput p1, p0, Le/e/a/t;->K:F

    iget p1, p0, Le/e/a/t;->K:F

    const/high16 p2, 0x40400000    # 3.0f

    mul-float p2, p2, p1

    const/high16 v0, 0x41300000    # 11.0f

    div-float/2addr p2, v0

    iput p2, p0, Le/e/a/t;->P:F

    const p2, 0x3f2b851f    # 0.67f

    mul-float p2, p2, p1

    iput p2, p0, Le/e/a/t;->L:F

    const p2, 0x3fb5c28f    # 1.42f

    mul-float p1, p1, p2

    iput p1, p0, Le/e/a/t;->M:F

    iget p1, p0, Le/e/a/t;->H:I

    if-nez p1, :cond_39

    iget p1, p0, Le/e/a/t;->P:F

    const p2, 0x4019999a    # 2.4f

    :goto_35
    div-float/2addr p1, p2

    iput p1, p0, Le/e/a/t;->R:F

    goto :goto_41

    :cond_39
    const/4 p2, 0x1

    if-ne p1, p2, :cond_41

    iget p1, p0, Le/e/a/t;->P:F

    const/high16 p2, 0x40200000    # 2.5f

    goto :goto_35

    :cond_41
    :goto_41
    return-void
.end method

.method public final declared-synchronized a(Landroid/graphics/Canvas;Ljava/util/ArrayList;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/HashMap;)V
    .registers 42
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Ljava/util/ArrayList<",
            "Le/e/a/q;",
            ">;",
            "Ljava/util/HashMap<",
            "Ljava/lang/Float;",
            "Le/e/a/t$d;",
            ">;",
            "Ljava/util/HashMap<",
            "Ljava/lang/Float;",
            "Le/e/a/t$d;",
            ">;",
            "Ljava/util/HashMap<",
            "Ljava/lang/Float;",
            "Le/e/a/t$d;",
            ">;)V"
        }
    .end annotation

    invoke-static/range {p0 .. p1}, Le/e/a/CommentViewport190;->begin(Ljava/lang/Object;Landroid/graphics/Canvas;)V

    invoke-static/range {p0 .. p0}, Le/e/a/CommentMotion;->frame(Ljava/lang/Object;)V

    invoke-static/range {p0 .. p2}, Le/e/a/CommentVisuals;->scrolling(Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p2

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    monitor-enter p0

    :try_start_17
    invoke-virtual/range {p3 .. p3}, Ljava/util/HashMap;->size()I

    move-result v7

    invoke-virtual/range {p5 .. p5}, Ljava/util/HashMap;->size()I

    move-result v8

    invoke-virtual/range {p4 .. p4}, Ljava/util/HashMap;->size()I

    move-result v9

    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    move v13, v7

    move v12, v9

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    :goto_2f
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_8c2

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v11, v17

    check-cast v11, Le/e/a/q;

    move-object/from16 v17, v10

    iget-object v10, v11, Le/e/a/q;->d:Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    int-to-float v10, v10

    move/from16 v19, v7

    iget-boolean v7, v1, Le/e/a/t;->q0:Z

    if-nez v7, :cond_5e

    iget v7, v1, Le/e/a/t;->V:I

    int-to-float v7, v7

    cmpg-float v7, v7, v10

    if-gez v7, :cond_5e

    iget v7, v1, Le/e/a/t;->V:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iput-object v7, v11, Le/e/a/q;->d:Ljava/lang/Integer;

    iget v7, v1, Le/e/a/t;->V:I

    int-to-float v10, v7

    :cond_5e
    invoke-static {v1, v11, v10}, Le/e/a/CommentMotion;->start(Ljava/lang/Object;Ljava/lang/Object;F)F

    move-result v10

    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v7

    sub-float/2addr v7, v10

    move/from16 v20, v15

    iget-object v15, v11, Le/e/a/q;->e:Ljava/lang/Integer;

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    int-to-float v15, v15

    move/from16 v21, v12

    iget-object v12, v11, Le/e/a/q;->k:Ljava/lang/Integer;

    iget-object v5, v11, Le/e/a/q;->j:Ljava/lang/Integer;

    if-nez v5, :cond_7e

    iget v5, v1, Le/e/a/t;->g0:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    :cond_7e
    if-eqz v12, :cond_8a

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v22

    if-nez v22, :cond_87

    goto :goto_8a

    :cond_87
    :goto_87
    move/from16 v22, v14

    goto :goto_9a

    :cond_8a
    :goto_8a
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v12

    if-nez v12, :cond_93

    iget v12, v1, Le/e/a/t;->S:I

    goto :goto_95

    :cond_93
    iget v12, v1, Le/e/a/t;->T:I

    :goto_95
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    goto :goto_87

    :goto_9a
    iget-object v14, v1, Le/e/a/t;->q:[Ljava/lang/Float;

    const/16 v18, 0x0

    aget-object v14, v14, v18

    invoke-virtual {v14}, Ljava/lang/Float;->floatValue()F

    move-result v14

    move/from16 v23, v8

    cmpl-float v14, v14, v15

    if-nez v14, :cond_ac

    const/4 v14, 0x1

    goto :goto_ad

    :cond_ac
    const/4 v14, 0x0

    :goto_ad
    iget-boolean v8, v11, Le/e/a/q;->o:Z

    if-nez v8, :cond_89b

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v8

    int-to-float v8, v8

    cmpg-float v8, v7, v8

    if-gez v8, :cond_c1

    iget v8, v1, Le/e/a/t;->I:F

    neg-float v8, v8

    cmpl-float v8, v7, v8

    if-gtz v8, :cond_c3

    :cond_c1
    if-eqz v14, :cond_89b

    :cond_c3
    iget-object v8, v11, Le/e/a/q;->f:Ljava/lang/Integer;

    if-nez v8, :cond_cd

    iget v8, v1, Le/e/a/t;->e0:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    :cond_cd
    iget-object v6, v11, Le/e/a/q;->i:Ljava/lang/Integer;

    if-nez v6, :cond_d7

    iget v6, v1, Le/e/a/t;->f0:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    :cond_d7
    const/16 v18, 0x0

    invoke-static/range {v18 .. v18}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move/from16 v24, v7

    iget-boolean v7, v11, Le/e/a/q;->p:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    move-object/from16 v25, v7

    iget-object v7, v11, Le/e/a/q;->g:Ljava/lang/Integer;

    if-nez v7, :cond_f0

    iget v7, v1, Le/e/a/t;->c0:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    :cond_f0
    move-object/from16 v26, v7

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iget v2, v1, Le/e/a/t;->c0:I

    if-ne v7, v2, :cond_100

    iget v2, v1, Le/e/a/t;->d0:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    :cond_100
    iget v2, v1, Le/e/a/t;->K:F

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v7

    move/from16 v27, v2

    const/4 v2, 0x1

    if-ne v7, v2, :cond_10e

    iget v2, v1, Le/e/a/t;->L:F

    goto :goto_11a

    :cond_10e
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v7, 0x2

    if-ne v2, v7, :cond_118

    iget v2, v1, Le/e/a/t;->M:F

    goto :goto_11a

    :cond_118
    move/from16 v2, v27

    :goto_11a
    iget-object v7, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual {v7, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v7, v11, Le/e/a/q;->a:Ljava/lang/String;

    iget-object v11, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual {v11, v7}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v11

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v27

    move-object/from16 v29, v7

    const v30, 0x3eb33333    # 0.35f

    if-nez v27, :cond_3f4

    const/high16 v24, 0x42c80000    # 100.0f

    sub-float v10, v10, v24

    iget v7, v1, Le/e/a/t;->I:F

    add-float/2addr v7, v11

    move/from16 v31, v2

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v7, v2

    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v2

    sub-float v2, v10, v2

    mul-float v2, v2, v7

    move/from16 v24, v7

    iget v7, v1, Le/e/a/t;->I:F

    add-float/2addr v2, v7

    iget v7, v1, Le/e/a/t;->I:F

    const/high16 v32, 0x3f800000    # 1.0f

    cmpl-float v7, v2, v7

    if-lez v7, :cond_158

    :cond_156
    :goto_156
    const/4 v7, 0x0

    goto :goto_182

    :cond_158
    add-float v7, v2, v11

    const/16 v27, 0x0

    cmpg-float v7, v7, v27

    if-gez v7, :cond_181

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_156

    if-eqz v14, :cond_177

    iget-object v7, v1, Le/e/a/t;->q:[Ljava/lang/Float;

    const/16 v33, 0x3

    invoke-static/range {v32 .. v32}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v34

    aput-object v34, v7, v33

    goto :goto_17e

    :cond_177
    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_17e
    add-int/lit8 v13, v13, -0x1

    goto :goto_156

    :cond_181
    const/4 v7, 0x1

    :goto_182
    if-eqz v14, :cond_185

    const/4 v7, 0x1

    :cond_185
    if-eqz v7, :cond_3ee

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Le/e/a/t$d;

    if-eqz v7, :cond_1b7

    if-eqz v14, :cond_1a8

    iget-object v2, v1, Le/e/a/t;->q:[Ljava/lang/Float;

    const/4 v5, 0x1

    aget-object v2, v2, v5

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget-object v5, v1, Le/e/a/t;->q:[Ljava/lang/Float;

    const/4 v6, 0x2

    aget-object v5, v5, v6

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    goto :goto_1b1

    :cond_1a8
    iget-object v5, v7, Le/e/a/t$d;->b:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iget v6, v1, Le/e/a/t;->P:F

    sub-float/2addr v5, v6

    :goto_1b1
    move/from16 v34, v9

    move/from16 v7, v19

    goto/16 :goto_339

    :cond_1b7
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Le/e/a/q;

    iput-object v8, v7, Le/e/a/q;->f:Ljava/lang/Integer;

    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Le/e/a/q;

    iput-object v6, v7, Le/e/a/q;->i:Ljava/lang/Integer;

    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le/e/a/q;

    iput-object v5, v6, Le/e/a/q;->j:Ljava/lang/Integer;

    new-instance v5, Ljava/util/ArrayList;

    invoke-virtual/range {p3 .. p3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v6, Le/e/a/t$a;

    invoke-direct {v6, v1}, Le/e/a/t$a;-><init>(Le/e/a/t;)V

    invoke-static {v5, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    const/4 v7, 0x0

    const/16 v19, 0x0

    :goto_1e7
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_2ca

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Ljava/util/Map$Entry;

    invoke-interface/range {v28 .. v28}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v28

    move/from16 v33, v2

    move-object/from16 v2, v28

    check-cast v2, Le/e/a/t$d;

    move-object/from16 v28, v6

    iget-object v6, v2, Le/e/a/t$d;->g:Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    const/16 v27, 0x0

    cmpl-float v6, v6, v27

    if-nez v6, :cond_2be

    iget v6, v1, Le/e/a/t;->P:F

    sub-float v6, v7, v6

    iget-object v3, v2, Le/e/a/t$d;->b:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    cmpg-float v3, v6, v3

    if-gez v3, :cond_2be

    iget-object v3, v2, Le/e/a/t$d;->c:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    add-float v6, v7, v31

    move/from16 v34, v9

    iget v9, v1, Le/e/a/t;->P:F

    add-float/2addr v6, v9

    cmpg-float v3, v3, v6

    if-gez v3, :cond_2c0

    iget v3, v1, Le/e/a/t;->I:F

    iget-object v6, v2, Le/e/a/t$d;->f:Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    add-float/2addr v3, v6

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v3, v6

    iget-object v6, v2, Le/e/a/t$d;->d:Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v7

    sub-float/2addr v6, v7

    mul-float v6, v6, v3

    iget-object v7, v2, Le/e/a/t$d;->f:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    add-float/2addr v6, v7

    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v7

    sub-float v7, v10, v7

    mul-float v7, v7, v24

    cmpg-float v6, v6, v7

    if-gtz v6, :cond_2ae

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-float v6, v6

    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v7

    iget-object v9, v2, Le/e/a/t$d;->d:Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    sub-float/2addr v7, v9

    sub-float/2addr v6, v7

    iget-object v7, v2, Le/e/a/t$d;->d:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v9

    add-float/2addr v9, v6

    sub-float/2addr v7, v9

    mul-float v7, v7, v3

    iget-object v3, v2, Le/e/a/t$d;->f:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    add-float/2addr v7, v3

    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v3

    add-float/2addr v3, v6

    sub-float v3, v10, v3

    mul-float v3, v3, v24

    cmpg-float v3, v7, v3

    if-gtz v3, :cond_29d

    iget-object v2, v2, Le/e/a/t$d;->a:Ljava/lang/Float;

    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/t$d;

    invoke-static/range {v32 .. v32}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, v2, Le/e/a/t$d;->g:Ljava/lang/Float;

    move/from16 v2, v19

    goto :goto_2a9

    :cond_29d
    iget-object v3, v2, Le/e/a/t$d;->b:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v19

    iget-object v2, v2, Le/e/a/t$d;->b:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    :goto_2a9
    move/from16 v7, v19

    move/from16 v19, v2

    goto :goto_2c0

    :cond_2ae
    iget-object v3, v2, Le/e/a/t$d;->b:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    iget-object v2, v2, Le/e/a/t$d;->b:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    move/from16 v19, v2

    move v7, v3

    goto :goto_2c0

    :cond_2be
    move/from16 v34, v9

    :cond_2c0
    :goto_2c0
    move-object/from16 v3, p2

    move-object/from16 v6, v28

    move/from16 v2, v33

    move/from16 v9, v34

    goto/16 :goto_1e7

    :cond_2ca
    move/from16 v33, v2

    move/from16 v34, v9

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    iget v2, v1, Le/e/a/t;->P:F

    add-float v2, v31, v2

    add-float/2addr v2, v7

    iget v3, v1, Le/e/a/t;->P:F

    sub-float v3, v2, v3

    iget v5, v1, Le/e/a/t;->J:F

    cmpl-float v3, v3, v5

    if-lez v3, :cond_2f4

    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    iget v3, v1, Le/e/a/t;->J:F

    sub-float v3, v3, v31

    float-to-int v3, v3

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    int-to-float v2, v2

    add-float v2, v2, v31

    const/high16 v3, 0x40000000    # 2.0f

    goto :goto_2f5

    :cond_2f4
    const/4 v3, 0x0

    :goto_2f5
    new-instance v5, Le/e/a/t$d;

    invoke-direct {v5, v1}, Le/e/a/t$d;-><init>(Le/e/a/t;)V

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    iput-object v6, v5, Le/e/a/t$d;->a:Ljava/lang/Float;

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    iput-object v6, v5, Le/e/a/t$d;->b:Ljava/lang/Float;

    sub-float v6, v2, v31

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    iput-object v6, v5, Le/e/a/t$d;->c:Ljava/lang/Float;

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    iput-object v6, v5, Le/e/a/t$d;->d:Ljava/lang/Float;

    invoke-static/range {v31 .. v31}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    iput-object v6, v5, Le/e/a/t$d;->e:Ljava/lang/Float;

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    iput-object v6, v5, Le/e/a/t$d;->f:Ljava/lang/Float;

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, v5, Le/e/a/t$d;->g:Ljava/lang/Float;

    iput-object v12, v5, Le/e/a/t$d;->h:Ljava/lang/Integer;

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v4, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v13, v13, 0x1

    iget v3, v1, Le/e/a/t;->P:F

    sub-float v5, v2, v3

    move/from16 v2, v33

    move/from16 v7, v34

    :goto_339
    add-int/lit8 v16, v16, 0x1

    sub-int v3, v13, v16

    iget v6, v1, Le/e/a/t;->U:I

    if-le v3, v6, :cond_348

    if-eqz v14, :cond_344

    goto :goto_348

    :cond_344
    move-object/from16 v9, p1

    goto/16 :goto_3ea

    :cond_348
    :goto_348
    iget v3, v1, Le/e/a/t;->H:I

    if-nez v3, :cond_37e

    iget-object v3, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    iget v6, v1, Le/e/a/t;->R:F

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v3, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    iget v6, v1, Le/e/a/t;->a0:I

    int-to-float v6, v6

    mul-float v6, v6, v30

    float-to-int v6, v6

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v3, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    move-object/from16 v9, p1

    move-object/from16 v14, v29

    invoke-static {v9, v14, v2, v5, v3}, Le/e/a/CommentVisuals;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v3, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    goto :goto_393

    :cond_37e
    move-object/from16 v9, p1

    move-object/from16 v14, v29

    iget v3, v1, Le/e/a/t;->H:I

    const/4 v6, 0x1

    if-ne v3, v6, :cond_393

    iget-object v3, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    iget v6, v1, Le/e/a/t;->R:F

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const/4 v12, 0x0

    invoke-virtual {v3, v6, v12, v12, v10}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    :cond_393
    :goto_393
    iget-object v3, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    iget v6, v1, Le/e/a/t;->a0:I

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v3, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-static {v9, v14, v2, v5, v3}, Le/e/a/CommentVisuals;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_3ea

    iget-object v3, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    const/16 v6, -0x100

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    iget v6, v1, Le/e/a/t;->a0:I

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v3, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    const/high16 v6, 0x40000000    # 2.0f

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    new-instance v3, Landroid/graphics/Rect;

    float-to-int v8, v2

    iget v10, v1, Le/e/a/t;->P:F

    div-float/2addr v10, v6

    add-float/2addr v10, v5

    sub-float v10, v10, v31

    float-to-int v10, v10

    add-float/2addr v2, v11

    float-to-int v2, v2

    iget v11, v1, Le/e/a/t;->P:F

    div-float/2addr v11, v6

    add-float/2addr v11, v5

    float-to-int v5, v11

    invoke-direct {v3, v8, v10, v2, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual {v9, v3, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    :cond_3ea
    :goto_3ea
    move/from16 v19, v7

    goto/16 :goto_652

    :cond_3ee
    move/from16 v34, v9

    move-object/from16 v9, p1

    goto/16 :goto_652

    :cond_3f4
    move/from16 v31, v2

    move/from16 v34, v9

    move-object/from16 v14, v29

    move-object/from16 v9, p1

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v7, 0x1

    if-ne v2, v7, :cond_660

    const/4 v2, 0x0

    cmpg-float v7, v24, v2

    if-gez v7, :cond_40c

    move-object/from16 v7, p5

    :cond_40a
    :goto_40a
    const/4 v2, 0x0

    goto :goto_430

    :cond_40c
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-float v2, v2

    cmpl-float v2, v24, v2

    if-lez v2, :cond_42d

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    move-object/from16 v7, p5

    invoke-virtual {v7, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_40a

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v23, -0x1

    move/from16 v23, v2

    goto :goto_40a

    :cond_42d
    move-object/from16 v7, p5

    const/4 v2, 0x1

    :goto_430
    if-eqz v2, :cond_64e

    iget v2, v1, Le/e/a/t;->J:F

    iget v3, v1, Le/e/a/t;->P:F

    sub-float/2addr v2, v3

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/t$d;

    if-eqz v3, :cond_465

    iget-object v2, v3, Le/e/a/t$d;->b:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget v5, v1, Le/e/a/t;->P:F

    add-float/2addr v2, v5

    iget-object v5, v3, Le/e/a/t$d;->c:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iget-object v6, v3, Le/e/a/t$d;->e:Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    iget-object v3, v3, Le/e/a/t$d;->f:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    move v11, v3

    move/from16 v32, v13

    move-object/from16 v3, p2

    goto/16 :goto_599

    :cond_465
    move-object/from16 v3, p2

    move/from16 v24, v2

    move/from16 v2, v34

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v4, v19

    check-cast v4, Le/e/a/q;

    iput-object v8, v4, Le/e/a/q;->f:Ljava/lang/Integer;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/q;

    iput-object v6, v4, Le/e/a/q;->i:Ljava/lang/Integer;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/q;

    iput-object v5, v4, Le/e/a/q;->j:Ljava/lang/Integer;

    iget v4, v1, Le/e/a/t;->I:F

    cmpg-float v4, v4, v11

    if-gez v4, :cond_4a4

    iget v4, v1, Le/e/a/t;->I:F

    iget v5, v1, Le/e/a/t;->O:F

    const/high16 v6, 0x41200000    # 10.0f

    mul-float v5, v5, v6

    sub-float/2addr v4, v5

    div-float/2addr v4, v11

    mul-float v4, v4, v31

    iget-object v5, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v5, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual {v5, v14}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v11

    move v6, v4

    goto :goto_4a6

    :cond_4a4
    move/from16 v6, v31

    :goto_4a6
    new-instance v4, Ljava/util/ArrayList;

    invoke-virtual/range {p5 .. p5}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v5, Le/e/a/t$b;

    invoke-direct {v5, v1}, Le/e/a/t$b;-><init>(Le/e/a/t;)V

    invoke-static {v4, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_4bb
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_539

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/util/Map$Entry;

    invoke-interface/range {v19 .. v19}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v28, v5

    move-object/from16 v5, v19

    check-cast v5, Le/e/a/t$d;

    sub-float v19, v24, v6

    move/from16 v32, v13

    iget v13, v1, Le/e/a/t;->P:F

    sub-float v19, v19, v13

    iget-object v13, v5, Le/e/a/t$d;->b:Ljava/lang/Float;

    invoke-virtual {v13}, Ljava/lang/Float;->floatValue()F

    move-result v13

    cmpg-float v13, v19, v13

    if-gez v13, :cond_530

    iget-object v13, v5, Le/e/a/t$d;->b:Ljava/lang/Float;

    invoke-virtual {v13}, Ljava/lang/Float;->floatValue()F

    move-result v13

    move/from16 v34, v2

    iget-object v2, v5, Le/e/a/t$d;->e:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    sub-float/2addr v13, v2

    iget v2, v1, Le/e/a/t;->P:F

    add-float v2, v24, v2

    cmpg-float v2, v13, v2

    if-gez v2, :cond_532

    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v2

    iget-object v13, v5, Le/e/a/t$d;->d:Ljava/lang/Float;

    invoke-virtual {v13}, Ljava/lang/Float;->floatValue()F

    move-result v13

    sub-float/2addr v2, v13

    iget-object v13, v5, Le/e/a/t$d;->h:Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    int-to-float v13, v13

    cmpl-float v2, v2, v13

    if-lez v2, :cond_520

    iget-object v2, v5, Le/e/a/t$d;->a:Ljava/lang/Float;

    invoke-virtual {v7, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_532

    iget-object v2, v5, Le/e/a/t$d;->a:Ljava/lang/Float;

    invoke-virtual {v7, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v23, v23, -0x1

    goto :goto_532

    :cond_520
    iget-object v2, v5, Le/e/a/t$d;->b:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget-object v5, v5, Le/e/a/t$d;->e:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    sub-float/2addr v2, v5

    move/from16 v24, v2

    goto :goto_532

    :cond_530
    move/from16 v34, v2

    :cond_532
    :goto_532
    move-object/from16 v5, v28

    move/from16 v13, v32

    move/from16 v2, v34

    goto :goto_4bb

    :cond_539
    move/from16 v34, v2

    move/from16 v32, v13

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    cmpg-float v2, v24, v6

    if-gez v2, :cond_554

    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    iget v4, v1, Le/e/a/t;->J:F

    sub-float/2addr v4, v6

    float-to-int v4, v4

    invoke-virtual {v2, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v2, v6

    goto :goto_556

    :cond_554
    move/from16 v2, v24

    :goto_556
    iget v4, v1, Le/e/a/t;->I:F

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    div-float v13, v11, v5

    sub-float v5, v4, v13

    new-instance v4, Le/e/a/t$d;

    invoke-direct {v4, v1}, Le/e/a/t$d;-><init>(Le/e/a/t;)V

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v13

    iput-object v13, v4, Le/e/a/t$d;->a:Ljava/lang/Float;

    iget v13, v1, Le/e/a/t;->P:F

    sub-float v13, v2, v13

    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v13

    iput-object v13, v4, Le/e/a/t$d;->b:Ljava/lang/Float;

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v13

    iput-object v13, v4, Le/e/a/t$d;->c:Ljava/lang/Float;

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    iput-object v10, v4, Le/e/a/t$d;->d:Ljava/lang/Float;

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    iput-object v10, v4, Le/e/a/t$d;->e:Ljava/lang/Float;

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    iput-object v10, v4, Le/e/a/t$d;->f:Ljava/lang/Float;

    iput-object v12, v4, Le/e/a/t$d;->h:Ljava/lang/Integer;

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-virtual {v7, v10, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v23, v23, 0x1

    move/from16 v19, v34

    :goto_599
    add-int/lit8 v4, v22, 0x1

    sub-int v10, v23, v4

    iget v12, v1, Le/e/a/t;->U:I

    if-gt v10, v12, :cond_63f

    iget-object v10, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual {v10, v6}, Landroid/graphics/Paint;->setTextSize(F)V

    iget v10, v1, Le/e/a/t;->H:I

    if-nez v10, :cond_5d8

    iget-object v10, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    sget-object v12, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v10, v12}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v10, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    iget v12, v1, Le/e/a/t;->R:F

    invoke-virtual {v10, v12}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v10, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-virtual {v10, v12}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v10, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    iget v12, v1, Le/e/a/t;->a0:I

    int-to-float v12, v12

    mul-float v12, v12, v30

    float-to-int v12, v12

    invoke-virtual {v10, v12}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v10, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-static {v9, v14, v5, v2, v10}, Le/e/a/CommentVisuals;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v10, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    const/4 v12, 0x0

    invoke-virtual {v10, v12}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    goto :goto_5e9

    :cond_5d8
    iget v10, v1, Le/e/a/t;->H:I

    const/4 v12, 0x1

    if-ne v10, v12, :cond_5e9

    iget-object v10, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    iget v12, v1, Le/e/a/t;->R:F

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->intValue()I

    move-result v13

    const/4 v15, 0x0

    invoke-virtual {v10, v12, v15, v15, v13}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    :cond_5e9
    :goto_5e9
    iget-object v10, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    sget-object v12, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v10, v12}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v10, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v10, v8}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v8, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    iget v10, v1, Le/e/a/t;->a0:I

    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v8, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-static {v9, v14, v5, v2, v8}, Le/e/a/CommentVisuals;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-eqz v8, :cond_63f

    iget-object v8, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    const/16 v10, -0x100

    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v8, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    iget v10, v1, Le/e/a/t;->a0:I

    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v8, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    sget-object v10, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v8, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    const/high16 v10, 0x40000000    # 2.0f

    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    new-instance v8, Landroid/graphics/Rect;

    float-to-int v12, v5

    iget v13, v1, Le/e/a/t;->P:F

    div-float/2addr v13, v10

    add-float/2addr v13, v2

    sub-float/2addr v13, v6

    float-to-int v6, v13

    add-float/2addr v5, v11

    float-to-int v5, v5

    iget v11, v1, Le/e/a/t;->P:F

    div-float/2addr v11, v10

    add-float/2addr v11, v2

    float-to-int v2, v11

    invoke-direct {v8, v12, v6, v5, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual {v9, v8, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    :cond_63f
    move v14, v4

    move/from16 v7, v19

    move/from16 v15, v20

    move/from16 v12, v21

    move/from16 v8, v23

    move/from16 v13, v32

    move-object/from16 v4, p4

    goto/16 :goto_8b0

    :cond_64e
    move-object/from16 v3, p2

    move/from16 v32, v13

    :goto_652
    move-object/from16 v4, p4

    move/from16 v7, v19

    move/from16 v15, v20

    move/from16 v12, v21

    move/from16 v14, v22

    move/from16 v8, v23

    goto/16 :goto_8b0

    :cond_660
    move-object/from16 v3, p2

    move-object/from16 v7, p5

    move/from16 v32, v13

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v4, 0x2

    if-ne v2, v4, :cond_898

    const/4 v2, 0x0

    cmpg-float v4, v24, v2

    if-gez v4, :cond_676

    move-object/from16 v4, p4

    :cond_674
    :goto_674
    const/4 v2, 0x0

    goto :goto_69a

    :cond_676
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-float v2, v2

    cmpl-float v2, v24, v2

    if-lez v2, :cond_697

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    move-object/from16 v4, p4

    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_674

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v21, -0x1

    move/from16 v21, v2

    goto :goto_674

    :cond_697
    move-object/from16 v4, p4

    const/4 v2, 0x1

    :goto_69a
    if-eqz v2, :cond_8a4

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/t$d;

    if-eqz v2, :cond_6c6

    iget-object v5, v2, Le/e/a/t$d;->b:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iget v6, v1, Le/e/a/t;->P:F

    sub-float/2addr v5, v6

    iget-object v6, v2, Le/e/a/t$d;->c:Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    iget-object v10, v2, Le/e/a/t$d;->e:Ljava/lang/Float;

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v10

    iget-object v2, v2, Le/e/a/t$d;->f:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    move v11, v2

    goto/16 :goto_7ef

    :cond_6c6
    move/from16 v2, v34

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Le/e/a/q;

    iput-object v8, v13, Le/e/a/q;->f:Ljava/lang/Integer;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Le/e/a/q;

    iput-object v6, v13, Le/e/a/q;->i:Ljava/lang/Integer;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le/e/a/q;

    iput-object v5, v6, Le/e/a/q;->j:Ljava/lang/Integer;

    iget v5, v1, Le/e/a/t;->I:F

    cmpg-float v5, v5, v11

    if-gez v5, :cond_6ff

    iget v5, v1, Le/e/a/t;->I:F

    iget v6, v1, Le/e/a/t;->O:F

    const/high16 v13, 0x41200000    # 10.0f

    mul-float v6, v6, v13

    sub-float/2addr v5, v6

    div-float/2addr v5, v11

    mul-float v5, v5, v31

    iget-object v6, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual {v6, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v6, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual {v6, v14}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v11

    move/from16 v31, v5

    :cond_6ff
    new-instance v5, Ljava/util/ArrayList;

    invoke-virtual/range {p4 .. p4}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v6, Le/e/a/t$c;

    invoke-direct {v6, v1}, Le/e/a/t$c;-><init>(Le/e/a/t;)V

    invoke-static {v5, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    const/4 v13, 0x0

    :goto_715
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_78a

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/util/Map$Entry;

    invoke-interface/range {v19 .. v19}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v3, v19

    check-cast v3, Le/e/a/t$d;

    move-object/from16 v19, v6

    iget v6, v1, Le/e/a/t;->P:F

    sub-float v6, v13, v6

    iget-object v7, v3, Le/e/a/t$d;->b:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    cmpg-float v6, v6, v7

    if-gez v6, :cond_77f

    iget-object v6, v3, Le/e/a/t$d;->b:Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    iget-object v7, v3, Le/e/a/t$d;->e:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    sub-float/2addr v6, v7

    add-float v7, v13, v31

    move/from16 v34, v2

    iget v2, v1, Le/e/a/t;->P:F

    add-float/2addr v7, v2

    cmpg-float v2, v6, v7

    if-gez v2, :cond_781

    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v2

    iget-object v6, v3, Le/e/a/t$d;->d:Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    sub-float/2addr v2, v6

    iget-object v6, v3, Le/e/a/t$d;->h:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-float v6, v6

    cmpl-float v2, v2, v6

    if-lez v2, :cond_777

    iget-object v2, v3, Le/e/a/t$d;->a:Ljava/lang/Float;

    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_781

    iget-object v2, v3, Le/e/a/t$d;->a:Ljava/lang/Float;

    invoke-virtual {v4, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v21, v21, -0x1

    goto :goto_781

    :cond_777
    iget-object v2, v3, Le/e/a/t$d;->b:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    move v13, v2

    goto :goto_781

    :cond_77f
    move/from16 v34, v2

    :cond_781
    :goto_781
    move-object/from16 v3, p2

    move-object/from16 v7, p5

    move-object/from16 v6, v19

    move/from16 v2, v34

    goto :goto_715

    :cond_78a
    move/from16 v34, v2

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    add-float v13, v13, v31

    iget v2, v1, Le/e/a/t;->J:F

    cmpl-float v2, v13, v2

    if-lez v2, :cond_7aa

    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    iget v3, v1, Le/e/a/t;->J:F

    sub-float v3, v3, v31

    float-to-int v3, v3

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    int-to-float v2, v2

    add-float v2, v2, v31

    move v5, v2

    goto :goto_7ab

    :cond_7aa
    move v5, v13

    :goto_7ab
    iget v2, v1, Le/e/a/t;->I:F

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    div-float v6, v11, v3

    sub-float v6, v2, v6

    new-instance v2, Le/e/a/t$d;

    invoke-direct {v2, v1}, Le/e/a/t$d;-><init>(Le/e/a/t;)V

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, v2, Le/e/a/t$d;->a:Ljava/lang/Float;

    iget v3, v1, Le/e/a/t;->P:F

    add-float/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, v2, Le/e/a/t$d;->b:Ljava/lang/Float;

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, v2, Le/e/a/t$d;->c:Ljava/lang/Float;

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, v2, Le/e/a/t$d;->d:Ljava/lang/Float;

    invoke-static/range {v31 .. v31}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, v2, Le/e/a/t$d;->e:Ljava/lang/Float;

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, v2, Le/e/a/t$d;->f:Ljava/lang/Float;

    iput-object v12, v2, Le/e/a/t$d;->h:Ljava/lang/Integer;

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v4, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v21, v21, 0x1

    move/from16 v10, v31

    move/from16 v19, v34

    :goto_7ef
    add-int/lit8 v15, v20, 0x1

    sub-int v2, v21, v15

    iget v3, v1, Le/e/a/t;->U:I

    if-gt v2, v3, :cond_895

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual {v2, v10}, Landroid/graphics/Paint;->setTextSize(F)V

    iget v2, v1, Le/e/a/t;->H:I

    if-nez v2, :cond_82e

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    iget v3, v1, Le/e/a/t;->R:F

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    iget v3, v1, Le/e/a/t;->a0:I

    int-to-float v3, v3

    mul-float v3, v3, v30

    float-to-int v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-static {v9, v14, v6, v5, v2}, Le/e/a/CommentVisuals;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    goto :goto_83f

    :cond_82e
    iget v2, v1, Le/e/a/t;->H:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_83f

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    iget v3, v1, Le/e/a/t;->R:F

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/4 v12, 0x0

    invoke-virtual {v2, v3, v12, v12, v7}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    :cond_83f
    :goto_83f
    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    iget v3, v1, Le/e/a/t;->a0:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-static {v9, v14, v6, v5, v2}, Le/e/a/CommentVisuals;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_895

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    const/16 v3, -0x100

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    iget v3, v1, Le/e/a/t;->a0:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    const/high16 v3, 0x40000000    # 2.0f

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    new-instance v2, Landroid/graphics/Rect;

    float-to-int v7, v6

    iget v8, v1, Le/e/a/t;->P:F

    div-float/2addr v8, v3

    add-float/2addr v8, v5

    sub-float/2addr v8, v10

    float-to-int v8, v8

    add-float/2addr v6, v11

    float-to-int v6, v6

    iget v10, v1, Le/e/a/t;->P:F

    div-float/2addr v10, v3

    add-float/2addr v10, v5

    float-to-int v3, v10

    invoke-direct {v2, v7, v8, v6, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object v3, v1, Le/e/a/t;->s0:Landroid/graphics/Paint;

    invoke-virtual {v9, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    :cond_895
    move/from16 v7, v19

    goto :goto_8a8

    :cond_898
    move-object/from16 v4, p4

    goto :goto_8a4

    :cond_89b
    move-object/from16 v4, p4

    move/from16 v34, v9

    move/from16 v32, v13

    const/16 v18, 0x0

    move-object v9, v2

    :cond_8a4
    :goto_8a4
    move/from16 v7, v19

    move/from16 v15, v20

    :goto_8a8
    move/from16 v12, v21

    move/from16 v14, v22

    move/from16 v8, v23

    move/from16 v13, v32

    :goto_8b0
    add-int/lit8 v2, v34, 0x1

    move-object/from16 v3, p2

    move-object/from16 v6, p5

    move-object v5, v4

    move-object/from16 v10, v17

    move-object/from16 v4, p3

    move-object/from16 v35, v9

    move v9, v2

    move-object/from16 v2, v35

    goto/16 :goto_2f

    :cond_8c2
    move/from16 v19, v7

    if-eqz v19, :cond_8d5

    iget v2, v1, Le/e/a/t;->r0:I

    move/from16 v11, v19

    if-eq v2, v11, :cond_8d5

    iput v11, v1, Le/e/a/t;->r0:I

    iget-object v2, v1, Le/e/a/t;->F:Le/e/a/l3/c;

    iget v3, v1, Le/e/a/t;->r0:I

    invoke-interface {v2, v3}, Le/e/a/l3/c;->b(I)V

    :cond_8d5
    iget-boolean v2, v1, Le/e/a/t;->v:Z

    if-eqz v2, :cond_8dc

    invoke-virtual/range {p0 .. p0}, Le/e/a/t;->c()V

    :cond_8dc
    iget-boolean v2, v1, Le/e/a/t;->o:Z

    if-eqz v2, :cond_8ec

    invoke-virtual/range {p0 .. p0}, Le/e/a/t;->l()V
    :try_end_8e3
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_8e3} :catch_8e7
    .catchall {:try_start_17 .. :try_end_8e3} :catchall_8e4

    goto :goto_8ec

    :catchall_8e4
    move-exception v0

    move-object v2, v0

    goto :goto_8f1

    :catch_8e7
    move-exception v0

    move-object v2, v0

    :try_start_8e9
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_8ec
    .catchall {:try_start_8e9 .. :try_end_8ec} :catchall_8e4

    :cond_8ec
    :goto_8ec
    invoke-static/range {p1 .. p1}, Le/e/a/CommentViewport190;->end(Landroid/graphics/Canvas;)V

    monitor-exit p0

    return-void

    :goto_8f1
    invoke-static/range {p1 .. p1}, Le/e/a/CommentViewport190;->end(Landroid/graphics/Canvas;)V

    monitor-exit p0

    goto :goto_8f7

    :goto_8f6
    throw v2

    :goto_8f7
    goto :goto_8f6
.end method

.method public getPosition()I
    .registers 2

    invoke-static {p0}, Le/e/a/CommentClock;->position(Ljava/lang/Object;)I

    move-result v0

    div-int/lit8 v0, v0, 0xa

    return v0
.end method

.method public getPositionRes()I
    .registers 2

    invoke-static {p0}, Le/e/a/CommentClock;->position(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public run()V
    .registers 15

    invoke-static {p0}, Le/e/a/CommentMotion;->fps(Ljava/lang/Object;)I

    move-result v0

    const/high16 v1, 0x3e80000

    div-int/2addr v1, v0

    int-to-long v0, v1

    invoke-static {}, Le/e/a/CommentMotion;->nowQ16()J

    move-result-wide v2

    const/16 v4, 0x10

    const-wide/16 v5, 0x0

    :goto_10
    iget-object v7, p0, Le/e/a/t;->u:Ljava/lang/Thread;

    if-eqz v7, :cond_b0

    iget-boolean v7, p0, Le/e/a/t;->v:Z

    if-nez v7, :cond_b0

    iget-object v7, p0, Le/e/a/t;->t:Landroid/view/SurfaceHolder;

    monitor-enter v7

    const/4 v8, 0x0

    const/4 v9, 0x1

    :try_start_1d
    iget-boolean v10, p0, Le/e/a/t;->w:Z

    if-eqz v10, :cond_25

    iget-boolean v10, p0, Le/e/a/t;->D:Z

    if-eqz v10, :cond_62

    :cond_25
    iget-object v10, p0, Le/e/a/t;->t:Landroid/view/SurfaceHolder;

    invoke-interface {v10}, Landroid/view/SurfaceHolder;->lockCanvas()Landroid/graphics/Canvas;

    move-result-object v8

    if-eqz v8, :cond_62

    const/4 v10, 0x0

    sget-object v11, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v8, v10, v11}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    iget-boolean v10, p0, Le/e/a/t;->w:Z

    if-nez v10, :cond_57

    iget-boolean v10, p0, Le/e/a/t;->b:Z

    if-eqz v10, :cond_57

    iget-boolean v10, p0, Le/e/a/t;->r:Z

    if-eqz v10, :cond_42

    invoke-virtual {p0, v8}, Le/e/a/t;->b(Landroid/graphics/Canvas;)V

    :cond_42
    invoke-virtual {p0, v8}, Le/e/a/t;->a(Landroid/graphics/Canvas;)V

    iget-boolean v10, p0, Le/e/a/t;->B:Z

    if-eqz v10, :cond_62

    iget-object v10, p0, Le/e/a/t;->G:[Ljava/lang/String;

    invoke-static {p0, v8, v10}, Le/e/a/SeekFeedback239;->draw(Ljava/lang/Object;Landroid/graphics/Canvas;[Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_56

    iget-object v10, p0, Le/e/a/t;->G:[Ljava/lang/String;

    invoke-virtual {p0, v8, v10}, Le/e/a/t;->a(Landroid/graphics/Canvas;[Ljava/lang/String;)V

    :cond_56
    goto :goto_62

    :cond_57
    iget-boolean v10, p0, Le/e/a/t;->D:Z

    if-eqz v10, :cond_62

    const/high16 v10, -0x1000000

    sget-object v11, Landroid/graphics/PorterDuff$Mode;->SCREEN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v8, v10, v11}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V
    :try_end_62
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1d .. :try_end_62} :catch_77
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_62} :catch_6c
    .catchall {:try_start_1d .. :try_end_62} :catchall_6a

    :cond_62
    :goto_62
    if-eqz v8, :cond_82

    :try_start_64
    iget-object v9, p0, Le/e/a/t;->t:Landroid/view/SurfaceHolder;

    :goto_66
    invoke-interface {v9, v8}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V
    :try_end_69
    .catchall {:try_start_64 .. :try_end_69} :catchall_ab

    goto :goto_82

    :catchall_6a
    move-exception v0

    goto :goto_a3

    :catch_6c
    move-exception v10

    :try_start_6d
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    iput-boolean v9, p0, Le/e/a/t;->v:Z
    :try_end_72
    .catchall {:try_start_6d .. :try_end_72} :catchall_6a

    if-eqz v8, :cond_82

    :try_start_74
    iget-object v9, p0, Le/e/a/t;->t:Landroid/view/SurfaceHolder;
    :try_end_76
    .catchall {:try_start_74 .. :try_end_76} :catchall_ab

    goto :goto_66

    :catch_77
    move-exception v10

    :try_start_78
    invoke-virtual {v10}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    iput-boolean v9, p0, Le/e/a/t;->v:Z
    :try_end_7d
    .catchall {:try_start_78 .. :try_end_7d} :catchall_6a

    if-eqz v8, :cond_82

    :try_start_7f
    iget-object v9, p0, Le/e/a/t;->t:Landroid/view/SurfaceHolder;

    goto :goto_66

    :cond_82
    :goto_82
    invoke-static {}, Le/e/a/CommentMotion;->nowQ16()J

    move-result-wide v8
    :try_end_86
    .catchall {:try_start_7f .. :try_end_86} :catchall_ab

    sub-long v2, v8, v2

    sub-long v2, v0, v2

    sub-long/2addr v2, v5

    const-wide/16 v5, 0x0

    cmp-long v10, v2, v5

    if-gez v10, :cond_92

    move-wide v2, v5

    :cond_92
    :try_start_92
    invoke-static {v2, v3}, Le/e/a/CommentMotion;->sleepQ16(J)V
    :try_end_95
    .catch Ljava/lang/InterruptedException; {:try_start_92 .. :try_end_95} :catch_95
    .catchall {:try_start_92 .. :try_end_95} :catchall_ab

    :catch_95
    :try_start_95
    invoke-static {}, Le/e/a/CommentMotion;->nowQ16()J

    move-result-wide v5

    sub-long v8, v5, v8

    sub-long v2, v8, v2

    monitor-exit v7

    move-wide v12, v2

    move-wide v2, v5

    move-wide v5, v12

    goto/16 :goto_10

    :goto_a3
    if-eqz v8, :cond_ad

    iget-object v1, p0, Le/e/a/t;->t:Landroid/view/SurfaceHolder;

    invoke-interface {v1, v8}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    goto :goto_ad

    :catchall_ab
    move-exception v0

    goto :goto_ae

    :cond_ad
    :goto_ad
    throw v0

    :goto_ae
    monitor-exit v7
    :try_end_af
    .catchall {:try_start_95 .. :try_end_af} :catchall_ab

    throw v0

    :cond_b0
    return-void
.end method

.method public setPlaySpeed(F)V
    .registers 2

    invoke-static {p0, p1}, Le/e/a/CommentClock;->speed(Ljava/lang/Object;F)V

    return-void
.end method

.method public setRyuuyou(Landroid/view/View;)V
    .registers 4

    instance-of v0, p1, Le/e/a/u;

    if-eqz v0, :cond_1f

    check-cast p1, Le/e/a/u;

    iget-boolean v0, p1, Le/e/a/u;->g:Z

    iput-boolean v0, p0, Le/e/a/t;->g:Z

    iget-object v0, p1, Le/e/a/u;->i:Ljava/util/ArrayList;

    iput-object v0, p0, Le/e/a/t;->i:Ljava/util/ArrayList;

    iget-boolean v0, p1, Le/e/a/u;->m:Z

    iput-boolean v0, p0, Le/e/a/t;->m:Z

    iget-object v0, p1, Le/e/a/u;->n:Ljava/util/ArrayList;

    iput-object v0, p0, Le/e/a/t;->n:Ljava/util/ArrayList;

    iget-boolean v0, p1, Le/e/a/u;->b:Z

    iput-boolean v0, p0, Le/e/a/t;->b:Z

    iget-object v0, p1, Le/e/a/u;->c:Ljava/util/ArrayList;

    iput-object v0, p0, Le/e/a/t;->c:Ljava/util/ArrayList;

    return-void

    :cond_1f
    check-cast p1, Le/e/a/t;

    iget-boolean v0, p1, Le/e/a/t;->g:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_2c

    iget-object v0, p1, Le/e/a/t;->i:Ljava/util/ArrayList;

    iput-object v0, p0, Le/e/a/t;->i:Ljava/util/ArrayList;

    iput-boolean v1, p0, Le/e/a/t;->g:Z

    :cond_2c
    iget-boolean v0, p1, Le/e/a/t;->m:Z

    if-eqz v0, :cond_36

    iget-object v0, p1, Le/e/a/t;->n:Ljava/util/ArrayList;

    iput-object v0, p0, Le/e/a/t;->n:Ljava/util/ArrayList;

    iput-boolean v1, p0, Le/e/a/t;->m:Z

    :cond_36
    iget-boolean v0, p1, Le/e/a/t;->b:Z

    if-eqz v0, :cond_40

    iget-object p1, p1, Le/e/a/t;->c:Ljava/util/ArrayList;

    iput-object p1, p0, Le/e/a/t;->c:Ljava/util/ArrayList;

    iput-boolean v1, p0, Le/e/a/t;->b:Z

    :cond_40
    return-void
.end method
