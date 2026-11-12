.class public final Ltxj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:Landroid/util/Size;

.field public final f:Lixh;

.field public final g:Lcyj;

.field public final h:Ldxh;

.field public final i:Ldxh;

.field public final j:Lixh;

.field public final k:Lixh;

.field public final l:Lixh;


# direct methods
.method public constructor <init>(IIIILandroid/util/Size;Lcyj;)V
    .registers 14

    new-instance v0, Lixh;

    const/high16 v1, 0x41000000    # 8.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    new-instance v2, Ldxh;

    const v3, 0x7f04030b

    invoke-direct {v2, v3}, Ldxh;-><init>(I)V

    new-instance v3, Ldxh;

    const v4, 0x7f040303

    invoke-direct {v3, v4}, Ldxh;-><init>(I)V

    new-instance v4, Lixh;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v4, v5}, Lixh;-><init>(F)V

    new-instance v5, Lixh;

    const/high16 v6, 0x41400000    # 12.0f

    invoke-direct {v5, v6}, Lixh;-><init>(F)V

    new-instance v6, Lixh;

    invoke-direct {v6, v1}, Lixh;-><init>(F)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ltxj;->a:I

    iput p2, p0, Ltxj;->b:I

    iput p3, p0, Ltxj;->c:I

    iput p4, p0, Ltxj;->d:I

    iput-object p5, p0, Ltxj;->e:Landroid/util/Size;

    iput-object v0, p0, Ltxj;->f:Lixh;

    iput-object p6, p0, Ltxj;->g:Lcyj;

    iput-object v2, p0, Ltxj;->h:Ldxh;

    iput-object v3, p0, Ltxj;->i:Ldxh;

    iput-object v4, p0, Ltxj;->j:Lixh;

    iput-object v5, p0, Ltxj;->k:Lixh;

    iput-object v6, p0, Ltxj;->l:Lixh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_72

    instance-of v0, p1, Ltxj;

    if-eqz v0, :cond_70

    check-cast p1, Ltxj;

    iget v0, p0, Ltxj;->a:I

    iget v1, p1, Ltxj;->a:I

    if-ne v0, v1, :cond_70

    iget v0, p0, Ltxj;->b:I

    iget v1, p1, Ltxj;->b:I

    if-ne v0, v1, :cond_70

    iget v0, p0, Ltxj;->c:I

    iget v1, p1, Ltxj;->c:I

    if-ne v0, v1, :cond_70

    iget v0, p0, Ltxj;->d:I

    iget v1, p1, Ltxj;->d:I

    if-ne v0, v1, :cond_70

    iget-object v0, p0, Ltxj;->e:Landroid/util/Size;

    iget-object v1, p1, Ltxj;->e:Landroid/util/Size;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_70

    iget-object v0, p0, Ltxj;->f:Lixh;

    iget-object v1, p1, Ltxj;->f:Lixh;

    invoke-virtual {v0, v1}, Lixh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_70

    iget-object v0, p0, Ltxj;->g:Lcyj;

    iget-object v1, p1, Ltxj;->g:Lcyj;

    invoke-virtual {v0, v1}, Lcyj;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_70

    iget-object v0, p0, Ltxj;->h:Ldxh;

    iget-object v1, p1, Ltxj;->h:Ldxh;

    invoke-virtual {v0, v1}, Ldxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_70

    iget-object v0, p0, Ltxj;->i:Ldxh;

    iget-object v1, p1, Ltxj;->i:Ldxh;

    invoke-virtual {v0, v1}, Ldxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_70

    iget-object v0, p0, Ltxj;->j:Lixh;

    iget-object v1, p1, Ltxj;->j:Lixh;

    invoke-virtual {v0, v1}, Lixh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_70

    iget-object v0, p0, Ltxj;->k:Lixh;

    iget-object v1, p1, Ltxj;->k:Lixh;

    invoke-virtual {v0, v1}, Lixh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_70

    iget-object p0, p0, Ltxj;->l:Lixh;

    iget-object p1, p1, Ltxj;->l:Lixh;

    invoke-virtual {p0, p1}, Lixh;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_72

    :cond_70
    const/4 p0, 0x0

    return p0

    :cond_72
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Ltxj;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Ltxj;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ltxj;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ltxj;->d:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Ltxj;->e:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Ltxj;->f:Lixh;

    iget v0, v0, Lixh;->d:F

    invoke-static {v0, v2, v1}, Lsko;->d(FII)I

    move-result v0

    iget-object v2, p0, Ltxj;->g:Lcyj;

    invoke-virtual {v2}, Lcyj;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Ltxj;->h:Ldxh;

    iget v0, v0, Ldxh;->a:I

    invoke-static {v0, v2, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Ltxj;->i:Ldxh;

    iget v2, v2, Ldxh;->a:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Ltxj;->j:Lixh;

    iget v2, v2, Lixh;->d:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget-object v2, p0, Ltxj;->k:Lixh;

    iget v2, v2, Lixh;->d:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget-object p0, p0, Ltxj;->l:Lixh;

    iget p0, p0, Lixh;->d:F

    invoke-static {p0}, Ljava/lang/Float;->hashCode(F)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
