.class public Ll/l01$a;
.super Ll/yww;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/l01;->n()Ll/yww;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/yww<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field public final synthetic d:Ll/l01;


# direct methods
.method public constructor <init>(Ll/l01;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l01$a;->d:Ll/l01;

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
    iget-object p0, p0, Ll/l01$a;->d:Ll/l01;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/oof0;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(II)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l01$a;->d:Ll/l01;

    .line 2
    .line 3
    iget-object p0, p0, Ll/oof0;->b:[Ljava/lang/Object;

    .line 4
    .line 5
    shl-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    add-int/2addr p1, p2

    .line 8
    aget-object p0, p0, p1

    .line 9
    .line 10
    return-object p0
.end method

.method public c()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l01$a;->d:Ll/l01;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l01$a;->d:Ll/l01;

    .line 2
    .line 3
    iget p0, p0, Ll/oof0;->c:I

    .line 4
    .line 5
    return p0
.end method

.method public e(Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l01$a;->d:Ll/l01;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oof0;->f(Ljava/lang/Object;)I

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
    iget-object p0, p0, Ll/l01$a;->d:Ll/l01;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oof0;->h(Ljava/lang/Object;)I

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
            "(TK;TV;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l01$a;->d:Ll/l01;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l01$a;->d:Ll/l01;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oof0;->k(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)TV;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l01$a;->d:Ll/l01;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/oof0;->l(ILjava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
