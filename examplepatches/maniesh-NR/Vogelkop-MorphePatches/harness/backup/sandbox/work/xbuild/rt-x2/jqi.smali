.class public final Ljqi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Ljava/util/Set;

.field public final k:Ljava/lang/String;

.field public final l:J

.field public final m:I

.field public final n:Ljava/util/List;

.field public final o:Ljava/lang/String;

.field public final p:Ljava/lang/String;

.field public final q:Ljava/lang/String;

.field public final r:Ljava/lang/String;

.field public final s:Ljava/lang/String;

.field public final t:Ljava/lang/String;

.field public final u:Ljava/lang/Boolean;

.field public final v:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;Ljava/lang/String;JILjava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .registers 24

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljqi;->a:Ljava/lang/String;

    iput-object p2, p0, Ljqi;->b:Ljava/lang/String;

    iput-object p3, p0, Ljqi;->c:Ljava/lang/String;

    iput-object p4, p0, Ljqi;->d:Ljava/lang/String;

    iput-object p5, p0, Ljqi;->e:Ljava/lang/String;

    iput-object p6, p0, Ljqi;->f:Ljava/lang/String;

    iput-object p7, p0, Ljqi;->g:Ljava/lang/String;

    iput-object p8, p0, Ljqi;->h:Ljava/lang/String;

    iput-object p9, p0, Ljqi;->i:Ljava/lang/String;

    iput-object p10, p0, Ljqi;->j:Ljava/util/Set;

    iput-object p11, p0, Ljqi;->k:Ljava/lang/String;

    iput-wide p12, p0, Ljqi;->l:J

    iput p14, p0, Ljqi;->m:I

    iput-object p15, p0, Ljqi;->n:Ljava/util/List;

    move-object/from16 p1, p16

    iput-object p1, p0, Ljqi;->o:Ljava/lang/String;

    move-object/from16 p1, p17

    iput-object p1, p0, Ljqi;->p:Ljava/lang/String;

    move-object/from16 p1, p18

    iput-object p1, p0, Ljqi;->q:Ljava/lang/String;

    move-object/from16 p1, p19

    iput-object p1, p0, Ljqi;->r:Ljava/lang/String;

    move-object/from16 p1, p20

    iput-object p1, p0, Ljqi;->s:Ljava/lang/String;

    move-object/from16 p1, p21

    iput-object p1, p0, Ljqi;->t:Ljava/lang/String;

    move-object/from16 p1, p22

    iput-object p1, p0, Ljqi;->u:Ljava/lang/Boolean;

    move-object/from16 p1, p23

    iput-object p1, p0, Ljqi;->v:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 11

    sget-object v0, Lf8a;->h:Lf8a;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Ljqi;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Ljqi;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "opera_combined"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Ljqi;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Ljqi;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Ljqi;->f:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Ljqi;->g:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Ljqi;->i:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Ljqi;->j:Ljava/util/Set;

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->b0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Ljava/lang/Iterable;

    const/4 v8, 0x0

    const/16 v9, 0x3e

    const-string v4, ","

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v3 .. v9}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Ljqi;->o:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x1

    new-array v3, v2, [C

    const/4 v4, 0x0

    const/16 v5, 0x2e

    aput-char v5, v3, v4

    iget-object v5, p0, Ljqi;->q:Ljava/lang/String;

    invoke-static {v5, v3}, Lkotlin/text/StringsKt;->X(Ljava/lang/CharSequence;[C)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    const/4 v7, 0x2

    if-le v6, v7, :cond_7f

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :cond_7f
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Ljqi;->s:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Ljqi;->t:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Ljqi;->u:Ljava/lang/Boolean;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Ljqi;->v:Ljava/lang/Integer;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lf8a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_e0

    instance-of v0, p1, Ljqi;

    if-eqz v0, :cond_de

    check-cast p1, Ljqi;

    iget-object v0, p0, Ljqi;->a:Ljava/lang/String;

    iget-object v1, p1, Ljqi;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->b:Ljava/lang/String;

    iget-object v1, p1, Ljqi;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->c:Ljava/lang/String;

    iget-object v1, p1, Ljqi;->c:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->d:Ljava/lang/String;

    iget-object v1, p1, Ljqi;->d:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->e:Ljava/lang/String;

    iget-object v1, p1, Ljqi;->e:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->f:Ljava/lang/String;

    iget-object v1, p1, Ljqi;->f:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->g:Ljava/lang/String;

    iget-object v1, p1, Ljqi;->g:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->h:Ljava/lang/String;

    iget-object v1, p1, Ljqi;->h:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->i:Ljava/lang/String;

    iget-object v1, p1, Ljqi;->i:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->j:Ljava/util/Set;

    iget-object v1, p1, Ljqi;->j:Ljava/util/Set;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->k:Ljava/lang/String;

    iget-object v1, p1, Ljqi;->k:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-wide v0, p0, Ljqi;->l:J

    iget-wide v2, p1, Ljqi;->l:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_de

    iget v0, p0, Ljqi;->m:I

    iget v1, p1, Ljqi;->m:I

    if-ne v0, v1, :cond_de

    iget-object v0, p0, Ljqi;->n:Ljava/util/List;

    iget-object v1, p1, Ljqi;->n:Ljava/util/List;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->o:Ljava/lang/String;

    iget-object v1, p1, Ljqi;->o:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->p:Ljava/lang/String;

    iget-object v1, p1, Ljqi;->p:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->q:Ljava/lang/String;

    iget-object v1, p1, Ljqi;->q:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->r:Ljava/lang/String;

    iget-object v1, p1, Ljqi;->r:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->s:Ljava/lang/String;

    iget-object v1, p1, Ljqi;->s:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->t:Ljava/lang/String;

    iget-object v1, p1, Ljqi;->t:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object v0, p0, Ljqi;->u:Ljava/lang/Boolean;

    iget-object v1, p1, Ljqi;->u:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_de

    iget-object p0, p0, Ljqi;->v:Ljava/lang/Integer;

    iget-object p1, p1, Ljqi;->v:Ljava/lang/Integer;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e0

    :cond_de
    const/4 p0, 0x0

    return p0

    :cond_e0
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 6

    const/4 v0, 0x0

    iget-object v1, p0, Ljqi;->a:Ljava/lang/String;

    if-nez v1, :cond_7

    move v1, v0

    goto :goto_b

    :cond_7
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_b
    const/16 v2, 0x1f

    mul-int/2addr v1, v2

    iget-object v3, p0, Ljqi;->b:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lz1m;->f(IILjava/lang/String;)I

    move-result v1

    iget-object v3, p0, Ljqi;->c:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    add-int/2addr v3, v1

    mul-int/2addr v3, v2

    const v1, 0x1022d5f1

    add-int/2addr v3, v1

    mul-int/2addr v3, v2

    iget-object v1, p0, Ljqi;->d:Ljava/lang/String;

    invoke-static {v3, v2, v1}, Lz1m;->f(IILjava/lang/String;)I

    move-result v1

    iget-object v3, p0, Ljqi;->e:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lz1m;->f(IILjava/lang/String;)I

    move-result v1

    iget-object v3, p0, Ljqi;->f:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lz1m;->f(IILjava/lang/String;)I

    move-result v1

    iget-object v3, p0, Ljqi;->g:Ljava/lang/String;

    if-nez v3, :cond_39

    move v3, v0

    goto :goto_3d

    :cond_39
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_3d
    add-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Ljqi;->h:Ljava/lang/String;

    if-nez v3, :cond_45

    move v3, v0

    goto :goto_49

    :cond_45
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_49
    add-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Ljqi;->i:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lz1m;->f(IILjava/lang/String;)I

    move-result v1

    iget-object v3, p0, Ljqi;->j:Ljava/util/Set;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int/2addr v3, v1

    mul-int/2addr v3, v2

    iget-object v1, p0, Ljqi;->k:Ljava/lang/String;

    invoke-static {v3, v2, v1}, Lz1m;->f(IILjava/lang/String;)I

    move-result v1

    iget-wide v3, p0, Ljqi;->l:J

    invoke-static {v1, v2, v3, v4}, Lz1m;->e(IIJ)I

    move-result v1

    iget v3, p0, Ljqi;->m:I

    invoke-static {v3, v1, v2}, Lrfp;->c(III)I

    move-result v1

    iget-object v3, p0, Ljqi;->n:Ljava/util/List;

    invoke-static {v1, v2, v3}, Lrfp;->f(IILjava/util/List;)I

    move-result v1

    iget-object v3, p0, Ljqi;->o:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lz1m;->f(IILjava/lang/String;)I

    move-result v1

    iget-object v3, p0, Ljqi;->p:Ljava/lang/String;

    if-nez v3, :cond_7d

    move v3, v0

    goto :goto_81

    :cond_7d
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_81
    add-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Ljqi;->q:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lz1m;->f(IILjava/lang/String;)I

    move-result v1

    iget-object v3, p0, Ljqi;->r:Ljava/lang/String;

    if-nez v3, :cond_8f

    move v3, v0

    goto :goto_93

    :cond_8f
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_93
    add-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Ljqi;->s:Ljava/lang/String;

    if-nez v3, :cond_9b

    move v3, v0

    goto :goto_9f

    :cond_9b
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_9f
    add-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Ljqi;->t:Ljava/lang/String;

    if-nez v3, :cond_a7

    move v3, v0

    goto :goto_ab

    :cond_a7
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_ab
    add-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Ljqi;->u:Ljava/lang/Boolean;

    if-nez v3, :cond_b3

    move v3, v0

    goto :goto_b7

    :cond_b3
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_b7
    add-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object p0, p0, Ljqi;->v:Ljava/lang/Integer;

    if-eqz p0, :cond_c1

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :cond_c1
    add-int/2addr v1, v0

    return v1
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
