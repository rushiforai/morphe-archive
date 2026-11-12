.class public final Lkp3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lno3;

.field public final b:Z

.field public final c:Z

.field public final d:Z

.field public final e:Z

.field public final f:Z


# direct methods
.method public constructor <init>(Lno3;ZZZZZ)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkp3;->a:Lno3;

    iput-boolean p2, p0, Lkp3;->b:Z

    iput-boolean p3, p0, Lkp3;->c:Z

    iput-boolean p4, p0, Lkp3;->d:Z

    iput-boolean p5, p0, Lkp3;->e:Z

    iput-boolean p6, p0, Lkp3;->f:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_32

    instance-of v0, p1, Lkp3;

    if-eqz v0, :cond_30

    check-cast p1, Lkp3;

    iget-object v0, p0, Lkp3;->a:Lno3;

    iget-object v1, p1, Lkp3;->a:Lno3;

    invoke-virtual {v0, v1}, Lno3;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-boolean v0, p0, Lkp3;->b:Z

    iget-boolean v1, p1, Lkp3;->b:Z

    if-ne v0, v1, :cond_30

    iget-boolean v0, p0, Lkp3;->c:Z

    iget-boolean v1, p1, Lkp3;->c:Z

    if-ne v0, v1, :cond_30

    iget-boolean v0, p0, Lkp3;->d:Z

    iget-boolean v1, p1, Lkp3;->d:Z

    if-ne v0, v1, :cond_30

    iget-boolean v0, p0, Lkp3;->e:Z

    iget-boolean v1, p1, Lkp3;->e:Z

    if-ne v0, v1, :cond_30

    iget-boolean p0, p0, Lkp3;->f:Z

    iget-boolean p1, p1, Lkp3;->f:Z

    if-eq p0, p1, :cond_32

    :cond_30
    const/4 p0, 0x0

    return p0

    :cond_32
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lkp3;->a:Lno3;

    invoke-virtual {v0}, Lno3;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lkp3;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lkp3;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lkp3;->d:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lkp3;->e:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lkp3;->f:Z

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
