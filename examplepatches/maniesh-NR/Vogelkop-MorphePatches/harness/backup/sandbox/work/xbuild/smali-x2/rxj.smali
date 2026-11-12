.class public final Lrxj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Ldxh;

.field public final d:Ldxh;

.field public final e:Lixh;


# direct methods
.method public constructor <init>(II)V
    .registers 9

    new-instance v3, Ldxh;

    const v0, 0x7f0402ed

    invoke-direct {v3, v0}, Ldxh;-><init>(I)V

    new-instance v4, Ldxh;

    const v0, 0x7f04021b

    invoke-direct {v4, v0}, Ldxh;-><init>(I)V

    new-instance v5, Lixh;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {v5, v0}, Lixh;-><init>(F)V

    move-object v0, p0

    move v1, p1

    move v2, p2

    invoke-direct/range {v0 .. v5}, Lrxj;-><init>(IILdxh;Ldxh;Lixh;)V

    return-void
.end method

.method public constructor <init>(IILdxh;Ldxh;Lixh;)V
    .registers 6

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput p1, p0, Lrxj;->a:I

    .line 32
    iput p2, p0, Lrxj;->b:I

    .line 33
    iput-object p3, p0, Lrxj;->c:Ldxh;

    .line 34
    iput-object p4, p0, Lrxj;->d:Ldxh;

    .line 35
    iput-object p5, p0, Lrxj;->e:Lixh;

    return-void
.end method

.method public static a(Lrxj;II)Lrxj;
    .registers 9

    iget-object v3, p0, Lrxj;->c:Ldxh;

    iget-object v4, p0, Lrxj;->d:Ldxh;

    iget-object v5, p0, Lrxj;->e:Lixh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lrxj;

    move v1, p1

    move v2, p2

    invoke-direct/range {v0 .. v5}, Lrxj;-><init>(IILdxh;Ldxh;Lixh;)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_34

    instance-of v0, p1, Lrxj;

    if-eqz v0, :cond_32

    check-cast p1, Lrxj;

    iget v0, p0, Lrxj;->a:I

    iget v1, p1, Lrxj;->a:I

    if-ne v0, v1, :cond_32

    iget v0, p0, Lrxj;->b:I

    iget v1, p1, Lrxj;->b:I

    if-ne v0, v1, :cond_32

    iget-object v0, p0, Lrxj;->c:Ldxh;

    iget-object v1, p1, Lrxj;->c:Ldxh;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object v0, p0, Lrxj;->d:Ldxh;

    iget-object v1, p1, Lrxj;->d:Ldxh;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object p0, p0, Lrxj;->e:Lixh;

    iget-object p1, p1, Lrxj;->e:Lixh;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_34

    :cond_32
    const/4 p0, 0x0

    return p0

    :cond_34
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lrxj;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lrxj;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Lrxj;->c:Ldxh;

    iget v2, v2, Ldxh;->a:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Lrxj;->d:Ldxh;

    iget v2, v2, Ldxh;->a:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object p0, p0, Lrxj;->e:Lixh;

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
