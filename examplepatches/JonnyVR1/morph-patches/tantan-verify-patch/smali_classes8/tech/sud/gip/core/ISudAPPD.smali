.class public Ltech/sud/gip/core/ISudAPPD;
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

.method public static d()V
    .locals 2

    .line 1
    sget v0, Ll/utg0;->f:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    sput-boolean v1, Ll/nkg0;->a:Z

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static e(I)V
    .locals 1

    .line 1
    sget v0, Ll/utg0;->f:I

    .line 2
    .line 3
    if-eq v0, p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/utg0;->b:Ll/uyg0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/uyg0;->f()V

    .line 10
    .line 11
    .line 12
    :cond_0
    sput p0, Ll/utg0;->f:I

    .line 13
    .line 14
    sget-object p0, Ll/utg0;->b:Ll/uyg0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/uyg0;->z()V

    .line 20
    .line 21
    .line 22
    return-void
.end method
