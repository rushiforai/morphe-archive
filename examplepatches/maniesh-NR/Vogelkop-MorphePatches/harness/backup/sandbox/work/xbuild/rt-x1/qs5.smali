.class public final Lqs5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Z

.field public final k:Lsqh;

.field public final l:I

.field public final m:I

.field public final n:Ljava/lang/String;

.field public final o:I

.field public final p:I

.field public final q:I

.field public final r:I

.field public final s:Z

.field public final t:Z

.field public final u:Z


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLsqh;IILjava/lang/String;IIII)V
    .registers 19

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lqs5;->a:I

    iput-object p2, p0, Lqs5;->b:Ljava/lang/String;

    iput-object p3, p0, Lqs5;->c:Ljava/lang/String;

    iput-object p4, p0, Lqs5;->d:Ljava/lang/String;

    iput-object p5, p0, Lqs5;->e:Ljava/lang/String;

    iput-object p6, p0, Lqs5;->f:Ljava/lang/String;

    iput-object p7, p0, Lqs5;->g:Ljava/lang/String;

    iput-object p8, p0, Lqs5;->h:Ljava/lang/String;

    iput-object p9, p0, Lqs5;->i:Ljava/lang/String;

    iput-boolean p10, p0, Lqs5;->j:Z

    iput-object p11, p0, Lqs5;->k:Lsqh;

    iput p12, p0, Lqs5;->l:I

    iput p13, p0, Lqs5;->m:I

    move-object p3, p14

    iput-object p3, p0, Lqs5;->n:Ljava/lang/String;

    move p3, p15

    iput p3, p0, Lqs5;->o:I

    move/from16 p3, p16

    iput p3, p0, Lqs5;->p:I

    move/from16 p3, p17

    iput p3, p0, Lqs5;->q:I

    move/from16 p3, p18

    iput p3, p0, Lqs5;->r:I

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    const/4 p3, 0x1

    xor-int/2addr p2, p3

    iput-boolean p2, p0, Lqs5;->s:Z

    const/4 p2, 0x0

    if-ne p1, p3, :cond_3c

    move p4, p3

    goto :goto_3d

    :cond_3c
    move p4, p2

    :goto_3d
    iput-boolean p4, p0, Lqs5;->t:Z

    const/4 p4, 0x2

    if-eq p1, p4, :cond_43

    move p3, p2

    :cond_43
    iput-boolean p3, p0, Lqs5;->u:Z

    new-instance p0, Landroid/graphics/Point;

    invoke-direct {p0, p12, p13}, Landroid/graphics/Point;-><init>(II)V

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lqs5;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lqs5;

    iget v1, p0, Lqs5;->a:I

    iget v3, p1, Lqs5;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Lqs5;->b:Ljava/lang/String;

    iget-object v3, p1, Lqs5;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v2

    :cond_1e
    iget-object v1, p0, Lqs5;->c:Ljava/lang/String;

    iget-object v3, p1, Lqs5;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_29

    return v2

    :cond_29
    iget-object v1, p0, Lqs5;->d:Ljava/lang/String;

    iget-object v3, p1, Lqs5;->d:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_34

    return v2

    :cond_34
    iget-object v1, p0, Lqs5;->e:Ljava/lang/String;

    iget-object v3, p1, Lqs5;->e:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3f

    return v2

    :cond_3f
    iget-object v1, p0, Lqs5;->f:Ljava/lang/String;

    iget-object v3, p1, Lqs5;->f:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4a

    return v2

    :cond_4a
    iget-object v1, p0, Lqs5;->g:Ljava/lang/String;

    iget-object v3, p1, Lqs5;->g:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_55

    return v2

    :cond_55
    iget-object v1, p0, Lqs5;->h:Ljava/lang/String;

    iget-object v3, p1, Lqs5;->h:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_60

    return v2

    :cond_60
    iget-object v1, p0, Lqs5;->i:Ljava/lang/String;

    iget-object v3, p1, Lqs5;->i:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6b

    return v2

    :cond_6b
    iget-boolean v1, p0, Lqs5;->j:Z

    iget-boolean v3, p1, Lqs5;->j:Z

    if-eq v1, v3, :cond_72

    return v2

    :cond_72
    iget-object v1, p0, Lqs5;->k:Lsqh;

    iget-object v3, p1, Lqs5;->k:Lsqh;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7d

    return v2

    :cond_7d
    iget v1, p0, Lqs5;->l:I

    iget v3, p1, Lqs5;->l:I

    if-eq v1, v3, :cond_84

    return v2

    :cond_84
    iget v1, p0, Lqs5;->m:I

    iget v3, p1, Lqs5;->m:I

    if-eq v1, v3, :cond_8b

    return v2

    :cond_8b
    iget-object v1, p0, Lqs5;->n:Ljava/lang/String;

    iget-object v3, p1, Lqs5;->n:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_96

    return v2

    :cond_96
    iget v1, p0, Lqs5;->o:I

    iget v3, p1, Lqs5;->o:I

    if-eq v1, v3, :cond_9d

    return v2

    :cond_9d
    iget v1, p0, Lqs5;->p:I

    iget v3, p1, Lqs5;->p:I

    if-eq v1, v3, :cond_a4

    return v2

    :cond_a4
    iget v1, p0, Lqs5;->q:I

    iget v3, p1, Lqs5;->q:I

    if-eq v1, v3, :cond_ab

    return v2

    :cond_ab
    iget p0, p0, Lqs5;->r:I

    iget p1, p1, Lqs5;->r:I

    if-eq p0, p1, :cond_b2

    return v2

    :cond_b2
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lqs5;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lqs5;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lqs5;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lqs5;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lqs5;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lqs5;->f:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lqs5;->g:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lqs5;->h:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lqs5;->i:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-boolean v2, p0, Lqs5;->j:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Lqs5;->k:Lsqh;

    if-nez v2, :cond_45

    const/4 v2, 0x0

    goto :goto_49

    :cond_45
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_49
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget v2, p0, Lqs5;->l:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lqs5;->m:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Lqs5;->n:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget v2, p0, Lqs5;->o:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lqs5;->p:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lqs5;->q:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Lqs5;->r:I

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
