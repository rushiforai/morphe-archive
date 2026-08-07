.class public Ll/jl10;
.super Ll/td10;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/td10<",
        "Ll/mu40;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Ll/dj10;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/mu40;",
            ">;",
            "Ll/dj10;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/td10;-><init>(Ll/dum;Ll/dj10;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wl10;

    .line 5
    .line 6
    invoke-virtual {p2}, Ll/dj10;->d()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-direct {v0, p1, p0, v1}, Ll/wl10;-><init>(Ll/dum;Ll/td10;I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/en10;

    .line 18
    .line 19
    iput-object v0, p0, Ll/td10;->l:Ll/en10;

    .line 20
    .line 21
    new-instance v0, Ll/xh10;

    .line 22
    .line 23
    iget-object p2, p2, Ll/dj10;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 24
    .line 25
    invoke-direct {v0, p1, p2, p0}, Ll/xh10;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Ll/td10;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 29
    .line 30
    .line 31
    new-instance p2, Ll/de10;

    .line 32
    .line 33
    invoke-direct {p2, p1}, Ll/de10;-><init>(Ll/dum;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 37
    .line 38
    .line 39
    new-instance p2, Ll/qo10;

    .line 40
    .line 41
    invoke-direct {p2, p1}, Ll/qo10;-><init>(Ll/dum;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 45
    .line 46
    .line 47
    new-instance p2, Ll/dc10;

    .line 48
    .line 49
    invoke-direct {p2, p1}, Ll/dc10;-><init>(Ll/dum;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 53
    .line 54
    .line 55
    new-instance p2, Ll/il10;

    .line 56
    .line 57
    invoke-direct {p2, p1}, Ll/il10;-><init>(Ll/dum;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 61
    .line 62
    .line 63
    return-void
.end method
