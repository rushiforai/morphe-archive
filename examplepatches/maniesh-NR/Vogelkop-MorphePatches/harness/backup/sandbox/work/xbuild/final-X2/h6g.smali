.class public final Lh6g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljji;

.field public final b:Z

.field public final c:Lns2;

.field public final d:Lryc;

.field public final e:Llxk;

.field public final f:I

.field public final g:Z

.field public final h:Z


# direct methods
.method public constructor <init>(Ljji;ZLns2;Lryc;Llxk;IZZ)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh6g;->a:Ljji;

    iput-boolean p2, p0, Lh6g;->b:Z

    iput-object p3, p0, Lh6g;->c:Lns2;

    iput-object p4, p0, Lh6g;->d:Lryc;

    iput-object p5, p0, Lh6g;->e:Llxk;

    iput p6, p0, Lh6g;->f:I

    iput-boolean p7, p0, Lh6g;->g:Z

    iput-boolean p8, p0, Lh6g;->h:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_46

    instance-of v0, p1, Lh6g;

    if-eqz v0, :cond_44

    check-cast p1, Lh6g;

    iget-object v0, p0, Lh6g;->a:Ljji;

    iget-object v1, p1, Lh6g;->a:Ljji;

    if-ne v0, v1, :cond_44

    iget-boolean v0, p0, Lh6g;->b:Z

    iget-boolean v1, p1, Lh6g;->b:Z

    if-ne v0, v1, :cond_44

    iget-object v0, p0, Lh6g;->c:Lns2;

    iget-object v1, p1, Lh6g;->c:Lns2;

    invoke-virtual {v0, v1}, Lns2;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    iget-object v0, p0, Lh6g;->d:Lryc;

    iget-object v1, p1, Lh6g;->d:Lryc;

    invoke-virtual {v0, v1}, Lryc;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    iget-object v0, p0, Lh6g;->e:Llxk;

    iget-object v1, p1, Lh6g;->e:Llxk;

    invoke-virtual {v0, v1}, Llxk;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    iget v0, p0, Lh6g;->f:I

    iget v1, p1, Lh6g;->f:I

    if-ne v0, v1, :cond_44

    iget-boolean v0, p0, Lh6g;->g:Z

    iget-boolean v1, p1, Lh6g;->g:Z

    if-ne v0, v1, :cond_44

    iget-boolean p0, p0, Lh6g;->h:Z

    iget-boolean p1, p1, Lh6g;->h:Z

    if-eq p0, p1, :cond_46

    :cond_44
    const/4 p0, 0x0

    return p0

    :cond_46
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lh6g;->a:Ljji;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lh6g;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Lh6g;->c:Lns2;

    invoke-virtual {v2}, Lns2;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lh6g;->d:Lryc;

    invoke-virtual {v0}, Lryc;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lh6g;->e:Llxk;

    invoke-virtual {v2}, Llxk;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget v0, p0, Lh6g;->f:I

    invoke-static {v0, v2, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean v2, p0, Lh6g;->g:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lh6g;->h:Z

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
