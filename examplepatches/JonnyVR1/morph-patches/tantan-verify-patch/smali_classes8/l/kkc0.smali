.class public Ll/kkc0;
.super Ll/ogk;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/b6x;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/b6x;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/fqf;

    .line 10
    .line 11
    const/high16 v2, -0x40800000    # -1.0f

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ll/fqf;-><init>(F)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/uq1;

    .line 17
    .line 18
    invoke-direct {v2}, Ll/uq1;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v3, Ll/gyk;

    .line 22
    .line 23
    invoke-direct {v3}, Ll/gyk;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance v4, Ll/llj;

    .line 27
    .line 28
    const v5, 0x411b3333    # 9.7f

    .line 29
    .line 30
    .line 31
    invoke-direct {v4, v5}, Ll/llj;-><init>(F)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, v4}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v4, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 44
    .line 45
    .line 46
    const/4 v5, 0x0

    .line 47
    invoke-virtual {v3, v2, v5}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 48
    .line 49
    .line 50
    const/4 v5, 0x1

    .line 51
    invoke-virtual {v3, v4, v5}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v4}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, v3}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v2}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method
