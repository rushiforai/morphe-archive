.class public Ll/t2e0;
.super Ll/o5e0;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/data/SchemeKey;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/SchemeKey;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o5e0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/t2e0;->a:Lcom/p1/mobile/putong/data/SchemeKey;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/abe0;Ll/z20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->yn()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Ll/v5k0;->o(Landroid/content/Context;)Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/t2e0;->a:Lcom/p1/mobile/putong/data/SchemeKey;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v0, v1, p1, p2}, Ll/fss;->q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;Ll/z20;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    :goto_0
    return-void

    .line 33
    :cond_1
    invoke-static {}, Ll/q5k0;->I()Ll/t4k0;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object p0, p0, Ll/t2e0;->a:Lcom/p1/mobile/putong/data/SchemeKey;

    .line 38
    .line 39
    invoke-virtual {v0, p0, p1, p2}, Ll/t4k0;->e(Lcom/p1/mobile/putong/data/SchemeKey;Ll/abe0;Ll/z20;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public c(Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/t2e0;->a:Lcom/p1/mobile/putong/data/SchemeKey;

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Ll/fss;->m(Lcom/p1/mobile/putong/data/SchemeKey;Ll/abe0;Ll/z20;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    invoke-static {}, Ll/q5k0;->I()Ll/t4k0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object p0, p0, Ll/t2e0;->a:Lcom/p1/mobile/putong/data/SchemeKey;

    .line 15
    .line 16
    invoke-virtual {v0, p0, p1, p2}, Ll/t4k0;->f(Lcom/p1/mobile/putong/data/SchemeKey;Ll/abe0;Ll/z20;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
