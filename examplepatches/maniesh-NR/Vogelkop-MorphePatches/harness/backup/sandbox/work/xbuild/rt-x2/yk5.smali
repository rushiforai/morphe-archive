.class public final Lyk5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Z

.field public final d:Z

.field public final e:Z


# direct methods
.method public constructor <init>(ZZZZZ)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lyk5;->a:Z

    iput-boolean p2, p0, Lyk5;->b:Z

    iput-boolean p3, p0, Lyk5;->c:Z

    iput-boolean p4, p0, Lyk5;->d:Z

    iput-boolean p5, p0, Lyk5;->e:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_28

    instance-of v0, p1, Lyk5;

    if-eqz v0, :cond_26

    check-cast p1, Lyk5;

    iget-boolean v0, p0, Lyk5;->a:Z

    iget-boolean v1, p1, Lyk5;->a:Z

    if-ne v0, v1, :cond_26

    iget-boolean v0, p0, Lyk5;->b:Z

    iget-boolean v1, p1, Lyk5;->b:Z

    if-ne v0, v1, :cond_26

    iget-boolean v0, p0, Lyk5;->c:Z

    iget-boolean v1, p1, Lyk5;->c:Z

    if-ne v0, v1, :cond_26

    iget-boolean v0, p0, Lyk5;->d:Z

    iget-boolean v1, p1, Lyk5;->d:Z

    if-ne v0, v1, :cond_26

    iget-boolean p0, p0, Lyk5;->e:Z

    iget-boolean p1, p1, Lyk5;->e:Z

    if-eq p0, p1, :cond_28

    :cond_26
    const/4 p0, 0x0

    return p0

    :cond_28
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Lyk5;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lyk5;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lyk5;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lyk5;->d:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lyk5;->e:Z

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
