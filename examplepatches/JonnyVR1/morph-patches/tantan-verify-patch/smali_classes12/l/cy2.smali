.class public final Ll/cy2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/by2;

.field public b:Ll/d13;


# direct methods
.method public constructor <init>(Ll/by2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Ll/cy2;->a:Ll/by2;

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "Binarizer must be non-null."

    .line 10
    .line 11
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    throw p0
.end method


# virtual methods
.method public a()Ll/d13;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cy2;->b:Ll/d13;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/cy2;->a:Ll/by2;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/by2;->b()Ll/d13;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/cy2;->b:Ll/d13;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ll/cy2;->b:Ll/d13;

    .line 14
    .line 15
    return-object p0
.end method

.method public b(ILl/b13;)Ll/b13;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cy2;->a:Ll/by2;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/by2;->c(ILl/b13;)Ll/b13;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cy2;->a:Ll/by2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/by2;->d()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cy2;->a:Ll/by2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/by2;->f()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cy2;->a:Ll/by2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/by2;->e()Ll/uhw;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/uhw;->e()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public f()Ll/cy2;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cy2;->a:Ll/by2;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/by2;->e()Ll/uhw;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/uhw;->f()Ll/uhw;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/cy2;

    .line 12
    .line 13
    iget-object p0, p0, Ll/cy2;->a:Ll/by2;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/by2;->a(Ll/uhw;)Ll/by2;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-direct {v1, p0}, Ll/cy2;-><init>(Ll/by2;)V

    .line 20
    .line 21
    .line 22
    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ll/cy2;->a()Ll/d13;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/d13;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-object p0

    .line 10
    :catch_0
    const-string p0, ""

    .line 11
    .line 12
    return-object p0
.end method
