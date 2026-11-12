.class public abstract Ld5m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lc5m;


# direct methods
.method public constructor <init>(Lc5m;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld5m;->a:Lc5m;

    return-void
.end method


# virtual methods
.method public a()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public b()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_33

    if-eqz p1, :cond_35

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_35

    check-cast p1, Ld5m;

    iget-object v0, p1, Ld5m;->a:Lc5m;

    iget-object v1, p0, Ld5m;->a:Lc5m;

    if-ne v1, v0, :cond_35

    sget-object v0, Lc5m;->a:Lc5m;

    if-ne v1, v0, :cond_25

    check-cast p0, La5m;

    check-cast p1, La5m;

    iget-byte p1, p1, La5m;->b:B

    iget-byte p0, p0, La5m;->b:B

    if-ne p0, p1, :cond_35

    goto :goto_33

    :cond_25
    sget-object v0, Lc5m;->b:Lc5m;

    if-ne v1, v0, :cond_35

    check-cast p0, Lb5m;

    check-cast p1, Lb5m;

    iget-byte p1, p1, Lb5m;->b:B

    iget-byte p0, p0, Lb5m;->b:B

    if-ne p0, p1, :cond_35

    :cond_33
    :goto_33
    const/4 p0, 0x1

    return p0

    :cond_35
    const/4 p0, 0x0

    return p0
.end method

.method public hashCode()I
    .registers 1

    iget-object p0, p0, Ld5m;->a:Lc5m;

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
