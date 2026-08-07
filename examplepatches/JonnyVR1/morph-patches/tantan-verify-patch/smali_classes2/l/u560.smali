.class public final Ll/u560;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kzq;


# instance fields
.field private final b:Ll/l01;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/l01<",
            "Ll/q560<",
            "*>;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jy3;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/jy3;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/u560;->b:Ll/l01;

    .line 10
    .line 11
    return-void
.end method

.method private static f(Ll/q560;Ljava/lang/Object;Ljava/security/MessageDigest;)V
    .locals 0
    .param p0    # Ll/q560;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/security/MessageDigest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/q560<",
            "TT;>;",
            "Ljava/lang/Object;",
            "Ljava/security/MessageDigest;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q560;->g(Ljava/lang/Object;Ljava/security/MessageDigest;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/security/MessageDigest;)V
    .locals 3
    .param p1    # Ljava/security/MessageDigest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/u560;->b:Ll/l01;

    .line 3
    .line 4
    invoke-virtual {v1}, Ll/oof0;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Ll/u560;->b:Ll/l01;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ll/oof0;->i(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ll/q560;

    .line 17
    .line 18
    iget-object v2, p0, Ll/u560;->b:Ll/l01;

    .line 19
    .line 20
    invoke-virtual {v2, v0}, Ll/oof0;->m(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {v1, v2, p1}, Ll/u560;->f(Ll/q560;Ljava/lang/Object;Ljava/security/MessageDigest;)V

    .line 25
    .line 26
    .line 27
    add-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method

.method public c(Ll/q560;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ll/q560;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/q560<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/u560;->b:Ll/l01;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/oof0;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/u560;->b:Ll/l01;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {p1}, Ll/q560;->c()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public d(Ll/u560;)V
    .locals 0
    .param p1    # Ll/u560;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/u560;->b:Ll/l01;

    .line 2
    .line 3
    iget-object p1, p1, Ll/u560;->b:Ll/l01;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/oof0;->j(Ll/oof0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e(Ll/q560;Ljava/lang/Object;)Ll/u560;
    .locals 1
    .param p1    # Ll/q560;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/q560<",
            "TT;>;TT;)",
            "Ll/u560;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/u560;->b:Ll/l01;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Ll/u560;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/u560;

    .line 6
    .line 7
    iget-object p0, p0, Ll/u560;->b:Ll/l01;

    .line 8
    .line 9
    iget-object p1, p1, Ll/u560;->b:Ll/l01;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/oof0;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u560;->b:Ll/l01;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/oof0;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Options{values="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/u560;->b:Ll/l01;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const/16 p0, 0x7d

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
