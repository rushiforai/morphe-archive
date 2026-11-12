.class public final Legn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Luvg;

.field public final b:B

.field public final c:Z

.field public final d:Z

.field public final e:Z

.field public final f:Z

.field public final g:Z

.field public final h:Lnfn;

.field public final i:Ldgh;

.field public final j:Z


# direct methods
.method public constructor <init>(Luvg;IZZZZZLnfn;Ldgh;Z)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Legn;->a:Luvg;

    iput-byte p2, p0, Legn;->b:B

    iput-boolean p3, p0, Legn;->c:Z

    iput-boolean p4, p0, Legn;->d:Z

    iput-boolean p5, p0, Legn;->e:Z

    iput-boolean p6, p0, Legn;->f:Z

    iput-boolean p7, p0, Legn;->g:Z

    iput-object p8, p0, Legn;->h:Lnfn;

    iput-object p9, p0, Legn;->i:Ldgh;

    iput-boolean p10, p0, Legn;->j:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_4e

    instance-of v0, p1, Legn;

    if-eqz v0, :cond_4c

    check-cast p1, Legn;

    iget-object v0, p0, Legn;->a:Luvg;

    iget-object v1, p1, Legn;->a:Luvg;

    if-ne v0, v1, :cond_4c

    iget-byte v0, p0, Legn;->b:B

    iget-byte v1, p1, Legn;->b:B

    if-ne v0, v1, :cond_4c

    iget-boolean v0, p0, Legn;->c:Z

    iget-boolean v1, p1, Legn;->c:Z

    if-ne v0, v1, :cond_4c

    iget-boolean v0, p0, Legn;->d:Z

    iget-boolean v1, p1, Legn;->d:Z

    if-ne v0, v1, :cond_4c

    iget-boolean v0, p0, Legn;->e:Z

    iget-boolean v1, p1, Legn;->e:Z

    if-ne v0, v1, :cond_4c

    iget-boolean v0, p0, Legn;->f:Z

    iget-boolean v1, p1, Legn;->f:Z

    if-ne v0, v1, :cond_4c

    iget-boolean v0, p0, Legn;->g:Z

    iget-boolean v1, p1, Legn;->g:Z

    if-ne v0, v1, :cond_4c

    iget-object v0, p0, Legn;->h:Lnfn;

    iget-object v1, p1, Legn;->h:Lnfn;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Legn;->i:Ldgh;

    iget-object v1, p1, Legn;->i:Ldgh;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-boolean p0, p0, Legn;->j:Z

    iget-boolean p1, p1, Legn;->j:Z

    if-eq p0, p1, :cond_4e

    :cond_4c
    const/4 p0, 0x0

    return p0

    :cond_4e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Legn;->a:Luvg;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-byte v2, p0, Legn;->b:B

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean v2, p0, Legn;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Legn;->d:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Legn;->e:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Legn;->f:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Legn;->g:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    const/4 v2, 0x0

    iget-object v3, p0, Legn;->h:Lnfn;

    if-nez v3, :cond_34

    move v3, v2

    goto :goto_38

    :cond_34
    invoke-virtual {v3}, Lnfn;->hashCode()I

    move-result v3

    :goto_38
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Legn;->i:Ldgh;

    if-eqz v3, :cond_42

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :cond_42
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-boolean p0, p0, Legn;->j:Z

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
