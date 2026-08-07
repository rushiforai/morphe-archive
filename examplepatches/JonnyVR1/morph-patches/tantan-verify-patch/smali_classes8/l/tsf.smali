.class public Ll/tsf;
.super Ll/zr2;
.source "SourceFile"


# instance fields
.field private final c:Ll/atf;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/zr2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ssf;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ssf;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/atf;

    .line 10
    .line 11
    const/high16 v2, 0x3f800000    # 1.0f

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ll/atf;-><init>(F)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/tsf;->c:Ll/atf;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v1}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/lt2;->registerEffectInnerFilter(Ll/rsl;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v1}, Ll/lt2;->registerEffectInnerFilter(Ll/rsl;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v1}, Ll/lt2;->registerInitialFilter(Ll/jt2;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/lt2;->registerTerminalFilter(Ll/jt2;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public setTimeStamp(J)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2}, Ll/zr2;->setTimeStamp(J)V

    .line 2
    .line 3
    .line 4
    long-to-float p1, p1

    .line 5
    const p2, 0x3f333333    # 0.7f

    .line 6
    .line 7
    .line 8
    rem-float/2addr p1, p2

    .line 9
    float-to-double v0, p1

    .line 10
    const-wide v2, 0x3fc999999999999aL    # 0.2

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    cmpg-double p2, v0, v2

    .line 16
    .line 17
    iget-object p0, p0, Ll/tsf;->c:Ll/atf;

    .line 18
    .line 19
    if-gez p2, :cond_0

    .line 20
    .line 21
    const/high16 p2, 0x42480000    # 50.0f

    .line 22
    .line 23
    mul-float/2addr p1, p2

    .line 24
    invoke-virtual {p0, p1}, Ll/atf;->S1(F)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1}, Ll/atf;->S1(F)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
