.class public Lcom/idv/identity/platform/api/IdentityPlatformExt;
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

.method public static initNetworkProxy(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/t33;->c()Ll/t33;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/t33;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/t33;->c()Ll/t33;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/qk20;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/qk20;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/t33;->e(Ll/asl;)Ll/t33;

    .line 21
    .line 22
    .line 23
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/t33;->c()Ll/t33;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1, p0, v0}, Ll/t33;->b(Landroid/content/Context;Ljava/util/Map;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
