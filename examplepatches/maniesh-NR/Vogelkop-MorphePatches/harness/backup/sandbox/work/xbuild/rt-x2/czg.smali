.class public final Lczg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lign;

.field public final b:Lsj;

.field public final c:Ltyl;

.field public final d:Lj7j;

.field public final e:Lcgh;

.field public final f:I

.field public final g:Z

.field public final h:Lkfo;


# direct methods
.method public constructor <init>(Lign;Lsj;Ltyl;Lj7j;Lcgh;IZLkfo;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lczg;->a:Lign;

    iput-object p2, p0, Lczg;->b:Lsj;

    iput-object p3, p0, Lczg;->c:Ltyl;

    iput-object p4, p0, Lczg;->d:Lj7j;

    iput-object p5, p0, Lczg;->e:Lcgh;

    iput p6, p0, Lczg;->f:I

    iput-boolean p7, p0, Lczg;->g:Z

    iput-object p8, p0, Lczg;->h:Lkfo;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_4e

    instance-of v0, p1, Lczg;

    if-eqz v0, :cond_4c

    check-cast p1, Lczg;

    iget-object v0, p0, Lczg;->a:Lign;

    iget-object v1, p1, Lczg;->a:Lign;

    invoke-virtual {v0, v1}, Lign;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lczg;->b:Lsj;

    iget-object v1, p1, Lczg;->b:Lsj;

    invoke-virtual {v0, v1}, Lsj;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lczg;->c:Ltyl;

    iget-object v1, p1, Lczg;->c:Ltyl;

    invoke-virtual {v0, v1}, Ltyl;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lczg;->d:Lj7j;

    iget-object v1, p1, Lczg;->d:Lj7j;

    if-ne v0, v1, :cond_4c

    iget-object v0, p0, Lczg;->e:Lcgh;

    iget-object v1, p1, Lczg;->e:Lcgh;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget v0, p0, Lczg;->f:I

    iget v1, p1, Lczg;->f:I

    if-ne v0, v1, :cond_4c

    iget-boolean v0, p0, Lczg;->g:Z

    iget-boolean v1, p1, Lczg;->g:Z

    if-ne v0, v1, :cond_4c

    iget-object p0, p0, Lczg;->h:Lkfo;

    iget-object p1, p1, Lczg;->h:Lkfo;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4e

    :cond_4c
    const/4 p0, 0x0

    return p0

    :cond_4e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lczg;->a:Lign;

    invoke-virtual {v0}, Lign;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lczg;->b:Lsj;

    invoke-virtual {v2}, Lsj;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lczg;->c:Ltyl;

    invoke-virtual {v0}, Ltyl;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lczg;->d:Lj7j;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lczg;->e:Lcgh;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget v2, p0, Lczg;->f:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean v2, p0, Lczg;->g:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Lczg;->h:Lkfo;

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
