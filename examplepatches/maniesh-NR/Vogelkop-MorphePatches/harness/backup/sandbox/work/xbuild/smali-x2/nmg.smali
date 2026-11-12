.class public final Lnmg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:J

.field public final c:J

.field public final d:J

.field public final e:Z

.field public final f:F

.field public final g:B

.field public final h:Z

.field public final i:Ljava/util/ArrayList;

.field public final j:J

.field public final k:F

.field public final l:J

.field public final m:J


# direct methods
.method public constructor <init>(JJJJZFIZLjava/util/ArrayList;JFJJ)V
    .registers 21

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lnmg;->a:J

    iput-wide p3, p0, Lnmg;->b:J

    iput-wide p5, p0, Lnmg;->c:J

    iput-wide p7, p0, Lnmg;->d:J

    iput-boolean p9, p0, Lnmg;->e:Z

    iput p10, p0, Lnmg;->f:F

    iput-byte p11, p0, Lnmg;->g:B

    iput-boolean p12, p0, Lnmg;->h:Z

    iput-object p13, p0, Lnmg;->i:Ljava/util/ArrayList;

    iput-wide p14, p0, Lnmg;->j:J

    move/from16 p1, p16

    iput p1, p0, Lnmg;->k:F

    move-wide/from16 p1, p17

    iput-wide p1, p0, Lnmg;->l:J

    move-wide/from16 p1, p19

    iput-wide p1, p0, Lnmg;->m:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_7c

    instance-of v0, p1, Lnmg;

    if-eqz v0, :cond_7e

    check-cast p1, Lnmg;

    iget-wide v0, p0, Lnmg;->a:J

    iget-wide v2, p1, Lnmg;->a:J

    invoke-static {v0, v1, v2, v3}, Lk1g;->s(JJ)Z

    move-result v0

    if-eqz v0, :cond_7e

    iget-wide v0, p0, Lnmg;->b:J

    iget-wide v2, p1, Lnmg;->b:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_7e

    iget-wide v0, p0, Lnmg;->c:J

    iget-wide v2, p1, Lnmg;->c:J

    invoke-static {v0, v1, v2, v3}, Ly8f;->b(JJ)Z

    move-result v0

    if-eqz v0, :cond_7e

    iget-wide v0, p0, Lnmg;->d:J

    iget-wide v2, p1, Lnmg;->d:J

    invoke-static {v0, v1, v2, v3}, Ly8f;->b(JJ)Z

    move-result v0

    if-eqz v0, :cond_7e

    iget-boolean v0, p0, Lnmg;->e:Z

    iget-boolean v1, p1, Lnmg;->e:Z

    if-ne v0, v1, :cond_7e

    iget v0, p0, Lnmg;->f:F

    iget v1, p1, Lnmg;->f:F

    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-nez v0, :cond_7e

    iget-byte v0, p0, Lnmg;->g:B

    iget-byte v1, p1, Lnmg;->g:B

    if-ne v0, v1, :cond_7e

    iget-boolean v0, p0, Lnmg;->h:Z

    iget-boolean v1, p1, Lnmg;->h:Z

    if-ne v0, v1, :cond_7e

    iget-object v0, p0, Lnmg;->i:Ljava/util/ArrayList;

    iget-object v1, p1, Lnmg;->i:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7e

    iget-wide v0, p0, Lnmg;->j:J

    iget-wide v2, p1, Lnmg;->j:J

    invoke-static {v0, v1, v2, v3}, Ly8f;->b(JJ)Z

    move-result v0

    if-eqz v0, :cond_7e

    iget v0, p0, Lnmg;->k:F

    iget v1, p1, Lnmg;->k:F

    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-nez v0, :cond_7e

    iget-wide v0, p0, Lnmg;->l:J

    iget-wide v2, p1, Lnmg;->l:J

    invoke-static {v0, v1, v2, v3}, Ly8f;->b(JJ)Z

    move-result v0

    if-eqz v0, :cond_7e

    iget-wide v0, p0, Lnmg;->m:J

    iget-wide p0, p1, Lnmg;->m:J

    invoke-static {v0, v1, p0, p1}, Ly8f;->b(JJ)Z

    move-result p0

    if-eqz p0, :cond_7e

    :cond_7c
    const/4 p0, 0x1

    return p0

    :cond_7e
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-wide v0, p0, Lnmg;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-wide v2, p0, Lnmg;->b:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-wide v2, p0, Lnmg;->c:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-wide v2, p0, Lnmg;->d:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-boolean v2, p0, Lnmg;->e:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget v2, p0, Lnmg;->f:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget-byte v2, p0, Lnmg;->g:B

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean v2, p0, Lnmg;->h:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Lnmg;->i:Ljava/util/ArrayList;

    invoke-static {v2, v0, v1}, Lz1m;->g(Ljava/util/ArrayList;II)I

    move-result v0

    iget-wide v2, p0, Lnmg;->j:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget v2, p0, Lnmg;->k:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget-wide v2, p0, Lnmg;->l:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-wide v1, p0, Lnmg;->m:J

    invoke-static {v1, v2}, Ljava/lang/Long;->hashCode(J)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 11

    iget-wide v0, p0, Lnmg;->a:J

    invoke-static {v0, v1}, Lk1g;->h0(J)Ljava/lang/String;

    move-result-object v0

    iget-wide v1, p0, Lnmg;->c:J

    invoke-static {v1, v2}, Ly8f;->g(J)Ljava/lang/String;

    move-result-object v1

    iget-wide v2, p0, Lnmg;->d:J

    invoke-static {v2, v3}, Ly8f;->g(J)Ljava/lang/String;

    move-result-object v2

    iget-byte v3, p0, Lnmg;->g:B

    invoke-static {v3}, Lvmg;->a(I)Ljava/lang/String;

    move-result-object v3

    iget-wide v4, p0, Lnmg;->j:J

    invoke-static {v4, v5}, Ly8f;->g(J)Ljava/lang/String;

    move-result-object v4

    iget-wide v5, p0, Lnmg;->l:J

    invoke-static {v5, v6}, Ly8f;->g(J)Ljava/lang/String;

    move-result-object v5

    iget-wide v6, p0, Lnmg;->m:J

    invoke-static {v6, v7}, Ly8f;->g(J)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "PointerInputEventData(id="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", uptime="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v8, p0, Lnmg;->b:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ", positionOnScreen="

    const-string v8, ", position="

    invoke-static {v7, v0, v1, v8, v2}, Lz1m;->t(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, ", down="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v0, p0, Lnmg;->e:Z

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ", pressure="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lnmg;->f:F

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ", type="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", activeHover="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v0, p0, Lnmg;->h:Z

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ", historical="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lnmg;->i:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", scrollDelta="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", scaleGestureFactor="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lnmg;->k:F

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p0, ", panGestureOffset="

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ", originalEventPosition="

    const-string v0, ")"

    invoke-static {v7, p0, v6, v0}, Lp3p;->n(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
