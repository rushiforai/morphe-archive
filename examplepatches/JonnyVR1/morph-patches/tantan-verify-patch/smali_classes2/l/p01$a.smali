.class public Ll/p01$a;
.super Ll/yww;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/p01;->g()Ll/yww;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/yww<",
        "TE;TE;>;"
    }
.end annotation


# instance fields
.field public final synthetic d:Ll/p01;


# direct methods
.method public constructor <init>(Ll/p01;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p01$a;->d:Ll/p01;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/yww;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p01$a;->d:Ll/p01;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p01;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(II)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p01$a;->d:Ll/p01;

    .line 2
    .line 3
    iget-object p0, p0, Ll/p01;->b:[Ljava/lang/Object;

    .line 4
    .line 5
    aget-object p0, p0, p1

    .line 6
    .line 7
    return-object p0
.end method

.method public c()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TE;TE;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string v0, "not a map"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p01$a;->d:Ll/p01;

    .line 2
    .line 3
    iget p0, p0, Ll/p01;->c:I

    .line 4
    .line 5
    return p0
.end method

.method public e(Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p01$a;->d:Ll/p01;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p01;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f(Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p01$a;->d:Ll/p01;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p01;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;TE;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p01$a;->d:Ll/p01;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p01;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p01$a;->d:Ll/p01;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p01;->j(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)TE;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string p1, "not a map"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method
