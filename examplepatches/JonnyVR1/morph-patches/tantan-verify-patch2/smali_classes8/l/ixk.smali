.class public Ll/ixk;
.super Ll/ogk;
.source "SourceFile"


# instance fields
.field a:Ll/y43;

.field b:Ll/y43;

.field c:I

.field d:I


# direct methods
.method public constructor <init>(II)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Ll/gfj;->setFloatTexture(Z)V

    .line 6
    .line 7
    .line 8
    iput p2, p0, Ll/ixk;->d:I

    .line 9
    .line 10
    iput p1, p0, Ll/ixk;->c:I

    .line 11
    .line 12
    new-instance p1, Ll/y43;

    .line 13
    .line 14
    invoke-direct {p1}, Ll/y43;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/ixk;->a:Ll/y43;

    .line 18
    .line 19
    new-instance p1, Ll/y43;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/y43;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/ixk;->b:Ll/y43;

    .line 25
    .line 26
    iget-object p1, p0, Ll/ixk;->a:Ll/y43;

    .line 27
    .line 28
    iget p2, p0, Ll/ixk;->c:I

    .line 29
    .line 30
    int-to-float p2, p2

    .line 31
    const/high16 v0, 0x3f800000    # 1.0f

    .line 32
    .line 33
    div-float p2, v0, p2

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {p1, p2, v1}, Ll/y43;->Q1(FF)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/ixk;->b:Ll/y43;

    .line 40
    .line 41
    iget p2, p0, Ll/ixk;->d:I

    .line 42
    .line 43
    int-to-float p2, p2

    .line 44
    div-float/2addr v0, p2

    .line 45
    invoke-virtual {p1, v1, v0}, Ll/y43;->Q1(FF)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/ixk;->a:Ll/y43;

    .line 49
    .line 50
    iget-object p2, p0, Ll/ixk;->b:Ll/y43;

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/ixk;->b:Ll/y43;

    .line 56
    .line 57
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/ixk;->a:Ll/y43;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/ixk;->b:Ll/y43;

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method
