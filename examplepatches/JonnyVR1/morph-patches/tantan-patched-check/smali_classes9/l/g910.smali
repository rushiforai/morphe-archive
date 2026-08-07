.class public Ll/g910;
.super Ll/riv;
.source "SourceFile"


# instance fields
.field public final d:Ll/dj10;

.field public e:Ll/td10;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/td10<",
            "Ll/mu40;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/x6t;Ll/dum;Ll/g0m;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;",
            "Ll/x6t;",
            "Ll/dum<",
            "Ll/mu40;",
            ">;",
            "Ll/g0m;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/riv;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/x6t;Ll/dum;)V

    .line 2
    .line 3
    .line 4
    check-cast p4, Ll/dj10;

    .line 5
    .line 6
    iput-object p4, p0, Ll/g910;->d:Ll/dj10;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public e()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/riv;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/g910;->d:Ll/dj10;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/dj10;->b()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/fn10;->k(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Ll/jl10;

    .line 17
    .line 18
    iget-object v1, p0, Ll/riv;->c:Ll/dum;

    .line 19
    .line 20
    iget-object v2, p0, Ll/g910;->d:Ll/dj10;

    .line 21
    .line 22
    invoke-direct {v0, v1, v2}, Ll/jl10;-><init>(Ll/dum;Ll/dj10;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/riv;->d(Ll/l6t;)Ll/l6t;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ll/td10;

    .line 30
    .line 31
    iput-object v0, p0, Ll/g910;->e:Ll/td10;

    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Ll/g910;->d:Ll/dj10;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/dj10;->b()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Ll/fn10;->c(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    new-instance v0, Ll/i0q;

    .line 47
    .line 48
    iget-object v1, p0, Ll/riv;->c:Ll/dum;

    .line 49
    .line 50
    iget-object v2, p0, Ll/g910;->d:Ll/dj10;

    .line 51
    .line 52
    invoke-direct {v0, v1, v2}, Ll/i0q;-><init>(Ll/dum;Ll/dj10;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ll/riv;->d(Ll/l6t;)Ll/l6t;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Ll/td10;

    .line 60
    .line 61
    iput-object v0, p0, Ll/g910;->e:Ll/td10;

    .line 62
    .line 63
    :cond_1
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/riv;->f()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/g910;->e:Ll/td10;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/riv;->g(Ll/l6t;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/g910;->e:Ll/td10;

    .line 13
    .line 14
    :cond_0
    return-void
.end method
