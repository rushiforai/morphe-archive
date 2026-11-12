.class public final Ld4c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lfpj;

.field public final b:I

.field public final c:Z

.field public final d:F

.field public final e:I

.field public final f:I

.field public final g:I


# direct methods
.method public constructor <init>(Lfpj;IZFIII)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld4c;->a:Lfpj;

    iput p2, p0, Ld4c;->b:I

    iput-boolean p3, p0, Ld4c;->c:Z

    iput p4, p0, Ld4c;->d:F

    iput p5, p0, Ld4c;->e:I

    iput p6, p0, Ld4c;->f:I

    iput p7, p0, Ld4c;->g:I

    return-void
.end method

.method public static final a(Landroid/content/Context;)Ld4c;
    .registers 15

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    sget-object v2, Lfpj;->a:Ldpj;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Ldpj;->k(Landroid/content/Context;)Lfpj;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x4

    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v9, 0x1

    if-eqz v2, :cond_2d

    if-eq v2, v9, :cond_2d

    if-eq v2, v8, :cond_2d

    if-eq v2, v7, :cond_2b

    if-eq v2, v6, :cond_2b

    invoke-static {}, Lh9o;->p()V

    return-object v3

    :cond_2b
    move v2, v9

    goto :goto_2e

    :cond_2d
    move v2, v5

    :goto_2e
    if-eqz v2, :cond_4c

    if-eq v1, v9, :cond_4c

    const v1, 0x7f0705d3

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    const v10, 0x7f0705d4

    invoke-virtual {v0, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    add-int/2addr v0, v1

    invoke-static {p0}, Lr9n;->j(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-ge v0, v1, :cond_4c

    move v5, v9

    :cond_4c
    if-eqz v2, :cond_59

    if-eqz v5, :cond_55

    const v0, 0x3f47ae14    # 0.78f

    :goto_53
    move-object v1, v3

    goto :goto_5d

    :cond_55
    const v0, 0x3f170a3d    # 0.59f

    goto :goto_53

    :cond_59
    const v0, 0x3ee66666    # 0.45f

    goto :goto_53

    :goto_5d
    new-instance v3, Ld4c;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    if-eqz v2, :cond_75

    if-eq v2, v9, :cond_71

    if-eq v2, v8, :cond_71

    if-eq v2, v7, :cond_71

    if-eq v2, v6, :cond_71

    invoke-static {}, Lh9o;->p()V

    return-object v1

    :cond_71
    const v2, 0x7f0d0284

    goto :goto_78

    :cond_75
    const v2, 0x7f0d0285

    :goto_78
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v10

    if-eqz v10, :cond_91

    if-eq v10, v9, :cond_91

    if-eq v10, v8, :cond_8a

    if-eq v10, v7, :cond_91

    if-eq v10, v6, :cond_91

    invoke-static {}, Lh9o;->p()V

    return-object v1

    :cond_8a
    const/high16 v10, 0x42800000    # 64.0f

    invoke-static {p0, v10}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v10

    goto :goto_96

    :cond_91
    const/4 v10, 0x0

    invoke-static {p0, v10}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v10

    :goto_96
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v11

    const/high16 v12, 0x41800000    # 16.0f

    if-eqz v11, :cond_af

    if-eq v11, v9, :cond_af

    if-eq v11, v8, :cond_aa

    if-eq v11, v7, :cond_aa

    if-eq v11, v6, :cond_aa

    invoke-static {}, Lh9o;->p()V

    return-object v1

    :cond_aa
    invoke-static {p0, v12}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v11

    goto :goto_b5

    :cond_af
    const/high16 v11, 0x41000000    # 8.0f

    invoke-static {p0, v11}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v11

    :goto_b5
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v13

    if-eqz v13, :cond_d4

    if-eq v13, v9, :cond_c7

    if-eq v13, v8, :cond_c7

    if-eq v13, v7, :cond_c7

    if-eq v13, v6, :cond_c7

    invoke-static {}, Lh9o;->p()V

    return-object v1

    :cond_c7
    const/high16 v1, 0x41c00000    # 24.0f

    invoke-static {p0, v1}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p0

    :goto_cd
    move v7, v0

    move v6, v5

    move v8, v10

    move v9, v11

    move v10, p0

    move v5, v2

    goto :goto_d9

    :cond_d4
    invoke-static {p0, v12}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p0

    goto :goto_cd

    :goto_d9
    invoke-direct/range {v3 .. v10}, Ld4c;-><init>(Lfpj;IZFIII)V

    return-object v3
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_38

    instance-of v0, p1, Ld4c;

    if-eqz v0, :cond_36

    check-cast p1, Ld4c;

    iget-object v0, p0, Ld4c;->a:Lfpj;

    iget-object v1, p1, Ld4c;->a:Lfpj;

    if-ne v0, v1, :cond_36

    iget v0, p0, Ld4c;->b:I

    iget v1, p1, Ld4c;->b:I

    if-ne v0, v1, :cond_36

    iget-boolean v0, p0, Ld4c;->c:Z

    iget-boolean v1, p1, Ld4c;->c:Z

    if-ne v0, v1, :cond_36

    iget v0, p0, Ld4c;->d:F

    iget v1, p1, Ld4c;->d:F

    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-nez v0, :cond_36

    iget v0, p0, Ld4c;->e:I

    iget v1, p1, Ld4c;->e:I

    if-ne v0, v1, :cond_36

    iget v0, p0, Ld4c;->f:I

    iget v1, p1, Ld4c;->f:I

    if-ne v0, v1, :cond_36

    iget p0, p0, Ld4c;->g:I

    iget p1, p1, Ld4c;->g:I

    if-eq p0, p1, :cond_38

    :cond_36
    const/4 p0, 0x0

    return p0

    :cond_38
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Ld4c;->a:Lfpj;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Ld4c;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean v2, p0, Ld4c;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget v2, p0, Ld4c;->d:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget v2, p0, Ld4c;->e:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ld4c;->f:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Ld4c;->g:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
