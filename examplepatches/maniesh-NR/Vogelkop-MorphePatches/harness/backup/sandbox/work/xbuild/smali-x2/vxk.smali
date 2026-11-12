.class public final Lvxk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Z

.field public final d:Z

.field public final e:Z

.field public final f:Z

.field public final g:Z

.field public final h:Ljava/util/List;

.field public final i:Z

.field public final j:Z

.field public final k:Z

.field public final l:Z


# direct methods
.method public constructor <init>(ZZZZZZZLjava/util/List;ZZZZ)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lvxk;->a:Z

    iput-boolean p2, p0, Lvxk;->b:Z

    iput-boolean p3, p0, Lvxk;->c:Z

    iput-boolean p4, p0, Lvxk;->d:Z

    iput-boolean p5, p0, Lvxk;->e:Z

    iput-boolean p6, p0, Lvxk;->f:Z

    iput-boolean p7, p0, Lvxk;->g:Z

    iput-object p8, p0, Lvxk;->h:Ljava/util/List;

    iput-boolean p9, p0, Lvxk;->i:Z

    iput-boolean p10, p0, Lvxk;->j:Z

    iput-boolean p11, p0, Lvxk;->k:Z

    iput-boolean p12, p0, Lvxk;->l:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_56

    instance-of v0, p1, Lvxk;

    if-eqz v0, :cond_54

    check-cast p1, Lvxk;

    iget-boolean v0, p0, Lvxk;->a:Z

    iget-boolean v1, p1, Lvxk;->a:Z

    if-ne v0, v1, :cond_54

    iget-boolean v0, p0, Lvxk;->b:Z

    iget-boolean v1, p1, Lvxk;->b:Z

    if-ne v0, v1, :cond_54

    iget-boolean v0, p0, Lvxk;->c:Z

    iget-boolean v1, p1, Lvxk;->c:Z

    if-ne v0, v1, :cond_54

    iget-boolean v0, p0, Lvxk;->d:Z

    iget-boolean v1, p1, Lvxk;->d:Z

    if-ne v0, v1, :cond_54

    iget-boolean v0, p0, Lvxk;->e:Z

    iget-boolean v1, p1, Lvxk;->e:Z

    if-ne v0, v1, :cond_54

    iget-boolean v0, p0, Lvxk;->f:Z

    iget-boolean v1, p1, Lvxk;->f:Z

    if-ne v0, v1, :cond_54

    iget-boolean v0, p0, Lvxk;->g:Z

    iget-boolean v1, p1, Lvxk;->g:Z

    if-ne v0, v1, :cond_54

    iget-object v0, p0, Lvxk;->h:Ljava/util/List;

    iget-object v1, p1, Lvxk;->h:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-boolean v0, p0, Lvxk;->i:Z

    iget-boolean v1, p1, Lvxk;->i:Z

    if-ne v0, v1, :cond_54

    iget-boolean v0, p0, Lvxk;->j:Z

    iget-boolean v1, p1, Lvxk;->j:Z

    if-ne v0, v1, :cond_54

    iget-boolean v0, p0, Lvxk;->k:Z

    iget-boolean v1, p1, Lvxk;->k:Z

    if-ne v0, v1, :cond_54

    iget-boolean p0, p0, Lvxk;->l:Z

    iget-boolean p1, p1, Lvxk;->l:Z

    if-eq p0, p1, :cond_56

    :cond_54
    const/4 p0, 0x0

    return p0

    :cond_56
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Lvxk;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lvxk;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lvxk;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lvxk;->d:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lvxk;->e:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lvxk;->f:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lvxk;->g:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Lvxk;->h:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-boolean v2, p0, Lvxk;->i:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lvxk;->j:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lvxk;->k:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lvxk;->l:Z

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
