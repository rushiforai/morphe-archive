.class public final Lzxj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ly7h;

.field public final b:Lgxh;

.field public final c:Lixh;


# direct methods
.method public constructor <init>(Ly7h;)V
    .registers 5

    new-instance v0, Lgxh;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lgxh;-><init>(I)V

    new-instance v1, Lixh;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lixh;-><init>(F)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzxj;->a:Ly7h;

    iput-object v0, p0, Lzxj;->b:Lgxh;

    iput-object v1, p0, Lzxj;->c:Lixh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_28

    instance-of v0, p1, Lzxj;

    if-eqz v0, :cond_26

    check-cast p1, Lzxj;

    iget-object v0, p0, Lzxj;->a:Ly7h;

    iget-object v1, p1, Lzxj;->a:Ly7h;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object v0, p0, Lzxj;->b:Lgxh;

    iget-object v1, p1, Lzxj;->b:Lgxh;

    invoke-virtual {v0, v1}, Lgxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object p0, p0, Lzxj;->c:Lixh;

    iget-object p1, p1, Lzxj;->c:Lixh;

    invoke-virtual {p0, p1}, Lixh;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_28

    :cond_26
    const/4 p0, 0x0

    return p0

    :cond_28
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lzxj;->a:Ly7h;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lzxj;->b:Lgxh;

    iget v2, v2, Lgxh;->a:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object p0, p0, Lzxj;->c:Lixh;

    iget p0, p0, Lixh;->d:F

    invoke-static {p0}, Ljava/lang/Float;->hashCode(F)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
