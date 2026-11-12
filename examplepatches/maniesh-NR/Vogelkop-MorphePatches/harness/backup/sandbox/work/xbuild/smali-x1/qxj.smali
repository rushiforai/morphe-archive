.class public final Lqxj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lb8h;

.field public final b:Lcxh;

.field public final c:Lcxh;

.field public final d:Lgxh;

.field public final e:Lixh;

.field public final f:Lfxh;

.field public final g:Lfxh;

.field public final h:F


# direct methods
.method public constructor <init>(Lb8h;Lcxh;Lcxh;Lgxh;Lixh;Lfxh;Lfxh;F)V
    .registers 9

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object p1, p0, Lqxj;->a:Lb8h;

    .line 76
    iput-object p2, p0, Lqxj;->b:Lcxh;

    .line 77
    iput-object p3, p0, Lqxj;->c:Lcxh;

    .line 78
    iput-object p4, p0, Lqxj;->d:Lgxh;

    .line 79
    iput-object p5, p0, Lqxj;->e:Lixh;

    .line 80
    iput-object p6, p0, Lqxj;->f:Lfxh;

    .line 81
    iput-object p7, p0, Lqxj;->g:Lfxh;

    .line 82
    iput p8, p0, Lqxj;->h:F

    return-void
.end method

.method public constructor <init>(Llxh;Lgxh;Lcxh;I)V
    .registers 15

    and-int/lit8 v0, p4, 0x1

    if-eqz v0, :cond_c

    new-instance p1, Llxh;

    const v0, 0x7f080573

    invoke-direct {p1, v0}, Llxh;-><init>(I)V

    :cond_c
    move-object v2, p1

    and-int/lit8 p1, p4, 0x2

    if-eqz p1, :cond_19

    new-instance p2, Ldxh;

    const p1, 0x7f040294

    invoke-direct {p2, p1}, Ldxh;-><init>(I)V

    :cond_19
    move-object v3, p2

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_26

    new-instance p3, Ldxh;

    const p1, 0x7f0402bf

    invoke-direct {p3, p1}, Ldxh;-><init>(I)V

    :cond_26
    move-object v4, p3

    new-instance v5, Lgxh;

    const/4 p1, 0x0

    invoke-direct {v5, p1}, Lgxh;-><init>(I)V

    new-instance v6, Lixh;

    const/4 p1, 0x0

    invoke-direct {v6, p1}, Lixh;-><init>(F)V

    new-instance v7, Lfxh;

    const p1, 0x7f061092

    invoke-direct {v7, p1}, Lfxh;-><init>(I)V

    new-instance v8, Lfxh;

    const p1, 0x7f0600b6

    invoke-direct {v8, p1}, Lfxh;-><init>(I)V

    const/high16 v9, 0x3f800000    # 1.0f

    move-object v1, p0

    invoke-direct/range {v1 .. v9}, Lqxj;-><init>(Lb8h;Lcxh;Lcxh;Lgxh;Lixh;Lfxh;Lfxh;F)V

    return-void
.end method

.method public static a(Lqxj;F)Lqxj;
    .registers 11

    iget-object v1, p0, Lqxj;->a:Lb8h;

    iget-object v2, p0, Lqxj;->b:Lcxh;

    iget-object v3, p0, Lqxj;->c:Lcxh;

    iget-object v4, p0, Lqxj;->d:Lgxh;

    iget-object v5, p0, Lqxj;->e:Lixh;

    iget-object v6, p0, Lqxj;->f:Lfxh;

    iget-object v7, p0, Lqxj;->g:Lfxh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lqxj;

    move v8, p1

    invoke-direct/range {v0 .. v8}, Lqxj;-><init>(Lb8h;Lcxh;Lcxh;Lgxh;Lixh;Lfxh;Lfxh;F)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_5a

    instance-of v0, p1, Lqxj;

    if-eqz v0, :cond_58

    check-cast p1, Lqxj;

    iget-object v0, p0, Lqxj;->a:Lb8h;

    iget-object v1, p1, Lqxj;->a:Lb8h;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Lqxj;->b:Lcxh;

    iget-object v1, p1, Lqxj;->b:Lcxh;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Lqxj;->c:Lcxh;

    iget-object v1, p1, Lqxj;->c:Lcxh;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Lqxj;->d:Lgxh;

    iget-object v1, p1, Lqxj;->d:Lgxh;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Lqxj;->e:Lixh;

    iget-object v1, p1, Lqxj;->e:Lixh;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Lqxj;->f:Lfxh;

    iget-object v1, p1, Lqxj;->f:Lfxh;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Lqxj;->g:Lfxh;

    iget-object v1, p1, Lqxj;->g:Lfxh;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget p0, p0, Lqxj;->h:F

    iget p1, p1, Lqxj;->h:F

    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    if-eqz p0, :cond_5a

    :cond_58
    const/4 p0, 0x0

    return p0

    :cond_5a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lqxj;->a:Lb8h;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lqxj;->b:Lcxh;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lqxj;->c:Lcxh;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lqxj;->d:Lgxh;

    iget v2, v2, Lgxh;->a:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Lqxj;->e:Lixh;

    iget v2, v2, Lixh;->d:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget-object v2, p0, Lqxj;->f:Lfxh;

    invoke-virtual {v2}, Lfxh;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lqxj;->g:Lfxh;

    invoke-virtual {v0}, Lfxh;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget p0, p0, Lqxj;->h:F

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
