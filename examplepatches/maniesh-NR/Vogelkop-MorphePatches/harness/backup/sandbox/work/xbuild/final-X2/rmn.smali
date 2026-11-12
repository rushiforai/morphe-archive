.class public final Lrmn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lqjn;

.field public final b:Llkn;

.field public final c:Llkn;

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:Likn;

.field public final i:Z

.field public final j:Z

.field public final k:Z

.field public final l:Z


# direct methods
.method public constructor <init>(Lqjn;Llkn;Llkn;IIIILikn;ZZZZ)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrmn;->a:Lqjn;

    iput-object p2, p0, Lrmn;->b:Llkn;

    iput-object p3, p0, Lrmn;->c:Llkn;

    iput p4, p0, Lrmn;->d:I

    iput p5, p0, Lrmn;->e:I

    iput p6, p0, Lrmn;->f:I

    iput p7, p0, Lrmn;->g:I

    iput-object p8, p0, Lrmn;->h:Likn;

    iput-boolean p9, p0, Lrmn;->i:Z

    iput-boolean p10, p0, Lrmn;->j:Z

    iput-boolean p11, p0, Lrmn;->k:Z

    iput-boolean p12, p0, Lrmn;->l:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_62

    instance-of v0, p1, Lrmn;

    if-eqz v0, :cond_60

    check-cast p1, Lrmn;

    iget-object v0, p0, Lrmn;->a:Lqjn;

    iget-object v1, p1, Lrmn;->a:Lqjn;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_60

    iget-object v0, p0, Lrmn;->b:Llkn;

    iget-object v1, p1, Lrmn;->b:Llkn;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_60

    iget-object v0, p0, Lrmn;->c:Llkn;

    iget-object v1, p1, Lrmn;->c:Llkn;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_60

    iget v0, p0, Lrmn;->d:I

    iget v1, p1, Lrmn;->d:I

    if-ne v0, v1, :cond_60

    iget v0, p0, Lrmn;->e:I

    iget v1, p1, Lrmn;->e:I

    if-ne v0, v1, :cond_60

    iget v0, p0, Lrmn;->f:I

    iget v1, p1, Lrmn;->f:I

    if-ne v0, v1, :cond_60

    iget v0, p0, Lrmn;->g:I

    iget v1, p1, Lrmn;->g:I

    if-ne v0, v1, :cond_60

    iget-object v0, p0, Lrmn;->h:Likn;

    iget-object v1, p1, Lrmn;->h:Likn;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_60

    iget-boolean v0, p0, Lrmn;->i:Z

    iget-boolean v1, p1, Lrmn;->i:Z

    if-ne v0, v1, :cond_60

    iget-boolean v0, p0, Lrmn;->j:Z

    iget-boolean v1, p1, Lrmn;->j:Z

    if-ne v0, v1, :cond_60

    iget-boolean v0, p0, Lrmn;->k:Z

    iget-boolean v1, p1, Lrmn;->k:Z

    if-ne v0, v1, :cond_60

    iget-boolean p0, p0, Lrmn;->l:Z

    iget-boolean p1, p1, Lrmn;->l:Z

    if-eq p0, p1, :cond_62

    :cond_60
    const/4 p0, 0x0

    return p0

    :cond_62
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lrmn;->a:Lqjn;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lrmn;->b:Llkn;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lrmn;->c:Llkn;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget v2, p0, Lrmn;->d:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lrmn;->e:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lrmn;->f:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lrmn;->g:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Lrmn;->h:Likn;

    if-nez v2, :cond_37

    const/4 v2, 0x0

    goto :goto_3b

    :cond_37
    invoke-virtual {v2}, Likn;->hashCode()I

    move-result v2

    :goto_3b
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lrmn;->i:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lrmn;->j:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lrmn;->k:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lrmn;->l:Z

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
