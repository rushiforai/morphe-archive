.class public final Lc02;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:La02;

.field public final b:Lb02;


# direct methods
.method public constructor <init>(La02;Lb02;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc02;->a:La02;

    iput-object p2, p0, Lc02;->b:Lb02;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_16

    instance-of v0, p1, Lc02;

    if-eqz v0, :cond_14

    check-cast p1, Lc02;

    iget-object v0, p0, Lc02;->a:La02;

    iget-object v1, p1, Lc02;->a:La02;

    if-ne v0, v1, :cond_14

    iget-object p0, p0, Lc02;->b:Lb02;

    iget-object p1, p1, Lc02;->b:Lb02;

    if-eq p0, p1, :cond_16

    :cond_14
    const/4 p0, 0x0

    return p0

    :cond_16
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lc02;->a:La02;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lc02;->b:Lb02;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
