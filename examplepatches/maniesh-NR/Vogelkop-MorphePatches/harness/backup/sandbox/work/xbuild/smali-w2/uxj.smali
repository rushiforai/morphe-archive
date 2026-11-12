.class public final Luxj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lixh;

.field public final b:Z

.field public final c:I

.field public final d:Ldxh;

.field public final e:Ldxh;

.field public final f:Lixh;

.field public final g:Ly7h;


# direct methods
.method public constructor <init>(Lixh;I)V
    .registers 10

    new-instance v0, Lixh;

    const/high16 v1, 0x42400000    # 48.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    and-int/lit8 v1, p2, 0x2

    const/4 v2, 0x1

    if-eqz v1, :cond_e

    move v1, v2

    goto :goto_f

    :cond_e
    const/4 v1, 0x0

    :goto_f
    and-int/lit8 v3, p2, 0x4

    if-eqz v3, :cond_14

    const/4 v2, 0x2

    :cond_14
    new-instance v3, Ldxh;

    const v4, 0x7f0402ed

    invoke-direct {v3, v4}, Ldxh;-><init>(I)V

    new-instance v4, Ldxh;

    const v5, 0x7f04021b

    invoke-direct {v4, v5}, Ldxh;-><init>(I)V

    new-instance v5, Lixh;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v5, v6}, Lixh;-><init>(F)V

    and-int/lit8 p2, p2, 0x40

    if-eqz p2, :cond_36

    new-instance p1, Lixh;

    const/high16 p2, 0x40800000    # 4.0f

    invoke-direct {p1, p2}, Lixh;-><init>(F)V

    :cond_36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Luxj;->a:Lixh;

    iput-boolean v1, p0, Luxj;->b:Z

    iput v2, p0, Luxj;->c:I

    iput-object v3, p0, Luxj;->d:Ldxh;

    iput-object v4, p0, Luxj;->e:Ldxh;

    iput-object v5, p0, Luxj;->f:Lixh;

    iput-object p1, p0, Luxj;->g:Ly7h;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_48

    instance-of v0, p1, Luxj;

    if-eqz v0, :cond_46

    check-cast p1, Luxj;

    iget-object v0, p0, Luxj;->a:Lixh;

    iget-object v1, p1, Luxj;->a:Lixh;

    invoke-virtual {v0, v1}, Lixh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    iget-boolean v0, p0, Luxj;->b:Z

    iget-boolean v1, p1, Luxj;->b:Z

    if-ne v0, v1, :cond_46

    iget v0, p0, Luxj;->c:I

    iget v1, p1, Luxj;->c:I

    if-ne v0, v1, :cond_46

    iget-object v0, p0, Luxj;->d:Ldxh;

    iget-object v1, p1, Luxj;->d:Ldxh;

    invoke-virtual {v0, v1}, Ldxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    iget-object v0, p0, Luxj;->e:Ldxh;

    iget-object v1, p1, Luxj;->e:Ldxh;

    invoke-virtual {v0, v1}, Ldxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    iget-object v0, p0, Luxj;->f:Lixh;

    iget-object v1, p1, Luxj;->f:Lixh;

    invoke-virtual {v0, v1}, Lixh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    iget-object p0, p0, Luxj;->g:Ly7h;

    iget-object p1, p1, Luxj;->g:Ly7h;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_48

    :cond_46
    const/4 p0, 0x0

    return p0

    :cond_48
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Luxj;->a:Lixh;

    iget v0, v0, Lixh;->d:F

    invoke-static {v0}, Ljava/lang/Float;->hashCode(F)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Luxj;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget v2, p0, Luxj;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Luxj;->d:Ldxh;

    iget v2, v2, Ldxh;->a:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Luxj;->e:Ldxh;

    iget v2, v2, Ldxh;->a:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Luxj;->f:Lixh;

    iget v2, v2, Lixh;->d:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget-object p0, p0, Luxj;->g:Ly7h;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
