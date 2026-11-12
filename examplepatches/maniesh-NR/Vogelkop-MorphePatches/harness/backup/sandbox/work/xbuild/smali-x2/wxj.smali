.class public final Lwxj;
.super Lj7h;
.source "SourceFile"


# instance fields
.field public final b:I

.field public final c:Lixh;


# direct methods
.method public constructor <init>(I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lwxj;->b:I

    new-instance p1, Lixh;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lixh;-><init>(F)V

    iput-object p1, p0, Lwxj;->c:Lixh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lwxj;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lwxj;

    iget p0, p0, Lwxj;->b:I

    iget p1, p1, Lwxj;->b:I

    if-eq p0, p1, :cond_13

    return v2

    :cond_13
    return v0
.end method

.method public final h()Lixh;
    .registers 1

    iget-object p0, p0, Lwxj;->c:Lixh;

    return-object p0
.end method

.method public final hashCode()I
    .registers 1

    iget p0, p0, Lwxj;->b:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
