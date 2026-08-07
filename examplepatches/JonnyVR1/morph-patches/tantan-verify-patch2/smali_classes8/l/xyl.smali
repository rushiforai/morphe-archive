.class public interface abstract Ll/xyl;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public P3(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public Q1()Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-static {p0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e1()V
    .locals 0

    .line 1
    return-void
.end method

.method public f2(ILjava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public g1(Ljava/lang/CharSequence;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public getSelfActions()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public i0(IZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, p1, p2, v0, v0}, Ll/xyl;->n0(IZZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public n0(IZZZ)V
    .locals 0

    .line 1
    return-void
.end method
