.class public final Ljs1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lc7j;

.field public final b:I

.field public final c:Z


# direct methods
.method public constructor <init>(Lc7j;IZ)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljs1;->a:Lc7j;

    iput p2, p0, Ljs1;->b:I

    iput-boolean p3, p0, Ljs1;->c:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1c

    instance-of v0, p1, Ljs1;

    if-eqz v0, :cond_1a

    check-cast p1, Ljs1;

    iget-object v0, p0, Ljs1;->a:Lc7j;

    iget-object v1, p1, Ljs1;->a:Lc7j;

    if-ne v0, v1, :cond_1a

    iget v0, p0, Ljs1;->b:I

    iget v1, p1, Ljs1;->b:I

    if-ne v0, v1, :cond_1a

    iget-boolean p0, p0, Ljs1;->c:Z

    iget-boolean p1, p1, Ljs1;->c:Z

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

    iget-object v0, p0, Ljs1;->a:Lc7j;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Ljs1;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean p0, p0, Ljs1;->c:Z

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
