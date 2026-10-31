.class public Le/e/a/u;
.super Landroid/view/TextureView;
.source ""

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/view/TextureView$SurfaceTextureListener;
.implements Le/e/a/l3/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/u$d;
    }
.end annotation


# instance fields
.field public A:Z

.field public B:Z

.field public C:Z

.field public D:Le/e/a/n0;

.field public E:Le/e/a/l3/c;

.field public F:[Ljava/lang/String;

.field public G:I

.field public H:F

.field public I:F

.field public J:F

.field public K:F

.field public L:F

.field public M:F

.field public N:F

.field public O:F

.field public P:F

.field public Q:F

.field public R:I

.field public S:I

.field public T:I

.field public U:I

.field public V:I

.field public W:I

.field public a:I

.field public a0:J

.field public b:Z

.field public b0:I

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
            "Le/e/a/u$d;",
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
            "Le/e/a/u$d;",
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
            "Le/e/a/u$d;",
            ">;"
        }
    .end annotation
.end field

.field public f0:I

.field public g:Z

.field public g0:J

.field public h0:F

.field public i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/q;",
            ">;"
        }
    .end annotation
.end field

.field public i0:J

.field public j:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Float;",
            "Le/e/a/u$d;",
            ">;"
        }
    .end annotation
.end field

.field public j0:I

.field public k:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Float;",
            "Le/e/a/u$d;",
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
            "Le/e/a/u$d;",
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

.field public o0:Z

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

.field public q0:I

.field public r:Z

.field public r0:Landroid/graphics/Paint;

.field public s:Z

.field public s0:Z

.field public t:Ljava/lang/Thread;

.field public volatile u:Z

.field public v:Z

.field public w:Z

