.class public final Lzf5;
.super Landroid/view/View$DragShadowBuilder;
.source "SourceFile"


# instance fields
.field public final a:Lq27;

.field public final b:J

.field public final c:Lkotlin/jvm/functions/Function1;


# direct methods
.method public constructor <init>(Lq27;JLkotlin/jvm/functions/Function1;)V
    .registers 5

    invoke-direct {p0}, Landroid/view/View$DragShadowBuilder;-><init>()V

    iput-object p1, p0, Lzf5;->a:Lq27;

    iput-wide p2, p0, Lzf5;->b:J

    iput-object p4, p0, Lzf5;->c:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final onDrawShadow(Landroid/graphics/Canvas;)V
    .registers 12

    new-instance v0, Luh4;

    invoke-direct {v0}, Luh4;-><init>()V

    sget-object v1, Ld2c;->a:Ld2c;

    sget-object v2, Lb31;->a:Landroid/graphics/Canvas;

    new-instance v2, La31;

    invoke-direct {v2}, La31;-><init>()V

    iput-object p1, v2, La31;->a:Landroid/graphics/Canvas;

    iget-object p1, v0, Luh4;->a:Lth4;

    iget-object v3, p1, Lth4;->a:Ln27;

    iget-object v4, p1, Lth4;->b:Ld2c;

    iget-object v5, p1, Lth4;->c:Lsh4;

    iget-wide v6, p1, Lth4;->d:J

    iget-object v8, p0, Lzf5;->a:Lq27;

    iput-object v8, p1, Lth4;->a:Ln27;

    iput-object v1, p1, Lth4;->b:Ld2c;

    iput-object v2, p1, Lth4;->c:Lsh4;

    iget-wide v8, p0, Lzf5;->b:J

    iput-wide v8, p1, Lth4;->d:J

    invoke-virtual {v2}, La31;->j()V

    iget-object p0, p0, Lzf5;->c:Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2}, La31;->f()V

    iput-object v3, p1, Lth4;->a:Ln27;

    iput-object v4, p1, Lth4;->b:Ld2c;

    iput-object v5, p1, Lth4;->c:Lsh4;

    iput-wide v6, p1, Lth4;->d:J

    return-void
.end method

.method public final onProvideShadowMetrics(Landroid/graphics/Point;Landroid/graphics/Point;)V
    .registers 8

    const/16 v0, 0x20

    iget-wide v1, p0, Lzf5;->b:J

    shr-long v3, v1, v0

    long-to-int v0, v3

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    iget-object p0, p0, Lzf5;->a:Lq27;

    invoke-virtual {p0}, Lq27;->b()F

    move-result v3

    div-float/2addr v0, v3

    invoke-interface {p0, v0}, Ln27;->M(F)I

    move-result v0

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    long-to-int v1, v1

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    invoke-virtual {p0}, Lq27;->b()F

    move-result v2

    div-float/2addr v1, v2

    invoke-interface {p0, v1}, Ln27;->M(F)I

    move-result p0

    invoke-virtual {p1, v0, p0}, Landroid/graphics/Point;->set(II)V

    iget p0, p1, Landroid/graphics/Point;->x:I

    div-int/lit8 p0, p0, 0x2

    iget p1, p1, Landroid/graphics/Point;->y:I

    div-int/lit8 p1, p1, 0x2

    invoke-virtual {p2, p0, p1}, Landroid/graphics/Point;->set(II)V

    return-void
.end method
