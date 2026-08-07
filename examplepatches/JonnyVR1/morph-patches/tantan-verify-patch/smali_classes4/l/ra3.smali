.class public Ll/ra3;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(IZ)Ll/qa3;
    .locals 0

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    if-eq p0, p1, :cond_1

    .line 5
    .line 6
    const/4 p1, 0x2

    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    new-instance p0, Ll/udh0;

    .line 10
    .line 11
    invoke-direct {p0}, Ll/udh0;-><init>()V

    .line 12
    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const-string p0, "\u5f02\u5e38\u7684BoostStyle\u7c7b\u578b\uff01"

    .line 16
    .line 17
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0

    .line 22
    :cond_1
    invoke-static {}, Ll/ra3;->b()Ll/qa3;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_2
    new-instance p0, Ll/wm3;

    .line 28
    .line 29
    invoke-direct {p0, p1}, Ll/wm3;-><init>(Z)V

    .line 30
    .line 31
    .line 32
    return-object p0
.end method

.method public static b()Ll/qa3;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->b9()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/ra3;->c()Ll/qa3;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0

    .line 20
    :cond_0
    new-instance v0, Ll/n2j0;

    .line 21
    .line 22
    invoke-direct {v0}, Ll/n2j0;-><init>()V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public static c()Ll/qa3;
    .locals 1

    .line 1
    new-instance v0, Ll/udh0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/udh0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
