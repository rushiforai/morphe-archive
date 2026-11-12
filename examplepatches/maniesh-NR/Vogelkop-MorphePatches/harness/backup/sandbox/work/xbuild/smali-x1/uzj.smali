.class public final Luzj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Lp7j;

.field public final c:Z

.field public final d:Z


# direct methods
.method public constructor <init>(ZLp7j;ZZ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Luzj;->a:Z

    iput-object p2, p0, Luzj;->b:Lp7j;

    iput-boolean p3, p0, Luzj;->c:Z

    iput-boolean p4, p0, Luzj;->d:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Luzj;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Luzj;

    iget-boolean v1, p0, Luzj;->a:Z

    iget-boolean v3, p1, Luzj;->a:Z

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Luzj;->b:Lp7j;

    iget-object v3, p1, Luzj;->b:Lp7j;

    if-eq v1, v3, :cond_1a

    return v2

    :cond_1a
    iget-boolean v1, p0, Luzj;->c:Z

    iget-boolean v3, p1, Luzj;->c:Z

    if-eq v1, v3, :cond_21

    return v2

    :cond_21
    iget-boolean p0, p0, Luzj;->d:Z

    iget-boolean p1, p1, Luzj;->d:Z

    if-eq p0, p1, :cond_28

    return v2

    :cond_28
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Luzj;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Luzj;->b:Lp7j;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Luzj;->c:Z

    invoke-static {v2, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Luzj;->d:Z

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
