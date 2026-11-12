.class public final Liya;
.super Lhyf;
.source "SourceFile"


# instance fields
.field public final f:Ljva;


# direct methods
.method public constructor <init>(Ljva;)V
    .registers 2

    invoke-direct {p0}, Lhyf;-><init>()V

    iput-object p1, p0, Liya;->f:Ljva;

    return-void
.end method


# virtual methods
.method public final h()J
    .registers 7

    iget-object p0, p0, Liya;->f:Ljva;

    invoke-interface {p0}, Ljva;->getWidth()I

    move-result v0

    const/high16 v1, 0x7fc00000    # Float.NaN

    if-lez v0, :cond_c

    int-to-float v0, v0

    goto :goto_d

    :cond_c
    move v0, v1

    :goto_d
    invoke-interface {p0}, Ljva;->getHeight()I

    move-result p0

    if-lez p0, :cond_14

    int-to-float v1, p0

    :cond_14
    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p0

    int-to-long v2, p0

    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p0

    int-to-long v0, p0

    const/16 p0, 0x20

    shl-long/2addr v2, p0

    const-wide v4, 0xffffffffL

    and-long/2addr v0, v4

    or-long/2addr v2, v0

    return-wide v2
.end method

.method public final i(Lmk7;)V
    .registers 10

    iget-object p0, p0, Liya;->f:Ljva;

    invoke-interface {p0}, Ljva;->getWidth()I

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    if-lez v0, :cond_19

    invoke-interface {p1}, Lmk7;->e()J

    move-result-wide v2

    const/16 v4, 0x20

    shr-long/2addr v2, v4

    long-to-int v2, v2

    invoke-static {v2}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v2

    int-to-float v0, v0

    div-float/2addr v2, v0

    goto :goto_1a

    :cond_19
    move v2, v1

    :goto_1a
    invoke-interface {p0}, Ljva;->getHeight()I

    move-result v0

    if-lez v0, :cond_31

    invoke-interface {p1}, Lmk7;->e()J

    move-result-wide v3

    const-wide v5, 0xffffffffL

    and-long/2addr v3, v5

    long-to-int v1, v3

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    int-to-float v0, v0

    div-float/2addr v1, v0

    :cond_31
    invoke-interface {p1}, Lmk7;->s0()Ld5o;

    move-result-object v0

    invoke-virtual {v0}, Ld5o;->D()J

    move-result-wide v3

    invoke-virtual {v0}, Ld5o;->A()Lsh4;

    move-result-object v5

    invoke-interface {v5}, Lsh4;->j()V

    :try_start_40
    iget-object v5, v0, Ld5o;->a:Ljava/lang/Object;

    check-cast v5, Lwth;

    const-wide/16 v6, 0x0

    invoke-virtual {v5, v2, v1, v6, v7}, Lwth;->N(FFJ)V

    invoke-interface {p1}, Lmk7;->s0()Ld5o;

    move-result-object p1

    invoke-virtual {p1}, Ld5o;->A()Lsh4;

    move-result-object p1

    sget-object v1, Lb31;->a:Landroid/graphics/Canvas;

    check-cast p1, La31;

    iget-object p1, p1, La31;->a:Landroid/graphics/Canvas;

    invoke-interface {p0, p1}, Ljva;->c(Landroid/graphics/Canvas;)V
    :try_end_5a
    .catchall {:try_start_40 .. :try_end_5a} :catchall_5e

    invoke-static {v0, v3, v4}, Lam2;->w(Ld5o;J)V

    return-void

    :catchall_5e
    move-exception p0

    invoke-static {v0, v3, v4}, Lam2;->w(Ld5o;J)V

    throw p0
.end method
