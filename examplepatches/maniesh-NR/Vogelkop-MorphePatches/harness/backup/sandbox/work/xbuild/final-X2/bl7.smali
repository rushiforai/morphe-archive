.class public final Lbl7;
.super Lhyf;
.source "SourceFile"

# interfaces
.implements Ldth;


# instance fields
.field public final f:Landroid/graphics/drawable/Drawable;

.field public final g:Lt0g;

.field public final h:Lt0g;

.field public final i:Lzyk;


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .registers 9

    invoke-direct {p0}, Lhyf;-><init>()V

    iput-object p1, p0, Lbl7;->f:Landroid/graphics/drawable/Drawable;

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object v1

    iput-object v1, p0, Lbl7;->g:Lt0g;

    sget-object v1, Lcl7;->a:Ll4c;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    if-ltz v1, :cond_3d

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    if-ltz v1, :cond_3d

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    int-to-long v3, v1

    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    int-to-long v1, v1

    const/16 v5, 0x20

    shl-long/2addr v3, v5

    const-wide v5, 0xffffffffL

    and-long/2addr v1, v5

    or-long/2addr v3, v1

    goto :goto_42

    :cond_3d
    const-wide v3, 0x7fc000007fc00000L    # 2.247117487993712E307

    :goto_42
    new-instance v1, Lbpj;

    invoke-direct {v1, v3, v4}, Lbpj;-><init>(J)V

    invoke-static {v1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object v1

    iput-object v1, p0, Lbl7;->h:Lt0g;

    new-instance v1, Lal7;

    invoke-direct {v1, p0, v0}, Lal7;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v1

    iput-object v1, p0, Lbl7;->i:Lzyk;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p0

    if-ltz p0, :cond_6f

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p0

    if-ltz p0, :cond_6f

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p0

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    invoke-virtual {p1, v0, v0, p0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_6f
    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object v0, p0, Lbl7;->i:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable$Callback;

    iget-object p0, p0, Lbl7;->f:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    instance-of v0, p0, Landroid/graphics/drawable/Animatable;

    if-eqz v0, :cond_1a

    check-cast p0, Landroid/graphics/drawable/Animatable;

    invoke-interface {p0}, Landroid/graphics/drawable/Animatable;->start()V

    :cond_1a
    return-void
.end method

.method public final b()V
    .registers 1

    invoke-virtual {p0}, Lbl7;->c()V

    return-void
.end method

.method public final c()V
    .registers 2

    iget-object p0, p0, Lbl7;->f:Landroid/graphics/drawable/Drawable;

    instance-of v0, p0, Landroid/graphics/drawable/Animatable;

    if-eqz v0, :cond_c

    move-object v0, p0

    check-cast v0, Landroid/graphics/drawable/Animatable;

    invoke-interface {v0}, Landroid/graphics/drawable/Animatable;->stop()V

    :cond_c
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    return-void
.end method

.method public final d(F)Z
    .registers 4

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float/2addr p1, v0

    invoke-static {p1}, Lzed;->b(F)I

    move-result p1

    const/4 v0, 0x0

    const/16 v1, 0xff

    invoke-static {p1, v0, v1}, Ldjh;->c(III)I

    move-result p1

    iget-object p0, p0, Lbl7;->f:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    const/4 p0, 0x1

    return p0
.end method

.method public final e(Lkh3;)Z
    .registers 2

    if-eqz p1, :cond_5

    iget-object p1, p1, Lkh3;->a:Landroid/graphics/BlendModeColorFilter;

    goto :goto_6

    :cond_5
    const/4 p1, 0x0

    :goto_6
    iget-object p0, p0, Lbl7;->f:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    const/4 p0, 0x1

    return p0
.end method

.method public final f(Ld2c;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_d

    const/4 v0, 0x1

    if-eq p1, v0, :cond_e

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_d
    const/4 v0, 0x0

    :cond_e
    iget-object p0, p0, Lbl7;->f:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setLayoutDirection(I)Z

    return-void
.end method

.method public final h()J
    .registers 3

    iget-object p0, p0, Lbl7;->h:Lt0g;

    invoke-virtual {p0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbpj;

    iget-wide v0, p0, Lbpj;->a:J

    return-wide v0
.end method

.method public final i(Lmk7;)V
    .registers 8

    invoke-interface {p1}, Lmk7;->s0()Ld5o;

    move-result-object v0

    invoke-virtual {v0}, Ld5o;->A()Lsh4;

    move-result-object v0

    iget-object v1, p0, Lbl7;->g:Lt0g;

    invoke-virtual {v1}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    :try_start_13
    invoke-interface {v0}, Lsh4;->j()V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_18
    .catchall {:try_start_13 .. :try_end_18} :catchall_72

    const/16 v2, 0x1f

    iget-object v3, p0, Lbl7;->f:Landroid/graphics/drawable/Drawable;

    if-ge v1, v2, :cond_48

    :try_start_1e
    instance-of v1, v3, Landroid/graphics/drawable/AnimatedImageDrawable;

    if-eqz v1, :cond_48

    invoke-interface {p1}, Lmk7;->e()J

    move-result-wide v1

    invoke-static {v1, v2}, Lbpj;->d(J)F

    move-result v1

    invoke-virtual {p0}, Lbl7;->h()J

    move-result-wide v4

    invoke-static {v4, v5}, Lbpj;->d(J)F

    move-result v2

    div-float/2addr v1, v2

    invoke-interface {p1}, Lmk7;->e()J

    move-result-wide v4

    invoke-static {v4, v5}, Lbpj;->b(J)F

    move-result p1

    invoke-virtual {p0}, Lbl7;->h()J

    move-result-wide v4

    invoke-static {v4, v5}, Lbpj;->b(J)F

    move-result p0

    div-float/2addr p1, p0

    invoke-interface {v0, v1, p1}, Lsh4;->a(FF)V

    goto :goto_64

    :cond_48
    invoke-interface {p1}, Lmk7;->e()J

    move-result-wide v1

    invoke-static {v1, v2}, Lbpj;->d(J)F

    move-result p0

    invoke-static {p0}, Lzed;->b(F)I

    move-result p0

    invoke-interface {p1}, Lmk7;->e()J

    move-result-wide v1

    invoke-static {v1, v2}, Lbpj;->b(J)F

    move-result p1

    invoke-static {p1}, Lzed;->b(F)I

    move-result p1

    const/4 v1, 0x0

    invoke-virtual {v3, v1, v1, p0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :goto_64
    sget-object p0, Lb31;->a:Landroid/graphics/Canvas;

    move-object p0, v0

    check-cast p0, La31;

    iget-object p0, p0, La31;->a:Landroid/graphics/Canvas;

    invoke-virtual {v3, p0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    :try_end_6e
    .catchall {:try_start_1e .. :try_end_6e} :catchall_72

    invoke-interface {v0}, Lsh4;->f()V

    return-void

    :catchall_72
    move-exception p0

    invoke-interface {v0}, Lsh4;->f()V

    throw p0
.end method
