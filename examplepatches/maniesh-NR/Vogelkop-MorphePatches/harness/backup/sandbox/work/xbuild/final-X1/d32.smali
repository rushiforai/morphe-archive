.class public final Ld32;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Le32;

.field public b:Lpa;

.field public c:Z


# direct methods
.method public constructor <init>(Le32;Lpa;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld32;->a:Le32;

    iput-object p2, p0, Ld32;->b:Lpa;

    const/4 p1, 0x0

    iput-boolean p1, p0, Ld32;->c:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    if-eq p0, p1, :cond_21

    instance-of v0, p1, Ld32;

    const/4 v1, 0x0

    if-eqz v0, :cond_20

    check-cast p1, Ld32;

    iget-object v0, p0, Ld32;->a:Le32;

    iget-object v2, p1, Ld32;->a:Le32;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    iget-object v0, p0, Ld32;->b:Lpa;

    iget-object v2, p1, Ld32;->b:Lpa;

    if-eq v0, v2, :cond_1a

    return v1

    :cond_1a
    iget-boolean p0, p0, Ld32;->c:Z

    iget-boolean p1, p1, Ld32;->c:Z

    if-eq p0, p1, :cond_21

    :cond_20
    return v1

    :cond_21
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Ld32;->a:Le32;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Ld32;->b:Lpa;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-boolean p0, p0, Ld32;->c:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
