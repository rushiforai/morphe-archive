.class public final Losl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lnsl;

.field public final b:Z

.field public final c:Z


# direct methods
.method public constructor <init>(Lnsl;ZZ)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Losl;->a:Lnsl;

    iput-boolean p2, p0, Losl;->b:Z

    iput-boolean p3, p0, Losl;->c:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1c

    instance-of v0, p1, Losl;

    if-eqz v0, :cond_1a

    check-cast p1, Losl;

    iget-object v0, p0, Losl;->a:Lnsl;

    iget-object v1, p1, Losl;->a:Lnsl;

    if-ne v0, v1, :cond_1a

    iget-boolean v0, p0, Losl;->b:Z

    iget-boolean v1, p1, Losl;->b:Z

    if-ne v0, v1, :cond_1a

    iget-boolean p0, p0, Losl;->c:Z

    iget-boolean p1, p1, Losl;->c:Z

    if-eq p0, p1, :cond_1c

    :cond_1a
    const/4 p0, 0x0

    return p0

    :cond_1c
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Losl;->a:Lnsl;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Losl;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Losl;->c:Z

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
