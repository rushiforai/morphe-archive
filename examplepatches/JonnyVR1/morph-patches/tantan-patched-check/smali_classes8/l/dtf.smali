.class public Ll/dtf;
.super Ll/zr2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/zr2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xsf;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/xsf;-><init>()V

    .line 7
    .line 8
    .line 9
    const v1, -0x18cfa2

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/xsf;->R1(I)V

    .line 13
    .line 14
    .line 15
    const v1, -0xd1cfa0

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/xsf;->Q1(I)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Ll/etf;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/etf;-><init>()V

    .line 24
    .line 25
    .line 26
    const v2, 0x3f4ccccd    # 0.8f

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ll/etf;->Q1(F)V

    .line 30
    .line 31
    .line 32
    new-instance v2, Ll/qsf;

    .line 33
    .line 34
    invoke-direct {v2}, Ll/qsf;-><init>()V

    .line 35
    .line 36
    .line 37
    const v3, 0x3fa66666    # 1.3f

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v3}, Ll/qsf;->S1(F)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ll/qsf;->Q1(F)V

    .line 44
    .line 45
    .line 46
    const/high16 v3, 0x3f800000    # 1.0f

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Ll/qsf;->R1(F)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/lt2;->registerEffectInnerFilter(Ll/rsl;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v1}, Ll/lt2;->registerEffectInnerFilter(Ll/rsl;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, v2}, Ll/lt2;->registerEffectInnerFilter(Ll/rsl;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v1}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v2}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, v0}, Ll/lt2;->registerInitialFilter(Ll/jt2;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, v2}, Ll/lt2;->registerTerminalFilter(Ll/jt2;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method
