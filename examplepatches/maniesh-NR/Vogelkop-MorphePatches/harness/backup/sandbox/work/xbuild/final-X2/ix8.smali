.class public final Lix8;
.super Lsjm;
.source "SourceFile"


# instance fields
.field public final c:Z


# direct methods
.method public constructor <init>(ZZ)V
    .registers 3

    invoke-direct {p0, p2}, Lsjm;-><init>(Z)V

    iput-boolean p1, p0, Lix8;->c:Z

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    iget-boolean v0, p0, Lix8;->c:Z

    if-eqz v0, :cond_a

    iget-boolean p0, p0, Lsjm;->a:Z

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    invoke-super {p0, p1}, Lsjm;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    check-cast p1, Lix8;

    iget-boolean p0, p0, Lix8;->c:Z

    iget-boolean p1, p1, Lix8;->c:Z

    if-ne p0, p1, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 2

    invoke-super {p0}, Lsjm;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-boolean p0, p0, Lix8;->c:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
