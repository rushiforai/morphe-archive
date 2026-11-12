.class public final Lf6k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzch;

.field public final b:Lmv8;

.field public final c:I


# direct methods
.method public constructor <init>(Lzch;Lmv8;I)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf6k;->a:Lzch;

    iput-object p2, p0, Lf6k;->b:Lmv8;

    iput p3, p0, Lf6k;->c:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_24

    instance-of v0, p1, Lf6k;

    if-eqz v0, :cond_22

    check-cast p1, Lf6k;

    iget-object v0, p0, Lf6k;->a:Lzch;

    iget-object v1, p1, Lf6k;->a:Lzch;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object v0, p0, Lf6k;->b:Lmv8;

    iget-object v1, p1, Lf6k;->b:Lmv8;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget p0, p0, Lf6k;->c:I

    iget p1, p1, Lf6k;->c:I

    if-eq p0, p1, :cond_24

    :cond_22
    const/4 p0, 0x0

    return p0

    :cond_24
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lf6k;->a:Lzch;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lf6k;->b:Lmv8;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget p0, p0, Lf6k;->c:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
