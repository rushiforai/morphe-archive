.class public final Lljj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ln54;

.field public final b:Ln54;

.field public final c:Ln54;


# direct methods
.method public constructor <init>(Ln54;Ln54;Ln54;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lljj;->a:Ln54;

    iput-object p2, p0, Lljj;->b:Ln54;

    iput-object p3, p0, Lljj;->c:Ln54;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_28

    instance-of v0, p1, Lljj;

    if-eqz v0, :cond_26

    check-cast p1, Lljj;

    iget-object v0, p0, Lljj;->a:Ln54;

    iget-object v1, p1, Lljj;->a:Ln54;

    invoke-virtual {v0, v1}, Ln54;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object v0, p0, Lljj;->b:Ln54;

    iget-object v1, p1, Lljj;->b:Ln54;

    invoke-virtual {v0, v1}, Ln54;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object p0, p0, Lljj;->c:Ln54;

    iget-object p1, p1, Lljj;->c:Ln54;

    invoke-virtual {p0, p1}, Ln54;->equals(Ljava/lang/Object;)Z

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
    .registers 3

    iget-object v0, p0, Lljj;->a:Ln54;

    iget-object v0, v0, Ln54;->a:[B

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lljj;->b:Ln54;

    iget-object v1, v1, Ln54;->a:[B

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([B)I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lljj;->c:Ln54;

    iget-object p0, p0, Ln54;->a:[B

    invoke-static {p0}, Ljava/util/Arrays;->hashCode([B)I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SignatureData(v="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lljj;->a:Ln54;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", r="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lljj;->b:Ln54;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", s="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lljj;->c:Ln54;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
