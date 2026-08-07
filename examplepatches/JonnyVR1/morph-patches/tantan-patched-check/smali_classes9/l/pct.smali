.class public Ll/pct;
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
    new-instance v0, Ll/e510;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/e510;-><init>(Ll/dum;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/egt;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ll/egt;-><init>(Ll/dum;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x2

    .line 21
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    new-instance v0, Ll/i1t;

    .line 28
    .line 29
    invoke-direct {v0, p1}, Ll/i1t;-><init>(Ll/dum;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    new-instance v0, Ll/b2t;

    .line 37
    .line 38
    invoke-direct {v0, p1}, Ll/b2t;-><init>(Ll/dum;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 42
    .line 43
    .line 44
    return-void
.end method
