.class public Ll/bjm;
.super Ll/ogk;
.source "SourceFile"

# interfaces
.implements Ll/gam;


# instance fields
.field private a:Ll/gt2;

.field private b:Ll/jt2;


# direct methods
.method public constructor <init>(Ll/jt2;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Ll/gam;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iput-object p1, p0, Ll/bjm;->b:Ll/jt2;

    .line 9
    .line 10
    :cond_0
    new-instance v0, Ll/qv40;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/qv40;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v1, Ll/gt2;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/gt2;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/bjm;->a:Ll/gt2;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/bjm;->a:Ll/gt2;

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/bjm;->a:Ll/gt2;

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-virtual {v1, v0, v2}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ll/bjm;->a:Ll/gt2;

    .line 37
    .line 38
    const/4 v2, 0x1

    .line 39
    invoke-virtual {v1, p1, v2}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Ll/bjm;->a:Ll/gt2;

    .line 43
    .line 44
    invoke-virtual {v1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/bjm;->a:Ll/gt2;

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public Q1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bjm;->a:Ll/gt2;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/gt2;->setBlendType(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public R1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bjm;->a:Ll/gt2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gt2;->Q1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public S1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bjm;->a:Ll/gt2;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gt2;->R1(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bjm;->b:Ll/jt2;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Ll/gam;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/gam;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Ll/gam;->setTimeStamp(J)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