.field public x:Z

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Le/e/a/v;)V
    .registers 7

    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    const/16 p1, 0x1e

    iput p1, p0, Le/e/a/u;->a:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/u;->b:Z

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Le/e/a/u;->d:Ljava/util/HashMap;

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Le/e/a/u;->e:Ljava/util/HashMap;

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Le/e/a/u;->f:Ljava/util/HashMap;

    iput-boolean p1, p0, Le/e/a/u;->g:Z

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Le/e/a/u;->j:Ljava/util/HashMap;

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Le/e/a/u;->k:Ljava/util/HashMap;

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Le/e/a/u;->l:Ljava/util/HashMap;

    iput-boolean p1, p0, Le/e/a/u;->m:Z

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Le/e/a/u;->n:Ljava/util/ArrayList;

    iput-boolean p1, p0, Le/e/a/u;->o:Z

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Le/e/a/u;->p:Ljava/util/ArrayList;

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

    iput-object p2, p0, Le/e/a/u;->q:[Ljava/lang/Float;

    iput-boolean p1, p0, Le/e/a/u;->r:Z

    iput-boolean p1, p0, Le/e/a/u;->s:Z

    iput-boolean p1, p0, Le/e/a/u;->u:Z

    iput-boolean p1, p0, Le/e/a/u;->v:Z

    iput-boolean p1, p0, Le/e/a/u;->w:Z

    iput-boolean p1, p0, Le/e/a/u;->x:Z

    iput-boolean p1, p0, Le/e/a/u;->y:Z

    iput-boolean p1, p0, Le/e/a/u;->z:Z

    iput-boolean p1, p0, Le/e/a/u;->A:Z

    iput-boolean p1, p0, Le/e/a/u;->B:Z

    iput-boolean p1, p0, Le/e/a/u;->C:Z

    new-array p2, v2, [Ljava/lang/String;

    const-string v0, ""

    aput-object v0, p2, p1

    aput-object v0, p2, v1

    iput-object p2, p0, Le/e/a/u;->F:[Ljava/lang/String;

    iput p1, p0, Le/e/a/u;->G:I

    const/4 p2, 0x0

    iput p2, p0, Le/e/a/u;->H:F

    iput p2, p0, Le/e/a/u;->I:F

    iput p2, p0, Le/e/a/u;->J:F

    iput p2, p0, Le/e/a/u;->K:F

    iput p2, p0, Le/e/a/u;->L:F

    iput p2, p0, Le/e/a/u;->M:F

    iput p2, p0, Le/e/a/u;->N:F

    iput p2, p0, Le/e/a/u;->O:F

    iput p2, p0, Le/e/a/u;->P:F

    iput p2, p0, Le/e/a/u;->Q:F

    const/16 p2, 0x190

    iput p2, p0, Le/e/a/u;->R:I

    const/16 p2, 0x12c

    iput p2, p0, Le/e/a/u;->S:I

    const/16 p2, 0x28

    iput p2, p0, Le/e/a/u;->T:I

    iput p1, p0, Le/e/a/u;->U:I

    iput p1, p0, Le/e/a/u;->V:I

    const/16 p2, 0xff

    iput p2, p0, Le/e/a/u;->W:I

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Le/e/a/u;->a0:J

    invoke-static {p1, p1, p1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Le/e/a/u;->b0:I

    invoke-static {p2, p2, p2}, Landroid/graphics/Color;->rgb(III)I

    move-result p2

    iput p2, p0, Le/e/a/u;->c0:I

    iget p2, p0, Le/e/a/u;->c0:I

    iput p2, p0, Le/e/a/u;->d0:I

    iput p1, p0, Le/e/a/u;->e0:I

    iput p1, p0, Le/e/a/u;->f0:I

    iput-wide v2, p0, Le/e/a/u;->i0:J

    iput p1, p0, Le/e/a/u;->j0:I

    iput p1, p0, Le/e/a/u;->k0:I

    iput p1, p0, Le/e/a/u;->l0:I

    const/4 p2, -0x1

    iput p2, p0, Le/e/a/u;->m0:I

    iput p1, p0, Le/e/a/u;->n0:I

    iput-boolean p1, p0, Le/e/a/u;->o0:Z

    iput-boolean p1, p0, Le/e/a/u;->p0:Z

    iput p1, p0, Le/e/a/u;->q0:I

    new-instance p1, Landroid/graphics/Paint;

    const/16 p2, 0x81

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-static/range {p0 .. p0}, Le/e/a/CommentStyle;->bind(Landroid/view/View;)V

    iput-boolean v1, p0, Le/e/a/u;->s0:Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/TextureView;->setOpaque(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/Float;Le/e/a/v;)V
    .registers 9

    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    const/16 p3, 0x1e

    iput p3, p0, Le/e/a/u;->a:I

    const/4 p3, 0x0

    iput-boolean p3, p0, Le/e/a/u;->b:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/u;->d:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/u;->e:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/u;->f:Ljava/util/HashMap;

    iput-boolean p3, p0, Le/e/a/u;->g:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/u;->j:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/u;->k:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/u;->l:Ljava/util/HashMap;

    iput-boolean p3, p0, Le/e/a/u;->m:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/u;->n:Ljava/util/ArrayList;

    iput-boolean p3, p0, Le/e/a/u;->o:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/u;->p:Ljava/util/ArrayList;

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

    iput-object v0, p0, Le/e/a/u;->q:[Ljava/lang/Float;

    iput-boolean p3, p0, Le/e/a/u;->r:Z

    iput-boolean p3, p0, Le/e/a/u;->s:Z

    iput-boolean p3, p0, Le/e/a/u;->u:Z

    iput-boolean p3, p0, Le/e/a/u;->v:Z

    iput-boolean p3, p0, Le/e/a/u;->w:Z

    iput-boolean p3, p0, Le/e/a/u;->x:Z

    iput-boolean p3, p0, Le/e/a/u;->y:Z

    iput-boolean p3, p0, Le/e/a/u;->z:Z

    iput-boolean p3, p0, Le/e/a/u;->A:Z

    iput-boolean p3, p0, Le/e/a/u;->B:Z

    iput-boolean p3, p0, Le/e/a/u;->C:Z

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, ""

    aput-object v1, v0, p3

    aput-object v1, v0, v2

    iput-object v0, p0, Le/e/a/u;->F:[Ljava/lang/String;

    iput p3, p0, Le/e/a/u;->G:I

    const/4 v0, 0x0

    iput v0, p0, Le/e/a/u;->H:F

    iput v0, p0, Le/e/a/u;->I:F

    iput v0, p0, Le/e/a/u;->J:F

    iput v0, p0, Le/e/a/u;->K:F

    iput v0, p0, Le/e/a/u;->L:F

    iput v0, p0, Le/e/a/u;->M:F

    iput v0, p0, Le/e/a/u;->N:F

    iput v0, p0, Le/e/a/u;->O:F

    iput v0, p0, Le/e/a/u;->P:F

    iput v0, p0, Le/e/a/u;->Q:F

    const/16 v0, 0x190

    iput v0, p0, Le/e/a/u;->R:I

    const/16 v0, 0x12c

    iput v0, p0, Le/e/a/u;->S:I

    const/16 v0, 0x28

    iput v0, p0, Le/e/a/u;->T:I

    iput p3, p0, Le/e/a/u;->U:I

    iput p3, p0, Le/e/a/u;->V:I

    const/16 v0, 0xff

    iput v0, p0, Le/e/a/u;->W:I

    const-wide/16 v3, 0x0

    iput-wide v3, p0, Le/e/a/u;->a0:J

    invoke-static {p3, p3, p3}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    iput v1, p0, Le/e/a/u;->b0:I

    invoke-static {v0, v0, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Le/e/a/u;->c0:I

    iget v0, p0, Le/e/a/u;->c0:I

    iput v0, p0, Le/e/a/u;->d0:I

    iput p3, p0, Le/e/a/u;->e0:I

    iput p3, p0, Le/e/a/u;->f0:I

    iput-wide v3, p0, Le/e/a/u;->i0:J

    iput p3, p0, Le/e/a/u;->j0:I

    iput p3, p0, Le/e/a/u;->k0:I

    iput p3, p0, Le/e/a/u;->l0:I

    const/4 v0, -0x1

    iput v0, p0, Le/e/a/u;->m0:I

    iput p3, p0, Le/e/a/u;->n0:I

    iput-boolean p3, p0, Le/e/a/u;->o0:Z

    iput-boolean p3, p0, Le/e/a/u;->p0:Z

    iput p3, p0, Le/e/a/u;->q0:I

    new-instance v0, Landroid/graphics/Paint;

    const/16 v1, 0x81

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-static/range {p0 .. p0}, Le/e/a/CommentStyle;->bind(Landroid/view/View;)V

    iput-boolean v2, p0, Le/e/a/u;->s0:Z

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    iput p2, p0, Le/e/a/u;->N:F

    invoke-virtual {p0, p0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Landroid/view/TextureView;->setOpaque(Z)V

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string p2, "comment_hide"

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_10b

    invoke-virtual {p0, v2}, Le/e/a/u;->b(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_10b

    invoke-virtual {p0, p3}, Le/e/a/u;->b(Z)Ljava/lang/Boolean;

    :cond_10b
    const-string p2, "player_no_wait"

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p0, Le/e/a/u;->z:Z

    const-string p2, "comment_fps"

    const-string p3, "60"

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    iput p2, p0, Le/e/a/u;->a:I

    const-string p2, "comment_shadow"

    const-string p3, "0"

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    iput p2, p0, Le/e/a/u;->G:I

    const-string p2, "comment_alpha"

    const-string p3, "255"

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Le/e/a/u;->W:I

    return-void
.end method


# virtual methods
.method public final a(FF)V
    .registers 4

    iput p1, p0, Le/e/a/u;->H:F

    iput p2, p0, Le/e/a/u;->I:F

    iget p1, p0, Le/e/a/u;->I:F

    const/high16 p2, 0x41600000    # 14.0f

    div-float/2addr p1, p2

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Le/e/a/ModernEnhancements;->commentSize(Landroid/content/Context;F)F

    move-result p1

    iput p1, p0, Le/e/a/u;->J:F

    iget p1, p0, Le/e/a/u;->J:F

    const/high16 p2, 0x40400000    # 3.0f

    mul-float p2, p2, p1

    const/high16 v0, 0x41300000    # 11.0f

    div-float/2addr p2, v0

    iput p2, p0, Le/e/a/u;->O:F

    const p2, 0x3f2b851f    # 0.67f

    mul-float p2, p2, p1

    iput p2, p0, Le/e/a/u;->K:F

    const p2, 0x3fb5c28f    # 1.42f

    mul-float p1, p1, p2

    iput p1, p0, Le/e/a/u;->L:F

    iget p1, p0, Le/e/a/u;->G:I

    if-nez p1, :cond_39

    iget p1, p0, Le/e/a/u;->O:F

    const p2, 0x4019999a    # 2.4f

    :goto_35
    div-float/2addr p1, p2

    iput p1, p0, Le/e/a/u;->Q:F

    goto :goto_41

    :cond_39
    const/4 p2, 0x1

    if-ne p1, p2, :cond_41

    iget p1, p0, Le/e/a/u;->O:F

    const/high16 p2, 0x40200000    # 2.5f

    goto :goto_35

    :cond_41
    :goto_41
    return-void
.end method

.method public final declared-synchronized a(Landroid/graphics/Canvas;Ljava/util/ArrayList;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/HashMap;)V
    .registers 41
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Ljava/util/ArrayList<",
            "Le/e/a/q;",
            ">;",
            "Ljava/util/HashMap<",
            "Ljava/lang/Float;",
            "Le/e/a/u$d;",
            ">;",
            "Ljava/util/HashMap<",
            "Ljava/lang/Float;",
            "Le/e/a/u$d;",
            ">;",
            "Ljava/util/HashMap<",
            "Ljava/lang/Float;",
            "Le/e/a/u$d;",
            ">;)V"
        }
    .end annotation

    invoke-static/range {p0 .. p1}, Le/e/a/CommentViewport190;->begin(Ljava/lang/Object;Landroid/graphics/Canvas;)V

    invoke-static/range {p0 .. p2}, Le/e/a/CommentVisuals;->scrolling(Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p2

    move-object/from16 v1, p0

    invoke-static {v1}, Le/e/a/CommentMotion;->frame(Ljava/lang/Object;)V

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

    if-eqz v17, :cond_87f

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

    iget-boolean v7, v1, Le/e/a/u;->p0:Z

    if-nez v7, :cond_5e

    iget v7, v1, Le/e/a/u;->U:I

    int-to-float v7, v7

    cmpg-float v7, v7, v10

    if-gez v7, :cond_5e

    iget v7, v1, Le/e/a/u;->U:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iput-object v7, v11, Le/e/a/q;->d:Ljava/lang/Integer;

    iget v7, v1, Le/e/a/u;->U:I

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

    iget v5, v1, Le/e/a/u;->f0:I

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

    iget v12, v1, Le/e/a/u;->R:I

    goto :goto_95

    :cond_93
    iget v12, v1, Le/e/a/u;->S:I

    :goto_95
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    goto :goto_87

    :goto_9a
    iget-object v14, v1, Le/e/a/u;->q:[Ljava/lang/Float;

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

    if-nez v8, :cond_85d

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v8

    int-to-float v8, v8

    cmpg-float v8, v7, v8

    if-gez v8, :cond_c1

    iget v8, v1, Le/e/a/u;->H:F

    neg-float v8, v8

    cmpl-float v8, v7, v8

    if-gtz v8, :cond_c3

    :cond_c1
    if-eqz v14, :cond_85d

    :cond_c3
    iget-object v8, v11, Le/e/a/q;->f:Ljava/lang/Integer;

    if-nez v8, :cond_cd

    iget v8, v1, Le/e/a/u;->d0:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    :cond_cd
    iget-object v6, v11, Le/e/a/q;->i:Ljava/lang/Integer;

    if-nez v6, :cond_d7

    iget v6, v1, Le/e/a/u;->e0:I

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

    iget v7, v1, Le/e/a/u;->b0:I

    move/from16 v26, v7

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iget v2, v1, Le/e/a/u;->b0:I

    if-ne v7, v2, :cond_f5

    iget v7, v1, Le/e/a/u;->c0:I

    goto :goto_f7

    :cond_f5
    move/from16 v7, v26

    :goto_f7
    iget v2, v1, Le/e/a/u;->J:F

    move/from16 v26, v2

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v2

    move/from16 v27, v7

    const/4 v7, 0x1

    if-ne v2, v7, :cond_107

    iget v2, v1, Le/e/a/u;->K:F

    goto :goto_113

    :cond_107
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v7, 0x2

    if-ne v2, v7, :cond_111

    iget v2, v1, Le/e/a/u;->L:F

    goto :goto_113

    :cond_111
    move/from16 v2, v26

    :goto_113
    iget-object v7, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-virtual {v7, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v7, v11, Le/e/a/q;->a:Ljava/lang/String;

    iget-object v11, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-virtual {v11, v7}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v11

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v26

    move-object/from16 v29, v7

    const v30, 0x3eb33333    # 0.35f

    if-nez v26, :cond_3de

    const/high16 v24, 0x42c80000    # 100.0f

    sub-float v10, v10, v24

    iget v7, v1, Le/e/a/u;->H:F

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

    iget v7, v1, Le/e/a/u;->H:F

    add-float/2addr v2, v7

    iget v7, v1, Le/e/a/u;->H:F

    const/high16 v32, 0x3f800000    # 1.0f

    cmpl-float v7, v2, v7

    if-lez v7, :cond_151

    :cond_14f
    :goto_14f
    const/4 v7, 0x0

    goto :goto_17b

    :cond_151
    add-float v7, v2, v11

    const/16 v26, 0x0

    cmpg-float v7, v7, v26

    if-gez v7, :cond_17a

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_14f

    if-eqz v14, :cond_170

    iget-object v7, v1, Le/e/a/u;->q:[Ljava/lang/Float;

    const/16 v33, 0x3

    invoke-static/range {v32 .. v32}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v34

    aput-object v34, v7, v33

    goto :goto_177

    :cond_170
    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_177
    add-int/lit8 v13, v13, -0x1

    goto :goto_14f

    :cond_17a
    const/4 v7, 0x1

    :goto_17b
    if-eqz v14, :cond_17e

    const/4 v7, 0x1

    :cond_17e
    if-eqz v7, :cond_3d9

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Le/e/a/u$d;

    if-eqz v7, :cond_1ae

    if-eqz v14, :cond_1a1

    iget-object v2, v1, Le/e/a/u;->q:[Ljava/lang/Float;

    const/4 v5, 0x1

    aget-object v2, v2, v5

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget-object v5, v1, Le/e/a/u;->q:[Ljava/lang/Float;

    const/4 v6, 0x2

    aget-object v5, v5, v6

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    goto :goto_1aa

    :cond_1a1
    iget-object v5, v7, Le/e/a/u$d;->b:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iget v6, v1, Le/e/a/u;->O:F

    sub-float/2addr v5, v6

    :goto_1aa
    move/from16 v7, v19

    goto/16 :goto_329

    :cond_1ae
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

    new-instance v6, Le/e/a/u$a;

    invoke-direct {v6, v1}, Le/e/a/u$a;-><init>(Le/e/a/u;)V

    invoke-static {v5, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_1dd
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_2c0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/util/Map$Entry;

    invoke-interface/range {v19 .. v19}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v19

    move/from16 v28, v2

    move-object/from16 v2, v19

    check-cast v2, Le/e/a/u$d;

    move-object/from16 v19, v5

    iget-object v5, v2, Le/e/a/u$d;->g:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    const/16 v26, 0x0

    cmpl-float v5, v5, v26

    if-nez v5, :cond_2b4

    iget v5, v1, Le/e/a/u;->O:F

    sub-float v5, v6, v5

    move/from16 v33, v7

    iget-object v7, v2, Le/e/a/u$d;->b:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    cmpg-float v5, v5, v7

    if-gez v5, :cond_2b6

    iget-object v5, v2, Le/e/a/u$d;->c:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    add-float v7, v6, v31

    iget v3, v1, Le/e/a/u;->O:F

    add-float/2addr v7, v3

    cmpg-float v3, v5, v7

    if-gez v3, :cond_2b6

    iget v3, v1, Le/e/a/u;->H:F

    iget-object v5, v2, Le/e/a/u$d;->f:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    add-float/2addr v3, v5

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v3, v5

    iget-object v5, v2, Le/e/a/u$d;->d:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v6

    sub-float/2addr v5, v6

    mul-float v5, v5, v3

    iget-object v6, v2, Le/e/a/u$d;->f:Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    add-float/2addr v5, v6

    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v6

    sub-float v6, v10, v6

    mul-float v6, v6, v24

    cmpg-float v5, v5, v6

    if-gtz v5, :cond_2a5

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-float v5, v5

    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v6

    iget-object v7, v2, Le/e/a/u$d;->d:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    sub-float/2addr v6, v7

    sub-float/2addr v5, v6

    iget-object v6, v2, Le/e/a/u$d;->d:Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v7

    add-float/2addr v7, v5

    sub-float/2addr v6, v7

    mul-float v6, v6, v3

    iget-object v3, v2, Le/e/a/u$d;->f:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    add-float/2addr v6, v3

    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v3

    add-float/2addr v3, v5

    sub-float v3, v10, v3

    mul-float v3, v3, v24

    cmpg-float v3, v6, v3

    if-gtz v3, :cond_293

    iget-object v2, v2, Le/e/a/u$d;->a:Ljava/lang/Float;

    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/u$d;

    invoke-static/range {v32 .. v32}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, v2, Le/e/a/u$d;->g:Ljava/lang/Float;

    move/from16 v2, v33

    goto :goto_2a1

    :cond_293
    iget-object v3, v2, Le/e/a/u$d;->b:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v7

    iget-object v2, v2, Le/e/a/u$d;->b:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    move/from16 v33, v7

    :goto_2a1
    move v7, v2

    move/from16 v6, v33

    goto :goto_2b8

    :cond_2a5
    iget-object v3, v2, Le/e/a/u$d;->b:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    iget-object v2, v2, Le/e/a/u$d;->b:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    move v7, v2

    move v6, v3

    goto :goto_2b8

    :cond_2b4
    move/from16 v33, v7

    :cond_2b6
    move/from16 v7, v33

    :goto_2b8
    move-object/from16 v3, p2

    move-object/from16 v5, v19

    move/from16 v2, v28

    goto/16 :goto_1dd

    :cond_2c0
    move/from16 v28, v2

    iget v2, v1, Le/e/a/u;->O:F

    add-float v2, v31, v2

    add-float/2addr v2, v6

    iget v3, v1, Le/e/a/u;->O:F

    sub-float v3, v2, v3

    iget v5, v1, Le/e/a/u;->I:F

    cmpl-float v3, v3, v5

    if-lez v3, :cond_2e5

    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    iget v3, v1, Le/e/a/u;->I:F

    sub-float v3, v3, v31

    float-to-int v3, v3

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    int-to-float v2, v2

    add-float v2, v2, v31

    const/high16 v3, 0x40000000    # 2.0f

    goto :goto_2e6

    :cond_2e5
    const/4 v3, 0x0

    :goto_2e6
    new-instance v5, Le/e/a/u$d;

    invoke-direct {v5, v1}, Le/e/a/u$d;-><init>(Le/e/a/u;)V

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    iput-object v6, v5, Le/e/a/u$d;->a:Ljava/lang/Float;

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    iput-object v6, v5, Le/e/a/u$d;->b:Ljava/lang/Float;

    sub-float v6, v2, v31

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    iput-object v6, v5, Le/e/a/u$d;->c:Ljava/lang/Float;

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    iput-object v6, v5, Le/e/a/u$d;->d:Ljava/lang/Float;

    invoke-static/range {v31 .. v31}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    iput-object v6, v5, Le/e/a/u$d;->e:Ljava/lang/Float;

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    iput-object v6, v5, Le/e/a/u$d;->f:Ljava/lang/Float;

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, v5, Le/e/a/u$d;->g:Ljava/lang/Float;

    iput-object v12, v5, Le/e/a/u$d;->h:Ljava/lang/Integer;

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v4, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v13, v13, 0x1

    iget v3, v1, Le/e/a/u;->O:F

    sub-float v5, v2, v3

    move v7, v9

    move/from16 v2, v28

    :goto_329
    add-int/lit8 v16, v16, 0x1

    sub-int v3, v13, v16

    iget v6, v1, Le/e/a/u;->T:I

    if-le v3, v6, :cond_338

    if-eqz v14, :cond_334

    goto :goto_338

    :cond_334
    move-object/from16 v6, p1

    goto/16 :goto_3d6

    :cond_338
    :goto_338
    iget v3, v1, Le/e/a/u;->G:I

    if-nez v3, :cond_36c

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    iget v6, v1, Le/e/a/u;->Q:F

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    move/from16 v14, v27

    invoke-virtual {v3, v14}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    iget v6, v1, Le/e/a/u;->W:I

    int-to-float v6, v6

    mul-float v6, v6, v30

    float-to-int v6, v6

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    move-object/from16 v6, p1

    move-object/from16 v10, v29

    invoke-static {v6, v10, v2, v5, v3}, Le/e/a/CommentVisuals;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    const/4 v12, 0x0

    invoke-virtual {v3, v12}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    goto :goto_37f

    :cond_36c
    move-object/from16 v6, p1

    move/from16 v14, v27

    move-object/from16 v10, v29

    iget v3, v1, Le/e/a/u;->G:I

    const/4 v12, 0x1

    if-ne v3, v12, :cond_37f

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    iget v12, v1, Le/e/a/u;->Q:F

    const/4 v15, 0x0

    invoke-virtual {v3, v12, v15, v15, v14}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    :cond_37f
    :goto_37f
    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    sget-object v12, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v12}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    iget v8, v1, Le/e/a/u;->W:I

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-static {v6, v10, v2, v5, v3}, Le/e/a/CommentVisuals;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_3d6

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    const/16 v8, -0x100

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    iget v8, v1, Le/e/a/u;->W:I

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    sget-object v8, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    const/high16 v8, 0x40000000    # 2.0f

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    new-instance v3, Landroid/graphics/Rect;

    float-to-int v10, v2

    iget v12, v1, Le/e/a/u;->O:F

    div-float/2addr v12, v8

    add-float/2addr v12, v5

    sub-float v12, v12, v31

    float-to-int v12, v12

    add-float/2addr v2, v11

    float-to-int v2, v2

    iget v11, v1, Le/e/a/u;->O:F

    div-float/2addr v11, v8

    add-float/2addr v11, v5

    float-to-int v5, v11

    invoke-direct {v3, v10, v12, v2, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object v2, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-virtual {v6, v3, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    :cond_3d6
    :goto_3d6
    move/from16 v19, v7

    goto :goto_3db

    :cond_3d9
    move-object/from16 v6, p1

    :goto_3db
    move-object v2, v6

    goto/16 :goto_622

    :cond_3de
    move/from16 v31, v2

    move/from16 v14, v27

    move-object/from16 v3, v29

    move-object/from16 v2, p1

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/high16 v27, 0x41200000    # 10.0f

    const/4 v4, 0x1

    if-ne v7, v4, :cond_632

    const/4 v4, 0x0

    cmpg-float v7, v24, v4

    if-gez v7, :cond_3f8

    move-object/from16 v7, p5

    :cond_3f6
    :goto_3f6
    const/4 v4, 0x0

    goto :goto_41c

    :cond_3f8
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-float v4, v4

    cmpl-float v4, v24, v4

    if-lez v4, :cond_419

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    move-object/from16 v7, p5

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3f6

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v23, -0x1

    move/from16 v23, v4

    goto :goto_3f6

    :cond_419
    move-object/from16 v7, p5

    const/4 v4, 0x1

    :goto_41c
    if-eqz v4, :cond_620

    iget v4, v1, Le/e/a/u;->I:F

    move/from16 v29, v13

    iget v13, v1, Le/e/a/u;->O:F

    sub-float/2addr v4, v13

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v13

    invoke-virtual {v7, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Le/e/a/u$d;

    if-eqz v13, :cond_450

    iget-object v4, v13, Le/e/a/u$d;->b:Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iget v5, v1, Le/e/a/u;->O:F

    add-float/2addr v4, v5

    iget-object v5, v13, Le/e/a/u$d;->c:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iget-object v6, v13, Le/e/a/u$d;->e:Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    iget-object v10, v13, Le/e/a/u$d;->f:Ljava/lang/Float;

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v10

    move/from16 v32, v9

    goto/16 :goto_576

    :cond_450
    move-object/from16 v13, p2

    invoke-virtual {v13, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    move/from16 v24, v4

    move-object/from16 v4, v19

    check-cast v4, Le/e/a/q;

    iput-object v8, v4, Le/e/a/q;->f:Ljava/lang/Integer;

    invoke-virtual {v13, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/q;

    iput-object v6, v4, Le/e/a/q;->i:Ljava/lang/Integer;

    invoke-virtual {v13, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/q;

    iput-object v5, v4, Le/e/a/q;->j:Ljava/lang/Integer;

    iget v4, v1, Le/e/a/u;->H:F

    cmpg-float v4, v4, v11

    if-gez v4, :cond_48b

    iget v4, v1, Le/e/a/u;->H:F

    iget v5, v1, Le/e/a/u;->N:F

    mul-float v5, v5, v27

    sub-float/2addr v4, v5

    div-float/2addr v4, v11

    mul-float v4, v4, v31

    iget-object v5, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v5, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-virtual {v5, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v11

    move v6, v4

    goto :goto_48d

    :cond_48b
    move/from16 v6, v31

    :goto_48d
    new-instance v4, Ljava/util/ArrayList;

    invoke-virtual/range {p5 .. p5}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v5, Le/e/a/u$b;

    invoke-direct {v5, v1}, Le/e/a/u$b;-><init>(Le/e/a/u;)V

    invoke-static {v4, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_4a2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_51a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/u$d;

    sub-float v19, v24, v6

    move-object/from16 v27, v4

    iget v4, v1, Le/e/a/u;->O:F

    sub-float v19, v19, v4

    iget-object v4, v5, Le/e/a/u$d;->b:Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    cmpg-float v4, v19, v4

    if-gez v4, :cond_513

    iget-object v4, v5, Le/e/a/u$d;->b:Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    move/from16 v32, v9

    iget-object v9, v5, Le/e/a/u$d;->e:Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    sub-float/2addr v4, v9

    iget v9, v1, Le/e/a/u;->O:F

    add-float v9, v24, v9

    cmpg-float v4, v4, v9

    if-gez v4, :cond_515

    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v4

    iget-object v9, v5, Le/e/a/u$d;->d:Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    sub-float/2addr v4, v9

    iget-object v9, v5, Le/e/a/u$d;->h:Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    int-to-float v9, v9

    cmpl-float v4, v4, v9

    if-lez v4, :cond_503

    iget-object v4, v5, Le/e/a/u$d;->a:Ljava/lang/Float;

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_515

    iget-object v4, v5, Le/e/a/u$d;->a:Ljava/lang/Float;

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v23, v23, -0x1

    goto :goto_515

    :cond_503
    iget-object v4, v5, Le/e/a/u$d;->b:Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iget-object v5, v5, Le/e/a/u$d;->e:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    sub-float/2addr v4, v5

    move/from16 v24, v4

    goto :goto_515

    :cond_513
    move/from16 v32, v9

    :cond_515
    :goto_515
    move-object/from16 v4, v27

    move/from16 v9, v32

    goto :goto_4a2

    :cond_51a
    move/from16 v32, v9

    cmpg-float v4, v24, v6

    if-gez v4, :cond_530

    new-instance v4, Ljava/util/Random;

    invoke-direct {v4}, Ljava/util/Random;-><init>()V

    iget v5, v1, Le/e/a/u;->I:F

    sub-float/2addr v5, v6

    float-to-int v5, v5

    invoke-virtual {v4, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v4, v6

    goto :goto_532

    :cond_530
    move/from16 v4, v24

    :goto_532
    iget v5, v1, Le/e/a/u;->H:F

    const/high16 v9, 0x40000000    # 2.0f

    div-float/2addr v5, v9

    div-float v19, v11, v9

    sub-float v5, v5, v19

    new-instance v9, Le/e/a/u$d;

    invoke-direct {v9, v1}, Le/e/a/u$d;-><init>(Le/e/a/u;)V

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v13

    iput-object v13, v9, Le/e/a/u$d;->a:Ljava/lang/Float;

    iget v13, v1, Le/e/a/u;->O:F

    sub-float v13, v4, v13

    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v13

    iput-object v13, v9, Le/e/a/u$d;->b:Ljava/lang/Float;

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v13

    iput-object v13, v9, Le/e/a/u$d;->c:Ljava/lang/Float;

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    iput-object v10, v9, Le/e/a/u$d;->d:Ljava/lang/Float;

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    iput-object v10, v9, Le/e/a/u$d;->e:Ljava/lang/Float;

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    iput-object v10, v9, Le/e/a/u$d;->f:Ljava/lang/Float;

    iput-object v12, v9, Le/e/a/u$d;->h:Ljava/lang/Integer;

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-virtual {v7, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v23, v23, 0x1

    move v10, v11

    move/from16 v19, v32

    :goto_576
    add-int/lit8 v9, v22, 0x1

    sub-int v11, v23, v9

    iget v12, v1, Le/e/a/u;->T:I

    if-gt v11, v12, :cond_614

    iget-object v11, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-virtual {v11, v6}, Landroid/graphics/Paint;->setTextSize(F)V

    iget v11, v1, Le/e/a/u;->G:I

    if-nez v11, :cond_5b1

    iget-object v11, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    sget-object v12, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v11, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    iget v12, v1, Le/e/a/u;->Q:F

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v11, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-virtual {v11, v14}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v11, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    iget v12, v1, Le/e/a/u;->W:I

    int-to-float v12, v12

    mul-float v12, v12, v30

    float-to-int v12, v12

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v11, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-static {v2, v3, v5, v4, v11}, Le/e/a/CommentVisuals;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v11, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    goto :goto_5be

    :cond_5b1
    iget v11, v1, Le/e/a/u;->G:I

    const/4 v12, 0x1

    if-ne v11, v12, :cond_5be

    iget-object v11, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    iget v12, v1, Le/e/a/u;->Q:F

    const/4 v13, 0x0

    invoke-virtual {v11, v12, v13, v13, v14}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    :cond_5be
    :goto_5be
    iget-object v11, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    sget-object v12, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v11, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v11, v8}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v8, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    iget v11, v1, Le/e/a/u;->W:I

    invoke-virtual {v8, v11}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v8, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-static {v2, v3, v5, v4, v8}, Le/e/a/CommentVisuals;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_614

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    const/16 v8, -0x100

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    iget v8, v1, Le/e/a/u;->W:I

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    sget-object v8, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    const/high16 v8, 0x40000000    # 2.0f

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    new-instance v3, Landroid/graphics/Rect;

    float-to-int v11, v5

    iget v12, v1, Le/e/a/u;->O:F

    div-float/2addr v12, v8

    add-float/2addr v12, v4

    sub-float/2addr v12, v6

    float-to-int v6, v12

    add-float/2addr v5, v10

    float-to-int v5, v5

    iget v10, v1, Le/e/a/u;->O:F

    div-float/2addr v10, v8

    add-float/2addr v10, v4

    float-to-int v4, v10

    invoke-direct {v3, v11, v6, v5, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object v4, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    :cond_614
    move v14, v9

    move/from16 v7, v19

    move/from16 v15, v20

    move/from16 v12, v21

    move/from16 v8, v23

    move/from16 v13, v29

    goto :goto_62e

    :cond_620
    move/from16 v29, v13

    :goto_622
    move/from16 v32, v9

    move/from16 v7, v19

    move/from16 v15, v20

    move/from16 v12, v21

    move/from16 v14, v22

    move/from16 v8, v23

    :goto_62e
    move-object/from16 v9, p4

    goto/16 :goto_871

    :cond_632
    move-object/from16 v7, p5

    move/from16 v32, v9

    move/from16 v29, v13

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v9, 0x2

    if-ne v4, v9, :cond_863

    const/4 v4, 0x0

    cmpg-float v9, v24, v4

    if-gez v9, :cond_648

    move-object/from16 v9, p4

    :cond_646
    :goto_646
    const/4 v4, 0x0

    goto :goto_66c

    :cond_648
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-float v4, v4

    cmpl-float v4, v24, v4

    if-lez v4, :cond_669

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    move-object/from16 v9, p4

    invoke-virtual {v9, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_646

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v9, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v21, -0x1

    move/from16 v21, v4

    goto :goto_646

    :cond_669
    move-object/from16 v9, p4

    const/4 v4, 0x1

    :goto_66c
    if-eqz v4, :cond_865

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v9, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/u$d;

    if-eqz v4, :cond_698

    iget-object v5, v4, Le/e/a/u$d;->b:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iget v6, v1, Le/e/a/u;->O:F

    sub-float/2addr v5, v6

    iget-object v6, v4, Le/e/a/u$d;->c:Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    iget-object v10, v4, Le/e/a/u$d;->e:Ljava/lang/Float;

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v10

    iget-object v4, v4, Le/e/a/u$d;->f:Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    move v11, v4

    goto/16 :goto_7bc

    :cond_698
    move-object/from16 v4, p2

    move/from16 v13, v32

    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v7, v19

    check-cast v7, Le/e/a/q;

    iput-object v8, v7, Le/e/a/q;->f:Ljava/lang/Integer;

    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Le/e/a/q;

    iput-object v6, v7, Le/e/a/q;->i:Ljava/lang/Integer;

    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le/e/a/q;

    iput-object v5, v6, Le/e/a/q;->j:Ljava/lang/Integer;

    iget v5, v1, Le/e/a/u;->H:F

    cmpg-float v5, v5, v11

    if-gez v5, :cond_6d3

    iget v5, v1, Le/e/a/u;->H:F

    iget v6, v1, Le/e/a/u;->N:F

    mul-float v6, v6, v27

    sub-float/2addr v5, v6

    div-float/2addr v5, v11

    mul-float v5, v5, v31

    iget-object v6, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-virtual {v6, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v6, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-virtual {v6, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v11

    move/from16 v31, v5

    :cond_6d3
    new-instance v5, Ljava/util/ArrayList;

    invoke-virtual/range {p4 .. p4}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v6, Le/e/a/u$c;

    invoke-direct {v6, v1}, Le/e/a/u$c;-><init>(Le/e/a/u;)V

    invoke-static {v5, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const/4 v6, 0x0

    :goto_6e9
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_75a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Le/e/a/u$d;

    iget v4, v1, Le/e/a/u;->O:F

    sub-float v4, v6, v4

    move-object/from16 v19, v5

    iget-object v5, v7, Le/e/a/u$d;->b:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    cmpg-float v4, v4, v5

    if-gez v4, :cond_751

    iget-object v4, v7, Le/e/a/u$d;->b:Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iget-object v5, v7, Le/e/a/u$d;->e:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    sub-float/2addr v4, v5

    add-float v5, v6, v31

    move/from16 v32, v13

    iget v13, v1, Le/e/a/u;->O:F

    add-float/2addr v5, v13

    cmpg-float v4, v4, v5

    if-gez v4, :cond_753

    invoke-static {v1}, Le/e/a/CommentMotion;->position(Ljava/lang/Object;)F

    move-result v4

    iget-object v5, v7, Le/e/a/u$d;->d:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    sub-float/2addr v4, v5

    iget-object v5, v7, Le/e/a/u$d;->h:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_749

    iget-object v4, v7, Le/e/a/u$d;->a:Ljava/lang/Float;

    invoke-virtual {v9, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_753

    iget-object v4, v7, Le/e/a/u$d;->a:Ljava/lang/Float;

    invoke-virtual {v9, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v21, v21, -0x1

    goto :goto_753

    :cond_749
    iget-object v4, v7, Le/e/a/u$d;->b:Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    move v6, v4

    goto :goto_753

    :cond_751
    move/from16 v32, v13

    :cond_753
    :goto_753
    move-object/from16 v4, p2

    move-object/from16 v5, v19

    move/from16 v13, v32

    goto :goto_6e9

    :cond_75a
    move/from16 v32, v13

    add-float v6, v6, v31

    iget v4, v1, Le/e/a/u;->I:F

    cmpl-float v4, v6, v4

    if-lez v4, :cond_777

    new-instance v4, Ljava/util/Random;

    invoke-direct {v4}, Ljava/util/Random;-><init>()V

    iget v5, v1, Le/e/a/u;->I:F

    sub-float v5, v5, v31

    float-to-int v5, v5

    invoke-virtual {v4, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    int-to-float v4, v4

    add-float v4, v4, v31

    move v5, v4

    goto :goto_778

    :cond_777
    move v5, v6

    :goto_778
    iget v4, v1, Le/e/a/u;->H:F

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v4, v6

    div-float v7, v11, v6

    sub-float v6, v4, v7

    new-instance v4, Le/e/a/u$d;

    invoke-direct {v4, v1}, Le/e/a/u$d;-><init>(Le/e/a/u;)V

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    iput-object v7, v4, Le/e/a/u$d;->a:Ljava/lang/Float;

    iget v7, v1, Le/e/a/u;->O:F

    add-float/2addr v7, v5

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    iput-object v7, v4, Le/e/a/u$d;->b:Ljava/lang/Float;

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    iput-object v7, v4, Le/e/a/u$d;->c:Ljava/lang/Float;

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    iput-object v7, v4, Le/e/a/u$d;->d:Ljava/lang/Float;

    invoke-static/range {v31 .. v31}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    iput-object v7, v4, Le/e/a/u$d;->e:Ljava/lang/Float;

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    iput-object v7, v4, Le/e/a/u$d;->f:Ljava/lang/Float;

    iput-object v12, v4, Le/e/a/u$d;->h:Ljava/lang/Integer;

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-virtual {v9, v7, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v21, v21, 0x1

    move/from16 v10, v31

    move/from16 v19, v32

    :goto_7bc
    add-int/lit8 v15, v20, 0x1

    sub-int v4, v21, v15

    iget v7, v1, Le/e/a/u;->T:I

    if-gt v4, v7, :cond_85a

    iget-object v4, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-virtual {v4, v10}, Landroid/graphics/Paint;->setTextSize(F)V

    iget v4, v1, Le/e/a/u;->G:I

    if-nez v4, :cond_7f7

    iget-object v4, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v4, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    iget v7, v1, Le/e/a/u;->Q:F

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v4, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-virtual {v4, v14}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v4, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    iget v7, v1, Le/e/a/u;->W:I

    int-to-float v7, v7

    mul-float v7, v7, v30

    float-to-int v7, v7

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v4, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-static {v2, v3, v6, v5, v4}, Le/e/a/CommentVisuals;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v4, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    const/4 v7, 0x0

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    goto :goto_804

    :cond_7f7
    iget v4, v1, Le/e/a/u;->G:I

    const/4 v7, 0x1

    if-ne v4, v7, :cond_804

    iget-object v4, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    iget v7, v1, Le/e/a/u;->Q:F

    const/4 v12, 0x0

    invoke-virtual {v4, v7, v12, v12, v14}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    :cond_804
    :goto_804
    iget-object v4, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v4, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v4, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    iget v7, v1, Le/e/a/u;->W:I

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v4, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-static {v2, v3, v6, v5, v4}, Le/e/a/CommentVisuals;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_85a

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    const/16 v4, -0x100

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    iget v4, v1, Le/e/a/u;->W:I

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    const/high16 v4, 0x40000000    # 2.0f

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    new-instance v3, Landroid/graphics/Rect;

    float-to-int v7, v6

    iget v8, v1, Le/e/a/u;->O:F

    div-float/2addr v8, v4

    add-float/2addr v8, v5

    sub-float/2addr v8, v10

    float-to-int v8, v8

    add-float/2addr v6, v11

    float-to-int v6, v6

    iget v10, v1, Le/e/a/u;->O:F

    div-float/2addr v10, v4

    add-float/2addr v10, v5

    float-to-int v4, v10

    invoke-direct {v3, v7, v8, v6, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object v4, v1, Le/e/a/u;->r0:Landroid/graphics/Paint;

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    :cond_85a
    move/from16 v7, v19

    goto :goto_869

    :cond_85d
    move/from16 v32, v9

    move/from16 v29, v13

    const/16 v18, 0x0

    :cond_863
    move-object/from16 v9, p4

    :cond_865
    move/from16 v7, v19

    move/from16 v15, v20

    :goto_869
    move/from16 v12, v21

    move/from16 v14, v22

    move/from16 v8, v23

    move/from16 v13, v29

    :goto_871
    add-int/lit8 v3, v32, 0x1

    move-object/from16 v4, p3

    move-object/from16 v6, p5

    move-object v5, v9

    move-object/from16 v10, v17

    move v9, v3

    move-object/from16 v3, p2

    goto/16 :goto_2f

    :cond_87f
    move/from16 v19, v7

    if-eqz v19, :cond_892

    iget v2, v1, Le/e/a/u;->q0:I

    move/from16 v11, v19

    if-eq v2, v11, :cond_892

    iput v11, v1, Le/e/a/u;->q0:I

    iget-object v2, v1, Le/e/a/u;->E:Le/e/a/l3/c;

    iget v3, v1, Le/e/a/u;->q0:I

    invoke-interface {v2, v3}, Le/e/a/l3/c;->b(I)V

    :cond_892
    iget-boolean v2, v1, Le/e/a/u;->u:Z

    if-eqz v2, :cond_899

    invoke-virtual/range {p0 .. p0}, Le/e/a/u;->c()V

    :cond_899
    iget-boolean v2, v1, Le/e/a/u;->o:Z

    if-eqz v2, :cond_8a9

    invoke-virtual/range {p0 .. p0}, Le/e/a/u;->l()V
    :try_end_8a0
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_8a0} :catch_8a4
    .catchall {:try_start_17 .. :try_end_8a0} :catchall_8a1

    goto :goto_8a9

    :catchall_8a1
    move-exception v0

    move-object v2, v0

    goto :goto_8ae

    :catch_8a4
    move-exception v0

    move-object v2, v0

    :try_start_8a6
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_8a9
    .catchall {:try_start_8a6 .. :try_end_8a9} :catchall_8a1

    :cond_8a9
    :goto_8a9
    invoke-static/range {p1 .. p1}, Le/e/a/CommentViewport190;->end(Landroid/graphics/Canvas;)V

    monitor-exit p0

    return-void

    :goto_8ae
    invoke-static/range {p1 .. p1}, Le/e/a/CommentViewport190;->end(Landroid/graphics/Canvas;)V

    monitor-exit p0

    goto :goto_8b4

    :goto_8b3
    throw v2

    :goto_8b4
    goto :goto_8b3
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
    .registers 14

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
    iget-object v7, p0, Le/e/a/u;->t:Ljava/lang/Thread;

    if-eqz v7, :cond_ab

    iget-boolean v7, p0, Le/e/a/u;->u:Z

    if-nez v7, :cond_ab

    monitor-enter p0

    const/4 v7, 0x0

    const/4 v8, 0x1

    :try_start_1b
    iget-boolean v9, p0, Le/e/a/u;->u:Z

    if-nez v9, :cond_67

    iget-boolean v9, p0, Le/e/a/u;->v:Z

    if-eqz v9, :cond_23

    iget-boolean v9, p0, Le/e/a/u;->C:Z

    if-eqz v9, :cond_67

    :cond_23
    invoke-virtual {p0}, Landroid/view/TextureView;->lockCanvas()Landroid/graphics/Canvas;

    move-result-object v7

    if-eqz v7, :cond_67

    const/4 v9, 0x0

    sget-object v10, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v7, v9, v10}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    iget-boolean v9, p0, Le/e/a/u;->v:Z

    if-nez v9, :cond_5d

    iget-boolean v9, p0, Le/e/a/u;->b:Z

    if-eqz v9, :cond_5d

    iget-object v9, p0, Le/e/a/u;->D:Le/e/a/n0;

    if-eqz v9, :cond_5d

    invoke-virtual {v9}, Le/e/a/n0;->b()I

    move-result v9

    if-lez v9, :cond_5d

    iget-boolean v9, p0, Le/e/a/u;->r:Z

    if-eqz v9, :cond_48

    invoke-virtual {p0, v7}, Le/e/a/u;->b(Landroid/graphics/Canvas;)V

    :cond_48
    invoke-virtual {p0, v7}, Le/e/a/u;->a(Landroid/graphics/Canvas;)V

    iget-boolean v9, p0, Le/e/a/u;->A:Z

    if-eqz v9, :cond_67

    iget-object v9, p0, Le/e/a/u;->F:[Ljava/lang/String;

    invoke-static {p0, v7, v9}, Le/e/a/SeekFeedback239;->draw(Ljava/lang/Object;Landroid/graphics/Canvas;[Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_5c

    iget-object v9, p0, Le/e/a/u;->F:[Ljava/lang/String;

    invoke-virtual {p0, v7, v9}, Le/e/a/u;->a(Landroid/graphics/Canvas;[Ljava/lang/String;)V

    :cond_5c
    goto :goto_67

    :cond_5d
    iget-boolean v9, p0, Le/e/a/u;->C:Z

    if-eqz v9, :cond_67

    const/4 v9, 0x0

    sget-object v10, Landroid/graphics/PorterDuff$Mode;->SCREEN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v7, v9, v10}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V
    :try_end_67
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1b .. :try_end_67} :catch_78
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_67} :catch_6f
    .catchall {:try_start_1b .. :try_end_67} :catchall_6d

    :cond_67
    :goto_67
    if-eqz v7, :cond_81

    :goto_69
    :try_start_69
    invoke-virtual {p0, v7}, Landroid/view/TextureView;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V
    :try_end_6c
    .catchall {:try_start_69 .. :try_end_6c} :catchall_a8

    goto :goto_81

    :catchall_6d
    move-exception v0

    goto :goto_a2

    :catch_6f
    move-exception v9

    :try_start_70
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    iput-boolean v8, p0, Le/e/a/u;->u:Z

    if-eqz v7, :cond_81

    goto :goto_69

    :catch_78
    move-exception v9

    invoke-virtual {v9}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    iput-boolean v8, p0, Le/e/a/u;->u:Z
    :try_end_7e
    .catchall {:try_start_70 .. :try_end_7e} :catchall_6d

    if-eqz v7, :cond_81

    goto :goto_69

    :cond_81
    :goto_81
    :try_start_81
    invoke-static {}, Le/e/a/CommentMotion;->nowQ16()J

    move-result-wide v7
    :try_end_85
    .catchall {:try_start_81 .. :try_end_85} :catchall_a8

    sub-long v2, v7, v2

    sub-long v2, v0, v2

    sub-long/2addr v2, v5

    const-wide/16 v5, 0x0

    cmp-long v9, v2, v5

    if-gez v9, :cond_91

    move-wide v2, v5

    :cond_91
    :try_start_91
    invoke-static {v2, v3}, Le/e/a/CommentMotion;->sleepQ16(J)V
    :try_end_94
    .catch Ljava/lang/InterruptedException; {:try_start_91 .. :try_end_94} :catch_94
    .catchall {:try_start_91 .. :try_end_94} :catchall_a8

    :catch_94
    :try_start_94
    invoke-static {}, Le/e/a/CommentMotion;->nowQ16()J

    move-result-wide v5

    sub-long v7, v5, v7

    sub-long v2, v7, v2

    monitor-exit p0

    move-wide v11, v2

    move-wide v2, v5

    move-wide v5, v11

    goto/16 :goto_10

    :goto_a2
    if-eqz v7, :cond_a7

    invoke-virtual {p0, v7}, Landroid/view/TextureView;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    :cond_a7
    throw v0

    :catchall_a8
    move-exception v0

    monitor-exit p0
    :try_end_aa
    .catchall {:try_start_94 .. :try_end_aa} :catchall_a8

    throw v0

    :cond_ab
    return-void
.end method

.method public setPlaySpeed(F)V
    .registers 2

    invoke-static {p0, p1}, Le/e/a/CommentClock;->speed(Ljava/lang/Object;F)V

    return-void
.end method

.method public setRyuuyou(Landroid/view/View;)V
    .registers 4

    instance-of v0, p1, Le/e/a/t;

    if-eqz v0, :cond_1f

    check-cast p1, Le/e/a/t;

    iget-boolean v0, p1, Le/e/a/t;->g:Z

    iput-boolean v0, p0, Le/e/a/u;->g:Z

    iget-object v0, p1, Le/e/a/t;->i:Ljava/util/ArrayList;

    iput-object v0, p0, Le/e/a/u;->i:Ljava/util/ArrayList;

    iget-boolean v0, p1, Le/e/a/t;->m:Z

    iput-boolean v0, p0, Le/e/a/u;->m:Z

    iget-object v0, p1, Le/e/a/t;->n:Ljava/util/ArrayList;

    iput-object v0, p0, Le/e/a/u;->n:Ljava/util/ArrayList;

    iget-boolean v0, p1, Le/e/a/t;->b:Z

    iput-boolean v0, p0, Le/e/a/u;->b:Z

    iget-object v0, p1, Le/e/a/t;->c:Ljava/util/ArrayList;

    iput-object v0, p0, Le/e/a/u;->c:Ljava/util/ArrayList;

    return-void

    :cond_1f
    check-cast p1, Le/e/a/u;

    iget-boolean v0, p1, Le/e/a/u;->g:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_2c

    iget-object v0, p1, Le/e/a/u;->i:Ljava/util/ArrayList;

    iput-object v0, p0, Le/e/a/u;->i:Ljava/util/ArrayList;

    iput-boolean v1, p0, Le/e/a/u;->g:Z

    :cond_2c
    iget-boolean v0, p1, Le/e/a/u;->m:Z

    if-eqz v0, :cond_36

    iget-object v0, p1, Le/e/a/u;->n:Ljava/util/ArrayList;

    iput-object v0, p0, Le/e/a/u;->n:Ljava/util/ArrayList;

    iput-boolean v1, p0, Le/e/a/u;->m:Z

    :cond_36
    iget-boolean v0, p1, Le/e/a/u;->b:Z

    if-eqz v0, :cond_40

    iget-object p1, p1, Le/e/a/u;->c:Ljava/util/ArrayList;

    iput-object p1, p0, Le/e/a/u;->c:Ljava/util/ArrayList;

    iput-boolean v1, p0, Le/e/a/u;->b:Z

    :cond_40
    return-void
.end method
