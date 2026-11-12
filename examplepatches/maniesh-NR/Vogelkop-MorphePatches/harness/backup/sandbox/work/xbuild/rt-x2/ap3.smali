.class public final Lap3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzo3;

.field public final b:Z

.field public final c:Z


# direct methods
.method public constructor <init>(Lzo3;ZZ)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lap3;->a:Lzo3;

    iput-boolean p2, p0, Lap3;->b:Z

    iput-boolean p3, p0, Lap3;->c:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_20

    instance-of v0, p1, Lap3;

    if-eqz v0, :cond_1e

    check-cast p1, Lap3;

    iget-object v0, p0, Lap3;->a:Lzo3;

    iget-object v1, p1, Lap3;->a:Lzo3;

    invoke-virtual {v0, v1}, Lzo3;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-boolean v0, p0, Lap3;->b:Z

    iget-boolean v1, p1, Lap3;->b:Z

    if-ne v0, v1, :cond_1e

    iget-boolean p0, p0, Lap3;->c:Z

    iget-boolean p1, p1, Lap3;->c:Z

    if-eq p0, p1, :cond_20

    :cond_1e
    const/4 p0, 0x0

    return p0

    :cond_20
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lap3;->a:Lzo3;

    iget v0, v0, Lzo3;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lap3;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lap3;->c:Z

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
