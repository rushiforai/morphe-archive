.class public final Lt8k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Ls8k;

.field public final d:Lr8k;

.field public final e:Z

.field public final f:Z

.field public final g:Z


# direct methods
.method public constructor <init>(ZZLs8k;Lr8k;ZZZ)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lt8k;->a:Z

    iput-boolean p2, p0, Lt8k;->b:Z

    iput-object p3, p0, Lt8k;->c:Ls8k;

    iput-object p4, p0, Lt8k;->d:Lr8k;

    iput-boolean p5, p0, Lt8k;->e:Z

    iput-boolean p6, p0, Lt8k;->f:Z

    iput-boolean p7, p0, Lt8k;->g:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_34

    instance-of v0, p1, Lt8k;

    if-eqz v0, :cond_32

    check-cast p1, Lt8k;

    iget-boolean v0, p0, Lt8k;->a:Z

    iget-boolean v1, p1, Lt8k;->a:Z

    if-ne v0, v1, :cond_32

    iget-boolean v0, p0, Lt8k;->b:Z

    iget-boolean v1, p1, Lt8k;->b:Z

    if-ne v0, v1, :cond_32

    iget-object v0, p0, Lt8k;->c:Ls8k;

    iget-object v1, p1, Lt8k;->c:Ls8k;

    if-ne v0, v1, :cond_32

    iget-object v0, p0, Lt8k;->d:Lr8k;

    iget-object v1, p1, Lt8k;->d:Lr8k;

    if-ne v0, v1, :cond_32

    iget-boolean v0, p0, Lt8k;->e:Z

    iget-boolean v1, p1, Lt8k;->e:Z

    if-ne v0, v1, :cond_32

    iget-boolean v0, p0, Lt8k;->f:Z

    iget-boolean v1, p1, Lt8k;->f:Z

    if-ne v0, v1, :cond_32

    iget-boolean p0, p0, Lt8k;->g:Z

    iget-boolean p1, p1, Lt8k;->g:Z

    if-eq p0, p1, :cond_34

    :cond_32
    const/4 p0, 0x0

    return p0

    :cond_34
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    sget-object v0, Lp7j;->c:Lp7j;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const v1, 0x24236f1

    add-int/2addr v0, v1

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    add-int/lit16 v0, v0, 0x4cf

    mul-int/2addr v0, v1

    add-int/lit16 v0, v0, 0x4cf

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lt8k;->a:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lt8k;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Lt8k;->c:Ls8k;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lt8k;->d:Lr8k;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lt8k;->e:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lt8k;->f:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lt8k;->g:Z

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
