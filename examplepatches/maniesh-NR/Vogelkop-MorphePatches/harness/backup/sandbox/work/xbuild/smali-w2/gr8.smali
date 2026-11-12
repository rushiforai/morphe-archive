.class public final Lgr8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(IIII)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lgr8;->a:I

    iput p2, p0, Lgr8;->b:I

    iput p3, p0, Lgr8;->c:I

    iput p4, p0, Lgr8;->d:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lgr8;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lgr8;

    iget v1, p0, Lgr8;->a:I

    iget v3, p1, Lgr8;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget v1, p0, Lgr8;->b:I

    iget v3, p1, Lgr8;->b:I

    if-eq v1, v3, :cond_1a

    return v2

    :cond_1a
    iget v1, p0, Lgr8;->c:I

    iget v3, p1, Lgr8;->c:I

    if-eq v1, v3, :cond_21

    return v2

    :cond_21
    iget p0, p0, Lgr8;->d:I

    iget p1, p1, Lgr8;->d:I

    if-eq p0, p1, :cond_28

    return v2

    :cond_28
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lgr8;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lgr8;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lgr8;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Lgr8;->d:I

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
