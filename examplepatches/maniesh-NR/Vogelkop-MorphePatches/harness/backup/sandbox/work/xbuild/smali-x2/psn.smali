.class public final Lpsn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Losn;

.field public final b:Losn;

.field public final c:Losn;


# direct methods
.method public constructor <init>(Losn;Losn;Losn;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpsn;->a:Losn;

    iput-object p2, p0, Lpsn;->b:Losn;

    iput-object p3, p0, Lpsn;->c:Losn;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1c

    instance-of v0, p1, Lpsn;

    if-eqz v0, :cond_1a

    check-cast p1, Lpsn;

    iget-object v0, p0, Lpsn;->a:Losn;

    iget-object v1, p1, Lpsn;->a:Losn;

    if-ne v0, v1, :cond_1a

    iget-object v0, p0, Lpsn;->b:Losn;

    iget-object v1, p1, Lpsn;->b:Losn;

    if-ne v0, v1, :cond_1a

    iget-object p0, p0, Lpsn;->c:Losn;

    iget-object p1, p1, Lpsn;->c:Losn;

    if-eq p0, p1, :cond_1c

    :cond_1a
    const/4 p0, 0x0

    return p0

    :cond_1c
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lpsn;->a:Losn;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lpsn;->b:Losn;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lpsn;->c:Losn;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
