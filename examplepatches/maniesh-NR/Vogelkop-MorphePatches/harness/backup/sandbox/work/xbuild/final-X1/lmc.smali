.class public final Llmc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Loi9;

.field public final c:Lvmc;

.field public final d:Ljava/lang/String;

.field public final e:Lrmc;

.field public final f:Lsmc;

.field public final g:Lomc;

.field public final h:Limc;

.field public final i:Z

.field public final j:Z


# direct methods
.method public constructor <init>(JLoi9;Lvmc;Ljava/lang/String;Lrmc;Lsmc;Lomc;Limc;ZZ)V
    .registers 13

    sget-object v0, Lapc;->b:Lix5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Llmc;->a:J

    iput-object p3, p0, Llmc;->b:Loi9;

    iput-object p4, p0, Llmc;->c:Lvmc;

    iput-object p5, p0, Llmc;->d:Ljava/lang/String;

    iput-object p6, p0, Llmc;->e:Lrmc;

    iput-object p7, p0, Llmc;->f:Lsmc;

    iput-object p8, p0, Llmc;->g:Lomc;

    iput-object p9, p0, Llmc;->h:Limc;

    iput-boolean p10, p0, Llmc;->i:Z

    iput-boolean p11, p0, Llmc;->j:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_5a

    instance-of v0, p1, Llmc;

    if-eqz v0, :cond_58

    check-cast p1, Llmc;

    iget-wide v0, p0, Llmc;->a:J

    iget-wide v2, p1, Llmc;->a:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_58

    sget-object v0, Lapc;->b:Lix5;

    iget-object v0, p0, Llmc;->b:Loi9;

    iget-object v1, p1, Llmc;->b:Loi9;

    if-ne v0, v1, :cond_58

    iget-object v0, p0, Llmc;->c:Lvmc;

    iget-object v1, p1, Llmc;->c:Lvmc;

    invoke-virtual {v0, v1}, Lvmc;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Llmc;->d:Ljava/lang/String;

    iget-object v1, p1, Llmc;->d:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Llmc;->e:Lrmc;

    iget-object v1, p1, Llmc;->e:Lrmc;

    invoke-virtual {v0, v1}, Lrmc;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Llmc;->f:Lsmc;

    iget-object v1, p1, Llmc;->f:Lsmc;

    if-ne v0, v1, :cond_58

    iget-object v0, p0, Llmc;->g:Lomc;

    iget-object v1, p1, Llmc;->g:Lomc;

    if-ne v0, v1, :cond_58

    iget-object v0, p0, Llmc;->h:Limc;

    iget-object v1, p1, Llmc;->h:Limc;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-boolean v0, p0, Llmc;->i:Z

    iget-boolean v1, p1, Llmc;->i:Z

    if-ne v0, v1, :cond_58

    iget-boolean p0, p0, Llmc;->j:Z

    iget-boolean p1, p1, Llmc;->j:Z

    if-eq p0, p1, :cond_5a

    :cond_58
    const/4 p0, 0x0

    return p0

    :cond_5a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-wide v0, p0, Llmc;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    sget-object v2, Lapc;->c:Lapc;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Llmc;->b:Loi9;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Llmc;->c:Lvmc;

    invoke-virtual {v2}, Lvmc;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    const/4 v0, 0x0

    iget-object v3, p0, Llmc;->d:Ljava/lang/String;

    if-nez v3, :cond_28

    move v3, v0

    goto :goto_2c

    :cond_28
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_2c
    add-int/2addr v2, v3

    mul-int/2addr v2, v1

    iget-object v3, p0, Llmc;->e:Lrmc;

    invoke-virtual {v3}, Lrmc;->hashCode()I

    move-result v3

    add-int/2addr v3, v2

    mul-int/2addr v3, v1

    iget-object v2, p0, Llmc;->f:Lsmc;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v3

    mul-int/2addr v2, v1

    iget-object v3, p0, Llmc;->g:Lomc;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int/2addr v3, v2

    mul-int/2addr v3, v1

    iget-object v2, p0, Llmc;->h:Limc;

    if-eqz v2, :cond_4e

    invoke-virtual {v2}, Limc;->hashCode()I

    move-result v0

    :cond_4e
    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-boolean v0, p0, Llmc;->i:Z

    invoke-static {v3, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Llmc;->j:Z

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
