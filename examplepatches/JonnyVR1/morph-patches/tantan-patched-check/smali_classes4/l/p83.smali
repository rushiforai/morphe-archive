.class public final Ll/p83;
.super Ll/n4;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0019\u0010\u0007\u001a\u00020\u00062\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0019\u0010\t\u001a\u00020\u00062\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nR\u0016\u0010\r\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\u000e"
    }
    d2 = {
        "Ll/p83;",
        "Ll/n4;",
        "<init>",
        "()V",
        "Ll/p8l$a;",
        "params",
        "",
        "e",
        "(Ll/p8l$a;)Z",
        "d",
        "(Ll/p8l$a;)Ljava/lang/Boolean;",
        "a",
        "Z",
        "first",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/n4;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/p83;->a:Z

    .line 6
    .line 7
    return-void
.end method

.method public static c(Ll/p8l$a;)V
    .locals 9

    .line 1
    invoke-static {}, Ll/a5i0;->W()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    sget-object v1, Ll/ma3;->Companion:Ll/ma3$a;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/16 v7, 0x1c

    .line 14
    .line 15
    const/4 v8, 0x0

    .line 16
    const/4 v3, 0x1

    .line 17
    const/4 v4, 0x0

    .line 18
    const/4 v5, 0x0

    .line 19
    const/4 v6, 0x0

    .line 20
    invoke-static/range {v1 .. v8}, Ll/ma3$a;->e(Ll/ma3$a;Lcom/p1/mobile/android/app/Act;ZLl/x20;ZLcom/p1/mobile/putong/core/data/Privilege;ILjava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    new-instance v0, Ll/fe5$e;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-direct {v0, p0}, Ll/fe5$e;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 31
    .line 32
    .line 33
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INTL_TTT_COIN:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ll/fe5$e;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/fe5$e;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v0, "p_wallet,vas"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ll/fe5$e;->d(Ljava/lang/String;)Ll/fe5$e;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const/4 v0, 0x1

    .line 46
    invoke-virtual {p0, v0}, Ll/fe5$e;->c(I)Ll/fe5$e;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Ll/fe5$e;->l()Ll/fe5;

    .line 51
    .line 52
    .line 53
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p83;->d(Ll/p8l$a;)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p83;->e(Ll/p8l$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(Ll/p8l$a;)Ljava/lang/Boolean;
    .locals 1
    .param p1    # Ll/p8l$a;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/o83;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/o83;-><init>(Ll/p8l$a;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/u73;->y(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 16
    .line 17
    return-object p0
.end method

.method public e(Ll/p8l$a;)Z
    .locals 3
    .param p1    # Ll/p8l$a;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-boolean p1, p0, Ll/p83;->a:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p1, :cond_2

    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 9
    .line 10
    iget-boolean v1, v1, Ll/m27;->o0:Z

    .line 11
    .line 12
    if-eqz v1, :cond_2

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isUltraPremium()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iput-boolean v0, p0, Ll/p83;->a:Z

    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/lqb;->m4()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/m27;->F3()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_2

    .line 48
    .line 49
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/uih0;->S0()J

    .line 54
    .line 55
    .line 56
    move-result-wide p0

    .line 57
    const-wide/16 v1, 0x0

    .line 58
    .line 59
    cmp-long p0, p0, v1

    .line 60
    .line 61
    if-nez p0, :cond_1

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-nez p0, :cond_1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    const/4 p0, 0x1

    .line 71
    return p0

    .line 72
    :cond_2
    :goto_0
    return v0
.end method
