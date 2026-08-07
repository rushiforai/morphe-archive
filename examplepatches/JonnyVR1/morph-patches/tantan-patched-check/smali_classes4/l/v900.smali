.class public Ll/v900;
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

.method public static a(I)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/vml;->c()Ll/vml;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, v0}, Ll/vml;->i(Z)V

    .line 10
    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    const/4 v2, 0x4

    .line 14
    if-ne p0, v2, :cond_1

    .line 15
    .line 16
    invoke-static {}, Ll/vml;->c()Ll/vml;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, v1}, Ll/vml;->i(Z)V

    .line 21
    .line 22
    .line 23
    return v0

    .line 24
    :cond_1
    return v1
.end method
