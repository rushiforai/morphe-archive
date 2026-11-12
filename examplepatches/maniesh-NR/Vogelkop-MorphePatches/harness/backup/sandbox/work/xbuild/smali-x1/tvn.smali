.class public final Ltvn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Lkotlinx/serialization/json/b;

.field public final c:Lkotlinx/serialization/json/c;

.field public final d:Z

.field public final e:Lnak;


# direct methods
.method public constructor <init>(ILkotlinx/serialization/json/b;Lkotlinx/serialization/json/c;Z)V
    .registers 6

    const/4 v0, 0x0

    invoke-static {v0}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ltvn;->a:I

    iput-object p2, p0, Ltvn;->b:Lkotlinx/serialization/json/b;

    iput-object p3, p0, Ltvn;->c:Lkotlinx/serialization/json/c;

    iput-boolean p4, p0, Ltvn;->d:Z

    iput-object v0, p0, Ltvn;->e:Lnak;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ltvn;

    const/4 v2, 0x0

    if-eqz v1, :cond_2b

    check-cast p1, Ltvn;

    iget v1, p0, Ltvn;->a:I

    iget v3, p1, Ltvn;->a:I

    if-ne v1, v3, :cond_2b

    iget-object v1, p0, Ltvn;->b:Lkotlinx/serialization/json/b;

    iget-object v3, p1, Ltvn;->b:Lkotlinx/serialization/json/b;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2b

    iget-object v1, p0, Ltvn;->c:Lkotlinx/serialization/json/c;

    iget-object v3, p1, Ltvn;->c:Lkotlinx/serialization/json/c;

    invoke-virtual {v1, v3}, Lkotlinx/serialization/json/c;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2b

    iget-boolean v1, p0, Ltvn;->d:Z

    iget-boolean v3, p1, Ltvn;->d:Z

    if-eq v1, v3, :cond_2c

    :cond_2b
    return v2

    :cond_2c
    iget-object p0, p0, Ltvn;->e:Lnak;

    iget-object p1, p1, Ltvn;->e:Lnak;

    if-eq p0, p1, :cond_33

    return v2

    :cond_33
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Ltvn;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Ltvn;->b:Lkotlinx/serialization/json/b;

    if-nez v2, :cond_f

    const/4 v2, 0x0

    goto :goto_13

    :cond_f
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_13
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Ltvn;->c:Lkotlinx/serialization/json/c;

    iget-object v2, v2, Lkotlinx/serialization/json/c;->a:Ljava/util/Map;

    invoke-static {v2, v0, v1}, Lz1m;->h(Ljava/util/Map;II)I

    move-result v0

    iget-boolean v2, p0, Ltvn;->d:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Ltvn;->e:Lnak;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "WebSocketRequest(id="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Ltvn;->a:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", originalId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ltvn;->b:Lkotlinx/serialization/json/b;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", json="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ltvn;->c:Lkotlinx/serialization/json/c;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", isSubscription="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Ltvn;->d:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", result="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Ltvn;->e:Lnak;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
