.class public final Lg52;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:I


# direct methods
.method public constructor <init>(ZZI)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lg52;->a:Z

    iput-boolean p2, p0, Lg52;->b:Z

    iput p3, p0, Lg52;->c:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1c

    instance-of v0, p1, Lg52;

    if-eqz v0, :cond_1a

    check-cast p1, Lg52;

    iget-boolean v0, p0, Lg52;->a:Z

    iget-boolean v1, p1, Lg52;->a:Z

    if-ne v0, v1, :cond_1a

    iget-boolean v0, p0, Lg52;->b:Z

    iget-boolean v1, p1, Lg52;->b:Z

    if-ne v0, v1, :cond_1a

    iget p0, p0, Lg52;->c:I

    iget p1, p1, Lg52;->c:I

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

    iget-boolean v0, p0, Lg52;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lg52;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget p0, p0, Lg52;->c:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
