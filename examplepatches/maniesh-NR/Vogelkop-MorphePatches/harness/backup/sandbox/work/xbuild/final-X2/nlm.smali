.class public final Lnlm;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Lr22;

.field public final c:Ljava/util/Set;

.field public final d:Lpxh;

.field public final e:Z

.field public final f:Lrxh;

.field public final g:Z

.field public final h:Z

.field public final i:Z


# direct methods
.method public constructor <init>(ZLr22;Ljava/util/Set;Lpxh;ZLrxh;ZZZ)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lnlm;->a:Z

    iput-object p2, p0, Lnlm;->b:Lr22;

    iput-object p3, p0, Lnlm;->c:Ljava/util/Set;

    iput-object p4, p0, Lnlm;->d:Lpxh;

    iput-boolean p5, p0, Lnlm;->e:Z

    iput-object p6, p0, Lnlm;->f:Lrxh;

    iput-boolean p7, p0, Lnlm;->g:Z

    iput-boolean p8, p0, Lnlm;->h:Z

    iput-boolean p9, p0, Lnlm;->i:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_50

    instance-of v0, p1, Lnlm;

    if-eqz v0, :cond_4e

    check-cast p1, Lnlm;

    iget-boolean v0, p0, Lnlm;->a:Z

    iget-boolean v1, p1, Lnlm;->a:Z

    if-ne v0, v1, :cond_4e

    iget-object v0, p0, Lnlm;->b:Lr22;

    iget-object v1, p1, Lnlm;->b:Lr22;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lnlm;->c:Ljava/util/Set;

    iget-object v1, p1, Lnlm;->c:Ljava/util/Set;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lnlm;->d:Lpxh;

    iget-object v1, p1, Lnlm;->d:Lpxh;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-boolean v0, p0, Lnlm;->e:Z

    iget-boolean v1, p1, Lnlm;->e:Z

    if-ne v0, v1, :cond_4e

    iget-object v0, p0, Lnlm;->f:Lrxh;

    iget-object v1, p1, Lnlm;->f:Lrxh;

    invoke-virtual {v0, v1}, Lrxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-boolean v0, p0, Lnlm;->g:Z

    iget-boolean v1, p1, Lnlm;->g:Z

    if-ne v0, v1, :cond_4e

    iget-boolean v0, p0, Lnlm;->h:Z

    iget-boolean v1, p1, Lnlm;->h:Z

    if-ne v0, v1, :cond_4e

    iget-boolean p0, p0, Lnlm;->i:Z

    iget-boolean p1, p1, Lnlm;->i:Z

    if-eq p0, p1, :cond_50

    :cond_4e
    const/4 p0, 0x0

    return p0

    :cond_50
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Lnlm;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lnlm;->b:Lr22;

    if-nez v2, :cond_f

    const/4 v2, 0x0

    goto :goto_13

    :cond_f
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_13
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lnlm;->c:Ljava/util/Set;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lnlm;->d:Lpxh;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lnlm;->e:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Lnlm;->f:Lrxh;

    iget v2, v2, Lrxh;->a:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean v2, p0, Lnlm;->g:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lnlm;->h:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lnlm;->i:Z

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
