.class public final Lgs;
.super Ljs;
.source "SourceFile"


# instance fields
.field public final c:Lrxh;


# direct methods
.method public constructor <init>(Lrxh;)V
    .registers 4

    sget-object v0, Lgt;->f:Lgt;

    sget-object v1, Lds;->f:Lds;

    invoke-direct {p0, v0, v1}, Ljs;-><init>(Lgt;Lds;)V

    iput-object p1, p0, Lgs;->c:Lrxh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    if-eq p0, p1, :cond_14

    instance-of v0, p1, Lgs;

    if-eqz v0, :cond_12

    check-cast p1, Lgs;

    iget-object p0, p0, Lgs;->c:Lrxh;

    iget-object p1, p1, Lgs;->c:Lrxh;

    invoke-virtual {p0, p1}, Lrxh;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    :cond_12
    const/4 p0, 0x0

    return p0

    :cond_14
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lgs;->c:Lrxh;

    iget p0, p0, Lrxh;->a:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
