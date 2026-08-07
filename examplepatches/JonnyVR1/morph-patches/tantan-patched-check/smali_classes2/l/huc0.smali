.class public Ll/huc0;
.super Ll/fb5;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/fb5<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/facebook/common/references/SharedReference;Ll/fb5$c;Ljava/lang/Throwable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/references/SharedReference<",
            "TT;>;",
            "Ll/fb5$c;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .line 11
    invoke-direct {p0, p1, p2, p3}, Ll/fb5;-><init>(Lcom/facebook/common/references/SharedReference;Ll/fb5$c;Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ll/w4d0;Ll/fb5$c;Ljava/lang/Throwable;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll/w4d0<",
            "TT;>;",
            "Ll/fb5$c;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Ll/fb5;-><init>(Ljava/lang/Object;Ll/w4d0;Ll/fb5$c;Ljava/lang/Throwable;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/huc0;->m()Ll/fb5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m()Ll/fb5;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/fb5<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/fb5;->N()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ll/wn80;->i(Z)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/huc0;

    .line 9
    .line 10
    iget-object v1, p0, Ll/fb5;->b:Lcom/facebook/common/references/SharedReference;

    .line 11
    .line 12
    iget-object v2, p0, Ll/fb5;->c:Ll/fb5$c;

    .line 13
    .line 14
    iget-object p0, p0, Ll/fb5;->d:Ljava/lang/Throwable;

    .line 15
    .line 16
    invoke-direct {v0, v1, v2, p0}, Ll/huc0;-><init>(Lcom/facebook/common/references/SharedReference;Ll/fb5$c;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method
