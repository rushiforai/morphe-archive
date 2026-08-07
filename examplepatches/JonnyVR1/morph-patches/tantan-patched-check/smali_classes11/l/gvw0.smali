.class public Ll/gvw0;
.super Ll/qvw0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/qvw0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static C(Ll/hpr;)Ll/gvw0;
    .locals 1

    .line 1
    instance-of v0, p0, Ll/gvw0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/gvw0;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance v0, Ll/hvw0;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/hvw0;-><init>(Ll/hpr;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method
