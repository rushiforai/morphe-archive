.class public Ll/xid0;
.super Ll/ph80;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ph80;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jyi;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/jyi;-><init>(Ll/dum;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/z54;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ll/z54;-><init>(Ll/dum;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/egt;

    .line 21
    .line 22
    invoke-direct {v0, p1}, Ll/egt;-><init>(Ll/dum;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x2

    .line 29
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    new-instance v0, Ll/i1t;

    .line 36
    .line 37
    invoke-direct {v0, p1}, Ll/i1t;-><init>(Ll/dum;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method
