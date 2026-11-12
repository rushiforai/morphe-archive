.class public final Lwxk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I


# direct methods
.method public constructor <init>(III)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lwxk;->a:I

    iput p2, p0, Lwxk;->b:I

    iput p3, p0, Lwxk;->c:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1c

    instance-of v0, p1, Lwxk;

    if-eqz v0, :cond_1a

    check-cast p1, Lwxk;

    iget v0, p0, Lwxk;->a:I

    iget v1, p1, Lwxk;->a:I

    if-ne v0, v1, :cond_1a

    iget v0, p0, Lwxk;->b:I

    iget v1, p1, Lwxk;->b:I

    if-ne v0, v1, :cond_1a

    iget p0, p0, Lwxk;->c:I

    iget p1, p1, Lwxk;->c:I

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

    iget v0, p0, Lwxk;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lwxk;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Lwxk;->c:I

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
