.class public Ll/qh0;
.super Ll/ogk;
.source "SourceFile"


# instance fields
.field private a:Ll/h6j;

.field private b:Ll/h6j;

.field private c:Ll/ph0;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/h6j;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/h6j;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/qh0;->a:Ll/h6j;

    .line 10
    .line 11
    new-instance v0, Ll/h6j;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/h6j;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/qh0;->b:Ll/h6j;

    .line 17
    .line 18
    new-instance v0, Ll/ph0;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/ph0;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/qh0;->c:Ll/ph0;

    .line 24
    .line 25
    iget-object v1, p0, Ll/qh0;->a:Ll/h6j;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/qh0;->b:Ll/h6j;

    .line 31
    .line 32
    iget-object v1, p0, Ll/qh0;->c:Ll/ph0;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/qh0;->c:Ll/ph0;

    .line 38
    .line 39
    iget-object v1, p0, Ll/qh0;->a:Ll/h6j;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v0, v1, v2}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/qh0;->c:Ll/ph0;

    .line 46
    .line 47
    iget-object v1, p0, Ll/qh0;->b:Ll/h6j;

    .line 48
    .line 49
    const/4 v2, 0x1

    .line 50
    invoke-virtual {v0, v1, v2}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/qh0;->c:Ll/ph0;

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/qh0;->a:Ll/h6j;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/qh0;->b:Ll/h6j;

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/qh0;->c:Ll/ph0;

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Ll/qh0;->c:Ll/ph0;

    .line 74
    .line 75
    invoke-virtual {p0, v2}, Ll/ph0;->Q1(Z)V

    .line 76
    .line 77
    .line 78
    return-void
.end method
