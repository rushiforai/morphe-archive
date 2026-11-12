.class public final Ltu1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lfll;

.field public final b:Lpxe;

.field public final c:Z

.field public final d:Lp37;

.field public final e:Z

.field public final f:Lns1;


# direct methods
.method public constructor <init>(Lfll;Lpxe;ZLp37;ZLns1;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltu1;->a:Lfll;

    iput-object p2, p0, Ltu1;->b:Lpxe;

    iput-boolean p3, p0, Ltu1;->c:Z

    iput-object p4, p0, Ltu1;->d:Lp37;

    iput-boolean p5, p0, Ltu1;->e:Z

    iput-object p6, p0, Ltu1;->f:Lns1;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_3e

    instance-of v0, p1, Ltu1;

    if-eqz v0, :cond_3c

    check-cast p1, Ltu1;

    iget-object v0, p0, Ltu1;->a:Lfll;

    iget-object v1, p1, Ltu1;->a:Lfll;

    invoke-virtual {v0, v1}, Lfll;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Ltu1;->b:Lpxe;

    iget-object v1, p1, Ltu1;->b:Lpxe;

    invoke-virtual {v0, v1}, Lpxe;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-boolean v0, p0, Ltu1;->c:Z

    iget-boolean v1, p1, Ltu1;->c:Z

    if-ne v0, v1, :cond_3c

    iget-object v0, p0, Ltu1;->d:Lp37;

    iget-object v1, p1, Ltu1;->d:Lp37;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-boolean v0, p0, Ltu1;->e:Z

    iget-boolean v1, p1, Ltu1;->e:Z

    if-ne v0, v1, :cond_3c

    iget-object p0, p0, Ltu1;->f:Lns1;

    iget-object p1, p1, Ltu1;->f:Lns1;

    invoke-virtual {p0, p1}, Lns1;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3e

    :cond_3c
    const/4 p0, 0x0

    return p0

    :cond_3e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Ltu1;->a:Lfll;

    invoke-virtual {v0}, Lfll;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Ltu1;->b:Lpxe;

    invoke-virtual {v2}, Lpxe;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Ltu1;->c:Z

    invoke-static {v2, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Ltu1;->d:Lp37;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Ltu1;->e:Z

    invoke-static {v2, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Ltu1;->f:Lns1;

    invoke-virtual {p0}, Lns1;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
