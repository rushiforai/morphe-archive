.class public Ll/w14;
.super Ll/riv;
.source "SourceFile"


# instance fields
.field public final d:Ll/z34;

.field public e:Ll/zed0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/x6t;Ll/dum;Ll/g0m;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/riv;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/x6t;Ll/dum;)V

    .line 2
    .line 3
    .line 4
    check-cast p4, Ll/z34;

    .line 5
    .line 6
    iput-object p4, p0, Ll/w14;->d:Ll/z34;

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
    new-instance v0, Ll/zed0;

    .line 5
    .line 6
    iget-object v1, p0, Ll/riv;->c:Ll/dum;

    .line 7
    .line 8
    iget-object v2, p0, Ll/w14;->d:Ll/z34;

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Ll/zed0;-><init>(Ll/dum;Ll/z34;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/riv;->d(Ll/l6t;)Ll/l6t;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/zed0;

    .line 18
    .line 19
    iput-object v0, p0, Ll/w14;->e:Ll/zed0;

    .line 20
    .line 21
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/riv;->f()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/w14;->e:Ll/zed0;

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
    iput-object v0, p0, Ll/w14;->e:Ll/zed0;

    .line 13
    .line 14
    :cond_0
    return-void
.end method
