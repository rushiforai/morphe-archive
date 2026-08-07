.class public Ll/re90;
.super Ll/u4;
.source "SourceFile"

# interfaces
.implements Ll/lke0$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/u4<",
        "Ll/bkj0<",
        "Lcom/p1/mobile/putong/data/User;",
        "Lcom/p1/mobile/putong/core/api/CoreLikers$a;",
        "Ljava/lang/Integer;",
        ">;>;",
        "Ll/lke0$a;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/u4;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c()I
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method public d()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u4;->b:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/u4;->b:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Ll/bkj0;

    .line 12
    .line 13
    iget-object v0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/u4;->b:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast p0, Ll/bkj0;

    .line 24
    .line 25
    iget-object p0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 28
    .line 29
    iget p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 30
    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public i()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u4;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ll/bkj0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 8
    .line 9
    invoke-static {p0}, Ll/bhe0;->b(Lcom/p1/mobile/putong/core/api/CoreLikers$a;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public l()Ljava/lang/Integer;
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->Nr:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public m()Ljava/lang/CharSequence;
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/lke0$a;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/u4;->j()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Wh:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/u4;->j()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Xh:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public n()Ljava/lang/CharSequence;
    .locals 3

    .line 1
    invoke-interface {p0}, Ll/lke0$a;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/u4;->j()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {p0}, Ll/lke0$a;->b()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Vh:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Uh:I

    .line 21
    .line 22
    :goto_0
    invoke-interface {p0}, Ll/lke0$a;->b()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/re90;->c()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    invoke-virtual {p0}, Ll/re90;->d()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    :goto_1
    invoke-static {p0}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_2
    invoke-virtual {p0}, Ll/u4;->j()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Yh:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method
