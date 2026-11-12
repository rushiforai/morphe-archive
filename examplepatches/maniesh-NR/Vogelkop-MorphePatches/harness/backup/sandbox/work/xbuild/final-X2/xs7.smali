.class public final synthetic Lxs7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/opera/hype/image/editor/EditImage;

.field public final synthetic b:Llqh;

.field public final synthetic c:F

.field public final synthetic d:Llqh;

.field public final synthetic e:F


# direct methods
.method public synthetic constructor <init>(Lcom/opera/hype/image/editor/EditImage;Llqh;FLlqh;F)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxs7;->a:Lcom/opera/hype/image/editor/EditImage;

    iput-object p2, p0, Lxs7;->b:Llqh;

    iput p3, p0, Lxs7;->c:F

    iput-object p4, p0, Lxs7;->d:Llqh;

    iput p5, p0, Lxs7;->e:F

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    check-cast p1, Li97;

    sget-object v0, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    iget-object p1, p1, Li97;->a:Landroid/graphics/PointF;

    iget v0, p1, Landroid/graphics/PointF;->x:F

    iget p1, p1, Landroid/graphics/PointF;->y:F

    iget-object v1, p0, Lxs7;->a:Lcom/opera/hype/image/editor/EditImage;

    iget-object v1, v1, Lcom/opera/hype/image/editor/EditImage;->b:Lean;

    iget-object v1, v1, Lean;->a:Lydb;

    iget v2, p0, Lxs7;->c:F

    cmpl-float v3, v2, v0

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ltz v3, :cond_24

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, v0

    cmpg-float v0, v2, v3

    if-gtz v0, :cond_24

    move v0, v5

    goto :goto_25

    :cond_24
    move v0, v4

    :goto_25
    iget-object v2, p0, Lxs7;->b:Llqh;

    iput-boolean v0, v2, Llqh;->a:Z

    iget v0, p0, Lxs7;->e:F

    cmpl-float v2, v0, p1

    if-ltz v2, :cond_3a

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v1, p1

    cmpg-float p1, v0, v1

    if-gtz p1, :cond_3a

    move v4, v5

    :cond_3a
    iget-object p0, p0, Lxs7;->d:Llqh;

    iput-boolean v4, p0, Llqh;->a:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
