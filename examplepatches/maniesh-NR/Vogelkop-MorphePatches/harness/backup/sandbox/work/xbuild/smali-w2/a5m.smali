.class public final La5m;
.super Ld5m;
.source "SourceFile"


# instance fields
.field public final b:B


# direct methods
.method public constructor <init>(I)V
    .registers 3

    sget-object v0, Lc5m;->a:Lc5m;

    invoke-direct {p0, v0}, Ld5m;-><init>(Lc5m;)V

    iput-byte p1, p0, La5m;->b:B

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    if-eqz p1, :cond_1c

    const-class v0, La5m;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_1c

    invoke-super {p0, p1}, Ld5m;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    check-cast p1, La5m;

    iget-byte p0, p0, La5m;->b:B

    iget-byte p1, p1, La5m;->b:B

    if-ne p0, p1, :cond_1c

    :cond_1a
    const/4 p0, 0x1

    return p0

    :cond_1c
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 2

    invoke-super {p0}, Ld5m;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-byte p0, p0, La5m;->b:B

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
