.class public Ll/h1g0;
.super Lcom/sunshine/engine/base/s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sunshine/engine/base/s<",
        "Ll/g1g0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/sunshine/engine/base/s;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic h(Lcom/sunshine/engine/base/s;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/sunshine/engine/base/a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/h1g0;->s(Lcom/sunshine/engine/base/s;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/g1g0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public s(Lcom/sunshine/engine/base/s;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/g1g0;
    .locals 0

    .line 1
    new-instance p1, Ll/g1g0;

    .line 2
    .line 3
    invoke-direct {p1, p0, p2, p3, p4}, Ll/g1g0;-><init>(Lcom/sunshine/engine/base/s;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/xo0;->d(Lcom/sunshine/engine/base/a;)V

    .line 7
    .line 8
    .line 9
    return-object p1
.end method

.method public t(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/g1g0;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/g1g0;->l(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public u(FFI)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    invoke-static {p1, v0, v1}, Ll/a2j0;->c(FFF)F

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-static {p2, v0, v1}, Ll/a2j0;->c(FFF)F

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    iget-object p0, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 17
    .line 18
    check-cast p0, Ll/g1g0;

    .line 19
    .line 20
    invoke-virtual {p0, p1, p2, p3}, Ll/g1g0;->i(FFI)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
