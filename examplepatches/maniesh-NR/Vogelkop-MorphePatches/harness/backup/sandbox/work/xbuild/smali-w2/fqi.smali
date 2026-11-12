.class public final Lfqi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Leqi;

.field public final c:Leqi;

.field public final d:Leqi;

.field public final e:Leqi;

.field public final f:Leqi;

.field public final g:Leqi;

.field public final h:Leqi;

.field public final i:Leqi;

.field public final j:Leqi;

.field public final k:Leqi;

.field public final l:Leqi;

.field public final m:Leqi;

.field public final n:Leqi;

.field public final o:Leqi;

.field public final p:Leqi;

.field public final q:Leqi;

.field public final r:Leqi;

.field public final s:Leqi;


# direct methods
.method public constructor <init>(ZLeqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;)V
    .registers 20

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lfqi;->a:Z

    iput-object p2, p0, Lfqi;->b:Leqi;

    iput-object p3, p0, Lfqi;->c:Leqi;

    iput-object p4, p0, Lfqi;->d:Leqi;

    iput-object p5, p0, Lfqi;->e:Leqi;

    iput-object p6, p0, Lfqi;->f:Leqi;

    iput-object p7, p0, Lfqi;->g:Leqi;

    iput-object p8, p0, Lfqi;->h:Leqi;

    iput-object p9, p0, Lfqi;->i:Leqi;

    iput-object p10, p0, Lfqi;->j:Leqi;

    iput-object p11, p0, Lfqi;->k:Leqi;

    iput-object p12, p0, Lfqi;->l:Leqi;

    iput-object p13, p0, Lfqi;->m:Leqi;

    iput-object p14, p0, Lfqi;->n:Leqi;

    iput-object p15, p0, Lfqi;->o:Leqi;

    move-object/from16 p1, p16

    iput-object p1, p0, Lfqi;->p:Leqi;

    move-object/from16 p1, p17

    iput-object p1, p0, Lfqi;->q:Leqi;

    move-object/from16 p1, p18

    iput-object p1, p0, Lfqi;->r:Leqi;

    move-object/from16 p1, p19

    iput-object p1, p0, Lfqi;->s:Leqi;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_c4

    instance-of v0, p1, Lfqi;

    if-eqz v0, :cond_c2

    check-cast p1, Lfqi;

    iget-boolean v0, p0, Lfqi;->a:Z

    iget-boolean v1, p1, Lfqi;->a:Z

    if-ne v0, v1, :cond_c2

    iget-object v0, p0, Lfqi;->b:Leqi;

    iget-object v1, p1, Lfqi;->b:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lfqi;->c:Leqi;

    iget-object v1, p1, Lfqi;->c:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lfqi;->d:Leqi;

    iget-object v1, p1, Lfqi;->d:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lfqi;->e:Leqi;

    iget-object v1, p1, Lfqi;->e:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lfqi;->f:Leqi;

    iget-object v1, p1, Lfqi;->f:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lfqi;->g:Leqi;

    iget-object v1, p1, Lfqi;->g:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lfqi;->h:Leqi;

    iget-object v1, p1, Lfqi;->h:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lfqi;->i:Leqi;

    iget-object v1, p1, Lfqi;->i:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lfqi;->j:Leqi;

    iget-object v1, p1, Lfqi;->j:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lfqi;->k:Leqi;

    iget-object v1, p1, Lfqi;->k:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lfqi;->l:Leqi;

    iget-object v1, p1, Lfqi;->l:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lfqi;->m:Leqi;

    iget-object v1, p1, Lfqi;->m:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lfqi;->n:Leqi;

    iget-object v1, p1, Lfqi;->n:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lfqi;->o:Leqi;

    iget-object v1, p1, Lfqi;->o:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lfqi;->p:Leqi;

    iget-object v1, p1, Lfqi;->p:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lfqi;->q:Leqi;

    iget-object v1, p1, Lfqi;->q:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lfqi;->r:Leqi;

    iget-object v1, p1, Lfqi;->r:Leqi;

    invoke-virtual {v0, v1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c2

    iget-object p0, p0, Lfqi;->s:Leqi;

    iget-object p1, p1, Lfqi;->s:Leqi;

    invoke-virtual {p0, p1}, Leqi;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c4

    :cond_c2
    const/4 p0, 0x0

    return p0

    :cond_c4
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-boolean v0, p0, Lfqi;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lfqi;->b:Leqi;

    invoke-virtual {v1}, Leqi;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lfqi;->c:Leqi;

    invoke-virtual {v0}, Leqi;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lfqi;->d:Leqi;

    invoke-virtual {v1}, Leqi;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lfqi;->e:Leqi;

    invoke-virtual {v0}, Leqi;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lfqi;->f:Leqi;

    invoke-virtual {v1}, Leqi;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lfqi;->g:Leqi;

    invoke-virtual {v0}, Leqi;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lfqi;->h:Leqi;

    invoke-virtual {v1}, Leqi;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lfqi;->i:Leqi;

    invoke-virtual {v0}, Leqi;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lfqi;->j:Leqi;

    invoke-virtual {v1}, Leqi;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lfqi;->k:Leqi;

    invoke-virtual {v0}, Leqi;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lfqi;->l:Leqi;

    invoke-virtual {v1}, Leqi;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lfqi;->m:Leqi;

    invoke-virtual {v0}, Leqi;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lfqi;->n:Leqi;

    invoke-virtual {v1}, Leqi;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lfqi;->o:Leqi;

    invoke-virtual {v0}, Leqi;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lfqi;->p:Leqi;

    invoke-virtual {v1}, Leqi;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lfqi;->q:Leqi;

    invoke-virtual {v0}, Leqi;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lfqi;->r:Leqi;

    invoke-virtual {v1}, Leqi;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lfqi;->s:Leqi;

    invoke-virtual {p0}, Leqi;->hashCode()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
