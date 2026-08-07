.class public Ll/brf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ctl;


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


# virtual methods
.method public a(Ll/hk4;Ll/r6s;)Ll/uxr;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hk4;",
            "Ll/r6s;",
            ")",
            "Ll/uxr<",
            "*>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ll/r6s;->d()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0xb

    .line 6
    .line 7
    if-eq p0, v0, :cond_2

    .line 8
    .line 9
    const/16 v0, 0xbbe

    .line 10
    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    const/16 v0, 0xbbf

    .line 14
    .line 15
    if-eq p0, v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-virtual {p2}, Ll/r6s;->p()Ll/byu;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p1, p0}, Ll/dfs;->O(Ll/hk4;Ll/byu;)Ll/dfs;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_1
    invoke-virtual {p2}, Ll/r6s;->p()Ll/byu;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p1, p0}, Ll/ffs;->O(Ll/hk4;Ll/byu;)Ll/ffs;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_2
    invoke-virtual {p2}, Ll/r6s;->o()Ll/lwu;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p1, p0}, Ll/kwu;->O(Ll/hk4;Ll/a4s;)Ll/kwu;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method
