.class public final Ld5g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Lu3g;

.field public final c:Z

.field public final d:Z

.field public final e:Z

.field public final f:Z

.field public final g:Z

.field public final h:I

.field public final i:I

.field public final j:I

.field public final k:I


# direct methods
.method public constructor <init>(Ljava/util/List;Lu3g;ZZZZZ)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld5g;->a:Ljava/util/List;

    iput-object p2, p0, Ld5g;->b:Lu3g;

    iput-boolean p3, p0, Ld5g;->c:Z

    iput-boolean p4, p0, Ld5g;->d:Z

    iput-boolean p5, p0, Ld5g;->e:Z

    iput-boolean p6, p0, Ld5g;->f:Z

    iput-boolean p7, p0, Ld5g;->g:Z

    const/4 p2, -0x1

    const/4 p6, 0x0

    if-eqz p3, :cond_1d

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p7

    if-eqz p7, :cond_1d

    move p7, p6

    goto :goto_1e

    :cond_1d
    move p7, p2

    :goto_1e
    iput p7, p0, Ld5g;->h:I

    move-object p7, p1

    check-cast p7, Ljava/util/Collection;

    invoke-interface {p7}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2d

    if-eqz p4, :cond_2d

    move v0, p6

    goto :goto_2e

    :cond_2d
    move v0, p2

    :goto_2e
    iput v0, p0, Ld5g;->i:I

    invoke-interface {p7}, Ljava/util/Collection;->isEmpty()Z

    move-result p7

    if-nez p7, :cond_39

    if-eqz p5, :cond_39

    move p2, p6

    :cond_39
    iput p2, p0, Ld5g;->j:I

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p2

    const/4 p7, 0x1

    if-eqz p2, :cond_44

    if-nez p3, :cond_4f

    :cond_44
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-nez p4, :cond_4c

    if-eqz p5, :cond_4d

    :cond_4c
    move p6, p7

    :cond_4d
    add-int p7, p1, p6

    :cond_4f
    iput p7, p0, Ld5g;->k:I

    return-void
.end method


# virtual methods
.method public final a(I)Lw3g;
    .registers 3

    iget-boolean v0, p0, Ld5g;->d:Z

    if-nez v0, :cond_a

    iget-boolean v0, p0, Ld5g;->e:Z

    if-nez v0, :cond_a

    const/4 v0, 0x0

    goto :goto_b

    :cond_a
    const/4 v0, 0x1

    :goto_b
    sub-int/2addr p1, v0

    iget-object p0, p0, Ld5g;->a:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lw3g;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_38

    instance-of v0, p1, Ld5g;

    if-eqz v0, :cond_36

    check-cast p1, Ld5g;

    iget-object v0, p0, Ld5g;->a:Ljava/util/List;

    iget-object v1, p1, Ld5g;->a:Ljava/util/List;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object v0, p0, Ld5g;->b:Lu3g;

    iget-object v1, p1, Ld5g;->b:Lu3g;

    if-ne v0, v1, :cond_36

    iget-boolean v0, p0, Ld5g;->c:Z

    iget-boolean v1, p1, Ld5g;->c:Z

    if-ne v0, v1, :cond_36

    iget-boolean v0, p0, Ld5g;->d:Z

    iget-boolean v1, p1, Ld5g;->d:Z

    if-ne v0, v1, :cond_36

    iget-boolean v0, p0, Ld5g;->e:Z

    iget-boolean v1, p1, Ld5g;->e:Z

    if-ne v0, v1, :cond_36

    iget-boolean v0, p0, Ld5g;->f:Z

    iget-boolean v1, p1, Ld5g;->f:Z

    if-ne v0, v1, :cond_36

    iget-boolean p0, p0, Ld5g;->g:Z

    iget-boolean p1, p1, Ld5g;->g:Z

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

    iget-object v0, p0, Ld5g;->a:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Ld5g;->b:Lu3g;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Ld5g;->c:Z

    invoke-static {v2, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Ld5g;->d:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Ld5g;->e:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Ld5g;->f:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Ld5g;->g:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
