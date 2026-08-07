.class public Ll/mtf;
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
    new-instance v0, Ll/rtf;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/rtf;-><init>()V

    .line 7
    .line 8
    .line 9
    const/high16 v1, 0x40000000    # 2.0f

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/rtf;->Q1(F)V

    .line 12
    .line 13
    .line 14
    const v1, 0x3d23d70a    # 0.04f

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/rtf;->R1(F)V

    .line 18
    .line 19
    .line 20
    const v1, 0x3dcccccd    # 0.1f

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/rtf;->S1(F)V

    .line 24
    .line 25
    .line 26
    new-instance v1, Ll/etf;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/etf;-><init>()V

    .line 29
    .line 30
    .line 31
    const v2, 0x3d4ccccd    # 0.05f

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ll/etf;->Q1(F)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/rsf;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/rsf;-><init>()V

    .line 43
    .line 44
    .line 45
    const v3, 0x3ecccccd    # 0.4f

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v3}, Ll/rsf;->R1(F)V

    .line 49
    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    invoke-virtual {v2, v3}, Ll/rsf;->Q1(F)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v1}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v2}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ll/lt2;->registerEffectInnerFilter(Ll/rsl;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v1}, Ll/lt2;->registerEffectInnerFilter(Ll/rsl;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v2}, Ll/lt2;->registerEffectInnerFilter(Ll/rsl;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, v0}, Ll/lt2;->registerInitialFilter(Ll/jt2;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v2}, Ll/lt2;->registerTerminalFilter(Ll/jt2;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method
