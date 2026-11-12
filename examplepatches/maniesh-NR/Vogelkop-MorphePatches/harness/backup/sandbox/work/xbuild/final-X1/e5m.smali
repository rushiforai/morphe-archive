.class public final Le5m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Lszb;

.field public final d:Z


# direct methods
.method public constructor <init>(ZZLszb;Z)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Le5m;->a:Z

    iput-boolean p2, p0, Le5m;->b:Z

    iput-object p3, p0, Le5m;->c:Lszb;

    iput-boolean p4, p0, Le5m;->d:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_22

    instance-of v0, p1, Le5m;

    if-eqz v0, :cond_20

    check-cast p1, Le5m;

    iget-boolean v0, p0, Le5m;->a:Z

    iget-boolean v1, p1, Le5m;->a:Z

    if-ne v0, v1, :cond_20

    iget-boolean v0, p0, Le5m;->b:Z

    iget-boolean v1, p1, Le5m;->b:Z

    if-ne v0, v1, :cond_20

    iget-object v0, p0, Le5m;->c:Lszb;

    iget-object v1, p1, Le5m;->c:Lszb;

    if-ne v0, v1, :cond_20

    iget-boolean p0, p0, Le5m;->d:Z

    iget-boolean p1, p1, Le5m;->d:Z

    if-eq p0, p1, :cond_22

    :cond_20
    const/4 p0, 0x0

    return p0

    :cond_22
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Le5m;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Le5m;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Le5m;->c:Lszb;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean p0, p0, Le5m;->d:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v2

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
